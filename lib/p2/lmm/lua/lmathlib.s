' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s8sc_696ddd96_math_abs_L000004 ' <symbol:math_abs>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8sc_696ddd96_math_abs_L000004_6 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_s8sc_696ddd96_math_abs_L000004_8 ' GEI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_s8sc_696ddd96_math_abs_L000004_8
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8sc_696ddd96_math_abs_L000004_7 ' JUMPV addrg
C_s8sc_696ddd96_math_abs_L000004_6
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fabs ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_s8sc_696ddd96_math_abs_L000004_7
 mov r0, #1 ' RET coni
' C_s8sc_696ddd96_math_abs_L000004_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc1_696ddd96_math_sin_L000010 ' <symbol:math_sin>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sin ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sc1_696ddd96_math_sin_L000010_11 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc2_696ddd96_math_cos_L000012 ' <symbol:math_cos>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_cos ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sc2_696ddd96_math_cos_L000012_13 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc3_696ddd96_math_tan_L000014 ' <symbol:math_tan>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_tan ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sc3_696ddd96_math_tan_L000014_15 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc4_696ddd96_math_asin_L000016 ' <symbol:math_asin>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_asin ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sc4_696ddd96_math_asin_L000016_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc5_696ddd96_math_acos_L000018 ' <symbol:math_acos>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_acos ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sc5_696ddd96_math_acos_L000018_19 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc6_696ddd96_math_atan_L000020 ' <symbol:math_atan>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_s8sc6_696ddd96_math_atan_L000020_22_L000023
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optnumber
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_atan2
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sc6_696ddd96_math_atan_L000020_21 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc8_696ddd96_math_toint_L000024 ' <symbol:math_toint>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s8sc8_696ddd96_math_toint_L000024_26 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8sc8_696ddd96_math_toint_L000024_27 ' JUMPV addrg
C_s8sc8_696ddd96_math_toint_L000024_26
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
C_s8sc8_696ddd96_math_toint_L000024_27
 mov r0, #1 ' RET coni
' C_s8sc8_696ddd96_math_toint_L000024_25 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc9_696ddd96_pushnumint_L000028 ' <symbol:pushnumint>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_s8sc9_696ddd96_pushnumint_L000028_32_L000033
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_s8sc9_696ddd96_pushnumint_L000028_30 ' LTF4
 jmp #LODI
 long @C_s8sc9_696ddd96_pushnumint_L000028_34_L000035
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s8sc9_696ddd96_pushnumint_L000028_30 ' GEF4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s8sc9_696ddd96_pushnumint_L000028_30 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8sc9_696ddd96_pushnumint_L000028_31 ' JUMPV addrg
C_s8sc9_696ddd96_pushnumint_L000028_30
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_s8sc9_696ddd96_pushnumint_L000028_31
' C_s8sc9_696ddd96_pushnumint_L000028_29 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s8scc_696ddd96_math_floor_L000036 ' <symbol:math_floor>
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
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8scc_696ddd96_math_floor_L000036_38 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8scc_696ddd96_math_floor_L000036_39 ' JUMPV addrg
C_s8scc_696ddd96_math_floor_L000036_38
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_floor ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc9_696ddd96_pushnumint_L000028
 add SP, #4 ' CALL addrg
C_s8scc_696ddd96_math_floor_L000036_39
 mov r0, #1 ' RET coni
' C_s8scc_696ddd96_math_floor_L000036_37 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s8scd_696ddd96_math_ceil_L000040 ' <symbol:math_ceil>
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
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8scd_696ddd96_math_ceil_L000040_42 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8scd_696ddd96_math_ceil_L000040_43 ' JUMPV addrg
C_s8scd_696ddd96_math_ceil_L000040_42
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_ceil ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc9_696ddd96_pushnumint_L000028
 add SP, #4 ' CALL addrg
C_s8scd_696ddd96_math_ceil_L000040_43
 mov r0, #1 ' RET coni
' C_s8scd_696ddd96_math_ceil_L000040_41 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sce_696ddd96_math_fmod_L000044 ' <symbol:math_fmod>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s8sce_696ddd96_math_fmod_L000044_46 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8sce_696ddd96_math_fmod_L000044_46 ' EQI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r20, #1 ' ADDU4 coni
 cmp r20, r22 wcz 
 jmp #BR_A
 long @C_s8sce_696ddd96_math_fmod_L000044_48 ' GTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s8sce_696ddd96_math_fmod_L000044_52 ' NEI4
 jmp #LODL
 long @C_s8sce_696ddd96_math_fmod_L000044_50_L000051
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s8sce_696ddd96_math_fmod_L000044_52
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8sce_696ddd96_math_fmod_L000044_47 ' JUMPV addrg
C_s8sce_696ddd96_math_fmod_L000044_48
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r2, r1 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8sce_696ddd96_math_fmod_L000044_47 ' JUMPV addrg
C_s8sce_696ddd96_math_fmod_L000044_46
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fmod
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_s8sce_696ddd96_math_fmod_L000044_47
 mov r0, #1 ' RET coni
