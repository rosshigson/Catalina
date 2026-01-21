' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slj01_696dde36_strlocal_L000024 ' <symbol:strlocal>
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_slj02_696dde36_strupval_L000025 ' <symbol:strupval>
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_slj03_696dde36_currentpc_L000026 ' <symbol:currentpc>
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
' C_slj03_696dde36_currentpc_L000026_27 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_slj04_696dde36_getbaseline_L000028 ' <symbol:getbaseline>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r4
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_slj04_696dde36_getbaseline_L000028_32 ' EQI4
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
 long @C_slj04_696dde36_getbaseline_L000028_30 ' GEI4
C_slj04_696dde36_getbaseline_L000028_32
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
 long @C_slj04_696dde36_getbaseline_L000028_29 ' JUMPV addrg
C_slj04_696dde36_getbaseline_L000028_30
 mov r22, r3 ' CVI, CVU or LOAD
 shr r22, #7 ' RSHU4 coni
 sub r22, #1 ' SUBU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj04_696dde36_getbaseline_L000028_34 ' JUMPV addrg
C_slj04_696dde36_getbaseline_L000028_33
 adds r23, #1 ' ADDI4 coni
C_slj04_696dde36_getbaseline_L000028_34
 mov r22, r23
 adds r22, #1 ' ADDI4 coni
 mov r20, r4
 adds r20, #36 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_slj04_696dde36_getbaseline_L000028_36 ' GEI4
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
 long @C_slj04_696dde36_getbaseline_L000028_33 ' GEI4
C_slj04_696dde36_getbaseline_L000028_36
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
C_slj04_696dde36_getbaseline_L000028_29
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
 long @C_luaG__getfuncline_38 ' NEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaG__getfuncline_37 ' JUMPV addrg
C_luaG__getfuncline_38
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj04_696dde36_getbaseline_L000028
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__getfuncline_41 ' JUMPV addrg
C_luaG__getfuncline_40
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
C_luaG__getfuncline_41
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
 long @C_luaG__getfuncline_40 ' LTI4
 mov r0, r19 ' CVI, CVU or LOAD
C_luaG__getfuncline_37
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_slj05_696dde36_getcurrentline_L000043 ' <symbol:getcurrentline>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_slj03_696dde36_currentpc_L000026 ' CALL addrg
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
' C_slj05_696dde36_getcurrentline_L000043_44 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slj06_696dde36_settraps_L000045 ' <symbol:settraps>
 jmp #PSHM
 long $500000 ' save registers
 jmp #JMPA
 long @C_slj06_696dde36_settraps_L000045_50 ' JUMPV addrg
C_slj06_696dde36_settraps_L000045_47
 mov r22, r2
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_slj06_696dde36_settraps_L000045_51 ' NEI4
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_slj06_696dde36_settraps_L000045_51
' C_slj06_696dde36_settraps_L000045_48 ' (symbol refcount = 0)
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
C_slj06_696dde36_settraps_L000045_50
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_slj06_696dde36_settraps_L000045_47 ' NEU4
' C_slj06_696dde36_settraps_L000045_46 ' (symbol refcount = 0)
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
 long @C_lua_sethook_56 ' EQU4
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_lua_sethook_54 ' NEI4
C_lua_sethook_56
 mov r19, #0 ' reg <- coni
 jmp #LODL
 long 0
 mov r21, RI ' reg <- con
C_lua_sethook_54
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
 long @C_lua_sethook_57 ' EQI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_slj06_696dde36_settraps_L000045 ' CALL addrg
C_lua_sethook_57
' C_lua_sethook_53 ' (symbol refcount = 0)
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
' C_lua_gethook_59 ' (symbol refcount = 0)
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
' C_lua_gethookmask_60 ' (symbol refcount = 0)
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
' C_lua_gethookcount_61 ' (symbol refcount = 0)
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
 long @C_lua_getstack_63 ' GEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_lua_getstack_62 ' JUMPV addrg
C_lua_getstack_63
 mov r22, r4
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_lua_getstack_68 ' JUMPV addrg
C_lua_getstack_65
 subs r3, #1 ' SUBI4 coni
' C_lua_getstack_66 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
C_lua_getstack_68
 cmps r3,  #0 wz,wc
 jmp #BRBE
 long @C_lua_getstack_69 ' LEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r4
 adds r20, #52 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_lua_getstack_65 ' NEU4
C_lua_getstack_69
 cmps r3,  #0 wz
 jmp #BRNZ
 long @C_lua_getstack_70 ' NEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r4
 adds r20, #52 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_getstack_70 ' EQU4
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
 long @C_lua_getstack_71 ' JUMPV addrg
C_lua_getstack_70
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_getstack_71
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_lua_getstack_62
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_slj07_696dde36_upvalname_L000072 ' <symbol:upvalname>
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
 long @C_slj07_696dde36_upvalname_L000072_74 ' NEU4
 jmp #LODL
 long @C_slj07_696dde36_upvalname_L000072_76_L000077
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj07_696dde36_upvalname_L000072_73 ' JUMPV addrg
C_slj07_696dde36_upvalname_L000072_74
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
C_slj07_696dde36_upvalname_L000072_73
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_slj09_696dde36_findvararg_L000078 ' <symbol:findvararg>
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
 long @C_slj09_696dde36_findvararg_L000078_80 ' EQI4
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
 long @C_slj09_696dde36_findvararg_L000078_82 ' LTI4
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
 long @C_slj09_696dde36_findvararg_L000078_84_L000085
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj09_696dde36_findvararg_L000078_79 ' JUMPV addrg
C_slj09_696dde36_findvararg_L000078_82
C_slj09_696dde36_findvararg_L000078_80
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_slj09_696dde36_findvararg_L000078_79
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
 long @C_luaG__findlocal_87 ' NEI4
 cmps r19,  #0 wz,wc
 jmp #BRAE
 long @C_luaG__findlocal_89 ' GEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj09_696dde36_findvararg_L000078
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__findlocal_86 ' JUMPV addrg
C_luaG__findlocal_89
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_slj03_696dde36_currentpc_L000026 ' CALL addrg
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
C_luaG__findlocal_87
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__findlocal_91 ' NEU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaG__findlocal_94 ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaG__findlocal_95 ' JUMPV addrg
C_luaG__findlocal_94
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
C_luaG__findlocal_95
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
 long @C_luaG__findlocal_96 ' LTI4
 cmps r19,  #0 wz,wc
 jmp #BRBE
 long @C_luaG__findlocal_96 ' LEI4
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__findlocal_103 ' NEI4
 jmp #LODL
 long @C_luaG__findlocal_98_L000099
 mov r11, RI ' reg <- addrg
 jmp #JMPA
 long @C_luaG__findlocal_104 ' JUMPV addrg
