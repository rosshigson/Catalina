' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sv2c_696dde36_findfield_L000004 ' <symbol:findfield>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sv2c_696dde36_findfield_L000004_8 ' EQI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_sv2c_696dde36_findfield_L000004_6 ' EQI4
C_sv2c_696dde36_findfield_L000004_8
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sv2c_696dde36_findfield_L000004_5 ' JUMPV addrg
C_sv2c_696dde36_findfield_L000004_6
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_sv2c_696dde36_findfield_L000004_10 ' JUMPV addrg
C_sv2c_696dde36_findfield_L000004_9
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 jmp #BRNZ
 long @C_sv2c_696dde36_findfield_L000004_12 ' NEI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawequal
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sv2c_696dde36_findfield_L000004_14 ' EQI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sv2c_696dde36_findfield_L000004_5 ' JUMPV addrg
C_sv2c_696dde36_findfield_L000004_14
 mov r2, r19
 subs r2, #1 ' SUBI4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c_696dde36_findfield_L000004
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sv2c_696dde36_findfield_L000004_16 ' EQI4
 jmp #LODL
 long @C_sv2c_696dde36_findfield_L000004_18_L000019
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_concat
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sv2c_696dde36_findfield_L000004_5 ' JUMPV addrg
C_sv2c_696dde36_findfield_L000004_16
C_sv2c_696dde36_findfield_L000004_12
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_sv2c_696dde36_findfield_L000004_10
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sv2c_696dde36_findfield_L000004_9 ' NEI4
 mov r0, #0 ' reg <- coni
C_sv2c_696dde36_findfield_L000004_5
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c2_696dde36_pushglobalfuncname_L000020 ' <symbol:pushglobalfuncname>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020_22_L000023
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020_24_L000025
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020_26_L000027
 mov r2, RI ' reg ARG ADDRG
 mov r3, #6 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r19
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c_696dde36_findfield_L000004
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020_28 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #3 ' reg ARG coni
 jmp #LODL
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020_32_L000033
 mov r3, RI ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020_30 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r2, r22
 adds r2, #3 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_sv2c2_696dde36_pushglobalfuncname_L000020_30
 mov r2, r19
 adds r2, #1 ' ADDI4 coni
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 mov r2, r19
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020_21 ' JUMPV addrg
C_sv2c2_696dde36_pushglobalfuncname_L000020_28
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_sv2c2_696dde36_pushglobalfuncname_L000020_21
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sv2c7_696dde36_pushfuncname_L000034 ' <symbol:pushfuncname>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sv2c7_696dde36_pushfuncname_L000034_36 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c7_696dde36_pushfuncname_L000034_38_L000039
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sv2c7_696dde36_pushfuncname_L000034_37 ' JUMPV addrg
C_sv2c7_696dde36_pushfuncname_L000034_36
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sv2c7_696dde36_pushfuncname_L000034_40 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_sv2c7_696dde36_pushfuncname_L000034_42_L000043
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sv2c7_696dde36_pushfuncname_L000034_41 ' JUMPV addrg
C_sv2c7_696dde36_pushfuncname_L000034_40
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #109 wz
 jmp #BRNZ
 long @C_sv2c7_696dde36_pushfuncname_L000034_44 ' NEI4
 jmp #LODL
 long @C_sv2c7_696dde36_pushfuncname_L000034_46_L000047
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sv2c7_696dde36_pushfuncname_L000034_45 ' JUMPV addrg
C_sv2c7_696dde36_pushfuncname_L000034_44
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #67 wz
 jmp #BR_Z
 long @C_sv2c7_696dde36_pushfuncname_L000034_48 ' EQI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r21
 adds r3, #44 ' ADDP4 coni
 jmp #LODL
 long @C_sv2c7_696dde36_pushfuncname_L000034_50_L000051
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sv2c7_696dde36_pushfuncname_L000034_49 ' JUMPV addrg
C_sv2c7_696dde36_pushfuncname_L000034_48
 jmp #LODL
 long @C_sv2c7_696dde36_pushfuncname_L000034_52_L000053
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
C_sv2c7_696dde36_pushfuncname_L000034_49
C_sv2c7_696dde36_pushfuncname_L000034_45
C_sv2c7_696dde36_pushfuncname_L000034_41
C_sv2c7_696dde36_pushfuncname_L000034_37
' C_sv2c7_696dde36_pushfuncname_L000034_35 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2cd_696dde36_lastlevel_L000054 ' <symbol:lastlevel>
 jmp #NEWF
 sub SP, #108
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #1 ' reg <- coni
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_sv2cd_696dde36_lastlevel_L000054_57 ' JUMPV addrg
C_sv2cd_696dde36_lastlevel_L000054_56
 mov r19, r21 ' CVI, CVU or LOAD
 shl r21, #1 ' LSHI4 coni
C_sv2cd_696dde36_lastlevel_L000054_57
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sv2cd_696dde36_lastlevel_L000054_56 ' NEI4
 jmp #JMPA
 long @C_sv2cd_696dde36_lastlevel_L000054_60 ' JUMPV addrg
C_sv2cd_696dde36_lastlevel_L000054_59
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov r20, #2 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sv2cd_696dde36_lastlevel_L000054_62 ' EQI4
 mov r19, r17
 adds r19, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_sv2cd_696dde36_lastlevel_L000054_63 ' JUMPV addrg
C_sv2cd_696dde36_lastlevel_L000054_62
 mov r21, r17 ' CVI, CVU or LOAD
C_sv2cd_696dde36_lastlevel_L000054_63
C_sv2cd_696dde36_lastlevel_L000054_60
 cmps r19, r21 wz,wc
 jmp #BR_B
 long @C_sv2cd_696dde36_lastlevel_L000054_59 ' LTI4
 mov r0, r21
 subs r0, #1 ' SUBI4 coni
' C_sv2cd_696dde36_lastlevel_L000054_55 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #108 ' framesize
 jmp #RETF


' Catalina Export luaL_traceback

 alignl ' align long
C_luaL__traceback ' <symbol:luaL_traceback>
 jmp #NEWF
 sub SP, #380
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sv2cd_696dde36_lastlevel_L000054 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' SUBI/P
 subs r22, r17 ' SUBI/P (3)
 cmps r22,  #21 wz,wc
 jmp #BRBE
 long @C_luaL__traceback_66 ' LEI4
 mov r11, #10 ' reg <- coni
 jmp #JMPA
 long @C_luaL__traceback_67 ' JUMPV addrg