' C_s8sce_696ddd96_math_fmod_L000044_45 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s8scg_696ddd96_math_modf_L000053 ' <symbol:math_modf>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8scg_696ddd96_math_modf_L000053_55 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_s8scg_696ddd96_math_modf_L000053_57_L000058
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8scg_696ddd96_math_modf_L000053_56 ' JUMPV addrg
C_s8scg_696ddd96_math_modf_L000053_55
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s8scg_696ddd96_math_modf_L000053_57_L000058
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s8scg_696ddd96_math_modf_L000053_60 ' GEF4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_ceil ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s8scg_696ddd96_math_modf_L000053_61 ' JUMPV addrg
C_s8scg_696ddd96_math_modf_L000053_60
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_floor ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_s8scg_696ddd96_math_modf_L000053_61
 jmp #LODF
 long -8
 wrlong r19, RI ' ASGNF4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc9_696ddd96_pushnumint_L000028
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_s8scg_696ddd96_math_modf_L000053_63 ' NEF4
 jmp #LODI
 long @C_s8scg_696ddd96_math_modf_L000053_57_L000058
 mov r17, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_s8scg_696ddd96_math_modf_L000053_64 ' JUMPV addrg
C_s8scg_696ddd96_math_modf_L000053_63
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov r17, r0 ' CVI, CVU or LOAD
C_s8scg_696ddd96_math_modf_L000053_64
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_s8scg_696ddd96_math_modf_L000053_56
 mov r0, #2 ' RET coni
' C_s8scg_696ddd96_math_modf_L000053_54 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sci_696ddd96_math_sqrt_L000065 ' <symbol:math_sqrt>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sqrt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sci_696ddd96_math_sqrt_L000065_66 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8scj_696ddd96_math_ult_L000067 ' <symbol:math_ult>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
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
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmp r22, r20 wcz 
 jmp #BRAE
 long @C_s8scj_696ddd96_math_ult_L000067_70 ' GEU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_s8scj_696ddd96_math_ult_L000067_71 ' JUMPV addrg
C_s8scj_696ddd96_math_ult_L000067_70
 mov r21, #0 ' reg <- coni
C_s8scj_696ddd96_math_ult_L000067_71
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8scj_696ddd96_math_ult_L000067_68 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sck_696ddd96_math_log_L000072 ' <symbol:math_log>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 jmp #BR_A
 long @C_s8sck_696ddd96_math_log_L000072_74 ' GTI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_log ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #JMPA
 long @C_s8sck_696ddd96_math_log_L000072_75 ' JUMPV addrg
C_s8sck_696ddd96_math_log_L000072_74
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_s8sck_696ddd96_math_log_L000072_78_L000079
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_s8sck_696ddd96_math_log_L000072_76 ' NEF4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_log10 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #JMPA
 long @C_s8sck_696ddd96_math_log_L000072_77 ' JUMPV addrg
C_s8sck_696ddd96_math_log_L000072_76
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_log ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_log ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
C_s8sck_696ddd96_math_log_L000072_77
C_s8sck_696ddd96_math_log_L000072_75
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sck_696ddd96_math_log_L000072_73 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s8scm_696ddd96_math_exp_L000080 ' <symbol:math_exp>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_exp ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8scm_696ddd96_math_exp_L000080_81 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8scn_696ddd96_math_deg_L000082 ' <symbol:math_deg>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s8scn_696ddd96_math_deg_L000082_84_L000085
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8scn_696ddd96_math_deg_L000082_83 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8scp_696ddd96_math_rad_L000086 ' <symbol:math_rad>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s8scp_696ddd96_math_rad_L000086_88_L000089
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8scp_696ddd96_math_rad_L000086_87 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8scr_696ddd96_math_min_L000090 ' <symbol:math_min>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r19, #1 ' reg <- coni
 mov r22, #1 ' reg <- coni
 cmps r17, r22 wcz
 jmp #BRAE
 long @C_s8scr_696ddd96_math_min_L000090_94 ' GEI4
 jmp #LODL
 long @C_s8scr_696ddd96_math_min_L000090_92_L000093
 mov r2, RI ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s8scr_696ddd96_math_min_L000090_94
 mov r21, #2 ' reg <- coni
 jmp #JMPA
 long @C_s8scr_696ddd96_math_min_L000090_98 ' JUMPV addrg
