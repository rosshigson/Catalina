' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sbnc_66c68a8f_math_abs_L000004 ' <symbol:math_abs>
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
 long @C_sbnc_66c68a8f_math_abs_L000004_6 ' EQI4
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
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_sbnc_66c68a8f_math_abs_L000004_8 ' GEI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_sbnc_66c68a8f_math_abs_L000004_8
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
 long @C_sbnc_66c68a8f_math_abs_L000004_7 ' JUMPV addrg
C_sbnc_66c68a8f_math_abs_L000004_6
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
C_sbnc_66c68a8f_math_abs_L000004_7
 mov r0, #1 ' RET coni
' C_sbnc_66c68a8f_math_abs_L000004_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnc1_66c68a8f_math_sin_L000010 ' <symbol:math_sin>
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
' C_sbnc1_66c68a8f_math_sin_L000010_11 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnc2_66c68a8f_math_cos_L000012 ' <symbol:math_cos>
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
' C_sbnc2_66c68a8f_math_cos_L000012_13 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnc3_66c68a8f_math_tan_L000014 ' <symbol:math_tan>
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
' C_sbnc3_66c68a8f_math_tan_L000014_15 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnc4_66c68a8f_math_asin_L000016 ' <symbol:math_asin>
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
' C_sbnc4_66c68a8f_math_asin_L000016_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnc5_66c68a8f_math_acos_L000018 ' <symbol:math_acos>
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
' C_sbnc5_66c68a8f_math_acos_L000018_19 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnc6_66c68a8f_math_atan_L000020 ' <symbol:math_atan>
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
 long @C_sbnc6_66c68a8f_math_atan_L000020_22_L000023
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
' C_sbnc6_66c68a8f_math_atan_L000020_21 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnc8_66c68a8f_math_toint_L000024 ' <symbol:math_toint>
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
 long @C_sbnc8_66c68a8f_math_toint_L000024_26 ' EQI4
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
 long @C_sbnc8_66c68a8f_math_toint_L000024_27 ' JUMPV addrg
C_sbnc8_66c68a8f_math_toint_L000024_26
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
C_sbnc8_66c68a8f_math_toint_L000024_27
 mov r0, #1 ' RET coni
' C_sbnc8_66c68a8f_math_toint_L000024_25 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnc9_66c68a8f_pushnumint_L000028 ' <symbol:pushnumint>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sbnc9_66c68a8f_pushnumint_L000028_32_L000033
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_sbnc9_66c68a8f_pushnumint_L000028_30 ' LTF4
 jmp #LODI
 long @C_sbnc9_66c68a8f_pushnumint_L000028_34_L000035
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_sbnc9_66c68a8f_pushnumint_L000028_30 ' GEF4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sbnc9_66c68a8f_pushnumint_L000028_30 ' EQI4
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
 long @C_sbnc9_66c68a8f_pushnumint_L000028_31 ' JUMPV addrg
C_sbnc9_66c68a8f_pushnumint_L000028_30
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_sbnc9_66c68a8f_pushnumint_L000028_31
' C_sbnc9_66c68a8f_pushnumint_L000028_29 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbncc_66c68a8f_math_floor_L000036 ' <symbol:math_floor>
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
 long @C_sbncc_66c68a8f_math_floor_L000036_38 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sbncc_66c68a8f_math_floor_L000036_39 ' JUMPV addrg
C_sbncc_66c68a8f_math_floor_L000036_38
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
 long @C_sbnc9_66c68a8f_pushnumint_L000028
 add SP, #4 ' CALL addrg
C_sbncc_66c68a8f_math_floor_L000036_39
 mov r0, #1 ' RET coni
' C_sbncc_66c68a8f_math_floor_L000036_37 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbncd_66c68a8f_math_ceil_L000040 ' <symbol:math_ceil>
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
 long @C_sbncd_66c68a8f_math_ceil_L000040_42 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sbncd_66c68a8f_math_ceil_L000040_43 ' JUMPV addrg
C_sbncd_66c68a8f_math_ceil_L000040_42
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
 long @C_sbnc9_66c68a8f_pushnumint_L000028
 add SP, #4 ' CALL addrg
C_sbncd_66c68a8f_math_ceil_L000040_43
 mov r0, #1 ' RET coni
