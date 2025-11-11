' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sh4o_690edbc2_findfield_L000004 ' <symbol:findfield>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 if_z jmp #\C_sh4o_690edbc2_findfield_L000004_8 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_sh4o_690edbc2_findfield_L000004_6 ' EQI4
C_sh4o_690edbc2_findfield_L000004_8
 mov r0, #0 ' reg <- coni
 jmp #\@C_sh4o_690edbc2_findfield_L000004_5 ' JUMPV addrg
C_sh4o_690edbc2_findfield_L000004_6
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_sh4o_690edbc2_findfield_L000004_10 ' JUMPV addrg
C_sh4o_690edbc2_findfield_L000004_9
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 if_nz jmp #\C_sh4o_690edbc2_findfield_L000004_12 ' NEI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawequal
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sh4o_690edbc2_findfield_L000004_14 ' EQI4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sh4o_690edbc2_findfield_L000004_5 ' JUMPV addrg
C_sh4o_690edbc2_findfield_L000004_14
 mov r2, r19
 subs r2, #1 ' SUBI4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o_690edbc2_findfield_L000004
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sh4o_690edbc2_findfield_L000004_16 ' EQI4
 mov r2, ##@C_sh4o_690edbc2_findfield_L000004_18_L000019 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_concat
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sh4o_690edbc2_findfield_L000004_5 ' JUMPV addrg
C_sh4o_690edbc2_findfield_L000004_16
C_sh4o_690edbc2_findfield_L000004_12
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_sh4o_690edbc2_findfield_L000004_10
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sh4o_690edbc2_findfield_L000004_9 ' NEI4
 mov r0, #0 ' reg <- coni
C_sh4o_690edbc2_findfield_L000004_5
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o2_690edbc2_pushglobalfuncname_L000020 ' <symbol:pushglobalfuncname>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sh4o2_690edbc2_pushglobalfuncname_L000020_22_L000023 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 mov r2, ##@C_sh4o2_690edbc2_pushglobalfuncname_L000020_24_L000025 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r19
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o_690edbc2_findfield_L000004
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sh4o2_690edbc2_pushglobalfuncname_L000020_26 ' EQI4
 mov r2, ##0 ' reg ARG con
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
 mov r2, #3 ' reg ARG coni
 mov r3, ##@C_sh4o2_690edbc2_pushglobalfuncname_L000020_30_L000031 ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sh4o2_690edbc2_pushglobalfuncname_L000020_28 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #3 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
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
C_sh4o2_690edbc2_pushglobalfuncname_L000020_28
 mov r2, r19
 adds r2, #1 ' ADDI4 coni
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 mov r2, r19
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sh4o2_690edbc2_pushglobalfuncname_L000020_21 ' JUMPV addrg
C_sh4o2_690edbc2_pushglobalfuncname_L000020_26
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_sh4o2_690edbc2_pushglobalfuncname_L000020_21
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sh4o6_690edbc2_pushfuncname_L000032 ' <symbol:pushfuncname>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o2_690edbc2_pushglobalfuncname_L000020
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sh4o6_690edbc2_pushfuncname_L000032_34 ' EQI4
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
 mov r3, ##@C_sh4o6_690edbc2_pushfuncname_L000032_36_L000037 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
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
 jmp #\@C_sh4o6_690edbc2_pushfuncname_L000032_35 ' JUMPV addrg
C_sh4o6_690edbc2_pushfuncname_L000032_34
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sh4o6_690edbc2_pushfuncname_L000032_38 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, ##@C_sh4o6_690edbc2_pushfuncname_L000032_40_L000041 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 jmp #\@C_sh4o6_690edbc2_pushfuncname_L000032_39 ' JUMPV addrg
C_sh4o6_690edbc2_pushfuncname_L000032_38
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #109 wz
 if_nz jmp #\C_sh4o6_690edbc2_pushfuncname_L000032_42 ' NEI4
 mov r2, ##@C_sh4o6_690edbc2_pushfuncname_L000032_44_L000045 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #\@C_sh4o6_690edbc2_pushfuncname_L000032_43 ' JUMPV addrg
C_sh4o6_690edbc2_pushfuncname_L000032_42
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #67 wz
 if_z jmp #\C_sh4o6_690edbc2_pushfuncname_L000032_46 ' EQI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r21
 adds r3, #44 ' ADDP4 coni
 mov r4, ##@C_sh4o6_690edbc2_pushfuncname_L000032_48_L000049 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 jmp #\@C_sh4o6_690edbc2_pushfuncname_L000032_47 ' JUMPV addrg
C_sh4o6_690edbc2_pushfuncname_L000032_46
 mov r2, ##@C_sh4o6_690edbc2_pushfuncname_L000032_50_L000051 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
C_sh4o6_690edbc2_pushfuncname_L000032_47
C_sh4o6_690edbc2_pushfuncname_L000032_43
C_sh4o6_690edbc2_pushfuncname_L000032_39
C_sh4o6_690edbc2_pushfuncname_L000032_35
' C_sh4o6_690edbc2_pushfuncname_L000032_33 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4oc_690edbc2_lastlevel_L000052 ' <symbol:lastlevel>
 calld PA,#NEWF
 sub SP, #108
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #1 ' reg <- coni
 mov r21, #1 ' reg <- coni
 jmp #\@C_sh4oc_690edbc2_lastlevel_L000052_55 ' JUMPV addrg
C_sh4oc_690edbc2_lastlevel_L000052_54
 mov r19, r21 ' CVI, CVU or LOAD
 shl r21, #1 ' LSHI4 coni
C_sh4oc_690edbc2_lastlevel_L000052_55
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sh4oc_690edbc2_lastlevel_L000052_54 ' NEI4
 jmp #\@C_sh4oc_690edbc2_lastlevel_L000052_58 ' JUMPV addrg
C_sh4oc_690edbc2_lastlevel_L000052_57
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov r20, #2 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sh4oc_690edbc2_lastlevel_L000052_60 ' EQI4
 mov r19, r17
 adds r19, #1 ' ADDI4 coni
 jmp #\@C_sh4oc_690edbc2_lastlevel_L000052_61 ' JUMPV addrg
C_sh4oc_690edbc2_lastlevel_L000052_60
 mov r21, r17 ' CVI, CVU or LOAD
C_sh4oc_690edbc2_lastlevel_L000052_61
C_sh4oc_690edbc2_lastlevel_L000052_58
 cmps r19, r21 wcz
 if_b jmp #\C_sh4oc_690edbc2_lastlevel_L000052_57 ' LTI4
 mov r0, r21
 subs r0, #1 ' SUBI4 coni
' C_sh4oc_690edbc2_lastlevel_L000052_53 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #108 ' framesize
 calld PA,#RETF


' Catalina Export luaL_traceback

 alignl ' align long
C_luaL__traceback ' <symbol:luaL_traceback>
 calld PA,#NEWF
 sub SP, #380
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sh4oc_690edbc2_lastlevel_L000052 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' SUBI/P
 subs r22, r17 ' SUBI/P (3)
 cmps r22,  #21 wcz
 if_be jmp #\C_luaL__traceback_64 ' LEI4
 mov r11, #10 ' reg <- coni
 jmp #\@C_luaL__traceback_65 ' JUMPV addrg
C_luaL__traceback_64
 mov r11, ##-1 ' reg <- con
C_luaL__traceback_65
 mov r15, r11 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__traceback_66 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-384) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-376) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-380) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_luaL__traceback_71 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-384) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_luaL__traceback_71
 mov r22, FP
 sub r22, #-(-376) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-376)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-384) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #10 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaL__traceback_66
 mov r2, ##@C_luaL__traceback_72_L000073 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-384) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__traceback_75 ' JUMPV addrg
