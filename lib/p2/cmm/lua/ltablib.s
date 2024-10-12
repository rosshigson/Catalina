' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s410_6709f96a_checkfield_L000002 ' <symbol:checkfield>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_NEG + (r2)<<D16A + (r19)<<S16A ' NEGI4
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_rawget)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s410_6709f96a_checkfield_L000002_5)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s410_6709f96a_checkfield_L000002_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410_6709f96a_checkfield_L000002_5
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_s410_6709f96a_checkfield_L000002_6
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_s410_6709f96a_checkfield_L000002_3 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s4101_6709f96a_checktab_L000007 ' <symbol:checktab>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4101_6709f96a_checktab_L000007_9)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4101_6709f96a_checktab_L000007_11)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4101_6709f96a_checktab_L000007_19)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s4101_6709f96a_checktab_L000007_13_L000014 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410_6709f96a_checkfield_L000002)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4101_6709f96a_checktab_L000007_11)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4101_6709f96a_checktab_L000007_19
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4101_6709f96a_checktab_L000007_20)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s4101_6709f96a_checktab_L000007_15_L000016 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410_6709f96a_checkfield_L000002)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4101_6709f96a_checktab_L000007_11)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4101_6709f96a_checktab_L000007_20
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4101_6709f96a_checktab_L000007_21)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s4101_6709f96a_checktab_L000007_17_L000018 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410_6709f96a_checkfield_L000002)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4101_6709f96a_checktab_L000007_11)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4101_6709f96a_checktab_L000007_21
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s4101_6709f96a_checktab_L000007_12)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4101_6709f96a_checktab_L000007_11
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s4101_6709f96a_checktab_L000007_12
 alignl ' align long
C_s4101_6709f96a_checktab_L000007_9
' C_s4101_6709f96a_checktab_L000007_8 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s4105_6709f96a_tinsert_L000022 ' <symbol:tinsert>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (7)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s4101_6709f96a_checktab_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__len)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4105_6709f96a_tinsert_L000022_27)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4105_6709f96a_tinsert_L000022_28)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s4105_6709f96a_tinsert_L000022_24)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_27
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_s4105_6709f96a_tinsert_L000022_25)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_28
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4105_6709f96a_tinsert_L000022_31)<<S32 ' LTU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s4105_6709f96a_tinsert_L000022_29_L000030 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_31
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s4105_6709f96a_tinsert_L000022_35)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_32
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s4105_6709f96a_tinsert_L000022_33 ' (symbol refcount = 0)
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_35
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s4105_6709f96a_tinsert_L000022_32)<<S32 ' GTI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s4105_6709f96a_tinsert_L000022_25)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_24
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s4105_6709f96a_tinsert_L000022_36_L000037 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s4105_6709f96a_tinsert_L000022_23)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_25
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_23
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s4108_6709f96a_tremove_L000038 ' <symbol:tremove>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (7)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s4101_6709f96a_checktab_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__len)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4108_6709f96a_tremove_L000038_40)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4108_6709f96a_tremove_L000038_42)<<S32 ' LEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s4105_6709f96a_tinsert_L000022_29_L000030 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s4108_6709f96a_tremove_L000038_42
 alignl ' align long
