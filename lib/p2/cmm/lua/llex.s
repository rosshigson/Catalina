' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s94c_696de004_luaX__tokens_L000021 ' <symbol:luaX_tokens>
 long @C_s94c1_696de004_22_L000023
 long @C_s94c2_696de004_24_L000025
 long @C_s94c3_696de004_26_L000027
 long @C_s94c4_696de004_28_L000029
 long @C_s94c5_696de004_30_L000031
 long @C_s94c6_696de004_32_L000033
 long @C_s94c7_696de004_34_L000035
 long @C_s94c8_696de004_36_L000037
 long @C_s94c9_696de004_38_L000039
 long @C_s94ca_696de004_40_L000041
 long @C_s94cb_696de004_42_L000043
 long @C_s94cc_696de004_44_L000045
 long @C_s94cd_696de004_46_L000047
 long @C_s94ce_696de004_48_L000049
 long @C_s94cf_696de004_50_L000051
 long @C_s94cg_696de004_52_L000053
 long @C_s94ch_696de004_54_L000055
 long @C_s94ci_696de004_56_L000057
 long @C_s94cj_696de004_58_L000059
 long @C_s94ck_696de004_60_L000061
 long @C_s94cl_696de004_62_L000063
 long @C_s94cm_696de004_64_L000065
 long @C_s94cn_696de004_66_L000067
 long @C_s94co_696de004_68_L000069
 long @C_s94cp_696de004_70_L000071
 long @C_s94cq_696de004_72_L000073
 long @C_s94cr_696de004_74_L000075
 long @C_s94cs_696de004_76_L000077
 long @C_s94ct_696de004_78_L000079
 long @C_s94cu_696de004_80_L000081
 long @C_s94cv_696de004_82_L000083
 long @C_s94c10_696de004_84_L000085
 long @C_s94c11_696de004_86_L000087
 long @C_s94c12_696de004_88_L000089
 long @C_s94c13_696de004_90_L000091
 long @C_s94c14_696de004_92_L000093
 long @C_s94c15_696de004_94_L000095

' Catalina Code

DAT ' code segment

 alignl_label
C_s94c17_696de004_save_L000097 ' <symbol:save>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s94c17_696de004_save_L000097_99)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $3fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c17_696de004_save_L000097_101)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s94c17_696de004_save_L000097_103_L000104 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s94c17_696de004_save_L000097_101
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r4)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaM__saferealloc_)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_s94c17_696de004_save_L000097_99
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDI + (r18)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_s94c17_696de004_save_L000097_98 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaX_init

 alignl_label
C_luaX__init ' <symbol:luaX_init>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_luaX__init_106_L000107 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaS__newlstr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__fix)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_luaX__init_108
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s94c_696de004_luaX__tokens_L000021 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaS__new)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__fix)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_luaX__init_109 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaX__init_108)<<S32 ' LTI4 reg coni
' C_luaX__init_105 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaX_token2str

 alignl_label
C_luaX__token2str ' <symbol:luaX_token2str>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_luaX__token2str_113)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaX__token2str_115)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_luaX__token2str_118_L000119 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaX__token2str_112)<<S32 ' JUMPV addrg
 alignl_label
C_luaX__token2str_115
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_luaX__token2str_120_L000121 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaX__token2str_112)<<S32 ' JUMPV addrg
 alignl_label
C_luaX__token2str_113
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s94c_696de004_luaX__tokens_L000021-1024 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (288)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_luaX__token2str_123)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_luaX__token2str_125_L000126 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaX__token2str_112)<<S32 ' JUMPV addrg
 alignl_label
C_luaX__token2str_123
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_label
C_luaX__token2str_112
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c1d_696de004_txtT_oken_L000127 ' <symbol:txtToken>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + RI<<D32 + (289)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c1d_696de004_txtT_oken_L000127_129)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (292)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c1d_696de004_txtT_oken_L000127_129)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s94c1d_696de004_txtT_oken_L000127_132_L000134-1156 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s94c1d_696de004_txtT_oken_L000127_132_L000134 ' <symbol:132>
 long @C_s94c1d_696de004_txtT_oken_L000127_131
 long @C_s94c1d_696de004_txtT_oken_L000127_131
 long @C_s94c1d_696de004_txtT_oken_L000127_131
 long @C_s94c1d_696de004_txtT_oken_L000127_131

' Catalina Code

DAT ' code segment
 alignl_label
C_s94c1d_696de004_txtT_oken_L000127_131
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_luaX__token2str_125_L000126 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s94c1d_696de004_txtT_oken_L000127_128)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1d_696de004_txtT_oken_L000127_129
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaX__token2str)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1d_696de004_txtT_oken_L000127_128
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c16_696de004_lexerror_L000096 ' <symbol:lexerror>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaG__addinfo)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c16_696de004_lexerror_L000096_137)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1d_696de004_txtT_oken_L000127)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s94c16_696de004_lexerror_L000096_139_L000140 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_label
C_s94c16_696de004_lexerror_L000096_137
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaD__throw)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s94c16_696de004_lexerror_L000096_136 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaX_syntaxerror

 alignl_label
C_luaX__syntaxerror ' <symbol:luaX_syntaxerror>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_luaX__syntaxerror_141 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaX_newstring

 alignl_label