C_s8scr_696ddd96_math_min_L000090_95
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_compare
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8scr_696ddd96_math_min_L000090_99 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
C_s8scr_696ddd96_math_min_L000090_99
' C_s8scr_696ddd96_math_min_L000090_96 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s8scr_696ddd96_math_min_L000090_98
 cmps r21, r17 wcz
 jmp #BRBE
 long @C_s8scr_696ddd96_math_min_L000090_95 ' LEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8scr_696ddd96_math_min_L000090_91 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sct_696ddd96_math_max_L000101 ' <symbol:math_max>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r19, #1 ' reg <- coni
 mov r22, #1 ' reg <- coni
 cmps r17, r22 wcz
 jmp #BRAE
 long @C_s8sct_696ddd96_math_max_L000101_103 ' GEI4
 jmp #LODL
 long @C_s8scr_696ddd96_math_min_L000090_92_L000093
 mov r2, RI ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s8sct_696ddd96_math_max_L000101_103
 mov r21, #2 ' reg <- coni
 jmp #JMPA
 long @C_s8sct_696ddd96_math_max_L000101_107 ' JUMPV addrg
C_s8sct_696ddd96_math_max_L000101_104
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_compare
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s8sct_696ddd96_math_max_L000101_108 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
C_s8sct_696ddd96_math_max_L000101_108
' C_s8sct_696ddd96_math_max_L000101_105 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s8sct_696ddd96_math_max_L000101_107
 cmps r21, r17 wcz
 jmp #BRBE
 long @C_s8sct_696ddd96_math_max_L000101_104 ' LEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_s8sct_696ddd96_math_max_L000101_102 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8scu_696ddd96_math_type_L000110 ' <symbol:math_type>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #3 wz
 jmp #BRNZ
 long @C_s8scu_696ddd96_math_type_L000110_112 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s8scu_696ddd96_math_type_L000110_119 ' EQI4
 jmp #LODL
 long @C_s8scu_696ddd96_math_type_L000110_114_L000115
 mov r21, RI ' reg <- addrg
 jmp #JMPA
 long @C_s8scu_696ddd96_math_type_L000110_120 ' JUMPV addrg
C_s8scu_696ddd96_math_type_L000110_119
 jmp #LODL
 long @C_s8scu_696ddd96_math_type_L000110_116_L000117
 mov r21, RI ' reg <- addrg
C_s8scu_696ddd96_math_type_L000110_120
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8scu_696ddd96_math_type_L000110_113 ' JUMPV addrg
C_s8scu_696ddd96_math_type_L000110_112
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
C_s8scu_696ddd96_math_type_L000110_113
 mov r0, #1 ' RET coni
' C_s8scu_696ddd96_math_type_L000110_111 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc11_696ddd96_packI__L000121 ' <symbol:packI>
 jmp #NEWF
 sub SP, #8
 jmp #LODF
 long -12
 wrlong r3, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -8
 wrlong r2, RI ' ASGNU4 addrl reg
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C_s8sc11_696ddd96_packI__L000121_122 ' (symbol refcount = 0)
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc12_696ddd96_I_shl_L000125 ' <symbol:Ishl>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' LSHI/U
 shl r2, r19 ' LSHI/U (3)
 rdlong r20, r21 ' reg <- INDIRU4 reg
 shl r20, r19 ' LSHI/U (1)
 mov r18, #32 ' reg <- coni
 subs r18, r19 ' SUBI/P (1)
 shr r22, r18 ' RSHU (1)
 mov r3, r20 ' BORI/U
 or r3, r22 ' BORI/U (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc11_696ddd96_packI__L000121
 add SP, #8 ' CALL addrg
' C_s8sc12_696ddd96_I_shl_L000125_126 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc13_696ddd96_I_xor_L000128 ' <symbol:Ixor>
 jmp #PSHM
 long $540000 ' save registers
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 xor r22, r20 ' BXORI/U (1)
 wrlong r22, r3 ' ASGNU4 reg reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r2
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 xor r20, r18 ' BXORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
' C_s8sc13_696ddd96_I_xor_L000128_129 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s8sc14_696ddd96_I_add_L000130 ' <symbol:Iadd>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r2, r22 ' ADDU
 add r2, r20 ' ADDU (3)
 rdlong r22, r21 ' reg <- INDIRU4 reg
 rdlong r20, r19 ' reg <- INDIRU4 reg
 mov r3, r22 ' ADDU
 add r3, r20 ' ADDU (3)
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc11_696ddd96_packI__L000121
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BRAE
 long @C_s8sc14_696ddd96_I_add_L000130_133 ' GEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
