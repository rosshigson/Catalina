' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_s9jk_690eda36_os_execute_L000004 ' <symbol:os_execute>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_system)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jk_690eda36_os_execute_L000004_6)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__execresult)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jk_690eda36_os_execute_L000004_5)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk_690eda36_os_execute_L000004_6
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_s9jk_690eda36_os_execute_L000004_5
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk1_690eda36_os_remove_L000008 ' <symbol:os_remove>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk1_690eda36_os_remove_L000008_11)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s9jk1_690eda36_os_remove_L000008_12)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk1_690eda36_os_remove_L000008_11
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s9jk1_690eda36_os_remove_L000008_12
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__fileresult)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s9jk1_690eda36_os_remove_L000008_9 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk2_690eda36_os_rename_L000013 ' <symbol:os_rename>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_rename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk2_690eda36_os_rename_L000013_16)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s9jk2_690eda36_os_rename_L000013_17)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk2_690eda36_os_rename_L000013_16
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s9jk2_690eda36_os_rename_L000013_17
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__fileresult)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s9jk2_690eda36_os_rename_L000013_14 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk3_690eda36_os_tmpname_L000018 ' <symbol:os_tmpname>
 alignl_p1
 long I32_NEWF + 28<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_tmpnam)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk3_690eda36_os_tmpname_L000018_23)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s9jk3_690eda36_os_tmpname_L000018_24)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk3_690eda36_os_tmpname_L000018_23
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s9jk3_690eda36_os_tmpname_L000018_24
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jk3_690eda36_os_tmpname_L000018_25)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s9jk3_690eda36_os_tmpname_L000018_27_L000028 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jk3_690eda36_os_tmpname_L000018_19)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk3_690eda36_os_tmpname_L000018_25
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_s9jk3_690eda36_os_tmpname_L000018_19
 word I16B_POPM + 7<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk6_690eda36_os_getenv_L000029 ' <symbol:os_getenv>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_getenv)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_s9jk6_690eda36_os_getenv_L000029_30 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk7_690eda36_os_clock_L000031 ' <symbol:os_clock>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_clock)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_s9jk7_690eda36_os_clock_L000031_33_L000034)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r18)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 alignl_p1
 long I32_LODI + (@C_s9jk7_690eda36_os_clock_L000031_35_L000036)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_s9jk7_690eda36_os_clock_L000031_32 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jka_690eda36_setfield_L000037 ' <symbol:setfield>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $aa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r17)<<S16A ' ADDI/P (3)
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
' C_s9jka_690eda36_setfield_L000037_38 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jkb_690eda36_setboolfield_L000039 ' <symbol:setboolfield>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s9jkb_690eda36_setboolfield_L000039_41)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s9jkb_690eda36_setboolfield_L000039_40)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkb_690eda36_setboolfield_L000039_41
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
 alignl_label
C_s9jkb_690eda36_setboolfield_L000039_40
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jkc_690eda36_setallfields_L000043 ' <symbol:setallfields>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1900)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_45_L000046 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jka_690eda36_setfield_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_47_L000048 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jka_690eda36_setfield_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_49_L000050 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jka_690eda36_setfield_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_51_L000052 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jka_690eda36_setfield_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_53_L000054 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jka_690eda36_setfield_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_RDLONG + (r3)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_55_L000056 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jka_690eda36_setfield_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_57_L000058 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jka_690eda36_setfield_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_59_L000060 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jka_690eda36_setfield_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_61_L000062 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s9jkb_690eda36_setboolfield_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s9jkc_690eda36_setallfields_L000043_44 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jkm_690eda36_getboolfield_L000063 ' <symbol:getboolfield>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jkm_690eda36_getboolfield_L000063_66)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_s9jkm_690eda36_getboolfield_L000063_67)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkm_690eda36_getboolfield_L000063_66
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s9jkm_690eda36_getboolfield_L000063_67
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_s9jkm_690eda36_getboolfield_L000063_64 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jkn_690eda36_getfield_L000068 ' <symbol:getfield>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $feac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_getfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tointegerx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jkn_690eda36_getfield_L000068_70)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jkn_690eda36_getfield_L000068_72)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s9jkn_690eda36_getfield_L000068_74_L000075 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jkn_690eda36_getfield_L000068_69)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkn_690eda36_getfield_L000068_72
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s9jkn_690eda36_getfield_L000068_76)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s9jkn_690eda36_getfield_L000068_78_L000079 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jkn_690eda36_getfield_L000068_69)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkn_690eda36_getfield_L000068_76
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jkn_690eda36_getfield_L000068_71)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkn_690eda36_getfield_L000068_70
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s9jkn_690eda36_getfield_L000068_85)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $7fffffff ' reg <- con
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s9jkn_690eda36_getfield_L000068_87)<<S32 ' GTU4 reg reg
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s9jkn_690eda36_getfield_L000068_88)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkn_690eda36_getfield_L000068_87
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s9jkn_690eda36_getfield_L000068_88
 word I16A_MOV + (r13)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jkn_690eda36_getfield_L000068_86)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkn_690eda36_getfield_L000068_85
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long -2147483648 ' reg <- con
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_CMPS + (r22)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s9jkn_690eda36_getfield_L000068_89)<<S32 ' GTI4 reg reg
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s9jkn_690eda36_getfield_L000068_90)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkn_690eda36_getfield_L000068_89
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s9jkn_690eda36_getfield_L000068_90
 word I16A_MOV + (r13)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s9jkn_690eda36_getfield_L000068_86
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jkn_690eda36_getfield_L000068_80)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s9jkn_690eda36_getfield_L000068_91_L000092 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jkn_690eda36_getfield_L000068_69)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkn_690eda36_getfield_L000068_80
 word I16A_SUBS + (r15)<<D16A + (r17)<<S16A ' SUBI/P (1)
 alignl_label