C_luaX__newstring ' <symbol:luaX_newstring>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaS__newlstr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getstr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaX__newstring_143)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_luaX__newstring_144)<<S32 ' JUMPV addrg
 alignl_label
C_luaX__newstring_143
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaH__finishset)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_luaX__newstring_145)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaC__step)<<S32 ' CALL addrg
 alignl_label
C_luaX__newstring_145
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r18)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_luaX__newstring_144
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_luaX__newstring_142 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c1h_696de004_inclinenumber_L000147 ' <symbol:inclinenumber>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1h_696de004_inclinenumber_L000147_150)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1h_696de004_inclinenumber_L000147_151)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1h_696de004_inclinenumber_L000147_150
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1h_696de004_inclinenumber_L000147_151
 word I16A_WRLONG + (r21)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1h_696de004_inclinenumber_L000147_154)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1h_696de004_inclinenumber_L000147_152)<<S32 ' NEI4 reg coni
 alignl_label
C_s94c1h_696de004_inclinenumber_L000147_154
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1h_696de004_inclinenumber_L000147_152)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1h_696de004_inclinenumber_L000147_156)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1h_696de004_inclinenumber_L000147_157)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1h_696de004_inclinenumber_L000147_156
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1h_696de004_inclinenumber_L000147_157
 word I16A_WRLONG + (r19)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_label
C_s94c1h_696de004_inclinenumber_L000147_152
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2147483647 ' reg <- con
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c1h_696de004_inclinenumber_L000147_158)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s94c1h_696de004_inclinenumber_L000147_160_L000161 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s94c1h_696de004_inclinenumber_L000147_158
' C_s94c1h_696de004_inclinenumber_L000147_148 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaX_setinput

 alignl_label
C_luaX__setinput ' <symbol:luaX_setinput>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((288)&$7FFFF)<<S32 ' reg <- cons
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_luaX__init_106_L000107 ' reg ARG ADDRG
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaS__newlstr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaM__saferealloc_)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_luaX__setinput_162 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c1j_696de004_check_next1_L000163 ' <symbol:check_next1>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1j_696de004_check_next1_L000163_165)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1j_696de004_check_next1_L000163_168)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1j_696de004_check_next1_L000163_169)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1j_696de004_check_next1_L000163_168
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1j_696de004_check_next1_L000163_169
 word I16A_WRLONG + (r19)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s94c1j_696de004_check_next1_L000163_164)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1j_696de004_check_next1_L000163_165
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s94c1j_696de004_check_next1_L000163_164
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c1k_696de004_check_next2_L000170 ' <symbol:check_next2>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_RDBYTE + (r20)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1k_696de004_check_next2_L000170_174)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1k_696de004_check_next2_L000170_172)<<S32 ' NEI4 reg reg
 alignl_label
C_s94c1k_696de004_check_next2_L000170_174
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1k_696de004_check_next2_L000170_176)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1k_696de004_check_next2_L000170_177)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1k_696de004_check_next2_L000170_176
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1k_696de004_check_next2_L000170_177
 word I16A_WRLONG + (r19)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s94c1k_696de004_check_next2_L000170_171)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1k_696de004_check_next2_L000170_172
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s94c1k_696de004_check_next2_L000170_171
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c1l_696de004_read_numeral_L000178 ' <symbol:read_numeral>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r19)<<D16B
 alignl_p1
 long @C_s94c1l_696de004_read_numeral_L000178_180_L000181 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1l_696de004_read_numeral_L000178_183)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1l_696de004_read_numeral_L000178_184)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_183
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_184
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1l_696de004_read_numeral_L000178_185)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s94c1l_696de004_read_numeral_L000178_187_L000188 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1k_696de004_check_next2_L000170)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1l_696de004_read_numeral_L000178_185)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r19)<<D16B
 alignl_p1
 long @C_s94c1l_696de004_read_numeral_L000178_189_L000190 ' reg <- addrg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_185
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_191
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1k_696de004_check_next2_L000170)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1l_696de004_read_numeral_L000178_195)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s94c1l_696de004_read_numeral_L000178_197_L000198 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1k_696de004_check_next2_L000170)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s94c1l_696de004_read_numeral_L000178_191)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_195
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1l_696de004_read_numeral_L000178_202)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1l_696de004_read_numeral_L000178_193)<<S32 ' NEI4 reg coni
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_202
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1l_696de004_read_numeral_L000178_204)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1l_696de004_read_numeral_L000178_205)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_204
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_205
 word I16A_WRLONG + (r15)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c1l_696de004_read_numeral_L000178_191)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_193
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1l_696de004_read_numeral_L000178_206)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1l_696de004_read_numeral_L000178_210)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1l_696de004_read_numeral_L000178_211)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_210
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_211
 word I16A_WRLONG + (r15)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_206
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaO__str2num)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1l_696de004_read_numeral_L000178_212)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (289)<<S32 ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s94c1l_696de004_read_numeral_L000178_214_L000215 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_212
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1l_696de004_read_numeral_L000178_216)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_MOVI + R0<<D32 + (290)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c1l_696de004_read_numeral_L000178_179)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_216
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNF4 reg reg
 alignl_p1
 long I32_MOVI + R0<<D32 + (289)<<S32 ' RET conli
 alignl_label
