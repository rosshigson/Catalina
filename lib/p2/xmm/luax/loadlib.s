' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_subo_68fd76bd_C_L_I_B_S__L000004 ' <symbol:CLIBS>
 long @C_subo1_68fd76bd_5_L000006

' Catalina Code

DAT ' code segment

 alignl ' align long
C_subo2_68fd76bd_lsys_unloadlib_L000007 ' <symbol:lsys_unloadlib>
' C_subo2_68fd76bd_lsys_unloadlib_L000007_10 ' (symbol refcount = 0)
 jmp #RETN


 alignl ' align long
C_subo3_68fd76bd_lsys_load_L000008 ' <symbol:lsys_load>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_subo3_68fd76bd_lsys_load_L000008_12_L000013
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
' C_subo3_68fd76bd_lsys_load_L000008_11 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subo4_68fd76bd_lsys_sym_L000009 ' <symbol:lsys_sym>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_subo3_68fd76bd_lsys_load_L000008_12_L000013
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
' C_subo4_68fd76bd_lsys_sym_L000009_14 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subo6_68fd76bd_noenv_L000015 ' <symbol:noenv>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_subo6_68fd76bd_noenv_L000015_17_L000018
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
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
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
' C_subo6_68fd76bd_noenv_L000015_16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_subo8_68fd76bd_setpath_L000019 ' <symbol:setpath>
 jmp #NEWF
 sub SP, #284
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_subo8_68fd76bd_setpath_L000019_23_L000024
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subo8_68fd76bd_setpath_L000019_21_L000022
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
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getenv ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subo8_68fd76bd_setpath_L000019_25 ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getenv ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_subo8_68fd76bd_setpath_L000019_25
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_subo8_68fd76bd_setpath_L000019_29 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_subo6_68fd76bd_noenv_L000015 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_subo8_68fd76bd_setpath_L000019_27 ' EQI4
C_subo8_68fd76bd_setpath_L000019_29
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_subo8_68fd76bd_setpath_L000019_28 ' JUMPV addrg
C_subo8_68fd76bd_setpath_L000019_27
 jmp #LODL
 long @C_subo8_68fd76bd_setpath_L000019_32_L000033
 mov r2, RI ' reg ARG ADDRG
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strstr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subo8_68fd76bd_setpath_L000019_30 ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_subo8_68fd76bd_setpath_L000019_31 ' JUMPV addrg
C_subo8_68fd76bd_setpath_L000019_30
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov RI, FP
 sub RI, #-(-288)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, FP
 sub r2, #-(-284) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_subo8_68fd76bd_setpath_L000019_34 ' GEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r15 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-284) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-276) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, FP
 sub r20, #-(-280) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_subo8_68fd76bd_setpath_L000019_41' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-284) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_subo8_68fd76bd_setpath_L000019_41
 mov r22, FP
 sub r22, #-(-276) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-276)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-284) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long @C_subo8_68fd76bd_setpath_L000019_39_L000040
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 addrg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_subo8_68fd76bd_setpath_L000019_34
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-284) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-288) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 adds r20, r15 ' ADDI/P (1)
 jmp #LODL
 long -2
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_subo8_68fd76bd_setpath_L000019_42 ' GEU4
 mov r22, FP
 sub r22, #-(-276) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, FP
 sub r20, #-(-280) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_subo8_68fd76bd_setpath_L000019_47' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-284) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_subo8_68fd76bd_setpath_L000019_47
 mov r22, FP
 sub r22, #-(-276) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-276)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-284) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long @C_subo8_68fd76bd_setpath_L000019_39_L000040
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 addrg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-288) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 adds r20, r15 ' ADDI/P (1)
 jmp #LODL
 long -2
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov r18, r22 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #2 ' ADDP4 coni
 mov r4, FP
 sub r4, #-(-284) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
C_subo8_68fd76bd_setpath_L000019_42
 mov r2, FP
 sub r2, #-(-284) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__pushresult ' CALL addrg
C_subo8_68fd76bd_setpath_L000019_31
C_subo8_68fd76bd_setpath_L000019_28
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
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_subo8_68fd76bd_setpath_L000019_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #284 ' framesize
 jmp #RETF


 alignl ' align long
C_subod_68fd76bd_checkclib_L000048 ' <symbol:checkclib>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_subo_68fd76bd_C_L_I_B_S__L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
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
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
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
' C_subod_68fd76bd_checkclib_L000048_49 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_suboe_68fd76bd_addtoclib_L000050 ' <symbol:addtoclib>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_subo_68fd76bd_C_L_I_B_S__L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
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
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__len
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawseti
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
' C_suboe_68fd76bd_addtoclib_L000050_51 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subof_68fd76bd_gctm_L000052 ' <symbol:gctm>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__len
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_subof_68fd76bd_gctm_L000052_57 ' JUMPV addrg
C_subof_68fd76bd_gctm_L000052_54
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_subo2_68fd76bd_lsys_unloadlib_L000007 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_subof_68fd76bd_gctm_L000052_55 ' (symbol refcount = 0)
 subs r21, #1 ' SUBI4 coni
