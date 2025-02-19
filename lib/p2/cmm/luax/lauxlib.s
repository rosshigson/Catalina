' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s5sk_67b110dc_findfield_L000004 ' <symbol:findfield>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk_67b110dc_findfield_L000004_8)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk_67b110dc_findfield_L000004_6)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_8
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_s5sk_67b110dc_findfield_L000004_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_6
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk_67b110dc_findfield_L000004_10)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_9
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk_67b110dc_findfield_L000004_12)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawequal)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk_67b110dc_findfield_L000004_14)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_s5sk_67b110dc_findfield_L000004_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_14
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk_67b110dc_findfield_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk_67b110dc_findfield_L000004_16)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk_67b110dc_findfield_L000004_18_L000019 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_copy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_concat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_s5sk_67b110dc_findfield_L000004_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_16
 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_12
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_10
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_next)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk_67b110dc_findfield_L000004_9)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_5
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk2_67b110dc_pushglobalfuncname_L000020 ' <symbol:pushglobalfuncname>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2_67b110dc_pushglobalfuncname_L000020_22_L000023 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getinfo)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk2_67b110dc_pushglobalfuncname_L000020_24_L000025 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk_67b110dc_findfield_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk2_67b110dc_pushglobalfuncname_L000020_26)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2_67b110dc_pushglobalfuncname_L000020_30_L000031 ' reg ARG ADDRG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncmp)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk2_67b110dc_pushglobalfuncname_L000020_28)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (3)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s5sk2_67b110dc_pushglobalfuncname_L000020_28
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_copy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_s5sk2_67b110dc_pushglobalfuncname_L000020_21)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk2_67b110dc_pushglobalfuncname_L000020_26
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s5sk2_67b110dc_pushglobalfuncname_L000020_21
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032 ' <symbol:pushfuncname>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s5sk2_67b110dc_pushglobalfuncname_L000020)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk6_67b110dc_pushfuncname_L000032_34)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk6_67b110dc_pushfuncname_L000032_36_L000037 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk6_67b110dc_pushfuncname_L000032_35)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_34
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk6_67b110dc_pushfuncname_L000032_38)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s5sk6_67b110dc_pushfuncname_L000032_40_L000041 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk6_67b110dc_pushfuncname_L000032_39)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_38
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (109)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk6_67b110dc_pushfuncname_L000032_42)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk6_67b110dc_pushfuncname_L000032_44_L000045 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk6_67b110dc_pushfuncname_L000032_43)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_42
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (67)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk6_67b110dc_pushfuncname_L000032_46)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s5sk6_67b110dc_pushfuncname_L000032_48_L000049 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk6_67b110dc_pushfuncname_L000032_47)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_46
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk6_67b110dc_pushfuncname_L000032_50_L000051 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_47
 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_43
 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_39
 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_35
' C_s5sk6_67b110dc_pushfuncname_L000032_33 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5skc_67b110dc_lastlevel_L000052 ' <symbol:lastlevel>
 alignl ' align long
 long I32_NEWF + 108<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_s5skc_67b110dc_lastlevel_L000052_55)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5skc_67b110dc_lastlevel_L000052_54
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r21)<<D16A + (1)<<S16A ' SHLI4 reg coni
 alignl ' align long
C_s5skc_67b110dc_lastlevel_L000052_55
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5skc_67b110dc_lastlevel_L000052_54)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s5skc_67b110dc_lastlevel_L000052_58)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5skc_67b110dc_lastlevel_L000052_57
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5skc_67b110dc_lastlevel_L000052_60)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s5skc_67b110dc_lastlevel_L000052_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5skc_67b110dc_lastlevel_L000052_60
 word I16A_MOV + (r21)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s5skc_67b110dc_lastlevel_L000052_61
 alignl ' align long
C_s5skc_67b110dc_lastlevel_L000052_58
 word I16A_CMPS + (r19)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s5skc_67b110dc_lastlevel_L000052_57)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r0)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_s5skc_67b110dc_lastlevel_L000052_53 ' (symbol refcount = 0)
 word I16B_POPM + 27<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_traceback

 alignl ' align long
C_luaL__traceback ' <symbol:luaL_traceback>
 alignl ' align long
 long I32_NEWF + 380<<S32
 alignl ' align long
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5skc_67b110dc_lastlevel_L000052)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r17)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r22)<<D16A + (21)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_luaL__traceback_64)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r11)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__traceback_65)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__traceback_64
 word I16A_NEGI + (r11)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl ' align long
C_luaL__traceback_65
 word I16A_MOV + (r15)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__buffinit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__traceback_66)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__addstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-376)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 alignl ' align long
 long I32_LODF + ((-380)&$FFFFFF)<<S32
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_luaL__traceback_71)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__prepbuffsize)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__traceback_71
 alignl ' align long
 long I32_LODF + ((-376)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_LODF + ((-376)&$FFFFFF)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_luaL__traceback_66
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__traceback_72_L000073 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__addstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__traceback_75)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__traceback_74
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r15)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__traceback_77)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r17)<<S16A ' SUBI/P (3)
 word I16A_SUBSI + (r22)<<D16A + (11)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__traceback_79_L000080 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__addvalue)<<S32 ' CALL addrg
 word I16A_ADDS + (r17)<<D16A + (r10)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_JMPA + (@C_luaL__traceback_78)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__traceback_77
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__traceback_81_L000082 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getinfo)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-88)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_luaL__traceback_83)<<S32 ' GTI4 reg coni
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__traceback_86_L000087 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__traceback_84)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__traceback_83
 word I16B_LODF + ((-88)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_luaL__traceback_89_L000090 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
C_luaL__traceback_84
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__addvalue)<<S32 ' CALL addrg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s5sk6_67b110dc_pushfuncname_L000032)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__addvalue)<<S32 ' CALL addrg
 word I16B_LODF + ((-73)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__traceback_93)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__traceback_96_L000097 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__addstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__traceback_93
 alignl ' align long
