' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_srqs_68804f51_luaB__print_L000004 ' <symbol:luaB_print>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_srqs_68804f51_luaB__print_L000004_9)<<S32 ' JUMPV addrg
 alignl_label
C_srqs_68804f51_luaB__print_L000004_6
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRBE + (@C_srqs_68804f51_luaB__print_L000004_10)<<S32 ' LEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stdout ' reg ARG ADDRG
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_srqs_68804f51_luaB__print_L000004_12_L000013 ' reg ARG ADDRG
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_fwrite)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_label
C_srqs_68804f51_luaB__print_L000004_10
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stdout ' reg ARG ADDRG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_fwrite)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_srqs_68804f51_luaB__print_L000004_7 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_srqs_68804f51_luaB__print_L000004_9
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRBE + (@C_srqs_68804f51_luaB__print_L000004_6)<<S32 ' LEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stdout ' reg ARG ADDRG
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_srqs_68804f51_luaB__print_L000004_14_L000015 ' reg ARG ADDRG
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_fwrite)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C___stdout ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_srqs_68804f51_luaB__print_L000004_5 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs3_68804f51_luaB__warn_L000016 ' <symbol:luaB_warn>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r21)<<D16A + (2)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_srqs3_68804f51_luaB__warn_L000016_21)<<S32 ' JUMPV addrg
 alignl_label
C_srqs3_68804f51_luaB__warn_L000016_18
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_srqs3_68804f51_luaB__warn_L000016_19 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_srqs3_68804f51_luaB__warn_L000016_21
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRBE + (@C_srqs3_68804f51_luaB__warn_L000016_18)<<S32 ' LEI4 reg reg
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_srqs3_68804f51_luaB__warn_L000016_25)<<S32 ' JUMPV addrg
 alignl_label
C_srqs3_68804f51_luaB__warn_L000016_22
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_warning)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_srqs3_68804f51_luaB__warn_L000016_23 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_srqs3_68804f51_luaB__warn_L000016_25
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C_srqs3_68804f51_luaB__warn_L000016_22)<<S32 ' LTI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_warning)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_srqs3_68804f51_luaB__warn_L000016_17 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs4_68804f51_b_str2int_L000026 ' <symbol:b_str2int>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs4_68804f51_b_str2int_L000026_28_L000029 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strspn)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDS + (r23)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs4_68804f51_b_str2int_L000026_30)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_srqs4_68804f51_b_str2int_L000026_31)<<S32 ' JUMPV addrg
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_30
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs4_68804f51_b_str2int_L000026_32)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_32
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_31
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs4_68804f51_b_str2int_L000026_34)<<S32 ' NEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_srqs4_68804f51_b_str2int_L000026_27)<<S32 ' JUMPV addrg
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_34
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_37
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_CMPI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BRAE + (@C_srqs4_68804f51_b_str2int_L000026_41)<<S32 ' GEU4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r13)<<D16A + (r20)<<S16A ' SUBI/P (3)
 alignl_p1
 long I32_JMPA + (@C_srqs4_68804f51_b_str2int_L000026_42)<<S32 ' JUMPV addrg
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_41
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_toupper)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((65)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r13)<<D16A + (10)<<S16A ' ADDI4 reg coni
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_42
 word I16A_MOV + (r15)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r15)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_B + (@C_srqs4_68804f51_b_str2int_L000026_43)<<S32 ' LTI4 reg reg
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_srqs4_68804f51_b_str2int_L000026_27)<<S32 ' JUMPV addrg
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_43
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' ADDU
 word I16A_ADD + (r17)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