C_subof_68fd76bd_gctm_L000052_57
 cmps r21,  #1 wz,wc
 jmp #BRAE
 long @C_subof_68fd76bd_gctm_L000052_54 ' GEI4
 mov r0, #0 ' reg <- coni
' C_subof_68fd76bd_gctm_L000052_53 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subog_68fd76bd_lookforfunc_L000058 ' <symbol:lookforfunc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_subod_68fd76bd_checkclib_L000048
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subog_68fd76bd_lookforfunc_L000058_60 ' NEU4
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 jmp #BRNZ
 long @C_subog_68fd76bd_lookforfunc_L000058_63 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_subog_68fd76bd_lookforfunc_L000058_64 ' JUMPV addrg
C_subog_68fd76bd_lookforfunc_L000058_63
 mov r15, #0 ' reg <- coni
C_subog_68fd76bd_lookforfunc_L000058_64
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo3_68fd76bd_lsys_load_L000008
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subog_68fd76bd_lookforfunc_L000058_65 ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_subog_68fd76bd_lookforfunc_L000058_59 ' JUMPV addrg
C_subog_68fd76bd_lookforfunc_L000058_65
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_suboe_68fd76bd_addtoclib_L000050
 add SP, #8 ' CALL addrg
C_subog_68fd76bd_lookforfunc_L000058_60
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #42 wz
 jmp #BRNZ
 long @C_subog_68fd76bd_lookforfunc_L000058_67 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_subog_68fd76bd_lookforfunc_L000058_59 ' JUMPV addrg
C_subog_68fd76bd_lookforfunc_L000058_67
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo4_68fd76bd_lsys_sym_L000009
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subog_68fd76bd_lookforfunc_L000058_69 ' NEU4
 mov r0, #2 ' reg <- coni
 jmp #JMPA
 long @C_subog_68fd76bd_lookforfunc_L000058_59 ' JUMPV addrg
C_subog_68fd76bd_lookforfunc_L000058_69
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_subog_68fd76bd_lookforfunc_L000058_59
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_suboh_68fd76bd_ll_loadlib_L000071 ' <symbol:ll_loadlib>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $e00000 ' save registers
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
 sub RI, #-(-12)
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
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subog_68fd76bd_lookforfunc_L000058
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_suboh_68fd76bd_ll_loadlib_L000071_73 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_suboh_68fd76bd_ll_loadlib_L000071_72 ' JUMPV addrg
C_suboh_68fd76bd_ll_loadlib_L000071_73
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_suboh_68fd76bd_ll_loadlib_L000071_80 ' NEI4
 jmp #LODL
 long @C_suboh_68fd76bd_ll_loadlib_L000071_75_L000076
 mov r21, RI ' reg <- addrg
 jmp #JMPA
 long @C_suboh_68fd76bd_ll_loadlib_L000071_81 ' JUMPV addrg
C_suboh_68fd76bd_ll_loadlib_L000071_80
 jmp #LODL
 long @C_suboh_68fd76bd_ll_loadlib_L000071_77_L000078
 mov r21, RI ' reg <- addrg
C_suboh_68fd76bd_ll_loadlib_L000071_81
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #3 ' reg <- coni
C_suboh_68fd76bd_ll_loadlib_L000071_72
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_subok_68fd76bd_readable_L000082 ' <symbol:readable>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_subok_68fd76bd_readable_L000082_84_L000085
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subok_68fd76bd_readable_L000082_86 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_subok_68fd76bd_readable_L000082_83 ' JUMPV addrg
C_subok_68fd76bd_readable_L000082_86
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 mov r0, #1 ' reg <- coni
C_subok_68fd76bd_readable_L000082_83
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subom_68fd76bd_getnextfilename_L000088 ' <symbol:getnextfilename>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_subom_68fd76bd_getnextfilename_L000088_90 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_subom_68fd76bd_getnextfilename_L000088_89 ' JUMPV addrg
C_subom_68fd76bd_getnextfilename_L000088_90
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_subom_68fd76bd_getnextfilename_L000088_92 ' NEI4
 jmp #LODL
 long @C_subo8_68fd76bd_setpath_L000019_39_L000040
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 mov RI, r19
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 adds r19, #1 ' ADDP4 coni
C_subom_68fd76bd_getnextfilename_L000088_92
 jmp #LODL
 long @C_subo8_68fd76bd_setpath_L000019_39_L000040
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subom_68fd76bd_getnextfilename_L000088_94 ' NEU4
 mov r17, r21 ' CVI, CVU or LOAD