C_s94c1l_696de004_read_numeral_L000178_179
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c1r_696de004_skip_sep_L000219 ' <symbol:skip_sep>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1r_696de004_skip_sep_L000219_222)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1r_696de004_skip_sep_L000219_223)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_222
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_223
 word I16A_WRLONG + (r19)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c1r_696de004_skip_sep_L000219_225)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_224
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1r_696de004_skip_sep_L000219_228)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1r_696de004_skip_sep_L000219_229)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_228
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_229
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_ADDI + (r21)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_225
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1r_696de004_skip_sep_L000219_224)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1r_696de004_skip_sep_L000219_232)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A
 word I16A_ADDI + (r17)<<D16A + (2)<<S16A ' ADDU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s94c1r_696de004_skip_sep_L000219_233)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_232
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1r_696de004_skip_sep_L000219_234)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s94c1r_696de004_skip_sep_L000219_235)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_234
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_235
 word I16A_MOV + (r17)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1r_696de004_skip_sep_L000219_233
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_s94c1r_696de004_skip_sep_L000219_220 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c1s_696de004_read_long_string_L000236 ' <symbol:read_long_string>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_239)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_240)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_239
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_240
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_243)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1s_696de004_read_long_string_L000236_241)<<S32 ' NEI4 reg coni
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_243
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c1h_696de004_inclinenumber_L000147)<<S32 ' CALL addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_241
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_244
 word I16A_RDLONG + (r15)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r15)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_268)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_268)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c1s_696de004_read_long_string_L000236_280)<<S32 ' GTI4 reg coni
' C_s94c1s_696de004_read_long_string_L000236_279 ' (symbol refcount = 0)
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_251)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_248)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_280
 alignl_p1
 long I32_MOVI + RI<<D32 + (93)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_261)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_248)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_251
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_257)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long @C_s94c1s_696de004_read_long_string_L000236_252_L000253 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_258)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_257
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long @C_s94c1s_696de004_read_long_string_L000236_254_L000255 ' reg <- addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_258
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r13)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C_s94c1s_696de004_read_long_string_L000236_259_L000260 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (288)<<S32 ' reg ARG coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_244)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_261
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c1r_696de004_skip_sep_L000219)<<S32 ' CALL addrg
 word I16A_CMP + (r0)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1s_696de004_read_long_string_L000236_244)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_265)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_266)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_265
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_266
 word I16A_WRLONG + (r13)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_267)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_268
 word I16A_MOVI + (r2)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c1h_696de004_inclinenumber_L000147)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c1s_696de004_read_long_string_L000236_244)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_244)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_248
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_271)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_274)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_275)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_274
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_275
 word I16A_WRLONG + (r13)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_244)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_271
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_277)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r11)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_278)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_277
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_278
 word I16A_WRLONG + (r11)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c1s_696de004_read_long_string_L000236_244)<<S32 ' JUMPV addrg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_267
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c1s_696de004_read_long_string_L000236_281)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r18)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r18)<<S16A ' SUBU (3)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 alignl_label
C_s94c1s_696de004_read_long_string_L000236_281
' C_s94c1s_696de004_read_long_string_L000236_237 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c20_696de004_esccheck_L000283 ' <symbol:esccheck>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c20_696de004_esccheck_L000283_285)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c20_696de004_esccheck_L000283_287)<<S32 ' EQI4 reg reg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c20_696de004_esccheck_L000283_290)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c20_696de004_esccheck_L000283_291)<<S32 ' JUMPV addrg
 alignl_label
C_s94c20_696de004_esccheck_L000283_290
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c20_696de004_esccheck_L000283_291
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_label
C_s94c20_696de004_esccheck_L000283_287
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (292)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s94c20_696de004_esccheck_L000283_285
' C_s94c20_696de004_esccheck_L000283_284 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c21_696de004_gethexa_L000292 ' <symbol:gethexa>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c21_696de004_gethexa_L000292_295)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c21_696de004_gethexa_L000292_296)<<S32 ' JUMPV addrg
 alignl_label