C_luaG__findlocal_103
 jmp #LODL
 long @C_luaG__findlocal_100_L000101
 mov r11, RI ' reg <- addrg
C_luaG__findlocal_104
 mov r15, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__findlocal_97 ' JUMPV addrg
C_luaG__findlocal_96
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaG__findlocal_86 ' JUMPV addrg
C_luaG__findlocal_97
C_luaG__findlocal_91
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__findlocal_105 ' EQU4
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
C_luaG__findlocal_105
 mov r0, r15 ' CVI, CVU or LOAD
C_luaG__findlocal_86
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
 long @C_lua_getlocal_108 ' NEU4
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
 long @C_lua_getlocal_110 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_lua_getlocal_109 ' JUMPV addrg
C_lua_getlocal_110
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
 long @C_lua_getlocal_109 ' JUMPV addrg
C_lua_getlocal_108
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
 long @C_lua_getlocal_112 ' EQU4
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
C_lua_getlocal_112
C_lua_getlocal_109
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
' C_lua_getlocal_107 ' (symbol refcount = 0)
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
 long @C_lua_setlocal_115 ' EQU4
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
C_lua_setlocal_115
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_setlocal_114 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_slj0d_696dde36_funcinfo_L000117 ' <symbol:funcinfo>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0d_696dde36_funcinfo_L000117_121 ' EQU4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 jmp #BR_Z
 long @C_slj0d_696dde36_funcinfo_L000117_119 ' EQI4
C_slj0d_696dde36_funcinfo_L000117_121
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C_slj0d_696dde36_funcinfo_L000117_122_L000123
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
 long @C_slj0d_696dde36_funcinfo_L000117_124_L000125
 mov r20, RI ' reg <- addrg
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_slj0d_696dde36_funcinfo_L000117_120 ' JUMPV addrg
C_slj0d_696dde36_funcinfo_L000117_119
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
 long @C_slj0d_696dde36_funcinfo_L000117_126 ' EQU4
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
 cmps r22,  #255 wz
 jmp #BR_Z
 long @C_slj0d_696dde36_funcinfo_L000117_129 ' EQI4
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
 long @C_slj0d_696dde36_funcinfo_L000117_130 ' JUMPV addrg
C_slj0d_696dde36_funcinfo_L000117_129
 mov r22, r19
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRU4 reg
C_slj0d_696dde36_funcinfo_L000117_130
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_slj0d_696dde36_funcinfo_L000117_127 ' JUMPV addrg
C_slj0d_696dde36_funcinfo_L000117_126
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 jmp #LODL
 long @C_slj0d_696dde36_funcinfo_L000117_131_L000132
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
C_slj0d_696dde36_funcinfo_L000117_127
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
 long @C_slj0d_696dde36_funcinfo_L000117_138 ' NEI4
 jmp #LODL
 long @C_slj0d_696dde36_funcinfo_L000117_133_L000134
 mov r17, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj0d_696dde36_funcinfo_L000117_139 ' JUMPV addrg
C_slj0d_696dde36_funcinfo_L000117_138
 jmp #LODL
 long @C_slj0d_696dde36_funcinfo_L000117_135_L000136
 mov r17, RI ' reg <- addrg
C_slj0d_696dde36_funcinfo_L000117_139
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
C_slj0d_696dde36_funcinfo_L000117_120
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
' C_slj0d_696dde36_funcinfo_L000117_118 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slj0j_696dde36_nextline_L000140 ' <symbol:nextline>
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
 long @C_slj0j_696dde36_nextline_L000140_142 ' EQI4
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
 long @C_slj0j_696dde36_nextline_L000140_141 ' JUMPV addrg
C_slj0j_696dde36_nextline_L000140_142
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__getfuncline
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_slj0j_696dde36_nextline_L000140_141
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slj0k_696dde36_collectvalidlines_L000144 ' <symbol:collectvalidlines>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0k_696dde36_collectvalidlines_L000144_148 ' EQU4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 jmp #BR_Z
 long @C_slj0k_696dde36_collectvalidlines_L000144_146 ' EQI4
C_slj0k_696dde36_collectvalidlines_L000144_148
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
 long @C_slj0k_696dde36_collectvalidlines_L000144_147 ' JUMPV addrg
C_slj0k_696dde36_collectvalidlines_L000144_146
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__new ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
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
 mov r22, r17
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0k_696dde36_collectvalidlines_L000144_149 ' EQU4
 mov r22, #17 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r17
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_slj0k_696dde36_collectvalidlines_L000144_152 ' NEI4
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_slj0k_696dde36_collectvalidlines_L000144_157 ' JUMPV addrg
C_slj0k_696dde36_collectvalidlines_L000144_152
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0j_696dde36_nextline_L000140
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_slj0k_696dde36_collectvalidlines_L000144_157 ' JUMPV addrg
C_slj0k_696dde36_collectvalidlines_L000144_154
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0j_696dde36_nextline_L000140
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__setint
 add SP, #12 ' CALL addrg
' C_slj0k_696dde36_collectvalidlines_L000144_155 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
C_slj0k_696dde36_collectvalidlines_L000144_157
 mov r22, r17
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r13, r22 wz,wc
 jmp #BR_B
 long @C_slj0k_696dde36_collectvalidlines_L000144_154 ' LTI4
C_slj0k_696dde36_collectvalidlines_L000144_149
C_slj0k_696dde36_collectvalidlines_L000144_147
' C_slj0k_696dde36_collectvalidlines_L000144_145 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_slj0l_696dde36_getfuncname_L000158 ' <symbol:getfuncname>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0l_696dde36_getfuncname_L000158_160 ' EQU4
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_slj0l_696dde36_getfuncname_L000158_160 ' NEI4
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
 long @C_slj0_696dde36_funcnamefromcall_L000023
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj0l_696dde36_getfuncname_L000158_159 ' JUMPV addrg
C_slj0l_696dde36_getfuncname_L000158_160
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_slj0l_696dde36_getfuncname_L000158_159
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slj0m_696dde36_auxgetinfo_L000162 ' <symbol:auxgetinfo>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_slj0m_696dde36_auxgetinfo_L000162_167 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_164
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 mov r22, #83 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_slj0m_696dde36_auxgetinfo_L000162_171 ' EQI4
 cmps r13, r22 wz,wc
 jmp #BR_A
 long @C_slj0m_696dde36_auxgetinfo_L000162_198 ' GTI4
