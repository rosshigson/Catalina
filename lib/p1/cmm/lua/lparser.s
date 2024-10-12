' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_si342_6709f912_error_expected_L000022 ' <symbol:error_expected>
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
 long I32_CALA + (@C_luaX__token2str)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si342_6709f912_error_expected_L000022_24_L000025 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si342_6709f912_error_expected_L000022_23 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si344_6709f912_errorlimit_L000026 ' <symbol:errorlimit>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si344_6709f912_errorlimit_L000026_33)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl ' align long
 long @C_si344_6709f912_errorlimit_L000026_28_L000029 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_si344_6709f912_errorlimit_L000026_34)<<S32 ' JUMPV addrg
 alignl ' align long
C_si344_6709f912_errorlimit_L000026_33
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si344_6709f912_errorlimit_L000026_30_L000031 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_si344_6709f912_errorlimit_L000026_34
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r13)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl ' align long
 long @C_si344_6709f912_errorlimit_L000026_35_L000036 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si344_6709f912_errorlimit_L000026_27 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si348_6709f912_checklimit_L000037 ' <symbol:checklimit>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $aa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPS + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si348_6709f912_checklimit_L000037_39)<<S32 ' LEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si344_6709f912_errorlimit_L000026)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si348_6709f912_checklimit_L000037_39
' C_si348_6709f912_checklimit_L000037_38 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si349_6709f912_testnext_L000041 ' <symbol:testnext>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si349_6709f912_testnext_L000041_43)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si349_6709f912_testnext_L000041_42)<<S32 ' JUMPV addrg
 alignl ' align long
C_si349_6709f912_testnext_L000041_43
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_si349_6709f912_testnext_L000041_42
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34a_6709f912_check_L000045 ' <symbol:check>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34a_6709f912_check_L000045_47)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342_6709f912_error_expected_L000022)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si34a_6709f912_check_L000045_47
' C_si34a_6709f912_check_L000045_46 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34b_6709f912_checknext_L000049 ' <symbol:checknext>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34a_6709f912_check_L000045)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
' C_si34b_6709f912_checknext_L000049_50 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34c_6709f912_check_match_L000051 ' <symbol:check_match>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si34c_6709f912_check_match_L000051_53)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si34c_6709f912_check_match_L000051_55)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342_6709f912_error_expected_L000022)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34c_6709f912_check_match_L000051_56)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34c_6709f912_check_match_L000051_55
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__token2str)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__token2str)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl ' align long
 long @C_si34c_6709f912_check_match_L000051_57_L000058 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si34c_6709f912_check_match_L000051_56
 alignl ' align long
C_si34c_6709f912_check_match_L000051_53
' C_si34c_6709f912_check_match_L000051_52 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34e_6709f912_str_checkname_L000059 ' <symbol:str_checkname>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (291)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34a_6709f912_check_L000045)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
' C_si34e_6709f912_str_checkname_L000059_60 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34f_6709f912_init_exp_L000061 ' <symbol:init_exp>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r20)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r20)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_WRLONG + (r3)<<D16A + (r4)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_si34f_6709f912_init_exp_L000061_62 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34g_6709f912_codestring_L000063 ' <symbol:codestring>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r3)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
' C_si34g_6709f912_codestring_L000063_64 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34h_6709f912_codename_L000065 ' <symbol:codename>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34g_6709f912_codestring_L000063)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si34h_6709f912_codename_L000065_66 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34i_6709f912_registerlocalvar_L000067 ' <symbol:registerlocalvar>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r17)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si34i_6709f912_registerlocalvar_L000067_69_L000070 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((32767)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r4)<<D16A + (12)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r5)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r5)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI2 reg
 word I16A_SHLI + (r20)<<D16A + 16<<S16A
 word I16A_SARI + (r20)<<D16A + 16<<S16A ' sign extend
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si34i_6709f912_registerlocalvar_L000067_72)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34i_6709f912_registerlocalvar_L000067_71
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_si34i_6709f912_registerlocalvar_L000067_72
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si34i_6709f912_registerlocalvar_L000067_71)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI2 reg
 word I16A_SHLI + (r20)<<D16A + 16<<S16A
 word I16A_SARI + (r20)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI2 reg
 word I16A_SHLI + (r20)<<D16A + 16<<S16A
 word I16A_SARI + (r20)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34i_6709f912_registerlocalvar_L000067_75)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34i_6709f912_registerlocalvar_L000067_75)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaC__barrier_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34i_6709f912_registerlocalvar_L000067_75)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34i_6709f912_registerlocalvar_L000067_75
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A ' CVII
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A ' CVII
 word I16A_SHLI + (r18)<<D16A + 16<<S16A
 word I16A_SARI + (r18)<<D16A + 16<<S16A ' sign extend
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRWORD + (r18)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' CVII
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' CVII
 word I16A_SHLI + (r0)<<D16A + 16<<S16A
 word I16A_SARI + (r0)<<D16A + 16<<S16A ' sign extend
' C_si34i_6709f912_registerlocalvar_L000067_68 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34k_6709f912_new_localvar_L000076 ' <symbol:new_localvar>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si34i_6709f912_registerlocalvar_L000067_69_L000070 ' reg ARG ADDRG
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (200)<<S32 ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r4)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r5)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si348_6709f912_checklimit_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si34i_6709f912_registerlocalvar_L000067_69_L000070 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((65535)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r4)<<D16A + (16)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl ' align long
 long I32_PSHF + ((-8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r20)<<S16A ' SUBI/P (3)
' C_si34k_6709f912_new_localvar_L000076_77 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34l_6709f912_getlocalvardesc_L000078 ' <symbol:getlocalvardesc>
 alignl ' align long
 long I32_PSHM + $540000<<S32 ' save registers
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (1)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
' C_si34l_6709f912_getlocalvardesc_L000078_79 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34m_6709f912_reglevel_L000080 ' <symbol:reglevel>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_si34m_6709f912_reglevel_L000080_83)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34m_6709f912_reglevel_L000080_82
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34m_6709f912_reglevel_L000080_85)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si34m_6709f912_reglevel_L000080_81)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34m_6709f912_reglevel_L000080_85
 alignl ' align long
C_si34m_6709f912_reglevel_L000080_83
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si34m_6709f912_reglevel_L000080_82)<<S32 ' GTI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_si34m_6709f912_reglevel_L000080_81
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaY_nvarstack

 alignl ' align long
C_luaY__nvarstack ' <symbol:luaY_nvarstack>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34m_6709f912_reglevel_L000080)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaY__nvarstack_87 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34n_6709f912_localdebuginfo_L000088 ' <symbol:localdebuginfo>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si34n_6709f912_localdebuginfo_L000088_90)<<S32 ' NEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_si34n_6709f912_localdebuginfo_L000088_89)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34n_6709f912_localdebuginfo_L000088_90
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_SHLI + (r22)<<D16A + 16<<S16A
 word I16A_SARI + (r22)<<D16A + 16<<S16A ' sign extend
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl ' align long
C_si34n_6709f912_localdebuginfo_L000088_89
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34o_6709f912_init_var_L000092 ' <symbol:init_var>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (9)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
' C_si34o_6709f912_init_var_L000092_93 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34p_6709f912_check_readonly_L000094 ' <symbol:check_readonly>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r19)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r19)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34p_6709f912_check_readonly_L000094_100)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34p_6709f912_check_readonly_L000094_103)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34p_6709f912_check_readonly_L000094_99)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si34p_6709f912_check_readonly_L000094_95)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34p_6709f912_check_readonly_L000094_99
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si34p_6709f912_check_readonly_L000094_97)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34p_6709f912_check_readonly_L000094_100
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34p_6709f912_check_readonly_L000094_97)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si34p_6709f912_check_readonly_L000094_97)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34p_6709f912_check_readonly_L000094_103
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34p_6709f912_check_readonly_L000094_97)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
C_si34p_6709f912_check_readonly_L000094_97
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34p_6709f912_check_readonly_L000094_106)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si34p_6709f912_check_readonly_L000094_108_L000109 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__semerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si34p_6709f912_check_readonly_L000094_106
 alignl ' align long
C_si34p_6709f912_check_readonly_L000094_95
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34r_6709f912_adjustlocalvars_L000110 ' <symbol:adjustlocalvars>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaY__nvarstack)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_si34r_6709f912_adjustlocalvars_L000110_115)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34r_6709f912_adjustlocalvars_L000110_112
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r18)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r11)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r11)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34i_6709f912_registerlocalvar_L000067)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRWORD + (r22)<<D16A + (r20)<<S16A ' ASGNI2 reg reg
' C_si34r_6709f912_adjustlocalvars_L000110_113 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_si34r_6709f912_adjustlocalvars_L000110_115
 word I16A_CMPS + (r17)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si34r_6709f912_adjustlocalvars_L000110_112)<<S32 ' LTI4 reg reg
' C_si34r_6709f912_adjustlocalvars_L000110_111 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34s_6709f912_removevars_L000116 ' <symbol:removevars>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SUBS + (r18)<<D16A + (r21)<<S16A ' SUBI/P (1)
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si34s_6709f912_removevars_L000116_119)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34s_6709f912_removevars_L000116_118
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34n_6709f912_localdebuginfo_L000088)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34s_6709f912_removevars_L000116_121)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_si34s_6709f912_removevars_L000116_121
 alignl ' align long