C_s94c21_696de004_gethexa_L000292_295
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c21_696de004_gethexa_L000292_296
 word I16A_WRLONG + (r21)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s94c21_696de004_gethexa_L000292_298_L000299 ' reg ARG ADDRG
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r3)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c20_696de004_esccheck_L000283)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaO__hexavalue)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s94c21_696de004_gethexa_L000292_293 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c23_696de004_readhexaesc_L000300 ' <symbol:readhexaesc>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c21_696de004_gethexa_L000292)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c21_696de004_gethexa_L000292)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r20)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r21)<<D16A + (r0)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r20)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s94c23_696de004_readhexaesc_L000300_301 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c24_696de004_readutf8esc_L000302 ' <symbol:readutf8esc>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $feac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c24_696de004_readutf8esc_L000302_305)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c24_696de004_readutf8esc_L000302_306)<<S32 ' JUMPV addrg
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_305
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_306
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s94c24_696de004_readutf8esc_L000302_308_L000309 ' reg ARG ADDRG
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (123)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c24_696de004_readutf8esc_L000302_310)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s94c24_696de004_readutf8esc_L000302_311)<<S32 ' JUMPV addrg
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_310
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_311
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c20_696de004_esccheck_L000283)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c21_696de004_gethexa_L000292)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s94c24_696de004_readutf8esc_L000302_313)<<S32 ' JUMPV addrg
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_312
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s94c24_696de004_readutf8esc_L000302_318_L000319 ' reg ARG ADDRG
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7ffffff ' reg <- con
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c24_696de004_readutf8esc_L000302_320)<<S32 ' GTU4 reg reg
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s94c24_696de004_readutf8esc_L000302_321)<<S32 ' JUMPV addrg
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_320
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_321
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c20_696de004_esccheck_L000283)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaO__hexavalue)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r20)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r20)<<S16A ' ADDU
 word I16A_ADD + (r21)<<D16A + (r22)<<S16A ' ADDU (3)
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_313
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c24_696de004_readutf8esc_L000302_322)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c24_696de004_readutf8esc_L000302_323)<<S32 ' JUMPV addrg
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_322
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_323
 word I16A_WRLONG + (r13)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c24_696de004_readutf8esc_L000302_312)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s94c24_696de004_readutf8esc_L000302_325_L000326 ' reg ARG ADDRG
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (125)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c24_696de004_readutf8esc_L000302_327)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s94c24_696de004_readutf8esc_L000302_328)<<S32 ' JUMPV addrg
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_327
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_328
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c20_696de004_esccheck_L000283)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c24_696de004_readutf8esc_L000302_330)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r10)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c24_696de004_readutf8esc_L000302_331)<<S32 ' JUMPV addrg
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_330
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c24_696de004_readutf8esc_L000302_331
 word I16A_WRLONG + (r10)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s94c24_696de004_readutf8esc_L000302_303 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c28_696de004_utf8esc_L000332 ' <symbol:utf8esc>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c24_696de004_readutf8esc_L000302)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaO__utf8esc)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s94c28_696de004_utf8esc_L000332_337)<<S32 ' JUMPV addrg
 alignl_label
C_s94c28_696de004_utf8esc_L000332_334
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s94c28_696de004_utf8esc_L000332_335 ' (symbol refcount = 0)
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_s94c28_696de004_utf8esc_L000332_337
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c28_696de004_utf8esc_L000332_334)<<S32 ' GTI4 reg coni
' C_s94c28_696de004_utf8esc_L000332_333 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c29_696de004_readdecesc_L000338 ' <symbol:readdecesc>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s94c29_696de004_readdecesc_L000338_343)<<S32 ' JUMPV addrg
 alignl_label
C_s94c29_696de004_readdecesc_L000338_340
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r21)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c29_696de004_readdecesc_L000338_346)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c29_696de004_readdecesc_L000338_347)<<S32 ' JUMPV addrg
 alignl_label
C_s94c29_696de004_readdecesc_L000338_346
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c29_696de004_readdecesc_L000338_347
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
' C_s94c29_696de004_readdecesc_L000338_341 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s94c29_696de004_readdecesc_L000338_343
 word I16A_CMPSI + (r19)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s94c29_696de004_readdecesc_L000338_348)<<S32 ' GEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c29_696de004_readdecesc_L000338_340)<<S32 ' NEI4 reg coni
 alignl_label
C_s94c29_696de004_readdecesc_L000338_348
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s94c29_696de004_readdecesc_L000338_350_L000351 ' reg ARG ADDRG
 alignl_p1
 long I32_MOVI + RI<<D32 + (255)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c29_696de004_readdecesc_L000338_352)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s94c29_696de004_readdecesc_L000338_353)<<S32 ' JUMPV addrg
 alignl_label
C_s94c29_696de004_readdecesc_L000338_352
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s94c29_696de004_readdecesc_L000338_353
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c20_696de004_esccheck_L000283)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s94c29_696de004_readdecesc_L000338_339 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c2b_696de004_read_string_L000354 ' <symbol:read_string>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $feae00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_357)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_358)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_357
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2b_696de004_read_string_L000354_358
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_360)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_359
 word I16A_RDLONG + (r15)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r15)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_368)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_368)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c2b_696de004_read_string_L000354_425)<<S32 ' GTI4 reg coni
' C_s94c2b_696de004_read_string_L000354_424 ' (symbol refcount = 0)
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_365)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_362)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_425
 alignl_p1
 long I32_MOVI + RI<<D32 + (92)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_369)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_362)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_365
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (288)<<S32 ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s94c2b_696de004_read_string_L000354_366_L000367 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_363)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_368
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (292)<<S32 ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s94c2b_696de004_read_string_L000354_366_L000367 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_363)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_369
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_371)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_372)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_371
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2b_696de004_read_string_L000354_372
 word I16A_WRLONG + (r13)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r11)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (39)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_389)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (39)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c2b_696de004_read_string_L000354_409)<<S32 ' GTI4 reg coni
' C_s94c2b_696de004_read_string_L000354_408 ' (symbol refcount = 0)
 word I16A_CMPSI + (r11)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_387)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r11)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_387)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r11)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c2b_696de004_read_string_L000354_411)<<S32 ' GTI4 reg coni
' C_s94c2b_696de004_read_string_L000354_410 ' (symbol refcount = 0)
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r11)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_363)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_373)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_411
 alignl_p1
 long I32_MOVI + RI<<D32 + (34)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_389)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_373)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_409
 alignl_p1
 long I32_MOVI + RI<<D32 + (97)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_376)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (98)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_378)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (102)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_379)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (102)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c2b_696de004_read_string_L000354_413)<<S32 ' GTI4 reg coni