C_luaL__traceback_66
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
C_luaL__traceback_67
 mov r15, r11 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__traceback_68 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-384) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-376) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, FP
 sub r20, #-(-380) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_luaL__traceback_73' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-384) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_luaL__traceback_73
 mov r22, FP
 sub r22, #-(-376) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-376)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-384) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #10 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaL__traceback_68
 jmp #LODL
 long @C_luaL__traceback_74_L000075
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-384) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__traceback_77 ' JUMPV addrg
C_luaL__traceback_76
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 subs r15, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__traceback_79 ' NEI4
 mov r22, r13 ' SUBI/P
 subs r22, r17 ' SUBI/P (3)
 subs r22, #11 ' SUBI4 coni
 mov r9, r22
 adds r9, #1 ' ADDI4 coni
 mov r2, r9 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__traceback_81_L000082
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__addvalue ' CALL addrg
 adds r17, r9 ' ADDI/P (1)
 jmp #JMPA
 long @C_luaL__traceback_80 ' JUMPV addrg
C_luaL__traceback_79
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 jmp #LODL
 long @C_luaL__traceback_83_L000084
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_luaL__traceback_85 ' GTI4
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 jmp #LODL
 long @C_luaL__traceback_88_L000089
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaL__traceback_86 ' JUMPV addrg
C_luaL__traceback_85
 mov RI, FP
 sub RI, #-(-88)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 jmp #LODL
 long @C_luaL__traceback_91_L000092
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
C_luaL__traceback_86
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__addvalue ' CALL addrg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c7_696dde36_pushfuncname_L000034
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__addvalue ' CALL addrg
 mov r22, FP
 sub r22, #-(-73) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__traceback_95 ' EQI4
 jmp #LODL
 long @C_luaL__traceback_98_L000099
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-384) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
C_luaL__traceback_95
C_luaL__traceback_80
C_luaL__traceback_77
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__traceback_76 ' NEI4
 mov r2, FP
 sub r2, #-(-384) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__pushresult ' CALL addrg
' C_luaL__traceback_64 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #380 ' framesize
 jmp #RETF


' Catalina Export luaL_argerror

 alignl ' align long
C_luaL__argerror ' <symbol:luaL_argerror>
 jmp #NEWF
 sub SP, #108
 jmp #PSHM
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
 jmp #CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__argerror_101 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__argerror_103_L000104
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__argerror_100 ' JUMPV addrg
C_luaL__argerror_101
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 jmp #LODL
 long @C_luaL__argerror_105_L000106
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_luaL__argerror_110_L000111
 mov r2, RI ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-104)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__argerror_107 ' NEI4
 subs r21, #1 ' SUBI4 coni
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_luaL__argerror_112 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-108)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_luaL__argerror_114_L000115
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__argerror_100 ' JUMPV addrg
C_luaL__argerror_112
C_luaL__argerror_107
 mov r22, FP
 sub r22, #-(-108) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__argerror_117 ' NEU4
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__argerror_122 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__argerror_123 ' JUMPV addrg
C_luaL__argerror_122
 jmp #LODL
 long @C_sv2c7_696dde36_pushfuncname_L000034_52_L000053
 mov r17, RI ' reg <- addrg
C_luaL__argerror_123
 mov RI, FP
 sub RI, #-(-108)
 wrlong r17, RI ' ASGNP4 addrli reg
C_luaL__argerror_117
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-108)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__argerror_124_L000125
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaL__error
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaL__argerror_100
 jmp #POPM ' restore registers
 add SP, #108 ' framesize
 jmp #RETF


' Catalina Export luaL_typeerror

 alignl ' align long
C_luaL__typeerror ' <symbol:luaL_typeerror>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_luaL__typeerror_130_L000131
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #4 wz
 jmp #BRNZ
 long @C_luaL__typeerror_128 ' NEI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_luaL__typeerror_129 ' JUMPV addrg
C_luaL__typeerror_128
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #2 wz
 jmp #BRNZ
 long @C_luaL__typeerror_132 ' NEI4
 jmp #LODL
 long @C_luaL__typeerror_134_L000135
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22 , RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_luaL__typeerror_133 ' JUMPV addrg
C_luaL__typeerror_132
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
C_luaL__typeerror_133
C_luaL__typeerror_129
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__typeerror_136_L000137
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__typeerror_127 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sv2cs_696dde36_tag_error_L000138 ' <symbol:tag_error>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
' C_sv2cs_696dde36_tag_error_L000138_139 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_where

 alignl ' align long
C_luaL__where ' <symbol:luaL_where>
 jmp #NEWF
 sub SP, #108
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getstack
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaL__where_141 ' EQI4
 mov r2, FP
 sub r2, #-(-112) ' reg ARG ADDRLi
 jmp #LODL
 long @C_luaL__where_143_L000144
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getinfo
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_luaL__where_145 ' LEI4
 mov RI, FP
 sub RI, #-(-88)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 jmp #LODL
 long @C_luaL__where_148_L000149
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaL__where_140 ' JUMPV addrg
C_luaL__where_145
C_luaL__where_141
 jmp #LODL
 long @C_luaL__where_152_L000153
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #4 ' CALL addrg
C_luaL__where_140
 jmp #POPM ' restore registers
 add SP, #108 ' framesize
 jmp #RETF


' Catalina Export luaL_error

 alignl ' align long
C_luaL__error ' <symbol:luaL_error>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #CALA
 long @C_lua_pushvfstring
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_concat
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_error ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__error_154 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaL_fileresult

 alignl ' align long
C_luaL__fileresult ' <symbol:luaL_fileresult>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_errno
 mov r22, RI ' reg <- INDIRI4 addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_luaL__fileresult_157 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaL__fileresult_156 ' JUMPV addrg
C_luaL__fileresult_157
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__fileresult_162 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strerror ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__fileresult_163 ' JUMPV addrg
C_luaL__fileresult_162
 jmp #LODL
 long @C_luaL__fileresult_159_L000160
 mov r17, RI ' reg <- addrg
C_luaL__fileresult_163
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__fileresult_164 ' EQU4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__fileresult_166_L000167
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaL__fileresult_165 ' JUMPV addrg
C_luaL__fileresult_164
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
C_luaL__fileresult_165
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #3 ' reg <- coni
C_luaL__fileresult_156
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaL_execresult

 alignl ' align long
C_luaL__execresult ' <symbol:luaL_execresult>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 cmps r21, r22 wz
 jmp #BR_Z
 long @C_luaL__execresult_169 ' EQI4
 jmp #LODI
 long @C_errno
 mov r20, RI ' reg <- INDIRI4 addrg
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaL__execresult_169 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__execresult_168 ' JUMPV addrg
C_luaL__execresult_169
 jmp #LODL
 long @C_luaL__execresult_171_L000172
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #101 wz
 jmp #BRNZ
 long @C_luaL__execresult_173 ' NEI4
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_luaL__execresult_173 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__execresult_174 ' JUMPV addrg
C_luaL__execresult_173
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
C_luaL__execresult_174
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #3 ' reg <- coni
C_luaL__execresult_168
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaL_newmetatable

 alignl ' align long