C_s8sc14_696ddd96_I_add_L000130_133
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C_s8sc14_696ddd96_I_add_L000130_131 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc15_696ddd96_times5_L000136 ' <symbol:times5>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc12_696ddd96_I_shl_L000125
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc14_696ddd96_I_add_L000130
 add SP, #8 ' CALL addrg
' C_s8sc15_696ddd96_times5_L000136_137 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc16_696ddd96_times9_L000139 ' <symbol:times9>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #3 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc12_696ddd96_I_shl_L000125
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc14_696ddd96_I_add_L000130
 add SP, #8 ' CALL addrg
' C_s8sc16_696ddd96_times9_L000139_140 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc17_696ddd96_rotl_L000142 ' <symbol:rotl>
 jmp #NEWF
 jmp #PSHM
 long $fd4000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRU4 reg
 mov r20, #32 ' reg <- coni
 subs r20, r19 ' SUBI/P (1)
 mov r18, r21
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r16, r22 ' RSHU
 shr r16, r20 ' RSHU (3)
 mov r14, r18 ' LSHI/U
 shl r14, r19 ' LSHI/U (3)
 mov r2, r16 ' BORI/U
 or r2, r14 ' BORI/U (3)
 shl r22, r19 ' LSHI/U (1)
 mov RI, r18
 shr RI, r20
 mov r20, RI ' RSHU (2)
 mov r3, r22 ' BORI/U
 or r3, r20 ' BORI/U (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc11_696ddd96_packI__L000121
 add SP, #8 ' CALL addrg
' C_s8sc17_696ddd96_rotl_L000142_143 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc18_696ddd96_rotl1_L000145 ' <symbol:rotl1>
 jmp #NEWF
 jmp #PSHM
 long $fd4000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #64 ' reg <- coni
 subs r19, r22
 neg r19, r19 ' SUBI/P (2)
 rdlong r22, r21 ' reg <- INDIRU4 reg
 mov r20, #32 ' reg <- coni
 subs r20, r19 ' SUBI/P (1)
 mov r18, r21
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 mov r16, r22 ' LSHI/U
 shl r16, r20 ' LSHI/U (3)
 mov r14, r18 ' RSHU
 shr r14, r19 ' RSHU (3)
 mov r2, r16 ' BORI/U
 or r2, r14 ' BORI/U (3)
 shr r22, r19 ' RSHU (1)
 mov RI, r18
 shl RI, r20
 mov r20, RI ' SHLI/U (2)
 mov r3, r22 ' BORI/U
 or r3, r20 ' BORI/U (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc11_696ddd96_packI__L000121
 add SP, #8 ' CALL addrg
' C_s8sc18_696ddd96_rotl1_L000145_146 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc19_696ddd96_nextrand_L000148 ' <symbol:nextrand>
 jmp #NEWF
 sub SP, #104
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r21
 adds r1, #8 ' ADDP4 coni
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc15_696ddd96_times5_L000136
 add SP, #4 ' CALL addrg
 mov r2, #7 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-44) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc17_696ddd96_rotl_L000142
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc16_696ddd96_times9_L000139
 add SP, #4 ' CALL addrg
 mov r2, #17 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-52) ' reg <- addrli
 mov r1, r21
 adds r1, #8 ' ADDP4 coni
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc12_696ddd96_I_shl_L000125
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-60) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc13_696ddd96_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-68) ' reg <- addrli
 mov r1, r21
 adds r1, #8 ' ADDP4 coni
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #24 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc13_696ddd96_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-76) ' reg <- addrli
 mov r1, r21
 adds r1, #16 ' ADDP4 coni
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #8 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc13_696ddd96_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-84) ' reg <- addrli
 mov r1, r21
 adds r1, #24 ' ADDP4 coni
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc13_696ddd96_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-92) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-92) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc13_696ddd96_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r2, #45 ' reg ARG coni
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov r0, FP
 sub r0, #-(-100) ' reg <- addrli
 mov r1, r22 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-108) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc18_696ddd96_rotl1_L000145
 add SP, #8 ' CALL addrg
 mov r0, r22 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-108) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C_s8sc19_696ddd96_nextrand_L000148_149 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #104 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc1a_696ddd96_I_2d_L000151 ' <symbol:I2d>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $540000 ' save registers
 rdlong r22, r2 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 jmp #LODI
 long @C_s8sc1a_696ddd96_I_2d_L000151_153_L000154
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r18, r22
 shr r18, #1 ' RSHU4 coni
 mov r0, r18 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_s8sc1a_696ddd96_I_2d_L000151_155_L000156
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
' C_s8sc1a_696ddd96_I_2d_L000151_152 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc1d_696ddd96_I_2U_I_nt_L000157 ' <symbol:I2UInt>
 jmp #PSHM
 long $500000 ' save registers
 rdlong r22, r2 ' reg <- INDIRU4 reg
 shl r22, #31 ' LSHU4 coni
 shl r22, #1 ' LSHU4 coni
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r0, r22 ' BORI/U
 or r0, r20 ' BORI/U (3)
