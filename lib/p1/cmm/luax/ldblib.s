' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sg10_686cc42f_H_O_O_K_K_E_Y__L000004 ' <symbol:HOOKKEY>
 long @C_sg101_686cc42f_5_L000006

' Catalina Code

DAT ' code segment

 alignl_label
C_sg102_686cc42f_checkstack_L000007 ' <symbol:checkstack>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg102_686cc42f_checkstack_L000007_9)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg102_686cc42f_checkstack_L000007_9)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg102_686cc42f_checkstack_L000007_11_L000012 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sg102_686cc42f_checkstack_L000007_9
' C_sg102_686cc42f_checkstack_L000007_8 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg104_686cc42f_db_getregistry_L000013 ' <symbol:db_getregistry>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long -1001000 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sg104_686cc42f_db_getregistry_L000013_14 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg105_686cc42f_db_getmetatable_L000015 ' <symbol:db_getmetatable>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_getmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg105_686cc42f_db_getmetatable_L000015_17)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl_label
C_sg105_686cc42f_db_getmetatable_L000015_17
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sg105_686cc42f_db_getmetatable_L000015_16 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg106_686cc42f_db_setmetatable_L000019 ' <symbol:db_setmetatable>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg106_686cc42f_db_setmetatable_L000019_23)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg106_686cc42f_db_setmetatable_L000019_23)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg106_686cc42f_db_setmetatable_L000019_21_L000022 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__typeerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg106_686cc42f_db_setmetatable_L000019_23
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_setmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sg106_686cc42f_db_setmetatable_L000019_20 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg108_686cc42f_db_getuservalue_L000024 ' <symbol:db_getuservalue>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (7)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg108_686cc42f_db_getuservalue_L000024_26)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sg108_686cc42f_db_getuservalue_L000024_27)<<S32 ' JUMPV addrg
 alignl_label
C_sg108_686cc42f_db_getuservalue_L000024_26
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getiuservalue)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg108_686cc42f_db_getuservalue_L000024_28)<<S32 ' EQI4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sg108_686cc42f_db_getuservalue_L000024_25)<<S32 ' JUMPV addrg
 alignl_label
C_sg108_686cc42f_db_getuservalue_L000024_28
 alignl_label
C_sg108_686cc42f_db_getuservalue_L000024_27
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sg108_686cc42f_db_getuservalue_L000024_25
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg109_686cc42f_db_setuservalue_L000030 ' <symbol:db_setuservalue>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (7)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setiuservalue)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg109_686cc42f_db_setuservalue_L000030_32)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl_label
C_sg109_686cc42f_db_setuservalue_L000030_32
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sg109_686cc42f_db_setuservalue_L000030_31 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg10a_686cc42f_getthread_L000034 ' <symbol:getthread>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg10a_686cc42f_getthread_L000034_36)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_tothread)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sg10a_686cc42f_getthread_L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sg10a_686cc42f_getthread_L000034_36
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sg10a_686cc42f_getthread_L000034_35
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg10b_686cc42f_settabss_L000038 ' <symbol:settabss>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_sg10b_686cc42f_settabss_L000038_39 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg10c_686cc42f_settabsi_L000040 ' <symbol:settabsi>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_sg10c_686cc42f_settabsi_L000040_41 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg10d_686cc42f_settabsb_L000042 ' <symbol:settabsb>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_sg10d_686cc42f_settabsb_L000042_43 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg10e_686cc42f_treatstackoption_L000044 ' <symbol:treatstackoption>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg10e_686cc42f_treatstackoption_L000044_46)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sg10e_686cc42f_treatstackoption_L000044_47)<<S32 ' JUMPV addrg
 alignl_label