C_luaL__newmetatable ' <symbol:luaL_newmetatable>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaL__newmetatable_176 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaL__newmetatable_175 ' JUMPV addrg
C_luaL__newmetatable_176
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_luaL__typeerror_130_L000131
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_luaL__newmetatable_175
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_setmetatable

 alignl ' align long
C_luaL__setmetatable ' <symbol:luaL_setmetatable>
 jmp #NEWF
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
' C_luaL__setmetatable_178 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_testudata

 alignl ' align long
C_luaL__testudata ' <symbol:luaL_testudata>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__testudata_180 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaL__testudata_182 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawequal
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__testudata_184 ' NEI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaL__testudata_184
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 jmp #JMPA
 long @C_luaL__testudata_179 ' JUMPV addrg
C_luaL__testudata_182
C_luaL__testudata_180
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_luaL__testudata_179
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaL_checkudata

 alignl ' align long
C_luaL__checkudata ' <symbol:luaL_checkudata>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__testudata
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__checkudata_187 ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_luaL__checkudata_187
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaL__checkudata_186 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_checkoption

 alignl ' align long
C_luaL__checkoption ' <symbol:luaL_checkoption>
 jmp #NEWF
 jmp #PSHM
 long $eaa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__checkoption_190 ' EQU4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__checkoption_191 ' JUMPV addrg
C_luaL__checkoption_190
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
C_luaL__checkoption_191
 mov r13, r11 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaL__checkoption_195 ' JUMPV addrg
C_luaL__checkoption_192
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__checkoption_196 ' NEI4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__checkoption_188 ' JUMPV addrg
C_luaL__checkoption_196
' C_luaL__checkoption_193 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_luaL__checkoption_195
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__checkoption_192 ' NEU4
 mov r2, r13 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__checkoption_198_L000199
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaL__checkoption_188
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_checkstack

 alignl ' align long
C_luaL__checkstack ' <symbol:luaL_checkstack>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__checkstack_201 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__checkstack_203 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__checkstack_205_L000206
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaL__checkstack_204 ' JUMPV addrg
C_luaL__checkstack_203
 jmp #LODL
 long @C_luaL__checkstack_207_L000208
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_luaL__checkstack_204
C_luaL__checkstack_201
' C_luaL__checkstack_200 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_checktype

 alignl ' align long
C_luaL__checktype ' <symbol:luaL_checktype>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0, r19 wz
 jmp #BR_Z
 long @C_luaL__checktype_210 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2cs_696dde36_tag_error_L000138
 add SP, #8 ' CALL addrg
C_luaL__checktype_210
' C_luaL__checktype_209 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_checkany

 alignl ' align long
C_luaL__checkany ' <symbol:luaL_checkany>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_luaL__checkany_213 ' NEI4
 jmp #LODL
 long @C_luaL__checkany_215_L000216
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_luaL__checkany_213
' C_luaL__checkany_212 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_checklstring

 alignl ' align long
C_luaL__checklstring ' <symbol:luaL_checklstring>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
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
 long @C_luaL__checklstring_218 ' NEU4
 mov r2, #4 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2cs_696dde36_tag_error_L000138
 add SP, #8 ' CALL addrg
C_luaL__checklstring_218
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaL__checklstring_217 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_optlstring

 alignl ' align long
C_luaL__optlstring ' <symbol:luaL_optlstring>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BR_A
 long @C_luaL__optlstring_221 ' GTI4
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__optlstring_223 ' EQU4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__optlstring_226 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__optlstring_227 ' JUMPV addrg
C_luaL__optlstring_226
 mov r15, #0 ' reg <- coni
C_luaL__optlstring_227
 mov RI, r17
 mov BC, r15
 jmp #WLNG ' ASGNU4 reg reg
C_luaL__optlstring_223
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__optlstring_220 ' JUMPV addrg
C_luaL__optlstring_221
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaL__optlstring_220
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_checknumber

 alignl ' align long
C_luaL__checknumber ' <symbol:luaL_checknumber>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__checknumber_229 ' NEI4
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2cs_696dde36_tag_error_L000138
 add SP, #8 ' CALL addrg
C_luaL__checknumber_229
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 regl
' C_luaL__checknumber_228 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaL_optnumber

 alignl ' align long
C_luaL__optnumber ' <symbol:luaL_optnumber>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_luaL__optnumber_233 ' GTI4
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__optnumber_234 ' JUMPV addrg
C_luaL__optnumber_233
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_luaL__optnumber_234
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaL__optnumber_231 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c17_696dde36_interror_L000235 ' <symbol:interror>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isnumber
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sv2c17_696dde36_interror_L000235_237 ' EQI4
 jmp #LODL
 long @C_sv2c17_696dde36_interror_L000235_239_L000240
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sv2c17_696dde36_interror_L000235_238 ' JUMPV addrg
C_sv2c17_696dde36_interror_L000235_237
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2cs_696dde36_tag_error_L000138
 add SP, #8 ' CALL addrg
C_sv2c17_696dde36_interror_L000235_238
' C_sv2c17_696dde36_interror_L000235_236 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_checkinteger

 alignl ' align long
C_luaL__checkinteger ' <symbol:luaL_checkinteger>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__checkinteger_242 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c17_696dde36_interror_L000235
 add SP, #4 ' CALL addrg
C_luaL__checkinteger_242
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_luaL__checkinteger_241 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaL_optinteger

 alignl ' align long
C_luaL__optinteger ' <symbol:luaL_optinteger>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_luaL__optinteger_246 ' GTI4
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__optinteger_247 ' JUMPV addrg
C_luaL__optinteger_246
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_luaL__optinteger_247
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaL__optinteger_244 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c19_696dde36_resizebox_L000248 ' <symbol:resizebox>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getallocf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRU4 reg
 mov RI, r17
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #12 ' CALL indirect
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_sv2c19_696dde36_resizebox_L000248_250 ' NEU4
 cmp r19, r22 wz
 jmp #BR_Z
 long @C_sv2c19_696dde36_resizebox_L000248_250 ' EQU4
 jmp #LODL
 long @C_sv2c19_696dde36_resizebox_L000248_252_L000253
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_error ' CALL addrg
C_sv2c19_696dde36_resizebox_L000248_250
 mov RI, r17
 mov BC, r15
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_sv2c19_696dde36_resizebox_L000248_249 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sv2c1b_696dde36_boxgc_L000254 ' <symbol:boxgc>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c19_696dde36_resizebox_L000248
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_sv2c1b_696dde36_boxgc_L000254_255 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sv2c1c_696dde36_boxmt_L000256 ' <symbol:boxmt>
 long @C_sv2c1d_696dde36_257_L000258
 long @C_sv2c1b_696dde36_boxgc_L000254
 long @C_sv2c1e_696dde36_259_L000260
 long @C_sv2c1b_696dde36_boxgc_L000254
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sv2c1f_696dde36_newbox_L000261 ' <symbol:newbox>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #8 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #LODL
 long @C_sv2c1f_696dde36_newbox_L000261_265_L000266
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__newmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sv2c1f_696dde36_newbox_L000261_263 ' EQI4
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_sv2c1c_696dde36_boxmt_L000256
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
C_sv2c1f_696dde36_newbox_L000261_263
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
' C_sv2c1f_696dde36_newbox_L000261_262 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c1h_696dde36_newbuffsize_L000267 ' <symbol:newbuffsize>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #3 ' reg <- coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 shr r20, #1 ' RSHU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 sub r22, r21 ' SUBU (1)
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_sv2c1h_696dde36_newbuffsize_L000267_269 ' GEU4
 jmp #LODL
 long @C_sv2c1h_696dde36_newbuffsize_L000267_271_L000272
 mov r2, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sv2c1h_696dde36_newbuffsize_L000267_268 ' JUMPV addrg