' C_srqs4_68804f51_b_str2int_L000026_38 ' (symbol refcount = 0)
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___ctype+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs4_68804f51_b_str2int_L000026_37)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs4_68804f51_b_str2int_L000026_28_L000029 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strspn)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDS + (r23)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs4_68804f51_b_str2int_L000026_47)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r15)<<D16A + (r17)<<S16A ' SUBU (3)
 alignl_p1
 long I32_JMPA + (@C_srqs4_68804f51_b_str2int_L000026_48)<<S32 ' JUMPV addrg
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_47
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_48
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_srqs4_68804f51_b_str2int_L000026_27
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049 ' <symbol:luaB_tonumber>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_srqs6_68804f51_luaB__tonumber_L000049_51)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs6_68804f51_luaB__tonumber_L000049_53)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqs6_68804f51_luaB__tonumber_L000049_50)<<S32 ' JUMPV addrg
 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049_53
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs6_68804f51_luaB__tonumber_L000049_55)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_stringtonumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_CMP + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs6_68804f51_luaB__tonumber_L000049_55)<<S32 ' NEU4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqs6_68804f51_luaB__tonumber_L000049_50)<<S32 ' JUMPV addrg
 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049_55
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_srqs6_68804f51_luaB__tonumber_L000049_52)<<S32 ' JUMPV addrg
 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049_51
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_srqs6_68804f51_luaB__tonumber_L000049_60)<<S32 ' GTI4 reg reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (36)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRBE + (@C_srqs6_68804f51_luaB__tonumber_L000049_59)<<S32 ' LEI4 reg coni
 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049_60
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs6_68804f51_luaB__tonumber_L000049_57_L000058 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049_59
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_srqs4_68804f51_b_str2int_L000026)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs6_68804f51_luaB__tonumber_L000049_61)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqs6_68804f51_luaB__tonumber_L000049_50)<<S32 ' JUMPV addrg
 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049_61
 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049_52
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_srqs6_68804f51_luaB__tonumber_L000049_50
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs8_68804f51_luaB__error_L000063 ' <symbol:luaB_error>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
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
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs8_68804f51_luaB__error_L000063_65)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_srqs8_68804f51_luaB__error_L000063_65)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__where)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_concat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_srqs8_68804f51_luaB__error_L000063_65
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_error)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_srqs8_68804f51_luaB__error_L000063_64 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs9_68804f51_luaB__getmetatable_L000067 ' <symbol:luaB_getmetatable>
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
 long I32_BRNZ + (@C_srqs9_68804f51_luaB__getmetatable_L000067_69)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqs9_68804f51_luaB__getmetatable_L000067_68)<<S32 ' JUMPV addrg
 alignl_label
C_srqs9_68804f51_luaB__getmetatable_L000067_69
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs9_68804f51_luaB__getmetatable_L000067_71_L000072 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__getmetafield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_srqs9_68804f51_luaB__getmetatable_L000067_68
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqsb_68804f51_luaB__setmetatable_L000073 ' <symbol:luaB_setmetatable>
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
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqsb_68804f51_luaB__setmetatable_L000073_77)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqsb_68804f51_luaB__setmetatable_L000073_77)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqsb_68804f51_luaB__setmetatable_L000073_75_L000076 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__typeerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_srqsb_68804f51_luaB__setmetatable_L000073_77
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs9_68804f51_luaB__getmetatable_L000067_71_L000072 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__getmetafield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqsb_68804f51_luaB__setmetatable_L000073_78)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqsb_68804f51_luaB__setmetatable_L000073_80_L000081 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_srqsb_68804f51_luaB__setmetatable_L000073_74)<<S32 ' JUMPV addrg
 alignl_label
C_srqsb_68804f51_luaB__setmetatable_L000073_78
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
 alignl_label
C_srqsb_68804f51_luaB__setmetatable_L000073_74
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqse_68804f51_luaB__rawequal_L000082 ' <symbol:luaB_rawequal>
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
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rawequal)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_srqse_68804f51_luaB__rawequal_L000082_83 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqsf_68804f51_luaB__rawlen_L000084 ' <symbol:luaB_rawlen>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqsf_68804f51_luaB__rawlen_L000084_88)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqsf_68804f51_luaB__rawlen_L000084_88)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqsf_68804f51_luaB__rawlen_L000084_86_L000087 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__typeerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_srqsf_68804f51_luaB__rawlen_L000084_88
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_rawlen)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_srqsf_68804f51_luaB__rawlen_L000084_85 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqsh_68804f51_luaB__rawget_L000089 ' <symbol:luaB_rawget>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
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
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_rawget)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_srqsh_68804f51_luaB__rawget_L000089_90 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqsi_68804f51_luaB__rawset_L000091 ' <symbol:luaB_rawset>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
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
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_rawset)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_srqsi_68804f51_luaB__rawset_L000091_92 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqsj_68804f51_pushmode_L000093 ' <symbol:pushmode>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqsj_68804f51_pushmode_L000093_95)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_srqsj_68804f51_pushmode_L000093_96)<<S32 ' JUMPV addrg
 alignl_label