C_sg10e_686cc42f_treatstackoption_L000044_46
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_xmove)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10e_686cc42f_treatstackoption_L000044_47
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_sg10e_686cc42f_treatstackoption_L000044_45 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048 ' <symbol:db_getinfo>
 alignl_p1
 long I32_NEWF + 112<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg10a_686cc42f_getthread_L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_50_L000051 ' reg ARG ADDRG
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (2)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg102_686cc42f_checkstack_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (62)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg10f_686cc42f_db_getinfo_L000048_54)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_52_L000053 ' reg ARG ADDRG
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (2)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_54
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg10f_686cc42f_db_getinfo_L000048_55)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_57_L000058 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_xmove)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sg10f_686cc42f_db_getinfo_L000048_56)<<S32 ' JUMPV addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_55
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg10f_686cc42f_db_getinfo_L000048_59)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sg10f_686cc42f_db_getinfo_L000048_49)<<S32 ' JUMPV addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_59
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_56
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getinfo)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg10f_686cc42f_db_getinfo_L000048_61)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_63_L000064 ' reg ARG ADDRG
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (2)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sg10f_686cc42f_db_getinfo_L000048_49)<<S32 ' JUMPV addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_61
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (83)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg10f_686cc42f_db_getinfo_L000048_65)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-92)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-96)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_pushlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_69_L000070 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_71_L000072 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10b_686cc42f_settabss_L000038)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_74_L000075 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10c_686cc42f_settabsi_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-80)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_77_L000078 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10c_686cc42f_settabsi_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-100)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_80_L000081 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10b_686cc42f_settabss_L000038)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_65
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (108)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg10f_686cc42f_db_getinfo_L000048_83)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-88)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_85_L000086 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10c_686cc42f_settabsi_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_83
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (117)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg10f_686cc42f_db_getinfo_L000048_88)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-76)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_90_L000091 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10c_686cc42f_settabsi_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-75)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_93_L000094 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10c_686cc42f_settabsi_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-74)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_96_L000097 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10d_686cc42f_settabsb_L000042)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_88
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (110)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg10f_686cc42f_db_getinfo_L000048_99)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_101_L000102 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10b_686cc42f_settabss_L000038)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_104_L000105 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10b_686cc42f_settabss_L000038)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_99
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (114)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg10f_686cc42f_db_getinfo_L000048_107)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_RDWORD + (r22)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_109_L000110 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10c_686cc42f_settabsi_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-70)&$1FF)<<S16B
 word I16A_RDWORD + (r22)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_112_L000113 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10c_686cc42f_settabsi_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_107
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (116)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg10f_686cc42f_db_getinfo_L000048_115)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-73)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_117_L000118 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10d_686cc42f_settabsb_L000042)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_115
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (76)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg10f_686cc42f_db_getinfo_L000048_120)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_122_L000123 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10e_686cc42f_treatstackoption_L000044)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_120
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (102)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg10f_686cc42f_db_getinfo_L000048_124)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg10f_686cc42f_db_getinfo_L000048_126_L000127 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg10e_686cc42f_treatstackoption_L000044)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_124
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_49
 word I16B_POPM + 28<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg1014_686cc42f_db_getlocal_L000128 ' <symbol:db_getlocal>
 alignl_p1
 long I32_NEWF + 128<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg10a_686cc42f_getthread_L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (2)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg1014_686cc42f_db_getlocal_L000128_130)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getlocal)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sg1014_686cc42f_db_getlocal_L000128_129)<<S32 ' JUMPV addrg
 alignl_label
C_sg1014_686cc42f_db_getlocal_L000128_130
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODF + ((-132)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg1014_686cc42f_db_getlocal_L000128_132)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg1014_686cc42f_db_getlocal_L000128_134_L000135 ' reg ARG ADDRG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sg1014_686cc42f_db_getlocal_L000128_129)<<S32 ' JUMPV addrg
 alignl_label
C_sg1014_686cc42f_db_getlocal_L000128_132
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg102_686cc42f_checkstack_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 alignl_p1
 long I32_LODF + ((-132)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getlocal)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg1014_686cc42f_db_getlocal_L000128_136)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_xmove)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sg1014_686cc42f_db_getlocal_L000128_129)<<S32 ' JUMPV addrg
 alignl_label
C_sg1014_686cc42f_db_getlocal_L000128_136
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sg1014_686cc42f_db_getlocal_L000128_129
 word I16B_POPM + 32<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg1016_686cc42f_db_setlocal_L000138 ' <symbol:db_setlocal>
 alignl_p1
 long I32_NEWF + 120<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg10a_686cc42f_getthread_L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (2)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg1016_686cc42f_db_setlocal_L000138_140)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg1014_686cc42f_db_getlocal_L000128_134_L000135 ' reg ARG ADDRG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sg1016_686cc42f_db_setlocal_L000138_139)<<S32 ' JUMPV addrg
 alignl_label