C_subom_68fd76bd_getnextfilename_L000088_94
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
C_subom_68fd76bd_getnextfilename_L000088_89
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subon_68fd76bd_pusherrornotfound_L000096 ' <symbol:pusherrornotfound>
 jmp #NEWF
 sub SP, #272
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_subon_68fd76bd_pusherrornotfound_L000096_98_L000099
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_subon_68fd76bd_pusherrornotfound_L000096_100_L000101
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_subo8_68fd76bd_setpath_L000019_39_L000040
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-276) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addgsub
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_subon_68fd76bd_pusherrornotfound_L000096_102_L000103
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__pushresult ' CALL addrg
' C_subon_68fd76bd_pusherrornotfound_L000096_97 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #272 ' framesize
 jmp #RETF


 alignl ' align long
C_subor_68fd76bd_searchpath_L000104 ' <symbol:searchpath>
 jmp #NEWF
 sub SP, #276
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_subor_68fd76bd_searchpath_L000104_106 ' EQI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_subor_68fd76bd_searchpath_L000104_106 ' EQU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__gsub
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_subor_68fd76bd_searchpath_L000104_106
 mov r2, FP
 sub r2, #-(-280) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subor_68fd76bd_searchpath_L000104_108_L000109
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-280) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addgsub
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, FP
 sub r20, #-(-276) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_subor_68fd76bd_searchpath_L000104_113' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_subor_68fd76bd_searchpath_L000104_113
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-272)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-280) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-280) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-272) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_subor_68fd76bd_searchpath_L000104_116 ' JUMPV addrg
C_subor_68fd76bd_searchpath_L000104_115
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_subok_68fd76bd_readable_L000082 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_subor_68fd76bd_searchpath_L000104_118 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_subor_68fd76bd_searchpath_L000104_105 ' JUMPV addrg
C_subor_68fd76bd_searchpath_L000104_118
C_subor_68fd76bd_searchpath_L000104_116
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_subom_68fd76bd_getnextfilename_L000088
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subor_68fd76bd_searchpath_L000104_115 ' NEU4
 mov r2, FP
 sub r2, #-(-280) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__pushresult ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_subon_68fd76bd_pusherrornotfound_L000096
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_subor_68fd76bd_searchpath_L000104_105
 jmp #POPM ' restore registers
 add SP, #276 ' framesize
 jmp #RETF


 alignl ' align long
C_subot_68fd76bd_ll_searchpath_L000120 ' <symbol:ll_searchpath>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d50000 ' save registers
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
 mov r22, r0 ' CVI, CVU or LOAD
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
 mov r20, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_subot_68fd76bd_ll_searchpath_L000120_122_L000123
 mov r3, RI ' reg ARG ADDRG
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r18, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_subot_68fd76bd_ll_searchpath_L000120_124_L000125
 mov r3, RI ' reg ARG ADDRG
 mov r4, #4 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r16, r0 ' CVI, CVU or LOAD
 mov r2, r16 ' CVI, CVU or LOAD
 mov r3, r18 ' CVI, CVU or LOAD
 mov r4, r20 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_subor_68fd76bd_searchpath_L000104
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_subot_68fd76bd_ll_searchpath_L000120_126 ' EQU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_subot_68fd76bd_ll_searchpath_L000120_121 ' JUMPV addrg
C_subot_68fd76bd_ll_searchpath_L000120_126
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
C_subot_68fd76bd_ll_searchpath_L000120_121
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_subo10_68fd76bd_findfile_L000128 ' <symbol:findfile>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long -1001001
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
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
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subo10_68fd76bd_findfile_L000128_130 ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subo10_68fd76bd_findfile_L000128_132_L000133
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
C_subo10_68fd76bd_findfile_L000128_130
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subot_68fd76bd_ll_searchpath_L000120_122_L000123
 mov r3, RI ' reg ARG ADDRG
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_subor_68fd76bd_searchpath_L000104
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_subo10_68fd76bd_findfile_L000128_129 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subo12_68fd76bd_checkload_L000134 ' <symbol:checkload>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_subo12_68fd76bd_checkload_L000134_136 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #JMPA
 long @C_subo12_68fd76bd_checkload_L000134_135 ' JUMPV addrg
C_subo12_68fd76bd_checkload_L000134_136
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
 mov r22, r0 ' CVI, CVU or LOAD
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
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subo12_68fd76bd_checkload_L000134_138_L000139
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
C_subo12_68fd76bd_checkload_L000134_135
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subo14_68fd76bd_searcher_L_ua_L000140 ' <symbol:searcher_Lua>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
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
 long @C_subot_68fd76bd_ll_searchpath_L000120_124_L000125
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_subo14_68fd76bd_searcher_L_ua_L000140_142_L000143
 mov r3, RI ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo10_68fd76bd_findfile_L000128
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subo14_68fd76bd_searcher_L_ua_L000140_144 ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_subo14_68fd76bd_searcher_L_ua_L000140_141 ' JUMPV addrg
C_subo14_68fd76bd_searcher_L_ua_L000140_144
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__loadfilex
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_subo14_68fd76bd_searcher_L_ua_L000140_147 ' NEI4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_subo14_68fd76bd_searcher_L_ua_L000140_148 ' JUMPV addrg
C_subo14_68fd76bd_searcher_L_ua_L000140_147
 mov r19, #0 ' reg <- coni