' C_sbncd_66c68a8f_math_ceil_L000040_41 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnce_66c68a8f_math_fmod_L000044 ' <symbol:math_fmod>
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
 long @C_sbnce_66c68a8f_math_fmod_L000044_46 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sbnce_66c68a8f_math_fmod_L000044_46 ' EQI4
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
 cmp r20, r22 wz,wc 
 jmp #BR_A
 long @C_sbnce_66c68a8f_math_fmod_L000044_48 ' GTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sbnce_66c68a8f_math_fmod_L000044_52 ' NEI4
 jmp #LODL
 long @C_sbnce_66c68a8f_math_fmod_L000044_50_L000051
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sbnce_66c68a8f_math_fmod_L000044_52
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sbnce_66c68a8f_math_fmod_L000044_47 ' JUMPV addrg
C_sbnce_66c68a8f_math_fmod_L000044_48
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
 long @C_sbnce_66c68a8f_math_fmod_L000044_47 ' JUMPV addrg
C_sbnce_66c68a8f_math_fmod_L000044_46
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
C_sbnce_66c68a8f_math_fmod_L000044_47
 mov r0, #1 ' RET coni
' C_sbnce_66c68a8f_math_fmod_L000044_45 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbncg_66c68a8f_math_modf_L000053 ' <symbol:math_modf>
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
 long @C_sbncg_66c68a8f_math_modf_L000053_55 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_sbncg_66c68a8f_math_modf_L000053_57_L000058
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sbncg_66c68a8f_math_modf_L000053_56 ' JUMPV addrg
C_sbncg_66c68a8f_math_modf_L000053_55
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sbncg_66c68a8f_math_modf_L000053_57_L000058
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_sbncg_66c68a8f_math_modf_L000053_60 ' GEF4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_ceil ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbncg_66c68a8f_math_modf_L000053_61 ' JUMPV addrg
C_sbncg_66c68a8f_math_modf_L000053_60
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_floor ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_sbncg_66c68a8f_math_modf_L000053_61
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
 long @C_sbnc9_66c68a8f_pushnumint_L000028
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_sbncg_66c68a8f_math_modf_L000053_63 ' NEF4
 jmp #LODI
 long @C_sbncg_66c68a8f_math_modf_L000053_57_L000058
 mov r17, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_sbncg_66c68a8f_math_modf_L000053_64 ' JUMPV addrg
C_sbncg_66c68a8f_math_modf_L000053_63
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov r17, r0 ' CVI, CVU or LOAD
C_sbncg_66c68a8f_math_modf_L000053_64
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_sbncg_66c68a8f_math_modf_L000053_56
 mov r0, #2 ' RET coni
' C_sbncg_66c68a8f_math_modf_L000053_54 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnci_66c68a8f_math_sqrt_L000065 ' <symbol:math_sqrt>
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
' C_sbnci_66c68a8f_math_sqrt_L000065_66 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbncj_66c68a8f_math_ult_L000067 ' <symbol:math_ult>
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
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_sbncj_66c68a8f_math_ult_L000067_70 ' GEU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_sbncj_66c68a8f_math_ult_L000067_71 ' JUMPV addrg
C_sbncj_66c68a8f_math_ult_L000067_70
 mov r21, #0 ' reg <- coni
C_sbncj_66c68a8f_math_ult_L000067_71
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sbncj_66c68a8f_math_ult_L000067_68 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnck_66c68a8f_math_log_L000072 ' <symbol:math_log>
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
 cmps r0,  #0 wz,wc
 jmp #BR_A
 long @C_sbnck_66c68a8f_math_log_L000072_74 ' GTI4
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
 long @C_sbnck_66c68a8f_math_log_L000072_75 ' JUMPV addrg
C_sbnck_66c68a8f_math_log_L000072_74
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
 long @C_sbnck_66c68a8f_math_log_L000072_78_L000079
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_sbnck_66c68a8f_math_log_L000072_76 ' NEF4
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
 long @C_sbnck_66c68a8f_math_log_L000072_77 ' JUMPV addrg