C_luaL__traceback_74
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 subs r15, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaL__traceback_77 ' NEI4
 mov r22, r13 ' SUBI/P
 subs r22, r17 ' SUBI/P (3)
 subs r22, #11 ' SUBI4 coni
 mov r9, r22
 adds r9, #1 ' ADDI4 coni
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__traceback_79_L000080 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
 adds r17, r9 ' ADDI/P (1)
 jmp #\@C_luaL__traceback_78 ' JUMPV addrg
C_luaL__traceback_77
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, ##@C_luaL__traceback_81_L000082 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C_luaL__traceback_83 ' GTI4
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov r3, ##@C_luaL__traceback_86_L000087 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 jmp #\@C_luaL__traceback_84 ' JUMPV addrg
C_luaL__traceback_83
 mov RI, FP
 sub RI, #-(-88)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, ##@C_luaL__traceback_89_L000090 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
C_luaL__traceback_84
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o6_690edbc2_pushfuncname_L000032
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
 mov r22, FP
 sub r22, #-(-73) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaL__traceback_93 ' EQI4
 mov r2, ##@C_luaL__traceback_96_L000097 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-384) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
C_luaL__traceback_93
C_luaL__traceback_78
C_luaL__traceback_75
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__traceback_74 ' NEI4
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
' C_luaL__traceback_62 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #380 ' framesize
 calld PA,#RETF


' Catalina Export luaL_argerror

 alignl ' align long
C_luaL__argerror ' <symbol:luaL_argerror>
 calld PA,#NEWF
 sub SP, #108
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__argerror_99 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, ##@C_luaL__argerror_101_L000102 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaL__argerror_98 ' JUMPV addrg
C_luaL__argerror_99
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, ##@C_luaL__argerror_103_L000104 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaL__argerror_108_L000109 ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-104)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__argerror_105 ' NEI4
 subs r21, #1 ' SUBI4 coni
 cmps r21,  #0 wz
 if_nz jmp #\C_luaL__argerror_110 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-108)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, ##@C_luaL__argerror_112_L000113 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaL__argerror_98 ' JUMPV addrg
C_luaL__argerror_110
C_luaL__argerror_105
 mov r22, FP
 sub r22, #-(-108) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__argerror_115  ' NEU4
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o2_690edbc2_pushglobalfuncname_L000020
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_luaL__argerror_120 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_luaL__argerror_121 ' JUMPV addrg
C_luaL__argerror_120
 mov r17, ##@C_sh4o6_690edbc2_pushfuncname_L000032_50_L000051 ' reg <- addrg
C_luaL__argerror_121
 mov RI, FP
 sub RI, #-(-108)
 wrlong r17, RI ' ASGNP4 addrli reg
C_luaL__argerror_115
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-108)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, ##@C_luaL__argerror_122_L000123 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaL__error
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaL__argerror_98
 calld PA,#POPM ' restore registers
 add SP, #108 ' framesize
 calld PA,#RETF


' Catalina Export luaL_typeerror

 alignl ' align long
C_luaL__typeerror ' <symbol:luaL_typeerror>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##@C_luaL__typeerror_128_L000129 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #4 wz
 if_nz jmp #\C_luaL__typeerror_126 ' NEI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #\@C_luaL__typeerror_127 ' JUMPV addrg
C_luaL__typeerror_126
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #2 wz
 if_nz jmp #\C_luaL__typeerror_130 ' NEI4
 mov RI, ##@C_luaL__typeerror_132_L000133
 mov BC, FP
 sub BC, #-(-12)
 wrlong RI, BC ' ASGNP4 addrli addrg
 jmp #\@C_luaL__typeerror_131 ' JUMPV addrg
C_luaL__typeerror_130
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
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
C_luaL__typeerror_131
C_luaL__typeerror_127
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, ##@C_luaL__typeerror_134_L000135 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__typeerror_125 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sh4or_690edbc2_tag_error_L000136 ' <symbol:tag_error>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
' C_sh4or_690edbc2_tag_error_L000136_137 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_where

 alignl ' align long
C_luaL__where ' <symbol:luaL_where>
 calld PA,#NEWF
 sub SP, #108
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaL__where_139 ' EQI4
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, ##@C_luaL__where_141_L000142 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_luaL__where_143 ' LEI4
 mov RI, FP
 sub RI, #-(-88)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, ##@C_luaL__where_146_L000147 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 jmp #\@C_luaL__where_138 ' JUMPV addrg
C_luaL__where_143
C_luaL__where_139
 mov r2, ##@C_luaL__where_150_L000151 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
C_luaL__where_138
 calld PA,#POPM ' restore registers
 add SP, #108 ' framesize
 calld PA,#RETF


' Catalina Export luaL_error

 alignl ' align long
C_luaL__error ' <symbol:luaL_error>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__where
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvfstring
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_concat
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_error ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__error_152 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaL_fileresult

 alignl ' align long
C_luaL__fileresult ' <symbol:luaL_fileresult>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##@C_errno
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r21,  #0 wz
 if_z jmp #\C_luaL__fileresult_155 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaL__fileresult_154 ' JUMPV addrg
C_luaL__fileresult_155
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__fileresult_157 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strerror ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, ##@C_luaL__fileresult_159_L000160 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 jmp #\@C_luaL__fileresult_158 ' JUMPV addrg
C_luaL__fileresult_157
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strerror ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
C_luaL__fileresult_158
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #3 ' reg <- coni
C_luaL__fileresult_154
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaL_execresult

 alignl ' align long
C_luaL__execresult ' <symbol:luaL_execresult>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 cmps r21, r22 wz
 if_z jmp #\C_luaL__execresult_162 ' EQI4
 mov r20, ##@C_errno
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r20, r22 wz
 if_z jmp #\C_luaL__execresult_162 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaL__execresult_161 ' JUMPV addrg
C_luaL__execresult_162
 mov RI, ##@C_luaL__execresult_164_L000165
 mov BC, FP
 sub BC, #-(-8)
 wrlong RI, BC ' ASGNP4 addrli addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #101 wz
 if_nz jmp #\C_luaL__execresult_166 ' NEI4
 cmps r21,  #0 wz
 if_nz jmp #\C_luaL__execresult_166 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__execresult_167 ' JUMPV addrg
C_luaL__execresult_166
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
C_luaL__execresult_167
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #3 ' reg <- coni
C_luaL__execresult_161
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaL_newmetatable

 alignl ' align long
C_luaL__newmetatable ' <symbol:luaL_newmetatable>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaL__newmetatable_169 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaL__newmetatable_168 ' JUMPV addrg
C_luaL__newmetatable_169
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_luaL__typeerror_128_L000129 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_luaL__newmetatable_168
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_setmetatable

 alignl ' align long
C_luaL__setmetatable ' <symbol:luaL_setmetatable>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
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
' C_luaL__setmetatable_171 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_testudata

 alignl ' align long
C_luaL__testudata ' <symbol:luaL_testudata>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__testudata_173 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaL__testudata_175 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawequal
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__testudata_177 ' NEI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaL__testudata_177
 mov r2, ##-3 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_luaL__testudata_172 ' JUMPV addrg
C_luaL__testudata_175
C_luaL__testudata_173
 mov r0, ##0 ' RET con
C_luaL__testudata_172
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaL_checkudata

 alignl ' align long
C_luaL__checkudata ' <symbol:luaL_checkudata>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__testudata
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__checkudata_180  ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_luaL__checkudata_180
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaL__checkudata_179 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_checkoption

 alignl ' align long
C_luaL__checkoption ' <symbol:luaL_checkoption>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__checkoption_183 ' EQU4
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_luaL__checkoption_184 ' JUMPV addrg
C_luaL__checkoption_183
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
C_luaL__checkoption_184
 mov r13, r11 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
 jmp #\@C_luaL__checkoption_188 ' JUMPV addrg
