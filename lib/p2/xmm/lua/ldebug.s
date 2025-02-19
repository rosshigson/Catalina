' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sq2g1_67b11037_currentpc_L000022 ' <symbol:currentpc>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r2
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 subs r0, #1 ' SUBI4 coni
' C_sq2g1_67b11037_currentpc_L000022_23 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sq2g2_67b11037_getbaseline_L000024 ' <symbol:getbaseline>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r4
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sq2g2_67b11037_getbaseline_L000024_28 ' EQI4
 mov r22, r4
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r3, r22 wz,wc
 jmp #BRAE
 long @C_sq2g2_67b11037_getbaseline_L000024_26 ' GEI4
C_sq2g2_67b11037_getbaseline_L000024_28
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r4
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_sq2g2_67b11037_getbaseline_L000024_25 ' JUMPV addrg
C_sq2g2_67b11037_getbaseline_L000024_26
 mov r22, r3 ' CVI, CVU or LOAD
 shr r22, #7 ' RSHU4 coni
 sub r22, #1 ' SUBU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2g2_67b11037_getbaseline_L000024_30 ' JUMPV addrg
C_sq2g2_67b11037_getbaseline_L000024_29
 adds r23, #1 ' ADDI4 coni
C_sq2g2_67b11037_getbaseline_L000024_30
 mov r22, r23
 adds r22, #1 ' ADDI4 coni
 mov r20, r4
 adds r20, #36 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_sq2g2_67b11037_getbaseline_L000024_32 ' GEI4
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 adds r22, #8 ' ADDI4 coni
 mov r20, r4
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r3, r22 wz,wc
 jmp #BRAE
 long @C_sq2g2_67b11037_getbaseline_L000024_29 ' GEI4
C_sq2g2_67b11037_getbaseline_L000024_32
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 mov r20, r4
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 mov r20, r4
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
C_sq2g2_67b11037_getbaseline_L000024_25
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaG_getfuncline

 alignl ' align long
C_luaG__getfuncline ' <symbol:luaG_getfuncline>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__getfuncline_34 ' NEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaG__getfuncline_33 ' JUMPV addrg
C_luaG__getfuncline_34
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g2_67b11037_getbaseline_L000024
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__getfuncline_37 ' JUMPV addrg
C_luaG__getfuncline_36
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r23
 adds r20, #64 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 adds r19, r22 ' ADDI/P (1)
C_luaG__getfuncline_37
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNI4 addrli reg
 cmps r22, r21 wz,wc
 jmp #BR_B
 long @C_luaG__getfuncline_36 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
C_luaG__getfuncline_33
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2g3_67b11037_getcurrentline_L000039 ' <symbol:getcurrentline>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sq2g1_67b11037_currentpc_L000022 ' CALL addrg
 mov r2, r0 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__getfuncline
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sq2g3_67b11037_getcurrentline_L000039_40 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sq2g4_67b11037_settraps_L000041 ' <symbol:settraps>
 jmp #PSHM
 long $500000 ' save registers
 jmp #JMPA
 long @C_sq2g4_67b11037_settraps_L000041_46 ' JUMPV addrg
C_sq2g4_67b11037_settraps_L000041_43
 mov r22, r2
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2g4_67b11037_settraps_L000041_47 ' NEI4
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_sq2g4_67b11037_settraps_L000041_47
' C_sq2g4_67b11037_settraps_L000041_44 ' (symbol refcount = 0)
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
C_sq2g4_67b11037_settraps_L000041_46
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sq2g4_67b11037_settraps_L000041_43 ' NEU4
' C_sq2g4_67b11037_settraps_L000041_42 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_sethook

 alignl ' align long
C_lua_sethook ' <symbol:lua_sethook>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_sethook_52 ' EQU4
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_lua_sethook_50 ' NEI4
C_lua_sethook_52
 mov r19, #0 ' reg <- coni
 jmp #LODL
 long 0
 mov r21, RI ' reg <- con
C_lua_sethook_50
 mov r22, r23
 adds r22, #88 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #108 ' ADDP4 coni
 mov r20, r23
 adds r20, #104 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 and r20, cviu_m1 ' zero extend
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_lua_sethook_53 ' EQI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sq2g4_67b11037_settraps_L000041 ' CALL addrg
C_lua_sethook_53
' C_lua_sethook_49 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_gethook

 alignl ' align long
C_lua_gethook ' <symbol:lua_gethook>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #88 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRP4 reg
' C_lua_gethook_55 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_gethookmask

 alignl ' align long
C_lua_gethookmask ' <symbol:lua_gethookmask>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #112 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_lua_gethookmask_56 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_gethookcount

 alignl ' align long
C_lua_gethookcount ' <symbol:lua_gethookcount>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_lua_gethookcount_57 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_getstack

 alignl ' align long
C_lua_getstack ' <symbol:lua_getstack>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 cmps r3,  #0 wz,wc
 jmp #BRAE
 long @C_lua_getstack_59 ' GEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_lua_getstack_58 ' JUMPV addrg
C_lua_getstack_59
 mov r22, r4
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_lua_getstack_64 ' JUMPV addrg
C_lua_getstack_61
 subs r3, #1 ' SUBI4 coni
' C_lua_getstack_62 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
C_lua_getstack_64
 cmps r3,  #0 wz,wc
 jmp #BRBE
 long @C_lua_getstack_65 ' LEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r4
 adds r20, #52 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_lua_getstack_61 ' NEU4
C_lua_getstack_65
 cmps r3,  #0 wz
 jmp #BRNZ
 long @C_lua_getstack_66 ' NEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r4
 adds r20, #52 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_getstack_66 ' EQU4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r2
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_lua_getstack_67 ' JUMPV addrg
C_lua_getstack_66
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_getstack_67
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_lua_getstack_58
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2g5_67b11037_upvalname_L000068 ' <symbol:upvalname>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, r3
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sq2g5_67b11037_upvalname_L000068_70 ' NEU4
 jmp #LODL
 long @C_sq2g5_67b11037_upvalname_L000068_72_L000073
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2g5_67b11037_upvalname_L000068_69 ' JUMPV addrg
C_sq2g5_67b11037_upvalname_L000068_70
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
C_sq2g5_67b11037_upvalname_L000068_69
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2g7_67b11037_findvararg_L000074 ' <symbol:findvararg>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 mov RI, r4
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sq2g7_67b11037_findvararg_L000074_76 ' EQI4
 mov r22, r4
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 neg r22, r22 ' NEGI4
 cmps r3, r22 wz,wc
 jmp #BR_B
 long @C_sq2g7_67b11037_findvararg_L000074_78 ' LTI4
 mov RI, r4
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #3 ' LSHI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov r20, r3
 shl r20, #3 ' LSHI4 coni
 adds r20, #8 ' ADDI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2g7_67b11037_findvararg_L000074_80_L000081
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2g7_67b11037_findvararg_L000074_75 ' JUMPV addrg
C_sq2g7_67b11037_findvararg_L000074_78
C_sq2g7_67b11037_findvararg_L000074_76
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sq2g7_67b11037_findvararg_L000074_75
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaG_findlocal

 alignl ' align long