C_luaL__traceback_78
 alignl ' align long
C_luaL__traceback_75
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__traceback_74)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODF + ((-384)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__pushresult)<<S32 ' CALL addrg
' C_luaL__traceback_62 ' (symbol refcount = 0)
 word I16B_POPM + 95<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_argerror

 alignl ' align long
C_luaL__argerror ' <symbol:luaL_argerror>
 alignl ' align long
 long I32_NEWF + 108<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__argerror_99)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_luaL__argerror_101_L000102 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__argerror_98)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__argerror_99
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__argerror_103_L000104 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getinfo)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__argerror_108_L000109 ' reg ARG ADDRG
 word I16B_LODF + ((-104)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__argerror_105)<<S32 ' NEI4 reg coni
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__argerror_110)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_luaL__argerror_112_L000113 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__argerror_98)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__argerror_110
 alignl ' align long
C_luaL__argerror_105
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__argerror_115)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s5sk2_67b110dc_pushglobalfuncname_L000020)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__argerror_120)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__argerror_121)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__argerror_120
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long @C_s5sk6_67b110dc_pushfuncname_L000032_50_L000051 ' reg <- addrg
 alignl ' align long
C_luaL__argerror_121
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_luaL__argerror_115
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-108)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl ' align long
 long @C_luaL__argerror_122_L000123 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__argerror_98
 word I16B_POPM + 27<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_typeerror

 alignl ' align long
C_luaL__typeerror ' <symbol:luaL_typeerror>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__typeerror_128_L000129 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__getmetafield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__typeerror_126)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_luaL__typeerror_127)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__typeerror_126
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__typeerror_130)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_luaL__typeerror_132_L000133 ' reg <- addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_luaL__typeerror_131)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__typeerror_130
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
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
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_luaL__typeerror_131
 alignl ' align long
C_luaL__typeerror_127
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_luaL__typeerror_134_L000135 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaL__typeerror_125 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5skr_67b110dc_tag_error_L000136 ' <symbol:tag_error>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__typeerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s5skr_67b110dc_tag_error_L000136_137 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_where

 alignl ' align long
C_luaL__where ' <symbol:luaL_where>
 alignl ' align long
 long I32_NEWF + 108<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__where_139)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-112)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__where_141_L000142 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getinfo)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-88)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_luaL__where_143)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-88)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_luaL__where_146_L000147 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__where_138)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__where_143
 alignl ' align long
C_luaL__where_139
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__where_150_L000151 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__where_138
 word I16B_POPM + 27<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_error

 alignl ' align long
C_luaL__error ' <symbol:luaL_error>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODF + 8<<S16B
 alignl ' align long
 long I32_SPILL + r2<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r3<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r4<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r5<<D32 ' spill reg (varadic)
 word I16B_LODF + ((16)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__where)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushvfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_concat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_error)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaL__error_152 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_fileresult

 alignl ' align long
C_luaL__fileresult ' <symbol:luaL_fileresult>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_errno)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__fileresult_155)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__fileresult_154)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__fileresult_155
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__fileresult_157)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strerror)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_luaL__fileresult_159_L000160 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__fileresult_158)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__fileresult_157
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strerror)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__fileresult_158
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl ' align long
C_luaL__fileresult_154
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_execresult

 alignl ' align long
C_luaL__execresult ' <symbol:luaL_execresult>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__execresult_162)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_errno)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__execresult_162)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__fileresult)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__execresult_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__execresult_162
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_luaL__execresult_164_L000165 ' reg <- addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (101)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__execresult_166)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__execresult_166)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__execresult_167)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__execresult_166
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl ' align long
C_luaL__execresult_167
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl ' align long
C_luaL__execresult_161
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_newmetatable

 alignl ' align long
C_luaL__newmetatable ' <symbol:luaL_newmetatable>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__newmetatable_169)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__newmetatable_168)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__newmetatable_169
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__typeerror_128_L000129 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_luaL__newmetatable_168
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_setmetatable

 alignl ' align long
C_luaL__setmetatable ' <symbol:luaL_setmetatable>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaL__setmetatable_171 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_testudata

 alignl ' align long
C_luaL__testudata ' <symbol:luaL_testudata>
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
 long I32_CALA + (@C_lua_touserdata)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__testudata_173)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__testudata_175)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawequal)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__testudata_177)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_luaL__testudata_177
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_JMPA + (@C_luaL__testudata_172)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__testudata_175
 alignl ' align long
C_luaL__testudata_173
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_luaL__testudata_172
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checkudata

 alignl ' align long
C_luaL__checkudata ' <symbol:luaL_checkudata>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__testudata)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__checkudata_180)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__typeerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__checkudata_180
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_luaL__checkudata_179 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checkoption

 alignl ' align long
C_luaL__checkoption ' <symbol:luaL_checkoption>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $eaa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__checkoption_183)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__checkoption_184)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__checkoption_183
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__checkoption_184
 word I16A_MOV + (r13)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__checkoption_188)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__checkoption_185
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__checkoption_189)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__checkoption_181)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__checkoption_189
' C_luaL__checkoption_186 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_luaL__checkoption_188
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__checkoption_185)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__checkoption_191_L000192 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__checkoption_181
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checkstack

 alignl ' align long