C_luaL__checkoption_185
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__checkoption_189 ' NEI4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_luaL__checkoption_181 ' JUMPV addrg
C_luaL__checkoption_189
' C_luaL__checkoption_186 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_luaL__checkoption_188
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__checkoption_185  ' NEU4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__checkoption_191_L000192 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaL__checkoption_181
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_checkstack

 alignl ' align long
C_luaL__checkstack ' <symbol:luaL_checkstack>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__checkstack_194 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__checkstack_196 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__checkstack_198_L000199 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 jmp #\@C_luaL__checkstack_197 ' JUMPV addrg
C_luaL__checkstack_196
 mov r2, ##@C_luaL__checkstack_200_L000201 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_luaL__checkstack_197
C_luaL__checkstack_194
' C_luaL__checkstack_193 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_checktype

 alignl ' align long
C_luaL__checktype ' <symbol:luaL_checktype>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0, r19 wz
 if_z jmp #\C_luaL__checktype_203 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4or_690edbc2_tag_error_L000136
 add SP, #8 ' CALL addrg
C_luaL__checktype_203
' C_luaL__checktype_202 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_checkany

 alignl ' align long
C_luaL__checkany ' <symbol:luaL_checkany>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_luaL__checkany_206 ' NEI4
 mov r2, ##@C_luaL__checkany_208_L000209 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_luaL__checkany_206
' C_luaL__checkany_205 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_checklstring

 alignl ' align long
C_luaL__checklstring ' <symbol:luaL_checklstring>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__checklstring_211  ' NEU4
 mov r2, #4 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4or_690edbc2_tag_error_L000136
 add SP, #8 ' CALL addrg
C_luaL__checklstring_211
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaL__checklstring_210 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_optlstring

 alignl ' align long
C_luaL__optlstring ' <symbol:luaL_optlstring>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 if_a jmp #\C_luaL__optlstring_214 ' GTI4
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__optlstring_216 ' EQU4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__optlstring_219 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #\@C_luaL__optlstring_220 ' JUMPV addrg
C_luaL__optlstring_219
 mov r15, #0 ' reg <- coni
C_luaL__optlstring_220
 wrlong r15, r17 ' ASGNU4 reg reg
C_luaL__optlstring_216
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_luaL__optlstring_213 ' JUMPV addrg
C_luaL__optlstring_214
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaL__optlstring_213
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_checknumber

 alignl ' align long
C_luaL__checknumber ' <symbol:luaL_checknumber>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaL__checknumber_222 ' NEI4
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4or_690edbc2_tag_error_L000136
 add SP, #8 ' CALL addrg
C_luaL__checknumber_222
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
' C_luaL__checknumber_221 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaL_optnumber

 alignl ' align long
C_luaL__optnumber ' <symbol:luaL_optnumber>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_a jmp #\C_luaL__optnumber_226 ' GTI4
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #\@C_luaL__optnumber_227 ' JUMPV addrg
C_luaL__optnumber_226
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_luaL__optnumber_227
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaL__optnumber_224 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o15_690edbc2_interror_L000228 ' <symbol:interror>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isnumber
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sh4o15_690edbc2_interror_L000228_230 ' EQI4
 mov r2, ##@C_sh4o15_690edbc2_interror_L000228_232_L000233 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 jmp #\@C_sh4o15_690edbc2_interror_L000228_231 ' JUMPV addrg
C_sh4o15_690edbc2_interror_L000228_230
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4or_690edbc2_tag_error_L000136
 add SP, #8 ' CALL addrg
C_sh4o15_690edbc2_interror_L000228_231
' C_sh4o15_690edbc2_interror_L000228_229 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_checkinteger

 alignl ' align long
C_luaL__checkinteger ' <symbol:luaL_checkinteger>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaL__checkinteger_235 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o15_690edbc2_interror_L000228
 add SP, #4 ' CALL addrg
C_luaL__checkinteger_235
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luaL__checkinteger_234 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaL_optinteger

 alignl ' align long
C_luaL__optinteger ' <symbol:luaL_optinteger>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_a jmp #\C_luaL__optinteger_239 ' GTI4
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #\@C_luaL__optinteger_240 ' JUMPV addrg
C_luaL__optinteger_239
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_luaL__optinteger_240
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaL__optinteger_237 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o17_690edbc2_resizebox_L000241 ' <symbol:resizebox>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getallocf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRU4 reg
 rdlong r4, r17 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #12 ' CALL indirect
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_sh4o17_690edbc2_resizebox_L000241_243  ' NEU4
 cmp r19, r22 wz
 if_z jmp #\C_sh4o17_690edbc2_resizebox_L000241_243 ' EQU4
 mov r2, ##@C_sh4o17_690edbc2_resizebox_L000241_245_L000246 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_error ' CALL addrg
C_sh4o17_690edbc2_resizebox_L000241_243
 wrlong r15, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_sh4o17_690edbc2_resizebox_L000241_242 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sh4o19_690edbc2_boxgc_L000247 ' <symbol:boxgc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o17_690edbc2_resizebox_L000241
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_sh4o19_690edbc2_boxgc_L000247_248 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sh4o1a_690edbc2_boxmt_L000249 ' <symbol:boxmt>
 long @C_sh4o1b_690edbc2_250_L000251
 long @C_sh4o19_690edbc2_boxgc_L000247
 long @C_sh4o1c_690edbc2_252_L000253
 long @C_sh4o19_690edbc2_boxgc_L000247
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sh4o1d_690edbc2_newbox_L000254 ' <symbol:newbox>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #8 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##0 ' reg <- con
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, ##@C_sh4o1d_690edbc2_newbox_L000254_258_L000259 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__newmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sh4o1d_690edbc2_newbox_L000254_256 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_sh4o1a_690edbc2_boxmt_L000249 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
C_sh4o1d_690edbc2_newbox_L000254_256
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
' C_sh4o1d_690edbc2_newbox_L000254_255 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o1f_690edbc2_newbuffsize_L000260 ' <symbol:newbuffsize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r19, r22
 shl r19, #1 ' LSHU4 coni
 mov r22, ##$ffffffff ' reg <- con
 sub r22, r21 ' SUBU (1)
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sh4o1f_690edbc2_newbuffsize_L000260_262 ' GEU4
 mov r2, ##@C_sh4o1f_690edbc2_newbuffsize_L000260_264_L000265 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sh4o1f_690edbc2_newbuffsize_L000260_261 ' JUMPV addrg
C_sh4o1f_690edbc2_newbuffsize_L000260_262
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r21 ' ADDU (1)
 cmp r19, r22 wcz 
 if_ae jmp #\C_sh4o1f_690edbc2_newbuffsize_L000260_266 ' GEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r19, r22 ' ADDU
 add r19, r21 ' ADDU (3)
C_sh4o1f_690edbc2_newbuffsize_L000260_266
 mov r0, r19 ' CVI, CVU or LOAD
C_sh4o1f_690edbc2_newbuffsize_L000260_261
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o1h_690edbc2_prepbuffsize_L000268 ' <symbol:prepbuffsize>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 cmp r22, r21 wcz 
 if_b jmp #\C_sh4o1h_690edbc2_prepbuffsize_L000268_270 ' LTU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r23 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sh4o1h_690edbc2_prepbuffsize_L000268_269 ' JUMPV addrg
C_sh4o1h_690edbc2_prepbuffsize_L000268_270
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1f_690edbc2_newbuffsize_L000260
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_sh4o1h_690edbc2_prepbuffsize_L000268_272 ' EQU4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o17_690edbc2_resizebox_L000241
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #\@C_sh4o1h_690edbc2_prepbuffsize_L000268_273 ' JUMPV addrg
C_sh4o1h_690edbc2_prepbuffsize_L000268_272
 mov r2, ##-1 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sh4o1d_690edbc2_newbox_L000254 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toclose
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o17_690edbc2_resizebox_L000241
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_sh4o1h_690edbc2_prepbuffsize_L000268_273
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_sh4o1h_690edbc2_prepbuffsize_L000268_269
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export luaL_prepbuffsize

 alignl ' align long