C_sg1016_686cc42f_db_setlocal_L000138_140
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (3)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (3)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg102_686cc42f_checkstack_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_xmove)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-116)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setlocal)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg1016_686cc42f_db_setlocal_L000138_142)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sg1016_686cc42f_db_setlocal_L000138_142
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sg1016_686cc42f_db_setlocal_L000138_139
 word I16B_POPM + 30<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg1017_686cc42f_auxupvalue_L000144 ' <symbol:auxupvalue>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg1017_686cc42f_auxupvalue_L000144_147)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getupvalue)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sg1017_686cc42f_auxupvalue_L000144_148)<<S32 ' JUMPV addrg
 alignl_label
C_sg1017_686cc42f_auxupvalue_L000144_147
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setupvalue)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sg1017_686cc42f_auxupvalue_L000144_148
 word I16A_MOV + (r19)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg1017_686cc42f_auxupvalue_L000144_149)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sg1017_686cc42f_auxupvalue_L000144_145)<<S32 ' JUMPV addrg
 alignl_label
C_sg1017_686cc42f_auxupvalue_L000144_149
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_NEG + (r3)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sg1017_686cc42f_auxupvalue_L000144_145
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg1018_686cc42f_db_getupvalue_L000151 ' <symbol:db_getupvalue>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg1017_686cc42f_auxupvalue_L000144)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sg1018_686cc42f_db_getupvalue_L000151_152 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg1019_686cc42f_db_setupvalue_L000153 ' <symbol:db_setupvalue>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg1017_686cc42f_auxupvalue_L000144)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sg1019_686cc42f_db_setupvalue_L000153_154 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg101a_686cc42f_checkupval_L000155 ' <symbol:checkupval>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_upvalueid)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101a_686cc42f_checkupval_L000155_157)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg101a_686cc42f_checkupval_L000155_161)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg101a_686cc42f_checkupval_L000155_159_L000160 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg101a_686cc42f_checkupval_L000155_161
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl_label
C_sg101a_686cc42f_checkupval_L000155_157
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
' C_sg101a_686cc42f_checkupval_L000155_156 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg101c_686cc42f_db_upvalueid_L000162 ' <symbol:db_upvalueid>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sg101a_686cc42f_checkupval_L000155)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101c_686cc42f_db_upvalueid_L000162_164)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushlightuserdata)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sg101c_686cc42f_db_upvalueid_L000162_165)<<S32 ' JUMPV addrg
 alignl_label
C_sg101c_686cc42f_db_upvalueid_L000162_164
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl_label
C_sg101c_686cc42f_db_upvalueid_L000162_165
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sg101c_686cc42f_db_upvalueid_L000162_163 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg101d_686cc42f_db_upvaluejoin_L000166 ' <symbol:db_upvaluejoin>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sg101a_686cc42f_checkupval_L000155)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOVI + (r4)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sg101a_686cc42f_checkupval_L000155)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_iscfunction)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101d_686cc42f_db_upvaluejoin_L000166_170)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg101d_686cc42f_db_upvaluejoin_L000166_168_L000169 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg101d_686cc42f_db_upvaluejoin_L000166_170
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_iscfunction)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101d_686cc42f_db_upvaluejoin_L000166_171)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg101d_686cc42f_db_upvaluejoin_L000166_168_L000169 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sg101d_686cc42f_db_upvaluejoin_L000166_171
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + (r5)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_upvaluejoin)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sg101d_686cc42f_db_upvaluejoin_L000166_167 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sg101f_686cc42f_hookf_L000172_hooknames_L000175 ' <symbol:hooknames>
 long @C_sg101f_686cc42f_hookf_L000172_176_L000177
 long @C_sg101f_686cc42f_hookf_L000172_178_L000179
 long @C_sg101f_686cc42f_hookf_L000172_180_L000181
 long @C_sg101f_686cc42f_hookf_L000172_182_L000183
 long @C_sg101f_686cc42f_hookf_L000172_184_L000185

' Catalina Code

DAT ' code segment

 alignl_label