C_luaL__checkstack ' <symbol:luaL_checkstack>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__checkstack_194)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__checkstack_196)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__checkstack_198_L000199 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__checkstack_197)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__checkstack_196
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__checkstack_200_L000201 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__checkstack_197
 alignl ' align long
C_luaL__checkstack_194
' C_luaL__checkstack_193 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checktype

 alignl ' align long
C_luaL__checktype ' <symbol:luaL_checktype>
 alignl ' align long
 long I32_NEWF + 0<<S32
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
 word I16A_CMPS + (r0)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__checktype_203)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5skr_67b110dc_tag_error_L000136)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__checktype_203
' C_luaL__checktype_202 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checkany

 alignl ' align long
C_luaL__checkany ' <symbol:luaL_checkany>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__checkany_206)<<S32 ' NEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__checkany_208_L000209 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__checkany_206
' C_luaL__checkany_205 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checklstring

 alignl ' align long
C_luaL__checklstring ' <symbol:luaL_checklstring>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__checklstring_211)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5skr_67b110dc_tag_error_L000136)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__checklstring_211
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_luaL__checklstring_210 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_optlstring

 alignl ' align long
C_luaL__optlstring ' <symbol:luaL_optlstring>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_luaL__optlstring_214)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__optlstring_216)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__optlstring_219)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__optlstring_220)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__optlstring_219
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_luaL__optlstring_220
 word I16A_WRLONG + (r15)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_luaL__optlstring_216
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__optlstring_213)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__optlstring_214
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__optlstring_213
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checknumber

 alignl ' align long
C_luaL__checknumber ' <symbol:luaL_checknumber>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__checknumber_222)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5skr_67b110dc_tag_error_L000136)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__checknumber_222
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
' C_luaL__checknumber_221 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_optnumber

 alignl ' align long
C_luaL__optnumber ' <symbol:luaL_optnumber>
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
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_luaL__optnumber_226)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__optnumber_227)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__optnumber_226
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checknumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__optnumber_227
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_luaL__optnumber_224 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk15_67b110dc_interror_L000228 ' <symbol:interror>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk15_67b110dc_interror_L000228_230)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk15_67b110dc_interror_L000228_232_L000233 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk15_67b110dc_interror_L000228_231)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk15_67b110dc_interror_L000228_230
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5skr_67b110dc_tag_error_L000136)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s5sk15_67b110dc_interror_L000228_231
' C_s5sk15_67b110dc_interror_L000228_229 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checkinteger

 alignl ' align long
C_luaL__checkinteger ' <symbol:luaL_checkinteger>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tointegerx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__checkinteger_235)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s5sk15_67b110dc_interror_L000228)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__checkinteger_235
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_luaL__checkinteger_234 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_optinteger

 alignl ' align long
C_luaL__optinteger ' <symbol:luaL_optinteger>
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
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_luaL__optinteger_239)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__optinteger_240)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__optinteger_239
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__optinteger_240
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_luaL__optinteger_237 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk17_67b110dc_resizebox_L000241 ' <symbol:resizebox>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_getallocf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_touserdata)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r4)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_CALI
 alignl ' align long
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL indirect
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk17_67b110dc_resizebox_L000241_243)<<S32 ' NEU4 reg coni
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk17_67b110dc_resizebox_L000241_243)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk17_67b110dc_resizebox_L000241_245_L000246 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_error)<<S32 ' CALL addrg
 alignl ' align long
C_s5sk17_67b110dc_resizebox_L000241_243
 word I16A_WRLONG + (r15)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_s5sk17_67b110dc_resizebox_L000241_242 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk19_67b110dc_boxgc_L000247 ' <symbol:boxgc>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk17_67b110dc_resizebox_L000241)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_s5sk19_67b110dc_boxgc_L000247_248 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s5sk1a_67b110dc_boxmt_L000249 ' <symbol:boxmt>
 long @C_s5sk1b_67b110dc_250_L000251
 long @C_s5sk19_67b110dc_boxgc_L000247
 long @C_s5sk1c_67b110dc_252_L000253
 long @C_s5sk19_67b110dc_boxgc_L000247
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s5sk1d_67b110dc_newbox_L000254 ' <symbol:newbox>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (8)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_newuserdatauv)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk1d_67b110dc_newbox_L000254_258_L000259 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__newmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk1d_67b110dc_newbox_L000254_256)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk1a_67b110dc_boxmt_L000249 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__setfuncs)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s5sk1d_67b110dc_newbox_L000254_256
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s5sk1d_67b110dc_newbox_L000254_255 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk1f_67b110dc_newbuffsize_L000260 ' <symbol:newbuffsize>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r19)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s5sk1f_67b110dc_newbuffsize_L000260_262)<<S32 ' GEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk1f_67b110dc_newbuffsize_L000260_264_L000265 ' reg ARG ADDRG
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s5sk1f_67b110dc_newbuffsize_L000260_261)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk1f_67b110dc_newbuffsize_L000260_262
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (1)
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s5sk1f_67b110dc_newbuffsize_L000260_266)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r19)<<D16A + (r21)<<S16A ' ADDU (3)
 alignl ' align long