' C_s8sc1d_696ddd96_I_2U_I_nt_L000157_158 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s8sc1e_696ddd96_I_nt2I__L000159 ' <symbol:Int2I>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r21
 shr r22, #31 ' RSHU4 coni
 mov r3, r22
 shr r3, #1 ' RSHU4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc11_696ddd96_packI__L000121
 add SP, #8 ' CALL addrg
' C_s8sc1e_696ddd96_I_nt2I__L000159_160 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s8sc1f_696ddd96_project_L000163 ' <symbol:project>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 add r22, #1 ' ADDU4 coni
 and r22, r21 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s8sc1f_696ddd96_project_L000163_165 ' NEU4
 mov r0, r23 ' BANDI/U
 and r0, r21 ' BANDI/U (3)
 jmp #JMPA
 long @C_s8sc1f_696ddd96_project_L000163_164 ' JUMPV addrg
C_s8sc1f_696ddd96_project_L000163_165
 mov r17, r21 ' CVI, CVU or LOAD
 mov r22, r17
 shr r22, #1 ' RSHU4 coni
 or r17, r22 ' BORI/U (1)
 mov r22, r17
 shr r22, #2 ' RSHU4 coni
 or r17, r22 ' BORI/U (1)
 mov r22, r17
 shr r22, #4 ' RSHU4 coni
 or r17, r22 ' BORI/U (1)
 mov r22, r17
 shr r22, #8 ' RSHU4 coni
 or r17, r22 ' BORI/U (1)
 mov r22, r17
 shr r22, #16 ' RSHU4 coni
 or r17, r22 ' BORI/U (1)
 jmp #JMPA
 long @C_s8sc1f_696ddd96_project_L000163_168 ' JUMPV addrg
C_s8sc1f_696ddd96_project_L000163_167
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc19_696ddd96_nextrand_L000148
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8sc1d_696ddd96_I_2U_I_nt_L000157 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_s8sc1f_696ddd96_project_L000163_168
 mov r22, r23 ' BANDI/U
 and r22, r17 ' BANDI/U (3)
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22, r21 wcz 
 jmp #BR_A
 long @C_s8sc1f_696ddd96_project_L000163_167 ' GTU4
 mov r0, r23 ' CVI, CVU or LOAD
C_s8sc1f_696ddd96_project_L000163_164
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc1g_696ddd96_math_random_L000170 ' <symbol:math_random>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long -1001001
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc19_696ddd96_nextrand_L000148
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s8sc1g_696ddd96_math_random_L000170_175 ' EQI4
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C_s8sc1g_696ddd96_math_random_L000170_176 ' EQI4
 cmps r17,  #2 wz
 jmp #BR_Z
 long @C_s8sc1g_696ddd96_math_random_L000170_179 ' EQI4
 jmp #JMPA
 long @C_s8sc1g_696ddd96_math_random_L000170_172 ' JUMPV addrg
C_s8sc1g_696ddd96_math_random_L000170_175
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8sc1a_696ddd96_I_2d_L000151 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s8sc1g_696ddd96_math_random_L000170_171 ' JUMPV addrg
C_s8sc1g_696ddd96_math_random_L000170_176
 mov r22, #1 ' reg <- coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s8sc1g_696ddd96_math_random_L000170_173 ' NEI4
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8sc1d_696ddd96_I_2U_I_nt_L000157 ' CALL addrg
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
 long @C_s8sc1g_696ddd96_math_random_L000170_171 ' JUMPV addrg