C_luaG__findlocal ' <symbol:luaG_findlocal>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__findlocal_83 ' NEI4
 cmps r19,  #0 wz,wc
 jmp #BRAE
 long @C_luaG__findlocal_85 ' GEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g7_67b11037_findvararg_L000074
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__findlocal_82 ' JUMPV addrg
C_luaG__findlocal_85
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sq2g1_67b11037_currentpc_L000022 ' CALL addrg
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__getlocalname
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_luaG__findlocal_83
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__findlocal_87 ' NEU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaG__findlocal_90 ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaG__findlocal_91 ' JUMPV addrg
C_luaG__findlocal_90
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
C_luaG__findlocal_91
 mov RI, FP
 sub RI, #-(-12)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r0, r19 wz,wc
 jmp #BR_B
 long @C_luaG__findlocal_92 ' LTI4
 cmps r19,  #0 wz,wc
 jmp #BRBE
 long @C_luaG__findlocal_92 ' LEI4
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__findlocal_99 ' NEI4
 jmp #LODL
 long @C_luaG__findlocal_94_L000095
 mov r11, RI ' reg <- addrg
 jmp #JMPA
 long @C_luaG__findlocal_100 ' JUMPV addrg
C_luaG__findlocal_99
 jmp #LODL
 long @C_luaG__findlocal_96_L000097
 mov r11, RI ' reg <- addrg
C_luaG__findlocal_100
 mov r15, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__findlocal_93 ' JUMPV addrg