C_si34s_6709f912_removevars_L000116_119
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si34s_6709f912_removevars_L000116_118)<<S32 ' GTI4 reg reg
' C_si34s_6709f912_removevars_L000116_117 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34t_6709f912_searchupvalue_L000123 ' <symbol:searchupvalue>
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_si34t_6709f912_searchupvalue_L000123_128)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34t_6709f912_searchupvalue_L000123_125
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si34t_6709f912_searchupvalue_L000123_129)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_si34t_6709f912_searchupvalue_L000123_124)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34t_6709f912_searchupvalue_L000123_129
' C_si34t_6709f912_searchupvalue_L000123_126 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_si34t_6709f912_searchupvalue_L000123_128
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((51)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si34t_6709f912_searchupvalue_L000123_125)<<S32 ' LTI4 reg reg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
C_si34t_6709f912_searchupvalue_L000123_124
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34u_6709f912_allocupvalue_L000131 ' <symbol:allocupvalue>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r21)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si34u_6709f912_allocupvalue_L000131_133_L000134 ' reg ARG ADDRG
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (255)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((51)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si348_6709f912_checklimit_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si34u_6709f912_allocupvalue_L000131_133_L000134 ' reg ARG ADDRG
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (255)<<S32 ' reg ARG coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((51)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si34u_6709f912_allocupvalue_L000131_136)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34u_6709f912_allocupvalue_L000131_135
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_si34u_6709f912_allocupvalue_L000131_136
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si34u_6709f912_allocupvalue_L000131_135)<<S32 ' LTI4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((51)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r18)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
' C_si34u_6709f912_allocupvalue_L000131_132 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3410_6709f912_newupvalue_L000138 ' <symbol:newupvalue>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $ff0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34u_6709f912_allocupvalue_L000131)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3410_6709f912_newupvalue_L000138_140)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si3410_6709f912_newupvalue_L000138_141)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3410_6709f912_newupvalue_L000138_140
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r20)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r20)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_si3410_6709f912_newupvalue_L000138_141
 word I16A_WRLONG + (r21)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3410_6709f912_newupvalue_L000138_143)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3410_6709f912_newupvalue_L000138_143)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r3)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaC__barrier_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3410_6709f912_newupvalue_L000138_143)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3410_6709f912_newupvalue_L000138_143
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((51)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r0)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_si3410_6709f912_newupvalue_L000138_139 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3411_6709f912_searchvar_L000144 ' <symbol:searchvar>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si3411_6709f912_searchvar_L000144_149)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3411_6709f912_searchvar_L000144_146
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3411_6709f912_searchvar_L000144_150)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3411_6709f912_searchvar_L000144_152)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r3)<<D16A + (11)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3411_6709f912_searchvar_L000144_153)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3411_6709f912_searchvar_L000144_152
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34o_6709f912_init_var_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si3411_6709f912_searchvar_L000144_153
 word I16A_RDLONG + (r0)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_JMPA + (@C_si3411_6709f912_searchvar_L000144_145)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3411_6709f912_searchvar_L000144_150
' C_si3411_6709f912_searchvar_L000144_147 ' (symbol refcount = 0)
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_si3411_6709f912_searchvar_L000144_149
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_si3411_6709f912_searchvar_L000144_146)<<S32 ' GEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
C_si3411_6709f912_searchvar_L000144_145
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3412_6709f912_markupval_L000154 ' <symbol:markupval>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_JMPA + (@C_si3412_6709f912_markupval_L000154_157)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3412_6709f912_markupval_L000154_156
 word I16A_RDLONG + (r23)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C_si3412_6709f912_markupval_L000154_157
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r2)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si3412_6709f912_markupval_L000154_156)<<S32 ' GTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (13)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((54)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_si3412_6709f912_markupval_L000154_155 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3413_6709f912_marktobeclosed_L000159 ' <symbol:marktobeclosed>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (13)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (15)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((54)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_si3413_6709f912_marktobeclosed_L000159_160 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3414_6709f912_singlevaraux_L000161 ' <symbol:singlevaraux>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3414_6709f912_singlevaraux_L000161_163)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3414_6709f912_singlevaraux_L000161_164)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3414_6709f912_singlevaraux_L000161_163
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si3411_6709f912_searchvar_L000144)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si3414_6709f912_singlevaraux_L000161_165)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3414_6709f912_singlevaraux_L000161_166)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3414_6709f912_singlevaraux_L000161_166)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN2 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3412_6709f912_markupval_L000154)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3414_6709f912_singlevaraux_L000161_166)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3414_6709f912_singlevaraux_L000161_165
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34t_6709f912_searchupvalue_L000123)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_si3414_6709f912_singlevaraux_L000161_169)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si3414_6709f912_singlevaraux_L000161)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3414_6709f912_singlevaraux_L000161_173)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3414_6709f912_singlevaraux_L000161_162)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si3414_6709f912_singlevaraux_L000161_173
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si3410_6709f912_newupvalue_L000138)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
' C_si3414_6709f912_singlevaraux_L000161_172 ' (symbol refcount = 0)
 alignl ' align long
C_si3414_6709f912_singlevaraux_L000161_169
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + (r3)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si3414_6709f912_singlevaraux_L000161_166
 alignl ' align long
C_si3414_6709f912_singlevaraux_L000161_164
 alignl ' align long
C_si3414_6709f912_singlevaraux_L000161_162
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3415_6709f912_singlevar_L000174 ' <symbol:singlevar>
 alignl ' align long
 long I32_NEWF + 20<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si3414_6709f912_singlevaraux_L000161)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3415_6709f912_singlevar_L000174_176)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si3414_6709f912_singlevaraux_L000161)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34g_6709f912_codestring_L000063)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__indexed)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si3415_6709f912_singlevar_L000174_176
' C_si3415_6709f912_singlevar_L000174_175 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178 ' <symbol:adjust_assign>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r15)<<D16A + (r21)<<S16A ' SUBI/P
 word I16A_SUBS + (r15)<<D16A + (r19)<<S16A ' SUBI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3416_6709f912_adjust_assign_L000178_182)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (19)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3416_6709f912_adjust_assign_L000178_180)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178_182
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_si3416_6709f912_adjust_assign_L000178_183)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178_183
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__setreturns)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3416_6709f912_adjust_assign_L000178_181)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178_180
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3416_6709f912_adjust_assign_L000178_185)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178_185
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si3416_6709f912_adjust_assign_L000178_187)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__nil)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178_187
 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178_181
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si3416_6709f912_adjust_assign_L000178_189)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3416_6709f912_adjust_assign_L000178_190)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178_189
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_ADDS + (r20)<<D16A + (r15)<<S16A ' ADDI/P (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_si3416_6709f912_adjust_assign_L000178_190
' C_si3416_6709f912_adjust_assign_L000178_179 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3417_6709f912_jumpscopeerror_L000191 ' <symbol:jumpscopeerror>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODL + (r19)<<D16B
 alignl ' align long
 long @C_si3417_6709f912_jumpscopeerror_L000191_193_L000194 ' reg <- addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__semerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si3417_6709f912_jumpscopeerror_L000191_192 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3419_6709f912_solvegoto_L000195 ' <symbol:solvegoto>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r15)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_si3419_6709f912_solvegoto_L000195_197)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3417_6709f912_jumpscopeerror_L000191)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3419_6709f912_solvegoto_L000195_197
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__patchlist)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_si3419_6709f912_solvegoto_L000195_202)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3419_6709f912_solvegoto_L000195_199
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r15)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r1)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_CPYB + 16<<S32 ' ASGNB
' C_si3419_6709f912_solvegoto_L000195_200 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_si3419_6709f912_solvegoto_L000195_202
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si3419_6709f912_solvegoto_L000195_199)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_si3419_6709f912_solvegoto_L000195_196 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341a_6709f912_findlabel_L000203 ' <symbol:findlabel>
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_JMPA + (@C_si341a_6709f912_findlabel_L000203_208)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341a_6709f912_findlabel_L000203_205
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r19)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si341a_6709f912_findlabel_L000203_209)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_si341a_6709f912_findlabel_L000203_204)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341a_6709f912_findlabel_L000203_209
' C_si341a_6709f912_findlabel_L000203_206 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_si341a_6709f912_findlabel_L000203_208
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si341a_6709f912_findlabel_L000203_205)<<S32 ' LTI4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_si341a_6709f912_findlabel_L000203_204
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341b_6709f912_newlabelentry_L000211 ' <symbol:newlabelentry>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si341b_6709f912_newlabelentry_L000211_213_L000214 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((32767)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r4)<<D16A + (16)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r15)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (13)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_si341b_6709f912_newlabelentry_L000211_212 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341d_6709f912_newgotoentry_L000215 ' <symbol:newgotoentry>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_si341b_6709f912_newlabelentry_L000211)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_si341d_6709f912_newgotoentry_L000215_216 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341e_6709f912_solvegotos_L000217 ' <symbol:solvegotos>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_si341e_6709f912_solvegotos_L000217_220)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341e_6709f912_solvegotos_L000217_219
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r20)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si341e_6709f912_solvegotos_L000217_222)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (13)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_OR + (r15)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si3419_6709f912_solvegoto_L000195)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si341e_6709f912_solvegotos_L000217_223)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341e_6709f912_solvegotos_L000217_222
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_si341e_6709f912_solvegotos_L000217_223
 alignl ' align long
C_si341e_6709f912_solvegotos_L000217_220
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si341e_6709f912_solvegotos_L000217_219)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_si341e_6709f912_solvegotos_L000217_218 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341f_6709f912_createlabel_L000224 ' <symbol:createlabel>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r13)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__getlabel)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_si341b_6709f912_newlabelentry_L000211)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341f_6709f912_createlabel_L000224_226)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_si341f_6709f912_createlabel_L000224_226
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r13)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341e_6709f912_solvegotos_L000217)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341f_6709f912_createlabel_L000224_228)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaY__nvarstack)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (54)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r15)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si341f_6709f912_createlabel_L000224_225)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341f_6709f912_createlabel_L000224_228
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_si341f_6709f912_createlabel_L000224_225
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341g_6709f912_movegotosout_L000230 ' <symbol:movegotosout>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_JMPA + (@C_si341g_6709f912_movegotosout_L000230_235)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341g_6709f912_movegotosout_L000230_232
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34m_6709f912_reglevel_L000080)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34m_6709f912_reglevel_L000080)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPS + (r22)<<D16A + (r0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si341g_6709f912_movegotosout_L000230_236)<<S32 ' LEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (13)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (13)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_si341g_6709f912_movegotosout_L000230_236
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_si341g_6709f912_movegotosout_L000230_233 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_si341g_6709f912_movegotosout_L000230_235
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si341g_6709f912_movegotosout_L000230_232)<<S32 ' LTI4 reg reg
' C_si341g_6709f912_movegotosout_L000230_231 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341h_6709f912_enterblock_L000238 ' <symbol:enterblock>
 alignl ' align long
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (14)<<S16A ' ADDP4 reg coni
 word I16A_WRBYTE + (r2)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r4)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (13)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341h_6709f912_enterblock_L000238_241)<<S32 ' EQU4 reg coni
 word I16A_ADDSI + (r22)<<D16A + (15)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341h_6709f912_enterblock_L000238_241)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_si341h_6709f912_enterblock_L000238_242)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341h_6709f912_enterblock_L000238_241
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_si341h_6709f912_enterblock_L000238_242
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (15)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r3)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r3)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
' C_si341h_6709f912_enterblock_L000238_239 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341i_6709f912_undefgoto_L000243 ' <symbol:undefgoto>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si341i_6709f912_undefgoto_L000243_247_L000248 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaS__newlstr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_RDLONG + (r20)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si341i_6709f912_undefgoto_L000243_245)<<S32 ' NEU4 reg reg
 word I16B_LODL + (r19)<<D16B
 alignl ' align long
 long @C_si341i_6709f912_undefgoto_L000243_249_L000250 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_si341i_6709f912_undefgoto_L000243_246)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341i_6709f912_undefgoto_L000243_245
 word I16B_LODL + (r19)<<D16B
 alignl ' align long
 long @C_si341i_6709f912_undefgoto_L000243_251_L000252 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_si341i_6709f912_undefgoto_L000243_246
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__semerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si341i_6709f912_undefgoto_L000243_244 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341m_6709f912_leaveblock_L000253 ' <symbol:leaveblock>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34m_6709f912_reglevel_L000080)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (14)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341m_6709f912_leaveblock_L000253_255)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si341i_6709f912_undefgoto_L000243_247_L000248 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaS__newlstr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si341f_6709f912_createlabel_L000224)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_si341m_6709f912_leaveblock_L000253_255
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si341m_6709f912_leaveblock_L000253_257)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341m_6709f912_leaveblock_L000253_257)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (13)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341m_6709f912_leaveblock_L000253_257)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (54)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
C_si341m_6709f912_leaveblock_L000253_257
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34s_6709f912_removevars_L000116)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341m_6709f912_leaveblock_L000253_259)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341g_6709f912_movegotosout_L000230)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si341m_6709f912_leaveblock_L000253_260)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341m_6709f912_leaveblock_L000253_259
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_si341m_6709f912_leaveblock_L000253_261)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341i_6709f912_undefgoto_L000243)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si341m_6709f912_leaveblock_L000253_261
 alignl ' align long