C_sbnck_66c68a8f_math_log_L000072_76
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
C_sbnck_66c68a8f_math_log_L000072_77
C_sbnck_66c68a8f_math_log_L000072_75
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
' C_sbnck_66c68a8f_math_log_L000072_73 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sbncm_66c68a8f_math_exp_L000080 ' <symbol:math_exp>
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
' C_sbncm_66c68a8f_math_exp_L000080_81 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbncn_66c68a8f_math_deg_L000082 ' <symbol:math_deg>
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
 long @C_sbncn_66c68a8f_math_deg_L000082_84_L000085
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
' C_sbncn_66c68a8f_math_deg_L000082_83 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbncp_66c68a8f_math_rad_L000086 ' <symbol:math_rad>
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
 long @C_sbncp_66c68a8f_math_rad_L000086_88_L000089
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
' C_sbncp_66c68a8f_math_rad_L000086_87 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbncr_66c68a8f_math_min_L000090 ' <symbol:math_min>
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
 cmps r17, r22 wz,wc
 jmp #BRAE
 long @C_sbncr_66c68a8f_math_min_L000090_94 ' GEI4
 jmp #LODL
 long @C_sbncr_66c68a8f_math_min_L000090_92_L000093
 mov r2, RI ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sbncr_66c68a8f_math_min_L000090_94
 mov r21, #2 ' reg <- coni
 jmp #JMPA
 long @C_sbncr_66c68a8f_math_min_L000090_98 ' JUMPV addrg
C_sbncr_66c68a8f_math_min_L000090_95
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
 long @C_sbncr_66c68a8f_math_min_L000090_99 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
C_sbncr_66c68a8f_math_min_L000090_99
' C_sbncr_66c68a8f_math_min_L000090_96 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sbncr_66c68a8f_math_min_L000090_98
 cmps r21, r17 wz,wc
 jmp #BRBE
 long @C_sbncr_66c68a8f_math_min_L000090_95 ' LEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sbncr_66c68a8f_math_min_L000090_91 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnct_66c68a8f_math_max_L000101 ' <symbol:math_max>
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
 cmps r17, r22 wz,wc
 jmp #BRAE
 long @C_sbnct_66c68a8f_math_max_L000101_103 ' GEI4
 jmp #LODL
 long @C_sbncr_66c68a8f_math_min_L000090_92_L000093
 mov r2, RI ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sbnct_66c68a8f_math_max_L000101_103
 mov r21, #2 ' reg <- coni
 jmp #JMPA
 long @C_sbnct_66c68a8f_math_max_L000101_107 ' JUMPV addrg
C_sbnct_66c68a8f_math_max_L000101_104
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
 long @C_sbnct_66c68a8f_math_max_L000101_108 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
C_sbnct_66c68a8f_math_max_L000101_108
' C_sbnct_66c68a8f_math_max_L000101_105 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sbnct_66c68a8f_math_max_L000101_107
 cmps r21, r17 wz,wc
 jmp #BRBE
 long @C_sbnct_66c68a8f_math_max_L000101_104 ' LEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
' C_sbnct_66c68a8f_math_max_L000101_102 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbncu_66c68a8f_math_type_L000110 ' <symbol:math_type>
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
 long @C_sbncu_66c68a8f_math_type_L000110_112 ' NEI4
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
 long @C_sbncu_66c68a8f_math_type_L000110_119 ' EQI4
 jmp #LODL
 long @C_sbncu_66c68a8f_math_type_L000110_114_L000115
 mov r21, RI ' reg <- addrg
 jmp #JMPA
 long @C_sbncu_66c68a8f_math_type_L000110_120 ' JUMPV addrg
C_sbncu_66c68a8f_math_type_L000110_119
 jmp #LODL
 long @C_sbncu_66c68a8f_math_type_L000110_116_L000117
 mov r21, RI ' reg <- addrg
C_sbncu_66c68a8f_math_type_L000110_120
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sbncu_66c68a8f_math_type_L000110_113 ' JUMPV addrg
C_sbncu_66c68a8f_math_type_L000110_112
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
C_sbncu_66c68a8f_math_type_L000110_113
 mov r0, #1 ' RET coni