C_s4108_6709f96a_tremove_L000038_40
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s4108_6709f96a_tremove_L000038_46)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4108_6709f96a_tremove_L000038_43
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s4108_6709f96a_tremove_L000038_44 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_s4108_6709f96a_tremove_L000038_46
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4108_6709f96a_tremove_L000038_43)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_s4108_6709f96a_tremove_L000038_39 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s4109_6709f96a_tmove_L000047 ' <symbol:tmove>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $eaac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4109_6709f96a_tmove_L000047_50)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (5)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s4109_6709f96a_tmove_L000047_51)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_50
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_51
 word I16A_MOV + (r19)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s4101_6709f96a_checktab_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s4101_6709f96a_checktab_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPS + (r15)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4109_6709f96a_tmove_L000047_52)<<S32 ' LTI4 reg reg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s4109_6709f96a_tmove_L000047_56)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 2147483647 ' reg <- con
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4109_6709f96a_tmove_L000047_56)<<S32 ' LTI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s4109_6709f96a_tmove_L000047_54_L000055 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_56
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 2147483647 ' reg <- con
 word I16A_SUBS + (r22)<<D16A + (r10)<<S16A ' SUBI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4109_6709f96a_tmove_L000047_59)<<S32 ' LEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s4109_6709f96a_tmove_L000047_57_L000058 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_59
 word I16A_CMPS + (r17)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s4109_6709f96a_tmove_L000047_63)<<S32 ' GTI4 reg reg
 word I16A_CMPS + (r17)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4109_6709f96a_tmove_L000047_63)<<S32 ' LEI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_CMPSI + (r19)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4109_6709f96a_tmove_L000047_60)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_compare)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4109_6709f96a_tmove_L000047_60)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_63
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s4109_6709f96a_tmove_L000047_67)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_64
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s4109_6709f96a_tmove_L000047_65 ' (symbol refcount = 0)
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_67
 word I16A_CMPS + (r11)<<D16A + (r10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4109_6709f96a_tmove_L000047_64)<<S32 ' LTI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s4109_6709f96a_tmove_L000047_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_60
 word I16A_MOV + (r11)<<D16A + (r10)<<S16A
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s4109_6709f96a_tmove_L000047_71)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_68
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s4109_6709f96a_tmove_L000047_69 ' (symbol refcount = 0)
 word I16A_SUBSI + (r11)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_71
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s4109_6709f96a_tmove_L000047_68)<<S32 ' GEI4 reg coni
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_61
 alignl ' align long
C_s4109_6709f96a_tmove_L000047_52
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_s4109_6709f96a_tmove_L000047_48 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410c_6709f96a_addfield_L000072 ' <symbol:addfield>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410c_6709f96a_addfield_L000072_74)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s410c_6709f96a_addfield_L000072_76_L000077 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
C_s410c_6709f96a_addfield_L000072_74
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__addvalue)<<S32 ' CALL addrg
' C_s410c_6709f96a_addfield_L000072_73 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410e_6709f96a_tconcat_L000078 ' <symbol:tconcat>
 alignl ' align long
 long I32_NEWF + 276<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s4101_6709f96a_checktab_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__len)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-280)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s410e_6709f96a_tconcat_L000078_80_L000081 ' reg ARG ADDRG
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__buffinit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s410e_6709f96a_tconcat_L000078_85)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410e_6709f96a_tconcat_L000078_82
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410c_6709f96a_addfield_L000072)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-280)&$FFFFFF)<<S32
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__addlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s410e_6709f96a_tconcat_L000078_83 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_s410e_6709f96a_tconcat_L000078_85
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s410e_6709f96a_tconcat_L000078_82)<<S32 ' LTI4 reg reg
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410e_6709f96a_tconcat_L000078_86)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410c_6709f96a_addfield_L000072)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s410e_6709f96a_tconcat_L000078_86
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__pushresult)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_s410e_6709f96a_tconcat_L000078_79 ' (symbol refcount = 0)
 word I16B_POPM + 69<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410g_6709f96a_tpack_L000088 ' <symbol:tpack>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s410g_6709f96a_tpack_L000088_93)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410g_6709f96a_tpack_L000088_90
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s410g_6709f96a_tpack_L000088_91 ' (symbol refcount = 0)
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_s410g_6709f96a_tpack_L000088_93
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s410g_6709f96a_tpack_L000088_90)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s410g_6709f96a_tpack_L000088_94_L000095 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_s410g_6709f96a_tpack_L000088_89 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410i_6709f96a_tunpack_L000096 ' <symbol:tunpack>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s410i_6709f96a_tunpack_L000096_99)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__len)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s410i_6709f96a_tunpack_L000096_100)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410i_6709f96a_tunpack_L000096_99
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s410i_6709f96a_tunpack_L000096_100
 word I16A_MOV + (r19)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s410i_6709f96a_tunpack_L000096_101)<<S32 ' LEI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_s410i_6709f96a_tunpack_L000096_97)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410i_6709f96a_tunpack_L000096_101
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r17)<<D16A + (r20)<<S16A ' SUBU (3)
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $7fffffff ' reg <- con
 word I16A_CMP + (r17)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s410i_6709f96a_tunpack_L000096_105)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410i_6709f96a_tunpack_L000096_111)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s410i_6709f96a_tunpack_L000096_105
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s410i_6709f96a_tunpack_L000096_106_L000107 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s410i_6709f96a_tunpack_L000096_97)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410i_6709f96a_tunpack_L000096_108
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s410i_6709f96a_tunpack_L000096_109 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_s410i_6709f96a_tunpack_L000096_111
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s410i_6709f96a_tunpack_L000096_108)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s410i_6709f96a_tunpack_L000096_97
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410k_6709f96a_l_randomizeP_ivot_L000112 ' <symbol:l_randomizePivot>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C_clock)<<S32 ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_time)<<S32 ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s410k_6709f96a_l_randomizeP_ivot_L000112_118)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410k_6709f96a_l_randomizeP_ivot_L000112_115
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r21)<<D16A + (r22)<<S16A ' ADDU (1)
' C_s410k_6709f96a_l_randomizeP_ivot_L000112_116 ' (symbol refcount = 0)
 word I16A_ADDI + (r23)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
