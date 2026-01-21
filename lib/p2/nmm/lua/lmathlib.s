' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sjas_696de09a_math_abs_L000004 ' <symbol:math_abs>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sjas_696de09a_math_abs_L000004_6 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
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
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_sjas_696de09a_math_abs_L000004_8 ' GEI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sjas_696de09a_math_abs_L000004_8
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_sjas_696de09a_math_abs_L000004_7 ' JUMPV addrg
C_sjas_696de09a_math_abs_L000004_6
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fabs ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_sjas_696de09a_math_abs_L000004_7
 mov r0, #1 ' reg <- coni
' C_sjas_696de09a_math_abs_L000004_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas1_696de09a_math_sin_L000010 ' <symbol:math_sin>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sin ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjas1_696de09a_math_sin_L000010_11 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas2_696de09a_math_cos_L000012 ' <symbol:math_cos>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_cos ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjas2_696de09a_math_cos_L000012_13 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas3_696de09a_math_tan_L000014 ' <symbol:math_tan>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_tan ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjas3_696de09a_math_tan_L000014_15 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas4_696de09a_math_asin_L000016 ' <symbol:math_asin>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_asin ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjas4_696de09a_math_asin_L000016_17 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas5_696de09a_math_acos_L000018 ' <symbol:math_acos>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_acos ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjas5_696de09a_math_acos_L000018_19 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas6_696de09a_math_atan_L000020 ' <symbol:math_atan>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r2, ##@C_sjas6_696de09a_math_atan_L000020_22_L000023
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optnumber
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_atan2
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjas6_696de09a_math_atan_L000020_21 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas8_696de09a_math_toint_L000024 ' <symbol:math_toint>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
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
 if_z jmp #\C_sjas8_696de09a_math_toint_L000024_26 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_sjas8_696de09a_math_toint_L000024_27 ' JUMPV addrg
C_sjas8_696de09a_math_toint_L000024_26
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
C_sjas8_696de09a_math_toint_L000024_27
 mov r0, #1 ' reg <- coni
' C_sjas8_696de09a_math_toint_L000024_25 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas9_696de09a_pushnumint_L000028 ' <symbol:pushnumint>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_sjas9_696de09a_pushnumint_L000028_32_L000033
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_b jmp #\C_sjas9_696de09a_pushnumint_L000028_30 ' LTF4
 mov r22, ##@C_sjas9_696de09a_pushnumint_L000028_34_L000035
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_sjas9_696de09a_pushnumint_L000028_30 ' GEF4
 mov r0, r21 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 if_z jmp #\C_sjas9_696de09a_pushnumint_L000028_30 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_sjas9_696de09a_pushnumint_L000028_31 ' JUMPV addrg
C_sjas9_696de09a_pushnumint_L000028_30
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_sjas9_696de09a_pushnumint_L000028_31
' C_sjas9_696de09a_pushnumint_L000028_29 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjasc_696de09a_math_floor_L000036 ' <symbol:math_floor>
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
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sjasc_696de09a_math_floor_L000036_38 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #\@C_sjasc_696de09a_math_floor_L000036_39 ' JUMPV addrg
C_sjasc_696de09a_math_floor_L000036_38
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_floor ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas9_696de09a_pushnumint_L000028
 add SP, #4 ' CALL addrg
C_sjasc_696de09a_math_floor_L000036_39
 mov r0, #1 ' reg <- coni
' C_sjasc_696de09a_math_floor_L000036_37 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjasd_696de09a_math_ceil_L000040 ' <symbol:math_ceil>
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
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sjasd_696de09a_math_ceil_L000040_42 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #\@C_sjasd_696de09a_math_ceil_L000040_43 ' JUMPV addrg
C_sjasd_696de09a_math_ceil_L000040_42
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ceil ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas9_696de09a_pushnumint_L000028
 add SP, #4 ' CALL addrg