C_sg101f_686cc42f_hookf_L000172 ' <symbol:hookf>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_sg10_686cc42f_H_O_O_K_K_E_Y__L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushthread)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_rawget)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg101f_686cc42f_hookf_L000172_186)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sg101f_686cc42f_hookf_L000172_hooknames_L000175 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sg101f_686cc42f_hookf_L000172_188)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sg101f_686cc42f_hookf_L000172_189)<<S32 ' JUMPV addrg
 alignl_label
C_sg101f_686cc42f_hookf_L000172_188
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl_label
C_sg101f_686cc42f_hookf_L000172_189
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r5)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_callk)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_label
C_sg101f_686cc42f_hookf_L000172_186
' C_sg101f_686cc42f_hookf_L000172_173 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg101m_686cc42f_makemask_L000190 ' <symbol:makemask>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (99)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101m_686cc42f_makemask_L000190_192)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r19)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_sg101m_686cc42f_makemask_L000190_192
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (114)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101m_686cc42f_makemask_L000190_194)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r19)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_sg101m_686cc42f_makemask_L000190_194
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (108)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101m_686cc42f_makemask_L000190_196)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_OR + (r19)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_sg101m_686cc42f_makemask_L000190_196
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sg101m_686cc42f_makemask_L000190_198)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_OR + (r19)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_label
C_sg101m_686cc42f_makemask_L000190_198
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_sg101m_686cc42f_makemask_L000190_191 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg101n_686cc42f_unmakemask_L000200 ' <symbol:unmakemask>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r3)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101n_686cc42f_unmakemask_L000200_202)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(99)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sg101n_686cc42f_unmakemask_L000200_202
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r3)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101n_686cc42f_unmakemask_L000200_204)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(114)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sg101n_686cc42f_unmakemask_L000200_204
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r3)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101n_686cc42f_unmakemask_L000200_206)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(108)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sg101n_686cc42f_unmakemask_L000200_206
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
' C_sg101n_686cc42f_unmakemask_L000200_201 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sg101o_686cc42f_db_sethook_L000208 ' <symbol:db_sethook>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg10a_686cc42f_getthread_L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sg101o_686cc42f_db_sethook_L000208_210)<<S32 ' GTI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_sg101o_686cc42f_db_sethook_L000208_211)<<S32 ' JUMPV addrg
 alignl_label
C_sg101o_686cc42f_db_sethook_L000208_210
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (2)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (3)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sg101f_686cc42f_hookf_L000172 ' reg <- addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg101m_686cc42f_makemask_L000190)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_sg101o_686cc42f_db_sethook_L000208_211
 alignl_p1
 long I32_LODI + (@C_sg10_686cc42f_H_O_O_K_K_E_Y__L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__getsubtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg101o_686cc42f_db_sethook_L000208_212)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg101o_686cc42f_db_sethook_L000208_214_L000215 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg101o_686cc42f_db_sethook_L000208_216_L000217 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_setmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sg101o_686cc42f_db_sethook_L000208_212
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg102_686cc42f_checkstack_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushthread)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_xmove)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_rawset)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_lua_sethook)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sg101o_686cc42f_db_sethook_L000208_209 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg101r_686cc42f_db_gethook_L000218 ' <symbol:db_gethook>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg10a_686cc42f_getthread_L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gethookmask)<<S32 ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gethook)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg101r_686cc42f_db_gethook_L000218_220)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sg101r_686cc42f_db_gethook_L000218_219)<<S32 ' JUMPV addrg
 alignl_label
C_sg101r_686cc42f_db_gethook_L000218_220
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sg101f_686cc42f_hookf_L000172 ' reg <- addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101r_686cc42f_db_gethook_L000218_222)<<S32 ' EQU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg101r_686cc42f_db_gethook_L000218_224_L000225 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sg101r_686cc42f_db_gethook_L000218_223)<<S32 ' JUMPV addrg
 alignl_label
C_sg101r_686cc42f_db_gethook_L000218_222
 alignl_p1
 long I32_LODI + (@C_sg10_686cc42f_H_O_O_K_K_E_Y__L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sg102_686cc42f_checkstack_L000007)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushthread)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_xmove)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_rawget)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sg101r_686cc42f_db_gethook_L000218_223
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg101n_686cc42f_unmakemask_L000200)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gethookcount)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl_label
C_sg101r_686cc42f_db_gethook_L000218_219
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg101t_686cc42f_db_debug_L000226 ' <symbol:db_debug>
 alignl_p1
 long I32_NEWF + 252<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_label