C_s410k_6709f96a_l_randomizeP_ivot_L000112_118
 word I16A_CMPI + (r23)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s410k_6709f96a_l_randomizeP_ivot_L000112_115)<<S32 ' LTU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s410k_6709f96a_l_randomizeP_ivot_L000112_113 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410l_6709f96a_set2_L000119 ' <symbol:set2>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_seti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s410l_6709f96a_set2_L000119_120 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410m_6709f96a_sort_comp_L000121 ' <symbol:sort_comp>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410m_6709f96a_sort_comp_L000121_123)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_compare)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s410m_6709f96a_sort_comp_L000121_122)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410m_6709f96a_sort_comp_L000121_123
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (2)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r5)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_lua_callk)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s410m_6709f96a_sort_comp_L000121_122
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410n_6709f96a_partition_L000125 ' <symbol:partition>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A
 word I16A_SUBI + (r15)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s410n_6709f96a_partition_L000125_132)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410n_6709f96a_partition_L000125_131
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMP + (r17)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410n_6709f96a_partition_L000125_134)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s410n_6709f96a_partition_L000125_136_L000137 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s410n_6709f96a_partition_L000125_134
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s410n_6709f96a_partition_L000125_132
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410m_6709f96a_sort_comp_L000121)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410n_6709f96a_partition_L000125_131)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s410n_6709f96a_partition_L000125_139)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410n_6709f96a_partition_L000125_138
 word I16A_CMP + (r15)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s410n_6709f96a_partition_L000125_141)<<S32 ' GEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s410n_6709f96a_partition_L000125_136_L000137 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s410n_6709f96a_partition_L000125_141
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s410n_6709f96a_partition_L000125_139
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410m_6709f96a_sort_comp_L000121)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410n_6709f96a_partition_L000125_138)<<S32 ' NEI4 reg coni
 word I16A_CMP + (r15)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s410n_6709f96a_partition_L000125_143)<<S32 ' GEU4 reg reg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A
 word I16A_SUBI + (r3)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410l_6709f96a_set2_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s410n_6709f96a_partition_L000125_126)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410n_6709f96a_partition_L000125_143
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410l_6709f96a_set2_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s410n_6709f96a_partition_L000125_132)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410n_6709f96a_partition_L000125_126
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410p_6709f96a_chooseP_ivot_L000145 ' <symbol:choosePivot>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r4)<<S16A ' SUBU (3)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r23)<<D16A + (2)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r23)<<S16A ' ADDU (3)
 word I16A_ADD + (r22)<<D16A + (r1)<<S16A ' ADDU (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