C_sv2c1h_696dde36_newbuffsize_L000267_269
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, r21 ' ADDU (1)
 cmp r19, r22 wz,wc 
 jmp #BRAE
 long @C_sv2c1h_696dde36_newbuffsize_L000267_273 ' GEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r19, r22 ' ADDU
 add r19, r21 ' ADDU (3)
C_sv2c1h_696dde36_newbuffsize_L000267_273
 mov r0, r19 ' CVI, CVU or LOAD
C_sv2c1h_696dde36_newbuffsize_L000267_268
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c1j_696dde36_prepbuffsize_L000275 ' <symbol:prepbuffsize>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 cmp r22, r21 wz,wc 
 jmp #BR_B
 long @C_sv2c1j_696dde36_prepbuffsize_L000275_277' LTU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_sv2c1j_696dde36_prepbuffsize_L000275_276 ' JUMPV addrg
C_sv2c1j_696dde36_prepbuffsize_L000275_277
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1h_696dde36_newbuffsize_L000267
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_sv2c1j_696dde36_prepbuffsize_L000275_279 ' EQU4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c19_696dde36_resizebox_L000248
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_sv2c1j_696dde36_prepbuffsize_L000275_280 ' JUMPV addrg
C_sv2c1j_696dde36_prepbuffsize_L000275_279
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sv2c1f_696dde36_newbox_L000261 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #CALA
 long @C_sv2c19_696dde36_resizebox_L000248
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_sv2c1j_696dde36_prepbuffsize_L000275_280
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_sv2c1j_696dde36_prepbuffsize_L000275_276
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaL_prepbuffsize

 alignl ' align long
C_luaL__prepbuffsize ' <symbol:luaL_prepbuffsize>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1j_696dde36_prepbuffsize_L000275
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__prepbuffsize_281 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_addlstring

 alignl ' align long
C_luaL__addlstring ' <symbol:luaL_addlstring>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 jmp #BR_Z
 long @C_luaL__addlstring_283 ' EQU4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1j_696dde36_prepbuffsize_L000275
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, r19 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_luaL__addlstring_283
' C_luaL__addlstring_282 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaL_addstring

 alignl ' align long
C_luaL__addstring ' <symbol:luaL_addstring>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
' C_luaL__addstring_285 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_pushresult

 alignl ' align long
C_luaL__pushresult ' <symbol:luaL_pushresult>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRU4 reg
 mov RI, r23
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_luaL__pushresult_287 ' EQU4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_closeslot
 add SP, #4 ' CALL addrg
C_luaL__pushresult_287
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_luaL__pushresult_286 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_pushresultsize

 alignl ' align long
C_luaL__pushresultsize ' <symbol:luaL_pushresultsize>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, r21 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__pushresult ' CALL addrg
' C_luaL__pushresultsize_289 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_addvalue

 alignl ' align long
C_luaL__addvalue ' <symbol:luaL_addvalue>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1j_696dde36_prepbuffsize_L000275
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 regl
 add r20, r18 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_luaL__addvalue_290 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaL_buffinit

 alignl ' align long
C_luaL__buffinit ' <symbol:luaL_buffinit>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #256 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
' C_luaL__buffinit_291 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_buffinitsize

 alignl ' align long
C_luaL__buffinitsize ' <symbol:luaL_buffinitsize>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1j_696dde36_prepbuffsize_L000275
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__buffinitsize_292 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_ref

 alignl ' align long
C_luaL__ref ' <symbol:luaL_ref>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__ref_294 ' NEI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaL__ref_293 ' JUMPV addrg
C_luaL__ref_294
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__ref_296 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaL__ref_297 ' JUMPV addrg
C_luaL__ref_296
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_luaL__ref_297
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_luaL__ref_298 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaL__ref_299 ' JUMPV addrg
C_luaL__ref_298
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawlen
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
C_luaL__ref_299
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_luaL__ref_293
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_unref

 alignl ' align long
C_luaL__unref ' <symbol:luaL_unref>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz,wc
 jmp #BR_B
 long @C_luaL__unref_301 ' LTI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
C_luaL__unref_301
' C_luaL__unref_300 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c1k_696dde36_getF__L000303 ' <symbol:getF>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r21 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_sv2c1k_696dde36_getF__L000303_305 ' LEI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sv2c1k_696dde36_getF__L000303_306 ' JUMPV addrg
C_sv2c1k_696dde36_getF__L000303_305
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sv2c1k_696dde36_getF__L000303_307 ' EQI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sv2c1k_696dde36_getF__L000303_304 ' JUMPV addrg
C_sv2c1k_696dde36_getF__L000303_307
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long 512
 mov r3, RI ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r17
 adds r5, #8 ' ADDP4 coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_fread
 add SP, #12 ' CALL addrg
 mov RI, r19
 mov BC, r0
 jmp #WLNG ' ASGNU4 reg reg
C_sv2c1k_696dde36_getF__L000303_306
 mov r0, r17
 adds r0, #8 ' ADDP4 coni
C_sv2c1k_696dde36_getF__L000303_304
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c1l_696dde36_errfile_L000309 ' <symbol:errfile>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_errno
 mov r22, RI ' reg <- INDIRI4 addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sv2c1l_696dde36_errfile_L000309_311 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strerror ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c1l_696dde36_errfile_L000309_313_L000314
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_sv2c1l_696dde36_errfile_L000309_312 ' JUMPV addrg
C_sv2c1l_696dde36_errfile_L000309_311
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c1l_696dde36_errfile_L000309_315_L000316
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
C_sv2c1l_696dde36_errfile_L000309_312
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #6 ' reg <- coni
' C_sv2c1l_696dde36_errfile_L000309_310 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sv2c1o_696dde36_skipB_O_M__L000317 ' <symbol:skipBOM>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #239 wz
 jmp #BRNZ
 long @C_sv2c1o_696dde36_skipB_O_M__L000317_319 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #187 wz
 jmp #BRNZ
 long @C_sv2c1o_696dde36_skipB_O_M__L000317_319 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 cmps r0,  #191 wz
 jmp #BRNZ
 long @C_sv2c1o_696dde36_skipB_O_M__L000317_319 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sv2c1o_696dde36_skipB_O_M__L000317_318 ' JUMPV addrg