C_luaG__findlocal_92
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaG__findlocal_82 ' JUMPV addrg
C_luaG__findlocal_93
C_luaG__findlocal_87
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__findlocal_101 ' EQU4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r22, r20 ' ADDI/P (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
C_luaG__findlocal_101
 mov r0, r15 ' CVI, CVU or LOAD
C_luaG__findlocal_82
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_getlocal

 alignl ' align long
C_lua_getlocal ' <symbol:lua_getlocal>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_lua_getlocal_104 ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #70 wz
 jmp #BR_Z
 long @C_lua_getlocal_106 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_lua_getlocal_105 ' JUMPV addrg
C_lua_getlocal_106
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__getlocalname
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_lua_getlocal_105 ' JUMPV addrg
C_lua_getlocal_104
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__findlocal
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_getlocal_108 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_lua_getlocal_108
C_lua_getlocal_105
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
' C_lua_getlocal_103 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export lua_setlocal

 alignl ' align long
C_lua_setlocal ' <symbol:lua_setlocal>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__findlocal
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_setlocal_111 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_lua_setlocal_111
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_setlocal_110 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2gb_67b11037_funcinfo_L000113 ' <symbol:funcinfo>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gb_67b11037_funcinfo_L000113_117 ' EQU4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #38 wz
 jmp #BRNZ
 long @C_sq2gb_67b11037_funcinfo_L000113_115 ' NEI4
C_sq2gb_67b11037_funcinfo_L000113_117
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C_sq2gb_67b11037_funcinfo_L000113_118_L000119
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #4 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long @C_sq2gb_67b11037_funcinfo_L000113_120_L000121
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sq2gb_67b11037_funcinfo_L000113_116 ' JUMPV addrg
C_sq2gb_67b11037_funcinfo_L000113_115
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gb_67b11037_funcinfo_L000113_122 ' EQU4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, r19
 adds r20, #76 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #4 ' reg <- coni
 mov r20, r19
 adds r20, #76 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sq2gb_67b11037_funcinfo_L000113_125 ' NEI4
 mov r22, r19
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2gb_67b11037_funcinfo_L000113_126 ' JUMPV addrg
C_sq2gb_67b11037_funcinfo_L000113_125
 mov r22, r19
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRU4 reg
C_sq2gb_67b11037_funcinfo_L000113_126
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sq2gb_67b11037_funcinfo_L000113_123 ' JUMPV addrg
C_sq2gb_67b11037_funcinfo_L000113_122
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C_sq2gb_67b11037_funcinfo_L000113_127_L000128
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_sq2gb_67b11037_funcinfo_L000113_123
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, r19
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, r19
 adds r20, #44 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gb_67b11037_funcinfo_L000113_134 ' NEI4
 jmp #LODL
 long @C_sq2gb_67b11037_funcinfo_L000113_129_L000130
 mov r17, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2gb_67b11037_funcinfo_L000113_135 ' JUMPV addrg
C_sq2gb_67b11037_funcinfo_L000113_134
 jmp #LODL
 long @C_sq2gb_67b11037_funcinfo_L000113_131_L000132
 mov r17, RI ' reg <- addrg
C_sq2gb_67b11037_funcinfo_L000113_135
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
C_sq2gb_67b11037_funcinfo_L000113_116
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23
 adds r4, #44 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__chunkid
 add SP, #8 ' CALL addrg
' C_sq2gb_67b11037_funcinfo_L000113_114 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sq2gh_67b11037_nextline_L000136 ' <symbol:nextline>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -128
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sq2gh_67b11037_nextline_L000136_138 ' EQI4
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r19 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 mov r0, r21 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #JMPA
 long @C_sq2gh_67b11037_nextline_L000136_137 ' JUMPV addrg
C_sq2gh_67b11037_nextline_L000136_138
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__getfuncline
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sq2gh_67b11037_nextline_L000136_137
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sq2gi_67b11037_collectvalidlines_L000140 ' <symbol:collectvalidlines>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gi_67b11037_collectvalidlines_L000140_144 ' EQU4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #38 wz
 jmp #BRNZ
 long @C_sq2gi_67b11037_collectvalidlines_L000140_142 ' NEI4
C_sq2gi_67b11037_collectvalidlines_L000140_144
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sq2gi_67b11037_collectvalidlines_L000140_143 ' JUMPV addrg
C_sq2gi_67b11037_collectvalidlines_L000140_142
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r22, r15
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__new ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r15
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gi_67b11037_collectvalidlines_L000140_146 ' NEI4
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sq2gi_67b11037_collectvalidlines_L000140_151 ' JUMPV addrg
C_sq2gi_67b11037_collectvalidlines_L000140_146
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gh_67b11037_nextline_L000136
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_sq2gi_67b11037_collectvalidlines_L000140_151 ' JUMPV addrg
C_sq2gi_67b11037_collectvalidlines_L000140_148
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gh_67b11037_nextline_L000136
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__setint
 add SP, #12 ' CALL addrg
' C_sq2gi_67b11037_collectvalidlines_L000140_149 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sq2gi_67b11037_collectvalidlines_L000140_151
 mov r22, r15
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_sq2gi_67b11037_collectvalidlines_L000140_148 ' LTI4
C_sq2gi_67b11037_collectvalidlines_L000140_143
' C_sq2gi_67b11037_collectvalidlines_L000140_141 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2gj_67b11037_getfuncname_L000152 ' <symbol:getfuncname>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gj_67b11037_getfuncname_L000152_154 ' EQU4
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gj_67b11037_getfuncname_L000152_154 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g_67b11037_funcnamefromcall_L000021
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2gj_67b11037_getfuncname_L000152_153 ' JUMPV addrg
C_sq2gj_67b11037_getfuncname_L000152_154
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sq2gj_67b11037_getfuncname_L000152_153
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sq2gk_67b11037_auxgetinfo_L000156 ' <symbol:auxgetinfo>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_161 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_158
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 mov r22, #83 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_sq2gk_67b11037_auxgetinfo_L000156_165 ' EQI4
 cmps r13, r22 wz,wc
 jmp #BR_A
 long @C_sq2gk_67b11037_auxgetinfo_L000156_192 ' GTI4
' C_sq2gk_67b11037_auxgetinfo_L000156_191 ' (symbol refcount = 0)
 cmps r13,  #76 wz
 jmp #BR_Z
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' EQI4
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_192
 mov r22, #102 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' EQI4
 cmps r13, r22 wz,wc
 jmp #BR_B
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162 ' LTI4
' C_sq2gk_67b11037_auxgetinfo_L000156_193 ' (symbol refcount = 0)
 cmps r13,  #108 wz,wc
 jmp #BR_B
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162 ' LTI4
 cmps r13,  #117 wz,wc
 jmp #BR_A
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sq2gk_67b11037_auxgetinfo_L000156_194_L000196-432
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sq2gk_67b11037_auxgetinfo_L000156_194_L000196 ' <symbol:194>
 long @C_sq2gk_67b11037_auxgetinfo_L000156_166
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162
 long @C_sq2gk_67b11037_auxgetinfo_L000156_181
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162
 long @C_sq2gk_67b11037_auxgetinfo_L000156_186
 long @C_sq2gk_67b11037_auxgetinfo_L000156_162
 long @C_sq2gk_67b11037_auxgetinfo_L000156_177
 long @C_sq2gk_67b11037_auxgetinfo_L000156_170

' Catalina Code

DAT ' code segment
C_sq2gk_67b11037_auxgetinfo_L000156_165
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gb_67b11037_funcinfo_L000113
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_166
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gk_67b11037_auxgetinfo_L000156_168 ' EQU4
 mov r22, r17
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gk_67b11037_auxgetinfo_L000156_168 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sq2g3_67b11037_getcurrentline_L000039 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_169 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_168
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
C_sq2gk_67b11037_auxgetinfo_L000156_169
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 mov BC, r11
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_170
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gk_67b11037_auxgetinfo_L000156_172 ' NEU4
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_173 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_172
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r11, r22 ' CVUI
 and r11, cviu_m1 ' zero extend
C_sq2gk_67b11037_auxgetinfo_L000156_173
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gk_67b11037_auxgetinfo_L000156_176 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #38 wz
 jmp #BRNZ
 long @C_sq2gk_67b11037_auxgetinfo_L000156_174 ' NEI4
C_sq2gk_67b11037_auxgetinfo_L000156_176
 mov r22, r21
 adds r22, #38 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #37 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_174
 mov r22, r21
 adds r22, #38 ' ADDP4 coni
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #37 ' ADDP4 coni
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #6 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_177
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gk_67b11037_auxgetinfo_L000156_179 ' EQU4
 mov r22, r17
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 mov r11, r22
 and r11, #32 ' BANDI4 coni
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_180 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_179
 mov r11, #0 ' reg <- coni
C_sq2gk_67b11037_auxgetinfo_L000156_180
 mov r22, r21
 adds r22, #39 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_181
 mov r2, r21
 adds r2, #4 ' ADDP4 coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gj_67b11037_getfuncname_L000152
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' NEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 jmp #LODL
 long @C_sq2gk_67b11037_auxgetinfo_L000156_184_L000185
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_186
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gk_67b11037_auxgetinfo_L000156_189 ' EQU4
 mov r22, r17
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gk_67b11037_auxgetinfo_L000156_187 ' NEI4
C_sq2gk_67b11037_auxgetinfo_L000156_189
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #42 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WWRD ' ASGNU2 reg reg
 mov r20, r21
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WWRD ' ASGNU2 reg reg
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_187
 mov r22, r21
 adds r22, #40 ' ADDP4 coni
 mov r20, r17
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r21
 adds r22, #42 ' ADDP4 coni
 mov r20, r17
 adds r20, #30 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 jmp #JMPA
 long @C_sq2gk_67b11037_auxgetinfo_L000156_163 ' JUMPV addrg
C_sq2gk_67b11037_auxgetinfo_L000156_162
 mov r15, #0 ' reg <- coni
C_sq2gk_67b11037_auxgetinfo_L000156_163
' C_sq2gk_67b11037_auxgetinfo_L000156_159 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
C_sq2gk_67b11037_auxgetinfo_L000156_161
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gk_67b11037_auxgetinfo_L000156_158 ' NEI4
 mov r0, r15 ' CVI, CVU or LOAD
' C_sq2gk_67b11037_auxgetinfo_L000156_157 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_getinfo

 alignl ' align long
C_lua_getinfo ' <symbol:lua_getinfo>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #62 wz
 jmp #BRNZ
 long @C_lua_getinfo_199 ' NEI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov RI, r22
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 mov r17, r18 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (2)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_lua_getinfo_200 ' JUMPV addrg
C_lua_getinfo_199
 mov r22, r19
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C_lua_getinfo_200
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #70 wz
 jmp #BR_Z
 long @C_lua_getinfo_204 ' EQI4
 cmps r22,  #102 wz
 jmp #BRNZ
 long @C_lua_getinfo_202 ' NEI4
C_lua_getinfo_204
 mov RI, r17
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_lua_getinfo_203 ' JUMPV addrg
C_lua_getinfo_202
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
C_lua_getinfo_203
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sq2gk_67b11037_auxgetinfo_L000156
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #102 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_getinfo_205 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_lua_getinfo_205
 mov r2, #76 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_getinfo_207 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gi_67b11037_collectvalidlines_L000140
 add SP, #4 ' CALL addrg
C_lua_getinfo_207
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_lua_getinfo_198 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2gp_67b11037_kname_L000210 ' <symbol:kname>
 jmp #PSHM
 long $f00000 ' save registers
 mov r22, r3
 shl r22, #3 ' LSHI4 coni
 mov r20, r4
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 mov r22, #4 ' reg <- coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sq2gp_67b11037_kname_L000210_213 ' NEI4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r21, r22
 adds r21, #16 ' ADDP4 coni
 jmp #JMPA
 long @C_sq2gp_67b11037_kname_L000210_214 ' JUMPV addrg
C_sq2gp_67b11037_kname_L000210_213
 jmp #LODL
 long @C_sq2g5_67b11037_upvalname_L000068_72_L000073
 mov r21, RI ' reg <- addrg
C_sq2gp_67b11037_kname_L000210_214
 mov RI, r2
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
' C_sq2gp_67b11037_kname_L000210_211 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sq2gq_67b11037_rname_L000215 ' <symbol:rname>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2go_67b11037_getobjname_L000209
 add SP, #12 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gq_67b11037_rname_L000215_219 ' EQU4
 mov RI, r15
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #99 wz
 jmp #BR_Z
 long @C_sq2gq_67b11037_rname_L000215_217 ' EQI4
C_sq2gq_67b11037_rname_L000215_219
 jmp #LODL
 long @C_sq2g5_67b11037_upvalname_L000068_72_L000073
 mov r22, RI ' reg <- addrg
 mov RI, r17
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
C_sq2gq_67b11037_rname_L000215_217
' C_sq2gq_67b11037_rname_L000215_216 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sq2gr_67b11037_rkname_L000220 ' <symbol:rkname>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r19
 shr r22, #15 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gr_67b11037_rkname_L000220_222 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gp_67b11037_kname_L000210
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sq2gr_67b11037_rkname_L000220_223 ' JUMPV addrg
C_sq2gr_67b11037_rkname_L000220_222
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gq_67b11037_rname_L000215
 add SP, #12 ' CALL addrg
C_sq2gr_67b11037_rkname_L000220_223
' C_sq2gr_67b11037_rkname_L000220_221 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2gs_67b11037_filterpc_L000224 ' <symbol:filterpc>
 cmps r3, r2 wz,wc
 jmp #BRAE
 long @C_sq2gs_67b11037_filterpc_L000224_226 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sq2gs_67b11037_filterpc_L000224_225 ' JUMPV addrg
C_sq2gs_67b11037_filterpc_L000224_226
 mov r0, r3 ' CVI, CVU or LOAD
C_sq2gs_67b11037_filterpc_L000224_225
 jmp #RETN


 alignl ' align long
C_sq2gt_67b11037_findsetreg_L000228 ' <symbol:findsetreg>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r13, RI ' reg <- con
 mov r15, #0 ' reg <- coni
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 jmp #LODL
 long @C_luaP__opmodes
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gt_67b11037_findsetreg_L000228_230 ' EQI4
 subs r21, #1 ' SUBI4 coni
C_sq2gt_67b11037_findsetreg_L000228_230
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_235 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_232
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r11, BC ' reg <- INDIRU4 reg
 mov r22, r11
 and r22, #127 ' BANDU4 coni
 mov r7, r22 ' CVI, CVU or LOAD
 mov r22, r11
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r7, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #56 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sq2gt_67b11037_findsetreg_L000228_251 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_sq2gt_67b11037_findsetreg_L000228_258 ' GTI4
' C_sq2gt_67b11037_findsetreg_L000228_257 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #8 wz
 jmp #BR_Z
 long @C_sq2gt_67b11037_findsetreg_L000228_239 ' EQI4
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_236 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_258
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #68 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sq2gt_67b11037_findsetreg_L000228_247 ' EQI4
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_sq2gt_67b11037_findsetreg_L000228_247 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_sq2gt_67b11037_findsetreg_L000228_236 ' LTI4
' C_sq2gt_67b11037_findsetreg_L000228_259 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #76 wz
 jmp #BR_Z
 long @C_sq2gt_67b11037_findsetreg_L000228_243 ' EQI4
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_236 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_239
 mov r22, r11
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22, r19 wz,wc
 jmp #BR_A
 long @C_sq2gt_67b11037_findsetreg_L000228_241 ' GTI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 adds r22, r20 ' ADDI/P (1)
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_sq2gt_67b11037_findsetreg_L000228_241 ' GTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_242 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_241
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sq2gt_67b11037_findsetreg_L000228_242
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_237 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_243
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #2 ' ADDI4 coni
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sq2gt_67b11037_findsetreg_L000228_245 ' LTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_246 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_245
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sq2gt_67b11037_findsetreg_L000228_246
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_237 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_247
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sq2gt_67b11037_findsetreg_L000228_249 ' LTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_250 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_249
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sq2gt_67b11037_findsetreg_L000228_250
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_237 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_251
 mov r22, r11
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long 16777215
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r17
 adds r22, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22, r21 wz,wc
 jmp #BR_A
 long @C_sq2gt_67b11037_findsetreg_L000228_252 ' GTI4
 cmps r22, r15 wz,wc
 jmp #BRBE
 long @C_sq2gt_67b11037_findsetreg_L000228_252 ' LEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRI4 regl
C_sq2gt_67b11037_findsetreg_L000228_252
 mov r9, #0 ' reg <- coni
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_237 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_236
 jmp #LODL
 long @C_luaP__opmodes
 mov r22, RI ' reg <- addrg
 adds r22, r7 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sq2gt_67b11037_findsetreg_L000228_255 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_sq2gt_67b11037_findsetreg_L000228_255 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sq2gt_67b11037_findsetreg_L000228_256 ' JUMPV addrg
C_sq2gt_67b11037_findsetreg_L000228_255
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sq2gt_67b11037_findsetreg_L000228_256
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRI4 regl
C_sq2gt_67b11037_findsetreg_L000228_237
 cmps r9,  #0 wz
 jmp #BR_Z
 long @C_sq2gt_67b11037_findsetreg_L000228_260 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gs_67b11037_filterpc_L000224
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_sq2gt_67b11037_findsetreg_L000228_260
' C_sq2gt_67b11037_findsetreg_L000228_233 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sq2gt_67b11037_findsetreg_L000228_235
 cmps r17, r21 wz,wc
 jmp #BR_B
 long @C_sq2gt_67b11037_findsetreg_L000228_232 ' LTI4
 mov r0, r13 ' CVI, CVU or LOAD
' C_sq2gt_67b11037_findsetreg_L000228_229 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2gu_67b11037_gxf_L000262 ' <symbol:gxf>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sq2gu_67b11037_gxf_L000262_264 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g5_67b11037_upvalname_L000068
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_sq2gu_67b11037_gxf_L000262_265 ' JUMPV addrg
C_sq2gu_67b11037_gxf_L000262_264
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2go_67b11037_getobjname_L000209
 add SP, #12 ' CALL addrg
C_sq2gu_67b11037_gxf_L000262_265
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22 ' CVI, CVU or LOAD
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_sq2gu_67b11037_gxf_L000262_273 ' EQU4
 jmp #LODL
 long @C_sq2gu_67b11037_gxf_L000262_266_L000267
 mov r2, RI ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2gu_67b11037_gxf_L000262_273 ' NEI4
 jmp #LODL
 long @C_sq2gu_67b11037_gxf_L000262_268_L000269
 mov r15, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2gu_67b11037_gxf_L000262_274 ' JUMPV addrg
C_sq2gu_67b11037_gxf_L000262_273
 jmp #LODL
 long @C_sq2gu_67b11037_gxf_L000262_270_L000271
 mov r15, RI ' reg <- addrg
C_sq2gu_67b11037_gxf_L000262_274
 mov r0, r15 ' CVI, CVU or LOAD
' C_sq2gu_67b11037_gxf_L000262_263 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2go_67b11037_getobjname_L000209 ' <symbol:getobjname>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__getlocalname
 add SP, #8 ' CALL addrg
 mov RI, r17
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sq2go_67b11037_getobjname_L000209_276 ' EQU4
 jmp #LODL
 long @C_sq2go_67b11037_getobjname_L000209_278_L000279
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_276
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gt_67b11037_findsetreg_L000228
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sq2go_67b11037_getobjname_L000209_280 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 and r22, #127 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRI4 regl
 cmps r15,  #0 wz,wc
 jmp #BR_B
 long @C_sq2go_67b11037_getobjname_L000209_283 ' LTI4
 cmps r15,  #14 wz,wc
 jmp #BR_A
 long @C_sq2go_67b11037_getobjname_L000209_308 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sq2go_67b11037_getobjname_L000209_309_L000311
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sq2go_67b11037_getobjname_L000209_309_L000311 ' <symbol:309>
 long @C_sq2go_67b11037_getobjname_L000209_285
 long @C_sq2go_67b11037_getobjname_L000209_283
 long @C_sq2go_67b11037_getobjname_L000209_283
 long @C_sq2go_67b11037_getobjname_L000209_297
 long @C_sq2go_67b11037_getobjname_L000209_297
 long @C_sq2go_67b11037_getobjname_L000209_283
 long @C_sq2go_67b11037_getobjname_L000209_283
 long @C_sq2go_67b11037_getobjname_L000209_283
 long @C_sq2go_67b11037_getobjname_L000209_283
 long @C_sq2go_67b11037_getobjname_L000209_294
 long @C_sq2go_67b11037_getobjname_L000209_283
 long @C_sq2go_67b11037_getobjname_L000209_288
 long @C_sq2go_67b11037_getobjname_L000209_289
 long @C_sq2go_67b11037_getobjname_L000209_290
 long @C_sq2go_67b11037_getobjname_L000209_293

' Catalina Code

DAT ' code segment
C_sq2go_67b11037_getobjname_L000209_308
 cmps r15,  #20 wz
 jmp #BR_Z
 long @C_sq2go_67b11037_getobjname_L000209_305 ' EQI4
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_283 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_285
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 shr r20, #7 ' RSHU4 coni
 and r20, #255 ' BANDU4 coni
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_sq2go_67b11037_getobjname_L000209_283 ' GEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2go_67b11037_getobjname_L000209
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_288
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gp_67b11037_kname_L000210
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gu_67b11037_gxf_L000262
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_289
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gq_67b11037_rname_L000215
 add SP, #12 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gu_67b11037_gxf_L000262
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_290
 jmp #LODL
 long @C_sq2go_67b11037_getobjname_L000209_291_L000292
 mov r22, RI ' reg <- addrg
 mov RI, r17
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2gu_67b11037_gxf_L000262_270_L000271
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_293
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gp_67b11037_kname_L000210
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gu_67b11037_gxf_L000262
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_294
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g5_67b11037_upvalname_L000068
 add SP, #4 ' CALL addrg
 mov RI, r17
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2go_67b11037_getobjname_L000209_295_L000296
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_297
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sq2go_67b11037_getobjname_L000209_299 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_300 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_299
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #2 ' LSHI4 coni
 adds r22, #4 ' ADDI4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r13, r22 ' CVI, CVU or LOAD
C_sq2go_67b11037_getobjname_L000209_300
 mov RI, FP
 sub RI, #-(-20)
 wrlong r13, RI ' ASGNI4 addrli reg
 mov r22, #4 ' reg <- coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #3 ' LSHI4 coni
 mov r18, r23
 adds r18, #48 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sq2go_67b11037_getobjname_L000209_283 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2go_67b11037_getobjname_L000209_303_L000304
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_305
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2gr_67b11037_rkname_L000220
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_sq2go_67b11037_getobjname_L000209_306_L000307
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2go_67b11037_getobjname_L000209_275 ' JUMPV addrg
C_sq2go_67b11037_getobjname_L000209_283
C_sq2go_67b11037_getobjname_L000209_280
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sq2go_67b11037_getobjname_L000209_275
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2g19_67b11037_funcnamefromcode_L000312 ' <symbol:funcnamefromcode>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 and r22, #127 ' BANDU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmps r13,  #11 wz,wc
 jmp #BR_B
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314 ' LTI4
 cmps r13,  #20 wz,wc
 jmp #BR_A
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_332 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_333_L000335-44
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sq2g19_67b11037_funcnamefromcode_L000312_333_L000335 ' <symbol:333>
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_321
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_321
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_321
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_321
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_322
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_322
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_322
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_322
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_321

' Catalina Code

DAT ' code segment
C_sq2g19_67b11037_funcnamefromcode_L000312_332
 cmps r13,  #46 wz,wc
 jmp #BR_B
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314 ' LTI4
 cmps r13,  #76 wz,wc
 jmp #BR_A
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_337_L000339-184
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sq2g19_67b11037_funcnamefromcode_L000312_337_L000339 ' <symbol:337>
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_323
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_323
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_323
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_324
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_325
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_326
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_327
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_331
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_328
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_329
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_330
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_329
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_330
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_329
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_330
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_317
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_317
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_331
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_314
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_318

' Catalina Code

DAT ' code segment
C_sq2g19_67b11037_funcnamefromcode_L000312_317
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2go_67b11037_getobjname_L000209
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_313 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_318
 jmp #LODL
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_319_L000320
 mov r22, RI ' reg <- addrg
 mov RI, r17
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_319_L000320
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_313 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_321
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_322
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_323
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_324
 mov r15, #18 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_325
 mov r15, #19 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_326
 mov r15, #4 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_327
 mov r15, #22 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_328
 mov r15, #5 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_329
 mov r15, #20 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_330
 mov r15, #21 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_331
 mov r15, #24 ' reg <- coni
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_315 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_314
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_313 ' JUMPV addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_315
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #152 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #18 ' ADDP4 coni
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_341_L000342
 mov r0, RI ' reg <- addrg
C_sq2g19_67b11037_funcnamefromcode_L000312_313
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2g_67b11037_funcnamefromcall_L000021 ' <symbol:funcnamefromcall>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sq2g_67b11037_funcnamefromcall_L000021_344 ' EQI4
 jmp #LODL
 long @C_sq2g5_67b11037_upvalname_L000068_72_L000073
 mov r22, RI ' reg <- addrg
 mov RI, r19
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2g_67b11037_funcnamefromcall_L000021_346_L000347
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2g_67b11037_funcnamefromcall_L000021_343 ' JUMPV addrg
C_sq2g_67b11037_funcnamefromcall_L000021_344
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sq2g_67b11037_funcnamefromcall_L000021_348 ' EQI4
 jmp #LODL
 long @C_sq2g_67b11037_funcnamefromcall_L000021_350_L000351
 mov r22, RI ' reg <- addrg
 mov RI, r19
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2g19_67b11037_funcnamefromcode_L000312_341_L000342
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2g_67b11037_funcnamefromcall_L000021_343 ' JUMPV addrg
C_sq2g_67b11037_funcnamefromcall_L000021_348
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2g_67b11037_funcnamefromcall_L000021_352 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sq2g1_67b11037_currentpc_L000022 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r0 ' CVI, CVU or LOAD
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g19_67b11037_funcnamefromcode_L000312
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2g_67b11037_funcnamefromcall_L000021_343 ' JUMPV addrg
C_sq2g_67b11037_funcnamefromcall_L000021_352
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sq2g_67b11037_funcnamefromcall_L000021_343
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sq2g1i_67b11037_isinstack_L000354 ' <symbol:isinstack>
 jmp #PSHM
 long $d00000 ' save registers
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r23, r22
 adds r23, #8 ' ADDP4 coni
 jmp #JMPA
 long @C_sq2g1i_67b11037_isinstack_L000354_359 ' JUMPV addrg
C_sq2g1i_67b11037_isinstack_L000354_356
 mov r22, r2 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sq2g1i_67b11037_isinstack_L000354_360 ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sq2g1i_67b11037_isinstack_L000354_355 ' JUMPV addrg
C_sq2g1i_67b11037_isinstack_L000354_360
' C_sq2g1i_67b11037_isinstack_L000354_357 ' (symbol refcount = 0)
 adds r23, #8 ' ADDP4 coni
C_sq2g1i_67b11037_isinstack_L000354_359
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sq2g1i_67b11037_isinstack_L000354_356' LTU4
 mov r0, #0 ' reg <- coni
C_sq2g1i_67b11037_isinstack_L000354_355
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sq2g1j_67b11037_getupvalname_L000362 ' <symbol:getupvalname>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sq2g1j_67b11037_getupvalname_L000362_367 ' JUMPV addrg
C_sq2g1j_67b11037_getupvalname_L000362_364
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, r15
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sq2g1j_67b11037_getupvalname_L000362_368 ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g5_67b11037_upvalname_L000068
 add SP, #4 ' CALL addrg
 mov RI, r19
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_sq2go_67b11037_getobjname_L000209_295_L000296
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2g1j_67b11037_getupvalname_L000362_363 ' JUMPV addrg
C_sq2g1j_67b11037_getupvalname_L000362_368
' C_sq2g1j_67b11037_getupvalname_L000362_365 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sq2g1j_67b11037_getupvalname_L000362_367
 mov r22, r15
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_sq2g1j_67b11037_getupvalname_L000362_364 ' LTI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sq2g1j_67b11037_getupvalname_L000362_363
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sq2g1k_67b11037_formatvarinfo_L000370 ' <symbol:formatvarinfo>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sq2g1k_67b11037_formatvarinfo_L000370_372 ' NEU4
 jmp #LODL
 long @C_sq2gk_67b11037_auxgetinfo_L000156_184_L000185
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sq2g1k_67b11037_formatvarinfo_L000370_371 ' JUMPV addrg
C_sq2g1k_67b11037_formatvarinfo_L000370_372
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sq2g1k_67b11037_formatvarinfo_L000370_374_L000375
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sq2g1k_67b11037_formatvarinfo_L000370_371
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sq2g1m_67b11037_varinfo_L000376 ' <symbol:varinfo>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ff0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 mov r22, r19
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sq2g1m_67b11037_varinfo_L000376_378 ' NEI4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g1j_67b11037_getupvalname_L000362
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sq2g1m_67b11037_varinfo_L000376_380 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g1i_67b11037_isinstack_L000354
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sq2g1m_67b11037_varinfo_L000376_380 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sq2g1_67b11037_currentpc_L000022 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r21 ' CVI, CVU or LOAD
 mov r16, r20
 adds r16, #8 ' ADDP4 coni
 sub r18, r16 ' SUBU (1)
 mov r16, #8 ' reg <- coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r16 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r3, r0 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov RI, r20
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2go_67b11037_getobjname_L000209
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_sq2g1m_67b11037_varinfo_L000376_380
C_sq2g1m_67b11037_varinfo_L000376_378
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g1k_67b11037_formatvarinfo_L000370
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sq2g1m_67b11037_varinfo_L000376_377 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2g1n_67b11037_typeerror_L000382 ' <symbol:typeerror>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__objtypename
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sq2g1n_67b11037_typeerror_L000382_384_L000385
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaG__runerror
 add SP, #16 ' CALL addrg
' C_sq2g1n_67b11037_typeerror_L000382_383 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaG_typeerror

 alignl ' align long
C_luaG__typeerror ' <symbol:luaG_typeerror>
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
 long @C_sq2g1m_67b11037_varinfo_L000376
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g1n_67b11037_typeerror_L000382
 add SP, #12 ' CALL addrg
' C_luaG__typeerror_386 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaG_callerror

 alignl ' align long
C_luaG__callerror ' <symbol:luaG_callerror>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g_67b11037_funcnamefromcall_L000021
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__callerror_389 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g1k_67b11037_formatvarinfo_L000370
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__callerror_390 ' JUMPV addrg
C_luaG__callerror_389
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g1m_67b11037_varinfo_L000376
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_luaG__callerror_390
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_luaG__callerror_391_L000392
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g1n_67b11037_typeerror_L000382
 add SP, #12 ' CALL addrg
' C_luaG__callerror_387 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaG_forerror

 alignl ' align long
C_luaG__forerror ' <symbol:luaG_forerror>
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
 long @C_luaT__objtypename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaG__forerror_394_L000395
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #12 ' CALL addrg
' C_luaG__forerror_393 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaG_concaterror

 alignl ' align long
C_luaG__concaterror ' <symbol:luaG_concaterror>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaG__concaterror_399 ' EQI4
 cmps r20,  #3 wz
 jmp #BRNZ
 long @C_luaG__concaterror_397 ' NEI4
C_luaG__concaterror_399
 mov r21, r19 ' CVI, CVU or LOAD
C_luaG__concaterror_397
 jmp #LODL
 long @C_luaG__concaterror_400_L000401
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
' C_luaG__concaterror_396 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaG_opinterror

 alignl ' align long
C_luaG__opinterror ' <symbol:luaG_opinterror>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #3 wz
 jmp #BR_Z
 long @C_luaG__opinterror_403 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
C_luaG__opinterror_403
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
' C_luaG__opinterror_402 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaG_tointerror

 alignl ' align long
C_luaG__tointerror ' <symbol:luaG_tointerror>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaG__tointerror_406 ' NEI4
 mov r19, r21 ' CVI, CVU or LOAD
C_luaG__tointerror_406
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g1m_67b11037_varinfo_L000376
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaG__tointerror_408_L000409
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #8 ' CALL addrg
' C_luaG__tointerror_405 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaG_ordererror

 alignl ' align long
C_luaG__ordererror ' <symbol:luaG_ordererror>
 jmp #NEWF
 sub SP, #4
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
 long @C_luaT__objtypename
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__objtypename
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaG__ordererror_411 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaG__ordererror_413_L000414
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaG__ordererror_412 ' JUMPV addrg
C_luaG__ordererror_411
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaG__ordererror_415_L000416
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #12 ' CALL addrg
C_luaG__ordererror_412
' C_luaG__ordererror_410 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaG_addinfo

 alignl ' align long
C_luaG__addinfo ' <symbol:luaG_addinfo>
 jmp #NEWF
 sub SP, #60
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__addinfo_418 ' EQU4
 mov r22, #4 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaG__addinfo_421 ' NEI4
 mov r22, r19
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__addinfo_422 ' JUMPV addrg
C_luaG__addinfo_421
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRU4 reg
C_luaG__addinfo_422
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19
 adds r3, #16 ' ADDP4 coni
 mov r4, FP
 sub r4, #-(-64) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__chunkid
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaG__addinfo_419 ' JUMPV addrg
C_luaG__addinfo_418
 mov r22, #63 ' reg <- coni
 mov RI, FP
 sub RI, #-(-64)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-63)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_luaG__addinfo_419
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-64) ' reg ARG ADDRLi
 jmp #LODL
 long @C_luaG__addinfo_424_L000425
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaG__addinfo_417 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #60 ' framesize
 jmp #RETF