' C_sbncu_66c68a8f_math_type_L000110_111 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnc11_66c68a8f_rotl_L000121 ' <symbol:rotl>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r3 ' LSHI/U
 shl r22, r2 ' LSHI/U (3)
 mov r20, #64 ' reg <- coni
 subs r20, r2 ' SUBI/P (1)
 mov RI, r3
 shr RI, r20
 mov r20, RI ' RSHU (2)
 mov r0, r22 ' BORI/U
 or r0, r20 ' BORI/U (3)
' C_sbnc11_66c68a8f_rotl_L000121_122 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sbnc12_66c68a8f_nextrand_L000123 ' <symbol:nextrand>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r19, r23 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' BXORI/U
 xor r17, r19 ' BXORI/U (3)
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r15, r22 ' BXORI/U
 xor r15, r21 ' BXORI/U (3)
 mov r2, #7 ' reg ARG coni
 mov r22, #5 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbnc11_66c68a8f_rotl_L000121
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #9 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, r19 ' BXORI/U
 xor r22, r15 ' BXORI/U (3)
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, r21 ' BXORI/U
 xor r20, r17 ' BXORI/U (3)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r21
 shl r20, #17 ' LSHU4 coni
 xor r20, r17 ' BXORI/U (2)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, #45 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbnc11_66c68a8f_rotl_L000121
 add SP, #4 ' CALL addrg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_sbnc12_66c68a8f_nextrand_L000123_124 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnc13_66c68a8f_I_2d_L000125 ' <symbol:I2d>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $550000 ' save registers
 mov r22, r2
 shr r22, #40 ' RSHU4 coni
 jmp #LODI
 long @C_sbnc13_66c68a8f_I_2d_L000125_127_L000128
 mov r20, RI ' reg <- INDIRF4 addrg
 jmp #LODI
 long @C_sbnc13_66c68a8f_I_2d_L000125_129_L000130
 mov r18, RI ' reg <- INDIRF4 addrg
 mov r16, r22
 shr r16, #1 ' RSHU4 coni
 mov r0, r16 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r18 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
' C_sbnc13_66c68a8f_I_2d_L000125_126 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnc16_66c68a8f_project_L000132 ' <symbol:project>
 jmp #NEWF
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
 long @C_sbnc16_66c68a8f_project_L000132_134 ' NEU4
 mov r0, r23 ' BANDI/U
 and r0, r21 ' BANDI/U (3)
 jmp #JMPA
 long @C_sbnc16_66c68a8f_project_L000132_133 ' JUMPV addrg
C_sbnc16_66c68a8f_project_L000132_134
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
 long @C_sbnc16_66c68a8f_project_L000132_137 ' JUMPV addrg
C_sbnc16_66c68a8f_project_L000132_136
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbnc12_66c68a8f_nextrand_L000123 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_sbnc16_66c68a8f_project_L000132_137
 mov r22, r23 ' BANDI/U
 and r22, r17 ' BANDI/U (3)
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22, r21 wz,wc 
 jmp #BR_A
 long @C_sbnc16_66c68a8f_project_L000132_136 ' GTU4
 mov r0, r23 ' CVI, CVU or LOAD
C_sbnc16_66c68a8f_project_L000132_133
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnc17_66c68a8f_math_random_L000139 ' <symbol:math_random>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fa0000 ' save registers
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
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbnc12_66c68a8f_nextrand_L000123 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sbnc17_66c68a8f_math_random_L000139_144 ' EQI4
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C_sbnc17_66c68a8f_math_random_L000139_145 ' EQI4
 cmps r17,  #2 wz
 jmp #BR_Z
 long @C_sbnc17_66c68a8f_math_random_L000139_148 ' EQI4
 jmp #JMPA
 long @C_sbnc17_66c68a8f_math_random_L000139_141 ' JUMPV addrg
C_sbnc17_66c68a8f_math_random_L000139_144
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbnc13_66c68a8f_I_2d_L000125 ' CALL addrg
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
 long @C_sbnc17_66c68a8f_math_random_L000139_140 ' JUMPV addrg
C_sbnc17_66c68a8f_math_random_L000139_145
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
 long @C_sbnc17_66c68a8f_math_random_L000139_142 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sbnc17_66c68a8f_math_random_L000139_140 ' JUMPV addrg
C_sbnc17_66c68a8f_math_random_L000139_148
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
 long @C_sbnc17_66c68a8f_math_random_L000139_142 ' JUMPV addrg
