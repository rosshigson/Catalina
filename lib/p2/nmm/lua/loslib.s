' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sre4_686cc54c_os_execute_L000004 ' <symbol:os_execute>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, ##0 ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_system ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sre4_686cc54c_os_execute_L000004_6 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__execresult
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sre4_686cc54c_os_execute_L000004_5 ' JUMPV addrg
C_sre4_686cc54c_os_execute_L000004_6
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sre4_686cc54c_os_execute_L000004_5
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre41_686cc54c_os_remove_L000008 ' <symbol:os_remove>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_remove ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_sre41_686cc54c_os_remove_L000008_11 ' NEI4
 mov r19, #1 ' reg <- coni
 jmp #\@C_sre41_686cc54c_os_remove_L000008_12 ' JUMPV addrg
C_sre41_686cc54c_os_remove_L000008_11
 mov r19, #0 ' reg <- coni
C_sre41_686cc54c_os_remove_L000008_12
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sre41_686cc54c_os_remove_L000008_9 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sre42_686cc54c_os_rename_L000013 ' <symbol:os_rename>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_rename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_sre42_686cc54c_os_rename_L000013_16 ' NEI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_sre42_686cc54c_os_rename_L000013_17 ' JUMPV addrg
C_sre42_686cc54c_os_rename_L000013_16
 mov r21, #0 ' reg <- coni
C_sre42_686cc54c_os_rename_L000013_17
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__fileresult
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sre42_686cc54c_os_rename_L000013_14 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre43_686cc54c_os_tmpname_L000018 ' <symbol:os_tmpname>
 calld PA,#NEWF
 sub SP, #28
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_tmpnam ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sre43_686cc54c_os_tmpname_L000018_23  ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_sre43_686cc54c_os_tmpname_L000018_24 ' JUMPV addrg
C_sre43_686cc54c_os_tmpname_L000018_23
 mov r21, #0 ' reg <- coni
C_sre43_686cc54c_os_tmpname_L000018_24
 mov RI, FP
 sub RI, #-(-32)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sre43_686cc54c_os_tmpname_L000018_25 ' EQI4
 mov r2, ##@C_sre43_686cc54c_os_tmpname_L000018_27_L000028 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sre43_686cc54c_os_tmpname_L000018_19 ' JUMPV addrg
C_sre43_686cc54c_os_tmpname_L000018_25
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sre43_686cc54c_os_tmpname_L000018_19
 calld PA,#POPM ' restore registers
 add SP, #28 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre46_686cc54c_os_getenv_L000029 ' <symbol:os_getenv>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getenv ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sre46_686cc54c_os_getenv_L000029_30 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sre47_686cc54c_os_clock_L000031 ' <symbol:os_clock>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_clock ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_sre47_686cc54c_os_clock_L000031_33_L000034
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r18, r22
 shr r18, #1 ' RSHU4 coni
 mov r0, r18 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 mov r22, ##@C_sre47_686cc54c_os_clock_L000031_35_L000036
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sre47_686cc54c_os_clock_L000031_32 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre4a_686cc54c_setfield_L000037 ' <symbol:setfield>
 calld PA,#NEWF
 calld PA,#PSHM
 long $aa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' ADDI/P
 adds r2, r17 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
' C_sre4a_686cc54c_setfield_L000037_38 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sre4b_686cc54c_setboolfield_L000039 ' <symbol:setboolfield>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wcz
 if_ae jmp #\C_sre4b_686cc54c_setboolfield_L000039_41 ' GEI4
 jmp #\@C_sre4b_686cc54c_setboolfield_L000039_40 ' JUMPV addrg