C_subo14_68fd76bd_searcher_L_ua_L000140_148
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo12_68fd76bd_checkload_L000134
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_subo14_68fd76bd_searcher_L_ua_L000140_141
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_subo16_68fd76bd_loadfunc_L000149 ' <symbol:loadfunc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_subo16_68fd76bd_loadfunc_L000149_151_L000152
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_subot_68fd76bd_ll_searchpath_L000120_122_L000123
 mov r3, RI ' reg ARG ADDRG
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__gsub
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subo16_68fd76bd_loadfunc_L000149_153_L000154
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_subo16_68fd76bd_loadfunc_L000149_155 ' EQU4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subo16_68fd76bd_loadfunc_L000149_157_L000158
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subog_68fd76bd_lookforfunc_L000058
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #2 wz
 jmp #BR_Z
 long @C_subo16_68fd76bd_loadfunc_L000149_159 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_subo16_68fd76bd_loadfunc_L000149_150 ' JUMPV addrg
C_subo16_68fd76bd_loadfunc_L000149_159
 mov r19, r15
 adds r19, #1 ' ADDP4 coni
C_subo16_68fd76bd_loadfunc_L000149_155
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subo16_68fd76bd_loadfunc_L000149_157_L000158
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subog_68fd76bd_lookforfunc_L000058
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_subo16_68fd76bd_loadfunc_L000149_150
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_subo1a_68fd76bd_searcher_C__L000161 ' <symbol:searcher_C>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
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
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subot_68fd76bd_ll_searchpath_L000120_124_L000125
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_subo1a_68fd76bd_searcher_C__L000161_163_L000164
 mov r3, RI ' reg ARG ADDRG
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo10_68fd76bd_findfile_L000128
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subo1a_68fd76bd_searcher_C__L000161_165 ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_subo1a_68fd76bd_searcher_C__L000161_162 ' JUMPV addrg
C_subo1a_68fd76bd_searcher_C__L000161_165
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo16_68fd76bd_loadfunc_L000149
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_subo1a_68fd76bd_searcher_C__L000161_168 ' NEI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_subo1a_68fd76bd_searcher_C__L000161_169 ' JUMPV addrg
C_subo1a_68fd76bd_searcher_C__L000161_168
 mov r17, #0 ' reg <- coni
C_subo1a_68fd76bd_searcher_C__L000161_169
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo12_68fd76bd_checkload_L000134
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_subo1a_68fd76bd_searcher_C__L000161_162
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subo1c_68fd76bd_searcher_C_root_L000170 ' <symbol:searcher_Croot>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
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
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #46 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_172 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_171 ' JUMPV addrg
C_subo1c_68fd76bd_searcher_C_root_L000170_172
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
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
 jmp #LODL
 long @C_subot_68fd76bd_ll_searchpath_L000120_124_L000125
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_subo1a_68fd76bd_searcher_C__L000161_163_L000164
 mov r3, RI ' reg ARG ADDRG
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo10_68fd76bd_findfile_L000128
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_174 ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_171 ' JUMPV addrg
C_subo1c_68fd76bd_searcher_C_root_L000170_174
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo16_68fd76bd_loadfunc_L000149
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_176 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #2 wz
 jmp #BR_Z
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_178 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo12_68fd76bd_checkload_L000134
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_171 ' JUMPV addrg
C_subo1c_68fd76bd_searcher_C_root_L000170_178
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_180_L000181
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #12 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_subo1c_68fd76bd_searcher_C_root_L000170_171 ' JUMPV addrg
C_subo1c_68fd76bd_searcher_C_root_L000170_176
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
C_subo1c_68fd76bd_searcher_C_root_L000170_171
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_subo1e_68fd76bd_searcher_preload_L000182 ' <symbol:searcher_preload>
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
 jmp #LODL
 long @C_subo1e_68fd76bd_searcher_preload_L000182_184_L000185
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
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_subo1e_68fd76bd_searcher_preload_L000182_186 ' NEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_subo1e_68fd76bd_searcher_preload_L000182_188_L000189
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_subo1e_68fd76bd_searcher_preload_L000182_183 ' JUMPV addrg
C_subo1e_68fd76bd_searcher_preload_L000182_186
 jmp #LODL
 long @C_subo1e_68fd76bd_searcher_preload_L000182_190_L000191
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
C_subo1e_68fd76bd_searcher_preload_L000182_183
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_subo1i_68fd76bd_findloader_L000192 ' <symbol:findloader>
 jmp #NEWF
 sub SP, #272
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_subo1i_68fd76bd_findloader_L000192_196_L000197
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -1001001
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 cmps r0,  #5 wz
 jmp #BR_Z
 long @C_subo1i_68fd76bd_findloader_L000192_194 ' EQI4
 jmp #LODL
 long @C_subo1i_68fd76bd_findloader_L000192_198_L000199
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_subo1i_68fd76bd_findloader_L000192_194
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r19, #1 ' reg <- coni
C_subo1i_68fd76bd_findloader_L000192_200
 jmp #LODL
 long @C_subo1i_68fd76bd_findloader_L000192_204_L000205
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_subo1i_68fd76bd_findloader_L000192_206 ' NEI4
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
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 sub r22, #2 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
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
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_subo1i_68fd76bd_findloader_L000192_209_L000210
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
C_subo1i_68fd76bd_findloader_L000192_206
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
 mov r4, #2 ' reg ARG coni
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #6 wz
 jmp #BRNZ
 long @C_subo1i_68fd76bd_findloader_L000192_211 ' NEI4
 jmp #JMPA
 long @C_subo1i_68fd76bd_findloader_L000192_193 ' JUMPV addrg