C_s5sk1f_67b110dc_newbuffsize_L000260_266
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s5sk1f_67b110dc_newbuffsize_L000260_261
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk1h_67b110dc_prepbuffsize_L000268 ' <symbol:prepbuffsize>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s5sk1h_67b110dc_prepbuffsize_L000268_270)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_s5sk1h_67b110dc_prepbuffsize_L000268_269)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk1h_67b110dc_prepbuffsize_L000268_270
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s5sk1f_67b110dc_newbuffsize_L000260)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk1h_67b110dc_prepbuffsize_L000268_272)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk17_67b110dc_resizebox_L000241)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_s5sk1h_67b110dc_prepbuffsize_L000268_273)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk1h_67b110dc_prepbuffsize_L000268_272
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5sk1d_67b110dc_newbox_L000254)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toclose)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk17_67b110dc_resizebox_L000241)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r3)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s5sk1h_67b110dc_prepbuffsize_L000268_273
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl ' align long
C_s5sk1h_67b110dc_prepbuffsize_L000268_269
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_prepbuffsize

 alignl ' align long
C_luaL__prepbuffsize ' <symbol:luaL_prepbuffsize>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk1h_67b110dc_prepbuffsize_L000268)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaL__prepbuffsize_274 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_addlstring

 alignl ' align long
C_luaL__addlstring ' <symbol:luaL_addlstring>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__addlstring_276)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk1h_67b110dc_prepbuffsize_L000268)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r19)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_luaL__addlstring_276
' C_luaL__addlstring_275 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_addstring

 alignl ' align long
C_luaL__addstring ' <symbol:luaL_addstring>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__addlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_luaL__addstring_278 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_pushresult

 alignl ' align long
C_luaL__pushresult ' <symbol:luaL_pushresult>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r3)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__pushresult_280)<<S32 ' EQU4 reg reg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_closeslot)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__pushresult_280
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaL__pushresult_279 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_pushresultsize

 alignl ' align long
C_luaL__pushresultsize ' <symbol:luaL_pushresultsize>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r21)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__pushresult)<<S32 ' CALL addrg
' C_luaL__pushresultsize_282 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_addvalue

 alignl ' align long
C_luaL__addvalue ' <symbol:luaL_addvalue>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk1h_67b110dc_prepbuffsize_L000268)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaL__addvalue_283 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_buffinit

 alignl ' align long
C_luaL__buffinit ' <symbol:luaL_buffinit>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushlightuserdata)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaL__buffinit_284 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_buffinitsize

 alignl ' align long
C_luaL__buffinitsize ' <symbol:luaL_buffinitsize>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__buffinit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk1h_67b110dc_prepbuffsize_L000268)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaL__buffinitsize_285 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_ref

 alignl ' align long
C_luaL__ref ' <symbol:luaL_ref>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__ref_287)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_luaL__ref_286)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__ref_287
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_absindex)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawgeti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__ref_289)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawseti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__ref_290)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__ref_289
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tointegerx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__ref_290
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__ref_291)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawgeti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawseti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__ref_292)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__ref_291
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_rawlen)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_luaL__ref_292
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawseti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__ref_286
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_unref

 alignl ' align long
C_luaL__unref ' <symbol:luaL_unref>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_luaL__unref_294)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_absindex)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawgeti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawseti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rawseti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__unref_294
' C_luaL__unref_293 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk1i_67b110dc_getF__L000296 ' <symbol:getF>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s5sk1i_67b110dc_getF__L000296_298)<<S32 ' LEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s5sk1i_67b110dc_getF__L000296_299)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk1i_67b110dc_getF__L000296_298
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk1i_67b110dc_getF__L000296_300)<<S32 ' EQI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_s5sk1i_67b110dc_getF__L000296_297)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk1i_67b110dc_getF__L000296_300
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_fread)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_s5sk1i_67b110dc_getF__L000296_299
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_s5sk1i_67b110dc_getF__L000296_297
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk1j_67b110dc_errfile_L000302 ' <symbol:errfile>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_errno)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strerror)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl ' align long
 long @C_s5sk1j_67b110dc_errfile_L000302_304_L000305 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (6)<<S16A ' RET coni
' C_s5sk1j_67b110dc_errfile_L000302_303 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk1l_67b110dc_skipB_O_M__L000306 ' <symbol:skipBOM>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r19)<<D16B
 alignl ' align long
 long @C_s5sk1l_67b110dc_skipB_O_M__L000306_308_L000309 ' reg <- addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_s5sk1l_67b110dc_skipB_O_M__L000306_310
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk1l_67b110dc_skipB_O_M__L000306_315)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk1l_67b110dc_skipB_O_M__L000306_313)<<S32 ' EQI4 reg reg
 alignl ' align long
C_s5sk1l_67b110dc_skipB_O_M__L000306_315
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_s5sk1l_67b110dc_skipB_O_M__L000306_307)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk1l_67b110dc_skipB_O_M__L000306_313
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_s5sk1l_67b110dc_skipB_O_M__L000306_311 ' (symbol refcount = 0)
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk1l_67b110dc_skipB_O_M__L000306_310)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s5sk1l_67b110dc_skipB_O_M__L000306_307
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk1n_67b110dc_skipcomment_L000316 ' <symbol:skipcomment>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5sk1l_67b110dc_skipB_O_M__L000306)<<S32 ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + RI<<D32 + (35)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk1n_67b110dc_skipcomment_L000316_318)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s5sk1n_67b110dc_skipcomment_L000316_320
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s5sk1n_67b110dc_skipcomment_L000316_321 ' (symbol refcount = 0)
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk1n_67b110dc_skipcomment_L000316_323)<<S32 ' EQI4 reg reg
 word I16A_CMPSI + (r19)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk1n_67b110dc_skipcomment_L000316_320)<<S32 ' NEI4 reg coni
 alignl ' align long