C_srqsj_68804f51_pushmode_L000093_95
 word I16A_CMPSI + (r21)<<D16A + (11)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqsj_68804f51_pushmode_L000093_102)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r19)<<D16B
 alignl_p1
 long @C_srqsj_68804f51_pushmode_L000093_97_L000098 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_srqsj_68804f51_pushmode_L000093_103)<<S32 ' JUMPV addrg
 alignl_label
C_srqsj_68804f51_pushmode_L000093_102
 word I16B_LODL + (r19)<<D16B
 alignl_p1
 long @C_srqsj_68804f51_pushmode_L000093_99_L000100 ' reg <- addrg
 alignl_label
C_srqsj_68804f51_pushmode_L000093_103
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_srqsj_68804f51_pushmode_L000093_96
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_srqsj_68804f51_pushmode_L000093_94 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_opts_L000107 ' <symbol:opts>
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_108_L000109
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_110_L000111
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_112_L000113
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_114_L000115
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_116_L000117
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_118_L000119
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_120_L000121
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_122_L000123
 long @C_srqsj_68804f51_pushmode_L000093_99_L000100
 long @C_srqsj_68804f51_pushmode_L000093_97_L000098
 long $0

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_optsnum_L000125 ' <symbol:optsnum>
 long 0
 long 1
 long 2
 long 3
 long 5
 long 6
 long 7
 long 9
 long 10
 long 11

' Catalina Code

DAT ' code segment

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104 ' <symbol:luaB_collectgarbage>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_opts_L000107 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_112_L000113 ' reg ARG ADDRG
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__checkoption)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_optsnum_L000125 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_B + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_126)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (11)<<S16A
 alignl_p1
 long I32_BR_A + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_126)<<S32 ' GTI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_146_L000148-12 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_146_L000148 ' <symbol:146>
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_128
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_126
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_133
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_136
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_136
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_126
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_139
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_142
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104_143

' Catalina Code

DAT ' code segment
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_128
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_129)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_127)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_129
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 alignl_p1
 long I32_LODI + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_131_L000132)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushnumber)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_105)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_133
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_134)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_127)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_134
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_105)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_136
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_137)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_127)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_137
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_105)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_139
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_140)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_127)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_140
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_105)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_142
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_srqsj_68804f51_pushmode_L000093)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_105)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_143
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_srqsj_68804f51_pushmode_L000093)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_105)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_126
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_gc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_144)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_127)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_144
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqsm_68804f51_luaB__collectgarbage_L000104_105)<<S32 ' JUMPV addrg
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_127
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_105
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs14_68804f51_luaB__type_L000150 ' <symbol:luaB_type>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs14_68804f51_luaB__type_L000150_154)<<S32 ' NEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs14_68804f51_luaB__type_L000150_152_L000153 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_srqs14_68804f51_luaB__type_L000150_154
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_typename)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_srqs14_68804f51_luaB__type_L000150_151 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs16_68804f51_luaB__next_L000155 ' <symbol:luaB_next>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
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
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_next)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs16_68804f51_luaB__next_L000155_157)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqs16_68804f51_luaB__next_L000155_156)<<S32 ' JUMPV addrg
 alignl_label
C_srqs16_68804f51_luaB__next_L000155_157
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_srqs16_68804f51_luaB__next_L000155_156
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs17_68804f51_pairscont_L000159 ' <symbol:pairscont>
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
' C_srqs17_68804f51_pairscont_L000159_160 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

 alignl_label
C_srqs18_68804f51_luaB__pairs_L000161 ' <symbol:luaB_pairs>
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
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs18_68804f51_luaB__pairs_L000161_165_L000166 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__getmetafield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs18_68804f51_luaB__pairs_L000161_163)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_srqs16_68804f51_luaB__next_L000155 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_pushcclosure)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_srqs18_68804f51_luaB__pairs_L000161_164)<<S32 ' JUMPV addrg
 alignl_label