C_subo1i_68fd76bd_findloader_L000192_211
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_subo1i_68fd76bd_findloader_L000192_213 ' EQI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__addvalue ' CALL addrg
 jmp #JMPA
 long @C_subo1i_68fd76bd_findloader_L000192_214 ' JUMPV addrg
C_subo1i_68fd76bd_findloader_L000192_213
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
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 sub r22, #2 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
C_subo1i_68fd76bd_findloader_L000192_214
' C_subo1i_68fd76bd_findloader_L000192_201 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_subo1i_68fd76bd_findloader_L000192_200 ' JUMPV addrg
C_subo1i_68fd76bd_findloader_L000192_193
 jmp #POPM ' restore registers
 add SP, #272 ' framesize
 jmp #RETF


 alignl ' align long
C_subo1n_68fd76bd_ll_require_L000216 ' <symbol:ll_require>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
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
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_subo1n_68fd76bd_ll_require_L000216_218_L000219
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
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
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
 jmp #BR_Z
 long @C_subo1n_68fd76bd_ll_require_L000216_220 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_subo1n_68fd76bd_ll_require_L000216_217 ' JUMPV addrg
C_subo1n_68fd76bd_ll_require_L000216_220
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
 long @C_subo1i_68fd76bd_findloader_L000192
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -3
 mov r2, RI ' reg ARG con
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
 mov r4, #1 ' reg ARG coni
 mov r5, #2 ' reg ARG coni
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
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_subo1n_68fd76bd_ll_require_L000216_222 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_subo1n_68fd76bd_ll_require_L000216_223 ' JUMPV addrg
C_subo1n_68fd76bd_ll_require_L000216_222
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_subo1n_68fd76bd_ll_require_L000216_223
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_subo1n_68fd76bd_ll_require_L000216_224 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
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
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
C_subo1n_68fd76bd_ll_require_L000216_224
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
C_subo1n_68fd76bd_ll_require_L000216_217
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_subo1p_68fd76bd_pk_funcs_L000226 ' <symbol:pk_funcs>
 long @C_subo1q_68fd76bd_227_L000228
 long @C_suboh_68fd76bd_ll_loadlib_L000071
 long @C_subo1r_68fd76bd_229_L000230
 long @C_subot_68fd76bd_ll_searchpath_L000120
 long @C_subo1s_68fd76bd_231_L000232
 long $0
 long @C_subo1a_68fd76bd_searcher_C__L000161_163_L000164
 long $0
 long @C_subo14_68fd76bd_searcher_L_ua_L000140_142_L000143
 long $0
 long @C_subo1i_68fd76bd_findloader_L000192_196_L000197
 long $0
 long @C_subo1t_68fd76bd_233_L000234
 long $0
 long $0
 long $0

 alignl ' align long
C_subo1u_68fd76bd_ll_funcs_L000235 ' <symbol:ll_funcs>
 long @C_subo1v_68fd76bd_236_L000237
 long @C_subo1n_68fd76bd_ll_require_L000216
 long $0
 long $0

 alignl ' align long
C_subo20_68fd76bd_createsearcherstable_L000238_searchers_L000241 ' <symbol:searchers>
 long @C_subo1e_68fd76bd_searcher_preload_L000182
 long @C_subo14_68fd76bd_searcher_L_ua_L000140
 long @C_subo1a_68fd76bd_searcher_C__L000161
 long @C_subo1c_68fd76bd_searcher_C_root_L000170
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_subo20_68fd76bd_createsearcherstable_L000238 ' <symbol:createsearcherstable>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_subo20_68fd76bd_createsearcherstable_L000238_245 ' JUMPV addrg
C_subo20_68fd76bd_createsearcherstable_L000238_242
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_subo20_68fd76bd_createsearcherstable_L000238_searchers_L000241
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, r21
 adds r2, #1 ' ADDI4 coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawseti
 add SP, #8 ' CALL addrg