' Catalina Export luaG_errormsg

 alignl ' align long
C_luaG__errormsg ' <symbol:luaG_errormsg>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__errormsg_427 ' EQI4
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
C_luaG__errormsg_427
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
' C_luaG__errormsg_426 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaG_runerror

 alignl ' align long
C_luaG__runerror ' <symbol:luaG_runerror>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
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
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_luaG__runerror_430 ' LEI4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_luaG__runerror_430
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22 , RI ' ASGNP4 addrli reg
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
 long @C_luaO__pushvfstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__runerror_433 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sq2g3_67b11037_getcurrentline_L000039 ' CALL addrg
 mov r2, r0 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__addinfo
 add SP, #12 ' CALL addrg
C_luaG__runerror_433
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaG__errormsg ' CALL addrg
' C_luaG__runerror_429 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sq2g20_67b11037_changedline_L000435 ' <symbol:changedline>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sq2g20_67b11037_changedline_L000435_437 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sq2g20_67b11037_changedline_L000435_436 ' JUMPV addrg
C_sq2g20_67b11037_changedline_L000435_437
 mov r22, r19 ' SUBI/P
 subs r22, r21 ' SUBI/P (3)
 cmps r22,  #64 wz,wc
 jmp #BRAE
 long @C_sq2g20_67b11037_changedline_L000435_439 ' GEI4
 mov r15, #0 ' reg <- coni
 mov r17, r21 ' CVI, CVU or LOAD