C_luaL__prepbuffsize ' <symbol:luaL_prepbuffsize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##-1 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1h_690edbc2_prepbuffsize_L000268
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__prepbuffsize_274 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_addlstring

 alignl ' align long
C_luaL__addlstring ' <symbol:luaL_addlstring>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 if_z jmp #\C_luaL__addlstring_276 ' EQU4
 mov r2, ##-1 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1h_690edbc2_prepbuffsize_L000268
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r19 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r19 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_luaL__addlstring_276
' C_luaL__addlstring_275 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaL_addstring

 alignl ' align long
C_luaL__addstring ' <symbol:luaL_addstring>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
' C_luaL__addstring_278 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_pushresult

 alignl ' align long
C_luaL__pushresult ' <symbol:luaL_pushresult>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_luaL__pushresult_280 ' EQU4
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_closeslot
 add SP, #4 ' CALL addrg
C_luaL__pushresult_280
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_luaL__pushresult_279 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_pushresultsize

 alignl ' align long
C_luaL__pushresultsize ' <symbol:luaL_pushresultsize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, r21 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
' C_luaL__pushresultsize_282 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_addvalue

 alignl ' align long
C_luaL__addvalue ' <symbol:luaL_addvalue>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##-2 ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1h_690edbc2_prepbuffsize_L000268
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, ##-2 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_luaL__addvalue_283 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export luaL_buffinit

 alignl ' align long
C_luaL__buffinit ' <symbol:luaL_buffinit>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #256 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
' C_luaL__buffinit_284 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_buffinitsize

 alignl ' align long
C_luaL__buffinitsize ' <symbol:luaL_buffinitsize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1h_690edbc2_prepbuffsize_L000268
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__buffinitsize_285 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_ref

 alignl ' align long
C_luaL__ref ' <symbol:luaL_ref>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__ref_287 ' NEI4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, ##-1 ' RET con
 jmp #\@C_luaL__ref_286 ' JUMPV addrg
C_luaL__ref_287
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__ref_289 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
 jmp #\@C_luaL__ref_290 ' JUMPV addrg
C_luaL__ref_289
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_luaL__ref_290
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r19,  #0 wz
 if_z jmp #\C_luaL__ref_291 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
 jmp #\@C_luaL__ref_292 ' JUMPV addrg
C_luaL__ref_291
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawlen
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
C_luaL__ref_292
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_luaL__ref_286
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_unref

 alignl ' align long
C_luaL__unref ' <symbol:luaL_unref>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wcz
 if_b jmp #\C_luaL__unref_294 ' LTI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
C_luaL__unref_294
' C_luaL__unref_293 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o1i_690edbc2_getF__L000296 ' <symbol:getF>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r21 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_sh4o1i_690edbc2_getF__L000296_298 ' LEI4
 rdlong r22, r17 ' reg <- INDIRI4 reg
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, r17 ' ASGNI4 reg reg
 jmp #\@C_sh4o1i_690edbc2_getF__L000296_299 ' JUMPV addrg
C_sh4o1i_690edbc2_getF__L000296_298
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sh4o1i_690edbc2_getF__L000296_300 ' EQI4
 mov r0, ##0 ' RET con
 jmp #\@C_sh4o1i_690edbc2_getF__L000296_297 ' JUMPV addrg
C_sh4o1i_690edbc2_getF__L000296_300
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##512 ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r17
 adds r5, #8 ' ADDP4 coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fread
 add SP, #12 ' CALL addrg
 wrlong r0, r19 ' ASGNU4 reg reg
C_sh4o1i_690edbc2_getF__L000296_299
 mov r0, r17
 adds r0, #8 ' ADDP4 coni
C_sh4o1i_690edbc2_getF__L000296_297
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o1j_690edbc2_errfile_L000302 ' <symbol:errfile>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##@C_errno
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strerror ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, ##@C_sh4o1j_690edbc2_errfile_L000302_304_L000305 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #16 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
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
 mov r0, #6 ' reg <- coni
' C_sh4o1j_690edbc2_errfile_L000302_303 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sh4o1l_690edbc2_skipB_O_M__L000306 ' <symbol:skipBOM>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, ##@C_sh4o1l_690edbc2_skipB_O_M__L000306_308_L000309 ' reg <- addrg
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
C_sh4o1l_690edbc2_skipB_O_M__L000306_310
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_z jmp #\C_sh4o1l_690edbc2_skipB_O_M__L000306_315 ' EQI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r21, r22 wz
 if_z jmp #\C_sh4o1l_690edbc2_skipB_O_M__L000306_313 ' EQI4
C_sh4o1l_690edbc2_skipB_O_M__L000306_315
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sh4o1l_690edbc2_skipB_O_M__L000306_307 ' JUMPV addrg
C_sh4o1l_690edbc2_skipB_O_M__L000306_313
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r23 ' ASGNI4 reg reg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sh4o1l_690edbc2_skipB_O_M__L000306_311 ' (symbol refcount = 0)
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sh4o1l_690edbc2_skipB_O_M__L000306_310 ' NEI4
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sh4o1l_690edbc2_skipB_O_M__L000306_307
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o1n_690edbc2_skipcomment_L000316 ' <symbol:skipcomment>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sh4o1l_690edbc2_skipB_O_M__L000306 ' CALL addrg
 wrlong r0, r21 ' ASGNI4 reg reg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #35 wz
 if_nz jmp #\C_sh4o1n_690edbc2_skipcomment_L000316_318 ' NEI4
C_sh4o1n_690edbc2_skipcomment_L000316_320
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
' C_sh4o1n_690edbc2_skipcomment_L000316_321 ' (symbol refcount = 0)
 mov r22, ##-1 ' reg <- con
 cmps r19, r22 wz
 if_z jmp #\C_sh4o1n_690edbc2_skipcomment_L000316_323 ' EQI4
 cmps r19,  #10 wz
 if_nz jmp #\C_sh4o1n_690edbc2_skipcomment_L000316_320 ' NEI4
C_sh4o1n_690edbc2_skipcomment_L000316_323
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getc ' CALL addrg
 wrlong r0, r21 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sh4o1n_690edbc2_skipcomment_L000316_317 ' JUMPV addrg
C_sh4o1n_690edbc2_skipcomment_L000316_318
 mov r0, #0 ' reg <- coni
C_sh4o1n_690edbc2_skipcomment_L000316_317
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_loadfilex

 alignl ' align long
C_luaL__loadfilex ' <symbol:luaL_loadfilex>
 calld PA,#NEWF
 sub SP, ##532
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0
 adds r17, #1 ' ADDI4 coni
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__loadfilex_325  ' NEU4
 mov r2, ##@C_luaL__loadfilex_327_L000328 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, ##@C___stdin ' reg <- addrg
 mov RI, ##-520
 adds RI, FP
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #\@C_luaL__loadfilex_326 ' JUMPV addrg
C_luaL__loadfilex_325
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__loadfilex_330_L000331 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaL__loadfilex_333_L000334 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov RI, ##-520
 adds RI, FP
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, ##-520
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__loadfilex_335  ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__loadfilex_338_L000339 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1j_690edbc2_errfile_L000302
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaL__loadfilex_324 ' JUMPV addrg
C_luaL__loadfilex_335
C_luaL__loadfilex_326
 mov r2, FP
 adds r2, ##(-528)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-524)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1n_690edbc2_skipcomment_L000316
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaL__loadfilex_340 ' EQI4
 mov r22, ##-524
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 mov RI, ##-524
 adds RI, FP
 wrlong r20, RI ' ASGNI4 addrl reg
 mov r20, ##-516
 adds r20, FP
 ' reg <- addrl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #10 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaL__loadfilex_340
 mov r22, ##-528
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##@C_luaL__loadfilex_345_L000346 ' reg <- addrg
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_nz jmp #\C_luaL__loadfilex_343 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__loadfilex_343 ' EQU4
 mov RI, FP
 adds RI, ##(-520)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, ##@C_luaL__loadfilex_348_L000349 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_freopen
 add SP, #8 ' CALL addrg
 mov RI, ##-520
 adds RI, FP
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, ##-520
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__loadfilex_351  ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__loadfilex_354_L000355 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1j_690edbc2_errfile_L000302
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaL__loadfilex_324 ' JUMPV addrg
C_luaL__loadfilex_351
 mov r2, FP
 adds r2, ##(-528)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-524)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1n_690edbc2_skipcomment_L000316
 add SP, #4 ' CALL addrg