' C_slj0m_696dde36_auxgetinfo_L000162_197 ' (symbol refcount = 0)
 cmps r13,  #76 wz
 jmp #BR_Z
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' EQI4
 jmp #JMPA
 long @C_slj0m_696dde36_auxgetinfo_L000162_168 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_198
 mov r22, #102 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' EQI4
 cmps r13, r22 wz,wc
 jmp #BR_B
 long @C_slj0m_696dde36_auxgetinfo_L000162_168 ' LTI4
' C_slj0m_696dde36_auxgetinfo_L000162_199 ' (symbol refcount = 0)
 cmps r13,  #108 wz,wc
 jmp #BR_B
 long @C_slj0m_696dde36_auxgetinfo_L000162_168 ' LTI4
 cmps r13,  #117 wz,wc
 jmp #BR_A
 long @C_slj0m_696dde36_auxgetinfo_L000162_168 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_slj0m_696dde36_auxgetinfo_L000162_200_L000202-432
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slj0m_696dde36_auxgetinfo_L000162_200_L000202 ' <symbol:200>
 long @C_slj0m_696dde36_auxgetinfo_L000162_172
 long @C_slj0m_696dde36_auxgetinfo_L000162_168
 long @C_slj0m_696dde36_auxgetinfo_L000162_187
 long @C_slj0m_696dde36_auxgetinfo_L000162_168
 long @C_slj0m_696dde36_auxgetinfo_L000162_168
 long @C_slj0m_696dde36_auxgetinfo_L000162_168
 long @C_slj0m_696dde36_auxgetinfo_L000162_192
 long @C_slj0m_696dde36_auxgetinfo_L000162_168
 long @C_slj0m_696dde36_auxgetinfo_L000162_183
 long @C_slj0m_696dde36_auxgetinfo_L000162_176

' Catalina Code

DAT ' code segment
C_slj0m_696dde36_auxgetinfo_L000162_171
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0d_696dde36_funcinfo_L000117
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_172
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0m_696dde36_auxgetinfo_L000162_174 ' EQU4
 mov r22, r17
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_slj0m_696dde36_auxgetinfo_L000162_174 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_slj05_696dde36_getcurrentline_L000043 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj0m_696dde36_auxgetinfo_L000162_175 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_174
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
C_slj0m_696dde36_auxgetinfo_L000162_175
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 mov BC, r11
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_176
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_slj0m_696dde36_auxgetinfo_L000162_178 ' NEU4
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_slj0m_696dde36_auxgetinfo_L000162_179 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_178
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r11, r22 ' CVUI
 and r11, cviu_m1 ' zero extend
C_slj0m_696dde36_auxgetinfo_L000162_179
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0m_696dde36_auxgetinfo_L000162_182 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 jmp #BR_Z
 long @C_slj0m_696dde36_auxgetinfo_L000162_180 ' EQI4
C_slj0m_696dde36_auxgetinfo_L000162_182
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
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_180
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
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_183
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0m_696dde36_auxgetinfo_L000162_185 ' EQU4
 mov r22, r17
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 mov r11, r22
 and r11, #32 ' BANDI4 coni
 jmp #JMPA
 long @C_slj0m_696dde36_auxgetinfo_L000162_186 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_185
 mov r11, #0 ' reg <- coni
C_slj0m_696dde36_auxgetinfo_L000162_186
 mov r22, r21
 adds r22, #39 ' ADDP4 coni
 mov r20, r11 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_187
 mov r2, r21
 adds r2, #4 ' ADDP4 coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0l_696dde36_getfuncname_L000158
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
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' NEU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 jmp #LODL
 long @C_slj0m_696dde36_auxgetinfo_L000162_190_L000191
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
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_192
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0m_696dde36_auxgetinfo_L000162_195 ' EQU4
 mov r22, r17
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #256 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_slj0m_696dde36_auxgetinfo_L000162_193 ' NEI4
C_slj0m_696dde36_auxgetinfo_L000162_195
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
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_193
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
 long @C_slj0m_696dde36_auxgetinfo_L000162_169 ' JUMPV addrg
C_slj0m_696dde36_auxgetinfo_L000162_168
 mov r15, #0 ' reg <- coni
C_slj0m_696dde36_auxgetinfo_L000162_169
' C_slj0m_696dde36_auxgetinfo_L000162_165 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
C_slj0m_696dde36_auxgetinfo_L000162_167
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_slj0m_696dde36_auxgetinfo_L000162_164 ' NEI4
 mov r0, r15 ' CVI, CVU or LOAD
' C_slj0m_696dde36_auxgetinfo_L000162_163 ' (symbol refcount = 0)
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
 long @C_lua_getinfo_205 ' NEI4
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
 long @C_lua_getinfo_206 ' JUMPV addrg
C_lua_getinfo_205
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
C_lua_getinfo_206
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #70 wz
 jmp #BR_Z
 long @C_lua_getinfo_210 ' EQI4
 cmps r22,  #102 wz
 jmp #BRNZ
 long @C_lua_getinfo_208 ' NEI4
C_lua_getinfo_210
 mov RI, r17
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_lua_getinfo_209 ' JUMPV addrg
C_lua_getinfo_208
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
C_lua_getinfo_209
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
 long @C_slj0m_696dde36_auxgetinfo_L000162
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
 long @C_lua_getinfo_211 ' EQU4
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
C_lua_getinfo_211
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
 long @C_lua_getinfo_213 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0k_696dde36_collectvalidlines_L000144
 add SP, #4 ' CALL addrg
C_lua_getinfo_213
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_lua_getinfo_204 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_slj0q_696dde36_filterpc_L000215 ' <symbol:filterpc>
 cmps r3, r2 wz,wc
 jmp #BRAE
 long @C_slj0q_696dde36_filterpc_L000215_217 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_slj0q_696dde36_filterpc_L000215_216 ' JUMPV addrg
C_slj0q_696dde36_filterpc_L000215_217
 mov r0, r3 ' CVI, CVU or LOAD
C_slj0q_696dde36_filterpc_L000215_216
 jmp #RETN


 alignl ' align long
C_slj0r_696dde36_findsetreg_L000219 ' <symbol:findsetreg>
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
 long @C_slj0r_696dde36_findsetreg_L000219_221 ' EQI4
 subs r21, #1 ' SUBI4 coni
C_slj0r_696dde36_findsetreg_L000219_221
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_226 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_223
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
 long @C_slj0r_696dde36_findsetreg_L000219_242 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_slj0r_696dde36_findsetreg_L000219_249 ' GTI4