C_sq2g20_67b11037_changedline_L000435_441
 mov r22, r17
 adds r22, #1 ' ADDI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #64 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRI1 reg
 mov r13, r22 ' CVII
 shl r13, #24
 sar r13, #24 ' sign extend
 jmp #LODL
 long -128
 mov r22, RI ' reg <- con
 cmps r13, r22 wz
 jmp #BRNZ
 long @C_sq2g20_67b11037_changedline_L000435_445 ' NEI4
 jmp #JMPA
 long @C_sq2g20_67b11037_changedline_L000435_443 ' JUMPV addrg
C_sq2g20_67b11037_changedline_L000435_445
 adds r15, r13 ' ADDI/P (1)
 cmps r17, r19 wz
 jmp #BRNZ
 long @C_sq2g20_67b11037_changedline_L000435_441 ' NEI4
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_sq2g20_67b11037_changedline_L000435_450 ' EQI4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_sq2g20_67b11037_changedline_L000435_451 ' JUMPV addrg
C_sq2g20_67b11037_changedline_L000435_450
 mov r11, #0 ' reg <- coni
C_sq2g20_67b11037_changedline_L000435_451
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sq2g20_67b11037_changedline_L000435_436 ' JUMPV addrg
C_sq2g20_67b11037_changedline_L000435_443
C_sq2g20_67b11037_changedline_L000435_439
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__getfuncline
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__getfuncline
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sq2g20_67b11037_changedline_L000435_453 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_sq2g20_67b11037_changedline_L000435_454 ' JUMPV addrg
C_sq2g20_67b11037_changedline_L000435_453
 mov r17, #0 ' reg <- coni