C_luaL__loadfilex_343
 mov r22, ##-528
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_luaL__loadfilex_356 ' EQI4
 mov r22, ##-524
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 mov RI, ##-524
 adds RI, FP
 wrlong r20, RI ' ASGNI4 addrl reg
 mov r20, ##-516
 adds r20, FP
 ' reg <- addrl
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##-528
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaL__loadfilex_356
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 adds r4, ##(-524)
' reg ARG ADDRL
 mov r5, ##@C_sh4o1i_690edbc2_getF__L000296 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_load
 add SP, #16 ' CALL addrg
 mov RI, ##-532
 adds RI, FP
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, ##-520
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaL__loadfilex_361 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_luaL__loadfilex_362 ' JUMPV addrg
C_luaL__loadfilex_361
 mov r15, #0 ' reg <- coni
C_luaL__loadfilex_362
 mov RI, ##-536
 adds RI, FP
 wrlong r15, RI ' ASGNI4 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__loadfilex_363 ' EQU4
 mov RI, FP
 adds RI, ##(-520)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
C_luaL__loadfilex_363
 mov r22, ##-536
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaL__loadfilex_366 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__loadfilex_368_L000369 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o1j_690edbc2_errfile_L000302
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaL__loadfilex_324 ' JUMPV addrg
C_luaL__loadfilex_366
 mov r2, ##-1 ' reg ARG con
 mov r3, r17 ' CVI, CVU or LOAD
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
 mov r22, ##-532
 adds r22, FP
 ' reg <- addrl
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_luaL__loadfilex_324
 calld PA,#POPM ' restore registers
 add SP, ##532 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sh4o20_690edbc2_getS__L000370 ' <symbol:getS>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sh4o20_690edbc2_getS__L000370_372  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sh4o20_690edbc2_getS__L000370_371 ' JUMPV addrg
C_sh4o20_690edbc2_getS__L000370_372
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r2 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 rdlong r0, r23 ' reg <- INDIRP4 reg
C_sh4o20_690edbc2_getS__L000370_371
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaL_loadbufferx

 alignl ' align long
C_luaL__loadbufferx ' <symbol:luaL_loadbufferx>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r23, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNU4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, ##@C_sh4o20_690edbc2_getS__L000370 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_load
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__loadbufferx_374 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaL_loadstring

 alignl ' align long
C_luaL__loadstring ' <symbol:luaL_loadstring>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaL__loadbufferx
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__loadstring_376 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_getmetafield

 alignl ' align long
C_luaL__getmetafield ' <symbol:luaL_getmetafield>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__getmetafield_378 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaL__getmetafield_377 ' JUMPV addrg
C_luaL__getmetafield_378
 mov r2, r19 ' CVI, CVU or LOAD
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
 long @C_lua_rawget
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaL__getmetafield_380 ' NEI4
 mov r2, ##-3 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__getmetafield_381 ' JUMPV addrg
C_luaL__getmetafield_380
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
C_luaL__getmetafield_381
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_luaL__getmetafield_377
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaL_callmeta

 alignl ' align long
C_luaL__callmeta ' <symbol:luaL_callmeta>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__callmeta_383 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaL__callmeta_382 ' JUMPV addrg
C_luaL__callmeta_383
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r22, #1 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_luaL__callmeta_382
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_len

 alignl ' align long
C_luaL__len ' <symbol:luaL_len>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_len
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaL__len_386 ' NEI4
 mov r2, ##@C_luaL__len_388_L000389 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_luaL__len_386
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luaL__len_385 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaL_tolstring

 alignl ' align long
C_luaL__tolstring ' <symbol:luaL_tolstring>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##@C_luaL__tolstring_393_L000394 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__callmeta
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaL__tolstring_391 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__tolstring_392 ' NEI4
 mov r2, ##@C_luaL__tolstring_397_L000398 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__tolstring_392 ' JUMPV addrg
C_luaL__tolstring_391
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wcz
 if_b jmp #\C_luaL__tolstring_399 ' LTI4
 cmps r17,  #4 wcz
 if_a jmp #\C_luaL__tolstring_399 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaL__tolstring_428_L000430 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaL__tolstring_428_L000430 ' <symbol:428>
 long @C_luaL__tolstring_418
 long @C_luaL__tolstring_410
 long @C_luaL__tolstring_399
 long @C_luaL__tolstring_402
 long @C_luaL__tolstring_409

' Catalina Code

DAT ' code segment
C_luaL__tolstring_402
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaL__tolstring_403 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__tolstring_405_L000406 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 jmp #\@C_luaL__tolstring_400 ' JUMPV addrg
C_luaL__tolstring_403
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_luaL__tolstring_407_L000408 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 jmp #\@C_luaL__tolstring_400 ' JUMPV addrg
C_luaL__tolstring_409
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__tolstring_400 ' JUMPV addrg
C_luaL__tolstring_410
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_luaL__tolstring_416 ' EQI4
 mov r15, ##@C_luaL__tolstring_411_L000412 ' reg <- addrg
 jmp #\@C_luaL__tolstring_417 ' JUMPV addrg
C_luaL__tolstring_416
 mov r15, ##@C_luaL__tolstring_413_L000414 ' reg <- addrg
C_luaL__tolstring_417
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__tolstring_400 ' JUMPV addrg
C_luaL__tolstring_418
 mov r2, ##@C_luaL__tolstring_419_L000420 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__tolstring_400 ' JUMPV addrg
C_luaL__tolstring_399
 mov r2, ##@C_luaL__typeerror_128_L000129 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #4 wz
 if_nz jmp #\C_luaL__tolstring_422 ' NEI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_luaL__tolstring_423 ' JUMPV addrg
C_luaL__tolstring_422
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
 mov r13, r22 ' CVI, CVU or LOAD
C_luaL__tolstring_423
 mov RI, FP
 sub RI, #-(-12)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, ##@C_luaL__tolstring_424_L000425 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaL__tolstring_400 ' EQI4
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
C_luaL__tolstring_400
C_luaL__tolstring_392
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__tolstring_390 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaL_setfuncs

 alignl ' align long
C_luaL__setfuncs ' <symbol:luaL_setfuncs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##@C_luaL__setfuncs_432_L000433 ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 jmp #\@C_luaL__setfuncs_437 ' JUMPV addrg
C_luaL__setfuncs_434
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__setfuncs_438  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__setfuncs_439 ' JUMPV addrg
C_luaL__setfuncs_438
 mov r17, #0 ' reg <- coni
 jmp #\@C_luaL__setfuncs_443 ' JUMPV addrg
C_luaL__setfuncs_440
 neg r2, r19 ' NEGI4
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
' C_luaL__setfuncs_441 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_luaL__setfuncs_443
 cmps r17, r19 wcz
 if_b jmp #\C_luaL__setfuncs_440 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
C_luaL__setfuncs_439
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #2 ' ADDI4 coni
 neg r3, r22 ' NEGI4
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
' C_luaL__setfuncs_435 ' (symbol refcount = 0)
 adds r21, #8 ' ADDP4 coni