C_sg101t_686cc42f_db_debug_L000226_228
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg101t_686cc42f_db_debug_L000226_234_L000235 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg101t_686cc42f_db_debug_L000226_232_L000233 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C___stderr ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_fprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stderr ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stdin ' reg ARG ADDRG
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (250)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODF + ((-256)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_fgets)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101t_686cc42f_db_debug_L000226_240)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sg101t_686cc42f_db_debug_L000226_238_L000239 ' reg ARG ADDRG
 alignl_p1
 long I32_LODF + ((-256)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg101t_686cc42f_db_debug_L000226_236)<<S32 ' NEI4 reg coni
 alignl_label
C_sg101t_686cc42f_db_debug_L000226_240
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sg101t_686cc42f_db_debug_L000226_227)<<S32 ' JUMPV addrg
 alignl_label
C_sg101t_686cc42f_db_debug_L000226_236
 alignl_p1
 long I32_LODF + ((-256)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg101t_686cc42f_db_debug_L000226_243_L000244 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-256)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaL__loadbufferx)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg101t_686cc42f_db_debug_L000226_245)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (0)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_pcallk)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sg101t_686cc42f_db_debug_L000226_241)<<S32 ' EQI4 reg coni
 alignl_label
C_sg101t_686cc42f_db_debug_L000226_245
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg101t_686cc42f_db_debug_L000226_246_L000247 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C___stderr ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_fprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stderr ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 alignl_label
C_sg101t_686cc42f_db_debug_L000226_241
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sg101t_686cc42f_db_debug_L000226_228)<<S32 ' JUMPV addrg
 alignl_label
C_sg101t_686cc42f_db_debug_L000226_227
 word I16B_POPM + 63<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg1023_686cc42f_db_traceback_L000248 ' <symbol:db_traceback>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sg10a_686cc42f_getthread_L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg1023_686cc42f_db_traceback_L000248_250)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sg1023_686cc42f_db_traceback_L000248_250)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sg1023_686cc42f_db_traceback_L000248_251)<<S32 ' JUMPV addrg
 alignl_label
C_sg1023_686cc42f_db_traceback_L000248_250
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sg1023_686cc42f_db_traceback_L000248_253)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sg1023_686cc42f_db_traceback_L000248_254)<<S32 ' JUMPV addrg
 alignl_label
C_sg1023_686cc42f_db_traceback_L000248_253
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sg1023_686cc42f_db_traceback_L000248_254
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (2)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__traceback)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_label
C_sg1023_686cc42f_db_traceback_L000248_251
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sg1023_686cc42f_db_traceback_L000248_249 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sg1024_686cc42f_db_setcstacklimit_L000255 ' <symbol:db_setcstacklimit>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_setcstacklimit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sg1024_686cc42f_db_setcstacklimit_L000255_256 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sg1025_686cc42f_dblib_L000257 ' <symbol:dblib>
 long @C_sg1026_686cc42f_258_L000259
 long @C_sg101t_686cc42f_db_debug_L000226
 long @C_sg1027_686cc42f_260_L000261
 long @C_sg108_686cc42f_db_getuservalue_L000024
 long @C_sg1028_686cc42f_262_L000263
 long @C_sg101r_686cc42f_db_gethook_L000218
 long @C_sg1029_686cc42f_264_L000265
 long @C_sg10f_686cc42f_db_getinfo_L000048
 long @C_sg102a_686cc42f_266_L000267
 long @C_sg1014_686cc42f_db_getlocal_L000128
 long @C_sg102b_686cc42f_268_L000269
 long @C_sg104_686cc42f_db_getregistry_L000013
 long @C_sg102c_686cc42f_270_L000271
 long @C_sg105_686cc42f_db_getmetatable_L000015
 long @C_sg102d_686cc42f_272_L000273
 long @C_sg1018_686cc42f_db_getupvalue_L000151
 long @C_sg102e_686cc42f_274_L000275
 long @C_sg101d_686cc42f_db_upvaluejoin_L000166
 long @C_sg102f_686cc42f_276_L000277
 long @C_sg101c_686cc42f_db_upvalueid_L000162
 long @C_sg102g_686cc42f_278_L000279
 long @C_sg109_686cc42f_db_setuservalue_L000030
 long @C_sg102h_686cc42f_280_L000281
 long @C_sg101o_686cc42f_db_sethook_L000208
 long @C_sg102i_686cc42f_282_L000283
 long @C_sg1016_686cc42f_db_setlocal_L000138
 long @C_sg102j_686cc42f_284_L000285
 long @C_sg106_686cc42f_db_setmetatable_L000019
 long @C_sg102k_686cc42f_286_L000287
 long @C_sg1019_686cc42f_db_setupvalue_L000153
 long @C_sg102l_686cc42f_288_L000289
 long @C_sg1023_686cc42f_db_traceback_L000248
 long @C_sg102m_686cc42f_290_L000291
 long @C_sg1024_686cc42f_db_setcstacklimit_L000255
 long $0
 long $0