C_si341m_6709f912_leaveblock_L000253_260
' C_si341m_6709f912_leaveblock_L000253_254 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341n_6709f912_addprototype_L000263 ' <symbol:addprototype>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r21)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si341n_6709f912_addprototype_L000263_265)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si341n_6709f912_addprototype_L000263_267_L000268 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((131071)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r4)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (28)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOV + RI<<D16A + (r15)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 28<<S16A ' arg size, rpsize = 0, spsize = 28
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__growaux_)<<S32
 word I16A_ADDI + SP<<D16A + 24<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si341n_6709f912_addprototype_L000263_270)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341n_6709f912_addprototype_L000263_269
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
C_si341n_6709f912_addprototype_L000263_270
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r13)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si341n_6709f912_addprototype_L000263_269)<<S32 ' LTI4 reg reg
 alignl ' align long
C_si341n_6709f912_addprototype_L000263_265
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaF__newproto)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341n_6709f912_addprototype_L000263_273)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341n_6709f912_addprototype_L000263_273)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaC__barrier_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si341n_6709f912_addprototype_L000263_273)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341n_6709f912_addprototype_L000263_273
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_si341n_6709f912_addprototype_L000263_264 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341p_6709f912_codeclosure_L000274 ' <symbol:codeclosure>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (79)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_x)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (17)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si341p_6709f912_codeclosure_L000274_275 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341q_6709f912_open_func_L000276 ' <symbol:open_func>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r17)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((53)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((51)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((54)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341q_6709f912_open_func_L000276_279)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341q_6709f912_open_func_L000276_279)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaC__barrier_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si341q_6709f912_open_func_L000276_279)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341q_6709f912_open_func_L000276_279
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_si341q_6709f912_open_func_L000276_277 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341r_6709f912_close_func_L000280 ' <symbol:close_func>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r21)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaY__nvarstack)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__ret)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__finish)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (20)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__shrinkvector_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (24)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__shrinkvector_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r2)<<D16A + (8)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r3)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__shrinkvector_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r2)<<D16A + (8)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (16)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__shrinkvector_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (28)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__shrinkvector_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r2)<<D16A + (12)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVII
 word I16A_SHLI + (r3)<<D16A + 16<<S16A
 word I16A_SARI + (r3)<<D16A + 16<<S16A ' sign extend
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__shrinkvector_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r2)<<D16A + (8)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((51)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaM__shrinkvector_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si341r_6709f912_close_func_L000280_282)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaC__step)<<S32 ' CALL addrg
 alignl ' align long
C_si341r_6709f912_close_func_L000280_282
' C_si341r_6709f912_close_func_L000280_281 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341s_6709f912_block_follow_L000284 ' <symbol:block_follow>
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (276)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341s_6709f912_block_follow_L000284_290)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (276)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si341s_6709f912_block_follow_L000284_292)<<S32 ' GTI4 reg coni
' C_si341s_6709f912_block_follow_L000284_291 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (259)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341s_6709f912_block_follow_L000284_289)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (260)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341s_6709f912_block_follow_L000284_289)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (261)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341s_6709f912_block_follow_L000284_289)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si341s_6709f912_block_follow_L000284_286)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341s_6709f912_block_follow_L000284_292
 alignl ' align long
 long I32_MOVI + RI<<D32 + (288)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341s_6709f912_block_follow_L000284_289)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si341s_6709f912_block_follow_L000284_286)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341s_6709f912_block_follow_L000284_289
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si341s_6709f912_block_follow_L000284_285)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341s_6709f912_block_follow_L000284_290
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_si341s_6709f912_block_follow_L000284_285)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341s_6709f912_block_follow_L000284_286
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_si341s_6709f912_block_follow_L000284_285
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341t_6709f912_statlist_L000293 ' <symbol:statlist>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_si341t_6709f912_statlist_L000293_296)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341t_6709f912_statlist_L000293_295
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (273)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si341t_6709f912_statlist_L000293_298)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34_6709f912_statement_L000020)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si341t_6709f912_statlist_L000293_294)<<S32 ' JUMPV addrg
 alignl ' align long
C_si341t_6709f912_statlist_L000293_298
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34_6709f912_statement_L000020)<<S32 ' CALL addrg
 alignl ' align long
C_si341t_6709f912_statlist_L000293_296
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341s_6709f912_block_follow_L000284)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si341t_6709f912_statlist_L000293_295)<<S32 ' EQI4 reg coni
 alignl ' align long
C_si341t_6709f912_statlist_L000293_294
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341u_6709f912_fieldsel_L000300 ' <symbol:fieldsel>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2anyregup)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34h_6709f912_codename_L000065)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__indexed)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_si341u_6709f912_fieldsel_L000300_301 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341v_6709f912_yindex_L000302 ' <symbol:yindex>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2val)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (93)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si341v_6709f912_yindex_L000302_303 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3420_6709f912_recfield_L000304 ' <symbol:recfield>
 alignl ' align long
 long I32_NEWF + 52<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (291)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3420_6709f912_recfield_L000304_306)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si3420_6709f912_recfield_L000304_308_L000309 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long 2147483647 ' reg ARG con
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si348_6709f912_checklimit_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34h_6709f912_codename_L000065)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3420_6709f912_recfield_L000304_307)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3420_6709f912_recfield_L000304_306
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341v_6709f912_yindex_L000302)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3420_6709f912_recfield_L000304_307
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (61)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r1)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_CPYB + 16<<S32 ' ASGNB
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__indexed)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-56)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__storevar)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_si3420_6709f912_recfield_L000304_305 ' (symbol refcount = 0)
 word I16B_POPM + 13<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3422_6709f912_closelistfield_L000310 ' <symbol:closelistfield>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3422_6709f912_closelistfield_L000310_312)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si3422_6709f912_closelistfield_L000310_311)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3422_6709f912_closelistfield_L000310_312
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (50)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3422_6709f912_closelistfield_L000310_314)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaK__setlist)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_si3422_6709f912_closelistfield_L000310_314
 alignl ' align long
C_si3422_6709f912_closelistfield_L000310_311
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3423_6709f912_lastlistfield_L000316 ' <symbol:lastlistfield>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3423_6709f912_lastlistfield_L000316_318)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si3423_6709f912_lastlistfield_L000316_317)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3423_6709f912_lastlistfield_L000316_318
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3423_6709f912_lastlistfield_L000316_322)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (19)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3423_6709f912_lastlistfield_L000316_320)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si3423_6709f912_lastlistfield_L000316_322
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__setreturns)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaK__setlist)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si3423_6709f912_lastlistfield_L000316_321)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3423_6709f912_lastlistfield_L000316_320
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3423_6709f912_lastlistfield_L000316_323)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3423_6709f912_lastlistfield_L000316_323
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaK__setlist)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
C_si3423_6709f912_lastlistfield_L000316_321
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_si3423_6709f912_lastlistfield_L000316_317
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3424_6709f912_listfield_L000325 ' <symbol:listfield>
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
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_si3424_6709f912_listfield_L000325_326 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3425_6709f912_field_L000327 ' <symbol:field>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3425_6709f912_field_L000327_335)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si3425_6709f912_field_L000327_329)<<S32 ' LTI4 reg coni
' C_si3425_6709f912_field_L000327_336 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (291)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3425_6709f912_field_L000327_332)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si3425_6709f912_field_L000327_329)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3425_6709f912_field_L000327_332
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__lookahead)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r0)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3425_6709f912_field_L000327_333)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3424_6709f912_listfield_L000325)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3425_6709f912_field_L000327_330)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3425_6709f912_field_L000327_333
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3420_6709f912_recfield_L000304)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3425_6709f912_field_L000327_330)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3425_6709f912_field_L000327_335
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3420_6709f912_recfield_L000304)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3425_6709f912_field_L000327_330)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3425_6709f912_field_L000327_329
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3424_6709f912_listfield_L000325)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3425_6709f912_field_L000327_330
' C_si3425_6709f912_field_L000327_328 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3426_6709f912_constructor_L000337 ' <symbol:constructor>
 alignl ' align long
 long I32_NEWF + 40<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (19)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__code)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + (r3)<<D16A + (8)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (123)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3426_6709f912_constructor_L000337_343
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (125)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3426_6709f912_constructor_L000337_346)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si3426_6709f912_constructor_L000337_345)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3426_6709f912_constructor_L000337_346
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3422_6709f912_closelistfield_L000310)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3425_6709f912_field_L000327)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si3426_6709f912_constructor_L000337_344 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3426_6709f912_constructor_L000337_343)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (59)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3426_6709f912_constructor_L000337_343)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si3426_6709f912_constructor_L000337_345
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (123)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (125)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3423_6709f912_lastlistfield_L000316)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__settablesize)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
' C_si3426_6709f912_constructor_L000337_338 ' (symbol refcount = 0)
 word I16B_POPM + 10<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3427_6709f912_setvararg_L000350 ' <symbol:setvararg>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (81)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