C_sv2c1o_696dde36_skipB_O_M__L000317_319
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_sv2c1o_696dde36_skipB_O_M__L000317_318
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sv2c1p_696dde36_skipcomment_L000321 ' <symbol:skipcomment>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sv2c1o_696dde36_skipB_O_M__L000317 ' CALL addrg
 mov RI, r21
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #35 wz
 jmp #BRNZ
 long @C_sv2c1p_696dde36_skipcomment_L000321_323 ' NEI4
C_sv2c1p_696dde36_skipcomment_L000321_325
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
' C_sv2c1p_696dde36_skipcomment_L000321_326 ' (symbol refcount = 0)
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sv2c1p_696dde36_skipcomment_L000321_328 ' EQI4
 cmps r19,  #10 wz
 jmp #BRNZ
 long @C_sv2c1p_696dde36_skipcomment_L000321_325 ' NEI4
C_sv2c1p_696dde36_skipcomment_L000321_328
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov RI, r21
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sv2c1p_696dde36_skipcomment_L000321_322 ' JUMPV addrg
C_sv2c1p_696dde36_skipcomment_L000321_323
 mov r0, #0 ' reg <- coni
C_sv2c1p_696dde36_skipcomment_L000321_322
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_loadfilex

 alignl ' align long
C_luaL__loadfilex ' <symbol:luaL_loadfilex>
 jmp #NEWF
 jmp #LODL
 long 532
 sub SP, RI
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0
 adds r17, #1 ' ADDI4 coni
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__loadfilex_330 ' NEU4
 jmp #LODL
 long @C_luaL__loadfilex_332_L000333
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C___stdin
 mov r22, RI ' reg <- addrg
 jmp #LODF
 long -520
 wrlong r22 , RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaL__loadfilex_331 ' JUMPV addrg
C_luaL__loadfilex_330
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__loadfilex_335_L000336
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_luaL__loadfilex_338_L000339
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -520
 wrlong r0, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -520
 rdlong r22, RI ' reg <- INDIRP4 addrl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__loadfilex_340 ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__loadfilex_343_L000344
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1l_696dde36_errfile_L000309
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__loadfilex_329 ' JUMPV addrg
C_luaL__loadfilex_340
C_luaL__loadfilex_331
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -524
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -528
 mov r2, RI ' reg ARG ADDRL
 jmp #LODF
 long -520
 rdlong r3, RI ' reg ARG INDIR ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1p_696dde36_skipcomment_L000321
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaL__loadfilex_345 ' EQI4
 jmp #LODF
 long -524
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 jmp #LODF
 long -524
 wrlong r20, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -516
 mov r20, RI ' reg <- addrl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #10 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaL__loadfilex_345
 jmp #LODF
 long -528
 rdlong r22, RI ' reg <- INDIRI4 addrl
 jmp #LODL
 long @C_luaL__loadfilex_351_L000352
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 addrg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaL__loadfilex_349 ' NEI4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -524
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__loadfilex_353 ' EQU4
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODF
 long -520
 rdlong r2, RI ' reg ARG INDIR ADDRL
 jmp #LODL
 long @C_luaL__loadfilex_356_L000357
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_freopen
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -520
 wrlong r0, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -520
 rdlong r22, RI ' reg <- INDIRP4 addrl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__loadfilex_359 ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__loadfilex_362_L000363
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1l_696dde36_errfile_L000309
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__loadfilex_329 ' JUMPV addrg
C_luaL__loadfilex_359
 jmp #LODF
 long -528
 mov r2, RI ' reg ARG ADDRL
 jmp #LODF
 long -520
 rdlong r3, RI ' reg ARG INDIR ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1p_696dde36_skipcomment_L000321
 add SP, #4 ' CALL addrg
C_luaL__loadfilex_353
C_luaL__loadfilex_349
 jmp #LODF
 long -528
 rdlong r22, RI ' reg <- INDIRI4 addrl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaL__loadfilex_365 ' EQI4
 jmp #LODF
 long -524
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 jmp #LODF
 long -524
 wrlong r20, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -516
 mov r20, RI ' reg <- addrl
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -528
 rdlong r20, RI ' reg <- INDIRI4 addrl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaL__loadfilex_365
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODF
 long -524
 mov r4, RI ' reg ARG ADDRL
 jmp #LODL
 long @C_sv2c1k_696dde36_getF__L000303
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_load
 add SP, #16 ' CALL addrg
 jmp #LODF
 long -532
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -520
 rdlong r22, RI ' reg <- INDIRP4 addrl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__loadfilex_370 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaL__loadfilex_371 ' JUMPV addrg
C_luaL__loadfilex_370
 mov r15, #0 ' reg <- coni
C_luaL__loadfilex_371
 jmp #LODF
 long -536
 wrlong r15, RI ' ASGNI4 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__loadfilex_372 ' EQU4
 jmp #LODF
 long -520
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
C_luaL__loadfilex_372
 jmp #LODF
 long -536
 rdlong r22, RI ' reg <- INDIRI4 addrl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__loadfilex_375 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__loadfilex_377_L000378
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c1l_696dde36_errfile_L000309
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__loadfilex_329 ' JUMPV addrg
C_luaL__loadfilex_375
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -532
 rdlong r0, RI ' reg <- INDIRI4 addrl
C_luaL__loadfilex_329
 jmp #POPM ' restore registers
 jmp #LODL
 long 532
 add SP, RI ' framesize
 jmp #RETF


 alignl ' align long
C_sv2c22_696dde36_getS__L000379 ' <symbol:getS>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sv2c22_696dde36_getS__L000379_381 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sv2c22_696dde36_getS__L000379_380 ' JUMPV addrg
C_sv2c22_696dde36_getS__L000379_381
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r0, BC ' reg <- INDIRP4 reg
C_sv2c22_696dde36_getS__L000379_380
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaL_loadbufferx

 alignl ' align long
C_luaL__loadbufferx ' <symbol:luaL_loadbufferx>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
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
 jmp #LODL
 long @C_sv2c22_696dde36_getS__L000379
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_load
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__loadbufferx_383 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaL_loadstring

 alignl ' align long