C_luaL__setfuncs_437
 rdlong r22, r21 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__setfuncs_434  ' NEU4
 neg r22, r19 ' NEGI4
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_luaL__setfuncs_431 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_getsubtable

 alignl ' align long
C_luaL__getsubtable ' <symbol:luaL_getsubtable>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C_luaL__getsubtable_445 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaL__getsubtable_444 ' JUMPV addrg
C_luaL__getsubtable_445
 mov r2, ##-2 ' reg ARG con
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
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_luaL__getsubtable_444
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_requiref

 alignl ' align long
C_luaL__requiref ' <symbol:luaL_requiref>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, ##@C_sh4o2_690edbc2_pushglobalfuncname_L000020_24_L000025 ' reg ARG ADDRG
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__getsubtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-1 ' reg ARG con
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
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaL__requiref_448 ' NEI4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r22, #1 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-3 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
C_luaL__requiref_448
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
 cmps r17,  #0 wz
 if_z jmp #\C_luaL__requiref_450 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
C_luaL__requiref_450
' C_luaL__requiref_447 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_addgsub

 alignl ' align long
C_luaL__addgsub ' <symbol:luaL_addgsub>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaL__addgsub_454 ' JUMPV addrg
C_luaL__addgsub_453
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 mov r21, r13 ' ADDI/P
 adds r21, r15 ' ADDI/P (3)
C_luaL__addgsub_454
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strstr
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaL__addgsub_453  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
' C_luaL__addgsub_452 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_gsub

 alignl ' align long
C_luaL__gsub ' <symbol:luaL_gsub>
 calld PA,#NEWF
 sub SP, #272
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-276) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addgsub
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__gsub_456 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #272 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sh4o2d_690edbc2_l_alloc_L000457 ' <symbol:l_alloc>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmp r17,  #0 wz
 if_nz jmp #\C_sh4o2d_690edbc2_l_alloc_L000457_459  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r0, ##0 ' RET con
 jmp #\@C_sh4o2d_690edbc2_l_alloc_L000457_458 ' JUMPV addrg
C_sh4o2d_690edbc2_l_alloc_L000457_459
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_realloc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sh4o2d_690edbc2_l_alloc_L000457_461 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sh4o2d_690edbc2_l_alloc_L000457_463  ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 jmp #\@C_sh4o2d_690edbc2_l_alloc_L000457_464 ' JUMPV addrg
C_sh4o2d_690edbc2_l_alloc_L000457_463
 cmp r17, r19 wcz 
 if_be jmp #\C_sh4o2d_690edbc2_l_alloc_L000457_465 ' LEU4
 mov r2, r17 ' SUBU
 sub r2, r19 ' SUBU (3)
 mov r3, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r19 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
C_sh4o2d_690edbc2_l_alloc_L000457_465
C_sh4o2d_690edbc2_l_alloc_L000457_464
C_sh4o2d_690edbc2_l_alloc_L000457_461
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
C_sh4o2d_690edbc2_l_alloc_L000457_458
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sh4o2e_690edbc2_panic_L000467 ' <symbol:panic>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sh4o2e_690edbc2_panic_L000467_469  ' NEU4
 mov r21, ##@C_sh4o2e_690edbc2_panic_L000467_471_L000472 ' reg <- addrg
C_sh4o2e_690edbc2_panic_L000467_469
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sh4o2e_690edbc2_panic_L000467_473_L000474 ' reg ARG ADDRG
 mov r4, ##@C___stderr ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_sh4o2e_690edbc2_panic_L000467_468 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o2k_690edbc2_checkcontrol_L000478 ' <symbol:checkcontrol>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 if_nz jmp #\C_sh4o2k_690edbc2_checkcontrol_L000478_482 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #64 wz
 if_z jmp #\C_sh4o2k_690edbc2_checkcontrol_L000478_480 ' EQI4
C_sh4o2k_690edbc2_checkcontrol_L000478_482
 mov r0, #0 ' reg <- coni
 jmp #\@C_sh4o2k_690edbc2_checkcontrol_L000478_479 ' JUMPV addrg
C_sh4o2k_690edbc2_checkcontrol_L000478_480
 mov r2, ##@C_sh4o2k_690edbc2_checkcontrol_L000478_485_L000486 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sh4o2k_690edbc2_checkcontrol_L000478_483 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_sh4o2h_690edbc2_warnfoff_L000475 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
 jmp #\@C_sh4o2k_690edbc2_checkcontrol_L000478_484 ' JUMPV addrg
C_sh4o2k_690edbc2_checkcontrol_L000478_483
 mov r2, ##@C_sh4o2k_690edbc2_checkcontrol_L000478_489_L000490 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sh4o2k_690edbc2_checkcontrol_L000478_487 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_sh4o2i_690edbc2_warnfon_L000476 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
C_sh4o2k_690edbc2_checkcontrol_L000478_487
C_sh4o2k_690edbc2_checkcontrol_L000478_484
 mov r0, #1 ' reg <- coni
C_sh4o2k_690edbc2_checkcontrol_L000478_479
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o2h_690edbc2_warnfoff_L000475 ' <symbol:warnfoff>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o2k_690edbc2_checkcontrol_L000478
 add SP, #8 ' CALL addrg
' C_sh4o2h_690edbc2_warnfoff_L000475_491 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o2j_690edbc2_warnfcont_L000477 ' <symbol:warnfcont>
 calld PA,#NEWF
 calld PA,#PSHM
 long $aa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r23 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sh4o2j_690edbc2_warnfcont_L000477_493_L000494 ' reg ARG ADDRG
 mov r4, ##@C___stderr ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 cmps r19,  #0 wz
 if_z jmp #\C_sh4o2j_690edbc2_warnfcont_L000477_495 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_sh4o2j_690edbc2_warnfcont_L000477 ' reg ARG ADDRG
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
 jmp #\@C_sh4o2j_690edbc2_warnfcont_L000477_496 ' JUMPV addrg
C_sh4o2j_690edbc2_warnfcont_L000477_495
 mov r2, ##@C_sh4o2j_690edbc2_warnfcont_L000477_497_L000498 ' reg ARG ADDRG
 mov r3, ##@C_sh4o2j_690edbc2_warnfcont_L000477_493_L000494 ' reg ARG ADDRG
 mov r4, ##@C___stderr ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_sh4o2i_690edbc2_warnfon_L000476 ' reg ARG ADDRG
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
C_sh4o2j_690edbc2_warnfcont_L000477_496
' C_sh4o2j_690edbc2_warnfcont_L000477_492 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sh4o2i_690edbc2_warnfon_L000476 ' <symbol:warnfon>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o2k_690edbc2_checkcontrol_L000478
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sh4o2i_690edbc2_warnfon_L000476_500 ' EQI4
 jmp #\@C_sh4o2i_690edbc2_warnfon_L000476_499 ' JUMPV addrg
C_sh4o2i_690edbc2_warnfon_L000476_500
 mov r2, ##@C_sh4o2i_690edbc2_warnfon_L000476_502_L000503 ' reg ARG ADDRG
 mov r3, ##@C_sh4o2j_690edbc2_warnfcont_L000477_493_L000494 ' reg ARG ADDRG
 mov r4, ##@C___stderr ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sh4o2j_690edbc2_warnfcont_L000477
 add SP, #8 ' CALL addrg
C_sh4o2i_690edbc2_warnfon_L000476_499
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_newstate

 alignl ' align long
C_luaL__newstate ' <symbol:luaL_newstate>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r2, ##0 ' reg ARG con
 mov r3, ##@C_sh4o2d_690edbc2_l_alloc_L000457 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_newstate
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaL__newstate_505 ' EQU4
 mov r2, ##@C_sh4o2e_690edbc2_panic_L000467 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_atpanic
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_sh4o2h_690edbc2_warnfoff_L000475 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
C_luaL__newstate_505
 mov r0, r23 ' CVI, CVU or LOAD
' C_luaL__newstate_504 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaL_checkversion_

 alignl ' align long