C_sre4b_686cc54c_setboolfield_L000039_41
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
C_sre4b_686cc54c_setboolfield_L000039_40
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043 ' <symbol:setallfields>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##1900 ' reg ARG con
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_45_L000046 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4a_686cc54c_setfield_L000037
 add SP, #12 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_47_L000048 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4a_686cc54c_setfield_L000037
 add SP, #12 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_49_L000050 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4a_686cc54c_setfield_L000037
 add SP, #12 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_51_L000052 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4a_686cc54c_setfield_L000037
 add SP, #12 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_53_L000054 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4a_686cc54c_setfield_L000037
 add SP, #12 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 rdlong r3, r21 ' reg <- INDIRI4 reg
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_55_L000056 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4a_686cc54c_setfield_L000037
 add SP, #12 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_57_L000058 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4a_686cc54c_setfield_L000037
 add SP, #12 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_59_L000060 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4a_686cc54c_setfield_L000037
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, ##@C_sre4c_686cc54c_setallfields_L000043_61_L000062 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4b_686cc54c_setboolfield_L000039
 add SP, #8 ' CALL addrg
' C_sre4c_686cc54c_setallfields_L000043_44 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sre4m_686cc54c_getboolfield_L000063 ' <symbol:getboolfield>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_sre4m_686cc54c_getboolfield_L000063_66 ' NEI4
 mov r19, ##-1 ' reg <- con
 jmp #\@C_sre4m_686cc54c_getboolfield_L000063_67 ' JUMPV addrg
C_sre4m_686cc54c_getboolfield_L000063_66
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_sre4m_686cc54c_getboolfield_L000063_67
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNI4 addrli reg
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
' C_sre4m_686cc54c_getboolfield_L000063_64 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre4n_686cc54c_getfield_L000068 ' <symbol:getfield>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getfield
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sre4n_686cc54c_getfield_L000068_70 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sre4n_686cc54c_getfield_L000068_72 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sre4n_686cc54c_getfield_L000068_74_L000075 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sre4n_686cc54c_getfield_L000068_69 ' JUMPV addrg
C_sre4n_686cc54c_getfield_L000068_72
 cmps r19,  #0 wcz
 if_ae jmp #\C_sre4n_686cc54c_getfield_L000068_76 ' GEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sre4n_686cc54c_getfield_L000068_78_L000079 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sre4n_686cc54c_getfield_L000068_69 ' JUMPV addrg
C_sre4n_686cc54c_getfield_L000068_76
 mov r15, r19 ' CVI, CVU or LOAD
 jmp #\@C_sre4n_686cc54c_getfield_L000068_71 ' JUMPV addrg
C_sre4n_686cc54c_getfield_L000068_70
 cmps r15,  #0 wcz
 if_b jmp #\C_sre4n_686cc54c_getfield_L000068_85 ' LTI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 mov r18, ##$7fffffff ' reg <- con
 add r20, r18 ' ADDU (1)
 cmp r22, r20 wcz 
 if_a jmp #\C_sre4n_686cc54c_getfield_L000068_87 ' GTU4
 mov r11, #1 ' reg <- coni
 jmp #\@C_sre4n_686cc54c_getfield_L000068_88 ' JUMPV addrg
C_sre4n_686cc54c_getfield_L000068_87
 mov r11, #0 ' reg <- coni
C_sre4n_686cc54c_getfield_L000068_88
 mov r13, r11 ' CVI, CVU or LOAD
 jmp #\@C_sre4n_686cc54c_getfield_L000068_86 ' JUMPV addrg
C_sre4n_686cc54c_getfield_L000068_85
 mov r22, ##-2147483648 ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 cmps r22, r15 wcz
 if_a jmp #\C_sre4n_686cc54c_getfield_L000068_89 ' GTI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_sre4n_686cc54c_getfield_L000068_90 ' JUMPV addrg
C_sre4n_686cc54c_getfield_L000068_89
 mov r9, #0 ' reg <- coni
C_sre4n_686cc54c_getfield_L000068_90
 mov r13, r9 ' CVI, CVU or LOAD
C_sre4n_686cc54c_getfield_L000068_86
 cmps r13,  #0 wz
 if_nz jmp #\C_sre4n_686cc54c_getfield_L000068_80 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sre4n_686cc54c_getfield_L000068_91_L000092 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sre4n_686cc54c_getfield_L000068_69 ' JUMPV addrg
C_sre4n_686cc54c_getfield_L000068_80
 subs r15, r17 ' SUBI/P (1)