' C_subo20_68fd76bd_createsearcherstable_L000238_243 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_subo20_68fd76bd_createsearcherstable_L000238_245
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_subo20_68fd76bd_createsearcherstable_L000238_searchers_L000241
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_subo20_68fd76bd_createsearcherstable_L000238_242 ' NEU4
 jmp #LODL
 long @C_subo1i_68fd76bd_findloader_L000192_196_L000197
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
' C_subo20_68fd76bd_createsearcherstable_L000238_239 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_subo22_68fd76bd_createclibstable_L000246 ' <symbol:createclibstable>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_subo_68fd76bd_C_L_I_B_S__L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getsubtable
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_subof_68fd76bd_gctm_L000052
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_subo22_68fd76bd_createclibstable_L000246_248_L000249
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
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
' C_subo22_68fd76bd_createclibstable_L000246_247 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaopen_package

 alignl ' align long
C_luaopen_package ' <symbol:luaopen_package>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_subo22_68fd76bd_createclibstable_L000246 ' CALL addrg
 mov r2, #68 ' reg ARG coni
 jmp #LODI
 long @C_luaopen_package_251_L000252
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #7 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_subo1p_68fd76bd_pk_funcs_L000226
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_subo20_68fd76bd_createsearcherstable_L000238 ' CALL addrg
 jmp #LODL
 long @C_luaopen_package_255_L000256
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_luaopen_package_253_L000254
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_subo14_68fd76bd_searcher_L_ua_L000140_142_L000143
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo8_68fd76bd_setpath_L000019
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_luaopen_package_259_L000260
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_luaopen_package_257_L000258
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_subo1a_68fd76bd_searcher_C__L000161_163_L000164
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_subo8_68fd76bd_setpath_L000019
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_luaopen_package_261_L000262
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_luaopen_package_263_L000264
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
 long @C_subo1n_68fd76bd_ll_require_L000216_218_L000219
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
 jmp #LODL
 long @C_subo1t_68fd76bd_233_L000234
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
 long @C_subo1e_68fd76bd_searcher_preload_L000182_184_L000185
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
 jmp #LODL
 long @C_subo1s_68fd76bd_231_L000232
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
 mov r2, #2 ' reg ARG coni
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_subo1u_68fd76bd_ll_funcs_L000235
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
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
 mov r0, #1 ' reg <- coni
' C_luaopen_package_250 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import luaL_pushresult

' Catalina Import luaL_addvalue

' Catalina Import luaL_addstring

' Catalina Import luaL_addlstring

' Catalina Import luaL_prepbuffsize

' Catalina Import luaL_buffinit

' Catalina Import luaL_getsubtable

' Catalina Import luaL_setfuncs

' Catalina Import luaL_gsub

' Catalina Import luaL_addgsub

' Catalina Import luaL_len

' Catalina Import luaL_loadfilex

' Catalina Import luaL_error

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_checkversion_

' Catalina Import lua_callk

' Catalina Import lua_setmetatable

' Catalina Import lua_rawseti

' Catalina Import lua_setfield

' Catalina Import lua_createtable

' Catalina Import lua_rawgeti

' Catalina Import lua_getfield

' Catalina Import lua_pushlightuserdata

' Catalina Import lua_pushboolean

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushfstring

' Catalina Import lua_pushstring

' Catalina Import lua_pushlstring

' Catalina Import lua_pushnil

' Catalina Import lua_touserdata

' Catalina Import lua_tolstring

' Catalina Import lua_toboolean

' Catalina Import lua_type

' Catalina Import lua_isstring

' Catalina Import lua_copy

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import strlen

' Catalina Import strstr

' Catalina Import strchr

' Catalina Import getenv

' Catalina Import fopen

' Catalina Import fclose

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_package_263_L000264 ' <symbol:263>
 byte 99
 byte 111
 byte 110
 byte 102
 byte 105
 byte 103
 byte 0

 alignl ' align long
C_luaopen_package_261_L000262 ' <symbol:261>
 byte 47
 byte 10
 byte 59
 byte 10
 byte 63
 byte 10
 byte 33
 byte 10
 byte 45
 byte 10
 byte 0

 alignl ' align long
C_luaopen_package_259_L000260 ' <symbol:259>
 byte 63
 byte 46
 byte 111
 byte 98
 byte 106
 byte 59
 byte 63
 byte 47
 byte 105
 byte 110
 byte 105
 byte 116
 byte 46
 byte 111
 byte 98
 byte 106
 byte 59
 byte 108
 byte 117
 byte 97
 byte 47
 byte 63
 byte 46
 byte 111
 byte 98
 byte 106
 byte 59
 byte 108
 byte 117
 byte 97
 byte 47
 byte 63
 byte 47
 byte 105
 byte 110
 byte 105
 byte 116
 byte 46
 byte 111
 byte 98
 byte 106
 byte 111
 byte 98
 byte 106
 byte 47
 byte 63
 byte 46
 byte 111
 byte 98
 byte 106
 byte 59
 byte 111
 byte 98
 byte 106
 byte 47
 byte 63
 byte 47
 byte 105
 byte 110
 byte 105
 byte 116
 byte 46
 byte 111
 byte 98
 byte 106
 byte 0

 alignl ' align long