' C_slj0r_696dde36_findsetreg_L000219_248 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #8 wz
 jmp #BR_Z
 long @C_slj0r_696dde36_findsetreg_L000219_230 ' EQI4
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_227 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_249
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #68 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_slj0r_696dde36_findsetreg_L000219_238 ' EQI4
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_slj0r_696dde36_findsetreg_L000219_238 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_slj0r_696dde36_findsetreg_L000219_227 ' LTI4
' C_slj0r_696dde36_findsetreg_L000219_250 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #76 wz
 jmp #BR_Z
 long @C_slj0r_696dde36_findsetreg_L000219_234 ' EQI4
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_227 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_230
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
 long @C_slj0r_696dde36_findsetreg_L000219_232 ' GTI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 adds r22, r20 ' ADDI/P (1)
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_slj0r_696dde36_findsetreg_L000219_232 ' GTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_233 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_232
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_slj0r_696dde36_findsetreg_L000219_233
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_228 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_234
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #2 ' ADDI4 coni
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_slj0r_696dde36_findsetreg_L000219_236 ' LTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_237 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_236
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_slj0r_696dde36_findsetreg_L000219_237
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_228 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_238
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_slj0r_696dde36_findsetreg_L000219_240 ' LTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_241 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_240
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_slj0r_696dde36_findsetreg_L000219_241
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_228 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_242
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
 long @C_slj0r_696dde36_findsetreg_L000219_243 ' GTI4
 cmps r22, r15 wz,wc
 jmp #BRBE
 long @C_slj0r_696dde36_findsetreg_L000219_243 ' LEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRI4 regl
C_slj0r_696dde36_findsetreg_L000219_243
 mov r9, #0 ' reg <- coni
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_228 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_227
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
 long @C_slj0r_696dde36_findsetreg_L000219_246 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_slj0r_696dde36_findsetreg_L000219_246 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_slj0r_696dde36_findsetreg_L000219_247 ' JUMPV addrg
C_slj0r_696dde36_findsetreg_L000219_246
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_slj0r_696dde36_findsetreg_L000219_247
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r9, r22 ' reg <- INDIRI4 regl
C_slj0r_696dde36_findsetreg_L000219_228
 cmps r9,  #0 wz
 jmp #BR_Z
 long @C_slj0r_696dde36_findsetreg_L000219_251 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0q_696dde36_filterpc_L000215
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
C_slj0r_696dde36_findsetreg_L000219_251
' C_slj0r_696dde36_findsetreg_L000219_224 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_slj0r_696dde36_findsetreg_L000219_226
 cmps r17, r21 wz,wc
 jmp #BR_B
 long @C_slj0r_696dde36_findsetreg_L000219_223 ' LTI4
 mov r0, r13 ' CVI, CVU or LOAD
' C_slj0r_696dde36_findsetreg_L000219_220 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_slj0s_696dde36_kname_L000253 ' <symbol:kname>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r3
 shl r22, #3 ' LSHI4 coni
 mov r20, r4
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #4 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_slj0s_696dde36_kname_L000253_255 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_slj0s_696dde36_kname_L000253_257_L000258
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj0s_696dde36_kname_L000253_254 ' JUMPV addrg
C_slj0s_696dde36_kname_L000253_255
 jmp #LODL
 long @C_slj07_696dde36_upvalname_L000072_76_L000077
 mov r22, RI ' reg <- addrg
 mov RI, r2
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_slj0s_696dde36_kname_L000253_254
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_slj0u_696dde36_basicgetobjname_L000259 ' <symbol:basicgetobjname>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 mov r2, r15 ' CVI, CVU or LOAD
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
 long @C_slj0u_696dde36_basicgetobjname_L000259_261 ' EQU4
 jmp #LODL
 long @C_slj01_696dde36_strlocal_L000024
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj0u_696dde36_basicgetobjname_L000259_260 ' JUMPV addrg
C_slj0u_696dde36_basicgetobjname_L000259_261
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0r_696dde36_findsetreg_L000219
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov RI, r21
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_slj0u_696dde36_basicgetobjname_L000259_263 ' EQI4
 mov r22, r15
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
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 and r22, #127 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r13, r22 ' reg <- INDIRI4 regl
 mov r22, #0 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_slj0u_696dde36_basicgetobjname_L000259_268 ' EQI4
 cmps r13,  #3 wz
 jmp #BR_Z
 long @C_slj0u_696dde36_basicgetobjname_L000259_272 ' EQI4
 cmps r13,  #4 wz
 jmp #BR_Z
 long @C_slj0u_696dde36_basicgetobjname_L000259_273 ' EQI4
 cmps r13, r22 wz,wc
 jmp #BR_B
 long @C_slj0u_696dde36_basicgetobjname_L000259_266 ' LTI4
' C_slj0u_696dde36_basicgetobjname_L000259_274 ' (symbol refcount = 0)
 cmps r13,  #9 wz
 jmp #BR_Z
 long @C_slj0u_696dde36_basicgetobjname_L000259_271 ' EQI4
 jmp #JMPA
 long @C_slj0u_696dde36_basicgetobjname_L000259_266 ' JUMPV addrg
C_slj0u_696dde36_basicgetobjname_L000259_268
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 shr r20, #7 ' RSHU4 coni
 and r20, #255 ' BANDU4 coni
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_slj0u_696dde36_basicgetobjname_L000259_266 ' GEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0u_696dde36_basicgetobjname_L000259
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj0u_696dde36_basicgetobjname_L000259_260 ' JUMPV addrg
C_slj0u_696dde36_basicgetobjname_L000259_271
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj07_696dde36_upvalname_L000072
 add SP, #4 ' CALL addrg
 mov RI, r17
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_slj02_696dde36_strupval_L000025
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj0u_696dde36_basicgetobjname_L000259_260 ' JUMPV addrg
C_slj0u_696dde36_basicgetobjname_L000259_272
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0s_696dde36_kname_L000253
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj0u_696dde36_basicgetobjname_L000259_260 ' JUMPV addrg
C_slj0u_696dde36_basicgetobjname_L000259_273
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r15
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
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0s_696dde36_kname_L000253
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj0u_696dde36_basicgetobjname_L000259_260 ' JUMPV addrg
C_slj0u_696dde36_basicgetobjname_L000259_266
C_slj0u_696dde36_basicgetobjname_L000259_263
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_slj0u_696dde36_basicgetobjname_L000259_260
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_slj0v_696dde36_rname_L000275 ' <symbol:rname>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r4, RI ' spill reg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 add r4, #12 ' reg ARG ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0u_696dde36_basicgetobjname_L000259
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj0v_696dde36_rname_L000275_279 ' EQU4
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #99 wz
 jmp #BR_Z
 long @C_slj0v_696dde36_rname_L000275_277 ' EQI4