C_s5sk1n_67b110dc_skipcomment_L000316_323
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getc)<<S32 ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_s5sk1n_67b110dc_skipcomment_L000316_317)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk1n_67b110dc_skipcomment_L000316_318
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s5sk1n_67b110dc_skipcomment_L000316_317
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_loadfilex

 alignl ' align long
C_luaL__loadfilex ' <symbol:luaL_loadfilex>
 alignl ' align long
 long I32_NEWF + 532<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__loadfilex_325)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__loadfilex_327_L000328 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C___stdin ' reg <- addrg
 alignl ' align long
 long I32_LODF + ((-520)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl32 reg
 alignl ' align long
 long I32_JMPA + (@C_luaL__loadfilex_326)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__loadfilex_325
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__loadfilex_330_L000331 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__loadfilex_333_L000334 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_fopen)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-520)&$FFFFFF)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl32 reg
 alignl ' align long
 long I32_LODF + ((-520)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__loadfilex_335)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__loadfilex_338_L000339 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk1j_67b110dc_errfile_L000302)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__loadfilex_324)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__loadfilex_335
 alignl ' align long
C_luaL__loadfilex_326
 alignl ' align long
 long I32_LODF + ((-528)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl ' align long
 long I32_LODF + ((-524)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s5sk1n_67b110dc_skipcomment_L000316)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__loadfilex_340)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODF + ((-524)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODF + ((-524)&$FFFFFF)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl ' align long
 long I32_LODF + ((-516)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_luaL__loadfilex_340
 alignl ' align long
 long I32_LODF + ((-528)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 alignl ' align long
 long I32_LODA + (@C_luaL__loadfilex_345_L000346)<<S32
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__loadfilex_343)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__loadfilex_343)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODF + ((-520)&$FFFFFF)<<S32
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__loadfilex_348_L000349 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_freopen)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-520)&$FFFFFF)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl32 reg
 alignl ' align long
 long I32_LODF + ((-520)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__loadfilex_351)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__loadfilex_354_L000355 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk1j_67b110dc_errfile_L000302)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__loadfilex_324)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__loadfilex_351
 alignl ' align long
 long I32_LODF + ((-528)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl ' align long
 long I32_LODF + ((-524)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s5sk1n_67b110dc_skipcomment_L000316)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__loadfilex_343
 alignl ' align long
 long I32_LODF + ((-528)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__loadfilex_356)<<S32 ' EQI4 reg reg
 alignl ' align long
 long I32_LODF + ((-524)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODF + ((-524)&$FFFFFF)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl ' align long
 long I32_LODF + ((-516)&$FFFFFF)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODF + ((-528)&$FFFFFF)<<S32
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_luaL__loadfilex_356
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-524)&$FFFFFF)<<S32 
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_LODL + (r5)<<D16B
 alignl ' align long
 long @C_s5sk1i_67b110dc_getF__L000296 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_lua_load)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-532)&$FFFFFF)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 alignl ' align long
 long I32_LODF + ((-520)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__loadfilex_361)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__loadfilex_362)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__loadfilex_361
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_luaL__loadfilex_362
 alignl ' align long
 long I32_LODF + ((-536)&$FFFFFF)<<S32
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__loadfilex_363)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODF + ((-520)&$FFFFFF)<<S32
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fclose)<<S32 ' CALL addrg
 alignl ' align long
C_luaL__loadfilex_363
 alignl ' align long
 long I32_LODF + ((-536)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__loadfilex_366)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__loadfilex_368_L000369 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk1j_67b110dc_errfile_L000302)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__loadfilex_324)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__loadfilex_366
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-532)&$FFFFFF)<<S32
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32
 alignl ' align long
C_luaL__loadfilex_324
 word I16B_POPM + $180<<S16B ' restore registers, do not pop frame, do not return
 alignl ' align long
 long I32_RETF + 532<<S32
 alignl ' align long

 alignl ' align long
C_s5sk20_67b110dc_getS__L000370 ' <symbol:getS>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk20_67b110dc_getS__L000370_372)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_s5sk20_67b110dc_getS__L000370_371)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk20_67b110dc_getS__L000370_372
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r0)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C_s5sk20_67b110dc_getS__L000370_371
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export luaL_loadbufferx

 alignl ' align long
C_luaL__loadbufferx ' <symbol:luaL_loadbufferx>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r5)<<D16B
 alignl ' align long
 long @C_s5sk20_67b110dc_getS__L000370 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_lua_load)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaL__loadbufferx_374 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_loadstring

 alignl ' align long
C_luaL__loadstring ' <symbol:luaL_loadstring>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaL__loadbufferx)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaL__loadstring_376 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_getmetafield

 alignl ' align long
C_luaL__getmetafield ' <symbol:luaL_getmetafield>
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
 long I32_CALA + (@C_lua_getmetatable)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__getmetafield_378)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__getmetafield_377)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__getmetafield_378
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_rawget)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__getmetafield_380)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__getmetafield_381)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__getmetafield_380
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__getmetafield_381
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_luaL__getmetafield_377
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_callmeta

 alignl ' align long
C_luaL__callmeta ' <symbol:luaL_callmeta>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_absindex)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__getmetafield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__callmeta_383)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__callmeta_382)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__callmeta_383
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_lua_callk)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_luaL__callmeta_382
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_len

 alignl ' align long