C_luaL__loadstring ' <symbol:luaL_loadstring>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaL__loadbufferx
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__loadstring_385 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_getmetafield

 alignl ' align long
C_luaL__getmetafield ' <symbol:luaL_getmetafield>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__getmetafield_387 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaL__getmetafield_386 ' JUMPV addrg
C_luaL__getmetafield_387
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawget
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__getmetafield_389 ' NEI4
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__getmetafield_390 ' JUMPV addrg
C_luaL__getmetafield_389
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_luaL__getmetafield_390
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_luaL__getmetafield_386
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaL_callmeta

 alignl ' align long
C_luaL__callmeta ' <symbol:luaL_callmeta>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__callmeta_392 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaL__callmeta_391 ' JUMPV addrg
C_luaL__callmeta_392
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r22, #1 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_luaL__callmeta_391
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_len

 alignl ' align long
C_luaL__len ' <symbol:luaL_len>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_len
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__len_395 ' NEI4
 jmp #LODL
 long @C_luaL__len_397_L000398
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_luaL__len_395
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_luaL__len_394 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaL_tolstring

 alignl ' align long
C_luaL__tolstring ' <symbol:luaL_tolstring>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__tolstring_402_L000403
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__callmeta
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaL__tolstring_400 ' EQI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__tolstring_401 ' NEI4
 jmp #LODL
 long @C_luaL__tolstring_406_L000407
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__tolstring_401 ' JUMPV addrg
C_luaL__tolstring_400
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_luaL__tolstring_408 ' LTI4
 cmps r17,  #4 wz,wc
 jmp #BR_A
 long @C_luaL__tolstring_408 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaL__tolstring_437_L000439
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaL__tolstring_437_L000439 ' <symbol:437>
 long @C_luaL__tolstring_427
 long @C_luaL__tolstring_419
 long @C_luaL__tolstring_408
 long @C_luaL__tolstring_411
 long @C_luaL__tolstring_418

' Catalina Code

DAT ' code segment
C_luaL__tolstring_411
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaL__tolstring_412 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__tolstring_414_L000415
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaL__tolstring_409 ' JUMPV addrg
C_luaL__tolstring_412
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__tolstring_416_L000417
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaL__tolstring_409 ' JUMPV addrg
C_luaL__tolstring_418
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__tolstring_409 ' JUMPV addrg
C_luaL__tolstring_419
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__tolstring_425 ' EQI4
 jmp #LODL
 long @C_luaL__tolstring_420_L000421
 mov r15, RI ' reg <- addrg
 jmp #JMPA
 long @C_luaL__tolstring_426 ' JUMPV addrg
C_luaL__tolstring_425
 jmp #LODL
 long @C_luaL__tolstring_422_L000423
 mov r15, RI ' reg <- addrg
C_luaL__tolstring_426
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__tolstring_409 ' JUMPV addrg
C_luaL__tolstring_427
 jmp #LODL
 long @C_luaL__tolstring_428_L000429
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__tolstring_409 ' JUMPV addrg
C_luaL__tolstring_408
 jmp #LODL
 long @C_luaL__typeerror_130_L000131
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #4 wz
 jmp #BRNZ
 long @C_luaL__tolstring_431 ' NEI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__tolstring_432 ' JUMPV addrg
C_luaL__tolstring_431
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_luaL__tolstring_432
 mov RI, FP
 sub RI, #-(-12)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_luaL__tolstring_433_L000434
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__tolstring_409 ' EQI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_luaL__tolstring_409
C_luaL__tolstring_401
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__tolstring_399 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaL_setfuncs

 alignl ' align long
C_luaL__setfuncs ' <symbol:luaL_setfuncs>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_luaL__setfuncs_441_L000442
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaL__setfuncs_446 ' JUMPV addrg
C_luaL__setfuncs_443
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__setfuncs_447 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__setfuncs_448 ' JUMPV addrg
C_luaL__setfuncs_447
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaL__setfuncs_452 ' JUMPV addrg
C_luaL__setfuncs_449
 neg r2, r19 ' NEGI4
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
' C_luaL__setfuncs_450 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_luaL__setfuncs_452
 cmps r17, r19 wz,wc
 jmp #BR_B
 long @C_luaL__setfuncs_449 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
C_luaL__setfuncs_448
 mov RI, r21
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #2 ' ADDI4 coni
 neg r3, r22 ' NEGI4
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
' C_luaL__setfuncs_444 ' (symbol refcount = 0)
 adds r21, #8 ' ADDP4 coni
C_luaL__setfuncs_446
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__setfuncs_443 ' NEU4
 neg r22, r19 ' NEGI4
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_luaL__setfuncs_440 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_getsubtable

 alignl ' align long
C_luaL__getsubtable ' <symbol:luaL_getsubtable>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BRNZ
 long @C_luaL__getsubtable_454 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaL__getsubtable_453 ' JUMPV addrg
C_luaL__getsubtable_454
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
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
 long @C_lua_absindex
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_luaL__getsubtable_453
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_requiref

 alignl ' align long
C_luaL__requiref ' <symbol:luaL_requiref>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_sv2c2_696dde36_pushglobalfuncname_L000020_24_L000025
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getsubtable
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaL__requiref_457 ' NEI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r22, #1 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long -3
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
C_luaL__requiref_457
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_luaL__requiref_459 ' EQI4
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setglobal
 add SP, #4 ' CALL addrg
C_luaL__requiref_459
' C_luaL__requiref_456 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_addgsub

 alignl ' align long
C_luaL__addgsub ' <symbol:luaL_addgsub>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaL__addgsub_463 ' JUMPV addrg
C_luaL__addgsub_462
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 mov r21, r13 ' ADDI/P
 adds r21, r15 ' ADDI/P (3)
C_luaL__addgsub_463
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strstr
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaL__addgsub_462 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
' C_luaL__addgsub_461 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_gsub

 alignl ' align long
C_luaL__gsub ' <symbol:luaL_gsub>
 jmp #NEWF
 sub SP, #272
 jmp #PSHM
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
 jmp #CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-276) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addgsub
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__pushresult ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaL__gsub_465 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #272 ' framesize
 jmp #RETF


 alignl ' align long
C_sv2c2f_696dde36_l_alloc_L000466 ' <symbol:l_alloc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmp r17,  #0 wz
 jmp #BRNZ
 long @C_sv2c2f_696dde36_l_alloc_L000466_468 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sv2c2f_696dde36_l_alloc_L000466_467 ' JUMPV addrg