' C_s410p_6709f96a_chooseP_ivot_L000145_146 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410q_6709f96a_auxsort_L000147 ' <symbol:auxsort>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_s410q_6709f96a_auxsort_L000147_150)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_149
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410m_6709f96a_sort_comp_L000121)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s410q_6709f96a_auxsort_L000147_152)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410l_6709f96a_set2_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s410q_6709f96a_auxsort_L000147_153)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_152
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_153
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410q_6709f96a_auxsort_L000147_154)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s410q_6709f96a_auxsort_L000147_148)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_154
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (3)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s410q_6709f96a_auxsort_L000147_158)<<S32 ' LTU4 reg coni
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410q_6709f96a_auxsort_L000147_156)<<S32 ' NEU4 reg coni
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_158
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r19)<<S16A ' ADDU (3)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r15)<<D16A + (1)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s410q_6709f96a_auxsort_L000147_157)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_156
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410p_6709f96a_chooseP_ivot_L000145)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_157
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410m_6709f96a_sort_comp_L000121)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s410q_6709f96a_auxsort_L000147_159)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410l_6709f96a_set2_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s410q_6709f96a_auxsort_L000147_160)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_159
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410m_6709f96a_sort_comp_L000121)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s410q_6709f96a_auxsort_L000147_161)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410l_6709f96a_set2_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s410q_6709f96a_auxsort_L000147_162)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_161
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_162
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_160
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_CMPI + (r22)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s410q_6709f96a_auxsort_L000147_163)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s410q_6709f96a_auxsort_L000147_148)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_163
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_SUBI + (r2)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410l_6709f96a_set2_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s410n_6709f96a_partition_L000125)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r20)<<D16A + (r15)<<S16A ' SUBU (3)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s410q_6709f96a_auxsort_L000147_165)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A
 word I16A_SUBI + (r3)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_s410q_6709f96a_auxsort_L000147)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r15)<<S16A ' SUBU
 word I16A_SUB + (r13)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_MOV + (r21)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r21)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s410q_6709f96a_auxsort_L000147_166)<<S32 ' JUMPV addrg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_165
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r4)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_s410q_6709f96a_auxsort_L000147)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r13)<<D16A + (r15)<<S16A ' SUBU (3)
 word I16A_MOV + (r19)<<D16A + (r15)<<S16A
 word I16A_SUBI + (r19)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_166
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_SHRI + (r22)<<D16A + (7)<<S16A ' SHRU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r13)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s410q_6709f96a_auxsort_L000147_167)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_CALA + (@C_s410k_6709f96a_l_randomizeP_ivot_L000112)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_167
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_150
 word I16A_CMP + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s410q_6709f96a_auxsort_L000147_149)<<S32 ' LTU4 reg reg
 alignl ' align long
C_s410q_6709f96a_auxsort_L000147_148
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s410r_6709f96a_sort_L000169 ' <symbol:sort>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (7)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s4101_6709f96a_checktab_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__len)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s410r_6709f96a_sort_L000169_171)<<S32 ' LEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 2147483647 ' reg <- con
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s410r_6709f96a_sort_L000169_175)<<S32 ' LTI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s410r_6709f96a_sort_L000169_173_L000174 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s410r_6709f96a_sort_L000169_175
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s410r_6709f96a_sort_L000169_176)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s410r_6709f96a_sort_L000169_176
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_s410q_6709f96a_auxsort_L000147)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
C_s410r_6709f96a_sort_L000169_171
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_s410r_6709f96a_sort_L000169_170 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s410t_6709f96a_tab_funcs_L000178 ' <symbol:tab_funcs>
 long @C_s410u_6709f96a_179_L000180
 long @C_s410e_6709f96a_tconcat_L000078
 long @C_s410v_6709f96a_181_L000182
 long @C_s4105_6709f96a_tinsert_L000022
 long @C_s41010_6709f96a_183_L000184
 long @C_s410g_6709f96a_tpack_L000088
 long @C_s41011_6709f96a_185_L000186
 long @C_s410i_6709f96a_tunpack_L000096
 long @C_s41012_6709f96a_187_L000188
 long @C_s4108_6709f96a_tremove_L000038
 long @C_s41013_6709f96a_189_L000190
 long @C_s4109_6709f96a_tmove_L000047
 long @C_s41014_6709f96a_191_L000192
 long @C_s410r_6709f96a_sort_L000169
 long $0
 long $0

' Catalina Export luaopen_table

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_table ' <symbol:luaopen_table>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (68)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_LODI + (@C_luaopen_table_194_L000195)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checkversion_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (7)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s410t_6709f96a_tab_funcs_L000178 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__setfuncs)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_luaopen_table_193 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import time

' Catalina Import clock

' Catalina Import luaL_pushresult

' Catalina Import luaL_addvalue

' Catalina Import luaL_addlstring

' Catalina Import luaL_buffinit

' Catalina Import luaL_setfuncs