C_slj0v_696dde36_rname_L000275_279
 jmp #LODL
 long @C_slj07_696dde36_upvalname_L000072_76_L000077
 mov r22, RI ' reg <- addrg
 mov RI, r19
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
C_slj0v_696dde36_rname_L000275_277
' C_slj0v_696dde36_rname_L000275_276 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slj010_696dde36_rkname_L000280 ' <symbol:rkname>
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
 long @C_slj010_696dde36_rkname_L000280_282 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0s_696dde36_kname_L000253
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_slj010_696dde36_rkname_L000280_283 ' JUMPV addrg
C_slj010_696dde36_rkname_L000280_282
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0v_696dde36_rname_L000275
 add SP, #12 ' CALL addrg
C_slj010_696dde36_rkname_L000280_283
' C_slj010_696dde36_rkname_L000280_281 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_slj011_696dde36_isE_nv_L000284 ' <symbol:isEnv>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r4, RI ' spill reg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_slj011_696dde36_isE_nv_L000284_286 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj07_696dde36_upvalname_L000072
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_slj011_696dde36_isE_nv_L000284_287 ' JUMPV addrg
C_slj011_696dde36_isE_nv_L000284_286
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 add r4, #12 ' reg ARG ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0u_696dde36_basicgetobjname_L000259
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 jmp #LODL
 long @C_slj01_696dde36_strlocal_L000024
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_slj011_696dde36_isE_nv_L000284_288 ' EQU4
 jmp #LODL
 long @C_slj02_696dde36_strupval_L000025
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_slj011_696dde36_isE_nv_L000284_288 ' EQU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_slj011_696dde36_isE_nv_L000284_288
C_slj011_696dde36_isE_nv_L000284_287
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22 ' CVI, CVU or LOAD
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_slj011_696dde36_isE_nv_L000284_297 ' EQU4
 jmp #LODL
 long @C_slj011_696dde36_isE_nv_L000284_290_L000291
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
 long @C_slj011_696dde36_isE_nv_L000284_297 ' NEI4
 jmp #LODL
 long @C_slj011_696dde36_isE_nv_L000284_292_L000293
 mov r17, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj011_696dde36_isE_nv_L000284_298 ' JUMPV addrg
C_slj011_696dde36_isE_nv_L000284_297
 jmp #LODL
 long @C_slj011_696dde36_isE_nv_L000284_294_L000295
 mov r17, RI ' reg <- addrg
C_slj011_696dde36_isE_nv_L000284_298
 mov r0, r17 ' CVI, CVU or LOAD
' C_slj011_696dde36_isE_nv_L000284_285 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_slj015_696dde36_getobjname_L000299 ' <symbol:getobjname>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r4, RI ' spill reg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 add r4, #12 ' reg ARG ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0u_696dde36_basicgetobjname_L000259
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slj015_696dde36_getobjname_L000299_301 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 jmp #JMPA
 long @C_slj015_696dde36_getobjname_L000299_300 ' JUMPV addrg
C_slj015_696dde36_getobjname_L000299_301
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_slj015_696dde36_getobjname_L000299_303 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
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
 rdlong r17, r22 ' reg <- INDIRI4 regl
 cmps r17,  #11 wz,wc
 jmp #BR_B
 long @C_slj015_696dde36_getobjname_L000299_306 ' LTI4
 cmps r17,  #20 wz,wc
 jmp #BR_A
 long @C_slj015_696dde36_getobjname_L000299_306 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_slj015_696dde36_getobjname_L000299_317_L000319-44
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slj015_696dde36_getobjname_L000299_317_L000319 ' <symbol:317>
 long @C_slj015_696dde36_getobjname_L000299_308
 long @C_slj015_696dde36_getobjname_L000299_309
 long @C_slj015_696dde36_getobjname_L000299_310
 long @C_slj015_696dde36_getobjname_L000299_313
 long @C_slj015_696dde36_getobjname_L000299_306
 long @C_slj015_696dde36_getobjname_L000299_306
 long @C_slj015_696dde36_getobjname_L000299_306
 long @C_slj015_696dde36_getobjname_L000299_306
 long @C_slj015_696dde36_getobjname_L000299_306
 long @C_slj015_696dde36_getobjname_L000299_314

' Catalina Code

DAT ' code segment
C_slj015_696dde36_getobjname_L000299_308
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0s_696dde36_kname_L000253
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj011_696dde36_isE_nv_L000284
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj015_696dde36_getobjname_L000299_300 ' JUMPV addrg
C_slj015_696dde36_getobjname_L000299_309
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0v_696dde36_rname_L000275
 add SP, #12 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj011_696dde36_isE_nv_L000284
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj015_696dde36_getobjname_L000299_300 ' JUMPV addrg
C_slj015_696dde36_getobjname_L000299_310
 jmp #LODL
 long @C_slj015_696dde36_getobjname_L000299_311_L000312
 mov r22, RI ' reg <- addrg
 mov RI, r19
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_slj011_696dde36_isE_nv_L000284_294_L000295
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj015_696dde36_getobjname_L000299_300 ' JUMPV addrg
C_slj015_696dde36_getobjname_L000299_313
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj0s_696dde36_kname_L000253
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj011_696dde36_isE_nv_L000284
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj015_696dde36_getobjname_L000299_300 ' JUMPV addrg
C_slj015_696dde36_getobjname_L000299_314
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj010_696dde36_rkname_L000280
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_slj015_696dde36_getobjname_L000299_315_L000316
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj015_696dde36_getobjname_L000299_300 ' JUMPV addrg
C_slj015_696dde36_getobjname_L000299_306
C_slj015_696dde36_getobjname_L000299_303
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_slj015_696dde36_getobjname_L000299_300
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_slj01a_696dde36_funcnamefromcode_L000321 ' <symbol:funcnamefromcode>
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
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323 ' LTI4
 cmps r13,  #20 wz,wc
 jmp #BR_A
 long @C_slj01a_696dde36_funcnamefromcode_L000321_341 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_slj01a_696dde36_funcnamefromcode_L000321_342_L000344-44
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slj01a_696dde36_funcnamefromcode_L000321_342_L000344 ' <symbol:342>
 long @C_slj01a_696dde36_funcnamefromcode_L000321_330
 long @C_slj01a_696dde36_funcnamefromcode_L000321_330
 long @C_slj01a_696dde36_funcnamefromcode_L000321_330
 long @C_slj01a_696dde36_funcnamefromcode_L000321_330
 long @C_slj01a_696dde36_funcnamefromcode_L000321_331
 long @C_slj01a_696dde36_funcnamefromcode_L000321_331
 long @C_slj01a_696dde36_funcnamefromcode_L000321_331
 long @C_slj01a_696dde36_funcnamefromcode_L000321_331
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_330