C_sbnc17_66c68a8f_math_random_L000139_141
 jmp #LODL
 long @C_sbnc17_66c68a8f_math_random_L000139_149_L000150
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbnc17_66c68a8f_math_random_L000139_140 ' JUMPV addrg
C_sbnc17_66c68a8f_math_random_L000139_142
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wz,wc
 jmp #BRBE
 long @C_sbnc17_66c68a8f_math_random_L000139_153 ' LEI4
 jmp #LODL
 long @C_sbnc17_66c68a8f_math_random_L000139_151_L000152
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sbnc17_66c68a8f_math_random_L000139_153
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 mov r3, r22 ' SUBU
 sub r3, r20 ' SUBU (3)
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbnc16_66c68a8f_project_L000132
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
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
C_sbnc17_66c68a8f_math_random_L000139_140
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnc1a_66c68a8f_setseed_L000154 ' <symbol:setseed>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 wrlong r19, r21 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #255 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r17, r22 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r15, #0 ' reg <- coni
C_sbnc1a_66c68a8f_setseed_L000154_156
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbnc12_66c68a8f_nextrand_L000123 ' CALL addrg
' C_sbnc1a_66c68a8f_setseed_L000154_157 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #16 wz,wc
 jmp #BR_B
 long @C_sbnc1a_66c68a8f_setseed_L000154_156 ' LTI4
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
' C_sbnc1a_66c68a8f_setseed_L000154_155 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbnc1b_66c68a8f_randseed_L000160 ' <symbol:randseed>
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
 long @C_sbnc1a_66c68a8f_setseed_L000154
 add SP, #12 ' CALL addrg
' C_sbnc1b_66c68a8f_randseed_L000160_161 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sbnc1c_66c68a8f_math_randomseed_L000162 ' <symbol:math_randomseed>
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
 long @C_sbnc1c_66c68a8f_math_randomseed_L000162_164 ' NEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbnc1b_66c68a8f_randseed_L000160
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sbnc1c_66c68a8f_math_randomseed_L000162_165 ' JUMPV addrg
C_sbnc1c_66c68a8f_math_randomseed_L000162_164
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
 long @C_sbnc1a_66c68a8f_setseed_L000154
 add SP, #12 ' CALL addrg
C_sbnc1c_66c68a8f_math_randomseed_L000162_165
 mov r0, #2 ' RET coni