C_sq2g20_67b11037_changedline_L000435_454
 mov r0, r17 ' CVI, CVU or LOAD
C_sq2g20_67b11037_changedline_L000435_436
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaG_traceexec

 alignl ' align long
C_luaG__traceexec ' <symbol:luaG_traceexec>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $ffe800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #12 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__traceexec_456 ' NEI4
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaG__traceexec_455 ' JUMPV addrg
C_luaG__traceexec_456
 adds r21, #4 ' ADDP4 coni
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #108 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaG__traceexec_459 ' NEI4
 mov r20, r17 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r20, #8 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaG__traceexec_459 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaG__traceexec_460 ' JUMPV addrg
C_luaG__traceexec_459
 mov r13, #0 ' reg <- coni
C_luaG__traceexec_460
 mov r15, r13 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_461 ' EQI4
 mov r22, r23
 adds r22, #108 ' ADDP4 coni
 mov r20, r23
 adds r20, #104 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaG__traceexec_462 ' JUMPV addrg
C_luaG__traceexec_461
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__traceexec_463 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaG__traceexec_455 ' JUMPV addrg
C_luaG__traceexec_463
C_luaG__traceexec_462
 mov r22, r19
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_465 ' EQI4
 mov r22, r19
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long -65
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaG__traceexec_455 ' JUMPV addrg
C_luaG__traceexec_465
 mov r22, #16 ' reg <- coni
 mov r20, r19
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, #0 ' reg <- coni
 mov r16, r20
 and r16, #127 ' BANDU4 coni
 jmp #LODL
 long @C_luaP__opmodes
 mov r14, RI ' reg <- addrg
 adds r16, r14 ' ADDI/P (1)
 mov RI, r16
 jmp #RBYT
 mov r16, BC ' reg <- INDIRU1 reg
 and r16, cviu_m1 ' zero extend
 and r16, #32 ' BANDI4 coni
 cmps r16, r18 wz
 jmp #BR_Z
 long @C_luaG__traceexec_469 ' EQI4
 mov RI, r20
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #255 ' BANDU4 coni
 cmps r22, r18 wz
 jmp #BR_Z
 long @C_luaG__traceexec_467 ' EQI4