C_srqs18_68804f51_luaB__pairs_L000161_163
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs17_68804f51_pairscont_L000159 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r4)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOVI + (r5)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_callk)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_label
C_srqs18_68804f51_luaB__pairs_L000161_164
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
' C_srqs18_68804f51_luaB__pairs_L000161_162 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1a_68804f51_ipairsaux_L000167 ' <symbol:ipairsaux>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_geti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs1a_68804f51_ipairsaux_L000167_170)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_srqs1a_68804f51_ipairsaux_L000167_171)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1a_68804f51_ipairsaux_L000167_170
 word I16A_MOVI + (r19)<<D16A + (2)<<S16A ' reg <- coni
 alignl_label
C_srqs1a_68804f51_ipairsaux_L000167_171
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_srqs1a_68804f51_ipairsaux_L000167_168 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1b_68804f51_luaB__ipairs_L000172 ' <symbol:luaB_ipairs>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_srqs1a_68804f51_ipairsaux_L000167 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_pushcclosure)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
' C_srqs1b_68804f51_luaB__ipairs_L000172_173 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1c_68804f51_load_aux_L000174 ' <symbol:load_aux>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs1c_68804f51_load_aux_L000174_176)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs1c_68804f51_load_aux_L000174_178)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setupvalue)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs1c_68804f51_load_aux_L000174_180)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_srqs1c_68804f51_load_aux_L000174_180
 alignl_label
C_srqs1c_68804f51_load_aux_L000174_178
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqs1c_68804f51_load_aux_L000174_175)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1c_68804f51_load_aux_L000174_176
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl_label
C_srqs1c_68804f51_load_aux_L000174_175
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1d_68804f51_luaB__loadfile_L000182 ' <symbol:luaB_loadfile>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
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
 long 0 ' reg ARG con
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs1d_68804f51_luaB__loadfile_L000182_185)<<S32 ' EQI4 reg reg
 word I16A_MOVI + (r21)<<D16A + (3)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_srqs1d_68804f51_luaB__loadfile_L000182_186)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1d_68804f51_luaB__loadfile_L000182_185
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_srqs1d_68804f51_luaB__loadfile_L000182_186
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__loadfilex)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_srqs1c_68804f51_load_aux_L000174)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_srqs1d_68804f51_luaB__loadfile_L000182_183 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1e_68804f51_generic_reader_L000187 ' <symbol:generic_reader>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs1e_68804f51_generic_reader_L000187_189_L000190 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_callk)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs1e_68804f51_generic_reader_L000187_191)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_srqs1e_68804f51_generic_reader_L000187_188)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1e_68804f51_generic_reader_L000187_191
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_isstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs1e_68804f51_generic_reader_L000187_193)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs1e_68804f51_generic_reader_L000187_195_L000196 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_srqs1e_68804f51_generic_reader_L000187_193
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_copy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_srqs1e_68804f51_generic_reader_L000187_188
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1h_68804f51_luaB__load_L000197 ' <symbol:luaB_load>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_srqs1h_68804f51_luaB__load_L000197_199_L000200 ' reg ARG ADDRG
 word I16A_MOVI + (r4)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs1h_68804f51_luaB__load_L000197_202)<<S32 ' EQI4 reg reg
 word I16A_MOVI + (r19)<<D16A + (4)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_srqs1h_68804f51_luaB__load_L000197_203)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1h_68804f51_luaB__load_L000197_202
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_srqs1h_68804f51_luaB__load_L000197_203
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs1h_68804f51_luaB__load_L000197_204)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaL__loadbufferx)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_srqs1h_68804f51_luaB__load_L000197_205)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1h_68804f51_luaB__load_L000197_204
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_srqs1h_68804f51_luaB__load_L000197_206_L000207 ' reg ARG ADDRG
 word I16A_MOVI + (r4)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaL__optlstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_srqs1e_68804f51_generic_reader_L000187 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_load)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_srqs1h_68804f51_luaB__load_L000197_205
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_srqs1c_68804f51_load_aux_L000174)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_srqs1h_68804f51_luaB__load_L000197_198 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1k_68804f51_dofilecont_L000208 ' <symbol:dofilecont>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r0)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_srqs1k_68804f51_dofilecont_L000208_209 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1l_68804f51_luaB__dofile_L000210 ' <symbol:luaB_dofile>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
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
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__loadfilex)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs1l_68804f51_luaB__dofile_L000210_212)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_error)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_srqs1l_68804f51_luaB__dofile_L000210_211)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1l_68804f51_luaB__dofile_L000210_212
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs1k_68804f51_dofilecont_L000208 ' reg ARG ADDRG
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r4)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_callk)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_srqs1k_68804f51_dofilecont_L000208)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_srqs1l_68804f51_luaB__dofile_L000210_211
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1m_68804f51_luaB__assert_L000214 ' <symbol:luaB_assert>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs1m_68804f51_luaB__assert_L000214_216)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_srqs1m_68804f51_luaB__assert_L000214_215)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1m_68804f51_luaB__assert_L000214_216
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
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
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs1m_68804f51_luaB__assert_L000214_218_L000219 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_settop)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_srqs8_68804f51_luaB__error_L000063)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_srqs1m_68804f51_luaB__assert_L000214_215
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1o_68804f51_luaB__select_L000220 ' <symbol:luaB_select>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_type)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs1o_68804f51_luaB__select_L000220_222)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_RDBYTE + (r22)<<D16A + (r0)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (35)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_srqs1o_68804f51_luaB__select_L000220_222)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqs1o_68804f51_luaB__select_L000220_221)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1o_68804f51_luaB__select_L000220_222
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_srqs1o_68804f51_luaB__select_L000220_224)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_srqs1o_68804f51_luaB__select_L000220_225)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1o_68804f51_luaB__select_L000220_224
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_srqs1o_68804f51_luaB__select_L000220_226)<<S32 ' LEI4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r21)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_label
C_srqs1o_68804f51_luaB__select_L000220_226
 alignl_label