C_sjasd_696de09a_math_ceil_L000040_43
 mov r0, #1 ' reg <- coni
' C_sjasd_696de09a_math_ceil_L000040_41 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjase_696de09a_math_fmod_L000044 ' <symbol:math_fmod>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sjase_696de09a_math_fmod_L000044_46 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sjase_696de09a_math_fmod_L000044_46 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r20, #1 ' ADDU4 coni
 cmp r20, r22 wcz 
 if_a jmp #\C_sjase_696de09a_math_fmod_L000044_48 ' GTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sjase_696de09a_math_fmod_L000044_52 ' NEI4
 mov r2, ##@C_sjase_696de09a_math_fmod_L000044_50_L000051 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sjase_696de09a_math_fmod_L000044_52
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_sjase_696de09a_math_fmod_L000044_47 ' JUMPV addrg
C_sjase_696de09a_math_fmod_L000044_48
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r2, r1 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_sjase_696de09a_math_fmod_L000044_47 ' JUMPV addrg
C_sjase_696de09a_math_fmod_L000044_46
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fmod
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_sjase_696de09a_math_fmod_L000044_47
 mov r0, #1 ' reg <- coni
' C_sjase_696de09a_math_fmod_L000044_45 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjasg_696de09a_math_modf_L000053 ' <symbol:math_modf>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sjasg_696de09a_math_modf_L000053_55 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_sjasg_696de09a_math_modf_L000053_57_L000058
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #\@C_sjasg_696de09a_math_modf_L000053_56 ' JUMPV addrg
C_sjasg_696de09a_math_modf_L000053_55
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sjasg_696de09a_math_modf_L000053_57_L000058
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_sjasg_696de09a_math_modf_L000053_60 ' GEF4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ceil ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #\@C_sjasg_696de09a_math_modf_L000053_61 ' JUMPV addrg
C_sjasg_696de09a_math_modf_L000053_60
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_floor ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_sjasg_696de09a_math_modf_L000053_61
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNF4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas9_696de09a_pushnumint_L000028
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sjasg_696de09a_math_modf_L000053_63 ' NEF4
 mov r17, ##@C_sjasg_696de09a_math_modf_L000053_57_L000058
 rdlong r17, r17 ' reg <- INDIRF4 addrg
 jmp #\@C_sjasg_696de09a_math_modf_L000053_64 ' JUMPV addrg
C_sjasg_696de09a_math_modf_L000053_63
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 mov r17, r0 ' CVI, CVU or LOAD
C_sjasg_696de09a_math_modf_L000053_64
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
C_sjasg_696de09a_math_modf_L000053_56
 mov r0, #2 ' reg <- coni
' C_sjasg_696de09a_math_modf_L000053_54 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjasi_696de09a_math_sqrt_L000065 ' <symbol:math_sqrt>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sqrt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjasi_696de09a_math_sqrt_L000065_66 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjasj_696de09a_math_ult_L000067 ' <symbol:math_ult>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f00000 ' save registers
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
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sjasj_696de09a_math_ult_L000067_70 ' GEU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_sjasj_696de09a_math_ult_L000067_71 ' JUMPV addrg
C_sjasj_696de09a_math_ult_L000067_70
 mov r21, #0 ' reg <- coni