C_sre4n_686cc54c_getfield_L000068_71
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, r15 ' CVI, CVU or LOAD
C_sre4n_686cc54c_getfield_L000068_69
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre4r_686cc54c_checkoption_L000093 ' <symbol:checkoption>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, ##@C_sre4r_686cc54c_checkoption_L000093_95_L000096 ' reg <- addrg
 mov r15, #1 ' reg <- coni
 jmp #\@C_sre4r_686cc54c_checkoption_L000093_100 ' JUMPV addrg
C_sre4r_686cc54c_checkoption_L000093_97
 rdbyte r22, r13 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #124 wz
 if_nz jmp #\C_sre4r_686cc54c_checkoption_L000093_101 ' NEI4
 adds r15, #1 ' ADDI4 coni
 jmp #\@C_sre4r_686cc54c_checkoption_L000093_102 ' JUMPV addrg
C_sre4r_686cc54c_checkoption_L000093_101
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sre4r_686cc54c_checkoption_L000093_103 ' NEI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r15 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r15 ' ADDI/P
 adds r0, r21 ' ADDI/P (3)
 jmp #\@C_sre4r_686cc54c_checkoption_L000093_94 ' JUMPV addrg
C_sre4r_686cc54c_checkoption_L000093_103
C_sre4r_686cc54c_checkoption_L000093_102
' C_sre4r_686cc54c_checkoption_L000093_98 ' (symbol refcount = 0)
 adds r13, r15 ' ADDI/P (2)
C_sre4r_686cc54c_checkoption_L000093_100
 rdbyte r22, r13 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sre4r_686cc54c_checkoption_L000093_105 ' EQI4
 cmps r15, r19 wcz
 if_be jmp #\C_sre4r_686cc54c_checkoption_L000093_97 ' LEI4
C_sre4r_686cc54c_checkoption_L000093_105
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sre4r_686cc54c_checkoption_L000093_106_L000107 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
C_sre4r_686cc54c_checkoption_L000093_94
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sre4u_686cc54c_l_checktime_L000108 ' <symbol:l_checktime>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22, r22 wz
 if_z jmp #\C_sre4u_686cc54c_l_checktime_L000108_112 ' EQU4
 mov r2, ##@C_sre4u_686cc54c_l_checktime_L000108_110_L000111 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sre4u_686cc54c_l_checktime_L000108_112
 mov r0, r19 ' CVI, CVU or LOAD
' C_sre4u_686cc54c_l_checktime_L000108_109 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sre410_686cc54c_os_date_L000113 ' <symbol:os_date>
 calld PA,#NEWF
 sub SP, #320
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, ##@C_sre410_686cc54c_os_date_L000113_115_L000116 ' reg ARG ADDRG
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_a jmp #\C_sre410_686cc54c_os_date_L000113_118 ' GTI4
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_time ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #\@C_sre410_686cc54c_os_date_L000113_119 ' JUMPV addrg
C_sre410_686cc54c_os_date_L000113_118
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4u_686cc54c_l_checktime_L000108
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_sre410_686cc54c_os_date_L000113_119
 mov RI, FP
 sub RI, #-(-12)
 wrlong r15, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r19, r22 ' ADDI/P
 adds r19, r21 ' ADDI/P (3)
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #33 wz
 if_nz jmp #\C_sre410_686cc54c_os_date_L000113_120 ' NEI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_gmtime ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 adds r21, #1 ' ADDP4 coni
 jmp #\@C_sre410_686cc54c_os_date_L000113_121 ' JUMPV addrg
C_sre410_686cc54c_os_date_L000113_120
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_localtime ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_sre410_686cc54c_os_date_L000113_121
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sre410_686cc54c_os_date_L000113_122  ' NEU4
 mov r2, ##@C_sre410_686cc54c_os_date_L000113_124_L000125 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sre410_686cc54c_os_date_L000113_114 ' JUMPV addrg
C_sre410_686cc54c_os_date_L000113_122
 mov r2, ##@C_sre410_686cc54c_os_date_L000113_128_L000129 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sre410_686cc54c_os_date_L000113_126 ' NEI4
 mov r2, #9 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4c_686cc54c_setallfields_L000043
 add SP, #4 ' CALL addrg
 jmp #\@C_sre410_686cc54c_os_date_L000113_127 ' JUMPV addrg