' C_si3427_6709f912_setvararg_L000350_351 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3428_6709f912_parlist_L000352 ' <symbol:parlist>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (41)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3428_6709f912_parlist_L000352_354)<<S32 ' EQI4 reg coni
 alignl ' align long
C_si3428_6709f912_parlist_L000352_356
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (280)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3428_6709f912_parlist_L000352_363)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (280)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si3428_6709f912_parlist_L000352_359)<<S32 ' LTI4 reg coni
' C_si3428_6709f912_parlist_L000352_366 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (291)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3428_6709f912_parlist_L000352_362)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si3428_6709f912_parlist_L000352_359)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3428_6709f912_parlist_L000352_362
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si3428_6709f912_parlist_L000352_360)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3428_6709f912_parlist_L000352_363
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_si3428_6709f912_parlist_L000352_360)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3428_6709f912_parlist_L000352_359
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si3428_6709f912_parlist_L000352_364_L000365 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3428_6709f912_parlist_L000352_360
' C_si3428_6709f912_parlist_L000352_357 ' (symbol refcount = 0)
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3428_6709f912_parlist_L000352_367)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3428_6709f912_parlist_L000352_356)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si3428_6709f912_parlist_L000352_367
 alignl ' align long
C_si3428_6709f912_parlist_L000352_354
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34r_6709f912_adjustlocalvars_L000110)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3428_6709f912_parlist_L000352_368)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3427_6709f912_setvararg_L000350)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3428_6709f912_parlist_L000352_368
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si3428_6709f912_parlist_L000352_353 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342a_6709f912_body_L000370 ' <symbol:body>
 alignl ' align long
 long I32_NEWF + 72<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341n_6709f912_addprototype_L000263)<<S32 ' CALL addrg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-76)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341q_6709f912_open_func_L000276)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (40)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342a_6709f912_body_L000370_372)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si342a_6709f912_body_L000370_374_L000375 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34r_6709f912_adjustlocalvars_L000110)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342a_6709f912_body_L000370_372
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3428_6709f912_parlist_L000352)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (41)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341t_6709f912_statlist_L000293)<<S32 ' CALL addrg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (264)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (261)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341p_6709f912_codeclosure_L000274)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341r_6709f912_close_func_L000280)<<S32 ' CALL addrg
' C_si342a_6709f912_body_L000370_371 ' (symbol refcount = 0)
 word I16B_POPM + 18<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342c_6709f912_explist_L000376 ' <symbol:explist>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342c_6709f912_explist_L000376_379)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342c_6709f912_explist_L000376_378
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_si342c_6709f912_explist_L000376_379
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342c_6709f912_explist_L000376_378)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_si342c_6709f912_explist_L000376_377 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342d_6709f912_funcargs_L000381 ' <symbol:funcargs>
 alignl ' align long
 long I32_NEWF + 20<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (123)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342d_6709f912_funcargs_L000381_392)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (123)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342d_6709f912_funcargs_L000381_397)<<S32 ' GTI4 reg coni
' C_si342d_6709f912_funcargs_L000381_396 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (40)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342d_6709f912_funcargs_L000381_386)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342d_6709f912_funcargs_L000381_383)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_397
 alignl ' align long
 long I32_MOVI + RI<<D32 + (292)<<S32
 word I16A_CMPS + (r13)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342d_6709f912_funcargs_L000381_393)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342d_6709f912_funcargs_L000381_383)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_386
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (41)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342d_6709f912_funcargs_L000381_387)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si342d_6709f912_funcargs_L000381_388)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_387
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342c_6709f912_explist_L000376)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342d_6709f912_funcargs_L000381_391)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (19)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342d_6709f912_funcargs_L000381_389)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_391
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__setreturns)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_389
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_388
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (40)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (41)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342d_6709f912_funcargs_L000381_384)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_392
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3426_6709f912_constructor_L000337)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342d_6709f912_funcargs_L000381_384)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_393
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34g_6709f912_codestring_L000063)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342d_6709f912_funcargs_L000381_384)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_383
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si342d_6709f912_funcargs_L000381_394_L000395 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_384
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342d_6709f912_funcargs_L000381_400)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (19)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342d_6709f912_funcargs_L000381_398)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_400
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si342d_6709f912_funcargs_L000381_399)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_398
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342d_6709f912_funcargs_L000381_401)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_401
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_si342d_6709f912_funcargs_L000381_399
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (68)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r17)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (18)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__fixline)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_si342d_6709f912_funcargs_L000381_382 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342f_6709f912_primaryexp_L000403 ' <symbol:primaryexp>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (40)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342f_6709f912_primaryexp_L000403_408)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (40)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si342f_6709f912_primaryexp_L000403_405)<<S32 ' LTI4 reg coni
' C_si342f_6709f912_primaryexp_L000403_412 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (291)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342f_6709f912_primaryexp_L000403_409)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342f_6709f912_primaryexp_L000403_405)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342f_6709f912_primaryexp_L000403_408
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (40)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (41)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__dischargevars)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342f_6709f912_primaryexp_L000403_404)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342f_6709f912_primaryexp_L000403_409
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3415_6709f912_singlevar_L000174)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342f_6709f912_primaryexp_L000403_404)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342f_6709f912_primaryexp_L000403_405
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si342f_6709f912_primaryexp_L000403_410_L000411 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342f_6709f912_primaryexp_L000403_404
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413 ' <symbol:suffixedexp>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342f_6709f912_primaryexp_L000403)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413_415
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342h_6709f912_suffixedexp_L000413_424)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342h_6709f912_suffixedexp_L000413_427)<<S32 ' GTI4 reg coni
' C_si342h_6709f912_suffixedexp_L000413_426 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (40)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342h_6709f912_suffixedexp_L000413_425)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (40)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si342h_6709f912_suffixedexp_L000413_414)<<S32 ' LTI4 reg coni
' C_si342h_6709f912_suffixedexp_L000413_428 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342h_6709f912_suffixedexp_L000413_422)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342h_6709f912_suffixedexp_L000413_414)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413_427
 alignl ' align long
 long I32_MOVI + RI<<D32 + (123)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342h_6709f912_suffixedexp_L000413_425)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (123)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342h_6709f912_suffixedexp_L000413_430)<<S32 ' GTI4 reg coni
' C_si342h_6709f912_suffixedexp_L000413_429 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (91)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342h_6709f912_suffixedexp_L000413_423)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342h_6709f912_suffixedexp_L000413_414)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413_430
 alignl ' align long
 long I32_MOVI + RI<<D32 + (292)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342h_6709f912_suffixedexp_L000413_425)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342h_6709f912_suffixedexp_L000413_414)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413_422
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341u_6709f912_fieldsel_L000300)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342h_6709f912_suffixedexp_L000413_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413_423
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2anyregup)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341v_6709f912_yindex_L000302)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__indexed)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342h_6709f912_suffixedexp_L000413_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413_424
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34h_6709f912_codename_L000065)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__self)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si342d_6709f912_funcargs_L000381)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342h_6709f912_suffixedexp_L000413_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413_425
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si342d_6709f912_funcargs_L000381)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342h_6709f912_suffixedexp_L000413_415)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342h_6709f912_suffixedexp_L000413_414
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342i_6709f912_simpleexp_L000431 ' <symbol:simpleexp>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (269)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_439)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (269)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342i_6709f912_simpleexp_L000431_450)<<S32 ' GTI4 reg coni
' C_si342i_6709f912_simpleexp_L000431_449 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (123)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_447)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (123)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si342i_6709f912_simpleexp_L000431_433)<<S32 ' LTI4 reg coni
' C_si342i_6709f912_simpleexp_L000431_451 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (262)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_441)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (264)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_448)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_450
 alignl ' align long
 long I32_MOVI + RI<<D32 + (280)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_442)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (280)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342i_6709f912_simpleexp_L000431_453)<<S32 ' GTI4 reg coni
' C_si342i_6709f912_simpleexp_L000431_452 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (275)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_440)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_453
 alignl ' align long
 long I32_MOVI + RI<<D32 + (289)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_436)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (290)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_437)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (292)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342i_6709f912_simpleexp_L000431_438)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_433)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_436
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRF4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNF4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_434)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_437
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_434)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_438
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34g_6709f912_codestring_L000063)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_434)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_439
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_434)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_440
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_434)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_441
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_434)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_442
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342i_6709f912_simpleexp_L000431_443)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si342i_6709f912_simpleexp_L000431_445_L000446 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_443
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (80)<<S32
 word I16B_PSHL ' stack ARG coni
 alignl ' align long
 long I32_PSHF + ((-8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (19)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_434)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_447
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3426_6709f912_constructor_L000337)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_432)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_448
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si342a_6709f912_body_L000370)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_432)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_433
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342h_6709f912_suffixedexp_L000413)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342i_6709f912_simpleexp_L000431_432)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_434
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_432
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342k_6709f912_getunopr_L000454 ' <symbol:getunopr>
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342k_6709f912_getunopr_L000454_459)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342k_6709f912_getunopr_L000454_463)<<S32 ' GTI4 reg coni
' C_si342k_6709f912_getunopr_L000454_462 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (35)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342k_6709f912_getunopr_L000454_461)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342k_6709f912_getunopr_L000454_456)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342k_6709f912_getunopr_L000454_463
 alignl ' align long
 long I32_MOVI + RI<<D32 + (126)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342k_6709f912_getunopr_L000454_460)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (126)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si342k_6709f912_getunopr_L000454_456)<<S32 ' LTI4 reg coni
' C_si342k_6709f912_getunopr_L000454_464 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (270)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342k_6709f912_getunopr_L000454_458)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342k_6709f912_getunopr_L000454_456)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342k_6709f912_getunopr_L000454_458
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342k_6709f912_getunopr_L000454_455)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342k_6709f912_getunopr_L000454_459
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342k_6709f912_getunopr_L000454_455)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342k_6709f912_getunopr_L000454_460
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342k_6709f912_getunopr_L000454_455)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342k_6709f912_getunopr_L000454_461
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342k_6709f912_getunopr_L000454_455)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342k_6709f912_getunopr_L000454_456
 word I16A_MOVI + R0<<D16A + (4)<<S16A ' RET coni
 alignl ' align long
C_si342k_6709f912_getunopr_L000454_455
 word I16B_RETN
 alignl ' align long
 alignl ' align long

 alignl ' align long