C_sjasj_696de09a_math_ult_L000067_71
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjasj_696de09a_math_ult_L000067_68 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjask_696de09a_math_log_L000072 ' <symbol:math_log>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 if_a jmp #\C_sjask_696de09a_math_log_L000072_74 ' GTI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_log ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #\@C_sjask_696de09a_math_log_L000072_75 ' JUMPV addrg
C_sjask_696de09a_math_log_L000072_74
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_sjask_696de09a_math_log_L000072_78_L000079
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sjask_696de09a_math_log_L000072_76 ' NEF4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_log10 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #\@C_sjask_696de09a_math_log_L000072_77 ' JUMPV addrg
C_sjask_696de09a_math_log_L000072_76
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_log ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_log ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
C_sjask_696de09a_math_log_L000072_77
C_sjask_696de09a_math_log_L000072_75
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjask_696de09a_math_log_L000072_73 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjasm_696de09a_math_exp_L000080 ' <symbol:math_exp>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_exp ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjasm_696de09a_math_exp_L000080_81 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjasn_696de09a_math_deg_L000082 ' <symbol:math_deg>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_sjasn_696de09a_math_deg_L000082_84_L000085
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjasn_696de09a_math_deg_L000082_83 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjasp_696de09a_math_rad_L000086 ' <symbol:math_rad>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_sjasp_696de09a_math_rad_L000086_88_L000089
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjasp_696de09a_math_rad_L000086_87 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjasr_696de09a_math_min_L000090 ' <symbol:math_min>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r19, #1 ' reg <- coni
 mov r22, #1 ' reg <- coni
 cmps r17, r22 wcz
 if_ae jmp #\C_sjasr_696de09a_math_min_L000090_94 ' GEI4
 mov r2, ##@C_sjasr_696de09a_math_min_L000090_92_L000093 ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sjasr_696de09a_math_min_L000090_94
 mov r21, #2 ' reg <- coni
 jmp #\@C_sjasr_696de09a_math_min_L000090_98 ' JUMPV addrg
C_sjasr_696de09a_math_min_L000090_95
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_compare
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sjasr_696de09a_math_min_L000090_99 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
C_sjasr_696de09a_math_min_L000090_99
' C_sjasr_696de09a_math_min_L000090_96 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sjasr_696de09a_math_min_L000090_98
 cmps r21, r17 wcz
 if_be jmp #\C_sjasr_696de09a_math_min_L000090_95 ' LEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjasr_696de09a_math_min_L000090_91 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjast_696de09a_math_max_L000101 ' <symbol:math_max>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r19, #1 ' reg <- coni
 mov r22, #1 ' reg <- coni
 cmps r17, r22 wcz
 if_ae jmp #\C_sjast_696de09a_math_max_L000101_103 ' GEI4
 mov r2, ##@C_sjasr_696de09a_math_min_L000090_92_L000093 ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sjast_696de09a_math_max_L000101_103
 mov r21, #2 ' reg <- coni
 jmp #\@C_sjast_696de09a_math_max_L000101_107 ' JUMPV addrg
C_sjast_696de09a_math_max_L000101_104
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_compare
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sjast_696de09a_math_max_L000101_108 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
C_sjast_696de09a_math_max_L000101_108
' C_sjast_696de09a_math_max_L000101_105 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sjast_696de09a_math_max_L000101_107
 cmps r21, r17 wcz
 if_be jmp #\C_sjast_696de09a_math_max_L000101_104 ' LEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sjast_696de09a_math_max_L000101_102 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjasu_696de09a_math_type_L000110 ' <symbol:math_type>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #3 wz
 if_nz jmp #\C_sjasu_696de09a_math_type_L000110_112 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sjasu_696de09a_math_type_L000110_119 ' EQI4
 mov r21, ##@C_sjasu_696de09a_math_type_L000110_114_L000115 ' reg <- addrg
 jmp #\@C_sjasu_696de09a_math_type_L000110_120 ' JUMPV addrg
C_sjasu_696de09a_math_type_L000110_119
 mov r21, ##@C_sjasu_696de09a_math_type_L000110_116_L000117 ' reg <- addrg
C_sjasu_696de09a_math_type_L000110_120
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #\@C_sjasu_696de09a_math_type_L000110_113 ' JUMPV addrg
C_sjasu_696de09a_math_type_L000110_112
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
C_sjasu_696de09a_math_type_L000110_113
 mov r0, #1 ' reg <- coni