C_luaopen_package_257_L000258 ' <symbol:257>
 byte 76
 byte 85
 byte 65
 byte 95
 byte 67
 byte 80
 byte 65
 byte 84
 byte 72
 byte 0

 alignl ' align long
C_luaopen_package_255_L000256 ' <symbol:255>
 byte 63
 byte 46
 byte 108
 byte 117
 byte 97
 byte 59
 byte 63
 byte 47
 byte 105
 byte 110
 byte 105
 byte 116
 byte 46
 byte 108
 byte 117
 byte 97
 byte 59
 byte 108
 byte 117
 byte 97
 byte 47
 byte 63
 byte 46
 byte 108
 byte 117
 byte 97
 byte 59
 byte 108
 byte 117
 byte 97
 byte 47
 byte 63
 byte 47
 byte 105
 byte 110
 byte 105
 byte 116
 byte 46
 byte 108
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_luaopen_package_253_L000254 ' <symbol:253>
 byte 76
 byte 85
 byte 65
 byte 95
 byte 80
 byte 65
 byte 84
 byte 72
 byte 0

 alignl ' align long
C_luaopen_package_251_L000252 ' <symbol:251>
 long $43fc0000 ' float

 alignl ' align long
C_subo22_68fd76bd_createclibstable_L000246_248_L000249 ' <symbol:248>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_subo1v_68fd76bd_236_L000237 ' <symbol:236>
 byte 114
 byte 101
 byte 113
 byte 117
 byte 105
 byte 114
 byte 101
 byte 0

 alignl ' align long
C_subo1t_68fd76bd_233_L000234 ' <symbol:233>
 byte 108
 byte 111
 byte 97
 byte 100
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_subo1s_68fd76bd_231_L000232 ' <symbol:231>
 byte 112
 byte 114
 byte 101
 byte 108
 byte 111
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_subo1r_68fd76bd_229_L000230 ' <symbol:229>
 byte 115
 byte 101
 byte 97
 byte 114
 byte 99
 byte 104
 byte 112
 byte 97
 byte 116
 byte 104
 byte 0

 alignl ' align long
C_subo1q_68fd76bd_227_L000228 ' <symbol:227>
 byte 108
 byte 111
 byte 97
 byte 100
 byte 108
 byte 105
 byte 98
 byte 0

 alignl ' align long
C_subo1n_68fd76bd_ll_require_L000216_218_L000219 ' <symbol:218>
 byte 95
 byte 76
 byte 79
 byte 65
 byte 68
 byte 69
 byte 68
 byte 0

 alignl ' align long
C_subo1i_68fd76bd_findloader_L000192_209_L000210 ' <symbol:209>
 byte 109
 byte 111
 byte 100
 byte 117
 byte 108
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 102
 byte 111
 byte 117
 byte 110
 byte 100
 byte 58
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_subo1i_68fd76bd_findloader_L000192_204_L000205 ' <symbol:204>
 byte 10
 byte 9
 byte 0

 alignl ' align long
C_subo1i_68fd76bd_findloader_L000192_198_L000199 ' <symbol:198>
 byte 39
 byte 112
 byte 97
 byte 99
 byte 107
 byte 97
 byte 103
 byte 101
 byte 46
 byte 115
 byte 101
 byte 97
 byte 114
 byte 99
 byte 104
 byte 101
 byte 114
 byte 115
 byte 39
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
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_subo1i_68fd76bd_findloader_L000192_196_L000197 ' <symbol:196>
 byte 115
 byte 101
 byte 97
 byte 114
 byte 99
 byte 104
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_subo1e_68fd76bd_searcher_preload_L000182_190_L000191 ' <symbol:190>
 byte 58
 byte 112
 byte 114
 byte 101
 byte 108
 byte 111
 byte 97
 byte 100
 byte 58
 byte 0

 alignl ' align long
C_subo1e_68fd76bd_searcher_preload_L000182_188_L000189 ' <symbol:188>
 byte 110
 byte 111
 byte 32
 byte 102
 byte 105
 byte 101
 byte 108
 byte 100
 byte 32
 byte 112
 byte 97
 byte 99
 byte 107
 byte 97
 byte 103
 byte 101
 byte 46
 byte 112
 byte 114
 byte 101
 byte 108
 byte 111
 byte 97
 byte 100
 byte 91
 byte 39
 byte 37
 byte 115
 byte 39
 byte 93
 byte 0

 alignl ' align long
C_subo1e_68fd76bd_searcher_preload_L000182_184_L000185 ' <symbol:184>
 byte 95
 byte 80
 byte 82
 byte 69
 byte 76
 byte 79
 byte 65
 byte 68
 byte 0

 alignl ' align long
C_subo1c_68fd76bd_searcher_C_root_L000170_180_L000181 ' <symbol:180>
 byte 110
 byte 111
 byte 32
 byte 109
 byte 111
 byte 100
 byte 117
 byte 108
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 105
 byte 110
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_subo1a_68fd76bd_searcher_C__L000161_163_L000164 ' <symbol:163>
 byte 99
 byte 112
 byte 97
 byte 116
 byte 104
 byte 0

 alignl ' align long