C_sre410_686cc54c_os_date_L000113_126
 mov r22, #37 ' reg <- coni
 mov RI, FP
 sub RI, #-(-324)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, FP
 sub r2, #-(-320) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 jmp #\@C_sre410_686cc54c_os_date_L000113_131 ' JUMPV addrg
C_sre410_686cc54c_os_date_L000113_130
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #37 wz
 if_z jmp #\C_sre410_686cc54c_os_date_L000113_133 ' EQI4
 mov r22, FP
 sub r22, #-(-312) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-316) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sre410_686cc54c_os_date_L000113_138 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-320) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sre410_686cc54c_os_date_L000113_138
 mov r22, FP
 sub r22, #-(-312) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-312)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov r18, FP
 sub r18, #-(-320) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r22, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sre410_686cc54c_os_date_L000113_134 ' JUMPV addrg
C_sre410_686cc54c_os_date_L000113_133
 mov r2, #250 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-320) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 adds r21, #1 ' ADDP4 coni
 mov r2, FP
 sub r2, #-(-323) ' reg ARG ADDRLi
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4r_686cc54c_checkoption_L000093
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-324) ' reg ARG ADDRLi
 mov r4, #250 ' reg ARG coni
 mov r5, r11 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strftime
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-312) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r13 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-312)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sre410_686cc54c_os_date_L000113_134
C_sre410_686cc54c_os_date_L000113_131
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_sre410_686cc54c_os_date_L000113_130 ' LTU4
 mov r2, FP
 sub r2, #-(-320) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
C_sre410_686cc54c_os_date_L000113_127
 mov r0, #1 ' reg <- coni
C_sre410_686cc54c_os_date_L000113_114
 calld PA,#POPM ' restore registers
 add SP, #320 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre414_686cc54c_os_time_L000141 ' <symbol:os_time>
 calld PA,#NEWF
 sub SP, #36
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
 cmps r0,  #0 wcz
 if_a jmp #\C_sre414_686cc54c_os_time_L000141_143 ' GTI4
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_time ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_sre414_686cc54c_os_time_L000141_144 ' JUMPV addrg
C_sre414_686cc54c_os_time_L000141_143
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##1900 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_45_L000046 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4n_686cc54c_getfield_L000068
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_47_L000048 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4n_686cc54c_getfield_L000068
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_49_L000050 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4n_686cc54c_getfield_L000068
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, #12 ' reg ARG coni
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_51_L000052 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4n_686cc54c_getfield_L000068
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_53_L000054 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4n_686cc54c_getfield_L000068
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_sre4c_686cc54c_setallfields_L000043_55_L000056 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4n_686cc54c_getfield_L000068
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##@C_sre4c_686cc54c_setallfields_L000043_61_L000062 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4m_686cc54c_getboolfield_L000063
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_mktime ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4c_686cc54c_setallfields_L000043
 add SP, #4 ' CALL addrg
C_sre414_686cc54c_os_time_L000141_144
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r21, r22 wz
 if_nz jmp #\C_sre414_686cc54c_os_time_L000141_153  ' NEU4
 mov r22, ##$ffffffff ' reg <- con
 cmp r21, r22 wz
 if_nz jmp #\C_sre414_686cc54c_os_time_L000141_151  ' NEU4
C_sre414_686cc54c_os_time_L000141_153
 mov r2, ##@C_sre414_686cc54c_os_time_L000141_154_L000155 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sre414_686cc54c_os_time_L000141_142 ' JUMPV addrg