' C_sjasu_696de09a_math_type_L000110_111 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas11_696de09a_packI__L000121 ' <symbol:packI>
 calld PA,#NEWF
 sub SP, #8
 mov RI, FP
 sub RI, #-(-12)
 wrlong r3, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNU4 addrli reg
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
' C_sjas11_696de09a_packI__L000121_122 ' (symbol refcount = 0)
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas12_696de09a_I_shl_L000125 ' <symbol:Ishl>
 calld PA,#NEWF
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_sjas11_696de09a_packI__L000121
 add SP, #8 ' CALL addrg
' C_sjas12_696de09a_I_shl_L000125_126 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas13_696de09a_I_xor_L000128 ' <symbol:Ixor>
 calld PA,#PSHM
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
' C_sjas13_696de09a_I_xor_L000128_129 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sjas14_696de09a_I_add_L000130 ' <symbol:Iadd>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_sjas11_696de09a_packI__L000121
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sjas14_696de09a_I_add_L000130_133 ' GEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sjas14_696de09a_I_add_L000130_133
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
' C_sjas14_696de09a_I_add_L000130_131 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas15_696de09a_times5_L000136 ' <symbol:times5>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas12_696de09a_I_shl_L000125
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas14_696de09a_I_add_L000130
 add SP, #8 ' CALL addrg
' C_sjas15_696de09a_times5_L000136_137 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas16_696de09a_times9_L000139 ' <symbol:times9>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #3 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas12_696de09a_I_shl_L000125
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas14_696de09a_I_add_L000130
 add SP, #8 ' CALL addrg
' C_sjas16_696de09a_times9_L000139_140 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas17_696de09a_rotl_L000142 ' <symbol:rotl>
 calld PA,#NEWF
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_sjas11_696de09a_packI__L000121
 add SP, #8 ' CALL addrg
' C_sjas17_696de09a_rotl_L000142_143 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas18_696de09a_rotl1_L000145 ' <symbol:rotl1>
 calld PA,#NEWF
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_sjas11_696de09a_packI__L000121
 add SP, #8 ' CALL addrg
' C_sjas18_696de09a_rotl1_L000145_146 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas19_696de09a_nextrand_L000148 ' <symbol:nextrand>
 calld PA,#NEWF
 sub SP, #104
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r21
 adds r1, #8 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas15_696de09a_times5_L000136
 add SP, #4 ' CALL addrg
 mov r2, #7 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-44) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas17_696de09a_rotl_L000142
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas16_696de09a_times9_L000139
 add SP, #4 ' CALL addrg
 mov r2, #17 ' reg ARG coni
 mov r0, FP
 sub r0, #-(-52) ' reg <- addrli
 mov r1, r21
 adds r1, #8 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas12_696de09a_I_shl_L000125
 add SP, #8 ' CALL addrg
 mov r0, FP
 sub r0, #-(-60) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas13_696de09a_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-68) ' reg <- addrli
 mov r1, r21
 adds r1, #8 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #24 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas13_696de09a_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-76) ' reg <- addrli
 mov r1, r21
 adds r1, #16 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #8 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas13_696de09a_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-84) ' reg <- addrli
 mov r1, r21
 adds r1, #24 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas13_696de09a_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-92) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-92) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas13_696de09a_I_xor_L000128
 add SP, #4 ' CALL addrg
 mov r2, #45 ' reg ARG coni
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov r0, FP
 sub r0, #-(-100) ' reg <- addrli
 mov r1, r22 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-108) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas18_696de09a_rotl1_L000145
 add SP, #8 ' CALL addrg
 mov r0, r22 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-108) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