C_srqs1o_68804f51_luaB__select_L000220_225
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRBE + (@C_srqs1o_68804f51_luaB__select_L000220_230)<<S32 ' LEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs1o_68804f51_luaB__select_L000220_228_L000229 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_srqs1o_68804f51_luaB__select_L000220_230
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r21)<<S16A ' SUBI/P (3)
 alignl_label
C_srqs1o_68804f51_luaB__select_L000220_221
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1q_68804f51_finishpcall_L000231 ' <symbol:finishpcall>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs1q_68804f51_finishpcall_L000231_233)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_srqs1q_68804f51_finishpcall_L000231_233)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_srqs1q_68804f51_finishpcall_L000231_232)<<S32 ' JUMPV addrg
 alignl_label
C_srqs1q_68804f51_finishpcall_L000231_233
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r19)<<S16A ' SUBI/P (3)
 alignl_label
C_srqs1q_68804f51_finishpcall_L000231_232
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1r_68804f51_luaB__pcall_L000235 ' <symbol:luaB_pcall>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
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
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs1q_68804f51_finishpcall_L000231 ' reg ARG ADDRG
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r5)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (2)<<S16A ' SUBI4 reg coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_pcallk)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_srqs1q_68804f51_finishpcall_L000231)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_srqs1r_68804f51_luaB__pcall_L000235_236 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1s_68804f51_luaB__xpcall_L000237 ' <symbol:luaB_xpcall>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checktype)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rotate)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs1q_68804f51_finishpcall_L000231 ' reg ARG ADDRG
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r5)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBSI + (r22)<<D16A + (2)<<S16A ' SUBI4 reg coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_lua_pcallk)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_srqs1q_68804f51_finishpcall_L000231)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_srqs1s_68804f51_luaB__xpcall_L000237_238 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_srqs1t_68804f51_luaB__tostring_L000239 ' <symbol:luaB_tostring>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkany)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__tolstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_srqs1t_68804f51_luaB__tostring_L000239_240 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_srqs1u_68804f51_base_funcs_L000241 ' <symbol:base_funcs>
 long @C_srqs1v_68804f51_242_L000243
 long @C_srqs1m_68804f51_luaB__assert_L000214
 long @C_srqs20_68804f51_244_L000245
 long @C_srqsm_68804f51_luaB__collectgarbage_L000104
 long @C_srqs21_68804f51_246_L000247
 long @C_srqs1l_68804f51_luaB__dofile_L000210
 long @C_srqs22_68804f51_248_L000249
 long @C_srqs8_68804f51_luaB__error_L000063
 long @C_srqs23_68804f51_250_L000251
 long @C_srqs9_68804f51_luaB__getmetatable_L000067
 long @C_srqs24_68804f51_252_L000253
 long @C_srqs1b_68804f51_luaB__ipairs_L000172
 long @C_srqs25_68804f51_254_L000255
 long @C_srqs1d_68804f51_luaB__loadfile_L000182
 long @C_srqs26_68804f51_256_L000257
 long @C_srqs1h_68804f51_luaB__load_L000197
 long @C_srqs27_68804f51_258_L000259
 long @C_srqs16_68804f51_luaB__next_L000155
 long @C_srqs28_68804f51_260_L000261
 long @C_srqs18_68804f51_luaB__pairs_L000161
 long @C_srqs29_68804f51_262_L000263
 long @C_srqs1r_68804f51_luaB__pcall_L000235
 long @C_srqs2a_68804f51_264_L000265
 long @C_srqs_68804f51_luaB__print_L000004
 long @C_srqs2b_68804f51_266_L000267
 long @C_srqs3_68804f51_luaB__warn_L000016
 long @C_srqs2c_68804f51_268_L000269
 long @C_srqse_68804f51_luaB__rawequal_L000082
 long @C_srqs2d_68804f51_270_L000271
 long @C_srqsf_68804f51_luaB__rawlen_L000084
 long @C_srqs2e_68804f51_272_L000273
 long @C_srqsh_68804f51_luaB__rawget_L000089
 long @C_srqs2f_68804f51_274_L000275
 long @C_srqsi_68804f51_luaB__rawset_L000091
 long @C_srqs2g_68804f51_276_L000277
 long @C_srqs1o_68804f51_luaB__select_L000220
 long @C_srqs2h_68804f51_278_L000279
 long @C_srqsb_68804f51_luaB__setmetatable_L000073
 long @C_srqs2i_68804f51_280_L000281
 long @C_srqs6_68804f51_luaB__tonumber_L000049
 long @C_srqs2j_68804f51_282_L000283
 long @C_srqs1t_68804f51_luaB__tostring_L000239
 long @C_srqs2k_68804f51_284_L000285
 long @C_srqs14_68804f51_luaB__type_L000150
 long @C_srqs2l_68804f51_286_L000287
 long @C_srqs1s_68804f51_luaB__xpcall_L000237
 long @C_srqs2m_68804f51_288_L000289
 long $0
 long @C_srqs2n_68804f51_290_L000291
 long $0
 long $0
 long $0