' Catalina Export luaopen_debug

' Catalina Code

DAT ' code segment

 alignl_label
C_luaopen_debug ' <symbol:luaopen_debug>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (68)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODI + (@C_luaopen_debug_293_L000294)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checkversion_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (17)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sg1025_686cc42f_dblib_L000257 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__setfuncs)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_luaopen_debug_292 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import luaL_traceback

' Catalina Import luaL_getsubtable

' Catalina Import luaL_setfuncs

' Catalina Import luaL_loadbufferx

' Catalina Import luaL_error

' Catalina Import luaL_checkany

' Catalina Import luaL_checktype

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_typeerror

' Catalina Import luaL_argerror

' Catalina Import luaL_tolstring

' Catalina Import luaL_checkversion_

' Catalina Import lua_setcstacklimit

' Catalina Import lua_gethookcount

' Catalina Import lua_gethookmask

' Catalina Import lua_gethook

' Catalina Import lua_sethook

' Catalina Import lua_upvaluejoin

' Catalina Import lua_upvalueid

' Catalina Import lua_setupvalue

' Catalina Import lua_getupvalue

' Catalina Import lua_setlocal

' Catalina Import lua_getlocal

' Catalina Import lua_getinfo

' Catalina Import lua_getstack

' Catalina Import lua_pcallk

' Catalina Import lua_callk

' Catalina Import lua_setiuservalue

' Catalina Import lua_setmetatable

' Catalina Import lua_rawset

' Catalina Import lua_setfield

' Catalina Import lua_getiuservalue

' Catalina Import lua_getmetatable

' Catalina Import lua_createtable

' Catalina Import lua_rawget

' Catalina Import lua_getfield

' Catalina Import lua_pushthread

' Catalina Import lua_pushlightuserdata

' Catalina Import lua_pushboolean

' Catalina Import lua_pushfstring

' Catalina Import lua_pushstring

' Catalina Import lua_pushlstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnil

' Catalina Import lua_tothread

' Catalina Import lua_tolstring

' Catalina Import lua_type

' Catalina Import lua_iscfunction

' Catalina Import lua_xmove

' Catalina Import lua_checkstack

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import strlen

' Catalina Import strchr

' Catalina Import strcmp

' Catalina Import fgets

' Catalina Import fprintf

' Catalina Import fflush

' Catalina Import __stderr

' Catalina Import __stdin

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaopen_debug_293_L000294 ' <symbol:293>
 long $43fc0000 ' float

 alignl_label
C_sg102m_686cc42f_290_L000291 ' <symbol:290>
 byte 115
 byte 101
 byte 116
 byte 99
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 0

 alignl_label
C_sg102l_686cc42f_288_L000289 ' <symbol:288>
 byte 116
 byte 114
 byte 97
 byte 99
 byte 101
 byte 98
 byte 97
 byte 99
 byte 107
 byte 0

 alignl_label
C_sg102k_686cc42f_286_L000287 ' <symbol:286>
 byte 115
 byte 101
 byte 116
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl_label
C_sg102j_686cc42f_284_L000285 ' <symbol:284>
 byte 115
 byte 101
 byte 116
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl_label
C_sg102i_686cc42f_282_L000283 ' <symbol:282>
 byte 115
 byte 101
 byte 116
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl_label
C_sg102h_686cc42f_280_L000281 ' <symbol:280>
 byte 115
 byte 101
 byte 116
 byte 104
 byte 111
 byte 111
 byte 107
 byte 0

 alignl_label