C_subo16_68fd76bd_loadfunc_L000149_157_L000158 ' <symbol:157>
 byte 108
 byte 117
 byte 97
 byte 111
 byte 112
 byte 101
 byte 110
 byte 95
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_subo16_68fd76bd_loadfunc_L000149_153_L000154 ' <symbol:153>
 byte 45
 byte 0

 alignl ' align long
C_subo16_68fd76bd_loadfunc_L000149_151_L000152 ' <symbol:151>
 byte 95
 byte 0

 alignl ' align long
C_subo14_68fd76bd_searcher_L_ua_L000140_142_L000143 ' <symbol:142>
 byte 112
 byte 97
 byte 116
 byte 104
 byte 0

 alignl ' align long
C_subo12_68fd76bd_checkload_L000134_138_L000139 ' <symbol:138>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 108
 byte 111
 byte 97
 byte 100
 byte 105
 byte 110
 byte 103
 byte 32
 byte 109
 byte 111
 byte 100
 byte 117
 byte 108
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 102
 byte 114
 byte 111
 byte 109
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 58
 byte 10
 byte 9
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_subo10_68fd76bd_findfile_L000128_132_L000133 ' <symbol:132>
 byte 39
 byte 112
 byte 97
 byte 99
 byte 107
 byte 97
 byte 103
 byte 101
 byte 46
 byte 37
 byte 115
 byte 39
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
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_subot_68fd76bd_ll_searchpath_L000120_124_L000125 ' <symbol:124>
 byte 47
 byte 0

 alignl ' align long
C_subot_68fd76bd_ll_searchpath_L000120_122_L000123 ' <symbol:122>
 byte 46
 byte 0

 alignl ' align long
C_subor_68fd76bd_searchpath_L000104_108_L000109 ' <symbol:108>
 byte 63
 byte 0

 alignl ' align long
C_subon_68fd76bd_pusherrornotfound_L000096_102_L000103 ' <symbol:102>
 byte 39
 byte 0

 alignl ' align long
C_subon_68fd76bd_pusherrornotfound_L000096_100_L000101 ' <symbol:100>
 byte 39
 byte 10
 byte 9
 byte 110
 byte 111
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 39
 byte 0

 alignl ' align long
C_subon_68fd76bd_pusherrornotfound_L000096_98_L000099 ' <symbol:98>
 byte 110
 byte 111
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 39
 byte 0

 alignl ' align long
C_subok_68fd76bd_readable_L000082_84_L000085 ' <symbol:84>
 byte 114
 byte 0

 alignl ' align long
C_suboh_68fd76bd_ll_loadlib_L000071_77_L000078 ' <symbol:77>
 byte 105
 byte 110
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_suboh_68fd76bd_ll_loadlib_L000071_75_L000076 ' <symbol:75>
 byte 97
 byte 98
 byte 115
 byte 101
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_subo8_68fd76bd_setpath_L000019_39_L000040 ' <symbol:39>
 byte 59
 byte 0

 alignl ' align long
C_subo8_68fd76bd_setpath_L000019_32_L000033 ' <symbol:32>
 byte 59
 byte 59
 byte 0

 alignl ' align long
C_subo8_68fd76bd_setpath_L000019_23_L000024 ' <symbol:23>
 byte 95
 byte 53
 byte 95
 byte 52
 byte 0

 alignl ' align long
C_subo8_68fd76bd_setpath_L000019_21_L000022 ' <symbol:21>
 byte 37
 byte 115
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_subo6_68fd76bd_noenv_L000015_17_L000018 ' <symbol:17>
 byte 76
 byte 85
 byte 65
 byte 95
 byte 78
 byte 79
 byte 69
 byte 78
 byte 86
 byte 0

 alignl ' align long
C_subo3_68fd76bd_lsys_load_L000008_12_L000013 ' <symbol:12>
 byte 100
 byte 121
 byte 110
 byte 97
 byte 109
 byte 105
 byte 99
 byte 32
 byte 108
 byte 105
 byte 98
 byte 114
 byte 97
 byte 114
 byte 105
 byte 101
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 110
 byte 97
 byte 98
 byte 108
 byte 101
 byte 100
 byte 59
 byte 32
 byte 99
 byte 104
 byte 101
 byte 99
 byte 107
 byte 32
 byte 121
 byte 111
 byte 117
 byte 114
 byte 32
 byte 76
 byte 117
 byte 97
 byte 32
 byte 105
 byte 110
 byte 115
 byte 116
 byte 97
 byte 108
 byte 108
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_subo1_68fd76bd_5_L000006 ' <symbol:5>
 byte 95
 byte 67
 byte 76
 byte 73
 byte 66
 byte 83
 byte 0

' Catalina Code

DAT ' code segment
' end