' Catalina Export luaopen_base

' Catalina Code

DAT ' code segment

 alignl_label
C_luaopen_base ' <symbol:luaopen_base>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long -1001000 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_rawgeti)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_srqs1u_68804f51_base_funcs_L000241 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__setfuncs)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs2m_68804f51_288_L000289 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_luaopen_base_293_L000294 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushstring)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_srqs2n_68804f51_290_L000291 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_luaopen_base_292 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import luaL_setfuncs

' Catalina Import luaL_loadbufferx

' Catalina Import luaL_loadfilex

' Catalina Import luaL_checkoption

' Catalina Import luaL_error

' Catalina Import luaL_where

' Catalina Import luaL_checkany

' Catalina Import luaL_checktype

' Catalina Import luaL_checkstack

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_typeerror

' Catalina Import luaL_argerror

' Catalina Import luaL_tolstring

' Catalina Import luaL_getmetafield

' Catalina Import lua_setupvalue

' Catalina Import lua_stringtonumber

' Catalina Import lua_concat

' Catalina Import lua_next

' Catalina Import lua_error

' Catalina Import lua_gc

' Catalina Import lua_warning

' Catalina Import lua_load

' Catalina Import lua_pcallk

' Catalina Import lua_callk

' Catalina Import lua_setmetatable

' Catalina Import lua_rawset

' Catalina Import lua_setfield

' Catalina Import lua_getmetatable

' Catalina Import lua_rawgeti

' Catalina Import lua_rawget

' Catalina Import lua_geti

' Catalina Import lua_pushboolean

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnumber

' Catalina Import lua_pushnil

' Catalina Import lua_rawequal

' Catalina Import lua_rawlen

' Catalina Import lua_tolstring

' Catalina Import lua_toboolean

' Catalina Import lua_typename

' Catalina Import lua_type

' Catalina Import lua_isstring

' Catalina Import lua_copy

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import strspn

' Catalina Import fwrite

' Catalina Import fflush

' Catalina Import __stdout

' Catalina Import toupper