C_luaL__checkversion_ ' <symbol:luaL_checkversion_>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_version ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 cmp r19,  #68 wz
 if_z jmp #\C_luaL__checkversion__508 ' EQU4
 mov r2, ##@C_luaL__checkversion__510_L000511 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 jmp #\@C_luaL__checkversion__509 ' JUMPV addrg
C_luaL__checkversion__508
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_luaL__checkversion__512 ' EQF4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, ##@C_luaL__checkversion__514_L000515 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
C_luaL__checkversion__512
C_luaL__checkversion__509
' C_luaL__checkversion__507 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import lua_getinfo

' Catalina Import lua_getstack

' Catalina Import lua_closeslot

' Catalina Import lua_toclose

' Catalina Import lua_getallocf

' Catalina Import lua_len

' Catalina Import lua_concat

' Catalina Import lua_next

' Catalina Import lua_error

' Catalina Import lua_setwarnf

' Catalina Import lua_load

' Catalina Import lua_callk

' Catalina Import lua_setmetatable

' Catalina Import lua_rawseti

' Catalina Import lua_setfield

' Catalina Import lua_setglobal

' Catalina Import lua_getmetatable

' Catalina Import lua_newuserdatauv

' Catalina Import lua_createtable

' Catalina Import lua_rawgeti

' Catalina Import lua_rawget

' Catalina Import lua_getfield

' Catalina Import lua_pushlightuserdata

' Catalina Import lua_pushboolean

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushfstring

' Catalina Import lua_pushvfstring

' Catalina Import lua_pushstring

' Catalina Import lua_pushlstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnil

' Catalina Import lua_rawequal

' Catalina Import lua_topointer

' Catalina Import lua_touserdata

' Catalina Import lua_rawlen

' Catalina Import lua_tolstring

' Catalina Import lua_toboolean

' Catalina Import lua_tointegerx

' Catalina Import lua_tonumberx

' Catalina Import lua_typename

' Catalina Import lua_type

' Catalina Import lua_isinteger

' Catalina Import lua_isstring

' Catalina Import lua_isnumber

' Catalina Import lua_checkstack

' Catalina Import lua_copy

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import lua_absindex

' Catalina Import lua_version

' Catalina Import lua_atpanic

' Catalina Import lua_newstate

' Catalina Import strlen

' Catalina Import strerror

' Catalina Import memset

' Catalina Import strstr

' Catalina Import strncmp

' Catalina Import strcmp

' Catalina Import memcpy

' Catalina Import realloc

' Catalina Import free

' Catalina Import fread

' Catalina Import getc

' Catalina Import fprintf

' Catalina Import freopen

' Catalina Import fopen

' Catalina Import fflush

' Catalina Import fclose

' Catalina Import __stderr

' Catalina Import __stdin

' Catalina Import errno

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaL__checkversion__514_L000515 ' <symbol:514>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 32
 byte 109
 byte 105
 byte 115
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 58
 byte 32
 byte 97
 byte 112
 byte 112
 byte 46
 byte 32
 byte 110
 byte 101
 byte 101
 byte 100
 byte 115
 byte 32
 byte 37
 byte 102
 byte 44
 byte 32
 byte 76
 byte 117
 byte 97
 byte 32
 byte 99
 byte 111
 byte 114
 byte 101
 byte 32
 byte 112
 byte 114
 byte 111
 byte 118
 byte 105
 byte 100
 byte 101
 byte 115
 byte 32
 byte 37
 byte 102
 byte 0

 alignl ' align long
C_luaL__checkversion__510_L000511 ' <symbol:510>
 byte 99
 byte 111
 byte 114
 byte 101
 byte 32
 byte 97
 byte 110
 byte 100
 byte 32
 byte 108
 byte 105
 byte 98
 byte 114
 byte 97
 byte 114
 byte 121
 byte 32
 byte 104
 byte 97
 byte 118
 byte 101
 byte 32
 byte 105
 byte 110
 byte 99
 byte 111
 byte 109
 byte 112
 byte 97
 byte 116
 byte 105
 byte 98
 byte 108
 byte 101
 byte 32
 byte 110
 byte 117
 byte 109
 byte 101
 byte 114
 byte 105
 byte 99
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sh4o2i_690edbc2_warnfon_L000476_502_L000503 ' <symbol:502>
 byte 76
 byte 117
 byte 97
 byte 32
 byte 119
 byte 97
 byte 114
 byte 110
 byte 105
 byte 110
 byte 103
 byte 58
 byte 32
 byte 0

 alignl ' align long
C_sh4o2j_690edbc2_warnfcont_L000477_497_L000498 ' <symbol:497>
 byte 10
 byte 0

 alignl ' align long
C_sh4o2j_690edbc2_warnfcont_L000477_493_L000494 ' <symbol:493>
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_sh4o2k_690edbc2_checkcontrol_L000478_489_L000490 ' <symbol:489>
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sh4o2k_690edbc2_checkcontrol_L000478_485_L000486 ' <symbol:485>
 byte 111
 byte 102
 byte 102
 byte 0

 alignl ' align long
C_sh4o2e_690edbc2_panic_L000467_473_L000474 ' <symbol:473>
 byte 80
 byte 65
 byte 78
 byte 73
 byte 67
 byte 58
 byte 32
 byte 117
 byte 110
 byte 112
 byte 114
 byte 111
 byte 116
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 32
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 105
 byte 110
 byte 32
 byte 99
 byte 97
 byte 108
 byte 108
 byte 32
 byte 116
 byte 111
 byte 32
 byte 76
 byte 117
 byte 97
 byte 32
 byte 65
 byte 80
 byte 73
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 10
 byte 0

 alignl ' align long
C_sh4o2e_690edbc2_panic_L000467_471_L000472 ' <symbol:471>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 111
 byte 98
 byte 106
 byte 101
 byte 99
 byte 116
 byte 32
 byte 105
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
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
C_luaL__setfuncs_432_L000433 ' <symbol:432>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_luaL__tolstring_424_L000425 ' <symbol:424>
 byte 37
 byte 115
 byte 58
 byte 32
 byte 37
 byte 112
 byte 0

 alignl ' align long
C_luaL__tolstring_419_L000420 ' <symbol:419>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_luaL__tolstring_413_L000414 ' <symbol:413>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_luaL__tolstring_411_L000412 ' <symbol:411>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_luaL__tolstring_407_L000408 ' <symbol:407>
 byte 37
 byte 102
 byte 0

 alignl ' align long
C_luaL__tolstring_405_L000406 ' <symbol:405>
 byte 37
 byte 73
 byte 0

 alignl ' align long
C_luaL__tolstring_397_L000398 ' <symbol:397>
 byte 39
 byte 95
 byte 95
 byte 116
 byte 111
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 39
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
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
C_luaL__tolstring_393_L000394 ' <symbol:393>
 byte 95
 byte 95
 byte 116
 byte 111
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_luaL__len_388_L000389 ' <symbol:388>
 byte 111
 byte 98
 byte 106
 byte 101
 byte 99
 byte 116
 byte 32
 byte 108
 byte 101
 byte 110
 byte 103
 byte 116
 byte 104
 byte 32
 byte 105
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 97
 byte 110
 byte 32
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_luaL__loadfilex_368_L000369 ' <symbol:368>
 byte 114
 byte 101
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_luaL__loadfilex_354_L000355 ' <symbol:354>
 byte 114
 byte 101
 byte 111
 byte 112
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_luaL__loadfilex_348_L000349 ' <symbol:348>
 byte 114
 byte 98
 byte 0

 alignl ' align long
C_luaL__loadfilex_345_L000346 ' <symbol:345>
 byte 27
 byte 76
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_luaL__loadfilex_338_L000339 ' <symbol:338>
 byte 111
 byte 112
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_luaL__loadfilex_333_L000334 ' <symbol:333>
 byte 114
 byte 0

 alignl ' align long