C_luaG__traceexec_469
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_luaG__traceexec_467
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_470 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r4, RI ' reg ARG con
 mov r5, #3 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaD__hook
 add SP, #16 ' CALL addrg
C_luaG__traceexec_470
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_472 ' EQI4
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_luaG__traceexec_475 ' GEI4
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r11, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaG__traceexec_476 ' JUMPV addrg
C_luaG__traceexec_475
 mov r11, #0 ' reg <- coni
C_luaG__traceexec_476
 mov RI, FP
 sub RI, #-(-16)
 wrlong r11, RI ' ASGNI4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_luaG__traceexec_479 ' LEI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sq2g20_67b11037_changedline_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_477 ' EQI4
C_luaG__traceexec_479
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__getfuncline
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, #2 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaD__hook
 add SP, #16 ' CALL addrg
C_luaG__traceexec_477
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_luaG__traceexec_472
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_luaG__traceexec_480 ' NEI4
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_482 ' EQI4
 mov r22, r23
 adds r22, #108 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_luaG__traceexec_482
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
C_luaG__traceexec_480
 mov r0, #1 ' reg <- coni
C_luaG__traceexec_455
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import luaV_tointegerns

' Catalina Import luaH_new

' Catalina Import luaH_setint

' Catalina Import luaC_step