' Catalina Code

DAT ' code segment
C_slj01a_696dde36_funcnamefromcode_L000321_341
 cmps r13,  #46 wz,wc
 jmp #BR_B
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323 ' LTI4
 cmps r13,  #76 wz,wc
 jmp #BR_A
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_slj01a_696dde36_funcnamefromcode_L000321_346_L000348-184
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slj01a_696dde36_funcnamefromcode_L000321_346_L000348 ' <symbol:346>
 long @C_slj01a_696dde36_funcnamefromcode_L000321_332
 long @C_slj01a_696dde36_funcnamefromcode_L000321_332
 long @C_slj01a_696dde36_funcnamefromcode_L000321_332
 long @C_slj01a_696dde36_funcnamefromcode_L000321_333
 long @C_slj01a_696dde36_funcnamefromcode_L000321_334
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_335
 long @C_slj01a_696dde36_funcnamefromcode_L000321_336
 long @C_slj01a_696dde36_funcnamefromcode_L000321_340
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_337
 long @C_slj01a_696dde36_funcnamefromcode_L000321_338
 long @C_slj01a_696dde36_funcnamefromcode_L000321_339
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_338
 long @C_slj01a_696dde36_funcnamefromcode_L000321_339
 long @C_slj01a_696dde36_funcnamefromcode_L000321_338
 long @C_slj01a_696dde36_funcnamefromcode_L000321_339
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_326
 long @C_slj01a_696dde36_funcnamefromcode_L000321_326
 long @C_slj01a_696dde36_funcnamefromcode_L000321_340
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_323
 long @C_slj01a_696dde36_funcnamefromcode_L000321_327

' Catalina Code

DAT ' code segment
C_slj01a_696dde36_funcnamefromcode_L000321_326
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
 long @C_slj015_696dde36_getobjname_L000299
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_322 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_327
 jmp #LODL
 long @C_slj01a_696dde36_funcnamefromcode_L000321_328_L000329
 mov r22, RI ' reg <- addrg
 mov RI, r17
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_slj01a_696dde36_funcnamefromcode_L000321_328_L000329
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_322 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_330
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_331
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_332
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_333
 mov r15, #18 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_334
 mov r15, #19 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_335
 mov r15, #4 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_336
 mov r15, #22 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_337
 mov r15, #5 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_338
 mov r15, #20 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_339
 mov r15, #21 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_340
 mov r15, #24 ' reg <- coni
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_324 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_323
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_slj01a_696dde36_funcnamefromcode_L000321_322 ' JUMPV addrg
C_slj01a_696dde36_funcnamefromcode_L000321_324
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
 long @C_slj01a_696dde36_funcnamefromcode_L000321_350_L000351
 mov r0, RI ' reg <- addrg
C_slj01a_696dde36_funcnamefromcode_L000321_322
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_slj0_696dde36_funcnamefromcall_L000023 ' <symbol:funcnamefromcall>
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
 long @C_slj0_696dde36_funcnamefromcall_L000023_353 ' EQI4
 jmp #LODL
 long @C_slj07_696dde36_upvalname_L000072_76_L000077
 mov r22, RI ' reg <- addrg
 mov RI, r19
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_slj0_696dde36_funcnamefromcall_L000023_355_L000356
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj0_696dde36_funcnamefromcall_L000023_352 ' JUMPV addrg
C_slj0_696dde36_funcnamefromcall_L000023_353
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_slj0_696dde36_funcnamefromcall_L000023_357 ' EQI4
 jmp #LODL
 long @C_slj0_696dde36_funcnamefromcall_L000023_359_L000360
 mov r22, RI ' reg <- addrg
 mov RI, r19
 mov BC, r22 
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_slj01a_696dde36_funcnamefromcode_L000321_350_L000351
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj0_696dde36_funcnamefromcall_L000023_352 ' JUMPV addrg
C_slj0_696dde36_funcnamefromcall_L000023_357
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_slj0_696dde36_funcnamefromcall_L000023_361 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_slj03_696dde36_currentpc_L000026 ' CALL addrg
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
 long @C_slj01a_696dde36_funcnamefromcode_L000321
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj0_696dde36_funcnamefromcall_L000023_352 ' JUMPV addrg
C_slj0_696dde36_funcnamefromcall_L000023_361
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_slj0_696dde36_funcnamefromcall_L000023_352
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slj01j_696dde36_instack_L000363 ' <symbol:instack>
 jmp #PSHM
 long $f00000 ' save registers
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r21, r22
 adds r21, #8 ' ADDP4 coni
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_slj01j_696dde36_instack_L000363_368 ' JUMPV addrg
C_slj01j_696dde36_instack_L000363_365
 mov r22, r2 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #3 ' LSHI4 coni
 adds r20, r21 ' ADDI/P (1)
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_slj01j_696dde36_instack_L000363_369 ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj01j_696dde36_instack_L000363_364 ' JUMPV addrg
C_slj01j_696dde36_instack_L000363_369
' C_slj01j_696dde36_instack_L000363_366 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_slj01j_696dde36_instack_L000363_368
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_slj01j_696dde36_instack_L000363_365' LTU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_slj01j_696dde36_instack_L000363_364
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_slj01k_696dde36_getupvalname_L000371 ' <symbol:getupvalname>
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
 long @C_slj01k_696dde36_getupvalname_L000371_376 ' JUMPV addrg