' C_sjas19_696de09a_nextrand_L000148_149 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #104 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas1a_696de09a_I_2d_L000151 ' <symbol:I2d>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $540000 ' save registers
 rdlong r22, r2 ' reg <- INDIRU4 reg
 shr r22, #8 ' RSHU4 coni
 mov r20, ##@C_sjas1a_696de09a_I_2d_L000151_153_L000154
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r18, r22
 shr r18, #1 ' RSHU4 coni
 mov r0, r18 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, ##@C_sjas1a_696de09a_I_2d_L000151_155_L000156
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
' C_sjas1a_696de09a_I_2d_L000151_152 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas1d_696de09a_I_2U_I_nt_L000157 ' <symbol:I2UInt>
 calld PA,#PSHM
 long $500000 ' save registers
 rdlong r22, r2 ' reg <- INDIRU4 reg
 shl r22, #31 ' LSHU4 coni
 shl r22, #1 ' LSHU4 coni
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r0, r22 ' BORI/U
 or r0, r20 ' BORI/U (3)
' C_sjas1d_696de09a_I_2U_I_nt_L000157_158 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sjas1e_696de09a_I_nt2I__L000159 ' <symbol:Int2I>
 calld PA,#NEWF
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_sjas11_696de09a_packI__L000121
 add SP, #8 ' CALL addrg
' C_sjas1e_696de09a_I_nt2I__L000159_160 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sjas1f_696de09a_project_L000163 ' <symbol:project>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 add r22, #1 ' ADDU4 coni
 and r22, r21 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_nz jmp #\C_sjas1f_696de09a_project_L000163_165  ' NEU4
 mov r0, r23 ' BANDI/U
 and r0, r21 ' BANDI/U (3)
 jmp #\@C_sjas1f_696de09a_project_L000163_164 ' JUMPV addrg
C_sjas1f_696de09a_project_L000163_165
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
 jmp #\@C_sjas1f_696de09a_project_L000163_168 ' JUMPV addrg
C_sjas1f_696de09a_project_L000163_167
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas19_696de09a_nextrand_L000148
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sjas1d_696de09a_I_2U_I_nt_L000157 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_sjas1f_696de09a_project_L000163_168
 mov r22, r23 ' BANDI/U
 and r22, r17 ' BANDI/U (3)
 mov r23, r22 ' CVI, CVU or LOAD
 cmp r22, r21 wcz 
 if_a jmp #\C_sjas1f_696de09a_project_L000163_167 ' GTU4
 mov r0, r23 ' CVI, CVU or LOAD
C_sjas1f_696de09a_project_L000163_164
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas1g_696de09a_math_random_L000170 ' <symbol:math_random>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##-1001001 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas19_696de09a_nextrand_L000148
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 if_z jmp #\C_sjas1g_696de09a_math_random_L000170_175 ' EQI4
 cmps r17,  #1 wz
 if_z jmp #\C_sjas1g_696de09a_math_random_L000170_176 ' EQI4
 cmps r17,  #2 wz
 if_z jmp #\C_sjas1g_696de09a_math_random_L000170_179 ' EQI4
 jmp #\@C_sjas1g_696de09a_math_random_L000170_172 ' JUMPV addrg
C_sjas1g_696de09a_math_random_L000170_175
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sjas1a_696de09a_I_2d_L000151 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sjas1g_696de09a_math_random_L000170_171 ' JUMPV addrg
C_sjas1g_696de09a_math_random_L000170_176
 mov r22, #1 ' reg <- coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sjas1g_696de09a_math_random_L000170_173 ' NEI4
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sjas1d_696de09a_I_2U_I_nt_L000157 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sjas1g_696de09a_math_random_L000170_171 ' JUMPV addrg
C_sjas1g_696de09a_math_random_L000170_179
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_sjas1g_696de09a_math_random_L000170_173 ' JUMPV addrg
C_sjas1g_696de09a_math_random_L000170_172
 mov r2, ##@C_sjas1g_696de09a_math_random_L000170_180_L000181 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sjas1g_696de09a_math_random_L000170_171 ' JUMPV addrg