' C_s94c2b_696de004_read_string_L000354_412 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (92)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_389)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_373)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_413
 alignl_p1
 long I32_MOVI + RI<<D32 + (110)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c2b_696de004_read_string_L000354_373)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (122)<<S32
 word I16A_CMPS + (r11)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c2b_696de004_read_string_L000354_373)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s94c2b_696de004_read_string_L000354_414_L000416-440 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s94c2b_696de004_read_string_L000354_414_L000416 ' <symbol:414>
 long @C_s94c2b_696de004_read_string_L000354_380
 long @C_s94c2b_696de004_read_string_L000354_373
 long @C_s94c2b_696de004_read_string_L000354_373
 long @C_s94c2b_696de004_read_string_L000354_373
 long @C_s94c2b_696de004_read_string_L000354_381
 long @C_s94c2b_696de004_read_string_L000354_373
 long @C_s94c2b_696de004_read_string_L000354_382
 long @C_s94c2b_696de004_read_string_L000354_385
 long @C_s94c2b_696de004_read_string_L000354_383
 long @C_s94c2b_696de004_read_string_L000354_373
 long @C_s94c2b_696de004_read_string_L000354_384
 long @C_s94c2b_696de004_read_string_L000354_373
 long @C_s94c2b_696de004_read_string_L000354_391

' Catalina Code

DAT ' code segment
 alignl_label
C_s94c2b_696de004_read_string_L000354_376
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_378
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_379
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_380
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_381
 word I16A_MOVI + (r22)<<D16A + (13)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_382
 word I16A_MOVI + (r22)<<D16A + (9)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_383
 word I16A_MOVI + (r22)<<D16A + (11)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_384
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c23_696de004_readhexaesc_L000300)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_385
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c28_696de004_utf8esc_L000332)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_363)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_387
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c1h_696de004_inclinenumber_L000147)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_388)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_389
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_377)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_391
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_393)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r10)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_394)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_393
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2b_696de004_read_string_L000354_394
 word I16A_WRLONG + (r10)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_396)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_395
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_401)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2b_696de004_read_string_L000354_399)<<S32 ' NEI4 reg coni
 alignl_label
C_s94c2b_696de004_read_string_L000354_401
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c1h_696de004_inclinenumber_L000147)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_400)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_399
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_403)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r9)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_404)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_403
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2b_696de004_read_string_L000354_404
 word I16A_WRLONG + (r9)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_label
C_s94c2b_696de004_read_string_L000354_400
 alignl_label
C_s94c2b_696de004_read_string_L000354_396
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2b_696de004_read_string_L000354_395)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_363)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_373
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s94c2b_696de004_read_string_L000354_406_L000407 ' reg ARG ADDRG
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r3)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c20_696de004_esccheck_L000283)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c29_696de004_readdecesc_L000338)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_388)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_377
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_419)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r10)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_420)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_419
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2b_696de004_read_string_L000354_420
 word I16A_WRLONG + (r10)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_label
C_s94c2b_696de004_read_string_L000354_388
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_363)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_362
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_422)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_423)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_422
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2b_696de004_read_string_L000354_423
 word I16A_WRLONG + (r13)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_label
C_s94c2b_696de004_read_string_L000354_363
 alignl_label
C_s94c2b_696de004_read_string_L000354_360
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2b_696de004_read_string_L000354_359)<<S32 ' NEI4 reg reg
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2b_696de004_read_string_L000354_427)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2b_696de004_read_string_L000354_428)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2b_696de004_read_string_L000354_427
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2b_696de004_read_string_L000354_428
 word I16A_WRLONG + (r15)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r2)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
' C_s94c2b_696de004_read_string_L000354_355 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s94c2g_696de004_llex_L000429 ' <symbol:llex>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_s94c2g_696de004_llex_L000429_431
 word I16A_RDLONG + (r19)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c2g_696de004_llex_L000429_539)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (62)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c2g_696de004_llex_L000429_540)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s94c2g_696de004_llex_L000429_541_L000543-128 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s94c2g_696de004_llex_L000429_541_L000543 ' <symbol:541>
 long @C_s94c2g_696de004_llex_L000429_439
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_510
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_510
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_443
 long @C_s94c2g_696de004_llex_L000429_511
 long @C_s94c2g_696de004_llex_L000429_492
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_522
 long @C_s94c2g_696de004_llex_L000429_504
 long @C_s94c2g_696de004_llex_L000429_435
 long @C_s94c2g_696de004_llex_L000429_476
 long @C_s94c2g_696de004_llex_L000429_470
 long @C_s94c2g_696de004_llex_L000429_484

' Catalina Code

DAT ' code segment
 alignl_label
C_s94c2g_696de004_llex_L000429_539
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_523)<<S32 ' EQI4 reg reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c2g_696de004_llex_L000429_435)<<S32 ' LTI4 reg reg
' C_s94c2g_696de004_llex_L000429_545 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (9)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c2g_696de004_llex_L000429_435)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s94c2g_696de004_llex_L000429_435)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s94c2g_696de004_llex_L000429_546_L000548-36 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s94c2g_696de004_llex_L000429_546_L000548 ' <symbol:546>
 long @C_s94c2g_696de004_llex_L000429_439
 long @C_s94c2g_696de004_llex_L000429_438
 long @C_s94c2g_696de004_llex_L000429_439
 long @C_s94c2g_696de004_llex_L000429_439
 long @C_s94c2g_696de004_llex_L000429_438

' Catalina Code

DAT ' code segment
 alignl_label