C_s9jkn_690eda36_getfield_L000068_71
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s9jkn_690eda36_getfield_L000068_69
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jkr_690eda36_checkoption_L000093 ' <symbol:checkoption>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long @C_s9jkr_690eda36_checkoption_L000093_95_L000096 ' reg <- addrg
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s9jkr_690eda36_checkoption_L000093_100)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkr_690eda36_checkoption_L000093_97
 word I16A_RDBYTE + (r22)<<D16A + (r13)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (124)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jkr_690eda36_checkoption_L000093_101)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s9jkr_690eda36_checkoption_L000093_102)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkr_690eda36_checkoption_L000093_101
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_memcmp)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jkr_690eda36_checkoption_L000093_103)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r21)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_s9jkr_690eda36_checkoption_L000093_94)<<S32 ' JUMPV addrg
 alignl_label
C_s9jkr_690eda36_checkoption_L000093_103
 alignl_label
C_s9jkr_690eda36_checkoption_L000093_102
' C_s9jkr_690eda36_checkoption_L000093_98 ' (symbol refcount = 0)
 word I16A_ADDS + (r13)<<D16A + (r15)<<S16A ' ADDI/P (2)
 alignl_label
C_s9jkr_690eda36_checkoption_L000093_100
 word I16A_RDBYTE + (r22)<<D16A + (r13)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jkr_690eda36_checkoption_L000093_105)<<S32 ' EQI4 reg coni
 word I16A_CMPS + (r15)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s9jkr_690eda36_checkoption_L000093_97)<<S32 ' LEI4 reg reg
 alignl_label
C_s9jkr_690eda36_checkoption_L000093_105
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s9jkr_690eda36_checkoption_L000093_106_L000107 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s9jkr_690eda36_checkoption_L000093_94
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jku_690eda36_l_checktime_L000108 ' <symbol:l_checktime>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jku_690eda36_l_checktime_L000108_112)<<S32 ' EQU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s9jku_690eda36_l_checktime_L000108_110_L000111 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s9jku_690eda36_l_checktime_L000108_112
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_s9jku_690eda36_l_checktime_L000108_109 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk10_690eda36_os_date_L000113 ' <symbol:os_date>
 alignl_p1
 long I32_NEWF + 320<<S32
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s9jk10_690eda36_os_date_L000113_115_L000116 ' reg ARG ADDRG
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s9jk10_690eda36_os_date_L000113_118)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_time)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jk10_690eda36_os_date_L000113_119)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_118
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s9jku_690eda36_l_checktime_L000108)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s9jk10_690eda36_os_date_L000113_119
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r19)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (33)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk10_690eda36_os_date_L000113_120)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_gmtime)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s9jk10_690eda36_os_date_L000113_121)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_120
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_localtime)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s9jk10_690eda36_os_date_L000113_121
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk10_690eda36_os_date_L000113_122)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s9jk10_690eda36_os_date_L000113_124_L000125 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jk10_690eda36_os_date_L000113_114)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_122
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s9jk10_690eda36_os_date_L000113_128_L000129 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk10_690eda36_os_date_L000113_126)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (9)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s9jkc_690eda36_setallfields_L000043)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s9jk10_690eda36_os_date_L000113_127)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_126
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(37)<<S32 ' reg <- conli
 alignl_p1
 long I32_LODF + ((-324)&$FFFFFF)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl32 reg
 alignl_p1
 long I32_LODF + ((-320)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__buffinit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s9jk10_690eda36_os_date_L000113_131)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_130
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jk10_690eda36_os_date_L000113_133)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODF + ((-312)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 alignl_p1
 long I32_LODF + ((-316)&$FFFFFF)<<S32
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s9jk10_690eda36_os_date_L000113_138)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODF + ((-320)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__prepbuffsize)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_138
 alignl_p1
 long I32_LODF + ((-312)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_p1
 long I32_LODF + ((-312)&$FFFFFF)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODF + ((-320)&$FFFFFF)<<S32
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s9jk10_690eda36_os_date_L000113_134)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_133
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (250)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODF + ((-320)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__prepbuffsize)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODF + ((-323)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jkr_690eda36_checkoption_L000093)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-324)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (250)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_strftime)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-312)&$FFFFFF)<<S32
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32
 word I16A_ADD + (r22)<<D16A + (r13)<<S16A ' ADDU (1)
 alignl_p1
 long I32_LODF + ((-312)&$FFFFFF)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_134
 alignl_label