C_sg102g_686cc42f_278_L000279 ' <symbol:278>
 byte 115
 byte 101
 byte 116
 byte 117
 byte 115
 byte 101
 byte 114
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl_label
C_sg102f_686cc42f_276_L000277 ' <symbol:276>
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 105
 byte 100
 byte 0

 alignl_label
C_sg102e_686cc42f_274_L000275 ' <symbol:274>
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 106
 byte 111
 byte 105
 byte 110
 byte 0

 alignl_label
C_sg102d_686cc42f_272_L000273 ' <symbol:272>
 byte 103
 byte 101
 byte 116
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl_label
C_sg102c_686cc42f_270_L000271 ' <symbol:270>
 byte 103
 byte 101
 byte 116
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl_label
C_sg102b_686cc42f_268_L000269 ' <symbol:268>
 byte 103
 byte 101
 byte 116
 byte 114
 byte 101
 byte 103
 byte 105
 byte 115
 byte 116
 byte 114
 byte 121
 byte 0

 alignl_label
C_sg102a_686cc42f_266_L000267 ' <symbol:266>
 byte 103
 byte 101
 byte 116
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl_label
C_sg1029_686cc42f_264_L000265 ' <symbol:264>
 byte 103
 byte 101
 byte 116
 byte 105
 byte 110
 byte 102
 byte 111
 byte 0

 alignl_label
C_sg1028_686cc42f_262_L000263 ' <symbol:262>
 byte 103
 byte 101
 byte 116
 byte 104
 byte 111
 byte 111
 byte 107
 byte 0

 alignl_label
C_sg1027_686cc42f_260_L000261 ' <symbol:260>
 byte 103
 byte 101
 byte 116
 byte 117
 byte 115
 byte 101
 byte 114
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl_label
C_sg1026_686cc42f_258_L000259 ' <symbol:258>
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 0

 alignl_label
C_sg101t_686cc42f_db_debug_L000226_246_L000247 ' <symbol:246>
 byte 37
 byte 115
 byte 10
 byte 0

 alignl_label
C_sg101t_686cc42f_db_debug_L000226_243_L000244 ' <symbol:243>
 byte 61
 byte 40
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 32
 byte 99
 byte 111
 byte 109
 byte 109
 byte 97
 byte 110
 byte 100
 byte 41
 byte 0

 alignl_label
C_sg101t_686cc42f_db_debug_L000226_238_L000239 ' <symbol:238>
 byte 99
 byte 111
 byte 110
 byte 116
 byte 10
 byte 0

 alignl_label
C_sg101t_686cc42f_db_debug_L000226_234_L000235 ' <symbol:234>
 byte 108
 byte 117
 byte 97
 byte 95
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 62
 byte 32
 byte 0

 alignl_label
C_sg101t_686cc42f_db_debug_L000226_232_L000233 ' <symbol:232>
 byte 37
 byte 115
 byte 0

 alignl_label
C_sg101r_686cc42f_db_gethook_L000218_224_L000225 ' <symbol:224>
 byte 101
 byte 120
 byte 116
 byte 101
 byte 114
 byte 110
 byte 97
 byte 108
 byte 32
 byte 104
 byte 111
 byte 111
 byte 107
 byte 0

 alignl_label
C_sg101o_686cc42f_db_sethook_L000208_216_L000217 ' <symbol:216>
 byte 95
 byte 95
 byte 109
 byte 111
 byte 100
 byte 101
 byte 0

 alignl_label
C_sg101o_686cc42f_db_sethook_L000208_214_L000215 ' <symbol:214>
 byte 107
 byte 0

 alignl_label
C_sg101f_686cc42f_hookf_L000172_184_L000185 ' <symbol:184>
 byte 116
 byte 97
 byte 105
 byte 108
 byte 32
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl_label
C_sg101f_686cc42f_hookf_L000172_182_L000183 ' <symbol:182>
 byte 99
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl_label
C_sg101f_686cc42f_hookf_L000172_180_L000181 ' <symbol:180>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 0

 alignl_label
C_sg101f_686cc42f_hookf_L000172_178_L000179 ' <symbol:178>
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 0

 alignl_label