C_slj01k_696dde36_getupvalname_L000371_373
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
 long @C_slj01k_696dde36_getupvalname_L000371_377 ' NEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj07_696dde36_upvalname_L000072
 add SP, #4 ' CALL addrg
 mov RI, r19
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long @C_slj02_696dde36_strupval_L000025
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj01k_696dde36_getupvalname_L000371_372 ' JUMPV addrg
C_slj01k_696dde36_getupvalname_L000371_377
' C_slj01k_696dde36_getupvalname_L000371_374 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_slj01k_696dde36_getupvalname_L000371_376
 mov r22, r15
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_slj01k_696dde36_getupvalname_L000371_373 ' LTI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_slj01k_696dde36_getupvalname_L000371_372
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slj01l_696dde36_formatvarinfo_L000379 ' <symbol:formatvarinfo>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_slj01l_696dde36_formatvarinfo_L000379_381 ' NEU4
 jmp #LODL
 long @C_slj0m_696dde36_auxgetinfo_L000162_190_L000191
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_slj01l_696dde36_formatvarinfo_L000379_380 ' JUMPV addrg
C_slj01l_696dde36_formatvarinfo_L000379_381
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_slj01l_696dde36_formatvarinfo_L000379_383_L000384
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_slj01l_696dde36_formatvarinfo_L000379_380
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slj01n_696dde36_varinfo_L000385 ' <symbol:varinfo>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #LODL
 long 0
 mov r19, RI ' reg <- con
 mov r22, r17
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_slj01n_696dde36_varinfo_L000385_387 ' NEI4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj01k_696dde36_getupvalname_L000371
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_slj01n_696dde36_varinfo_L000385_389 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj01j_696dde36_instack_L000363
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_slj01n_696dde36_varinfo_L000385_391 ' LTI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_slj03_696dde36_currentpc_L000026 ' CALL addrg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r0 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj015_696dde36_getobjname_L000299
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_slj01n_696dde36_varinfo_L000385_391
C_slj01n_696dde36_varinfo_L000385_389
C_slj01n_696dde36_varinfo_L000385_387
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj01l_696dde36_formatvarinfo_L000379
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slj01n_696dde36_varinfo_L000385_386 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_slj01o_696dde36_typeerror_L000393 ' <symbol:typeerror>
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
 long @C_slj01o_696dde36_typeerror_L000393_395_L000396
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaG__runerror
 add SP, #16 ' CALL addrg
' C_slj01o_696dde36_typeerror_L000393_394 ' (symbol refcount = 0)
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
 long @C_slj01n_696dde36_varinfo_L000385
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj01o_696dde36_typeerror_L000393
 add SP, #12 ' CALL addrg
' C_luaG__typeerror_397 ' (symbol refcount = 0)
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
 long @C_slj0_696dde36_funcnamefromcall_L000023
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__callerror_400 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj01l_696dde36_formatvarinfo_L000379
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__callerror_401 ' JUMPV addrg
C_luaG__callerror_400
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj01n_696dde36_varinfo_L000385
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_luaG__callerror_401
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_luaG__callerror_402_L000403
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj01o_696dde36_typeerror_L000393
 add SP, #12 ' CALL addrg
' C_luaG__callerror_398 ' (symbol refcount = 0)
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
 long @C_luaG__forerror_405_L000406
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #12 ' CALL addrg
' C_luaG__forerror_404 ' (symbol refcount = 0)
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
 long @C_luaG__concaterror_410 ' EQI4
 cmps r20,  #3 wz
 jmp #BRNZ
 long @C_luaG__concaterror_408 ' NEI4
C_luaG__concaterror_410
 mov r21, r19 ' CVI, CVU or LOAD
C_luaG__concaterror_408
 jmp #LODL
 long @C_luaG__concaterror_411_L000412
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
' C_luaG__concaterror_407 ' (symbol refcount = 0)
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
 long @C_luaG__opinterror_414 ' EQI4
 mov r19, r21 ' CVI, CVU or LOAD
C_luaG__opinterror_414
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
' C_luaG__opinterror_413 ' (symbol refcount = 0)
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
 long @C_luaG__tointerror_417 ' NEI4
 mov r19, r21 ' CVI, CVU or LOAD
C_luaG__tointerror_417
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj01n_696dde36_varinfo_L000385
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaG__tointerror_419_L000420
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #8 ' CALL addrg
' C_luaG__tointerror_416 ' (symbol refcount = 0)
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
 long @C_luaG__ordererror_422 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaG__ordererror_424_L000425
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaG__ordererror_423 ' JUMPV addrg
C_luaG__ordererror_422
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaG__ordererror_426_L000427
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #12 ' CALL addrg
C_luaG__ordererror_423
' C_luaG__ordererror_421 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaG_addinfo

 alignl ' align long
C_luaG__addinfo ' <symbol:luaG_addinfo>
 jmp #NEWF
 sub SP, #60
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__addinfo_429 ' EQU4
 mov r22, r19
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #255 wz
 jmp #BR_Z
 long @C_luaG__addinfo_432 ' EQI4
 mov r22, r19
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaG__addinfo_433 ' JUMPV addrg
C_luaG__addinfo_432
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRU4 reg
C_luaG__addinfo_433
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
 long @C_luaG__addinfo_430 ' JUMPV addrg
C_luaG__addinfo_429
 mov r22, #63 ' reg <- coni
 mov RI, FP
 sub RI, #-(-64)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-63)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_luaG__addinfo_430
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-64) ' reg ARG ADDRLi
 jmp #LODL
 long @C_luaG__addinfo_435_L000436
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
' C_luaG__addinfo_428 ' (symbol refcount = 0)
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
 long @C_luaG__errormsg_438 ' EQI4
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
C_luaG__errormsg_438
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
' C_luaG__errormsg_437 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaG_runerror

 alignl ' align long
C_luaG__runerror ' <symbol:luaG_runerror>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $d40000 ' save registers
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
 long @C_luaG__runerror_441 ' LEI4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_luaG__runerror_441
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
 long @C_luaG__runerror_444 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_slj05_696dde36_getcurrentline_L000043 ' CALL addrg
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
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
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
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
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
C_luaG__runerror_444
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaG__errormsg ' CALL addrg
' C_luaG__runerror_440 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_slj021_696dde36_changedline_L000446 ' <symbol:changedline>
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
 long @C_slj021_696dde36_changedline_L000446_448 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_slj021_696dde36_changedline_L000446_447 ' JUMPV addrg
C_slj021_696dde36_changedline_L000446_448
 mov r22, r19 ' SUBI/P
 subs r22, r21 ' SUBI/P (3)
 cmps r22,  #64 wz,wc
 jmp #BRAE
 long @C_slj021_696dde36_changedline_L000446_450 ' GEI4
 mov r15, #0 ' reg <- coni
 mov r17, r21 ' CVI, CVU or LOAD
C_slj021_696dde36_changedline_L000446_452
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
 long @C_slj021_696dde36_changedline_L000446_456 ' NEI4
 jmp #JMPA
 long @C_slj021_696dde36_changedline_L000446_454 ' JUMPV addrg
C_slj021_696dde36_changedline_L000446_456
 adds r15, r13 ' ADDI/P (1)
 cmps r17, r19 wz
 jmp #BRNZ
 long @C_slj021_696dde36_changedline_L000446_452 ' NEI4
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_slj021_696dde36_changedline_L000446_461 ' EQI4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_slj021_696dde36_changedline_L000446_462 ' JUMPV addrg
C_slj021_696dde36_changedline_L000446_461
 mov r11, #0 ' reg <- coni