C_s94c2g_696de004_llex_L000429_540
 alignl_p1
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_463)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c2g_696de004_llex_L000429_435)<<S32 ' LTI4 reg coni
' C_s94c2g_696de004_llex_L000429_550 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (126)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_498)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_435)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_438
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c1h_696de004_inclinenumber_L000147)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_431)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_439
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_441)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_442)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_441
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_442
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_431)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_443
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_445)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_446)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_445
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_446
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_447)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (45)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_447
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_450)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_451)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_450
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_451
 word I16A_WRLONG + (r15)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2g_696de004_llex_L000429_457)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c1r_696de004_skip_sep_L000219)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c2g_696de004_llex_L000429_457)<<S32 ' LTU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c1s_696de004_read_long_string_L000236)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_431)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_456
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_460)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_461)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_460
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_461
 word I16A_WRLONG + (r13)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_label
C_s94c2g_696de004_llex_L000429_457
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_462)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (13)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_462)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2g_696de004_llex_L000429_456)<<S32 ' NEI4 reg reg
 alignl_label
C_s94c2g_696de004_llex_L000429_462
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_431)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_463
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s94c1r_696de004_skip_sep_L000219)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r17)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s94c2g_696de004_llex_L000429_464)<<S32 ' LTU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c1s_696de004_read_long_string_L000236)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_MOVI + R0<<D32 + (292)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_464
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2g_696de004_llex_L000429_466)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (292)<<S32 ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_s94c2g_696de004_llex_L000429_468_L000469 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c16_696de004_lexerror_L000096)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_466
 alignl_p1
 long I32_MOVI + R0<<D32 + (91)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_470
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_472)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_473)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_472
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_473
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (61)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_474)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (281)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_474
 alignl_p1
 long I32_MOVI + R0<<D32 + (61)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_476
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_478)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_479)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_478
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_479
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (61)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_480)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (283)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_480
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (60)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_482)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (285)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_482
 alignl_p1
 long I32_MOVI + R0<<D32 + (60)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_484
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_486)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_487)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_486
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_487
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (61)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_488)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (282)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_488
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (62)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_490)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (286)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_490
 alignl_p1
 long I32_MOVI + R0<<D32 + (62)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_492
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_494)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_495)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_494
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_495
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (47)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_496)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (278)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_496
 alignl_p1
 long I32_MOVI + R0<<D32 + (47)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_498
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_500)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_501)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_500
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_501
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (61)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_502)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (284)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_502
 alignl_p1
 long I32_MOVI + R0<<D32 + (126)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_504
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_506)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_507)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_506
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_507
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (58)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_508)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (287)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_508
 alignl_p1
 long I32_MOVI + R0<<D32 + (58)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_510
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r3)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s94c2b_696de004_read_string_L000354)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_MOVI + R0<<D32 + (292)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_511
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_513)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_514)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_513
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_514
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (46)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_515)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (46)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1j_696de004_check_next1_L000163)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_517)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (280)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_517
 alignl_p1
 long I32_MOVI + R0<<D32 + (279)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_515
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2g_696de004_llex_L000429_519)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_MOVI + R0<<D32 + (46)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_519
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1l_696de004_read_numeral_L000178)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_522
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c1l_696de004_read_numeral_L000178)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_523
 alignl_p1
 long I32_MOVI + R0<<D32 + (288)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_435
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_524)<<S32 ' EQI4 reg coni
 alignl_label
C_s94c2g_696de004_llex_L000429_527
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c17_696de004_save_L000097)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_531)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_532)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_531
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_532
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
' C_s94c2g_696de004_llex_L000429_528 ' (symbol refcount = 0)
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_luai_ctype_+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2g_696de004_llex_L000429_527)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPSI + (r20)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s94c2g_696de004_llex_L000429_534)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s94c2g_696de004_llex_L000429_534)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_534
 alignl_p1
 long I32_MOVI + R0<<D32 + (291)<<S32 ' RET conli
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_430)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_524
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s94c2g_696de004_llex_L000429_537)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s94c2g_696de004_llex_L000429_538)<<S32 ' JUMPV addrg
 alignl_label
C_s94c2g_696de004_llex_L000429_537
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaZ__fill)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s94c2g_696de004_llex_L000429_538
 word I16A_WRLONG + (r17)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_label
C_s94c2g_696de004_llex_L000429_430
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaX_next

 alignl_label
C_luaX__next ' <symbol:luaX_next>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (288)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaX__next_552)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r1)<<D16A + (20)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((288)&$7FFFF)<<S32 ' reg <- cons
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaX__next_553)<<S32 ' JUMPV addrg
 alignl_label
C_luaX__next_552
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c2g_696de004_llex_L000429)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 alignl_label
C_luaX__next_553
' C_luaX__next_551 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaX_lookahead

 alignl_label
C_luaX__lookahead ' <symbol:luaX_lookahead>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s94c2g_696de004_llex_L000429)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
' C_luaX__lookahead_554 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import luaH_finishset

' Catalina Import luaH_getstr

' Catalina Import luaS_new

' Catalina Import luaS_newlstr

' Catalina Import luaC_step

' Catalina Import luaC_fix

' Catalina Import luaD_throw

' Catalina Import luaG_addinfo

' Catalina Import luaZ_fill

' Catalina Import luaM_saferealloc_

' Catalina Import luaO_pushfstring