C_s8sc1g_696ddd96_math_random_L000170_179
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
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_s8sc1g_696ddd96_math_random_L000170_173 ' JUMPV addrg
C_s8sc1g_696ddd96_math_random_L000170_172
 jmp #LODL
 long @C_s8sc1g_696ddd96_math_random_L000170_180_L000181
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s8sc1g_696ddd96_math_random_L000170_171 ' JUMPV addrg
C_s8sc1g_696ddd96_math_random_L000170_173
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 jmp #BRBE
 long @C_s8sc1g_696ddd96_math_random_L000170_184 ' LEI4
 jmp #LODL
 long @C_s8sc1g_696ddd96_math_random_L000170_182_L000183
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s8sc1g_696ddd96_math_random_L000170_184
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8sc1d_696ddd96_I_2U_I_nt_L000157 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r3, r20 ' SUBU
 sub r3, r18 ' SUBU (3)
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1f_696ddd96_project_L000163
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_s8sc1g_696ddd96_math_random_L000170_171
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc1j_696ddd96_setseed_L000185 ' <symbol:setseed>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $aa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1e_696ddd96_I_nt2I__L000159
 add SP, #4 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, #255 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1e_696ddd96_I_nt2I__L000159
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #8 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1e_696ddd96_I_nt2I__L000159
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #16 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-28) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1e_696ddd96_I_nt2I__L000159
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #24 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-36) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
 mov r15, #0 ' reg <- coni
C_s8sc1j_696ddd96_setseed_L000185_187
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc19_696ddd96_nextrand_L000148
 add SP, #4 ' CALL addrg
' C_s8sc1j_696ddd96_setseed_L000185_188 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #16 wcz
 jmp #BR_B
 long @C_s8sc1j_696ddd96_setseed_L000185_187 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
' C_s8sc1j_696ddd96_setseed_L000185_186 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc1k_696ddd96_randseed_L000191 ' <symbol:randseed>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_time ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1j_696ddd96_setseed_L000185
 add SP, #12 ' CALL addrg
' C_s8sc1k_696ddd96_randseed_L000191_192 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s8sc1l_696ddd96_math_randomseed_L000193 ' <symbol:math_randomseed>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long -1001001
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r2, #1 ' reg ARG coni
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
 long @C_s8sc1l_696ddd96_math_randomseed_L000193_195 ' NEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1k_696ddd96_randseed_L000191
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s8sc1l_696ddd96_math_randomseed_L000193_196 ' JUMPV addrg
C_s8sc1l_696ddd96_math_randomseed_L000193_195
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1j_696ddd96_setseed_L000185
 add SP, #12 ' CALL addrg
C_s8sc1l_696ddd96_math_randomseed_L000193_196
 mov r0, #2 ' RET coni
' C_s8sc1l_696ddd96_math_randomseed_L000193_194 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s8sc1m_696ddd96_randfuncs_L000197 ' <symbol:randfuncs>
 long @C_s8sc1n_696ddd96_198_L000199
 long @C_s8sc1g_696ddd96_math_random_L000170
 long @C_s8sc1o_696ddd96_200_L000201
 long @C_s8sc1l_696ddd96_math_randomseed_L000193
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s8sc1p_696ddd96_setrandfunc_L000202 ' <symbol:setrandfunc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s8sc1k_696ddd96_randseed_L000191
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_s8sc1m_696ddd96_randfuncs_L000197
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
' C_s8sc1p_696ddd96_setrandfunc_L000202_203 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s8sc1q_696ddd96_mathlib_L000204 ' <symbol:mathlib>
 long @C_s8sc1r_696ddd96_205_L000206
 long @C_s8sc_696ddd96_math_abs_L000004
 long @C_s8sc1s_696ddd96_207_L000208
 long @C_s8sc5_696ddd96_math_acos_L000018
 long @C_s8sc1t_696ddd96_209_L000210
 long @C_s8sc4_696ddd96_math_asin_L000016
 long @C_s8sc1u_696ddd96_211_L000212
 long @C_s8sc6_696ddd96_math_atan_L000020
 long @C_s8sc1v_696ddd96_213_L000214
 long @C_s8scd_696ddd96_math_ceil_L000040
 long @C_s8sc20_696ddd96_215_L000216
 long @C_s8sc2_696ddd96_math_cos_L000012
 long @C_s8sc21_696ddd96_217_L000218
 long @C_s8scn_696ddd96_math_deg_L000082
 long @C_s8sc22_696ddd96_219_L000220
 long @C_s8scm_696ddd96_math_exp_L000080
 long @C_s8sc23_696ddd96_221_L000222
 long @C_s8sc8_696ddd96_math_toint_L000024
 long @C_s8sc24_696ddd96_223_L000224
 long @C_s8scc_696ddd96_math_floor_L000036
 long @C_s8sc25_696ddd96_225_L000226
 long @C_s8sce_696ddd96_math_fmod_L000044
 long @C_s8sc26_696ddd96_227_L000228
 long @C_s8scj_696ddd96_math_ult_L000067
 long @C_s8sc27_696ddd96_229_L000230
 long @C_s8sck_696ddd96_math_log_L000072
 long @C_s8sc28_696ddd96_231_L000232
 long @C_s8sct_696ddd96_math_max_L000101
 long @C_s8sc29_696ddd96_233_L000234
 long @C_s8scr_696ddd96_math_min_L000090
 long @C_s8sc2a_696ddd96_235_L000236
 long @C_s8scg_696ddd96_math_modf_L000053
 long @C_s8sc2b_696ddd96_237_L000238
 long @C_s8scp_696ddd96_math_rad_L000086
 long @C_s8sc2c_696ddd96_239_L000240
 long @C_s8sc1_696ddd96_math_sin_L000010
 long @C_s8sc2d_696ddd96_241_L000242
 long @C_s8sci_696ddd96_math_sqrt_L000065
 long @C_s8sc2e_696ddd96_243_L000244
 long @C_s8sc3_696ddd96_math_tan_L000014
 long @C_s8sc2f_696ddd96_245_L000246
 long @C_s8scu_696ddd96_math_type_L000110
 long @C_s8sc1n_696ddd96_198_L000199
 long $0
 long @C_s8sc1o_696ddd96_200_L000201
 long $0
 long @C_s8sc2g_696ddd96_247_L000248
 long $0
 long @C_s8sc2h_696ddd96_249_L000250
 long $0
 long @C_s8sc2i_696ddd96_251_L000252
 long $0
 long @C_s8sc2j_696ddd96_253_L000254
 long $0
 long $0
 long $0