C_luaL__len ' <symbol:luaL_len>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_len)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tointegerx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__len_386)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__len_388_L000389 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__len_386
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_luaL__len_385 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_tolstring

 alignl ' align long
C_luaL__tolstring ' <symbol:luaL_tolstring>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_absindex)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_393_L000394 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__callmeta)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__tolstring_391)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__tolstring_392)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_397_L000398 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__tolstring_392)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__tolstring_391
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_luaL__tolstring_399)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_luaL__tolstring_399)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_428_L000430 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaL__tolstring_428_L000430 ' <symbol:428>
 long @C_luaL__tolstring_418
 long @C_luaL__tolstring_410
 long @C_luaL__tolstring_399
 long @C_luaL__tolstring_402
 long @C_luaL__tolstring_409

' Catalina Code

DAT ' code segment
 alignl ' align long
C_luaL__tolstring_402
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_isinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__tolstring_403)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tointegerx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_405_L000406 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__tolstring_400)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__tolstring_403
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tonumberx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_407_L000408 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__tolstring_400)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__tolstring_409
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__tolstring_400)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__tolstring_410
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__tolstring_416)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r15)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_411_L000412 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__tolstring_417)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__tolstring_416
 word I16B_LODL + (r15)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_413_L000414 ' reg <- addrg
 alignl ' align long
C_luaL__tolstring_417
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__tolstring_400)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__tolstring_418
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_419_L000420 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__tolstring_400)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__tolstring_399
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__typeerror_128_L000129 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__getmetafield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__tolstring_422)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__tolstring_423)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__tolstring_422
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
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
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_luaL__tolstring_423
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r13)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_topointer)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_luaL__tolstring_424_L000425 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__tolstring_400)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__tolstring_400
 alignl ' align long
C_luaL__tolstring_392
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaL__tolstring_390 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_setfuncs

 alignl ' align long
C_luaL__setfuncs ' <symbol:luaL_setfuncs>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__setfuncs_432_L000433 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__setfuncs_437)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__setfuncs_434
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__setfuncs_438)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__setfuncs_439)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__setfuncs_438
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__setfuncs_443)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__setfuncs_440
 word I16A_NEG + (r2)<<D16A + (r19)<<S16A ' NEGI4
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaL__setfuncs_441 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_luaL__setfuncs_443
 word I16A_CMPS + (r17)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_luaL__setfuncs_440)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushcclosure)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__setfuncs_439
 word I16A_RDLONG + (r2)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (2)<<S16A ' ADDI4 reg coni
 word I16A_NEG + (r3)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_luaL__setfuncs_435 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_luaL__setfuncs_437
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__setfuncs_434)<<S32 ' NEU4 reg coni
 word I16A_NEG + (r22)<<D16A + (r19)<<S16A ' NEGI4
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaL__setfuncs_431 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_getsubtable

 alignl ' align long
C_luaL__getsubtable ' <symbol:luaL_getsubtable>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (5)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__getsubtable_445)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_luaL__getsubtable_444)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__getsubtable_445
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_absindex)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_luaL__getsubtable_444
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_requiref

 alignl ' align long
C_luaL__requiref ' <symbol:luaL_requiref>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk2_67b110dc_pushglobalfuncname_L000020_24_L000025 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__getsubtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__requiref_448)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_pushcclosure)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
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
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__requiref_448
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__requiref_450)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_setglobal)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_luaL__requiref_450
' C_luaL__requiref_447 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_addgsub

 alignl ' align long
C_luaL__addgsub ' <symbol:luaL_addgsub>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_luaL__addgsub_454)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__addgsub_453
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaL__addlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__addstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r13)<<S16A ' ADDI/P
 word I16A_ADDS + (r21)<<D16A + (r15)<<S16A ' ADDI/P (3)
 alignl ' align long
C_luaL__addgsub_454
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strstr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_luaL__addgsub_453)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__addstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaL__addgsub_452 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_gsub

 alignl ' align long
C_luaL__gsub ' <symbol:luaL_gsub>
 alignl ' align long
 long I32_NEWF + 272<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__buffinit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__addgsub)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaL__pushresult)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaL__gsub_456 ' (symbol refcount = 0)
 word I16B_POPM + 68<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk2d_67b110dc_l_alloc_L000457 ' <symbol:l_alloc>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk2d_67b110dc_l_alloc_L000457_459)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_free)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_s5sk2d_67b110dc_l_alloc_L000457_458)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk2d_67b110dc_l_alloc_L000457_459
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_realloc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk2d_67b110dc_l_alloc_L000457_461)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk2d_67b110dc_l_alloc_L000457_463)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk2d_67b110dc_l_alloc_L000457_464)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk2d_67b110dc_l_alloc_L000457_463
 word I16A_CMP + (r17)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s5sk2d_67b110dc_l_alloc_L000457_465)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r19)<<S16A ' SUBU (3)
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s5sk2d_67b110dc_l_alloc_L000457_465
 alignl ' align long
C_s5sk2d_67b110dc_l_alloc_L000457_464
 alignl ' align long
C_s5sk2d_67b110dc_l_alloc_L000457_461
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
C_s5sk2d_67b110dc_l_alloc_L000457_458
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk2e_67b110dc_panic_L000467 ' <symbol:panic>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk2e_67b110dc_panic_L000467_469)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r21)<<D16B
 alignl ' align long
 long @C_s5sk2e_67b110dc_panic_L000467_471_L000472 ' reg <- addrg
 alignl ' align long