' C_sbnc1c_66c68a8f_math_randomseed_L000162_163 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sbnc1d_66c68a8f_randfuncs_L000166 ' <symbol:randfuncs>
 long @C_sbnc1e_66c68a8f_167_L000168
 long @C_sbnc17_66c68a8f_math_random_L000139
 long @C_sbnc1f_66c68a8f_169_L000170
 long @C_sbnc1c_66c68a8f_math_randomseed_L000162
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sbnc1g_66c68a8f_setrandfunc_L000171 ' <symbol:setrandfunc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #16 ' reg ARG coni
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
 long @C_sbnc1b_66c68a8f_randseed_L000160
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
 long @C_sbnc1d_66c68a8f_randfuncs_L000166
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
' C_sbnc1g_66c68a8f_setrandfunc_L000171_172 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sbnc1h_66c68a8f_mathlib_L000173 ' <symbol:mathlib>
 long @C_sbnc1i_66c68a8f_174_L000175
 long @C_sbnc_66c68a8f_math_abs_L000004
 long @C_sbnc1j_66c68a8f_176_L000177
 long @C_sbnc5_66c68a8f_math_acos_L000018
 long @C_sbnc1k_66c68a8f_178_L000179
 long @C_sbnc4_66c68a8f_math_asin_L000016
 long @C_sbnc1l_66c68a8f_180_L000181
 long @C_sbnc6_66c68a8f_math_atan_L000020
 long @C_sbnc1m_66c68a8f_182_L000183
 long @C_sbncd_66c68a8f_math_ceil_L000040
 long @C_sbnc1n_66c68a8f_184_L000185
 long @C_sbnc2_66c68a8f_math_cos_L000012
 long @C_sbnc1o_66c68a8f_186_L000187
 long @C_sbncn_66c68a8f_math_deg_L000082
 long @C_sbnc1p_66c68a8f_188_L000189
 long @C_sbncm_66c68a8f_math_exp_L000080
 long @C_sbnc1q_66c68a8f_190_L000191
 long @C_sbnc8_66c68a8f_math_toint_L000024
 long @C_sbnc1r_66c68a8f_192_L000193
 long @C_sbncc_66c68a8f_math_floor_L000036
 long @C_sbnc1s_66c68a8f_194_L000195
 long @C_sbnce_66c68a8f_math_fmod_L000044
 long @C_sbnc1t_66c68a8f_196_L000197
 long @C_sbncj_66c68a8f_math_ult_L000067
 long @C_sbnc1u_66c68a8f_198_L000199
 long @C_sbnck_66c68a8f_math_log_L000072
 long @C_sbnc1v_66c68a8f_200_L000201
 long @C_sbnct_66c68a8f_math_max_L000101
 long @C_sbnc20_66c68a8f_202_L000203
 long @C_sbncr_66c68a8f_math_min_L000090
 long @C_sbnc21_66c68a8f_204_L000205
 long @C_sbncg_66c68a8f_math_modf_L000053
 long @C_sbnc22_66c68a8f_206_L000207
 long @C_sbncp_66c68a8f_math_rad_L000086
 long @C_sbnc23_66c68a8f_208_L000209
 long @C_sbnc1_66c68a8f_math_sin_L000010
 long @C_sbnc24_66c68a8f_210_L000211
 long @C_sbnci_66c68a8f_math_sqrt_L000065
 long @C_sbnc25_66c68a8f_212_L000213
 long @C_sbnc3_66c68a8f_math_tan_L000014
 long @C_sbnc26_66c68a8f_214_L000215
 long @C_sbncu_66c68a8f_math_type_L000110
 long @C_sbnc1e_66c68a8f_167_L000168
 long $0
 long @C_sbnc1f_66c68a8f_169_L000170
 long $0
 long @C_sbnc27_66c68a8f_216_L000217
 long $0
 long @C_sbnc28_66c68a8f_218_L000219
 long $0
 long @C_sbnc29_66c68a8f_220_L000221
 long $0
 long @C_sbnc2a_66c68a8f_222_L000223
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
 long @C_luaopen_math_225_L000226
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
 long @C_sbnc1h_66c68a8f_mathlib_L000173
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 jmp #LODI
 long @C_luaopen_math_227_L000228
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_sbnc27_66c68a8f_216_L000217
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
 long @C_sbnc28_66c68a8f_218_L000219
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
 long @C_sbnc29_66c68a8f_220_L000221
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
 long @C_sbnc2a_66c68a8f_222_L000223
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
 long @C_sbnc1g_66c68a8f_setrandfunc_L000171 ' CALL addrg
 mov r0, #1 ' RET coni
' C_luaopen_math_224 ' (symbol refcount = 0)
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
C_luaopen_math_227_L000228 ' <symbol:227>
 long $40490fdb ' float

 alignl ' align long
C_luaopen_math_225_L000226 ' <symbol:225>
 long $43fc0000 ' float

 alignl ' align long
C_sbnc2a_66c68a8f_222_L000223 ' <symbol:222>
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
C_sbnc29_66c68a8f_220_L000221 ' <symbol:220>
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
C_sbnc28_66c68a8f_218_L000219 ' <symbol:218>
 byte 104
 byte 117
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sbnc27_66c68a8f_216_L000217 ' <symbol:216>
 byte 112
 byte 105
 byte 0

 alignl ' align long
C_sbnc26_66c68a8f_214_L000215 ' <symbol:214>
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_sbnc25_66c68a8f_212_L000213 ' <symbol:212>
 byte 116
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sbnc24_66c68a8f_210_L000211 ' <symbol:210>
 byte 115
 byte 113
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_sbnc23_66c68a8f_208_L000209 ' <symbol:208>
 byte 115
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sbnc22_66c68a8f_206_L000207 ' <symbol:206>
 byte 114
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_sbnc21_66c68a8f_204_L000205 ' <symbol:204>
 byte 109
 byte 111
 byte 100
 byte 102
 byte 0

 alignl ' align long
C_sbnc20_66c68a8f_202_L000203 ' <symbol:202>
 byte 109
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sbnc1v_66c68a8f_200_L000201 ' <symbol:200>
 byte 109
 byte 97
 byte 120
 byte 0

 alignl ' align long