' Catalina Export luaopen_math

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_math ' <symbol:luaopen_math>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 jmp #LODI
 long @C_luaopen_math_256_L000257
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #27 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_s8sc1q_696ddd96_mathlib_L000204
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 jmp #LODI
 long @C_luaopen_math_258_L000259
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s8sc2g_696ddd96_247_L000248
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
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s8sc2h_696ddd96_249_L000250
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
 long 2147483647
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s8sc2i_696ddd96_251_L000252
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
 long -2147483648
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s8sc2j_696ddd96_253_L000254
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
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s8sc1p_696ddd96_setrandfunc_L000202 ' CALL addrg
 mov r0, #1 ' RET coni
' C_luaopen_math_255 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import luaL_setfuncs

' Catalina Import luaL_error

' Catalina Import luaL_checkany

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optnumber

' Catalina Import luaL_checknumber

' Catalina Import luaL_argerror

' Catalina Import luaL_checkversion_

' Catalina Import lua_setfield

' Catalina Import lua_newuserdatauv

' Catalina Import lua_createtable

' Catalina Import lua_pushboolean

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnumber

' Catalina Import lua_pushnil

' Catalina Import lua_compare

' Catalina Import lua_touserdata

' Catalina Import lua_tointegerx

' Catalina Import lua_type

' Catalina Import lua_isinteger

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import time

' Catalina Import fmod

' Catalina Import floor

' Catalina Import fabs

' Catalina Import ceil

' Catalina Import sqrt

' Catalina Import log10

' Catalina Import log

' Catalina Import exp

' Catalina Import tan

' Catalina Import sin

' Catalina Import cos

' Catalina Import atan2

' Catalina Import asin

' Catalina Import acos

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_math_258_L000259 ' <symbol:258>
 long $40490fdb ' float

 alignl ' align long
C_luaopen_math_256_L000257 ' <symbol:256>
 long $43fc0000 ' float

 alignl ' align long
C_s8sc2j_696ddd96_253_L000254 ' <symbol:253>
 byte 109
 byte 105
 byte 110
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s8sc2i_696ddd96_251_L000252 ' <symbol:251>
 byte 109
 byte 97
 byte 120
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s8sc2h_696ddd96_249_L000250 ' <symbol:249>
 byte 104
 byte 117
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_s8sc2g_696ddd96_247_L000248 ' <symbol:247>
 byte 112
 byte 105
 byte 0

 alignl ' align long
C_s8sc2f_696ddd96_245_L000246 ' <symbol:245>
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_s8sc2e_696ddd96_243_L000244 ' <symbol:243>
 byte 116
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_s8sc2d_696ddd96_241_L000242 ' <symbol:241>
 byte 115
 byte 113
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s8sc2c_696ddd96_239_L000240 ' <symbol:239>
 byte 115
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_s8sc2b_696ddd96_237_L000238 ' <symbol:237>
 byte 114
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_s8sc2a_696ddd96_235_L000236 ' <symbol:235>
 byte 109
 byte 111
 byte 100
 byte 102
 byte 0

 alignl ' align long