C_s5sk2e_67b110dc_panic_L000467_469
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2e_67b110dc_panic_L000467_473_L000474 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C___stderr ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_fprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C___stderr ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_s5sk2e_67b110dc_panic_L000467_468 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478 ' <symbol:checkcontrol>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk2k_67b110dc_checkcontrol_L000478_482)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (64)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk2k_67b110dc_checkcontrol_L000478_480)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478_482
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_s5sk2k_67b110dc_checkcontrol_L000478_479)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478_480
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk2k_67b110dc_checkcontrol_L000478_485_L000486 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk2k_67b110dc_checkcontrol_L000478_483)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2h_67b110dc_warnfoff_L000475 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setwarnf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk2k_67b110dc_checkcontrol_L000478_484)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478_483
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk2k_67b110dc_checkcontrol_L000478_489_L000490 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s5sk2k_67b110dc_checkcontrol_L000478_487)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2i_67b110dc_warnfon_L000476 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setwarnf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478_487
 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478_484
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478_479
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk2h_67b110dc_warnfoff_L000475 ' <symbol:warnfoff>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk2k_67b110dc_checkcontrol_L000478)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s5sk2h_67b110dc_warnfoff_L000475_491 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk2j_67b110dc_warnfcont_L000477 ' <symbol:warnfcont>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $aa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2j_67b110dc_warnfcont_L000477_493_L000494 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C___stderr ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_fprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C___stderr ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk2j_67b110dc_warnfcont_L000477_495)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2j_67b110dc_warnfcont_L000477 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setwarnf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_s5sk2j_67b110dc_warnfcont_L000477_496)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk2j_67b110dc_warnfcont_L000477_495
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk2j_67b110dc_warnfcont_L000477_497_L000498 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2j_67b110dc_warnfcont_L000477_493_L000494 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C___stderr ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_fprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C___stderr ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2i_67b110dc_warnfon_L000476 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setwarnf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s5sk2j_67b110dc_warnfcont_L000477_496
' C_s5sk2j_67b110dc_warnfcont_L000477_492 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s5sk2i_67b110dc_warnfon_L000476 ' <symbol:warnfon>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk2k_67b110dc_checkcontrol_L000478)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s5sk2i_67b110dc_warnfon_L000476_500)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_s5sk2i_67b110dc_warnfon_L000476_499)<<S32 ' JUMPV addrg
 alignl ' align long
C_s5sk2i_67b110dc_warnfon_L000476_500
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk2i_67b110dc_warnfon_L000476_502_L000503 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2j_67b110dc_warnfcont_L000477_493_L000494 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C___stderr ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_fprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C___stderr ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s5sk2j_67b110dc_warnfcont_L000477)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_s5sk2i_67b110dc_warnfon_L000476_499
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_newstate

 alignl ' align long
C_luaL__newstate ' <symbol:luaL_newstate>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2d_67b110dc_l_alloc_L000457 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_newstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__newstate_505)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s5sk2e_67b110dc_panic_L000467 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_lua_atpanic)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s5sk2h_67b110dc_warnfoff_L000475 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_lua_setwarnf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_luaL__newstate_505
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_luaL__newstate_504 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaL_checkversion_

 alignl ' align long
C_luaL__checkversion_ ' <symbol:luaL_checkversion_>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_lua_version)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (68)<<S32
 word I16A_CMP + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaL__checkversion__508)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_luaL__checkversion__510_L000511 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaL__checkversion__509)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaL__checkversion__508
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BR_Z + (@C_luaL__checkversion__512)<<S32 ' EQF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_luaL__checkversion__514_L000515 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
C_luaL__checkversion__512
 alignl ' align long
C_luaL__checkversion__509
' C_luaL__checkversion__507 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

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
C_luaL__checkversion__514_L000515 ' <symbol:514>
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
C_luaL__checkversion__510_L000511 ' <symbol:510>
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
C_s5sk2i_67b110dc_warnfon_L000476_502_L000503 ' <symbol:502>
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
C_s5sk2j_67b110dc_warnfcont_L000477_497_L000498 ' <symbol:497>
 byte 10
 byte 0

 alignl ' align long
C_s5sk2j_67b110dc_warnfcont_L000477_493_L000494 ' <symbol:493>
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478_489_L000490 ' <symbol:489>
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_s5sk2k_67b110dc_checkcontrol_L000478_485_L000486 ' <symbol:485>
 byte 111
 byte 102
 byte 102
 byte 0

 alignl ' align long
C_s5sk2e_67b110dc_panic_L000467_473_L000474 ' <symbol:473>
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
C_s5sk2e_67b110dc_panic_L000467_471_L000472 ' <symbol:471>
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
C_luaL__setfuncs_432_L000433 ' <symbol:432>
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
C_luaL__tolstring_424_L000425 ' <symbol:424>
 byte 37
 byte 115
 byte 58
 byte 32
 byte 37
 byte 112
 byte 0

 alignl ' align long
C_luaL__tolstring_419_L000420 ' <symbol:419>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_luaL__tolstring_413_L000414 ' <symbol:413>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_luaL__tolstring_411_L000412 ' <symbol:411>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_luaL__tolstring_407_L000408 ' <symbol:407>
 byte 37
 byte 102
 byte 0

 alignl ' align long
C_luaL__tolstring_405_L000406 ' <symbol:405>
 byte 37
 byte 73
 byte 0

 alignl ' align long