' Catalina Import luaL_len

' Catalina Import luaL_error

' Catalina Import luaL_checktype

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_argerror

' Catalina Import luaL_checkversion_

' Catalina Import lua_callk

' Catalina Import lua_seti

' Catalina Import lua_setfield

' Catalina Import lua_getmetatable

' Catalina Import lua_createtable

' Catalina Import lua_rawget

' Catalina Import lua_geti

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnil

' Catalina Import lua_compare

' Catalina Import lua_toboolean

' Catalina Import lua_typename

' Catalina Import lua_type

' Catalina Import lua_isstring

' Catalina Import lua_checkstack

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import memcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_table_194_L000195 ' <symbol:194>
 long $43fc0000 ' float

 alignl ' align long
C_s41014_6709f96a_191_L000192 ' <symbol:191>
 byte 115
 byte 111
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s41013_6709f96a_189_L000190 ' <symbol:189>
 byte 109
 byte 111
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s41012_6709f96a_187_L000188 ' <symbol:187>
 byte 114
 byte 101
 byte 109
 byte 111
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s41011_6709f96a_185_L000186 ' <symbol:185>
 byte 117
 byte 110
 byte 112
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s41010_6709f96a_183_L000184 ' <symbol:183>
 byte 112
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s410v_6709f96a_181_L000182 ' <symbol:181>
 byte 105
 byte 110
 byte 115
 byte 101
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s410u_6709f96a_179_L000180 ' <symbol:179>
 byte 99
 byte 111
 byte 110
 byte 99
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_s410r_6709f96a_sort_L000169_173_L000174 ' <symbol:173>
 byte 97
 byte 114
 byte 114
 byte 97
 byte 121
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 98
 byte 105
 byte 103
 byte 0

 alignl ' align long
C_s410n_6709f96a_partition_L000125_136_L000137 ' <symbol:136>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 111
 byte 114
 byte 100
 byte 101
 byte 114
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 115
 byte 111
 byte 114
 byte 116
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s410i_6709f96a_tunpack_L000096_106_L000107 ' <symbol:106>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 108
 byte 116
 byte 115
 byte 32
 byte 116
 byte 111
 byte 32
 byte 117
 byte 110
 byte 112
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s410g_6709f96a_tpack_L000088_94_L000095 ' <symbol:94>
 byte 110
 byte 0

 alignl ' align long
C_s410e_6709f96a_tconcat_L000078_80_L000081 ' <symbol:80>
 byte 0

 alignl ' align long
C_s410c_6709f96a_addfield_L000072_76_L000077 ' <symbol:76>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 32
 byte 97
 byte 116
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 37
 byte 73
 byte 32
 byte 105
 byte 110
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 39
 byte 99
 byte 111
 byte 110
 byte 99
 byte 97
 byte 116
 byte 39
 byte 0

 alignl ' align long
C_s4109_6709f96a_tmove_L000047_57_L000058 ' <symbol:57>
 byte 100
 byte 101
 byte 115
 byte 116
 byte 105
 byte 110
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 119
 byte 114
 byte 97
 byte 112
 byte 32
 byte 97
 byte 114
 byte 111
 byte 117
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_s4109_6709f96a_tmove_L000047_54_L000055 ' <symbol:54>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 101
 byte 108
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 115
 byte 32
 byte 116
 byte 111
 byte 32
 byte 109
 byte 111
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_36_L000037 ' <symbol:36>
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
 byte 32
 byte 116
 byte 111
 byte 32
 byte 39
 byte 105
 byte 110
 byte 115
 byte 101
 byte 114
 byte 116
 byte 39
 byte 0

 alignl ' align long
C_s4105_6709f96a_tinsert_L000022_29_L000030 ' <symbol:29>
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 115
 byte 0

 alignl ' align long
C_s4101_6709f96a_checktab_L000007_17_L000018 ' <symbol:17>
 byte 95
 byte 95
 byte 108
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_s4101_6709f96a_checktab_L000007_15_L000016 ' <symbol:15>
 byte 95
 byte 95
 byte 110
 byte 101
 byte 119
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_s4101_6709f96a_checktab_L000007_13_L000014 ' <symbol:13>
 byte 95
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

' Catalina Code

DAT ' code segment
' end