' Catalina Import luaO_hexavalue

' Catalina Import luaO_str2num

' Catalina Import luaO_utf8esc

' Catalina Import luai_ctype_

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s94c2g_696de004_llex_L000429_468_L000469 ' <symbol:468>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 100
 byte 101
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 101
 byte 114
 byte 0

 alignl_label
C_s94c2b_696de004_read_string_L000354_406_L000407 ' <symbol:406>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 101
 byte 115
 byte 99
 byte 97
 byte 112
 byte 101
 byte 32
 byte 115
 byte 101
 byte 113
 byte 117
 byte 101
 byte 110
 byte 99
 byte 101
 byte 0

 alignl_label
C_s94c2b_696de004_read_string_L000354_366_L000367 ' <symbol:366>
 byte 117
 byte 110
 byte 102
 byte 105
 byte 110
 byte 105
 byte 115
 byte 104
 byte 101
 byte 100
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl_label
C_s94c29_696de004_readdecesc_L000338_350_L000351 ' <symbol:350>
 byte 100
 byte 101
 byte 99
 byte 105
 byte 109
 byte 97
 byte 108
 byte 32
 byte 101
 byte 115
 byte 99
 byte 97
 byte 112
 byte 101
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

 alignl_label
C_s94c24_696de004_readutf8esc_L000302_325_L000326 ' <symbol:325>
 byte 109
 byte 105
 byte 115
 byte 115
 byte 105
 byte 110
 byte 103
 byte 32
 byte 39
 byte 125
 byte 39
 byte 0

 alignl_label
C_s94c24_696de004_readutf8esc_L000302_318_L000319 ' <symbol:318>
 byte 85
 byte 84
 byte 70
 byte 45
 byte 56
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
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

 alignl_label
C_s94c24_696de004_readutf8esc_L000302_308_L000309 ' <symbol:308>
 byte 109
 byte 105
 byte 115
 byte 115
 byte 105
 byte 110
 byte 103
 byte 32
 byte 39
 byte 123
 byte 39
 byte 0

 alignl_label
C_s94c21_696de004_gethexa_L000292_298_L000299 ' <symbol:298>
 byte 104
 byte 101
 byte 120
 byte 97
 byte 100
 byte 101
 byte 99
 byte 105
 byte 109
 byte 97
 byte 108
 byte 32
 byte 100
 byte 105
 byte 103
 byte 105
 byte 116
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
C_s94c1s_696de004_read_long_string_L000236_259_L000260 ' <symbol:259>
 byte 117
 byte 110
 byte 102
 byte 105
 byte 110
 byte 105
 byte 115
 byte 104
 byte 101
 byte 100
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 32
 byte 37
 byte 115
 byte 32
 byte 40
 byte 115
 byte 116
 byte 97
 byte 114
 byte 116
 byte 105
 byte 110
 byte 103
 byte 32
 byte 97
 byte 116
 byte 32
 byte 108
 byte 105
 byte 110
 byte 101
 byte 32
 byte 37
 byte 100
 byte 41
 byte 0

 alignl_label
C_s94c1s_696de004_read_long_string_L000236_254_L000255 ' <symbol:254>
 byte 99
 byte 111
 byte 109
 byte 109
 byte 101
 byte 110
 byte 116
 byte 0

 alignl_label
C_s94c1s_696de004_read_long_string_L000236_252_L000253 ' <symbol:252>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl_label
C_s94c1l_696de004_read_numeral_L000178_214_L000215 ' <symbol:214>
 byte 109
 byte 97
 byte 108
 byte 102
 byte 111
 byte 114
 byte 109
 byte 101
 byte 100
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl_label
C_s94c1l_696de004_read_numeral_L000178_197_L000198 ' <symbol:197>
 byte 45
 byte 43
 byte 0

 alignl_label
C_s94c1l_696de004_read_numeral_L000178_189_L000190 ' <symbol:189>
 byte 80
 byte 112
 byte 0

 alignl_label
C_s94c1l_696de004_read_numeral_L000178_187_L000188 ' <symbol:187>
 byte 120
 byte 88
 byte 0

 alignl_label
C_s94c1l_696de004_read_numeral_L000178_180_L000181 ' <symbol:180>
 byte 69
 byte 101
 byte 0

 alignl_label
C_s94c1h_696de004_inclinenumber_L000147_160_L000161 ' <symbol:160>
 byte 99
 byte 104
 byte 117
 byte 110
 byte 107
 byte 32
 byte 104
 byte 97
 byte 115
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 108
 byte 105
 byte 110
 byte 101
 byte 115
 byte 0

 alignl_label
C_s94c16_696de004_lexerror_L000096_139_L000140 ' <symbol:139>
 byte 37
 byte 115
 byte 32
 byte 110
 byte 101
 byte 97
 byte 114
 byte 32
 byte 37
 byte 115
 byte 0

 alignl_label
C_luaX__token2str_125_L000126 ' <symbol:125>
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl_label
C_luaX__token2str_120_L000121 ' <symbol:120>
 byte 39
 byte 60
 byte 92
 byte 37
 byte 100
 byte 62
 byte 39
 byte 0

 alignl_label
C_luaX__token2str_118_L000119 ' <symbol:118>
 byte 39
 byte 37
 byte 99
 byte 39
 byte 0

 alignl_label