C_sv2c2f_696dde36_l_alloc_L000466_468
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_realloc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sv2c2f_696dde36_l_alloc_L000466_470 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sv2c2f_696dde36_l_alloc_L000466_472 ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sv2c2f_696dde36_l_alloc_L000466_473 ' JUMPV addrg
C_sv2c2f_696dde36_l_alloc_L000466_472
 cmp r17, r19 wz,wc 
 jmp #BRBE
 long @C_sv2c2f_696dde36_l_alloc_L000466_474 ' LEU4
 mov r2, r17 ' SUBU
 sub r2, r19 ' SUBU (3)
 mov r3, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r4, r19 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
C_sv2c2f_696dde36_l_alloc_L000466_474
C_sv2c2f_696dde36_l_alloc_L000466_473
C_sv2c2f_696dde36_l_alloc_L000466_470
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
C_sv2c2f_696dde36_l_alloc_L000466_467
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sv2c2g_696dde36_panic_L000476 ' <symbol:panic>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #4 wz
 jmp #BRNZ
 long @C_sv2c2g_696dde36_panic_L000476_481 ' NEI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sv2c2g_696dde36_panic_L000476_482 ' JUMPV addrg
C_sv2c2g_696dde36_panic_L000476_481
 jmp #LODL
 long @C_sv2c2g_696dde36_panic_L000476_478_L000479
 mov r21, RI ' reg <- addrg
C_sv2c2g_696dde36_panic_L000476_482
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_sv2c2g_696dde36_panic_L000476_483_L000484
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___stderr
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C___stderr
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_sv2c2g_696dde36_panic_L000476_477 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sv2c2m_696dde36_checkcontrol_L000488 ' <symbol:checkcontrol>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_sv2c2m_696dde36_checkcontrol_L000488_492 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #64 wz
 jmp #BR_Z
 long @C_sv2c2m_696dde36_checkcontrol_L000488_490 ' EQI4
C_sv2c2m_696dde36_checkcontrol_L000488_492
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sv2c2m_696dde36_checkcontrol_L000488_489 ' JUMPV addrg
C_sv2c2m_696dde36_checkcontrol_L000488_490
 jmp #LODL
 long @C_sv2c2m_696dde36_checkcontrol_L000488_495_L000496
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sv2c2m_696dde36_checkcontrol_L000488_493 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c2j_696dde36_warnfoff_L000485
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sv2c2m_696dde36_checkcontrol_L000488_494 ' JUMPV addrg
C_sv2c2m_696dde36_checkcontrol_L000488_493
 jmp #LODL
 long @C_sv2c2m_696dde36_checkcontrol_L000488_499_L000500
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sv2c2m_696dde36_checkcontrol_L000488_497 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c2k_696dde36_warnfon_L000486
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
C_sv2c2m_696dde36_checkcontrol_L000488_497
C_sv2c2m_696dde36_checkcontrol_L000488_494
 mov r0, #1 ' reg <- coni
C_sv2c2m_696dde36_checkcontrol_L000488_489
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c2j_696dde36_warnfoff_L000485 ' <symbol:warnfoff>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c2m_696dde36_checkcontrol_L000488
 add SP, #8 ' CALL addrg
' C_sv2c2j_696dde36_warnfoff_L000485_501 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c2l_696dde36_warnfcont_L000487 ' <symbol:warnfcont>
 jmp #NEWF
 jmp #PSHM
 long $aa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r23 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c2l_696dde36_warnfcont_L000487_503_L000504
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___stderr
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C___stderr
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sv2c2l_696dde36_warnfcont_L000487_505 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c2l_696dde36_warnfcont_L000487
 mov r3, RI ' reg ARG ADDRG
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sv2c2l_696dde36_warnfcont_L000487_506 ' JUMPV addrg
C_sv2c2l_696dde36_warnfcont_L000487_505
 jmp #LODL
 long @C_sv2c2l_696dde36_warnfcont_L000487_507_L000508
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_sv2c2l_696dde36_warnfcont_L000487_503_L000504
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___stderr
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C___stderr
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c2k_696dde36_warnfon_L000486
 mov r3, RI ' reg ARG ADDRG
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
C_sv2c2l_696dde36_warnfcont_L000487_506
' C_sv2c2l_696dde36_warnfcont_L000487_502 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sv2c2k_696dde36_warnfon_L000486 ' <symbol:warnfon>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c2m_696dde36_checkcontrol_L000488
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sv2c2k_696dde36_warnfon_L000486_510 ' EQI4
 jmp #JMPA
 long @C_sv2c2k_696dde36_warnfon_L000486_509 ' JUMPV addrg
C_sv2c2k_696dde36_warnfon_L000486_510
 jmp #LODL
 long @C_sv2c2k_696dde36_warnfon_L000486_512_L000513
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_sv2c2l_696dde36_warnfcont_L000487_503_L000504
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___stderr
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C___stderr
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sv2c2l_696dde36_warnfcont_L000487
 add SP, #8 ' CALL addrg
C_sv2c2k_696dde36_warnfon_L000486_509
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_newstate

 alignl ' align long
C_luaL__newstate ' <symbol:luaL_newstate>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_sv2c2f_696dde36_l_alloc_L000466
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_newstate
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaL__newstate_515 ' EQU4
 jmp #LODL
 long @C_sv2c2g_696dde36_panic_L000476
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_atpanic
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sv2c2j_696dde36_warnfoff_L000485
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setwarnf
 add SP, #8 ' CALL addrg
C_luaL__newstate_515
 mov r0, r23 ' CVI, CVU or LOAD
' C_luaL__newstate_514 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaL_checkversion_

 alignl ' align long
C_luaL__checkversion_ ' <symbol:luaL_checkversion_>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_version ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 cmp r19,  #68 wz
 jmp #BR_Z
 long @C_luaL__checkversion__518 ' EQU4
 jmp #LODL
 long @C_luaL__checkversion__520_L000521
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaL__checkversion__519 ' JUMPV addrg
C_luaL__checkversion__518
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_luaL__checkversion__522 ' EQF4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaL__checkversion__524_L000525
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
C_luaL__checkversion__522
C_luaL__checkversion__519
' C_luaL__checkversion__517 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


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
C_luaL__checkversion__524_L000525 ' <symbol:524>
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
C_luaL__checkversion__520_L000521 ' <symbol:520>
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
C_sv2c2k_696dde36_warnfon_L000486_512_L000513 ' <symbol:512>
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
C_sv2c2l_696dde36_warnfcont_L000487_507_L000508 ' <symbol:507>
 byte 10
 byte 0

 alignl ' align long
C_sv2c2l_696dde36_warnfcont_L000487_503_L000504 ' <symbol:503>
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_sv2c2m_696dde36_checkcontrol_L000488_499_L000500 ' <symbol:499>
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sv2c2m_696dde36_checkcontrol_L000488_495_L000496 ' <symbol:495>
 byte 111
 byte 102
 byte 102
 byte 0

 alignl ' align long