C_si342l_6709f912_getbinopr_L000465 ' <symbol:getbinopr>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 alignl ' align long
 long I32_MOVI + RI<<D32 + (94)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342l_6709f912_getbinopr_L000465_473)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (94)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342l_6709f912_getbinopr_L000465_491)<<S32 ' GTI4 reg coni
' C_si342l_6709f912_getbinopr_L000465_490 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (37)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si342l_6709f912_getbinopr_L000465_467)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (47)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342l_6709f912_getbinopr_L000465_492)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_si342l_6709f912_getbinopr_L000465_493_L000495-148 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_493_L000495 ' <symbol:493>
 long @C_si342l_6709f912_getbinopr_L000465_472
 long @C_si342l_6709f912_getbinopr_L000465_476
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_471
 long @C_si342l_6709f912_getbinopr_L000465_469
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_470
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_474

' Catalina Code

DAT ' code segment
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_492
 alignl ' align long
 long I32_MOVI + RI<<D32 + (60)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342l_6709f912_getbinopr_L000465_484)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (62)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342l_6709f912_getbinopr_L000465_486)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_467)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_491
 alignl ' align long
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342l_6709f912_getbinopr_L000465_488)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342l_6709f912_getbinopr_L000465_498)<<S32 ' GTI4 reg coni
' C_si342l_6709f912_getbinopr_L000465_497 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (124)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342l_6709f912_getbinopr_L000465_477)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (126)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342l_6709f912_getbinopr_L000465_478)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_467)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_498
 alignl ' align long
 long I32_MOVI + RI<<D32 + (271)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si342l_6709f912_getbinopr_L000465_467)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (286)<<S32
 word I16A_CMPS + (r2)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342l_6709f912_getbinopr_L000465_467)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_si342l_6709f912_getbinopr_L000465_499_L000501-1084 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_499_L000501 ' <symbol:499>
 long @C_si342l_6709f912_getbinopr_L000465_489
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_475
 long @C_si342l_6709f912_getbinopr_L000465_481
 long @C_si342l_6709f912_getbinopr_L000465_467
 long @C_si342l_6709f912_getbinopr_L000465_483
 long @C_si342l_6709f912_getbinopr_L000465_487
 long @C_si342l_6709f912_getbinopr_L000465_485
 long @C_si342l_6709f912_getbinopr_L000465_482
 long @C_si342l_6709f912_getbinopr_L000465_479
 long @C_si342l_6709f912_getbinopr_L000465_480

' Catalina Code

DAT ' code segment
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_469
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_470
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_471
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_472
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_473
 word I16A_MOVI + R0<<D16A + (4)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_474
 word I16A_MOVI + R0<<D16A + (5)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_475
 word I16A_MOVI + R0<<D16A + (6)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_476
 word I16A_MOVI + R0<<D16A + (7)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_477
 word I16A_MOVI + R0<<D16A + (8)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_478
 word I16A_MOVI + R0<<D16A + (9)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_479
 word I16A_MOVI + R0<<D16A + (10)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_480
 word I16A_MOVI + R0<<D16A + (11)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_481
 word I16A_MOVI + R0<<D16A + (12)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_482
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_483
 word I16A_MOVI + R0<<D16A + (13)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_484
 word I16A_MOVI + R0<<D16A + (14)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_485
 word I16A_MOVI + R0<<D16A + (15)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_486
 word I16A_MOVI + R0<<D16A + (17)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_487
 word I16A_MOVI + R0<<D16A + (18)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_488
 word I16A_MOVI + R0<<D16A + (19)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_489
 word I16A_MOVI + R0<<D16A + (20)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si342l_6709f912_getbinopr_L000465_466)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_467
 word I16A_MOVI + R0<<D16A + (21)<<S16A ' RET coni
 alignl ' align long
C_si342l_6709f912_getbinopr_L000465_466
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_si342q_6709f912_priority_L000504 ' <symbol:priority>
 byte $a
 byte $a
 byte $a
 byte $a
 byte $b
 byte $b
 byte $b
 byte $b
 byte $e
 byte $d
 byte $b
 byte $b
 byte $b
 byte $b
 byte $6
 byte $6
 byte $4
 byte $4
 byte $5
 byte $5
 byte $7
 byte $7
 byte $7
 byte $7
 byte $9
 byte $8
 byte $3
 byte $3
 byte $3
 byte $3
 byte $3
 byte $3
 byte $3
 byte $3
 byte $3
 byte $3
 byte $3
 byte $3
 byte $2
 byte $2
 byte $1
 byte $1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_si342r_6709f912_subexpr_L000505 ' <symbol:subexpr>
 alignl ' align long
 long I32_NEWF + 20<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaE__incC_stack)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si342k_6709f912_getunopr_L000454)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342r_6709f912_subexpr_L000505_507)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (12)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si342r_6709f912_subexpr_L000505)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaK__prefix)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342r_6709f912_subexpr_L000505_508)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342r_6709f912_subexpr_L000505_507
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342i_6709f912_simpleexp_L000431)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342r_6709f912_subexpr_L000505_508
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si342l_6709f912_getbinopr_L000465)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_si342r_6709f912_subexpr_L000505_510)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342r_6709f912_subexpr_L000505_509
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__infix)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_si342q_6709f912_priority_L000504+1 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si342r_6709f912_subexpr_L000505)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__posfix)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_si342r_6709f912_subexpr_L000505_510
 word I16A_CMPSI + (r17)<<D16A + (21)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342r_6709f912_subexpr_L000505_513)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_si342q_6709f912_priority_L000504 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342r_6709f912_subexpr_L000505_509)<<S32 ' GTI4 reg reg
 alignl ' align long
C_si342r_6709f912_subexpr_L000505_513
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_si342r_6709f912_subexpr_L000505_506 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si341_6709f912_expr_L000021 ' <symbol:expr>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si342r_6709f912_subexpr_L000505)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_si341_6709f912_expr_L000021_514 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342s_6709f912_block_L000515 ' <symbol:block>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341t_6709f912_statlist_L000293)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
' C_si342s_6709f912_block_L000515_516 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342t_6709f912_check_conflict_L000517 ' <symbol:check_conflict>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_si342t_6709f912_check_conflict_L000517_522)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_519
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342t_6709f912_check_conflict_L000517_523)<<S32 ' GTI4 reg reg
 word I16A_CMPSI + (r22)<<D16A + (15)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342t_6709f912_check_conflict_L000517_523)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (13)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_525)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_526)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (10)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_526)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (10)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si342t_6709f912_check_conflict_L000517_526)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_525
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_529)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (10)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_529)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (10)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_529
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (12)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_531)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_531)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI2 reg
 word I16A_SHLI + (r22)<<D16A + 16<<S16A
 word I16A_SARI + (r22)<<D16A + 16<<S16A ' sign extend
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_531)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_531
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_526
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_523
' C_si342t_6709f912_check_conflict_L000517_520 ' (symbol refcount = 0)
 word I16A_RDLONG + (r21)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_522
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_519)<<S32 ' NEU4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342t_6709f912_check_conflict_L000517_533)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (9)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si342t_6709f912_check_conflict_L000517_535)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r4)<<D16B ' zero extend
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (0)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r13)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342t_6709f912_check_conflict_L000517_536)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_535
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOVI + RI<<D16A + (9)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r13)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_536
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342t_6709f912_check_conflict_L000517_533
' C_si342t_6709f912_check_conflict_L000517_518 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si342u_6709f912_restassign_L000537 ' <symbol:restassign>
 alignl ' align long
 long I32_NEWF + 36<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (9)<<S16A ' reg <- coni
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342u_6709f912_restassign_L000537_541)<<S32 ' GTI4 reg reg
 word I16A_CMPSI + (r22)<<D16A + (15)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si342u_6709f912_restassign_L000537_539)<<S32 ' LEI4 reg coni
 alignl ' align long
C_si342u_6709f912_restassign_L000537_541
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si342u_6709f912_restassign_L000537_542_L000543 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si342u_6709f912_restassign_L000537_539
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34p_6709f912_check_readonly_L000094)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342u_6709f912_restassign_L000537_544)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342h_6709f912_suffixedexp_L000413)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si342u_6709f912_restassign_L000537_551)<<S32 ' GTI4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (15)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si342u_6709f912_restassign_L000537_547)<<S32 ' LEI4 reg coni
 alignl ' align long
C_si342u_6709f912_restassign_L000537_551
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si342t_6709f912_check_conflict_L000517)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si342u_6709f912_restassign_L000537_547
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaE__incC_stack)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si342u_6709f912_restassign_L000537)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si342u_6709f912_restassign_L000537_545)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342u_6709f912_restassign_L000537_544
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (61)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342c_6709f912_explist_L000376)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si342u_6709f912_restassign_L000537_553)<<S32 ' EQI4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si3416_6709f912_adjust_assign_L000178)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342u_6709f912_restassign_L000537_554)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342u_6709f912_restassign_L000537_553
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__setoneret)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__storevar)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si342u_6709f912_restassign_L000537_538)<<S32 ' JUMPV addrg
 alignl ' align long
C_si342u_6709f912_restassign_L000537_554
 alignl ' align long
C_si342u_6709f912_restassign_L000537_545
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOVI + (r3)<<D16A + (8)<<S16A ' reg ARG coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si34f_6709f912_init_exp_L000061)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__storevar)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si342u_6709f912_restassign_L000537_538
 word I16B_POPM + 9<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3430_6709f912_cond_L000555 ' <symbol:cond>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3430_6709f912_cond_L000555_557)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_si3430_6709f912_cond_L000555_557
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__goiftrue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_si3430_6709f912_cond_L000555_556 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3431_6709f912_gotostat_L000560 ' <symbol:gotostat>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341a_6709f912_findlabel_L000203)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3431_6709f912_gotostat_L000560_562)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si341d_6709f912_newgotoentry_L000215)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3431_6709f912_gotostat_L000560_563)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3431_6709f912_gotostat_L000560_562
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34m_6709f912_reglevel_L000080)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaY__nvarstack)<<S32 ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si3431_6709f912_gotostat_L000560_564)<<S32 ' LEI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (54)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
C_si3431_6709f912_gotostat_L000560_564
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__patchlist)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si3431_6709f912_gotostat_L000560_563
' C_si3431_6709f912_gotostat_L000560_561 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3432_6709f912_breakstat_L000566 ' <symbol:breakstat>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si341i_6709f912_undefgoto_L000243_247_L000248 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaS__newlstr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si341d_6709f912_newgotoentry_L000215)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
' C_si3432_6709f912_breakstat_L000566_567 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3433_6709f912_checkrepeated_L000568 ' <symbol:checkrepeated>
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
 long I32_CALA + (@C_si341a_6709f912_findlabel_L000203)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3433_6709f912_checkrepeated_L000568_570)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_si3433_6709f912_checkrepeated_L000568_572_L000573 ' reg <- addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r5)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__semerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3433_6709f912_checkrepeated_L000568_570