C_sre414_686cc54c_os_time_L000141_151
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sre414_686cc54c_os_time_L000141_142
 calld PA,#POPM ' restore registers
 add SP, #36 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre416_686cc54c_os_difftime_L000156 ' <symbol:os_difftime>
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
 long @C_sre4u_686cc54c_l_checktime_L000108
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sre4u_686cc54c_l_checktime_L000108
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_difftime
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
' C_sre416_686cc54c_os_difftime_L000156_157 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158_cat_L000161 ' <symbol:cat>
 long 1
 long 2
 long 3
 long 4
 long 5
 long 6

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158_catnames_L000163 ' <symbol:catnames>
 long @C_sre417_686cc54c_os_setlocale_L000158_164_L000165
 long @C_sre417_686cc54c_os_setlocale_L000158_166_L000167
 long @C_sre417_686cc54c_os_setlocale_L000158_168_L000169
 long @C_sre417_686cc54c_os_setlocale_L000158_170_L000171
 long @C_sre417_686cc54c_os_setlocale_L000158_172_L000173
 long @C_sre417_686cc54c_os_setlocale_L000158_174_L000175
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158 ' <symbol:os_setlocale>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, ##0 ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##@C_sre417_686cc54c_os_setlocale_L000158_catnames_L000163 ' reg ARG ADDRG
 mov r3, ##@C_sre417_686cc54c_os_setlocale_L000158_164_L000165 ' reg ARG ADDRG
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkoption
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sre417_686cc54c_os_setlocale_L000158_cat_L000161 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_setlocale
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sre417_686cc54c_os_setlocale_L000158_159 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sre41g_686cc54c_os_exit_L000176 ' <symbol:os_exit>
 calld PA,#NEWF
 sub SP, #4
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
 cmps r0,  #1 wz
 if_nz jmp #\C_sre41g_686cc54c_os_exit_L000176_178 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sre41g_686cc54c_os_exit_L000176_181 ' EQI4
 mov r21, #0 ' reg <- coni
 jmp #\@C_sre41g_686cc54c_os_exit_L000176_182 ' JUMPV addrg
C_sre41g_686cc54c_os_exit_L000176_181
 mov r21, #1 ' reg <- coni
C_sre41g_686cc54c_os_exit_L000176_182
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNI4 addrli reg
 jmp #\@C_sre41g_686cc54c_os_exit_L000176_179 ' JUMPV addrg
C_sre41g_686cc54c_os_exit_L000176_178
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_sre41g_686cc54c_os_exit_L000176_179
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sre41g_686cc54c_os_exit_L000176_183 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_close ' CALL addrg
C_sre41g_686cc54c_os_exit_L000176_183
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sre41g_686cc54c_os_exit_L000176_185 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_exit ' CALL addrg
C_sre41g_686cc54c_os_exit_L000176_185
 mov r0, #0 ' reg <- coni
' C_sre41g_686cc54c_os_exit_L000176_177 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sre41h_686cc54c_syslib_L000187 ' <symbol:syslib>
 long @C_sre41i_686cc54c_188_L000189
 long @C_sre47_686cc54c_os_clock_L000031
 long @C_sre41j_686cc54c_190_L000191
 long @C_sre410_686cc54c_os_date_L000113
 long @C_sre41k_686cc54c_192_L000193
 long @C_sre416_686cc54c_os_difftime_L000156
 long @C_sre41l_686cc54c_194_L000195
 long @C_sre4_686cc54c_os_execute_L000004
 long @C_sre41m_686cc54c_196_L000197
 long @C_sre41g_686cc54c_os_exit_L000176
 long @C_sre41n_686cc54c_198_L000199
 long @C_sre46_686cc54c_os_getenv_L000029
 long @C_sre41o_686cc54c_200_L000201
 long @C_sre41_686cc54c_os_remove_L000008
 long @C_sre41p_686cc54c_202_L000203
 long @C_sre42_686cc54c_os_rename_L000013
 long @C_sre41q_686cc54c_204_L000205
 long @C_sre417_686cc54c_os_setlocale_L000158
 long @C_sre417_686cc54c_os_setlocale_L000158_174_L000175
 long @C_sre414_686cc54c_os_time_L000141
 long @C_sre41r_686cc54c_206_L000207
 long @C_sre43_686cc54c_os_tmpname_L000018
 long $0
 long $0

' Catalina Export luaopen_os

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_os ' <symbol:luaopen_os>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_os_209_L000210
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_sre41h_686cc54c_syslib_L000187 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_os_208 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import luaL_pushresult

' Catalina Import luaL_prepbuffsize

' Catalina Import luaL_buffinit