C_sbnc1u_66c68a8f_198_L000199 ' <symbol:198>
 byte 108
 byte 111
 byte 103
 byte 0

 alignl ' align long
C_sbnc1t_66c68a8f_196_L000197 ' <symbol:196>
 byte 117
 byte 108
 byte 116
 byte 0

 alignl ' align long
C_sbnc1s_66c68a8f_194_L000195 ' <symbol:194>
 byte 102
 byte 109
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_sbnc1r_66c68a8f_192_L000193 ' <symbol:192>
 byte 102
 byte 108
 byte 111
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_sbnc1q_66c68a8f_190_L000191 ' <symbol:190>
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
C_sbnc1p_66c68a8f_188_L000189 ' <symbol:188>
 byte 101
 byte 120
 byte 112
 byte 0

 alignl ' align long
C_sbnc1o_66c68a8f_186_L000187 ' <symbol:186>
 byte 100
 byte 101
 byte 103
 byte 0

 alignl ' align long
C_sbnc1n_66c68a8f_184_L000185 ' <symbol:184>
 byte 99
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_sbnc1m_66c68a8f_182_L000183 ' <symbol:182>
 byte 99
 byte 101
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_sbnc1l_66c68a8f_180_L000181 ' <symbol:180>
 byte 97
 byte 116
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sbnc1k_66c68a8f_178_L000179 ' <symbol:178>
 byte 97
 byte 115
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sbnc1j_66c68a8f_176_L000177 ' <symbol:176>
 byte 97
 byte 99
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_sbnc1i_66c68a8f_174_L000175 ' <symbol:174>
 byte 97
 byte 98
 byte 115
 byte 0

 alignl ' align long
C_sbnc1f_66c68a8f_169_L000170 ' <symbol:169>
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
C_sbnc1e_66c68a8f_167_L000168 ' <symbol:167>
 byte 114
 byte 97
 byte 110
 byte 100
 byte 111
 byte 109
 byte 0

 alignl ' align long
C_sbnc17_66c68a8f_math_random_L000139_151_L000152 ' <symbol:151>
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
C_sbnc17_66c68a8f_math_random_L000139_149_L000150 ' <symbol:149>
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
C_sbnc13_66c68a8f_I_2d_L000125_129_L000130 ' <symbol:129>
 long $40000000 ' float

 alignl ' align long
C_sbnc13_66c68a8f_I_2d_L000125_127_L000128 ' <symbol:127>
 long $33800000 ' float

 alignl ' align long
C_sbncu_66c68a8f_math_type_L000110_116_L000117 ' <symbol:116>
 byte 102
 byte 108
 byte 111
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_sbncu_66c68a8f_math_type_L000110_114_L000115 ' <symbol:114>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sbncr_66c68a8f_math_min_L000090_92_L000093 ' <symbol:92>
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
C_sbncp_66c68a8f_math_rad_L000086_88_L000089 ' <symbol:88>
 long $3c8efa35 ' float

 alignl ' align long
C_sbncn_66c68a8f_math_deg_L000082_84_L000085 ' <symbol:84>
 long $42652ee1 ' float

 alignl ' align long
C_sbnck_66c68a8f_math_log_L000072_78_L000079 ' <symbol:78>
 long $41200000 ' float

 alignl ' align long
C_sbncg_66c68a8f_math_modf_L000053_57_L000058 ' <symbol:57>
 long $0 ' float

 alignl ' align long
C_sbnce_66c68a8f_math_fmod_L000044_50_L000051 ' <symbol:50>
 byte 122
 byte 101
 byte 114
 byte 111
 byte 0

 alignl ' align long
C_sbnc9_66c68a8f_pushnumint_L000028_34_L000035 ' <symbol:34>
 long $4f000000 ' float

 alignl ' align long
C_sbnc9_66c68a8f_pushnumint_L000028_32_L000033 ' <symbol:32>
 long $cf000000 ' float

 alignl ' align long
C_sbnc6_66c68a8f_math_atan_L000020_22_L000023 ' <symbol:22>
 long $3f800000 ' float

' Catalina Code

DAT ' code segment
' end