C_sg101f_686cc42f_hookf_L000172_176_L000177 ' <symbol:176>
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl_label
C_sg101d_686cc42f_db_upvaluejoin_L000166_168_L000169 ' <symbol:168>
 byte 76
 byte 117
 byte 97
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
 byte 101
 byte 120
 byte 112
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 0

 alignl_label
C_sg101a_686cc42f_checkupval_L000155_159_L000160 ' <symbol:159>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl_label
C_sg1014_686cc42f_db_getlocal_L000128_134_L000135 ' <symbol:134>
 byte 108
 byte 101
 byte 118
 byte 101
 byte 108
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 114
 byte 97
 byte 110
 byte 103
 byte 101
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_126_L000127 ' <symbol:126>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_122_L000123 ' <symbol:122>
 byte 97
 byte 99
 byte 116
 byte 105
 byte 118
 byte 101
 byte 108
 byte 105
 byte 110
 byte 101
 byte 115
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_117_L000118 ' <symbol:117>
 byte 105
 byte 115
 byte 116
 byte 97
 byte 105
 byte 108
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_112_L000113 ' <symbol:112>
 byte 110
 byte 116
 byte 114
 byte 97
 byte 110
 byte 115
 byte 102
 byte 101
 byte 114
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_109_L000110 ' <symbol:109>
 byte 102
 byte 116
 byte 114
 byte 97
 byte 110
 byte 115
 byte 102
 byte 101
 byte 114
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_104_L000105 ' <symbol:104>
 byte 110
 byte 97
 byte 109
 byte 101
 byte 119
 byte 104
 byte 97
 byte 116
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_101_L000102 ' <symbol:101>
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_96_L000097 ' <symbol:96>
 byte 105
 byte 115
 byte 118
 byte 97
 byte 114
 byte 97
 byte 114
 byte 103
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_93_L000094 ' <symbol:93>
 byte 110
 byte 112
 byte 97
 byte 114
 byte 97
 byte 109
 byte 115
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_90_L000091 ' <symbol:90>
 byte 110
 byte 117
 byte 112
 byte 115
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_85_L000086 ' <symbol:85>
 byte 99
 byte 117
 byte 114
 byte 114
 byte 101
 byte 110
 byte 116
 byte 108
 byte 105
 byte 110
 byte 101
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_80_L000081 ' <symbol:80>
 byte 119
 byte 104
 byte 97
 byte 116
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_77_L000078 ' <symbol:77>
 byte 108
 byte 97
 byte 115
 byte 116
 byte 108
 byte 105
 byte 110
 byte 101
 byte 100
 byte 101
 byte 102
 byte 105
 byte 110
 byte 101
 byte 100
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_74_L000075 ' <symbol:74>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 100
 byte 101
 byte 102
 byte 105
 byte 110
 byte 101
 byte 100
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_71_L000072 ' <symbol:71>
 byte 115
 byte 104
 byte 111
 byte 114
 byte 116
 byte 95
 byte 115
 byte 114
 byte 99
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_69_L000070 ' <symbol:69>
 byte 115
 byte 111
 byte 117
 byte 114
 byte 99
 byte 101
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_63_L000064 ' <symbol:63>
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
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_57_L000058 ' <symbol:57>
 byte 62
 byte 37
 byte 115
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_52_L000053 ' <symbol:52>
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
 byte 62
 byte 39
 byte 0

 alignl_label
C_sg10f_686cc42f_db_getinfo_L000048_50_L000051 ' <symbol:50>
 byte 102
 byte 108
 byte 110
 byte 83
 byte 114
 byte 116
 byte 117
 byte 0

 alignl_label
C_sg106_686cc42f_db_setmetatable_L000019_21_L000022 ' <symbol:21>
 byte 110
 byte 105
 byte 108
 byte 32
 byte 111
 byte 114
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl_label
C_sg102_686cc42f_checkstack_L000007_11_L000012 ' <symbol:11>
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

 alignl_label
C_sg101_686cc42f_5_L000006 ' <symbol:5>
 byte 95
 byte 72
 byte 79
 byte 79
 byte 75
 byte 75
 byte 69
 byte 89
 byte 0

' Catalina Code

DAT ' code segment
' end