C_sjas1g_696de09a_math_random_L000170_173
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 if_be jmp #\C_sjas1g_696de09a_math_random_L000170_184 ' LEI4
 mov r2, ##@C_sjas1g_696de09a_math_random_L000170_182_L000183 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sjas1g_696de09a_math_random_L000170_184
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, FP
 sub r1, #-(-16) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sjas1d_696de09a_I_2U_I_nt_L000157 ' CALL addrg
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
 calld PA,#CALA
 long @C_sjas1f_696de09a_project_L000163
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sjas1g_696de09a_math_random_L000170_171
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas1j_696de09a_setseed_L000185 ' <symbol:setseed>
 calld PA,#NEWF
 sub SP, #40
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_sjas1e_696de09a_I_nt2I__L000159
 add SP, #4 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #255 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas1e_696de09a_I_nt2I__L000159
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #8 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas1e_696de09a_I_nt2I__L000159
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #16 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-28) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas1e_696de09a_I_nt2I__L000159
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #24 ' ADDP4 coni
 mov r1, FP
 sub r1, #-(-36) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r15, #0 ' reg <- coni
C_sjas1j_696de09a_setseed_L000185_187
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas19_696de09a_nextrand_L000148
 add SP, #4 ' CALL addrg
' C_sjas1j_696de09a_setseed_L000185_188 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #16 wcz
 if_b jmp #\C_sjas1j_696de09a_setseed_L000185_187 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
' C_sjas1j_696de09a_setseed_L000185_186 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #40 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas1k_696de09a_randseed_L000191 ' <symbol:randseed>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_time ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
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
 calld PA,#CALA
 long @C_sjas1j_696de09a_setseed_L000185
 add SP, #12 ' CALL addrg
' C_sjas1k_696de09a_randseed_L000191_192 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjas1l_696de09a_math_randomseed_L000193 ' <symbol:math_randomseed>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##-1001001 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_sjas1l_696de09a_math_randomseed_L000193_195 ' NEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas1k_696de09a_randseed_L000191
 add SP, #4 ' CALL addrg
 jmp #\@C_sjas1l_696de09a_math_randomseed_L000193_196 ' JUMPV addrg
C_sjas1l_696de09a_math_randomseed_L000193_195
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
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
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas1j_696de09a_setseed_L000185
 add SP, #12 ' CALL addrg
C_sjas1l_696de09a_math_randomseed_L000193_196
 mov r0, #2 ' reg <- coni
' C_sjas1l_696de09a_math_randomseed_L000193_194 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjas1m_696de09a_randfuncs_L000197 ' <symbol:randfuncs>
 long @C_sjas1n_696de09a_198_L000199
 long @C_sjas1g_696de09a_math_random_L000170
 long @C_sjas1o_696de09a_200_L000201
 long @C_sjas1l_696de09a_math_randomseed_L000193
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sjas1p_696de09a_setrandfunc_L000202 ' <symbol:setrandfunc>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sjas1k_696de09a_randseed_L000191
 add SP, #4 ' CALL addrg
 mov r2, ##-3 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_sjas1m_696de09a_randfuncs_L000197 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