' C_si3433_6709f912_checkrepeated_L000568_569 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3435_6709f912_labelstat_L000574 ' <symbol:labelstat>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (287)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3435_6709f912_labelstat_L000574_577)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3435_6709f912_labelstat_L000574_576
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34_6709f912_statement_L000020)<<S32 ' CALL addrg
 alignl ' align long
C_si3435_6709f912_labelstat_L000574_577
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (59)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3435_6709f912_labelstat_L000574_576)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (287)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3435_6709f912_labelstat_L000574_576)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3433_6709f912_checkrepeated_L000568)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341s_6709f912_block_follow_L000284)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si341f_6709f912_createlabel_L000224)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
' C_si3435_6709f912_labelstat_L000574_575 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3436_6709f912_whilestat_L000579 ' <symbol:whilestat>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__getlabel)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3430_6709f912_cond_L000555)<<S32 ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (258)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si342s_6709f912_block_L000515)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__patchlist)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (277)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (261)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__patchtohere)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si3436_6709f912_whilestat_L000579_580 ' (symbol refcount = 0)
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3437_6709f912_repeatstat_L000581 ' <symbol:repeatstat>
 alignl ' align long
 long I32_NEWF + 40<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__getlabel)<<S32 ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341t_6709f912_statlist_L000293)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (272)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (276)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3430_6709f912_cond_L000555)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
 word I16B_LODF + ((-7)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3437_6709f912_repeatstat_L000581_583)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__patchtohere)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34m_6709f912_reglevel_L000080)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (54)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__patchtohere)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3437_6709f912_repeatstat_L000581_583
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__patchlist)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
' C_si3437_6709f912_repeatstat_L000581_582 ' (symbol refcount = 0)
 word I16B_POPM + 10<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3438_6709f912_exp1_L000587 ' <symbol:exp1>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si3438_6709f912_exp1_L000587_588 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3439_6709f912_fixforjump_L000589 ' <symbol:fixforjump>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' SUBI/P
 word I16A_SUBS + (r15)<<D16A + (r22)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3439_6709f912_fixforjump_L000589_591)<<S32 ' EQI4 reg coni
 word I16A_NEG + (r15)<<D16A + (r15)<<S16A ' NEGI4
 alignl ' align long
C_si3439_6709f912_fixforjump_L000589_591
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((131071)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_si3439_6709f912_fixforjump_L000589_593)<<S32 ' LEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si3439_6709f912_fixforjump_L000589_595_L000596 ' reg ARG ADDRG
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3439_6709f912_fixforjump_L000589_593
 word I16A_RDLONG + (r22)<<D16A + (r13)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 32767 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + (15)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long $ffff8000 ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r13)<<S16A ' ASGNU4 reg reg
' C_si3439_6709f912_fixforjump_L000589_590 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_si343b_6709f912_forbody_L000597_forprep_L000600 ' <symbol:forprep>
 long 74
 long 75

 alignl ' align long
C_si343b_6709f912_forbody_L000597_forloop_L000602 ' <symbol:forloop>
 long 73
 long 77

' Catalina Code

DAT ' code segment

 alignl ' align long
C_si343b_6709f912_forbody_L000597 ' <symbol:forbody>
 alignl ' align long
 long I32_NEWF + 20<<S32
 alignl ' align long
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (258)<<S32 ' reg ARG coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_si343b_6709f912_forbody_L000597_forprep_L000600 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_x)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34r_6709f912_adjustlocalvars_L000110)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si342s_6709f912_block_L000515)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__getlabel)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si3439_6709f912_fixforjump_L000589)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343b_6709f912_forbody_L000597_603)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (76)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r15)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__fixline)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343b_6709f912_forbody_L000597_603
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_si343b_6709f912_forbody_L000597_forloop_L000602 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_x)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si3439_6709f912_fixforjump_L000589)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__fixline)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si343b_6709f912_forbody_L000597_598 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343e_6709f912_fornum_L000605 ' <symbol:fornum>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si343e_6709f912_fornum_L000605_607_L000608 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si343e_6709f912_fornum_L000605_607_L000608 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si343e_6709f912_fornum_L000605_607_L000608 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (61)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3438_6709f912_exp1_L000587)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3438_6709f912_exp1_L000587)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343e_6709f912_fornum_L000605_609)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3438_6709f912_exp1_L000587)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si343e_6709f912_fornum_L000605_610)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343e_6709f912_fornum_L000605_609
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__int)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__reserveregs)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343e_6709f912_fornum_L000605_610
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34r_6709f912_adjustlocalvars_L000110)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_si343b_6709f912_forbody_L000597)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
' C_si343e_6709f912_fornum_L000605_606 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343g_6709f912_forlist_L000611 ' <symbol:forlist>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r19)<<D16A + (5)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si343e_6709f912_fornum_L000605_607_L000608 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si343e_6709f912_fornum_L000605_607_L000608 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si343e_6709f912_fornum_L000605_607_L000608 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (11)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si343e_6709f912_fornum_L000605_607_L000608 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaX__newstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si343g_6709f912_forlist_L000611_614)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343g_6709f912_forlist_L000611_613
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_si343g_6709f912_forlist_L000611_614
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343g_6709f912_forlist_L000611_613)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (267)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342c_6709f912_explist_L000376)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r4)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si3416_6709f912_adjust_assign_L000178)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34r_6709f912_adjustlocalvars_L000110)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3413_6709f912_marktobeclosed_L000159)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r3)<<D16A + (4)<<S16A ' SUBI4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_si343b_6709f912_forbody_L000597)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
' C_si343g_6709f912_forlist_L000611_612 ' (symbol refcount = 0)
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343h_6709f912_forstat_L000616 ' <symbol:forstat>
 alignl ' align long
 long I32_NEWF + 20<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343h_6709f912_forstat_L000616_621)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si343h_6709f912_forstat_L000616_626)<<S32 ' GTI4 reg coni
' C_si343h_6709f912_forstat_L000616_625 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (44)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343h_6709f912_forstat_L000616_622)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si343h_6709f912_forstat_L000616_618)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343h_6709f912_forstat_L000616_626
 alignl ' align long
 long I32_MOVI + RI<<D32 + (267)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343h_6709f912_forstat_L000616_622)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si343h_6709f912_forstat_L000616_618)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343h_6709f912_forstat_L000616_621
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si343e_6709f912_fornum_L000605)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si343h_6709f912_forstat_L000616_619)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343h_6709f912_forstat_L000616_622
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si343g_6709f912_forlist_L000611)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si343h_6709f912_forstat_L000616_619)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343h_6709f912_forstat_L000616_618
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si343h_6709f912_forstat_L000616_623_L000624 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343h_6709f912_forstat_L000616_619
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (263)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (261)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
' C_si343h_6709f912_forstat_L000616_617 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343j_6709f912_test_then_block_L000627 ' <symbol:test_then_block>
 alignl ' align long
 long I32_NEWF + 40<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341_6709f912_expr_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (274)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (257)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343j_6709f912_test_then_block_L000627_629)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__goiffalse)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (5)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si341i_6709f912_undefgoto_L000243_247_L000248 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaS__newlstr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si341d_6709f912_newgotoentry_L000215)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
C_si343j_6709f912_test_then_block_L000627_632
' C_si343j_6709f912_test_then_block_L000627_633 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (59)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343j_6709f912_test_then_block_L000627_632)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341s_6709f912_block_follow_L000284)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343j_6709f912_test_then_block_L000627_635)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si343j_6709f912_test_then_block_L000627_628)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343j_6709f912_test_then_block_L000627_635
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si343j_6709f912_test_then_block_L000627_630)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343j_6709f912_test_then_block_L000627_629
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__goiftrue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341h_6709f912_enterblock_L000238)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_si343j_6709f912_test_then_block_L000627_630
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341t_6709f912_statlist_L000293)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341m_6709f912_leaveblock_L000253)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (259)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343j_6709f912_test_then_block_L000627_640)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (260)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343j_6709f912_test_then_block_L000627_638)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si343j_6709f912_test_then_block_L000627_640
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaK__jump)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__concat)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_si343j_6709f912_test_then_block_L000627_638
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__patchtohere)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343j_6709f912_test_then_block_L000627_628
 word I16B_POPM + 10<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343k_6709f912_ifstat_L000641 ' <symbol:ifstat>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si343j_6709f912_test_then_block_L000627)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si343k_6709f912_ifstat_L000641_644)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343k_6709f912_ifstat_L000641_643
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si343j_6709f912_test_then_block_L000627)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343k_6709f912_ifstat_L000641_644
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (260)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343k_6709f912_ifstat_L000641_643)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (259)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343k_6709f912_ifstat_L000641_646)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si342s_6709f912_block_L000515)<<S32 ' CALL addrg
 alignl ' align long
C_si343k_6709f912_ifstat_L000641_646
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (266)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (261)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__patchtohere)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si343k_6709f912_ifstat_L000641_642 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343l_6709f912_localfunc_L000648 ' <symbol:localfunc>
 alignl ' align long
 long I32_NEWF + 20<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34r_6709f912_adjustlocalvars_L000110)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si342a_6709f912_body_L000370)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34n_6709f912_localdebuginfo_L000088)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_si343l_6709f912_localfunc_L000648_649 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343m_6709f912_getlocalattribute_L000650 ' <symbol:getlocalattribute>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (60)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343m_6709f912_getlocalattribute_L000650_652)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (62)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34b_6709f912_checknext_L000049)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si343m_6709f912_getlocalattribute_L000650_656_L000657 ' reg ARG ADDRG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343m_6709f912_getlocalattribute_L000650_654)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si343m_6709f912_getlocalattribute_L000650_651)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343m_6709f912_getlocalattribute_L000650_654
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si343m_6709f912_getlocalattribute_L000650_660_L000661 ' reg ARG ADDRG
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343m_6709f912_getlocalattribute_L000650_658)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_si343m_6709f912_getlocalattribute_L000650_651)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343m_6709f912_getlocalattribute_L000650_658
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_si343m_6709f912_getlocalattribute_L000650_662_L000663 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaO__pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__semerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343m_6709f912_getlocalattribute_L000650_652
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_si343m_6709f912_getlocalattribute_L000650_651
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343q_6709f912_checktoclose_L000664 ' <symbol:checktoclose>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343q_6709f912_checktoclose_L000664_666)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3413_6709f912_marktobeclosed_L000159)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34m_6709f912_reglevel_L000080)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_MOVI + RI<<D32 + (55)<<S32
 word I16B_PSHL ' stack ARG coni
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaK__codeA_B_C_k)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
C_si343q_6709f912_checktoclose_L000664_666
' C_si343q_6709f912_checktoclose_L000664_665 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343r_6709f912_localstat_L000668 ' <symbol:localstat>
 alignl ' align long
 long I32_NEWF + 20<<S32
 alignl ' align long
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r13)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_si343r_6709f912_localstat_L000668_670
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34k_6709f912_new_localvar_L000076)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si343m_6709f912_getlocalattribute_L000650)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r21)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343r_6709f912_localstat_L000668_673)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r13)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343r_6709f912_localstat_L000668_675)<<S32 ' EQI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si343r_6709f912_localstat_L000668_677_L000678 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__semerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343r_6709f912_localstat_L000668_675
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r15)<<S16A ' ADDI/P (3)
 alignl ' align long