C_luaL__tolstring_397_L000398 ' <symbol:397>
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
C_luaL__tolstring_393_L000394 ' <symbol:393>
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
C_luaL__len_388_L000389 ' <symbol:388>
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
C_luaL__loadfilex_368_L000369 ' <symbol:368>
 byte 114
 byte 101
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_luaL__loadfilex_354_L000355 ' <symbol:354>
 byte 114
 byte 101
 byte 111
 byte 112
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_luaL__loadfilex_348_L000349 ' <symbol:348>
 byte 114
 byte 98
 byte 0

 alignl ' align long
C_luaL__loadfilex_345_L000346 ' <symbol:345>
 byte 27
 byte 76
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_luaL__loadfilex_338_L000339 ' <symbol:338>
 byte 111
 byte 112
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_luaL__loadfilex_333_L000334 ' <symbol:333>
 byte 114
 byte 0

 alignl ' align long
C_luaL__loadfilex_330_L000331 ' <symbol:330>
 byte 64
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaL__loadfilex_327_L000328 ' <symbol:327>
 byte 61
 byte 115
 byte 116
 byte 100
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_s5sk1l_67b110dc_skipB_O_M__L000306_308_L000309 ' <symbol:308>
 byte 239
 byte 187
 byte 191
 byte 0

 alignl ' align long
C_s5sk1j_67b110dc_errfile_L000302_304_L000305 ' <symbol:304>
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
C_s5sk1f_67b110dc_newbuffsize_L000260_264_L000265 ' <symbol:264>
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
C_s5sk1d_67b110dc_newbox_L000254_258_L000259 ' <symbol:258>
 byte 95
 byte 85
 byte 66
 byte 79
 byte 88
 byte 42
 byte 0

 alignl ' align long
C_s5sk1c_67b110dc_252_L000253 ' <symbol:252>
 byte 95
 byte 95
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_s5sk1b_67b110dc_250_L000251 ' <symbol:250>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_s5sk17_67b110dc_resizebox_L000241_245_L000246 ' <symbol:245>
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
C_s5sk15_67b110dc_interror_L000228_232_L000233 ' <symbol:232>
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
C_luaL__checkany_208_L000209 ' <symbol:208>
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
C_luaL__checkstack_200_L000201 ' <symbol:200>
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
C_luaL__checkstack_198_L000199 ' <symbol:198>
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
C_luaL__checkoption_191_L000192 ' <symbol:191>
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
C_luaL__execresult_164_L000165 ' <symbol:164>
 byte 101
 byte 120
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_luaL__fileresult_159_L000160 ' <symbol:159>
 byte 37
 byte 115
 byte 58
 byte 32
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_luaL__where_150_L000151 ' <symbol:150>
 byte 0

 alignl ' align long
C_luaL__where_146_L000147 ' <symbol:146>
 byte 37
 byte 115
 byte 58
 byte 37
 byte 100
 byte 58
 byte 32
 byte 0

 alignl ' align long
C_luaL__where_141_L000142 ' <symbol:141>
 byte 83
 byte 108
 byte 0

 alignl ' align long
C_luaL__typeerror_134_L000135 ' <symbol:134>
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
C_luaL__typeerror_132_L000133 ' <symbol:132>
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
C_luaL__typeerror_128_L000129 ' <symbol:128>
 byte 95
 byte 95
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_luaL__argerror_122_L000123 ' <symbol:122>
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
C_luaL__argerror_112_L000113 ' <symbol:112>
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
C_luaL__argerror_108_L000109 ' <symbol:108>
 byte 109
 byte 101
 byte 116
 byte 104
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_luaL__argerror_103_L000104 ' <symbol:103>
 byte 110
 byte 0

 alignl ' align long
C_luaL__argerror_101_L000102 ' <symbol:101>
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
C_luaL__traceback_96_L000097 ' <symbol:96>
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
C_luaL__traceback_89_L000090 ' <symbol:89>
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
C_luaL__traceback_86_L000087 ' <symbol:86>
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
C_luaL__traceback_81_L000082 ' <symbol:81>
 byte 83
 byte 108
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_luaL__traceback_79_L000080 ' <symbol:79>
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
C_luaL__traceback_72_L000073 ' <symbol:72>
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
C_s5sk6_67b110dc_pushfuncname_L000032_50_L000051 ' <symbol:50>
 byte 63
 byte 0

 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_48_L000049 ' <symbol:48>
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
C_s5sk6_67b110dc_pushfuncname_L000032_44_L000045 ' <symbol:44>
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
C_s5sk6_67b110dc_pushfuncname_L000032_40_L000041 ' <symbol:40>
 byte 37
 byte 115
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_s5sk6_67b110dc_pushfuncname_L000032_36_L000037 ' <symbol:36>
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
C_s5sk2_67b110dc_pushglobalfuncname_L000020_30_L000031 ' <symbol:30>
 byte 95
 byte 71
 byte 46
 byte 0

 alignl ' align long
C_s5sk2_67b110dc_pushglobalfuncname_L000020_24_L000025 ' <symbol:24>
 byte 95
 byte 76
 byte 79
 byte 65
 byte 68
 byte 69
 byte 68
 byte 0

 alignl ' align long
C_s5sk2_67b110dc_pushglobalfuncname_L000020_22_L000023 ' <symbol:22>
 byte 102
 byte 0

 alignl ' align long
C_s5sk_67b110dc_findfield_L000004_18_L000019 ' <symbol:18>
 byte 46
 byte 0

' Catalina Code

DAT ' code segment
' end