C_luaX__init_106_L000107 ' <symbol:106>
 byte 95
 byte 69
 byte 78
 byte 86
 byte 0

 alignl_label
C_s94c17_696de004_save_L000097_103_L000104 ' <symbol:103>
 byte 108
 byte 101
 byte 120
 byte 105
 byte 99
 byte 97
 byte 108
 byte 32
 byte 101
 byte 108
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 0

 alignl_label
C_s94c15_696de004_94_L000095 ' <symbol:94>
 byte 60
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 62
 byte 0

 alignl_label
C_s94c14_696de004_92_L000093 ' <symbol:92>
 byte 60
 byte 110
 byte 97
 byte 109
 byte 101
 byte 62
 byte 0

 alignl_label
C_s94c13_696de004_90_L000091 ' <symbol:90>
 byte 60
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 62
 byte 0

 alignl_label
C_s94c12_696de004_88_L000089 ' <symbol:88>
 byte 60
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 62
 byte 0

 alignl_label
C_s94c11_696de004_86_L000087 ' <symbol:86>
 byte 60
 byte 101
 byte 111
 byte 102
 byte 62
 byte 0

 alignl_label
C_s94c10_696de004_84_L000085 ' <symbol:84>
 byte 58
 byte 58
 byte 0

 alignl_label
C_s94cv_696de004_82_L000083 ' <symbol:82>
 byte 62
 byte 62
 byte 0

 alignl_label
C_s94cu_696de004_80_L000081 ' <symbol:80>
 byte 60
 byte 60
 byte 0

 alignl_label
C_s94ct_696de004_78_L000079 ' <symbol:78>
 byte 126
 byte 61
 byte 0

 alignl_label
C_s94cs_696de004_76_L000077 ' <symbol:76>
 byte 60
 byte 61
 byte 0

 alignl_label
C_s94cr_696de004_74_L000075 ' <symbol:74>
 byte 62
 byte 61
 byte 0

 alignl_label
C_s94cq_696de004_72_L000073 ' <symbol:72>
 byte 61
 byte 61
 byte 0

 alignl_label
C_s94cp_696de004_70_L000071 ' <symbol:70>
 byte 46
 byte 46
 byte 46
 byte 0

 alignl_label
C_s94co_696de004_68_L000069 ' <symbol:68>
 byte 46
 byte 46
 byte 0

 alignl_label
C_s94cn_696de004_66_L000067 ' <symbol:66>
 byte 47
 byte 47
 byte 0

 alignl_label
C_s94cm_696de004_64_L000065 ' <symbol:64>
 byte 119
 byte 104
 byte 105
 byte 108
 byte 101
 byte 0

 alignl_label
C_s94cl_696de004_62_L000063 ' <symbol:62>
 byte 117
 byte 110
 byte 116
 byte 105
 byte 108
 byte 0

 alignl_label
C_s94ck_696de004_60_L000061 ' <symbol:60>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl_label
C_s94cj_696de004_58_L000059 ' <symbol:58>
 byte 116
 byte 104
 byte 101
 byte 110
 byte 0

 alignl_label
C_s94ci_696de004_56_L000057 ' <symbol:56>
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 0

 alignl_label
C_s94ch_696de004_54_L000055 ' <symbol:54>
 byte 114
 byte 101
 byte 112
 byte 101
 byte 97
 byte 116
 byte 0

 alignl_label
C_s94cg_696de004_52_L000053 ' <symbol:52>
 byte 111
 byte 114
 byte 0

 alignl_label
C_s94cf_696de004_50_L000051 ' <symbol:50>
 byte 110
 byte 111
 byte 116
 byte 0

 alignl_label
C_s94ce_696de004_48_L000049 ' <symbol:48>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl_label
C_s94cd_696de004_46_L000047 ' <symbol:46>
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl_label
C_s94cc_696de004_44_L000045 ' <symbol:44>
 byte 105
 byte 110
 byte 0

 alignl_label
C_s94cb_696de004_42_L000043 ' <symbol:42>
 byte 105
 byte 102
 byte 0

 alignl_label
C_s94ca_696de004_40_L000041 ' <symbol:40>
 byte 103
 byte 111
 byte 116
 byte 111
 byte 0

 alignl_label
C_s94c9_696de004_38_L000039 ' <symbol:38>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl_label
C_s94c8_696de004_36_L000037 ' <symbol:36>
 byte 102
 byte 111
 byte 114
 byte 0

 alignl_label
C_s94c7_696de004_34_L000035 ' <symbol:34>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl_label
C_s94c6_696de004_32_L000033 ' <symbol:32>
 byte 101
 byte 110
 byte 100
 byte 0

 alignl_label
C_s94c5_696de004_30_L000031 ' <symbol:30>
 byte 101
 byte 108
 byte 115
 byte 101
 byte 105
 byte 102
 byte 0

 alignl_label
C_s94c4_696de004_28_L000029 ' <symbol:28>
 byte 101
 byte 108
 byte 115
 byte 101
 byte 0

 alignl_label
C_s94c3_696de004_26_L000027 ' <symbol:26>
 byte 100
 byte 111
 byte 0

 alignl_label
C_s94c2_696de004_24_L000025 ' <symbol:24>
 byte 98
 byte 114
 byte 101
 byte 97
 byte 107
 byte 0

 alignl_label
C_s94c1_696de004_22_L000023 ' <symbol:22>
 byte 97
 byte 110
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