C_s9jk10_690eda36_os_date_L000113_131
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s9jk10_690eda36_os_date_L000113_130)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_LODF + ((-320)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaL__pushresult)<<S32 ' CALL addrg
 alignl_label
C_s9jk10_690eda36_os_date_L000113_127
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_s9jk10_690eda36_os_date_L000113_114
 word I16B_POPM + 80<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk14_690eda36_os_time_L000141 ' <symbol:os_time>
 alignl_p1
 long I32_NEWF + 36<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s9jk14_690eda36_os_time_L000141_143)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_time)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jk14_690eda36_os_time_L000141_144)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk14_690eda36_os_time_L000141_143
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((1900)&$7FFFF)<<S32 ' reg ARG cons
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_45_L000046 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jkn_690eda36_getfield_L000068)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_47_L000048 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jkn_690eda36_getfield_L000068)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_49_L000050 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jkn_690eda36_getfield_L000068)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (12)<<S16A ' reg ARG coni
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_51_L000052 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jkn_690eda36_getfield_L000068)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_53_L000054 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jkn_690eda36_getfield_L000068)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_55_L000056 ' reg ARG ADDRG
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s9jkn_690eda36_getfield_L000068)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s9jkc_690eda36_setallfields_L000043_61_L000062 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s9jkm_690eda36_getboolfield_L000063)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_mktime)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s9jkc_690eda36_setallfields_L000043)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s9jk14_690eda36_os_time_L000141_144
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk14_690eda36_os_time_L000141_153)<<S32 ' NEU4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk14_690eda36_os_time_L000141_151)<<S32 ' NEU4 reg reg
 alignl_label
C_s9jk14_690eda36_os_time_L000141_153
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s9jk14_690eda36_os_time_L000141_154_L000155 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s9jk14_690eda36_os_time_L000141_142)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk14_690eda36_os_time_L000141_151
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_s9jk14_690eda36_os_time_L000141_142
 word I16B_POPM + 9<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk16_690eda36_os_difftime_L000156 ' <symbol:os_difftime>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s9jku_690eda36_l_checktime_L000108)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s9jku_690eda36_l_checktime_L000108)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_difftime)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_s9jk16_690eda36_os_difftime_L000156_157 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158_cat_L000161 ' <symbol:cat>
 long 1
 long 2
 long 3
 long 4
 long 5
 long 6

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158_catnames_L000163 ' <symbol:catnames>
 long @C_s9jk17_690eda36_os_setlocale_L000158_164_L000165
 long @C_s9jk17_690eda36_os_setlocale_L000158_166_L000167
 long @C_s9jk17_690eda36_os_setlocale_L000158_168_L000169
 long @C_s9jk17_690eda36_os_setlocale_L000158_170_L000171
 long @C_s9jk17_690eda36_os_setlocale_L000158_172_L000173
 long @C_s9jk17_690eda36_os_setlocale_L000158_174_L000175
 long $0

' Catalina Code