' Catalina Import __ctype

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaopen_base_293_L000294 ' <symbol:293>
 byte 76
 byte 117
 byte 97
 byte 32
 byte 53
 byte 46
 byte 52
 byte 0

 alignl_label
C_srqs2n_68804f51_290_L000291 ' <symbol:290>
 byte 95
 byte 86
 byte 69
 byte 82
 byte 83
 byte 73
 byte 79
 byte 78
 byte 0

 alignl_label
C_srqs2m_68804f51_288_L000289 ' <symbol:288>
 byte 95
 byte 71
 byte 0

 alignl_label
C_srqs2l_68804f51_286_L000287 ' <symbol:286>
 byte 120
 byte 112
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl_label
C_srqs2k_68804f51_284_L000285 ' <symbol:284>
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl_label
C_srqs2j_68804f51_282_L000283 ' <symbol:282>
 byte 116
 byte 111
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl_label
C_srqs2i_68804f51_280_L000281 ' <symbol:280>
 byte 116
 byte 111
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl_label
C_srqs2h_68804f51_278_L000279 ' <symbol:278>
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
C_srqs2g_68804f51_276_L000277 ' <symbol:276>
 byte 115
 byte 101
 byte 108
 byte 101
 byte 99
 byte 116
 byte 0

 alignl_label
C_srqs2f_68804f51_274_L000275 ' <symbol:274>
 byte 114
 byte 97
 byte 119
 byte 115
 byte 101
 byte 116
 byte 0

 alignl_label
C_srqs2e_68804f51_272_L000273 ' <symbol:272>
 byte 114
 byte 97
 byte 119
 byte 103
 byte 101
 byte 116
 byte 0

 alignl_label
C_srqs2d_68804f51_270_L000271 ' <symbol:270>
 byte 114
 byte 97
 byte 119
 byte 108
 byte 101
 byte 110
 byte 0

 alignl_label
C_srqs2c_68804f51_268_L000269 ' <symbol:268>
 byte 114
 byte 97
 byte 119
 byte 101
 byte 113
 byte 117
 byte 97
 byte 108
 byte 0

 alignl_label
C_srqs2b_68804f51_266_L000267 ' <symbol:266>
 byte 119
 byte 97
 byte 114
 byte 110
 byte 0

 alignl_label
C_srqs2a_68804f51_264_L000265 ' <symbol:264>
 byte 112
 byte 114
 byte 105
 byte 110
 byte 116
 byte 0

 alignl_label
C_srqs29_68804f51_262_L000263 ' <symbol:262>
 byte 112
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl_label
C_srqs28_68804f51_260_L000261 ' <symbol:260>
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl_label
C_srqs27_68804f51_258_L000259 ' <symbol:258>
 byte 110
 byte 101
 byte 120
 byte 116
 byte 0

 alignl_label
C_srqs26_68804f51_256_L000257 ' <symbol:256>
 byte 108
 byte 111
 byte 97
 byte 100
 byte 0

 alignl_label
C_srqs25_68804f51_254_L000255 ' <symbol:254>
 byte 108
 byte 111
 byte 97
 byte 100
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl_label
C_srqs24_68804f51_252_L000253 ' <symbol:252>
 byte 105
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl_label
C_srqs23_68804f51_250_L000251 ' <symbol:250>
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
C_srqs22_68804f51_248_L000249 ' <symbol:248>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 0

 alignl_label
C_srqs21_68804f51_246_L000247 ' <symbol:246>
 byte 100
 byte 111
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl_label
C_srqs20_68804f51_244_L000245 ' <symbol:244>
 byte 99
 byte 111
 byte 108
 byte 108
 byte 101
 byte 99
 byte 116
 byte 103
 byte 97
 byte 114
 byte 98
 byte 97
 byte 103
 byte 101
 byte 0

 alignl_label
C_srqs1v_68804f51_242_L000243 ' <symbol:242>
 byte 97
 byte 115
 byte 115
 byte 101
 byte 114
 byte 116
 byte 0

 alignl_label
C_srqs1o_68804f51_luaB__select_L000220_228_L000229 ' <symbol:228>
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
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
C_srqs1m_68804f51_luaB__assert_L000214_218_L000219 ' <symbol:218>
 byte 97
 byte 115
 byte 115
 byte 101
 byte 114
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 102
 byte 97
 byte 105
 byte 108
 byte 101
 byte 100
 byte 33
 byte 0

 alignl_label