' C_sjas1p_696de09a_setrandfunc_L000202_203 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjas1q_696de09a_mathlib_L000204 ' <symbol:mathlib>
 long @C_sjas1r_696de09a_205_L000206
 long @C_sjas_696de09a_math_abs_L000004
 long @C_sjas1s_696de09a_207_L000208
 long @C_sjas5_696de09a_math_acos_L000018
 long @C_sjas1t_696de09a_209_L000210
 long @C_sjas4_696de09a_math_asin_L000016
 long @C_sjas1u_696de09a_211_L000212
 long @C_sjas6_696de09a_math_atan_L000020
 long @C_sjas1v_696de09a_213_L000214
 long @C_sjasd_696de09a_math_ceil_L000040
 long @C_sjas20_696de09a_215_L000216
 long @C_sjas2_696de09a_math_cos_L000012
 long @C_sjas21_696de09a_217_L000218
 long @C_sjasn_696de09a_math_deg_L000082
 long @C_sjas22_696de09a_219_L000220
 long @C_sjasm_696de09a_math_exp_L000080
 long @C_sjas23_696de09a_221_L000222
 long @C_sjas8_696de09a_math_toint_L000024
 long @C_sjas24_696de09a_223_L000224
 long @C_sjasc_696de09a_math_floor_L000036
 long @C_sjas25_696de09a_225_L000226
 long @C_sjase_696de09a_math_fmod_L000044
 long @C_sjas26_696de09a_227_L000228
 long @C_sjasj_696de09a_math_ult_L000067
 long @C_sjas27_696de09a_229_L000230
 long @C_sjask_696de09a_math_log_L000072
 long @C_sjas28_696de09a_231_L000232
 long @C_sjast_696de09a_math_max_L000101
 long @C_sjas29_696de09a_233_L000234
 long @C_sjasr_696de09a_math_min_L000090
 long @C_sjas2a_696de09a_235_L000236
 long @C_sjasg_696de09a_math_modf_L000053
 long @C_sjas2b_696de09a_237_L000238
 long @C_sjasp_696de09a_math_rad_L000086
 long @C_sjas2c_696de09a_239_L000240
 long @C_sjas1_696de09a_math_sin_L000010
 long @C_sjas2d_696de09a_241_L000242
 long @C_sjasi_696de09a_math_sqrt_L000065
 long @C_sjas2e_696de09a_243_L000244
 long @C_sjas3_696de09a_math_tan_L000014
 long @C_sjas2f_696de09a_245_L000246
 long @C_sjasu_696de09a_math_type_L000110
 long @C_sjas1n_696de09a_198_L000199
 long $0
 long @C_sjas1o_696de09a_200_L000201
 long $0
 long @C_sjas2g_696de09a_247_L000248
 long $0
 long @C_sjas2h_696de09a_249_L000250
 long $0
 long @C_sjas2i_696de09a_251_L000252
 long $0
 long @C_sjas2j_696de09a_253_L000254
 long $0
 long $0
 long $0

' Catalina Export luaopen_math

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_math ' <symbol:luaopen_math>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_math_256_L000257
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #27 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_sjas1q_696de09a_mathlib_L000204 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_math_258_L000259
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r2, ##@C_sjas2g_696de09a_247_L000248 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r2, ##@C_sjas2h_696de09a_249_L000250 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##2147483647 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, ##@C_sjas2i_696de09a_251_L000252 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2147483648 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, ##@C_sjas2j_696de09a_253_L000254 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sjas1p_696de09a_setrandfunc_L000202 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_math_255 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


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
C_sjas2j_696de09a_253_L000254 ' <symbol:253>
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
C_sjas2i_696de09a_251_L000252 ' <symbol:251>
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
C_sjas2h_696de09a_249_L000250 ' <symbol:249>
 byte 104
 byte 117
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sjas2g_696de09a_247_L000248 ' <symbol:247>
 byte 112
 byte 105
 byte 0

 alignl ' align long
C_sjas2f_696de09a_245_L000246 ' <symbol:245>
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_sjas2e_696de09a_243_L000244 ' <symbol:243>
 byte 116
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sjas2d_696de09a_241_L000242 ' <symbol:241>
 byte 115
 byte 113
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_sjas2c_696de09a_239_L000240 ' <symbol:239>
 byte 115
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sjas2b_696de09a_237_L000238 ' <symbol:237>
 byte 114
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_sjas2a_696de09a_235_L000236 ' <symbol:235>
 byte 109
 byte 111
 byte 100
 byte 102
 byte 0

 alignl ' align long
C_sjas29_696de09a_233_L000234 ' <symbol:233>
 byte 109
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sjas28_696de09a_231_L000232 ' <symbol:231>
 byte 109
 byte 97
 byte 120
 byte 0

 alignl ' align long