C_si343r_6709f912_localstat_L000668_673
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_si343r_6709f912_localstat_L000668_671 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343r_6709f912_localstat_L000668_670)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (61)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343r_6709f912_localstat_L000668_679)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342c_6709f912_explist_L000376)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si343r_6709f912_localstat_L000668_680)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343r_6709f912_localstat_L000668_679
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_si343r_6709f912_localstat_L000668_680
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34l_6709f912_getlocalvardesc_L000078)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343r_6709f912_localstat_L000668_681)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343r_6709f912_localstat_L000668_681)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2const)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343r_6709f912_localstat_L000668_681)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34r_6709f912_adjustlocalvars_L000110)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C_si343r_6709f912_localstat_L000668_682)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343r_6709f912_localstat_L000668_681
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si3416_6709f912_adjust_assign_L000178)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34r_6709f912_adjustlocalvars_L000110)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343r_6709f912_localstat_L000668_682
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si343q_6709f912_checktoclose_L000664)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si343r_6709f912_localstat_L000668_669 ' (symbol refcount = 0)
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343t_6709f912_funcname_L000683 ' <symbol:funcname>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3415_6709f912_singlevar_L000174)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si343t_6709f912_funcname_L000683_686)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343t_6709f912_funcname_L000683_685
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341u_6709f912_fieldsel_L000300)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343t_6709f912_funcname_L000683_686
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343t_6709f912_funcname_L000683_685)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343t_6709f912_funcname_L000683_688)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341u_6709f912_fieldsel_L000300)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343t_6709f912_funcname_L000683_688
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_si343t_6709f912_funcname_L000683_684 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343u_6709f912_funcstat_L000690 ' <symbol:funcstat>
 alignl ' align long
 long I32_NEWF + 36<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si343t_6709f912_funcname_L000683)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si342a_6709f912_body_L000370)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34p_6709f912_check_readonly_L000094)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-40)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__storevar)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__fixline)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si343u_6709f912_funcstat_L000690_691 ' (symbol refcount = 0)
 word I16B_POPM + 9<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si343v_6709f912_exprstat_L000692 ' <symbol:exprstat>
 alignl ' align long
 long I32_NEWF + 28<<S32
 alignl ' align long
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342h_6709f912_suffixedexp_L000413)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343v_6709f912_exprstat_L000692_697)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (44)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si343v_6709f912_exprstat_L000692_695)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si343v_6709f912_exprstat_L000692_697
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 0 ' reg <- con
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si342u_6709f912_restassign_L000537)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si343v_6709f912_exprstat_L000692_696)<<S32 ' JUMPV addrg
 alignl ' align long
C_si343v_6709f912_exprstat_L000692_695
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si343v_6709f912_exprstat_L000692_698)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_si342u_6709f912_restassign_L000537_542_L000543 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaX__syntaxerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si343v_6709f912_exprstat_L000692_698
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long $ffffff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long $1000000 ' reg <- con
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_si343v_6709f912_exprstat_L000692_696
' C_si343v_6709f912_exprstat_L000692_693 ' (symbol refcount = 0)
 word I16B_POPM + 7<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3440_6709f912_retstat_L000703 ' <symbol:retstat>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaY__nvarstack)<<S32 ' CALL addrg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si341s_6709f912_block_follow_L000284)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3440_6709f912_retstat_L000703_707)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (59)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3440_6709f912_retstat_L000703_705)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si3440_6709f912_retstat_L000703_707
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si3440_6709f912_retstat_L000703_706)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3440_6709f912_retstat_L000703_705
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si342c_6709f912_explist_L000376)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3440_6709f912_retstat_L000703_710)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (19)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3440_6709f912_retstat_L000703_708)<<S32 ' NEI4 reg coni
 alignl ' align long
C_si3440_6709f912_retstat_L000703_710
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__setreturns)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (18)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3440_6709f912_retstat_L000703_711)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3440_6709f912_retstat_L000703_711)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (15)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3440_6709f912_retstat_L000703_711)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long $ffffff80 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_MOVI + (r18)<<D32 +(69)<<S32 ' reg <- conli
 word I16A_OR + (r22)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 alignl ' align long
C_si3440_6709f912_retstat_L000703_711
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si3440_6709f912_retstat_L000703_709)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3440_6709f912_retstat_L000703_708
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_si3440_6709f912_retstat_L000703_715)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2anyreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C_si3440_6709f912_retstat_L000703_716)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3440_6709f912_retstat_L000703_715
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaK__exp2nextreg)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_si3440_6709f912_retstat_L000703_716
 alignl ' align long
C_si3440_6709f912_retstat_L000703_709
 alignl ' align long
C_si3440_6709f912_retstat_L000703_706
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaK__ret)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (59)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_si3440_6709f912_retstat_L000703_704 ' (symbol refcount = 0)
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si34_6709f912_statement_L000020 ' <symbol:statement>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaE__incC_stack)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (257)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si34_6709f912_statement_L000020_735)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (273)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_si34_6709f912_statement_L000020_736)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_si34_6709f912_statement_L000020_737_L000739-1028 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_si34_6709f912_statement_L000020_737_L000739 ' <symbol:737>
 long @C_si34_6709f912_statement_L000020_733
 long @C_si34_6709f912_statement_L000020_724
 long @C_si34_6709f912_statement_L000020_718
 long @C_si34_6709f912_statement_L000020_718
 long @C_si34_6709f912_statement_L000020_718
 long @C_si34_6709f912_statement_L000020_718
 long @C_si34_6709f912_statement_L000020_725
 long @C_si34_6709f912_statement_L000020_727
 long @C_si34_6709f912_statement_L000020_734
 long @C_si34_6709f912_statement_L000020_722
 long @C_si34_6709f912_statement_L000020_718
 long @C_si34_6709f912_statement_L000020_728
 long @C_si34_6709f912_statement_L000020_718
 long @C_si34_6709f912_statement_L000020_718
 long @C_si34_6709f912_statement_L000020_718
 long @C_si34_6709f912_statement_L000020_726
 long @C_si34_6709f912_statement_L000020_732

' Catalina Code

DAT ' code segment
 alignl ' align long
C_si34_6709f912_statement_L000020_735
 alignl ' align long
 long I32_MOVI + RI<<D32 + (59)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34_6709f912_statement_L000020_721)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_718)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_736
 alignl ' align long
 long I32_MOVI + RI<<D32 + (277)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34_6709f912_statement_L000020_723)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (277)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_si34_6709f912_statement_L000020_718)<<S32 ' LTI4 reg coni
' C_si34_6709f912_statement_L000020_741 ' (symbol refcount = 0)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (287)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34_6709f912_statement_L000020_731)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_718)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_721
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_722
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si343k_6709f912_ifstat_L000641)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_723
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3436_6709f912_whilestat_L000579)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_724
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si342s_6709f912_block_L000515)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (258)<<S32 ' reg ARG coni
 alignl ' align long
 long I32_MOVI + (r4)<<D32 + (261)<<S32 ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_si34c_6709f912_check_match_L000051)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_725
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si343h_6709f912_forstat_L000616)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_726
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3437_6709f912_repeatstat_L000581)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_727
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si343u_6709f912_funcstat_L000690)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_728
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (264)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si349_6709f912_testnext_L000041)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si34_6709f912_statement_L000020_729)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si343l_6709f912_localfunc_L000648)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_729
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si343r_6709f912_localstat_L000668)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_731
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34e_6709f912_str_checkname_L000059)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si3435_6709f912_labelstat_L000574)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_732
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3440_6709f912_retstat_L000703)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_733
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3432_6709f912_breakstat_L000566)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_734
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si3431_6709f912_gotostat_L000560)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si34_6709f912_statement_L000020_719)<<S32 ' JUMPV addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_718
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si343v_6709f912_exprstat_L000692)<<S32 ' CALL addrg
 alignl ' align long
C_si34_6709f912_statement_L000020_719
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaY__nvarstack)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_si34_6709f912_statement_L000020_717 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_si3443_6709f912_mainfunc_L000742 ' <symbol:mainfunc>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_si341q_6709f912_open_func_L000276)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3427_6709f912_setvararg_L000350)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si34u_6709f912_allocupvalue_L000131)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3443_6709f912_mainfunc_L000742_745)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_si3443_6709f912_mainfunc_L000742_745)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r3)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaC__barrier_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_si3443_6709f912_mainfunc_L000742_745)<<S32 ' JUMPV addrg
 alignl ' align long
C_si3443_6709f912_mainfunc_L000742_745
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaX__next)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341t_6709f912_statlist_L000293)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (288)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si34a_6709f912_check_L000045)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_si341r_6709f912_close_func_L000280)<<S32 ' CALL addrg
' C_si3443_6709f912_mainfunc_L000742_743 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export luaY_parser

 alignl ' align long
C_luaY__parser ' <symbol:luaY_parser>
 alignl ' align long
 long I32_NEWF + 120<<S32
 alignl ' align long
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaF__newL_closure)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r13)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(70)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaD__inctop)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaH__new)<<S32 ' CALL addrg
 word I16B_LODF + ((-76)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-76)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r13)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(69)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaD__inctop)<<S32 ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_luaF__newproto)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaY__parser_750)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaY__parser_750)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaC__barrier_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaY__parser_750)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaY__parser_750
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_luaS__new)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaY__parser_752)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_luaY__parser_752)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_luaC__barrier_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_luaY__parser_752)<<S32 ' JUMPV addrg
 alignl ' align long