C_srqs1h_68804f51_luaB__load_L000197_206_L000207 ' <symbol:206>
 byte 61
 byte 40
 byte 108
 byte 111
 byte 97
 byte 100
 byte 41
 byte 0

 alignl_label
C_srqs1h_68804f51_luaB__load_L000197_199_L000200 ' <symbol:199>
 byte 98
 byte 116
 byte 0

 alignl_label
C_srqs1e_68804f51_generic_reader_L000187_195_L000196 ' <symbol:195>
 byte 114
 byte 101
 byte 97
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

 alignl_label
C_srqs1e_68804f51_generic_reader_L000187_189_L000190 ' <symbol:189>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 110
 byte 101
 byte 115
 byte 116
 byte 101
 byte 100
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 115
 byte 0

 alignl_label
C_srqs18_68804f51_luaB__pairs_L000161_165_L000166 ' <symbol:165>
 byte 95
 byte 95
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl_label
C_srqs14_68804f51_luaB__type_L000150_152_L000153 ' <symbol:152>
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

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_131_L000132 ' <symbol:131>
 long $44800000 ' float

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_122_L000123 ' <symbol:122>
 byte 105
 byte 115
 byte 114
 byte 117
 byte 110
 byte 110
 byte 105
 byte 110
 byte 103
 byte 0

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_120_L000121 ' <symbol:120>
 byte 115
 byte 101
 byte 116
 byte 115
 byte 116
 byte 101
 byte 112
 byte 109
 byte 117
 byte 108
 byte 0

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_118_L000119 ' <symbol:118>
 byte 115
 byte 101
 byte 116
 byte 112
 byte 97
 byte 117
 byte 115
 byte 101
 byte 0

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_116_L000117 ' <symbol:116>
 byte 115
 byte 116
 byte 101
 byte 112
 byte 0

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_114_L000115 ' <symbol:114>
 byte 99
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_112_L000113 ' <symbol:112>
 byte 99
 byte 111
 byte 108
 byte 108
 byte 101
 byte 99
 byte 116
 byte 0

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_110_L000111 ' <symbol:110>
 byte 114
 byte 101
 byte 115
 byte 116
 byte 97
 byte 114
 byte 116
 byte 0

 alignl_label
C_srqsm_68804f51_luaB__collectgarbage_L000104_108_L000109 ' <symbol:108>
 byte 115
 byte 116
 byte 111
 byte 112
 byte 0

 alignl_label
C_srqsj_68804f51_pushmode_L000093_99_L000100 ' <symbol:99>
 byte 103
 byte 101
 byte 110
 byte 101
 byte 114
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 97
 byte 108
 byte 0

 alignl_label
C_srqsj_68804f51_pushmode_L000093_97_L000098 ' <symbol:97>
 byte 105
 byte 110
 byte 99
 byte 114
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 97
 byte 108
 byte 0

 alignl_label
C_srqsf_68804f51_luaB__rawlen_L000084_86_L000087 ' <symbol:86>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 111
 byte 114
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl_label
C_srqsb_68804f51_luaB__setmetatable_L000073_80_L000081 ' <symbol:80>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 99
 byte 104
 byte 97
 byte 110
 byte 103
 byte 101
 byte 32
 byte 97
 byte 32
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
C_srqsb_68804f51_luaB__setmetatable_L000073_75_L000076 ' <symbol:75>
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
C_srqs9_68804f51_luaB__getmetatable_L000067_71_L000072 ' <symbol:71>
 byte 95
 byte 95
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
C_srqs6_68804f51_luaB__tonumber_L000049_57_L000058 ' <symbol:57>
 byte 98
 byte 97
 byte 115
 byte 101
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
C_srqs4_68804f51_b_str2int_L000026_28_L000029 ' <symbol:28>
 byte 32
 byte 12
 byte 10
 byte 13
 byte 9
 byte 11
 byte 0

 alignl_label
C_srqs_68804f51_luaB__print_L000004_14_L000015 ' <symbol:14>
 byte 10
 byte 0

 alignl_label
C_srqs_68804f51_luaB__print_L000004_12_L000013 ' <symbol:12>
 byte 9
 byte 0

' Catalina Code

DAT ' code segment
' end