C_sv2c2g_696dde36_panic_L000476_483_L000484 ' <symbol:483>
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
C_sv2c2g_696dde36_panic_L000476_478_L000479 ' <symbol:478>
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
C_luaL__setfuncs_441_L000442 ' <symbol:441>
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
C_luaL__tolstring_433_L000434 ' <symbol:433>
 byte 37
 byte 115
 byte 58
 byte 32
 byte 37
 byte 112
 byte 0

 alignl ' align long
C_luaL__tolstring_428_L000429 ' <symbol:428>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_luaL__tolstring_422_L000423 ' <symbol:422>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_luaL__tolstring_420_L000421 ' <symbol:420>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_luaL__tolstring_416_L000417 ' <symbol:416>
 byte 37
 byte 102
 byte 0

 alignl ' align long
C_luaL__tolstring_414_L000415 ' <symbol:414>
 byte 37
 byte 73
 byte 0

 alignl ' align long
C_luaL__tolstring_406_L000407 ' <symbol:406>
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
C_luaL__tolstring_402_L000403 ' <symbol:402>
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
C_luaL__len_397_L000398 ' <symbol:397>
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
C_luaL__loadfilex_377_L000378 ' <symbol:377>
 byte 114
 byte 101
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_luaL__loadfilex_362_L000363 ' <symbol:362>
 byte 114
 byte 101
 byte 111
 byte 112
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_luaL__loadfilex_356_L000357 ' <symbol:356>
 byte 114
 byte 98
 byte 0

 alignl ' align long
C_luaL__loadfilex_351_L000352 ' <symbol:351>
 byte 27
 byte 76
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_luaL__loadfilex_343_L000344 ' <symbol:343>
 byte 111
 byte 112
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_luaL__loadfilex_338_L000339 ' <symbol:338>
 byte 114
 byte 0

 alignl ' align long
C_luaL__loadfilex_335_L000336 ' <symbol:335>
 byte 64
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaL__loadfilex_332_L000333 ' <symbol:332>
 byte 61
 byte 115
 byte 116
 byte 100
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sv2c1l_696dde36_errfile_L000309_315_L000316 ' <symbol:315>
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
 byte 0

 alignl ' align long
C_sv2c1l_696dde36_errfile_L000309_313_L000314 ' <symbol:313>
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
C_sv2c1h_696dde36_newbuffsize_L000267_271_L000272 ' <symbol:271>
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
C_sv2c1f_696dde36_newbox_L000261_265_L000266 ' <symbol:265>
 byte 95
 byte 85
 byte 66
 byte 79
 byte 88
 byte 42
 byte 0

 alignl ' align long
C_sv2c1e_696dde36_259_L000260 ' <symbol:259>
 byte 95
 byte 95
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_sv2c1d_696dde36_257_L000258 ' <symbol:257>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_sv2c19_696dde36_resizebox_L000248_252_L000253 ' <symbol:252>
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
C_sv2c17_696dde36_interror_L000235_239_L000240 ' <symbol:239>
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
C_luaL__checkany_215_L000216 ' <symbol:215>
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
C_luaL__checkstack_207_L000208 ' <symbol:207>
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
C_luaL__checkstack_205_L000206 ' <symbol:205>
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
C_luaL__checkoption_198_L000199 ' <symbol:198>
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
C_luaL__execresult_171_L000172 ' <symbol:171>
 byte 101
 byte 120
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_luaL__fileresult_166_L000167 ' <symbol:166>
 byte 37
 byte 115
 byte 58
 byte 32
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaL__fileresult_159_L000160 ' <symbol:159>
 byte 40
 byte 110
 byte 111
 byte 32
 byte 101
 byte 120
 byte 116
 byte 114
 byte 97
 byte 32
 byte 105
 byte 110
 byte 102
 byte 111
 byte 41
 byte 0

 alignl ' align long
C_luaL__where_152_L000153 ' <symbol:152>
 byte 0

 alignl ' align long
C_luaL__where_148_L000149 ' <symbol:148>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 100
 byte 58
 byte 32
 byte 0

 alignl ' align long
C_luaL__where_143_L000144 ' <symbol:143>
 byte 83
 byte 108
 byte 0

 alignl ' align long
C_luaL__typeerror_136_L000137 ' <symbol:136>
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
C_luaL__typeerror_134_L000135 ' <symbol:134>
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
C_luaL__typeerror_130_L000131 ' <symbol:130>
 byte 95
 byte 95
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_luaL__argerror_124_L000125 ' <symbol:124>
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
C_luaL__argerror_114_L000115 ' <symbol:114>
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
C_luaL__argerror_110_L000111 ' <symbol:110>
 byte 109
 byte 101
 byte 116
 byte 104
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_luaL__argerror_105_L000106 ' <symbol:105>
 byte 110
 byte 0

 alignl ' align long
C_luaL__argerror_103_L000104 ' <symbol:103>
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
C_luaL__traceback_98_L000099 ' <symbol:98>
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
C_luaL__traceback_91_L000092 ' <symbol:91>
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
C_luaL__traceback_88_L000089 ' <symbol:88>
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
C_luaL__traceback_83_L000084 ' <symbol:83>
 byte 83
 byte 108
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_luaL__traceback_81_L000082 ' <symbol:81>
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
C_luaL__traceback_74_L000075 ' <symbol:74>
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
C_sv2c7_696dde36_pushfuncname_L000034_52_L000053 ' <symbol:52>
 byte 63
 byte 0

 alignl ' align long
C_sv2c7_696dde36_pushfuncname_L000034_50_L000051 ' <symbol:50>
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
C_sv2c7_696dde36_pushfuncname_L000034_46_L000047 ' <symbol:46>
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
C_sv2c7_696dde36_pushfuncname_L000034_42_L000043 ' <symbol:42>
 byte 37
 byte 115
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_sv2c7_696dde36_pushfuncname_L000034_38_L000039 ' <symbol:38>
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
C_sv2c2_696dde36_pushglobalfuncname_L000020_32_L000033 ' <symbol:32>
 byte 95
 byte 71
 byte 46
 byte 0

 alignl ' align long
C_sv2c2_696dde36_pushglobalfuncname_L000020_26_L000027 ' <symbol:26>
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
 byte 0

 alignl ' align long
C_sv2c2_696dde36_pushglobalfuncname_L000020_24_L000025 ' <symbol:24>
 byte 95
 byte 76
 byte 79
 byte 65
 byte 68
 byte 69
 byte 68
 byte 0

 alignl ' align long
C_sv2c2_696dde36_pushglobalfuncname_L000020_22_L000023 ' <symbol:22>
 byte 102
 byte 0

 alignl ' align long
C_sv2c_696dde36_findfield_L000004_18_L000019 ' <symbol:18>
 byte 46
 byte 0

' Catalina Code

DAT ' code segment
' end