' Catalina Import luaF_getlocalname

' Catalina Import luaD_throw

' Catalina Import luaD_callnoyield

' Catalina Import luaD_hook

' Catalina Import luaP_opmodes

' Catalina Import luaT_objtypename

' Catalina Import luaO_chunkid

' Catalina Import luaO_pushfstring

' Catalina Import luaO_pushvfstring

' Catalina Import strchr

' Catalina Import strcmp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaG__addinfo_424_L000425 ' <symbol:424>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 100
 byte 58
 byte 32
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaG__ordererror_415_L000416 ' <symbol:415>
 byte 97
 byte 116
 byte 116
 byte 101
 byte 109
 byte 112
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 99
 byte 111
 byte 109
 byte 112
 byte 97
 byte 114
 byte 101
 byte 32
 byte 37
 byte 115
 byte 32
 byte 119
 byte 105
 byte 116
 byte 104
 byte 32
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaG__ordererror_413_L000414 ' <symbol:413>
 byte 97
 byte 116
 byte 116
 byte 101
 byte 109
 byte 112
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 99
 byte 111
 byte 109
 byte 112
 byte 97
 byte 114
 byte 101
 byte 32
 byte 116
 byte 119
 byte 111
 byte 32
 byte 37
 byte 115
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_luaG__tointerror_408_L000409 ' <symbol:408>
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 37
 byte 115
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
C_luaG__concaterror_400_L000401 ' <symbol:400>
 byte 99
 byte 111
 byte 110
 byte 99
 byte 97
 byte 116
 byte 101
 byte 110
 byte 97
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_luaG__forerror_394_L000395 ' <symbol:394>
 byte 98
 byte 97
 byte 100
 byte 32
 byte 39
 byte 102
 byte 111
 byte 114
 byte 39
 byte 32
 byte 37
 byte 115
 byte 32
 byte 40
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
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
 byte 41
 byte 0

 alignl ' align long
C_luaG__callerror_391_L000392 ' <symbol:391>
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_sq2g1n_67b11037_typeerror_L000382_384_L000385 ' <symbol:384>
 byte 97
 byte 116
 byte 116
 byte 101
 byte 109
 byte 112
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 37
 byte 115
 byte 32
 byte 97
 byte 32
 byte 37
 byte 115
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_sq2g1k_67b11037_formatvarinfo_L000370_374_L000375 ' <symbol:374>
 byte 32
 byte 40
 byte 37
 byte 115
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 41
 byte 0

 alignl ' align long
C_sq2g_67b11037_funcnamefromcall_L000021_350_L000351 ' <symbol:350>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_sq2g_67b11037_funcnamefromcall_L000021_346_L000347 ' <symbol:346>
 byte 104
 byte 111
 byte 111
 byte 107
 byte 0

 alignl ' align long
C_sq2g19_67b11037_funcnamefromcode_L000312_341_L000342 ' <symbol:341>
 byte 109
 byte 101
 byte 116
 byte 97
 byte 109
 byte 101
 byte 116
 byte 104
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_sq2g19_67b11037_funcnamefromcode_L000312_319_L000320 ' <symbol:319>
 byte 102
 byte 111
 byte 114
 byte 32
 byte 105
 byte 116
 byte 101
 byte 114
 byte 97
 byte 116
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_sq2go_67b11037_getobjname_L000209_306_L000307 ' <symbol:306>
 byte 109
 byte 101
 byte 116
 byte 104
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_sq2go_67b11037_getobjname_L000209_303_L000304 ' <symbol:303>
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 97
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sq2go_67b11037_getobjname_L000209_295_L000296 ' <symbol:295>
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_sq2go_67b11037_getobjname_L000209_291_L000292 ' <symbol:291>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_sq2go_67b11037_getobjname_L000209_278_L000279 ' <symbol:278>
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_sq2gu_67b11037_gxf_L000262_270_L000271 ' <symbol:270>
 byte 102
 byte 105
 byte 101
 byte 108
 byte 100
 byte 0

 alignl ' align long
C_sq2gu_67b11037_gxf_L000262_268_L000269 ' <symbol:268>
 byte 103
 byte 108
 byte 111
 byte 98
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_sq2gu_67b11037_gxf_L000262_266_L000267 ' <symbol:266>
 byte 95
 byte 69
 byte 78
 byte 86
 byte 0

 alignl ' align long
C_sq2gk_67b11037_auxgetinfo_L000156_184_L000185 ' <symbol:184>
 byte 0

 alignl ' align long
C_sq2gb_67b11037_funcinfo_L000113_131_L000132 ' <symbol:131>
 byte 76
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_sq2gb_67b11037_funcinfo_L000113_129_L000130 ' <symbol:129>
 byte 109
 byte 97
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sq2gb_67b11037_funcinfo_L000113_127_L000128 ' <symbol:127>
 byte 61
 byte 63
 byte 0

 alignl ' align long
C_sq2gb_67b11037_funcinfo_L000113_120_L000121 ' <symbol:120>
 byte 67
 byte 0

 alignl ' align long
C_sq2gb_67b11037_funcinfo_L000113_118_L000119 ' <symbol:118>
 byte 61
 byte 91
 byte 67
 byte 93
 byte 0

 alignl ' align long
C_luaG__findlocal_96_L000097 ' <symbol:96>
 byte 40
 byte 67
 byte 32
 byte 116
 byte 101
 byte 109
 byte 112
 byte 111
 byte 114
 byte 97
 byte 114
 byte 121
 byte 41
 byte 0

 alignl ' align long
C_luaG__findlocal_94_L000095 ' <symbol:94>
 byte 40
 byte 116
 byte 101
 byte 109
 byte 112
 byte 111
 byte 114
 byte 97
 byte 114
 byte 121
 byte 41
 byte 0

 alignl ' align long
C_sq2g7_67b11037_findvararg_L000074_80_L000081 ' <symbol:80>
 byte 40
 byte 118
 byte 97
 byte 114
 byte 97
 byte 114
 byte 103
 byte 41
 byte 0

 alignl ' align long
C_sq2g5_67b11037_upvalname_L000068_72_L000073 ' <symbol:72>
 byte 63
 byte 0

' Catalina Code

DAT ' code segment
' end