C_luaL__loadfilex_330_L000331 ' <symbol:330>
 byte 64
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaL__loadfilex_327_L000328 ' <symbol:327>
 byte 61
 byte 115
 byte 116
 byte 100
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sh4o1l_690edbc2_skipB_O_M__L000306_308_L000309 ' <symbol:308>
 byte 239
 byte 187
 byte 191
 byte 0

 alignl ' align long
C_sh4o1j_690edbc2_errfile_L000302_304_L000305 ' <symbol:304>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 37
 byte 115
 byte 32
 byte 37
 byte 115
 byte 58
 byte 32
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_sh4o1f_690edbc2_newbuffsize_L000260_264_L000265 ' <symbol:264>
 byte 98
 byte 117
 byte 102
 byte 102
 byte 101
 byte 114
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 97
 byte 114
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sh4o1d_690edbc2_newbox_L000254_258_L000259 ' <symbol:258>
 byte 95
 byte 85
 byte 66
 byte 79
 byte 88
 byte 42
 byte 0

 alignl ' align long
C_sh4o1c_690edbc2_252_L000253 ' <symbol:252>
 byte 95
 byte 95
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_sh4o1b_690edbc2_250_L000251 ' <symbol:250>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_sh4o17_690edbc2_resizebox_L000241_245_L000246 ' <symbol:245>
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
 byte 109
 byte 101
 byte 109
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sh4o15_690edbc2_interror_L000228_232_L000233 ' <symbol:232>
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 32
 byte 104
 byte 97
 byte 115
 byte 32
 byte 110
 byte 111
 byte 32
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 32
 byte 114
 byte 101
 byte 112
 byte 114
 byte 101
 byte 115
 byte 101
 byte 110
 byte 116
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_luaL__checkany_208_L000209 ' <symbol:208>
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 101
 byte 120
 byte 112
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_luaL__checkstack_200_L000201 ' <symbol:200>
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_luaL__checkstack_198_L000199 ' <symbol:198>
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 0

 alignl ' align long
C_luaL__checkoption_191_L000192 ' <symbol:191>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 111
 byte 112
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_luaL__execresult_164_L000165 ' <symbol:164>
 byte 101
 byte 120
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_luaL__fileresult_159_L000160 ' <symbol:159>
 byte 37
 byte 115
 byte 58
 byte 32
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaL__where_150_L000151 ' <symbol:150>
 byte 0

 alignl ' align long
C_luaL__where_146_L000147 ' <symbol:146>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 100
 byte 58
 byte 32
 byte 0

 alignl ' align long
C_luaL__where_141_L000142 ' <symbol:141>
 byte 83
 byte 108
 byte 0

 alignl ' align long
C_luaL__typeerror_134_L000135 ' <symbol:134>
 byte 37
 byte 115
 byte 32
 byte 101
 byte 120
 byte 112
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 44
 byte 32
 byte 103
 byte 111
 byte 116
 byte 32
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaL__typeerror_132_L000133 ' <symbol:132>
 byte 108
 byte 105
 byte 103
 byte 104
 byte 116
 byte 32
 byte 117
 byte 115
 byte 101
 byte 114
 byte 100
 byte 97
 byte 116
 byte 97
 byte 0

 alignl ' align long
C_luaL__typeerror_128_L000129 ' <symbol:128>
 byte 95
 byte 95
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_luaL__argerror_122_L000123 ' <symbol:122>
 byte 98
 byte 97
 byte 100
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
 byte 35
 byte 37
 byte 100
 byte 32
 byte 116
 byte 111
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 0

 alignl ' align long
C_luaL__argerror_112_L000113 ' <symbol:112>
 byte 99
 byte 97
 byte 108
 byte 108
 byte 105
 byte 110
 byte 103
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 111
 byte 110
 byte 32
 byte 98
 byte 97
 byte 100
 byte 32
 byte 115
 byte 101
 byte 108
 byte 102
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 0

 alignl ' align long
C_luaL__argerror_108_L000109 ' <symbol:108>
 byte 109
 byte 101
 byte 116
 byte 104
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_luaL__argerror_103_L000104 ' <symbol:103>
 byte 110
 byte 0

 alignl ' align long
C_luaL__argerror_101_L000102 ' <symbol:101>
 byte 98
 byte 97
 byte 100
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
 byte 35
 byte 37
 byte 100
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 0

 alignl ' align long
C_luaL__traceback_96_L000097 ' <symbol:96>
 byte 10
 byte 9
 byte 40
 byte 46
 byte 46
 byte 46
 byte 116
 byte 97
 byte 105
 byte 108
 byte 32
 byte 99
 byte 97
 byte 108
 byte 108
 byte 115
 byte 46
 byte 46
 byte 46
 byte 41
 byte 0

 alignl ' align long
C_luaL__traceback_89_L000090 ' <symbol:89>
 byte 10
 byte 9
 byte 37
 byte 115
 byte 58
 byte 37
 byte 100
 byte 58
 byte 32
 byte 105
 byte 110
 byte 32
 byte 0

 alignl ' align long
C_luaL__traceback_86_L000087 ' <symbol:86>
 byte 10
 byte 9
 byte 37
 byte 115
 byte 58
 byte 32
 byte 105
 byte 110
 byte 32
 byte 0

 alignl ' align long
C_luaL__traceback_81_L000082 ' <symbol:81>
 byte 83
 byte 108
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_luaL__traceback_79_L000080 ' <symbol:79>
 byte 10
 byte 9
 byte 46
 byte 46
 byte 46
 byte 9
 byte 40
 byte 115
 byte 107
 byte 105
 byte 112
 byte 112
 byte 105
 byte 110
 byte 103
 byte 32
 byte 37
 byte 100
 byte 32
 byte 108
 byte 101
 byte 118
 byte 101
 byte 108
 byte 115
 byte 41
 byte 0

 alignl ' align long
C_luaL__traceback_72_L000073 ' <symbol:72>
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 116
 byte 114
 byte 97
 byte 99
 byte 101
 byte 98
 byte 97
 byte 99
 byte 107
 byte 58
 byte 0

 alignl ' align long
C_sh4o6_690edbc2_pushfuncname_L000032_50_L000051 ' <symbol:50>
 byte 63
 byte 0

 alignl ' align long
C_sh4o6_690edbc2_pushfuncname_L000032_48_L000049 ' <symbol:48>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 60
 byte 37
 byte 115
 byte 58
 byte 37
 byte 100
 byte 62
 byte 0

 alignl ' align long
C_sh4o6_690edbc2_pushfuncname_L000032_44_L000045 ' <symbol:44>
 byte 109
 byte 97
 byte 105
 byte 110
 byte 32
 byte 99
 byte 104
 byte 117
 byte 110
 byte 107
 byte 0

 alignl ' align long
C_sh4o6_690edbc2_pushfuncname_L000032_40_L000041 ' <symbol:40>
 byte 37
 byte 115
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_sh4o6_690edbc2_pushfuncname_L000032_36_L000037 ' <symbol:36>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_sh4o2_690edbc2_pushglobalfuncname_L000020_30_L000031 ' <symbol:30>
 byte 95
 byte 71
 byte 46
 byte 0

 alignl ' align long
C_sh4o2_690edbc2_pushglobalfuncname_L000020_24_L000025 ' <symbol:24>
 byte 95
 byte 76
 byte 79
 byte 65
 byte 68
 byte 69
 byte 68
 byte 0

 alignl ' align long
C_sh4o2_690edbc2_pushglobalfuncname_L000020_22_L000023 ' <symbol:22>
 byte 102
 byte 0

 alignl ' align long
C_sh4o_690edbc2_findfield_L000004_18_L000019 ' <symbol:18>
 byte 46
 byte 0

' Catalina Code

DAT ' code segment
' end