C_s8sc29_696ddd96_233_L000234 ' <symbol:233>
 byte 109
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_s8sc28_696ddd96_231_L000232 ' <symbol:231>
 byte 109
 byte 97
 byte 120
 byte 0

 alignl ' align long
C_s8sc27_696ddd96_229_L000230 ' <symbol:229>
 byte 108
 byte 111
 byte 103
 byte 0

 alignl ' align long
C_s8sc26_696ddd96_227_L000228 ' <symbol:227>
 byte 117
 byte 108
 byte 116
 byte 0

 alignl ' align long
C_s8sc25_696ddd96_225_L000226 ' <symbol:225>
 byte 102
 byte 109
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_s8sc24_696ddd96_223_L000224 ' <symbol:223>
 byte 102
 byte 108
 byte 111
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_s8sc23_696ddd96_221_L000222 ' <symbol:221>
 byte 116
 byte 111
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s8sc22_696ddd96_219_L000220 ' <symbol:219>
 byte 101
 byte 120
 byte 112
 byte 0

 alignl ' align long
C_s8sc21_696ddd96_217_L000218 ' <symbol:217>
 byte 100
 byte 101
 byte 103
 byte 0

 alignl ' align long
C_s8sc20_696ddd96_215_L000216 ' <symbol:215>
 byte 99
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_s8sc1v_696ddd96_213_L000214 ' <symbol:213>
 byte 99
 byte 101
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_s8sc1u_696ddd96_211_L000212 ' <symbol:211>
 byte 97
 byte 116
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_s8sc1t_696ddd96_209_L000210 ' <symbol:209>
 byte 97
 byte 115
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_s8sc1s_696ddd96_207_L000208 ' <symbol:207>
 byte 97
 byte 99
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_s8sc1r_696ddd96_205_L000206 ' <symbol:205>
 byte 97
 byte 98
 byte 115
 byte 0

 alignl ' align long
C_s8sc1o_696ddd96_200_L000201 ' <symbol:200>
 byte 114
 byte 97
 byte 110
 byte 100
 byte 111
 byte 109
 byte 115
 byte 101
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_s8sc1n_696ddd96_198_L000199 ' <symbol:198>
 byte 114
 byte 97
 byte 110
 byte 100
 byte 111
 byte 109
 byte 0

 alignl ' align long
C_s8sc1g_696ddd96_math_random_L000170_182_L000183 ' <symbol:182>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 114
 byte 118
 byte 97
 byte 108
 byte 32
 byte 105
 byte 115
 byte 32
 byte 101
 byte 109
 byte 112
 byte 116
 byte 121
 byte 0

 alignl ' align long
C_s8sc1g_696ddd96_math_random_L000170_180_L000181 ' <symbol:180>
 byte 119
 byte 114
 byte 111
 byte 110
 byte 103
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
C_s8sc1a_696ddd96_I_2d_L000151_155_L000156 ' <symbol:155>
 long $33800000 ' float

 alignl ' align long
C_s8sc1a_696ddd96_I_2d_L000151_153_L000154 ' <symbol:153>
 long $40000000 ' float

 alignl ' align long
C_s8scu_696ddd96_math_type_L000110_116_L000117 ' <symbol:116>
 byte 102
 byte 108
 byte 111
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_s8scu_696ddd96_math_type_L000110_114_L000115 ' <symbol:114>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s8scr_696ddd96_math_min_L000090_92_L000093 ' <symbol:92>
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
C_s8scp_696ddd96_math_rad_L000086_88_L000089 ' <symbol:88>
 long $3c8efa35 ' float

 alignl ' align long
C_s8scn_696ddd96_math_deg_L000082_84_L000085 ' <symbol:84>
 long $42652ee1 ' float

 alignl ' align long
C_s8sck_696ddd96_math_log_L000072_78_L000079 ' <symbol:78>
 long $41200000 ' float

 alignl ' align long
C_s8scg_696ddd96_math_modf_L000053_57_L000058 ' <symbol:57>
 long $0 ' float

 alignl ' align long
C_s8sce_696ddd96_math_fmod_L000044_50_L000051 ' <symbol:50>
 byte 122
 byte 101
 byte 114
 byte 111
 byte 0

 alignl ' align long
C_s8sc9_696ddd96_pushnumint_L000028_34_L000035 ' <symbol:34>
 long $4f000000 ' float

 alignl ' align long
C_s8sc9_696ddd96_pushnumint_L000028_32_L000033 ' <symbol:32>
 long $cf000000 ' float

 alignl ' align long
C_s8sc6_696ddd96_math_atan_L000020_22_L000023 ' <symbol:22>
 long $3f800000 ' float

' Catalina Code

DAT ' code segment
' end