DAT ' code segment

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158 ' <symbol:os_setlocale>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s9jk17_690eda36_os_setlocale_L000158_catnames_L000163 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s9jk17_690eda36_os_setlocale_L000158_164_L000165 ' reg ARG ADDRG
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__checkoption)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s9jk17_690eda36_os_setlocale_L000158_cat_L000161 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_setlocale)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_s9jk17_690eda36_os_setlocale_L000158_159 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s9jk1g_690eda36_os_exit_L000176 ' <symbol:os_exit>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s9jk1g_690eda36_os_exit_L000176_178)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jk1g_690eda36_os_exit_L000176_181)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s9jk1g_690eda36_os_exit_L000176_182)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk1g_690eda36_os_exit_L000176_181
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C_s9jk1g_690eda36_os_exit_L000176_182
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s9jk1g_690eda36_os_exit_L000176_179)<<S32 ' JUMPV addrg
 alignl_label
C_s9jk1g_690eda36_os_exit_L000176_178
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_s9jk1g_690eda36_os_exit_L000176_179
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jk1g_690eda36_os_exit_L000176_183)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_close)<<S32 ' CALL addrg
 alignl_label
C_s9jk1g_690eda36_os_exit_L000176_183
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s9jk1g_690eda36_os_exit_L000176_185)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_exit)<<S32 ' CALL addrg
 alignl_label
C_s9jk1g_690eda36_os_exit_L000176_185
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_s9jk1g_690eda36_os_exit_L000176_177 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s9jk1h_690eda36_syslib_L000187 ' <symbol:syslib>
 long @C_s9jk1i_690eda36_188_L000189
 long @C_s9jk7_690eda36_os_clock_L000031
 long @C_s9jk1j_690eda36_190_L000191
 long @C_s9jk10_690eda36_os_date_L000113
 long @C_s9jk1k_690eda36_192_L000193
 long @C_s9jk16_690eda36_os_difftime_L000156
 long @C_s9jk1l_690eda36_194_L000195
 long @C_s9jk_690eda36_os_execute_L000004
 long @C_s9jk1m_690eda36_196_L000197
 long @C_s9jk1g_690eda36_os_exit_L000176
 long @C_s9jk1n_690eda36_198_L000199
 long @C_s9jk6_690eda36_os_getenv_L000029
 long @C_s9jk1o_690eda36_200_L000201
 long @C_s9jk1_690eda36_os_remove_L000008
 long @C_s9jk1p_690eda36_202_L000203
 long @C_s9jk2_690eda36_os_rename_L000013
 long @C_s9jk1q_690eda36_204_L000205
 long @C_s9jk17_690eda36_os_setlocale_L000158
 long @C_s9jk17_690eda36_os_setlocale_L000158_174_L000175
 long @C_s9jk14_690eda36_os_time_L000141
 long @C_s9jk1r_690eda36_206_L000207
 long @C_s9jk3_690eda36_os_tmpname_L000018
 long $0
 long $0

' Catalina Export luaopen_os

' Catalina Code

DAT ' code segment

 alignl_label
C_luaopen_os ' <symbol:luaopen_os>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (68)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODI + (@C_luaopen_os_209_L000210)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checkversion_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s9jk1h_690eda36_syslib_L000187 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__setfuncs)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_luaopen_os_208 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

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

 alignl_label
C_luaopen_os_209_L000210 ' <symbol:209>
 long $43fc0000 ' float

 alignl_label
C_s9jk1r_690eda36_206_L000207 ' <symbol:206>
 byte 116
 byte 109
 byte 112
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl_label
C_s9jk1q_690eda36_204_L000205 ' <symbol:204>
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

 alignl_label
C_s9jk1p_690eda36_202_L000203 ' <symbol:202>
 byte 114
 byte 101
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl_label
C_s9jk1o_690eda36_200_L000201 ' <symbol:200>
 byte 114
 byte 101
 byte 109
 byte 111
 byte 118
 byte 101
 byte 0

 alignl_label
C_s9jk1n_690eda36_198_L000199 ' <symbol:198>
 byte 103
 byte 101
 byte 116
 byte 101
 byte 110
 byte 118
 byte 0

 alignl_label
C_s9jk1m_690eda36_196_L000197 ' <symbol:196>
 byte 101
 byte 120
 byte 105
 byte 116
 byte 0

 alignl_label
C_s9jk1l_690eda36_194_L000195 ' <symbol:194>
 byte 101
 byte 120
 byte 101
 byte 99
 byte 117
 byte 116
 byte 101
 byte 0

 alignl_label