C_slj021_696dde36_changedline_L000446_462
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slj021_696dde36_changedline_L000446_447 ' JUMPV addrg
C_slj021_696dde36_changedline_L000446_454
C_slj021_696dde36_changedline_L000446_450
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
 long @C_slj021_696dde36_changedline_L000446_464 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_slj021_696dde36_changedline_L000446_465 ' JUMPV addrg
C_slj021_696dde36_changedline_L000446_464
 mov r17, #0 ' reg <- coni
C_slj021_696dde36_changedline_L000446_465
 mov r0, r17 ' CVI, CVU or LOAD
C_slj021_696dde36_changedline_L000446_447
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaG_tracecall

 alignl ' align long
C_luaG__tracecall ' <symbol:luaG_tracecall>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov RI, r21
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
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaG__tracecall_467 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__tracecall_469 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaG__tracecall_466 ' JUMPV addrg
C_luaG__tracecall_469
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__tracecall_471 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__hookcall
 add SP, #4 ' CALL addrg
C_luaG__tracecall_471
C_luaG__tracecall_467
 mov r0, #1 ' reg <- coni
C_luaG__tracecall_466
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
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
 long @C_luaG__traceexec_474 ' NEI4
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaG__traceexec_473 ' JUMPV addrg
C_luaG__traceexec_474
 adds r21, #4 ' ADDP4 coni
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_477 ' EQI4
 mov r22, r23
 adds r22, #108 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 cmps r20,  #0 wz
 jmp #BRNZ
 long @C_luaG__traceexec_477 ' NEI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaG__traceexec_478 ' JUMPV addrg
C_luaG__traceexec_477
 mov r13, #0 ' reg <- coni
C_luaG__traceexec_478
 mov r15, r13 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_479 ' EQI4
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
 long @C_luaG__traceexec_480 ' JUMPV addrg
C_luaG__traceexec_479
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaG__traceexec_481 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaG__traceexec_473 ' JUMPV addrg
C_luaG__traceexec_481
C_luaG__traceexec_480
 mov r22, r19
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_483 ' EQI4
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
 long @C_luaG__traceexec_473 ' JUMPV addrg
C_luaG__traceexec_483
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
 long @C_luaG__traceexec_487 ' EQI4
 mov RI, r20
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #255 ' BANDU4 coni
 cmps r22, r18 wz
 jmp #BR_Z
 long @C_luaG__traceexec_485 ' EQI4
C_luaG__traceexec_487
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
C_luaG__traceexec_485
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_488 ' EQI4
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
C_luaG__traceexec_488
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_490 ' EQI4
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
 long @C_luaG__traceexec_493 ' GEI4
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r11, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaG__traceexec_494 ' JUMPV addrg
C_luaG__traceexec_493
 mov r11, #0 ' reg <- coni
C_luaG__traceexec_494
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
 long @C_luaG__traceexec_497 ' LEI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slj021_696dde36_changedline_L000446
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_495 ' EQI4
C_luaG__traceexec_497
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
C_luaG__traceexec_495
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_luaG__traceexec_490
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_luaG__traceexec_498 ' NEI4
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaG__traceexec_500 ' EQI4
 mov r22, r23
 adds r22, #108 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_luaG__traceexec_500
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
C_luaG__traceexec_498
 mov r0, #1 ' reg <- coni
C_luaG__traceexec_473
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

' Catalina Import luaD_hookcall

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
C_luaG__addinfo_435_L000436 ' <symbol:435>
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
C_luaG__ordererror_426_L000427 ' <symbol:426>
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
C_luaG__ordererror_424_L000425 ' <symbol:424>
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
C_luaG__tointerror_419_L000420 ' <symbol:419>
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
C_luaG__concaterror_411_L000412 ' <symbol:411>
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
C_luaG__forerror_405_L000406 ' <symbol:405>
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
C_luaG__callerror_402_L000403 ' <symbol:402>
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_slj01o_696dde36_typeerror_L000393_395_L000396 ' <symbol:395>
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
C_slj01l_696dde36_formatvarinfo_L000379_383_L000384 ' <symbol:383>
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
C_slj0_696dde36_funcnamefromcall_L000023_359_L000360 ' <symbol:359>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_slj0_696dde36_funcnamefromcall_L000023_355_L000356 ' <symbol:355>
 byte 104
 byte 111
 byte 111
 byte 107
 byte 0

 alignl ' align long
C_slj01a_696dde36_funcnamefromcode_L000321_350_L000351 ' <symbol:350>
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
C_slj01a_696dde36_funcnamefromcode_L000321_328_L000329 ' <symbol:328>
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
C_slj015_696dde36_getobjname_L000299_315_L000316 ' <symbol:315>
 byte 109
 byte 101
 byte 116
 byte 104
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_slj015_696dde36_getobjname_L000299_311_L000312 ' <symbol:311>
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
C_slj011_696dde36_isE_nv_L000284_294_L000295 ' <symbol:294>
 byte 102
 byte 105
 byte 101
 byte 108
 byte 100
 byte 0

 alignl ' align long
C_slj011_696dde36_isE_nv_L000284_292_L000293 ' <symbol:292>
 byte 103
 byte 108
 byte 111
 byte 98
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_slj011_696dde36_isE_nv_L000284_290_L000291 ' <symbol:290>
 byte 95
 byte 69
 byte 78
 byte 86
 byte 0

 alignl ' align long
C_slj0s_696dde36_kname_L000253_257_L000258 ' <symbol:257>
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
C_slj0m_696dde36_auxgetinfo_L000162_190_L000191 ' <symbol:190>
 byte 0

 alignl ' align long
C_slj0d_696dde36_funcinfo_L000117_135_L000136 ' <symbol:135>
 byte 76
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_slj0d_696dde36_funcinfo_L000117_133_L000134 ' <symbol:133>
 byte 109
 byte 97
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_slj0d_696dde36_funcinfo_L000117_131_L000132 ' <symbol:131>
 byte 61
 byte 63
 byte 0

 alignl ' align long
C_slj0d_696dde36_funcinfo_L000117_124_L000125 ' <symbol:124>
 byte 67
 byte 0

 alignl ' align long
C_slj0d_696dde36_funcinfo_L000117_122_L000123 ' <symbol:122>
 byte 61
 byte 91
 byte 67
 byte 93
 byte 0

 alignl ' align long
C_luaG__findlocal_100_L000101 ' <symbol:100>
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
C_luaG__findlocal_98_L000099 ' <symbol:98>
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
C_slj09_696dde36_findvararg_L000078_84_L000085 ' <symbol:84>
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
C_slj07_696dde36_upvalname_L000072_76_L000077 ' <symbol:76>
 byte 63
 byte 0

' Catalina Code

DAT ' code segment
' end