' Catalina Import luaL_setfuncs

' Catalina Import luaL_execresult

' Catalina Import luaL_fileresult

' Catalina Import luaL_checkoption

' Catalina Import luaL_error

' Catalina Import luaL_checktype

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_argerror

' Catalina Import luaL_checkversion_

' Catalina Import tmpnam

' Catalina Import rename

' Catalina Import remove

' Catalina Import lua_setfield

' Catalina Import lua_createtable

' Catalina Import lua_getfield

' Catalina Import lua_pushboolean

' Catalina Import lua_pushfstring

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnumber

' Catalina Import lua_toboolean

' Catalina Import lua_tointegerx

' Catalina Import lua_type

' Catalina Import lua_settop

' Catalina Import lua_close

' Catalina Import strftime

' Catalina Import localtime

' Catalina Import gmtime

' Catalina Import time

' Catalina Import mktime

' Catalina Import difftime

' Catalina Import clock

' Catalina Import strcmp

' Catalina Import memcmp

' Catalina Import memcpy

' Catalina Import system

' Catalina Import getenv

' Catalina Import exit

' Catalina Import setlocale

' Catalina Import errno

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_os_209_L000210 ' <symbol:209>
 long $43fc0000 ' float

 alignl ' align long
C_sre41r_686cc54c_206_L000207 ' <symbol:206>
 byte 116
 byte 109
 byte 112
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_sre41q_686cc54c_204_L000205 ' <symbol:204>
 byte 115
 byte 101
 byte 116
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sre41p_686cc54c_202_L000203 ' <symbol:202>
 byte 114
 byte 101
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_sre41o_686cc54c_200_L000201 ' <symbol:200>
 byte 114
 byte 101
 byte 109
 byte 111
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_sre41n_686cc54c_198_L000199 ' <symbol:198>
 byte 103
 byte 101
 byte 116
 byte 101
 byte 110
 byte 118
 byte 0

 alignl ' align long
C_sre41m_686cc54c_196_L000197 ' <symbol:196>
 byte 101
 byte 120
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_sre41l_686cc54c_194_L000195 ' <symbol:194>
 byte 101
 byte 120
 byte 101
 byte 99
 byte 117
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_sre41k_686cc54c_192_L000193 ' <symbol:192>
 byte 100
 byte 105
 byte 102
 byte 102
 byte 116
 byte 105
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_sre41j_686cc54c_190_L000191 ' <symbol:190>
 byte 100
 byte 97
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_sre41i_686cc54c_188_L000189 ' <symbol:188>
 byte 99
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158_174_L000175 ' <symbol:174>
 byte 116
 byte 105
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158_172_L000173 ' <symbol:172>
 byte 110
 byte 117
 byte 109
 byte 101
 byte 114
 byte 105
 byte 99
 byte 0

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158_170_L000171 ' <symbol:170>
 byte 109
 byte 111
 byte 110
 byte 101
 byte 116
 byte 97
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158_168_L000169 ' <symbol:168>
 byte 99
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158_166_L000167 ' <symbol:166>
 byte 99
 byte 111
 byte 108
 byte 108
 byte 97
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_sre417_686cc54c_os_setlocale_L000158_164_L000165 ' <symbol:164>
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_sre414_686cc54c_os_time_L000141_154_L000155 ' <symbol:154>
 byte 116
 byte 105
 byte 109
 byte 101
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 108
 byte 116
 byte 32
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 98
 byte 101
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
 byte 101
 byte 100
 byte 32
 byte 105
 byte 110
 byte 32
 byte 116
 byte 104
 byte 105
 byte 115
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
C_sre410_686cc54c_os_date_L000113_128_L000129 ' <symbol:128>
 byte 42
 byte 116
 byte 0

 alignl ' align long
C_sre410_686cc54c_os_date_L000113_124_L000125 ' <symbol:124>
 byte 100
 byte 97
 byte 116
 byte 101
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 108
 byte 116
 byte 32
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 98
 byte 101
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
 byte 101
 byte 100
 byte 32
 byte 105
 byte 110
 byte 32
 byte 116
 byte 104
 byte 105
 byte 115
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
C_sre410_686cc54c_os_date_L000113_115_L000116 ' <symbol:115>
 byte 37
 byte 99
 byte 0

 alignl ' align long