C_sjas27_696de09a_229_L000230 ' <symbol:229>
 byte 108
 byte 111
 byte 103
 byte 0

 alignl ' align long
C_sjas26_696de09a_227_L000228 ' <symbol:227>
 byte 117
 byte 108
 byte 116
 byte 0

 alignl ' align long
C_sjas25_696de09a_225_L000226 ' <symbol:225>
 byte 102
 byte 109
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_sjas24_696de09a_223_L000224 ' <symbol:223>
 byte 102
 byte 108
 byte 111
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_sjas23_696de09a_221_L000222 ' <symbol:221>
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
C_sjas22_696de09a_219_L000220 ' <symbol:219>
 byte 101
 byte 120
 byte 112
 byte 0

 alignl ' align long
C_sjas21_696de09a_217_L000218 ' <symbol:217>
 byte 100
 byte 101
 byte 103
 byte 0

 alignl ' align long
C_sjas20_696de09a_215_L000216 ' <symbol:215>
 byte 99
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_sjas1v_696de09a_213_L000214 ' <symbol:213>
 byte 99
 byte 101
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_sjas1u_696de09a_211_L000212 ' <symbol:211>
 byte 97
 byte 116
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sjas1t_696de09a_209_L000210 ' <symbol:209>
 byte 97
 byte 115
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sjas1s_696de09a_207_L000208 ' <symbol:207>
 byte 97
 byte 99
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_sjas1r_696de09a_205_L000206 ' <symbol:205>
 byte 97
 byte 98
 byte 115
 byte 0

 alignl ' align long
C_sjas1o_696de09a_200_L000201 ' <symbol:200>
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
C_sjas1n_696de09a_198_L000199 ' <symbol:198>
 byte 114
 byte 97
 byte 110
 byte 100
 byte 111
 byte 109
 byte 0

 alignl ' align long
C_sjas1g_696de09a_math_random_L000170_182_L000183 ' <symbol:182>
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
C_sjas1g_696de09a_math_random_L000170_180_L000181 ' <symbol:180>
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
C_sjas1a_696de09a_I_2d_L000151_155_L000156 ' <symbol:155>
 long $33800000 ' float

 alignl ' align long
C_sjas1a_696de09a_I_2d_L000151_153_L000154 ' <symbol:153>
 long $40000000 ' float

 alignl ' align long
C_sjasu_696de09a_math_type_L000110_116_L000117 ' <symbol:116>
 byte 102
 byte 108
 byte 111
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_sjasu_696de09a_math_type_L000110_114_L000115 ' <symbol:114>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sjasr_696de09a_math_min_L000090_92_L000093 ' <symbol:92>
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
C_sjasp_696de09a_math_rad_L000086_88_L000089 ' <symbol:88>
 long $3c8efa35 ' float

 alignl ' align long
C_sjasn_696de09a_math_deg_L000082_84_L000085 ' <symbol:84>
 long $42652ee1 ' float

 alignl ' align long
C_sjask_696de09a_math_log_L000072_78_L000079 ' <symbol:78>
 long $41200000 ' float

 alignl ' align long
C_sjasg_696de09a_math_modf_L000053_57_L000058 ' <symbol:57>
 long $0 ' float

 alignl ' align long
C_sjase_696de09a_math_fmod_L000044_50_L000051 ' <symbol:50>
 byte 122
 byte 101
 byte 114
 byte 111
 byte 0

 alignl ' align long
C_sjas9_696de09a_pushnumint_L000028_34_L000035 ' <symbol:34>
 long $4f000000 ' float

 alignl ' align long
C_sjas9_696de09a_pushnumint_L000028_32_L000033 ' <symbol:32>
 long $cf000000 ' float

 alignl ' align long
C_sjas6_696de09a_math_atan_L000020_22_L000023 ' <symbol:22>
 long $3f800000 ' float

' Catalina Code

DAT ' code segment
' end