C_s9jk1k_690eda36_192_L000193 ' <symbol:192>
 byte 100
 byte 105
 byte 102
 byte 102
 byte 116
 byte 105
 byte 109
 byte 101
 byte 0

 alignl_label
C_s9jk1j_690eda36_190_L000191 ' <symbol:190>
 byte 100
 byte 97
 byte 116
 byte 101
 byte 0

 alignl_label
C_s9jk1i_690eda36_188_L000189 ' <symbol:188>
 byte 99
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158_174_L000175 ' <symbol:174>
 byte 116
 byte 105
 byte 109
 byte 101
 byte 0

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158_172_L000173 ' <symbol:172>
 byte 110
 byte 117
 byte 109
 byte 101
 byte 114
 byte 105
 byte 99
 byte 0

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158_170_L000171 ' <symbol:170>
 byte 109
 byte 111
 byte 110
 byte 101
 byte 116
 byte 97
 byte 114
 byte 121
 byte 0

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158_168_L000169 ' <symbol:168>
 byte 99
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158_166_L000167 ' <symbol:166>
 byte 99
 byte 111
 byte 108
 byte 108
 byte 97
 byte 116
 byte 101
 byte 0

 alignl_label
C_s9jk17_690eda36_os_setlocale_L000158_164_L000165 ' <symbol:164>
 byte 97
 byte 108
 byte 108
 byte 0

 alignl_label
C_s9jk14_690eda36_os_time_L000141_154_L000155 ' <symbol:154>
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

 alignl_label
C_s9jk10_690eda36_os_date_L000113_128_L000129 ' <symbol:128>
 byte 42
 byte 116
 byte 0

 alignl_label
C_s9jk10_690eda36_os_date_L000113_124_L000125 ' <symbol:124>
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

 alignl_label
C_s9jk10_690eda36_os_date_L000113_115_L000116 ' <symbol:115>
 byte 37
 byte 99
 byte 0

 alignl_label
C_s9jku_690eda36_l_checktime_L000108_110_L000111 ' <symbol:110>
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

 alignl_label
C_s9jkr_690eda36_checkoption_L000093_106_L000107 ' <symbol:106>
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

 alignl_label
C_s9jkr_690eda36_checkoption_L000093_95_L000096 ' <symbol:95>
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

 alignl_label
C_s9jkn_690eda36_getfield_L000068_91_L000092 ' <symbol:91>
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

 alignl_label
C_s9jkn_690eda36_getfield_L000068_78_L000079 ' <symbol:78>
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

 alignl_label
C_s9jkn_690eda36_getfield_L000068_74_L000075 ' <symbol:74>
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

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_61_L000062 ' <symbol:61>
 byte 105
 byte 115
 byte 100
 byte 115
 byte 116
 byte 0

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_59_L000060 ' <symbol:59>
 byte 119
 byte 100
 byte 97
 byte 121
 byte 0

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_57_L000058 ' <symbol:57>
 byte 121
 byte 100
 byte 97
 byte 121
 byte 0

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_55_L000056 ' <symbol:55>
 byte 115
 byte 101
 byte 99
 byte 0

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_53_L000054 ' <symbol:53>
 byte 109
 byte 105
 byte 110
 byte 0

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_51_L000052 ' <symbol:51>
 byte 104
 byte 111
 byte 117
 byte 114
 byte 0

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_49_L000050 ' <symbol:49>
 byte 100
 byte 97
 byte 121
 byte 0

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_47_L000048 ' <symbol:47>
 byte 109
 byte 111
 byte 110
 byte 116
 byte 104
 byte 0

 alignl_label
C_s9jkc_690eda36_setallfields_L000043_45_L000046 ' <symbol:45>
 byte 121
 byte 101
 byte 97
 byte 114
 byte 0

 alignl_label
C_s9jk7_690eda36_os_clock_L000031_35_L000036 ' <symbol:35>
 long $447a0000 ' float

 alignl_label
C_s9jk7_690eda36_os_clock_L000031_33_L000034 ' <symbol:33>
 long $40000000 ' float

 alignl_label
C_s9jk3_690eda36_os_tmpname_L000018_27_L000028 ' <symbol:27>
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

 alignl_label
C_s9jk3_690eda36_os_tmpname_L000018_20_L000021 ' <symbol:20>
 byte 47
 byte 116
 byte 109
 byte 112
 byte 47
 byte 0

' Catalina Code

DAT ' code segment
' end