C_sre4u_686cc54c_l_checktime_L000108_110_L000111 ' <symbol:110>
 byte 116
 byte 105
 byte 109
 byte 101
 byte 32
 byte 111
 byte 117
 byte 116
 byte 45
 byte 111
 byte 102
 byte 45
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 115
 byte 0

 alignl ' align long
C_sre4r_686cc54c_checkoption_L000093_106_L000107 ' <symbol:106>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 99
 byte 111
 byte 110
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 32
 byte 115
 byte 112
 byte 101
 byte 99
 byte 105
 byte 102
 byte 105
 byte 101
 byte 114
 byte 32
 byte 39
 byte 37
 byte 37
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_sre4r_686cc54c_checkoption_L000093_95_L000096 ' <symbol:95>
 byte 97
 byte 65
 byte 98
 byte 66
 byte 99
 byte 100
 byte 72
 byte 73
 byte 106
 byte 109
 byte 77
 byte 112
 byte 83
 byte 85
 byte 119
 byte 87
 byte 120
 byte 88
 byte 121
 byte 89
 byte 90
 byte 37
 byte 0

 alignl ' align long
C_sre4n_686cc54c_getfield_L000068_91_L000092 ' <symbol:91>
 byte 102
 byte 105
 byte 101
 byte 108
 byte 100
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 105
 byte 115
 byte 32
 byte 111
 byte 117
 byte 116
 byte 45
 byte 111
 byte 102
 byte 45
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_sre4n_686cc54c_getfield_L000068_78_L000079 ' <symbol:78>
 byte 102
 byte 105
 byte 101
 byte 108
 byte 100
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 109
 byte 105
 byte 115
 byte 115
 byte 105
 byte 110
 byte 103
 byte 32
 byte 105
 byte 110
 byte 32
 byte 100
 byte 97
 byte 116
 byte 101
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sre4n_686cc54c_getfield_L000068_74_L000075 ' <symbol:74>
 byte 102
 byte 105
 byte 101
 byte 108
 byte 100
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
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
C_sre4c_686cc54c_setallfields_L000043_61_L000062 ' <symbol:61>
 byte 105
 byte 115
 byte 100
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043_59_L000060 ' <symbol:59>
 byte 119
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043_57_L000058 ' <symbol:57>
 byte 121
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043_55_L000056 ' <symbol:55>
 byte 115
 byte 101
 byte 99
 byte 0

 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043_53_L000054 ' <symbol:53>
 byte 109
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043_51_L000052 ' <symbol:51>
 byte 104
 byte 111
 byte 117
 byte 114
 byte 0

 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043_49_L000050 ' <symbol:49>
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043_47_L000048 ' <symbol:47>
 byte 109
 byte 111
 byte 110
 byte 116
 byte 104
 byte 0

 alignl ' align long
C_sre4c_686cc54c_setallfields_L000043_45_L000046 ' <symbol:45>
 byte 121
 byte 101
 byte 97
 byte 114
 byte 0

 alignl ' align long
C_sre47_686cc54c_os_clock_L000031_35_L000036 ' <symbol:35>
 long $447a0000 ' float

 alignl ' align long
C_sre47_686cc54c_os_clock_L000031_33_L000034 ' <symbol:33>
 long $40000000 ' float

 alignl ' align long
C_sre43_686cc54c_os_tmpname_L000018_27_L000028 ' <symbol:27>
 byte 117
 byte 110
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 116
 byte 111
 byte 32
 byte 103
 byte 101
 byte 110
 byte 101
 byte 114
 byte 97
 byte 116
 byte 101
 byte 32
 byte 97
 byte 32
 byte 117
 byte 110
 byte 105
 byte 113
 byte 117
 byte 101
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_sre43_686cc54c_os_tmpname_L000018_20_L000021 ' <symbol:20>
 byte 47
 byte 116
 byte 109
 byte 112
 byte 47
 byte 0

' Catalina Code

DAT ' code segment
' end