C_luaY__parser_752
 word I16B_LODF + ((-80)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-72)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_luaX__setinput)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-60)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-120)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_si3443_6709f912_mainfunc_L000742)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r18)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_luaY__parser_746 ' (symbol refcount = 0)
 word I16B_POPM + 30<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import luaH_new

' Catalina Import luaS_new

' Catalina Import luaS_newlstr

' Catalina Import luaC_barrier_

' Catalina Import luaC_step

' Catalina Import luaF_newLclosure

' Catalina Import luaF_newproto

' Catalina Import luaD_inctop

' Catalina Import luaE_incCstack

' Catalina Import luaK_semerror

' Catalina Import luaK_finish

' Catalina Import luaK_setlist

' Catalina Import luaK_settablesize

' Catalina Import luaK_posfix

' Catalina Import luaK_infix

' Catalina Import luaK_prefix

' Catalina Import luaK_getlabel

' Catalina Import luaK_concat

' Catalina Import luaK_patchtohere

' Catalina Import luaK_patchlist

' Catalina Import luaK_ret

' Catalina Import luaK_jump

' Catalina Import luaK_setoneret

' Catalina Import luaK_setreturns

' Catalina Import luaK_storevar

' Catalina Import luaK_goiffalse

' Catalina Import luaK_goiftrue

' Catalina Import luaK_indexed

' Catalina Import luaK_self

' Catalina Import luaK_exp2val

' Catalina Import luaK_exp2nextreg

' Catalina Import luaK_exp2anyregup

' Catalina Import luaK_exp2anyreg

' Catalina Import luaK_dischargevars

' Catalina Import luaK_int

' Catalina Import luaK_checkstack

' Catalina Import luaK_reserveregs

' Catalina Import luaK_nil

' Catalina Import luaK_fixline

' Catalina Import luaK_exp2const

' Catalina Import luaK_codeABCk

' Catalina Import luaK_codeABx

' Catalina Import luaK_code

' Catalina Import luaX_token2str

' Catalina Import luaX_syntaxerror

' Catalina Import luaX_lookahead

' Catalina Import luaX_next

' Catalina Import luaX_newstring

' Catalina Import luaX_setinput

' Catalina Import luaM_shrinkvector_

' Catalina Import luaM_growaux_

' Catalina Import luaO_pushfstring

' Catalina Import strcmp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_si343r_6709f912_localstat_L000668_677_L000678 ' <symbol:677>
 byte 109
 byte 117
 byte 108
 byte 116
 byte 105
 byte 112
 byte 108
 byte 101
 byte 32
 byte 116
 byte 111
 byte 45
 byte 98
 byte 101
 byte 45
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 100
 byte 32
 byte 118
 byte 97
 byte 114
 byte 105
 byte 97
 byte 98
 byte 108
 byte 101
 byte 115
 byte 32
 byte 105
 byte 110
 byte 32
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 32
 byte 108
 byte 105
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_si343m_6709f912_getlocalattribute_L000650_662_L000663 ' <symbol:662>
 byte 117
 byte 110
 byte 107
 byte 110
 byte 111
 byte 119
 byte 110
 byte 32
 byte 97
 byte 116
 byte 116
 byte 114
 byte 105
 byte 98
 byte 117
 byte 116
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_si343m_6709f912_getlocalattribute_L000650_660_L000661 ' <symbol:660>
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_si343m_6709f912_getlocalattribute_L000650_656_L000657 ' <symbol:656>
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_si343h_6709f912_forstat_L000616_623_L000624 ' <symbol:623>
 byte 39
 byte 61
 byte 39
 byte 32
 byte 111
 byte 114
 byte 32
 byte 39
 byte 105
 byte 110
 byte 39
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
C_si343e_6709f912_fornum_L000605_607_L000608 ' <symbol:607>
 byte 40
 byte 102
 byte 111
 byte 114
 byte 32
 byte 115
 byte 116
 byte 97
 byte 116
 byte 101
 byte 41
 byte 0

 alignl ' align long
C_si3439_6709f912_fixforjump_L000589_595_L000596 ' <symbol:595>
 byte 99
 byte 111
 byte 110
 byte 116
 byte 114
 byte 111
 byte 108
 byte 32
 byte 115
 byte 116
 byte 114
 byte 117
 byte 99
 byte 116
 byte 117
 byte 114
 byte 101
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

 alignl ' align long
C_si3433_6709f912_checkrepeated_L000568_572_L000573 ' <symbol:572>
 byte 108
 byte 97
 byte 98
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 97
 byte 108
 byte 114
 byte 101
 byte 97
 byte 100
 byte 121
 byte 32
 byte 100
 byte 101
 byte 102
 byte 105
 byte 110
 byte 101
 byte 100
 byte 32
 byte 111
 byte 110
 byte 32
 byte 108
 byte 105
 byte 110
 byte 101
 byte 32
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_si342u_6709f912_restassign_L000537_542_L000543 ' <symbol:542>
 byte 115
 byte 121
 byte 110
 byte 116
 byte 97
 byte 120
 byte 32
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_si342i_6709f912_simpleexp_L000431_445_L000446 ' <symbol:445>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 117
 byte 115
 byte 101
 byte 32
 byte 39
 byte 46
 byte 46
 byte 46
 byte 39
 byte 32
 byte 111
 byte 117
 byte 116
 byte 115
 byte 105
 byte 100
 byte 101
 byte 32
 byte 97
 byte 32
 byte 118
 byte 97
 byte 114
 byte 97
 byte 114
 byte 103
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_si342f_6709f912_primaryexp_L000403_410_L000411 ' <symbol:410>
 byte 117
 byte 110
 byte 101
 byte 120
 byte 112
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 32
 byte 115
 byte 121
 byte 109
 byte 98
 byte 111
 byte 108
 byte 0

 alignl ' align long
C_si342d_6709f912_funcargs_L000381_394_L000395 ' <symbol:394>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
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
C_si342a_6709f912_body_L000370_374_L000375 ' <symbol:374>
 byte 115
 byte 101
 byte 108
 byte 102
 byte 0

 alignl ' align long
C_si3428_6709f912_parlist_L000352_364_L000365 ' <symbol:364>
 byte 60
 byte 110
 byte 97
 byte 109
 byte 101
 byte 62
 byte 32
 byte 111
 byte 114
 byte 32
 byte 39
 byte 46
 byte 46
 byte 46
 byte 39
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
C_si3420_6709f912_recfield_L000304_308_L000309 ' <symbol:308>
 byte 105
 byte 116
 byte 101
 byte 109
 byte 115
 byte 32
 byte 105
 byte 110
 byte 32
 byte 97
 byte 32
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 114
 byte 117
 byte 99
 byte 116
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_si341n_6709f912_addprototype_L000263_267_L000268 ' <symbol:267>
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

 alignl ' align long
C_si341i_6709f912_undefgoto_L000243_251_L000252 ' <symbol:251>
 byte 110
 byte 111
 byte 32
 byte 118
 byte 105
 byte 115
 byte 105
 byte 98
 byte 108
 byte 101
 byte 32
 byte 108
 byte 97
 byte 98
 byte 101
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 60
 byte 103
 byte 111
 byte 116
 byte 111
 byte 62
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
 byte 0

 alignl ' align long
C_si341i_6709f912_undefgoto_L000243_249_L000250 ' <symbol:249>
 byte 98
 byte 114
 byte 101
 byte 97
 byte 107
 byte 32
 byte 111
 byte 117
 byte 116
 byte 115
 byte 105
 byte 100
 byte 101
 byte 32
 byte 108
 byte 111
 byte 111
 byte 112
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
 byte 0

 alignl ' align long
C_si341i_6709f912_undefgoto_L000243_247_L000248 ' <symbol:247>
 byte 98
 byte 114
 byte 101
 byte 97
 byte 107
 byte 0

 alignl ' align long
C_si341b_6709f912_newlabelentry_L000211_213_L000214 ' <symbol:213>
 byte 108
 byte 97
 byte 98
 byte 101
 byte 108
 byte 115
 byte 47
 byte 103
 byte 111
 byte 116
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_si3417_6709f912_jumpscopeerror_L000191_193_L000194 ' <symbol:193>
 byte 60
 byte 103
 byte 111
 byte 116
 byte 111
 byte 32
 byte 37
 byte 115
 byte 62
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
 byte 32
 byte 106
 byte 117
 byte 109
 byte 112
 byte 115
 byte 32
 byte 105
 byte 110
 byte 116
 byte 111
 byte 32
 byte 116
 byte 104
 byte 101
 byte 32
 byte 115
 byte 99
 byte 111
 byte 112
 byte 101
 byte 32
 byte 111
 byte 102
 byte 32
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_si34u_6709f912_allocupvalue_L000131_133_L000134 ' <symbol:133>
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
C_si34p_6709f912_check_readonly_L000094_108_L000109 ' <symbol:108>
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
 byte 97
 byte 115
 byte 115
 byte 105
 byte 103
 byte 110
 byte 32
 byte 116
 byte 111
 byte 32
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 32
 byte 118
 byte 97
 byte 114
 byte 105
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_si34i_6709f912_registerlocalvar_L000067_69_L000070 ' <symbol:69>
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 32
 byte 118
 byte 97
 byte 114
 byte 105
 byte 97
 byte 98
 byte 108
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_si34c_6709f912_check_match_L000051_57_L000058 ' <symbol:57>
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
 byte 32
 byte 40
 byte 116
 byte 111
 byte 32
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 32
 byte 37
 byte 115
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

 alignl ' align long
C_si344_6709f912_errorlimit_L000026_35_L000036 ' <symbol:35>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 37
 byte 115
 byte 32
 byte 40
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 32
 byte 105
 byte 115
 byte 32
 byte 37
 byte 100
 byte 41
 byte 32
 byte 105
 byte 110
 byte 32
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_si344_6709f912_errorlimit_L000026_30_L000031 ' <symbol:30>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
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
 byte 0

 alignl ' align long
C_si344_6709f912_errorlimit_L000026_28_L000029 ' <symbol:28>
 byte 109
 byte 97
 byte 105
 byte 110
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_si342_6709f912_error_expected_L000022_24_L000025 ' <symbol:24>
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
 byte 0

' Catalina Code

DAT ' code segment
' end
