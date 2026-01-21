' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s6k42_696dde38_error_expected_L000024 ' <symbol:error_expected>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__token2str
 add SP, #4 ' CALL addrg
 mov r2, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s6k42_696dde38_error_expected_L000024_26_L000027
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
' C_s6k42_696dde38_error_expected_L000024_25 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k44_696dde38_errorlimit_L000028 ' <symbol:errorlimit>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $eaa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_s6k44_696dde38_errorlimit_L000028_35 ' NEI4
 jmp #LODL
 long @C_s6k44_696dde38_errorlimit_L000028_30_L000031
 mov r13, RI ' reg <- addrg
 jmp #JMPA
 long @C_s6k44_696dde38_errorlimit_L000028_36 ' JUMPV addrg
C_s6k44_696dde38_errorlimit_L000028_35
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s6k44_696dde38_errorlimit_L000028_32_L000033
 mov r3, RI ' reg ARG ADDRG
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s6k44_696dde38_errorlimit_L000028_36
 mov RI, FP
 sub RI, #-(-12)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s6k44_696dde38_errorlimit_L000028_37_L000038
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
' C_s6k44_696dde38_errorlimit_L000028_29 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k48_696dde38_checklimit_L000039 ' <symbol:checklimit>
 jmp #NEWF
 jmp #PSHM
 long $aa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21, r19 wz,wc
 jmp #BRBE
 long @C_s6k48_696dde38_checklimit_L000039_41 ' LEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k44_696dde38_errorlimit_L000028
 add SP, #8 ' CALL addrg
C_s6k48_696dde38_checklimit_L000039_41
' C_s6k48_696dde38_checklimit_L000039_40 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k49_696dde38_testnext_L000043 ' <symbol:testnext>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_s6k49_696dde38_testnext_L000043_45 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s6k49_696dde38_testnext_L000043_44 ' JUMPV addrg
C_s6k49_696dde38_testnext_L000043_45
 mov r0, #0 ' reg <- coni
C_s6k49_696dde38_testnext_L000043_44
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4a_696dde38_check_L000047 ' <symbol:check>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BR_Z
 long @C_s6k4a_696dde38_check_L000047_49 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42_696dde38_error_expected_L000024
 add SP, #4 ' CALL addrg
C_s6k4a_696dde38_check_L000047_49
' C_s6k4a_696dde38_check_L000047_48 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4b_696dde38_checknext_L000051 ' <symbol:checknext>
 jmp #NEWF
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4a_696dde38_check_L000047
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
' C_s6k4b_696dde38_checknext_L000051_52 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4c_696dde38_check_match_L000053 ' <symbol:check_match>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k4c_696dde38_check_match_L000053_55 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r17, r22 wz
 jmp #BRNZ
 long @C_s6k4c_696dde38_check_match_L000053_57 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42_696dde38_error_expected_L000024
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k4c_696dde38_check_match_L000053_58 ' JUMPV addrg
C_s6k4c_696dde38_check_match_L000053_57
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__token2str
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__token2str
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s6k4c_696dde38_check_match_L000053_59_L000060
 mov r5, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k4c_696dde38_check_match_L000053_58
C_s6k4c_696dde38_check_match_L000053_55
' C_s6k4c_696dde38_check_match_L000053_54 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4e_696dde38_str_checkname_L000061 ' <symbol:str_checkname>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #291 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4a_696dde38_check_L000047
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
' C_s6k4e_696dde38_str_checkname_L000061_62 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k4f_696dde38_init_exp_L000063 ' <symbol:init_exp>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r20, r4
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r20, r4
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r4
 mov BC, r3
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r2
 jmp #WLNG ' ASGNI4 reg reg
' C_s6k4f_696dde38_init_exp_L000063_64 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k4g_696dde38_codestring_L000065 ' <symbol:codestring>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r20, r3
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #7 ' reg <- coni
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r2
 jmp #WLNG ' ASGNP4 reg reg
' C_s6k4g_696dde38_codestring_L000065_66 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k4h_696dde38_codename_L000067 ' <symbol:codename>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4g_696dde38_codestring_L000065
 add SP, #4 ' CALL addrg
' C_s6k4h_696dde38_codename_L000067_68 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4i_696dde38_registerlocalvar_L000069 ' <symbol:registerlocalvar>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_s6k4i_696dde38_registerlocalvar_L000069_71_L000072
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 32767
 mov r3, RI ' reg ARG con
 mov r4, #12 ' reg ARG coni
 mov r5, r17
 adds r5, #32 ' ADDP4 coni
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s6k4i_696dde38_registerlocalvar_L000069_74 ' JUMPV addrg
C_s6k4i_696dde38_registerlocalvar_L000069_73
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r20, #12 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_s6k4i_696dde38_registerlocalvar_L000069_74
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_s6k4i_696dde38_registerlocalvar_L000069_73 ' LTI4
 mov r22, #12 ' reg <- coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r20, BC ' reg <- INDIRI2 reg
 shl r20, #16
 sar r20, #16 ' sign extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #12 ' reg <- coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r20, BC ' reg <- INDIRI2 reg
 shl r20, #16
 sar r20, #16 ' sign extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k4i_696dde38_registerlocalvar_L000069_77 ' EQI4
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k4i_696dde38_registerlocalvar_L000069_77 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k4i_696dde38_registerlocalvar_L000069_77 ' JUMPV addrg
C_s6k4i_696dde38_registerlocalvar_L000069_77
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRI2 reg
 mov r18, r20 ' CVII
 mov r18, r20 ' CVII
 shl r18, #16
 sar r18, #16 ' sign extend
 adds r18, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r18
 jmp #WWRD ' ASGNI2 reg reg
 mov r0, r20 ' CVII
 mov r0, r20 ' CVII
 shl r0, #16
 sar r0, #16 ' sign extend
' C_s6k4i_696dde38_registerlocalvar_L000069_70 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4k_696dde38_new_localvar_L000078 ' <symbol:new_localvar>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_s6k4i_696dde38_registerlocalvar_L000069_71_L000072
 mov r2, RI ' reg ARG ADDRG
 mov r3, #200 ' reg ARG coni
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov r20, r17
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r4, r22 ' SUBI/P
 subs r4, r20 ' SUBI/P (3)
 mov r5, r17 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k48_696dde38_checklimit_L000039
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_s6k4i_696dde38_registerlocalvar_L000069_71_L000072
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 32767
 mov r3, RI ' reg ARG con
 mov r4, #16 ' reg ARG coni
 mov r5, r19
 adds r5, #8 ' ADDP4 coni
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r19
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r20
 shl r22, #4 ' LSHI4 coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov r20, r17
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
' C_s6k4k_696dde38_new_localvar_L000078_79 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k4l_696dde38_getlocalvardesc_L000080 ' <symbol:getlocalvardesc>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, r2 ' ADDI/P (1)
 shl r22, #4 ' LSHI4 coni
 mov r20, r3
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_s6k4l_696dde38_getlocalvardesc_L000080_81 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k4m_696dde38_reglevel_L000082 ' <symbol:reglevel>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s6k4m_696dde38_reglevel_L000082_85 ' JUMPV addrg
C_s6k4m_696dde38_reglevel_L000082_84
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BR_Z
 long @C_s6k4m_696dde38_reglevel_L000082_87 ' EQI4
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_s6k4m_696dde38_reglevel_L000082_83 ' JUMPV addrg
C_s6k4m_696dde38_reglevel_L000082_87
C_s6k4m_696dde38_reglevel_L000082_85
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 subs r21, #1 ' SUBI4 coni
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_s6k4m_696dde38_reglevel_L000082_84 ' GTI4
 mov r0, #0 ' reg <- coni
C_s6k4m_696dde38_reglevel_L000082_83
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaY_nvarstack

 alignl ' align long
C_luaY__nvarstack ' <symbol:luaY_nvarstack>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4m_696dde38_reglevel_L000082
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaY__nvarstack_89 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4n_696dde38_localdebuginfo_L000090 ' <symbol:localdebuginfo>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s6k4n_696dde38_localdebuginfo_L000090_92 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s6k4n_696dde38_localdebuginfo_L000090_91 ' JUMPV addrg
C_s6k4n_696dde38_localdebuginfo_L000090_92
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #12 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r0, r22 ' ADDI/P (1)
C_s6k4n_696dde38_localdebuginfo_L000090_91
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k4o_696dde38_init_var_L000094 ' <symbol:init_var>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #9 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov r22, r0
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
' C_s6k4o_696dde38_init_var_L000094_95 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4p_696dde38_check_readonly_L000096 ' <symbol:check_readonly>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
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
 mov RI, r21
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 cmps r19,  #9 wz
 jmp #BR_Z
 long @C_s6k4p_696dde38_check_readonly_L000096_102 ' EQI4
 cmps r19,  #10 wz
 jmp #BR_Z
 long @C_s6k4p_696dde38_check_readonly_L000096_105 ' EQI4
 cmps r19,  #11 wz
 jmp #BR_Z
 long @C_s6k4p_696dde38_check_readonly_L000096_101 ' EQI4
 jmp #JMPA
 long @C_s6k4p_696dde38_check_readonly_L000096_97 ' JUMPV addrg
C_s6k4p_696dde38_check_readonly_L000096_101
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_s6k4p_696dde38_check_readonly_L000096_99 ' JUMPV addrg
C_s6k4p_696dde38_check_readonly_L000096_102
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s6k4p_696dde38_check_readonly_L000096_99 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_s6k4p_696dde38_check_readonly_L000096_99 ' JUMPV addrg
C_s6k4p_696dde38_check_readonly_L000096_105
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s6k4p_696dde38_check_readonly_L000096_99 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_s6k4p_696dde38_check_readonly_L000096_99
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s6k4p_696dde38_check_readonly_L000096_108 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r2, r22
 adds r2, #16 ' ADDP4 coni
 jmp #LODL
 long @C_s6k4p_696dde38_check_readonly_L000096_110_L000111
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
C_s6k4p_696dde38_check_readonly_L000096_108
C_s6k4p_696dde38_check_readonly_L000096_97
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k4r_696dde38_adjustlocalvars_L000112 ' <symbol:adjustlocalvars>
 jmp #NEWF
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112_117 ' JUMPV addrg
C_s6k4r_696dde38_adjustlocalvars_L000112_114
 mov r22, r19
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov r18, r20 ' CVUI
 and r18, cviu_m1 ' zero extend
 adds r18, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r18
 jmp #WBYT ' ASGNU1 reg reg
 mov r11, r20 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r20, r13
 adds r20, #6 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4i_696dde38_registerlocalvar_L000069
 add SP, #8 ' CALL addrg
 mov r20, r13
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WWRD ' ASGNI2 reg reg
' C_s6k4r_696dde38_adjustlocalvars_L000112_115 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_s6k4r_696dde38_adjustlocalvars_L000112_117
 cmps r17, r21 wz,wc
 jmp #BR_B
 long @C_s6k4r_696dde38_adjustlocalvars_L000112_114 ' LTI4
' C_s6k4r_696dde38_adjustlocalvars_L000112_113 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4s_696dde38_removevars_L000118 ' <symbol:removevars>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r23
 adds r18, #50 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 subs r18, r21 ' SUBI/P (1)
 subs r20, r18 ' SUBI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s6k4s_696dde38_removevars_L000118_121 ' JUMPV addrg
C_s6k4s_696dde38_removevars_L000118_120
 mov r22, r23
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4n_696dde38_localdebuginfo_L000090
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s6k4s_696dde38_removevars_L000118_123 ' EQU4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_s6k4s_696dde38_removevars_L000118_123
C_s6k4s_696dde38_removevars_L000118_121
 mov r22, r23
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r21 wz,wc
 jmp #BR_A
 long @C_s6k4s_696dde38_removevars_L000118_120 ' GTI4
' C_s6k4s_696dde38_removevars_L000118_119 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k4t_696dde38_searchupvalue_L000125 ' <symbol:searchupvalue>
 jmp #PSHM
 long $f00000 ' save registers
 mov RI, r3
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #60 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_s6k4t_696dde38_searchupvalue_L000125_130 ' JUMPV addrg
C_s6k4t_696dde38_searchupvalue_L000125_127
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s6k4t_696dde38_searchupvalue_L000125_131 ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s6k4t_696dde38_searchupvalue_L000125_126 ' JUMPV addrg
C_s6k4t_696dde38_searchupvalue_L000125_131
' C_s6k4t_696dde38_searchupvalue_L000125_128 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_s6k4t_696dde38_searchupvalue_L000125_130
 mov r22, r3
 adds r22, #51 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r23, r22 wz,wc
 jmp #BR_B
 long @C_s6k4t_696dde38_searchupvalue_L000125_127 ' LTI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_s6k4t_696dde38_searchupvalue_L000125_126
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k4u_696dde38_allocupvalue_L000133 ' <symbol:allocupvalue>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_s6k4u_696dde38_allocupvalue_L000133_135_L000136
 mov r2, RI ' reg ARG ADDRG
 mov r3, #255 ' reg ARG coni
 mov r22, r23
 adds r22, #51 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r4, r22
 adds r4, #1 ' ADDI4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k48_696dde38_checklimit_L000039
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_s6k4u_696dde38_allocupvalue_L000133_135_L000136
 mov r2, RI ' reg ARG ADDRG
 mov r3, #255 ' reg ARG coni
 mov r22, #8 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21
 adds r5, #12 ' ADDP4 coni
 mov r22, r23
 adds r22, #51 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, r21
 adds r22, #60 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s6k4u_696dde38_allocupvalue_L000133_138 ' JUMPV addrg
C_s6k4u_696dde38_allocupvalue_L000133_137
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_s6k4u_696dde38_allocupvalue_L000133_138
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_s6k4u_696dde38_allocupvalue_L000133_137 ' LTI4
 mov r22, r23
 adds r22, #51 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov r18, r20 ' CVUI
 and r18, cviu_m1 ' zero extend
 adds r18, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r18
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_s6k4u_696dde38_allocupvalue_L000133_134 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k410_696dde38_newupvalue_L000140 ' <symbol:newupvalue>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4u_696dde38_allocupvalue_L000133 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_s6k410_696dde38_newupvalue_L000140_142 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov r20, r17
 adds r20, #6 ' ADDP4 coni
 mov r22, r0
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_s6k410_696dde38_newupvalue_L000140_143 ' JUMPV addrg
C_s6k410_696dde38_newupvalue_L000140_142
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #6 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 regl
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r18, #60 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #6 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s6k410_696dde38_newupvalue_L000140_143
 mov RI, r17
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k410_696dde38_newupvalue_L000140_145 ' EQI4
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k410_696dde38_newupvalue_L000140_145 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k410_696dde38_newupvalue_L000140_145 ' JUMPV addrg
C_s6k410_696dde38_newupvalue_L000140_145
 mov r22, r23
 adds r22, #51 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 subs r0, #1 ' SUBI4 coni
' C_s6k410_696dde38_newupvalue_L000140_141 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k411_696dde38_searchvar_L000146 ' <symbol:searchvar>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22
 subs r17, #1 ' SUBI4 coni
 jmp #JMPA
 long @C_s6k411_696dde38_searchvar_L000146_151 ' JUMPV addrg
C_s6k411_696dde38_searchvar_L000146_148
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r15
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s6k411_696dde38_searchvar_L000146_152 ' NEU4
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s6k411_696dde38_searchvar_L000146_154 ' NEI4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r2, r22 ' ADDI/P
 adds r2, r17 ' ADDI/P (3)
 mov r3, #11 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k411_696dde38_searchvar_L000146_155 ' JUMPV addrg
C_s6k411_696dde38_searchvar_L000146_154
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4o_696dde38_init_var_L000094
 add SP, #8 ' CALL addrg
C_s6k411_696dde38_searchvar_L000146_155
 mov RI, r19
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_s6k411_696dde38_searchvar_L000146_147 ' JUMPV addrg
C_s6k411_696dde38_searchvar_L000146_152
' C_s6k411_696dde38_searchvar_L000146_149 ' (symbol refcount = 0)
 subs r17, #1 ' SUBI4 coni
C_s6k411_696dde38_searchvar_L000146_151
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_s6k411_696dde38_searchvar_L000146_148 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_s6k411_696dde38_searchvar_L000146_147
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k412_696dde38_markupval_L000156 ' <symbol:markupval>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_s6k412_696dde38_markupval_L000156_159 ' JUMPV addrg
C_s6k412_696dde38_markupval_L000156_158
 mov RI, r23
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
C_s6k412_696dde38_markupval_L000156_159
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r2 wz,wc
 jmp #BR_A
 long @C_s6k412_696dde38_markupval_L000156_158 ' GTI4
 mov r22, r23
 adds r22, #13 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #54 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s6k412_696dde38_markupval_L000156_157 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k413_696dde38_marktobeclosed_L000161 ' <symbol:marktobeclosed>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #13 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #15 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #54 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s6k413_696dde38_marktobeclosed_L000161_162 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k414_696dde38_singlevaraux_L000163 ' <symbol:singlevaraux>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s6k414_696dde38_singlevaraux_L000163_165 ' NEU4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k414_696dde38_singlevaraux_L000163_166 ' JUMPV addrg
C_s6k414_696dde38_singlevaraux_L000163_165
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k411_696dde38_searchvar_L000146
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s6k414_696dde38_singlevaraux_L000163_167 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_s6k414_696dde38_singlevaraux_L000163_168 ' NEI4
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_s6k414_696dde38_singlevaraux_L000163_168 ' NEI4
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k412_696dde38_markupval_L000156
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k414_696dde38_singlevaraux_L000163_168 ' JUMPV addrg
C_s6k414_696dde38_singlevaraux_L000163_167
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4t_696dde38_searchupvalue_L000125
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s6k414_696dde38_singlevaraux_L000163_171 ' GEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k414_696dde38_singlevaraux_L000163
 add SP, #12 ' CALL addrg
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BR_Z
 long @C_s6k414_696dde38_singlevaraux_L000163_175 ' EQI4
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_s6k414_696dde38_singlevaraux_L000163_164 ' NEI4
C_s6k414_696dde38_singlevaraux_L000163_175
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k410_696dde38_newupvalue_L000140
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
' C_s6k414_696dde38_singlevaraux_L000163_174 ' (symbol refcount = 0)
C_s6k414_696dde38_singlevaraux_L000163_171
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #10 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
C_s6k414_696dde38_singlevaraux_L000163_168
C_s6k414_696dde38_singlevaraux_L000163_166
C_s6k414_696dde38_singlevaraux_L000163_164
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k415_696dde38_singlevar_L000176 ' <symbol:singlevar>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k414_696dde38_singlevaraux_L000163
 add SP, #12 ' CALL addrg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s6k415_696dde38_singlevar_L000176_178 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k414_696dde38_singlevaraux_L000163
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyregup
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4g_696dde38_codestring_L000065
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__indexed
 add SP, #8 ' CALL addrg
C_s6k415_696dde38_singlevar_L000176_178
' C_s6k415_696dde38_singlevar_L000176_177 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k416_696dde38_adjust_assign_L000180 ' <symbol:adjust_assign>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 mov r15, r21 ' SUBI/P
 subs r15, r19 ' SUBI/P (3)
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_s6k416_696dde38_adjust_assign_L000180_184 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s6k416_696dde38_adjust_assign_L000180_182 ' NEI4
C_s6k416_696dde38_adjust_assign_L000180_184
 mov r22, r15
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s6k416_696dde38_adjust_assign_L000180_185 ' GEI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s6k416_696dde38_adjust_assign_L000180_185
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setreturns
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k416_696dde38_adjust_assign_L000180_183 ' JUMPV addrg
C_s6k416_696dde38_adjust_assign_L000180_182
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s6k416_696dde38_adjust_assign_L000180_187 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
C_s6k416_696dde38_adjust_assign_L000180_187
 cmps r15,  #0 wz,wc
 jmp #BRBE
 long @C_s6k416_696dde38_adjust_assign_L000180_189 ' LEI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov r4, r13 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__nil
 add SP, #8 ' CALL addrg
C_s6k416_696dde38_adjust_assign_L000180_189
C_s6k416_696dde38_adjust_assign_L000180_183
 cmps r15,  #0 wz,wc
 jmp #BRBE
 long @C_s6k416_696dde38_adjust_assign_L000180_191 ' LEI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k416_696dde38_adjust_assign_L000180_192 ' JUMPV addrg
C_s6k416_696dde38_adjust_assign_L000180_191
 mov r22, r13
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 adds r20, r15 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s6k416_696dde38_adjust_assign_L000180_192
' C_s6k416_696dde38_adjust_assign_L000180_181 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k417_696dde38_jumpscopeerror_L000193 ' <symbol:jumpscopeerror>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #LODL
 long @C_s6k417_696dde38_jumpscopeerror_L000193_195_L000196
 mov r19, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r4, r22
 adds r4, #16 ' ADDP4 coni
 mov r5, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #16 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
' C_s6k417_696dde38_jumpscopeerror_L000193_194 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k419_696dde38_solvegoto_L000197 ' <symbol:solvegoto>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r15, r22
 adds r15, #12 ' ADDP4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 mov RI, r15
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_s6k419_696dde38_solvegoto_L000197_199 ' GEI4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k417_696dde38_jumpscopeerror_L000193
 add SP, #4 ' CALL addrg
C_s6k419_696dde38_solvegoto_L000197_199
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchlist
 add SP, #8 ' CALL addrg
 mov r17, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s6k419_696dde38_solvegoto_L000197_204 ' JUMPV addrg
C_s6k419_696dde38_solvegoto_L000197_201
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 mov RI, r15
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 adds r22, #16 ' ADDI4 coni
 mov r1, r22 ' ADDI/P
 adds r1, r20 ' ADDI/P (3)
 jmp #CPYB
 long 16 ' ASGNB
' C_s6k419_696dde38_solvegoto_L000197_202 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_s6k419_696dde38_solvegoto_L000197_204
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_s6k419_696dde38_solvegoto_L000197_201 ' LTI4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_s6k419_696dde38_solvegoto_L000197_198 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41a_696dde38_findlabel_L000205 ' <symbol:findlabel>
 jmp #PSHM
 long $f80000 ' save registers
 mov r22, r3
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r3
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_s6k41a_696dde38_findlabel_L000205_210 ' JUMPV addrg
C_s6k41a_696dde38_findlabel_L000205_207
 mov r22, r23
 shl r22, #4 ' LSHI4 coni
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r19, r22 ' ADDI/P
 adds r19, r20 ' ADDI/P (3)
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s6k41a_696dde38_findlabel_L000205_211 ' NEU4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s6k41a_696dde38_findlabel_L000205_206 ' JUMPV addrg
C_s6k41a_696dde38_findlabel_L000205_211
' C_s6k41a_696dde38_findlabel_L000205_208 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_s6k41a_696dde38_findlabel_L000205_210
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r23, r22 wz,wc
 jmp #BR_B
 long @C_s6k41a_696dde38_findlabel_L000205_207 ' LTI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_s6k41a_696dde38_findlabel_L000205_206
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k41b_696dde38_newlabelentry_L000213 ' <symbol:newlabelentry>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_s6k41b_696dde38_newlabelentry_L000213_215_L000216
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 32767
 mov r3, RI ' reg ARG con
 mov r4, #16 ' reg ARG coni
 mov r5, r23
 adds r5, #8 ' ADDP4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r23
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #50 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #13 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, r15
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_s6k41b_696dde38_newlabelentry_L000213_214 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41d_696dde38_newgotoentry_L000217 ' <symbol:newgotoentry>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r5, r22
 adds r5, #12 ' ADDP4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s6k41b_696dde38_newlabelentry_L000213
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s6k41d_696dde38_newgotoentry_L000217_218 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41e_696dde38_solvegotos_L000219 ' <symbol:solvegotos>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #12 ' ADDP4 coni
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_s6k41e_696dde38_solvegotos_L000219_222 ' JUMPV addrg
C_s6k41e_696dde38_solvegotos_L000219_221
 mov r22, r19
 shl r22, #4 ' LSHI4 coni
 mov RI, r17
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s6k41e_696dde38_solvegotos_L000219_224 ' NEU4
 mov r22, r19
 shl r22, #4 ' LSHI4 coni
 mov RI, r17
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #13 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 or r15, r22 ' BORI/U (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k419_696dde38_solvegoto_L000197
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k41e_696dde38_solvegotos_L000219_225 ' JUMPV addrg
C_s6k41e_696dde38_solvegotos_L000219_224
 adds r19, #1 ' ADDI4 coni
C_s6k41e_696dde38_solvegotos_L000219_225
C_s6k41e_696dde38_solvegotos_L000219_222
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_s6k41e_696dde38_solvegotos_L000219_221 ' LTI4
 mov r0, r15 ' CVI, CVU or LOAD
' C_s6k41e_696dde38_solvegotos_L000219_220 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41f_696dde38_createlabel_L000226 ' <symbol:createlabel>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r13, r22
 adds r13, #24 ' ADDP4 coni
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__getlabel ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r13 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s6k41b_696dde38_newlabelentry_L000213
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s6k41f_696dde38_createlabel_L000226_228 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 mov RI, r13
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 mov r20, r15
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s6k41f_696dde38_createlabel_L000226_228
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #4 ' LSHI4 coni
 mov RI, r13
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41e_696dde38_solvegotos_L000219
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k41f_696dde38_createlabel_L000226_230 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r20 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #54
 jmp #PSHL ' stack ARG coni
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s6k41f_696dde38_createlabel_L000226_227 ' JUMPV addrg
C_s6k41f_696dde38_createlabel_L000226_230
 mov r0, #0 ' reg <- coni
C_s6k41f_696dde38_createlabel_L000226_227
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k41g_696dde38_movegotosout_L000232 ' <symbol:movegotosout>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #12 ' ADDP4 coni
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_s6k41g_696dde38_movegotosout_L000232_237 ' JUMPV addrg
C_s6k41g_696dde38_movegotosout_L000232_234
 mov r22, r19
 shl r22, #4 ' LSHI4 coni
 mov RI, r17
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4m_696dde38_reglevel_L000082
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4m_696dde38_reglevel_L000082
 add SP, #4 ' CALL addrg
 cmps r22, r0 wz,wc
 jmp #BRBE
 long @C_s6k41g_696dde38_movegotosout_L000232_238 ' LEI4
 mov r22, r15
 adds r22, #13 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r21
 adds r18, #13 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s6k41g_696dde38_movegotosout_L000232_238
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s6k41g_696dde38_movegotosout_L000232_235 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s6k41g_696dde38_movegotosout_L000232_237
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_s6k41g_696dde38_movegotosout_L000232_234 ' LTI4
' C_s6k41g_696dde38_movegotosout_L000232_233 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41h_696dde38_enterblock_L000240 ' <symbol:enterblock>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #14 ' ADDP4 coni
 mov RI, r22
 mov BC, r2
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 mov r20, r4
 adds r20, #50 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov r20, r4
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 mov r20, r4
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #13 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s6k41h_696dde38_enterblock_L000240_243 ' EQU4
 adds r22, #15 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s6k41h_696dde38_enterblock_L000240_243 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_s6k41h_696dde38_enterblock_L000240_244 ' JUMPV addrg
C_s6k41h_696dde38_enterblock_L000240_243
 mov r23, #0 ' reg <- coni
C_s6k41h_696dde38_enterblock_L000240_244
 mov r22, r3
 adds r22, #15 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r3
 jmp #WLNG ' ASGNP4 reg reg
' C_s6k41h_696dde38_enterblock_L000240_241 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k41i_696dde38_undefgoto_L000245 ' <symbol:undefgoto>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long @C_s6k41i_696dde38_undefgoto_L000245_249_L000250
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_s6k41i_696dde38_undefgoto_L000245_247 ' NEU4
 jmp #LODL
 long @C_s6k41i_696dde38_undefgoto_L000245_251_L000252
 mov r19, RI ' reg <- addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s6k41i_696dde38_undefgoto_L000245_248 ' JUMPV addrg
C_s6k41i_696dde38_undefgoto_L000245_247
 jmp #LODL
 long @C_s6k41i_696dde38_undefgoto_L000245_253_L000254
 mov r19, RI ' reg <- addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #16 ' ADDP4 coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_s6k41i_696dde38_undefgoto_L000245_248
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
' C_s6k41i_696dde38_undefgoto_L000245_246 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41m_696dde38_leaveblock_L000255 ' <symbol:leaveblock>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4m_696dde38_reglevel_L000082
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4s_696dde38_removevars_L000118
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #14 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s6k41m_696dde38_leaveblock_L000255_257 ' EQI4
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long @C_s6k41i_696dde38_undefgoto_L000245_249_L000250
 mov r3, RI ' reg ARG ADDRG
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41f_696dde38_createlabel_L000226
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_s6k41m_696dde38_leaveblock_L000255_257
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s6k41m_696dde38_leaveblock_L000255_259 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s6k41m_696dde38_leaveblock_L000255_259 ' EQU4
 mov r20, r21
 adds r20, #13 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k41m_696dde38_leaveblock_L000255_259 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #54
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
C_s6k41m_696dde38_leaveblock_L000255_259
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s6k41m_696dde38_leaveblock_L000255_261 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41g_696dde38_movegotosout_L000232
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k41m_696dde38_leaveblock_L000255_262 ' JUMPV addrg
C_s6k41m_696dde38_leaveblock_L000255_261
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r19
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_s6k41m_696dde38_leaveblock_L000255_263 ' GEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 mov r20, r19
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41i_696dde38_undefgoto_L000245
 add SP, #4 ' CALL addrg
C_s6k41m_696dde38_leaveblock_L000255_263
C_s6k41m_696dde38_leaveblock_L000255_262
' C_s6k41m_696dde38_leaveblock_L000255_256 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k41n_696dde38_addprototype_L000265 ' <symbol:addprototype>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov RI, r19
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_s6k41n_696dde38_addprototype_L000265_267 ' LTI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_s6k41n_696dde38_addprototype_L000265_269_L000270
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 131071
 mov r3, RI ' reg ARG con
 mov r4, #4 ' reg ARG coni
 mov r5, r21
 adds r5, #28 ' ADDP4 coni
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, r21
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s6k41n_696dde38_addprototype_L000265_272 ' JUMPV addrg
C_s6k41n_696dde38_addprototype_L000265_271
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_s6k41n_696dde38_addprototype_L000265_272
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r13, r22 wz,wc
 jmp #BR_B
 long @C_s6k41n_696dde38_addprototype_L000265_271 ' LTI4
C_s6k41n_696dde38_addprototype_L000265_267
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaF__newproto ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 shl r20, #2 ' LSHI4 coni
 mov r18, r21
 adds r18, #56 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k41n_696dde38_addprototype_L000265_275 ' EQI4
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k41n_696dde38_addprototype_L000265_275 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k41n_696dde38_addprototype_L000265_275 ' JUMPV addrg
C_s6k41n_696dde38_addprototype_L000265_275
 mov r0, r17 ' CVI, CVU or LOAD
' C_s6k41n_696dde38_addprototype_L000265_266 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41p_696dde38_codeclosure_L000276 ' <symbol:codeclosure>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, #79 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__codeA_B_x
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #17 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
' C_s6k41p_696dde38_codeclosure_L000276_277 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41q_696dde38_open_func_L000278 ' <symbol:open_func>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov r20, r17
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #53 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #51 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
 mov r22, r21
 adds r22, #50 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #54 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #40 ' ADDP4 coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #76 ' ADDP4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k41q_696dde38_open_func_L000278_281 ' EQI4
 mov r20, r17
 adds r20, #76 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k41q_696dde38_open_func_L000278_281 ' EQI4
 mov r22, r17
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k41q_696dde38_open_func_L000278_281 ' JUMPV addrg
C_s6k41q_696dde38_open_func_L000278_281
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
' C_s6k41q_696dde38_open_func_L000278_279 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41r_696dde38_close_func_L000282 ' <symbol:close_func>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov RI, r19
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__ret
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__finish ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #20 ' ADDP4 coni
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #24 ' ADDP4 coni
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #8 ' reg ARG coni
 mov r22, r19
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #36 ' ADDP4 coni
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #8 ' reg ARG coni
 mov r22, r19
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #16 ' ADDP4 coni
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #4 ' reg ARG coni
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #28 ' ADDP4 coni
 mov r22, r21
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #12 ' reg ARG coni
 mov r22, r19
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r4, r21
 adds r4, #32 ' ADDP4 coni
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #8 ' reg ARG coni
 mov r22, r19
 adds r22, #51 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov r4, r21
 adds r4, #12 ' ADDP4 coni
 mov r22, r21
 adds r22, #60 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17
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
 long @C_s6k41r_696dde38_close_func_L000282_284 ' LEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_s6k41r_696dde38_close_func_L000282_284
' C_s6k41r_696dde38_close_func_L000282_283 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41s_696dde38_block_follow_L000286 ' <symbol:block_follow>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRI4 reg
 mov r22, #276 ' reg <- coni
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_s6k41s_696dde38_block_follow_L000286_292 ' EQI4
 cmps r23, r22 wz,wc
 jmp #BR_A
 long @C_s6k41s_696dde38_block_follow_L000286_294 ' GTI4
' C_s6k41s_696dde38_block_follow_L000286_293 ' (symbol refcount = 0)
 cmps r23,  #259 wz
 jmp #BR_Z
 long @C_s6k41s_696dde38_block_follow_L000286_291 ' EQI4
 cmps r23,  #260 wz
 jmp #BR_Z
 long @C_s6k41s_696dde38_block_follow_L000286_291 ' EQI4
 cmps r23,  #261 wz
 jmp #BR_Z
 long @C_s6k41s_696dde38_block_follow_L000286_291 ' EQI4
 jmp #JMPA
 long @C_s6k41s_696dde38_block_follow_L000286_288 ' JUMPV addrg
C_s6k41s_696dde38_block_follow_L000286_294
 cmps r23,  #288 wz
 jmp #BR_Z
 long @C_s6k41s_696dde38_block_follow_L000286_291 ' EQI4
 jmp #JMPA
 long @C_s6k41s_696dde38_block_follow_L000286_288 ' JUMPV addrg
C_s6k41s_696dde38_block_follow_L000286_291
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s6k41s_696dde38_block_follow_L000286_287 ' JUMPV addrg
C_s6k41s_696dde38_block_follow_L000286_292
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s6k41s_696dde38_block_follow_L000286_287 ' JUMPV addrg
C_s6k41s_696dde38_block_follow_L000286_288
 mov r0, #0 ' reg <- coni
C_s6k41s_696dde38_block_follow_L000286_287
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k41t_696dde38_statlist_L000295 ' <symbol:statlist>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s6k41t_696dde38_statlist_L000295_298 ' JUMPV addrg
C_s6k41t_696dde38_statlist_L000295_297
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #273 wz
 jmp #BRNZ
 long @C_s6k41t_696dde38_statlist_L000295_300 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4_696dde38_statement_L000022 ' CALL addrg
 jmp #JMPA
 long @C_s6k41t_696dde38_statlist_L000295_296 ' JUMPV addrg
C_s6k41t_696dde38_statlist_L000295_300
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4_696dde38_statement_L000022 ' CALL addrg
C_s6k41t_696dde38_statlist_L000295_298
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41s_696dde38_block_follow_L000286
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k41t_696dde38_statlist_L000295_297 ' EQI4
C_s6k41t_696dde38_statlist_L000295_296
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k41u_696dde38_fieldsel_L000302 ' <symbol:fieldsel>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyregup
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4h_696dde38_codename_L000067
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__indexed
 add SP, #8 ' CALL addrg
' C_s6k41u_696dde38_fieldsel_L000302_303 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k41v_696dde38_yindex_L000304 ' <symbol:yindex>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2val
 add SP, #4 ' CALL addrg
 mov r2, #93 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
' C_s6k41v_696dde38_yindex_L000304_305 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k420_696dde38_recfield_L000306 ' <symbol:recfield>
 jmp #NEWF
 sub SP, #52
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #291 wz
 jmp #BRNZ
 long @C_s6k420_696dde38_recfield_L000306_308 ' NEI4
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4h_696dde38_codename_L000067
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k420_696dde38_recfield_L000306_309 ' JUMPV addrg
C_s6k420_696dde38_recfield_L000306_308
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41v_696dde38_yindex_L000304
 add SP, #4 ' CALL addrg
C_s6k420_696dde38_recfield_L000306_309
 jmp #LODL
 long @C_s6k420_696dde38_recfield_L000306_310_L000311
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 2147483647
 mov r3, RI ' reg ARG con
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k48_696dde38_checklimit_L000039
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r1, BC ' reg <- INDIRP4 reg
 jmp #CPYB
 long 16 ' ASGNB
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__indexed
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-56) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__storevar
 add SP, #8 ' CALL addrg
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s6k420_696dde38_recfield_L000306_307 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #52 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k422_696dde38_closelistfield_L000312 ' <symbol:closelistfield>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s6k422_696dde38_closelistfield_L000312_314 ' NEI4
 jmp #JMPA
 long @C_s6k422_696dde38_closelistfield_L000312_313 ' JUMPV addrg
C_s6k422_696dde38_closelistfield_L000312_314
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #50 wz
 jmp #BRNZ
 long @C_s6k422_696dde38_closelistfield_L000312_316 ' NEI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setlist
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #28 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_s6k422_696dde38_closelistfield_L000312_316
C_s6k422_696dde38_closelistfield_L000312_313
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k423_696dde38_lastlistfield_L000318 ' <symbol:lastlistfield>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s6k423_696dde38_lastlistfield_L000318_320 ' NEI4
 jmp #JMPA
 long @C_s6k423_696dde38_lastlistfield_L000318_319 ' JUMPV addrg
C_s6k423_696dde38_lastlistfield_L000318_320
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_s6k423_696dde38_lastlistfield_L000318_324 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s6k423_696dde38_lastlistfield_L000318_322 ' NEI4
C_s6k423_696dde38_lastlistfield_L000318_324
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setreturns
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setlist
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s6k423_696dde38_lastlistfield_L000318_323 ' JUMPV addrg
C_s6k423_696dde38_lastlistfield_L000318_322
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s6k423_696dde38_lastlistfield_L000318_325 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
C_s6k423_696dde38_lastlistfield_L000318_325
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setlist
 add SP, #12 ' CALL addrg
C_s6k423_696dde38_lastlistfield_L000318_323
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #28 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_s6k423_696dde38_lastlistfield_L000318_319
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k424_696dde38_listfield_L000327 ' <symbol:listfield>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_s6k424_696dde38_listfield_L000327_328 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k425_696dde38_field_L000329 ' <symbol:field>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r22, #91 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_s6k425_696dde38_field_L000329_337 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_s6k425_696dde38_field_L000329_331 ' LTI4
' C_s6k425_696dde38_field_L000329_338 ' (symbol refcount = 0)
 cmps r19,  #291 wz
 jmp #BR_Z
 long @C_s6k425_696dde38_field_L000329_334 ' EQI4
 jmp #JMPA
 long @C_s6k425_696dde38_field_L000329_331 ' JUMPV addrg
C_s6k425_696dde38_field_L000329_334
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__lookahead ' CALL addrg
 cmps r0,  #61 wz
 jmp #BR_Z
 long @C_s6k425_696dde38_field_L000329_335 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k424_696dde38_listfield_L000327
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k425_696dde38_field_L000329_332 ' JUMPV addrg
C_s6k425_696dde38_field_L000329_335
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k420_696dde38_recfield_L000306
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k425_696dde38_field_L000329_332 ' JUMPV addrg
C_s6k425_696dde38_field_L000329_337
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k420_696dde38_recfield_L000306
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k425_696dde38_field_L000329_332 ' JUMPV addrg
C_s6k425_696dde38_field_L000329_331
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k424_696dde38_listfield_L000327
 add SP, #4 ' CALL addrg
C_s6k425_696dde38_field_L000329_332
' C_s6k425_696dde38_field_L000329_330 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k426_696dde38_constructor_L000339 ' <symbol:constructor>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #19
 jmp #PSHL ' stack ARG coni
 mov RI, r19
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, #8 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 mov r2, #123 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
C_s6k426_696dde38_constructor_L000339_345
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #125 wz
 jmp #BRNZ
 long @C_s6k426_696dde38_constructor_L000339_348 ' NEI4
 jmp #JMPA
 long @C_s6k426_696dde38_constructor_L000339_347 ' JUMPV addrg
C_s6k426_696dde38_constructor_L000339_348
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k422_696dde38_closelistfield_L000312
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k425_696dde38_field_L000329
 add SP, #4 ' CALL addrg
' C_s6k426_696dde38_constructor_L000339_346 ' (symbol refcount = 0)
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s6k426_696dde38_constructor_L000339_345 ' NEI4
 mov r2, #59 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k426_696dde38_constructor_L000339_345 ' NEI4
C_s6k426_696dde38_constructor_L000339_347
 mov RI, FP
 sub RI, #-(-40)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #123 ' reg ARG coni
 mov r4, #125 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k423_696dde38_lastlistfield_L000318
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-44)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r19
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__settablesize
 add SP, #16 ' CALL addrg
' C_s6k426_696dde38_constructor_L000339_340 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k427_696dde38_setvararg_L000352 ' <symbol:setvararg>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #81
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
' C_s6k427_696dde38_setvararg_L000352_353 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k428_696dde38_parlist_L000354 ' <symbol:parlist>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r21, #0 ' reg <- coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #41 wz
 jmp #BR_Z
 long @C_s6k428_696dde38_parlist_L000354_356 ' EQI4
C_s6k428_696dde38_parlist_L000354_358
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 mov r22, #280 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_s6k428_696dde38_parlist_L000354_365 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_s6k428_696dde38_parlist_L000354_361 ' LTI4
' C_s6k428_696dde38_parlist_L000354_368 ' (symbol refcount = 0)
 cmps r17,  #291 wz
 jmp #BR_Z
 long @C_s6k428_696dde38_parlist_L000354_364 ' EQI4
 jmp #JMPA
 long @C_s6k428_696dde38_parlist_L000354_361 ' JUMPV addrg
C_s6k428_696dde38_parlist_L000354_364
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s6k428_696dde38_parlist_L000354_362 ' JUMPV addrg
C_s6k428_696dde38_parlist_L000354_365
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_s6k428_696dde38_parlist_L000354_362 ' JUMPV addrg
C_s6k428_696dde38_parlist_L000354_361
 jmp #LODL
 long @C_s6k428_696dde38_parlist_L000354_366_L000367
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k428_696dde38_parlist_L000354_362
' C_s6k428_696dde38_parlist_L000354_359 ' (symbol refcount = 0)
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_s6k428_696dde38_parlist_L000354_369 ' NEI4
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k428_696dde38_parlist_L000354_358 ' NEI4
C_s6k428_696dde38_parlist_L000354_369
C_s6k428_696dde38_parlist_L000354_356
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov r20, r19
 adds r20, #50 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_s6k428_696dde38_parlist_L000354_370 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k427_696dde38_setvararg_L000352
 add SP, #4 ' CALL addrg
C_s6k428_696dde38_parlist_L000354_370
 mov r22, r19
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
' C_s6k428_696dde38_parlist_L000354_355 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k42a_696dde38_body_L000372 ' <symbol:body>
 jmp #NEWF
 sub SP, #72
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41n_696dde38_addprototype_L000265 ' CALL addrg
 mov RI, FP
 sub RI, #-(-60)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-60) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41q_696dde38_open_func_L000278
 add SP, #8 ' CALL addrg
 mov r2, #40 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_s6k42a_696dde38_body_L000372_374 ' EQI4
 mov r2, #4 ' reg ARG coni
 jmp #LODL
 long @C_s6k42a_696dde38_body_L000372_376_L000377
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112
 add SP, #4 ' CALL addrg
C_s6k42a_696dde38_body_L000372_374
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k428_696dde38_parlist_L000354 ' CALL addrg
 mov r2, #41 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41t_696dde38_statlist_L000295 ' CALL addrg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #44 ' ADDP4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #264 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41p_696dde38_codeclosure_L000276
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41r_696dde38_close_func_L000282 ' CALL addrg
' C_s6k42a_696dde38_body_L000372_373 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #72 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k42c_696dde38_explist_L000378 ' <symbol:explist>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #1 ' reg <- coni
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42c_696dde38_explist_L000378_381 ' JUMPV addrg
C_s6k42c_696dde38_explist_L000378_380
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 adds r19, #1 ' ADDI4 coni
C_s6k42c_696dde38_explist_L000378_381
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k42c_696dde38_explist_L000378_380 ' NEI4
 mov r0, r19 ' CVI, CVU or LOAD
' C_s6k42c_696dde38_explist_L000378_379 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k42d_696dde38_funcargs_L000383 ' <symbol:funcargs>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 mov r22, #123 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_s6k42d_696dde38_funcargs_L000383_394 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_A
 long @C_s6k42d_696dde38_funcargs_L000383_399 ' GTI4
' C_s6k42d_696dde38_funcargs_L000383_398 ' (symbol refcount = 0)
 cmps r15,  #40 wz
 jmp #BR_Z
 long @C_s6k42d_696dde38_funcargs_L000383_388 ' EQI4
 jmp #JMPA
 long @C_s6k42d_696dde38_funcargs_L000383_385 ' JUMPV addrg
C_s6k42d_696dde38_funcargs_L000383_399
 cmps r15,  #292 wz
 jmp #BR_Z
 long @C_s6k42d_696dde38_funcargs_L000383_395 ' EQI4
 jmp #JMPA
 long @C_s6k42d_696dde38_funcargs_L000383_385 ' JUMPV addrg
C_s6k42d_696dde38_funcargs_L000383_388
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #41 wz
 jmp #BRNZ
 long @C_s6k42d_696dde38_funcargs_L000383_389 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s6k42d_696dde38_funcargs_L000383_390 ' JUMPV addrg
C_s6k42d_696dde38_funcargs_L000383_389
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42c_696dde38_explist_L000378
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_s6k42d_696dde38_funcargs_L000383_393 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s6k42d_696dde38_funcargs_L000383_391 ' NEI4
C_s6k42d_696dde38_funcargs_L000383_393
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setreturns
 add SP, #8 ' CALL addrg
C_s6k42d_696dde38_funcargs_L000383_391
C_s6k42d_696dde38_funcargs_L000383_390
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #40 ' reg ARG coni
 mov r4, #41 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_s6k42d_696dde38_funcargs_L000383_386 ' JUMPV addrg
C_s6k42d_696dde38_funcargs_L000383_394
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k426_696dde38_constructor_L000339
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42d_696dde38_funcargs_L000383_386 ' JUMPV addrg
C_s6k42d_696dde38_funcargs_L000383_395
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4g_696dde38_codestring_L000065
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 jmp #JMPA
 long @C_s6k42d_696dde38_funcargs_L000383_386 ' JUMPV addrg
C_s6k42d_696dde38_funcargs_L000383_385
 jmp #LODL
 long @C_s6k42d_696dde38_funcargs_L000383_396_L000397
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k42d_696dde38_funcargs_L000383_386
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_s6k42d_696dde38_funcargs_L000383_402 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s6k42d_696dde38_funcargs_L000383_400 ' NEI4
C_s6k42d_696dde38_funcargs_L000383_402
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s6k42d_696dde38_funcargs_L000383_401 ' JUMPV addrg
C_s6k42d_696dde38_funcargs_L000383_400
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s6k42d_696dde38_funcargs_L000383_403 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
C_s6k42d_696dde38_funcargs_L000383_403
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r17
 adds r20, #1 ' ADDI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s6k42d_696dde38_funcargs_L000383_401
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r4, r22
 adds r4, #1 ' ADDI4 coni
 mov r5, r17 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #68
 jmp #PSHL ' stack ARG coni
 mov RI, r19
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #18 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 mov r20, r17
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s6k42d_696dde38_funcargs_L000383_384 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k42f_696dde38_primaryexp_L000405 ' <symbol:primaryexp>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r22, #40 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_s6k42f_696dde38_primaryexp_L000405_410 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_s6k42f_696dde38_primaryexp_L000405_407 ' LTI4
' C_s6k42f_696dde38_primaryexp_L000405_414 ' (symbol refcount = 0)
 cmps r19,  #291 wz
 jmp #BR_Z
 long @C_s6k42f_696dde38_primaryexp_L000405_411 ' EQI4
 jmp #JMPA
 long @C_s6k42f_696dde38_primaryexp_L000405_407 ' JUMPV addrg
C_s6k42f_696dde38_primaryexp_L000405_410
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #40 ' reg ARG coni
 mov r4, #41 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42f_696dde38_primaryexp_L000405_406 ' JUMPV addrg
C_s6k42f_696dde38_primaryexp_L000405_411
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k415_696dde38_singlevar_L000176
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42f_696dde38_primaryexp_L000405_406 ' JUMPV addrg
C_s6k42f_696dde38_primaryexp_L000405_407
 jmp #LODL
 long @C_s6k42f_696dde38_primaryexp_L000405_412_L000413
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k42f_696dde38_primaryexp_L000405_406
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k42h_696dde38_suffixedexp_L000415 ' <symbol:suffixedexp>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42f_696dde38_primaryexp_L000405
 add SP, #4 ' CALL addrg
C_s6k42h_696dde38_suffixedexp_L000415_417
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 mov r22, #58 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_s6k42h_696dde38_suffixedexp_L000415_426 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_s6k42h_696dde38_suffixedexp_L000415_429 ' GTI4
' C_s6k42h_696dde38_suffixedexp_L000415_428 ' (symbol refcount = 0)
 mov r22, #40 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_s6k42h_696dde38_suffixedexp_L000415_427 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_s6k42h_696dde38_suffixedexp_L000415_416 ' LTI4
' C_s6k42h_696dde38_suffixedexp_L000415_430 ' (symbol refcount = 0)
 cmps r17,  #46 wz
 jmp #BR_Z
 long @C_s6k42h_696dde38_suffixedexp_L000415_424 ' EQI4
 jmp #JMPA
 long @C_s6k42h_696dde38_suffixedexp_L000415_416 ' JUMPV addrg
C_s6k42h_696dde38_suffixedexp_L000415_429
 mov r22, #123 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_s6k42h_696dde38_suffixedexp_L000415_427 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_s6k42h_696dde38_suffixedexp_L000415_432 ' GTI4
' C_s6k42h_696dde38_suffixedexp_L000415_431 ' (symbol refcount = 0)
 cmps r17,  #91 wz
 jmp #BR_Z
 long @C_s6k42h_696dde38_suffixedexp_L000415_425 ' EQI4
 jmp #JMPA
 long @C_s6k42h_696dde38_suffixedexp_L000415_416 ' JUMPV addrg
C_s6k42h_696dde38_suffixedexp_L000415_432
 cmps r17,  #292 wz
 jmp #BR_Z
 long @C_s6k42h_696dde38_suffixedexp_L000415_427 ' EQI4
 jmp #JMPA
 long @C_s6k42h_696dde38_suffixedexp_L000415_416 ' JUMPV addrg
C_s6k42h_696dde38_suffixedexp_L000415_424
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41u_696dde38_fieldsel_L000302
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42h_696dde38_suffixedexp_L000415_417 ' JUMPV addrg
C_s6k42h_696dde38_suffixedexp_L000415_425
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyregup
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41v_696dde38_yindex_L000304
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__indexed
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k42h_696dde38_suffixedexp_L000415_417 ' JUMPV addrg
C_s6k42h_696dde38_suffixedexp_L000415_426
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4h_696dde38_codename_L000067
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__self
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42d_696dde38_funcargs_L000383
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42h_696dde38_suffixedexp_L000415_417 ' JUMPV addrg
C_s6k42h_696dde38_suffixedexp_L000415_427
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42d_696dde38_funcargs_L000383
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42h_696dde38_suffixedexp_L000415_417 ' JUMPV addrg
C_s6k42h_696dde38_suffixedexp_L000415_416
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k42i_696dde38_simpleexp_L000433 ' <symbol:simpleexp>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r22, #269 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_441 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_s6k42i_696dde38_simpleexp_L000433_452 ' GTI4
' C_s6k42i_696dde38_simpleexp_L000433_451 ' (symbol refcount = 0)
 mov r22, #123 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_449 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_s6k42i_696dde38_simpleexp_L000433_435 ' LTI4
' C_s6k42i_696dde38_simpleexp_L000433_453 ' (symbol refcount = 0)
 cmps r19,  #262 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_443 ' EQI4
 cmps r19,  #264 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_450 ' EQI4
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_435 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_452
 mov r22, #280 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_444 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_s6k42i_696dde38_simpleexp_L000433_455 ' GTI4
' C_s6k42i_696dde38_simpleexp_L000433_454 ' (symbol refcount = 0)
 cmps r19,  #275 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_442 ' EQI4
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_435 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_455
 cmps r19,  #289 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_438 ' EQI4
 cmps r19,  #290 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_439 ' EQI4
 cmps r19,  #292 wz
 jmp #BR_Z
 long @C_s6k42i_696dde38_simpleexp_L000433_440 ' EQI4
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_435 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_438
 mov r2, #0 ' reg ARG coni
 mov r3, #5 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRF4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNF4 reg reg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_436 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_439
 mov r2, #0 ' reg ARG coni
 mov r3, #6 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_436 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_440
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4g_696dde38_codestring_L000065
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_436 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_441
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_436 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_442
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_436 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_443
 mov r2, #0 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_436 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_444
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s6k42i_696dde38_simpleexp_L000433_445 ' NEI4
 jmp #LODL
 long @C_s6k42i_696dde38_simpleexp_L000433_447_L000448
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k42i_696dde38_simpleexp_L000433_445
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #80
 jmp #PSHL ' stack ARG coni
 jmp #PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #19 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_436 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_449
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k426_696dde38_constructor_L000339
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_434 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_450
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, #0 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42a_696dde38_body_L000372
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_434 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_435
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42h_696dde38_suffixedexp_L000415
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k42i_696dde38_simpleexp_L000433_434 ' JUMPV addrg
C_s6k42i_696dde38_simpleexp_L000433_436
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
C_s6k42i_696dde38_simpleexp_L000433_434
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k42k_696dde38_getunopr_L000456 ' <symbol:getunopr>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, #45 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_s6k42k_696dde38_getunopr_L000456_461 ' EQI4
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_s6k42k_696dde38_getunopr_L000456_465 ' GTI4
' C_s6k42k_696dde38_getunopr_L000456_464 ' (symbol refcount = 0)
 cmps r2,  #35 wz
 jmp #BR_Z
 long @C_s6k42k_696dde38_getunopr_L000456_463 ' EQI4
 jmp #JMPA
 long @C_s6k42k_696dde38_getunopr_L000456_458 ' JUMPV addrg
C_s6k42k_696dde38_getunopr_L000456_465
 mov r22, #126 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_s6k42k_696dde38_getunopr_L000456_462 ' EQI4
 cmps r2, r22 wz,wc
 jmp #BR_B
 long @C_s6k42k_696dde38_getunopr_L000456_458 ' LTI4
' C_s6k42k_696dde38_getunopr_L000456_466 ' (symbol refcount = 0)
 cmps r2,  #270 wz
 jmp #BR_Z
 long @C_s6k42k_696dde38_getunopr_L000456_460 ' EQI4
 jmp #JMPA
 long @C_s6k42k_696dde38_getunopr_L000456_458 ' JUMPV addrg
C_s6k42k_696dde38_getunopr_L000456_460
 mov r0, #2 ' reg <- coni
 jmp #JMPA
 long @C_s6k42k_696dde38_getunopr_L000456_457 ' JUMPV addrg
C_s6k42k_696dde38_getunopr_L000456_461
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s6k42k_696dde38_getunopr_L000456_457 ' JUMPV addrg
C_s6k42k_696dde38_getunopr_L000456_462
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s6k42k_696dde38_getunopr_L000456_457 ' JUMPV addrg
C_s6k42k_696dde38_getunopr_L000456_463
 mov r0, #3 ' reg <- coni
 jmp #JMPA
 long @C_s6k42k_696dde38_getunopr_L000456_457 ' JUMPV addrg
C_s6k42k_696dde38_getunopr_L000456_458
 mov r0, #4 ' reg <- coni
C_s6k42k_696dde38_getunopr_L000456_457
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s6k42l_696dde38_getbinopr_L000467 ' <symbol:getbinopr>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #94 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_s6k42l_696dde38_getbinopr_L000467_475 ' EQI4
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_s6k42l_696dde38_getbinopr_L000467_493 ' GTI4
' C_s6k42l_696dde38_getbinopr_L000467_492 ' (symbol refcount = 0)
 cmps r2,  #37 wz,wc
 jmp #BR_B
 long @C_s6k42l_696dde38_getbinopr_L000467_469 ' LTI4
 cmps r2,  #47 wz,wc
 jmp #BR_A
 long @C_s6k42l_696dde38_getbinopr_L000467_494 ' GTI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s6k42l_696dde38_getbinopr_L000467_495_L000497-148
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s6k42l_696dde38_getbinopr_L000467_495_L000497 ' <symbol:495>
 long @C_s6k42l_696dde38_getbinopr_L000467_474
 long @C_s6k42l_696dde38_getbinopr_L000467_478
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_473
 long @C_s6k42l_696dde38_getbinopr_L000467_471
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_472
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_476

' Catalina Code

DAT ' code segment
C_s6k42l_696dde38_getbinopr_L000467_494
 cmps r2,  #60 wz
 jmp #BR_Z
 long @C_s6k42l_696dde38_getbinopr_L000467_486 ' EQI4
 cmps r2,  #62 wz
 jmp #BR_Z
 long @C_s6k42l_696dde38_getbinopr_L000467_488 ' EQI4
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_469 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_493
 mov r22, #256 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_s6k42l_696dde38_getbinopr_L000467_490 ' EQI4
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_s6k42l_696dde38_getbinopr_L000467_500 ' GTI4
' C_s6k42l_696dde38_getbinopr_L000467_499 ' (symbol refcount = 0)
 cmps r2,  #124 wz
 jmp #BR_Z
 long @C_s6k42l_696dde38_getbinopr_L000467_479 ' EQI4
 cmps r2,  #126 wz
 jmp #BR_Z
 long @C_s6k42l_696dde38_getbinopr_L000467_480 ' EQI4
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_469 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_500
 cmps r2,  #271 wz,wc
 jmp #BR_B
 long @C_s6k42l_696dde38_getbinopr_L000467_469 ' LTI4
 cmps r2,  #286 wz,wc
 jmp #BR_A
 long @C_s6k42l_696dde38_getbinopr_L000467_469 ' GTI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s6k42l_696dde38_getbinopr_L000467_501_L000503-1084
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s6k42l_696dde38_getbinopr_L000467_501_L000503 ' <symbol:501>
 long @C_s6k42l_696dde38_getbinopr_L000467_491
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_477
 long @C_s6k42l_696dde38_getbinopr_L000467_483
 long @C_s6k42l_696dde38_getbinopr_L000467_469
 long @C_s6k42l_696dde38_getbinopr_L000467_485
 long @C_s6k42l_696dde38_getbinopr_L000467_489
 long @C_s6k42l_696dde38_getbinopr_L000467_487
 long @C_s6k42l_696dde38_getbinopr_L000467_484
 long @C_s6k42l_696dde38_getbinopr_L000467_481
 long @C_s6k42l_696dde38_getbinopr_L000467_482

' Catalina Code

DAT ' code segment
C_s6k42l_696dde38_getbinopr_L000467_471
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_472
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_473
 mov r0, #2 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_474
 mov r0, #3 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_475
 mov r0, #4 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_476
 mov r0, #5 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_477
 mov r0, #6 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_478
 mov r0, #7 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_479
 mov r0, #8 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_480
 mov r0, #9 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_481
 mov r0, #10 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_482
 mov r0, #11 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_483
 mov r0, #12 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_484
 mov r0, #16 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_485
 mov r0, #13 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_486
 mov r0, #14 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_487
 mov r0, #15 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_488
 mov r0, #17 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_489
 mov r0, #18 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_490
 mov r0, #19 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_491
 mov r0, #20 ' reg <- coni
 jmp #JMPA
 long @C_s6k42l_696dde38_getbinopr_L000467_468 ' JUMPV addrg
C_s6k42l_696dde38_getbinopr_L000467_469
 mov r0, #21 ' reg <- coni
C_s6k42l_696dde38_getbinopr_L000467_468
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s6k42q_696dde38_priority_L000506 ' <symbol:priority>
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
C_s6k42r_696dde38_subexpr_L000507 ' <symbol:subexpr>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaE__incC_stack ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k42k_696dde38_getunopr_L000456 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #4 wz
 jmp #BR_Z
 long @C_s6k42r_696dde38_subexpr_L000507_509 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, #12 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42r_696dde38_subexpr_L000507
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__prefix
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_s6k42r_696dde38_subexpr_L000507_510 ' JUMPV addrg
C_s6k42r_696dde38_subexpr_L000507_509
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42i_696dde38_simpleexp_L000433
 add SP, #4 ' CALL addrg
C_s6k42r_696dde38_subexpr_L000507_510
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k42l_696dde38_getbinopr_L000467 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s6k42r_696dde38_subexpr_L000507_512 ' JUMPV addrg
C_s6k42r_696dde38_subexpr_L000507_511
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRI4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__infix
 add SP, #8 ' CALL addrg
 mov r22, r17
 shl r22, #1 ' LSHI4 coni
 jmp #LODL
 long @C_s6k42q_696dde38_priority_L000506+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42r_696dde38_subexpr_L000507
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__posfix
 add SP, #16 ' CALL addrg
 mov r17, r15 ' CVI, CVU or LOAD
C_s6k42r_696dde38_subexpr_L000507_512
 cmps r17,  #21 wz
 jmp #BR_Z
 long @C_s6k42r_696dde38_subexpr_L000507_515 ' EQI4
 mov r22, r17
 shl r22, #1 ' LSHI4 coni
 jmp #LODL
 long @C_s6k42q_696dde38_priority_L000506
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r19 wz,wc
 jmp #BR_A
 long @C_s6k42r_696dde38_subexpr_L000507_511 ' GTI4
C_s6k42r_696dde38_subexpr_L000507_515
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
' C_s6k42r_696dde38_subexpr_L000507_508 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k41_696dde38_expr_L000023 ' <symbol:expr>
 jmp #NEWF
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42r_696dde38_subexpr_L000507
 add SP, #8 ' CALL addrg
' C_s6k41_696dde38_expr_L000023_516 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k42s_696dde38_block_L000517 ' <symbol:block>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41t_696dde38_statlist_L000295 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
' C_s6k42s_696dde38_block_L000517_518 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k42t_696dde38_check_conflict_L000519 ' <symbol:check_conflict>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 mov r22, r13
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_s6k42t_696dde38_check_conflict_L000519_524 ' JUMPV addrg
C_s6k42t_696dde38_check_conflict_L000519_521
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, #12 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_s6k42t_696dde38_check_conflict_L000519_525 ' GTI4
 cmps r22,  #15 wz,wc
 jmp #BR_A
 long @C_s6k42t_696dde38_check_conflict_L000519_525 ' GTI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #13 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_527 ' NEI4
 mov r22, #10 ' reg <- coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_528 ' NEI4
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_528 ' NEI4
 mov r17, #1 ' reg <- coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #15 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_s6k42t_696dde38_check_conflict_L000519_528 ' JUMPV addrg
C_s6k42t_696dde38_check_conflict_L000519_527
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_531 ' NEI4
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_531 ' NEI4
 mov r17, #1 ' reg <- coni
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s6k42t_696dde38_check_conflict_L000519_531
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #12 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_533 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_533 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_533 ' NEI4
 mov r17, #1 ' reg <- coni
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
C_s6k42t_696dde38_check_conflict_L000519_533
C_s6k42t_696dde38_check_conflict_L000519_528
C_s6k42t_696dde38_check_conflict_L000519_525
' C_s6k42t_696dde38_check_conflict_L000519_522 ' (symbol refcount = 0)
 mov RI, r21
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_s6k42t_696dde38_check_conflict_L000519_524
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_521 ' NEU4
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s6k42t_696dde38_check_conflict_L000519_535 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_s6k42t_696dde38_check_conflict_L000519_537 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r15 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 mov RI, r13
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #JMPA
 long @C_s6k42t_696dde38_check_conflict_L000519_538 ' JUMPV addrg
C_s6k42t_696dde38_check_conflict_L000519_537
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r15 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #9
 jmp #PSHL ' stack ARG coni
 mov RI, r13
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
C_s6k42t_696dde38_check_conflict_L000519_538
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
C_s6k42t_696dde38_check_conflict_L000519_535
' C_s6k42t_696dde38_check_conflict_L000519_520 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k42u_696dde38_restassign_L000539 ' <symbol:restassign>
 jmp #NEWF
 sub SP, #36
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, #9 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_s6k42u_696dde38_restassign_L000539_543 ' GTI4
 cmps r22,  #15 wz,wc
 jmp #BRBE
 long @C_s6k42u_696dde38_restassign_L000539_541 ' LEI4
C_s6k42u_696dde38_restassign_L000539_543
 jmp #LODL
 long @C_s6k42u_696dde38_restassign_L000539_544_L000545
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k42u_696dde38_restassign_L000539_541
 mov r2, r21
 adds r2, #4 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4p_696dde38_check_readonly_L000096
 add SP, #4 ' CALL addrg
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k42u_696dde38_restassign_L000539_546 ' EQI4
 mov RI, FP
 sub RI, #-(-40)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42h_696dde38_suffixedexp_L000415
 add SP, #4 ' CALL addrg
 mov r22, #12 ' reg <- coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_s6k42u_696dde38_restassign_L000539_553 ' GTI4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #15 wz,wc
 jmp #BRBE
 long @C_s6k42u_696dde38_restassign_L000539_549 ' LEI4
C_s6k42u_696dde38_restassign_L000539_553
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42t_696dde38_check_conflict_L000519
 add SP, #8 ' CALL addrg
C_s6k42u_696dde38_restassign_L000539_549
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaE__incC_stack ' CALL addrg
 mov r2, r19
 adds r2, #1 ' ADDI4 coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42u_696dde38_restassign_L000539
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_s6k42u_696dde38_restassign_L000539_547 ' JUMPV addrg
C_s6k42u_696dde38_restassign_L000539_546
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42c_696dde38_explist_L000378
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22, r19 wz
 jmp #BR_Z
 long @C_s6k42u_696dde38_restassign_L000539_555 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k416_696dde38_adjust_assign_L000180
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_s6k42u_696dde38_restassign_L000539_556 ' JUMPV addrg
C_s6k42u_696dde38_restassign_L000539_555
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setoneret
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #4 ' ADDP4 coni
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__storevar
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k42u_696dde38_restassign_L000539_540 ' JUMPV addrg
C_s6k42u_696dde38_restassign_L000539_556
C_s6k42u_696dde38_restassign_L000539_547
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, #8 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4f_696dde38_init_exp_L000063
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #4 ' ADDP4 coni
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__storevar
 add SP, #8 ' CALL addrg
C_s6k42u_696dde38_restassign_L000539_540
 jmp #POPM ' restore registers
 add SP, #36 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k430_696dde38_cond_L000557 ' <symbol:cond>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_s6k430_696dde38_cond_L000557_559 ' NEI4
 mov r22, #3 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s6k430_696dde38_cond_L000557_559
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__goiftrue
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_s6k430_696dde38_cond_L000557_558 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k431_696dde38_gotostat_L000562 ' <symbol:gotostat>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41a_696dde38_findlabel_L000205
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s6k431_696dde38_gotostat_L000562_564 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
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
 long @C_s6k41d_696dde38_newgotoentry_L000217
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_s6k431_696dde38_gotostat_L000562_565 ' JUMPV addrg
C_s6k431_696dde38_gotostat_L000562_564
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4m_696dde38_reglevel_L000082
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r0, r20 wz,wc
 jmp #BRBE
 long @C_s6k431_696dde38_gotostat_L000562_566 ' LEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #54
 jmp #PSHL ' stack ARG coni
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
C_s6k431_696dde38_gotostat_L000562_566
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchlist
 add SP, #8 ' CALL addrg
C_s6k431_696dde38_gotostat_L000562_565
' C_s6k431_696dde38_gotostat_L000562_563 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k432_696dde38_breakstat_L000568 ' <symbol:breakstat>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long @C_s6k41i_696dde38_undefgoto_L000245_249_L000250
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41d_696dde38_newgotoentry_L000217
 add SP, #12 ' CALL addrg
' C_s6k432_696dde38_breakstat_L000568_569 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k433_696dde38_checkrepeated_L000570 ' <symbol:checkrepeated>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41a_696dde38_findlabel_L000205
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s6k433_696dde38_checkrepeated_L000570_572 ' EQU4
 jmp #LODL
 long @C_s6k433_696dde38_checkrepeated_L000570_574_L000575
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r21
 adds r3, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
C_s6k433_696dde38_checkrepeated_L000570_572
' C_s6k433_696dde38_checkrepeated_L000570_571 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k435_696dde38_labelstat_L000576 ' <symbol:labelstat>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #287 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k435_696dde38_labelstat_L000576_579 ' JUMPV addrg
C_s6k435_696dde38_labelstat_L000576_578
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4_696dde38_statement_L000022 ' CALL addrg
C_s6k435_696dde38_labelstat_L000576_579
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #59 wz
 jmp #BR_Z
 long @C_s6k435_696dde38_labelstat_L000576_578 ' EQI4
 cmps r22,  #287 wz
 jmp #BR_Z
 long @C_s6k435_696dde38_labelstat_L000576_578 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k433_696dde38_checkrepeated_L000570
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41s_696dde38_block_follow_L000286
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41f_696dde38_createlabel_L000226
 add SP, #12 ' CALL addrg
' C_s6k435_696dde38_labelstat_L000576_577 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k436_696dde38_whilestat_L000581 ' <symbol:whilestat>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__getlabel ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k430_696dde38_cond_L000557 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
 mov r2, #258 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k42s_696dde38_block_L000517 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchlist
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #277 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
' C_s6k436_696dde38_whilestat_L000581_582 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k437_696dde38_repeatstat_L000583 ' <symbol:repeatstat>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__getlabel ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41t_696dde38_statlist_L000295 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #272 ' reg ARG coni
 mov r4, #276 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k430_696dde38_cond_L000557 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
 mov r22, FP
 sub r22, #-(-7) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s6k437_696dde38_repeatstat_L000583_585 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4m_696dde38_reglevel_L000082
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r20 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #54
 jmp #PSHL ' stack ARG coni
 mov RI, r19
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-44)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
C_s6k437_696dde38_repeatstat_L000583_585
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchlist
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
' C_s6k437_696dde38_repeatstat_L000583_584 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k438_696dde38_exp1_L000589 ' <symbol:exp1>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
' C_s6k438_696dde38_exp1_L000589_590 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k439_696dde38_fixforjump_L000591 ' <symbol:fixforjump>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #1 ' ADDI4 coni
 mov r15, r19 ' SUBI/P
 subs r15, r22 ' SUBI/P (3)
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s6k439_696dde38_fixforjump_L000591_593 ' EQI4
 neg r15, r15 ' NEGI4
C_s6k439_696dde38_fixforjump_L000591_593
 jmp #LODL
 long 131071
 mov r22, RI ' reg <- con
 cmps r15, r22 wz,wc
 jmp #BRBE
 long @C_s6k439_696dde38_fixforjump_L000591_595 ' LEI4
 jmp #LODL
 long @C_s6k439_696dde38_fixforjump_L000591_597_L000598
 mov r2, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k439_696dde38_fixforjump_L000591_595
 mov RI, r13
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long 32767
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r15 ' CVI, CVU or LOAD
 shl r20, #15 ' LSHU4 coni
 jmp #LODL
 long $ffff8000
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r13
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
' C_s6k439_696dde38_fixforjump_L000591_592 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s6k43b_696dde38_forbody_L000599_forprep_L000602 ' <symbol:forprep>
 long 74
 long 75

 alignl ' align long
C_s6k43b_696dde38_forbody_L000599_forloop_L000604 ' <symbol:forloop>
 long 73
 long 77

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s6k43b_696dde38_forbody_L000599 ' <symbol:forbody>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r2, #258 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s6k43b_696dde38_forbody_L000599_forprep_L000602
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__codeA_B_x
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k42s_696dde38_block_L000517 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__getlabel ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k439_696dde38_fixforjump_L000591
 add SP, #12 ' CALL addrg
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s6k43b_696dde38_forbody_L000599_605 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #76
 jmp #PSHL ' stack ARG coni
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
C_s6k43b_696dde38_forbody_L000599_605
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s6k43b_696dde38_forbody_L000599_forloop_L000604
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__codeA_B_x
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r13
 adds r3, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k439_696dde38_fixforjump_L000591
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
' C_s6k43b_696dde38_forbody_L000599_600 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43e_696dde38_fornum_L000607 ' <symbol:fornum>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_s6k43e_696dde38_fornum_L000607_609_L000610
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_s6k43e_696dde38_fornum_L000607_609_L000610
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_s6k43e_696dde38_fornum_L000607_609_L000610
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k438_696dde38_exp1_L000589 ' CALL addrg
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k438_696dde38_exp1_L000589 ' CALL addrg
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k43e_696dde38_fornum_L000607_611 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k438_696dde38_exp1_L000589 ' CALL addrg
 jmp #JMPA
 long @C_s6k43e_696dde38_fornum_L000607_612 ' JUMPV addrg
C_s6k43e_696dde38_fornum_L000607_611
 mov r2, #1 ' reg ARG coni
 mov r22, r17
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__int
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
C_s6k43e_696dde38_fornum_L000607_612
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s6k43b_696dde38_forbody_L000599
 add SP, #16 ' CALL addrg
' C_s6k43e_696dde38_fornum_L000607_608 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43g_696dde38_forlist_L000613 ' <symbol:forlist>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r19, #5 ' reg <- coni
 mov r22, r17
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_s6k43e_696dde38_fornum_L000607_609_L000610
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_s6k43e_696dde38_fornum_L000607_609_L000610
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_s6k43e_696dde38_fornum_L000607_609_L000610
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_s6k43e_696dde38_fornum_L000607_609_L000610
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k43g_696dde38_forlist_L000613_616 ' JUMPV addrg
C_s6k43g_696dde38_forlist_L000613_615
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 adds r19, #1 ' ADDI4 coni
C_s6k43g_696dde38_forlist_L000613_616
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k43g_696dde38_forlist_L000613_615 ' NEI4
 mov r2, #267 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42c_696dde38_explist_L000378
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, #4 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k416_696dde38_adjust_assign_L000180
 add SP, #12 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k413_696dde38_marktobeclosed_L000161 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__checkstack
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r19
 subs r3, #4 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-24)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-28)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s6k43b_696dde38_forbody_L000599
 add SP, #16 ' CALL addrg
' C_s6k43g_696dde38_forlist_L000613_614 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43h_696dde38_forstat_L000618 ' <symbol:forstat>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 mov r22, #61 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_s6k43h_696dde38_forstat_L000618_623 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_s6k43h_696dde38_forstat_L000618_628 ' GTI4
' C_s6k43h_696dde38_forstat_L000618_627 ' (symbol refcount = 0)
 cmps r17,  #44 wz
 jmp #BR_Z
 long @C_s6k43h_696dde38_forstat_L000618_624 ' EQI4
 jmp #JMPA
 long @C_s6k43h_696dde38_forstat_L000618_620 ' JUMPV addrg
C_s6k43h_696dde38_forstat_L000618_628
 cmps r17,  #267 wz
 jmp #BR_Z
 long @C_s6k43h_696dde38_forstat_L000618_624 ' EQI4
 jmp #JMPA
 long @C_s6k43h_696dde38_forstat_L000618_620 ' JUMPV addrg
C_s6k43h_696dde38_forstat_L000618_623
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43e_696dde38_fornum_L000607
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k43h_696dde38_forstat_L000618_621 ' JUMPV addrg
C_s6k43h_696dde38_forstat_L000618_624
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43g_696dde38_forlist_L000613
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k43h_696dde38_forstat_L000618_621 ' JUMPV addrg
C_s6k43h_696dde38_forstat_L000618_620
 jmp #LODL
 long @C_s6k43h_696dde38_forstat_L000618_625_L000626
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k43h_696dde38_forstat_L000618_621
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #263 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
' C_s6k43h_696dde38_forstat_L000618_619 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43j_696dde38_test_then_block_L000629 ' <symbol:test_then_block>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41_696dde38_expr_L000023
 add SP, #4 ' CALL addrg
 mov r2, #274 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #257 wz
 jmp #BRNZ
 long @C_s6k43j_696dde38_test_then_block_L000629_631 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__goiffalse
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long @C_s6k41i_696dde38_undefgoto_L000245_249_L000250
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-44)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41d_696dde38_newgotoentry_L000217
 add SP, #12 ' CALL addrg
C_s6k43j_696dde38_test_then_block_L000629_634
' C_s6k43j_696dde38_test_then_block_L000629_635 ' (symbol refcount = 0)
 mov r2, #59 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k43j_696dde38_test_then_block_L000629_634 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41s_696dde38_block_follow_L000286
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k43j_696dde38_test_then_block_L000629_637 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
 jmp #JMPA
 long @C_s6k43j_696dde38_test_then_block_L000629_630 ' JUMPV addrg
C_s6k43j_696dde38_test_then_block_L000629_637
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s6k43j_696dde38_test_then_block_L000629_632 ' JUMPV addrg
C_s6k43j_696dde38_test_then_block_L000629_631
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__goiftrue
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41h_696dde38_enterblock_L000240
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s6k43j_696dde38_test_then_block_L000629_632
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41t_696dde38_statlist_L000295 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41m_696dde38_leaveblock_L000255 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #259 wz
 jmp #BR_Z
 long @C_s6k43j_696dde38_test_then_block_L000629_642 ' EQI4
 cmps r22,  #260 wz
 jmp #BRNZ
 long @C_s6k43j_696dde38_test_then_block_L000629_640 ' NEI4
C_s6k43j_696dde38_test_then_block_L000629_642
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
C_s6k43j_696dde38_test_then_block_L000629_640
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
C_s6k43j_696dde38_test_then_block_L000629_630
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43k_696dde38_ifstat_L000643 ' <symbol:ifstat>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43j_696dde38_test_then_block_L000629
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k43k_696dde38_ifstat_L000643_646 ' JUMPV addrg
C_s6k43k_696dde38_ifstat_L000643_645
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43j_696dde38_test_then_block_L000629
 add SP, #4 ' CALL addrg
C_s6k43k_696dde38_ifstat_L000643_646
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #260 wz
 jmp #BR_Z
 long @C_s6k43k_696dde38_ifstat_L000643_645 ' EQI4
 mov r2, #259 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k43k_696dde38_ifstat_L000643_648 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k42s_696dde38_block_L000517 ' CALL addrg
C_s6k43k_696dde38_ifstat_L000643_648
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #266 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
' C_s6k43k_696dde38_ifstat_L000643_644 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43l_696dde38_localfunc_L000650 ' <symbol:localfunc>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, #0 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42a_696dde38_body_L000372
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4n_696dde38_localdebuginfo_L000090
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_s6k43l_696dde38_localfunc_L000650_651 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43m_696dde38_getlocalattribute_L000652 ' <symbol:getlocalattribute>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #60 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k43m_696dde38_getlocalattribute_L000652_654 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov r22, r0
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #62 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4b_696dde38_checknext_L000051
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_s6k43m_696dde38_getlocalattribute_L000652_658_L000659
 mov r2, RI ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k43m_696dde38_getlocalattribute_L000652_656 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s6k43m_696dde38_getlocalattribute_L000652_653 ' JUMPV addrg
C_s6k43m_696dde38_getlocalattribute_L000652_656
 jmp #LODL
 long @C_s6k43m_696dde38_getlocalattribute_L000652_662_L000663
 mov r2, RI ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k43m_696dde38_getlocalattribute_L000652_660 ' NEI4
 mov r0, #2 ' reg <- coni
 jmp #JMPA
 long @C_s6k43m_696dde38_getlocalattribute_L000652_653 ' JUMPV addrg
C_s6k43m_696dde38_getlocalattribute_L000652_660
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_s6k43m_696dde38_getlocalattribute_L000652_664_L000665
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
C_s6k43m_696dde38_getlocalattribute_L000652_654
 mov r0, #0 ' reg <- coni
C_s6k43m_696dde38_getlocalattribute_L000652_653
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43q_696dde38_checktoclose_L000666 ' <symbol:checktoclose>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BR_Z
 long @C_s6k43q_696dde38_checktoclose_L000666_668 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k413_696dde38_marktobeclosed_L000161 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4m_696dde38_reglevel_L000082
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r20 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #55
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
C_s6k43q_696dde38_checktoclose_L000666_668
' C_s6k43q_696dde38_checktoclose_L000666_667 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s6k43r_696dde38_localstat_L000670 ' <symbol:localstat>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -1
 mov r13, RI ' reg <- con
 mov r15, #0 ' reg <- coni
C_s6k43r_696dde38_localstat_L000670_672
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4k_696dde38_new_localvar_L000078
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k43m_696dde38_getlocalattribute_L000652 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #5 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 cmps r21,  #2 wz
 jmp #BRNZ
 long @C_s6k43r_696dde38_localstat_L000670_675 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_s6k43r_696dde38_localstat_L000670_677 ' EQI4
 jmp #LODL
 long @C_s6k43r_696dde38_localstat_L000670_679_L000680
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
C_s6k43r_696dde38_localstat_L000670_677
 mov r22, r17
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r13, r22 ' ADDI/P
 adds r13, r15 ' ADDI/P (3)
C_s6k43r_696dde38_localstat_L000670_675
 adds r15, #1 ' ADDI4 coni
' C_s6k43r_696dde38_localstat_L000670_673 ' (symbol refcount = 0)
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k43r_696dde38_localstat_L000670_672 ' NEI4
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k43r_696dde38_localstat_L000670_681 ' EQI4
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42c_696dde38_explist_L000378
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s6k43r_696dde38_localstat_L000670_682 ' JUMPV addrg
C_s6k43r_696dde38_localstat_L000670_681
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s6k43r_696dde38_localstat_L000670_682
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4l_696dde38_getlocalvardesc_L000080
 add SP, #4 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_s6k43r_696dde38_localstat_L000670_683 ' NEI4
 mov r22, r11
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_s6k43r_696dde38_localstat_L000670_683 ' NEI4
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2const
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k43r_696dde38_localstat_L000670_683 ' EQI4
 mov r22, r11
 adds r22, #5 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r15
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #50 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_s6k43r_696dde38_localstat_L000670_684 ' JUMPV addrg
C_s6k43r_696dde38_localstat_L000670_683
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k416_696dde38_adjust_assign_L000180
 add SP, #12 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4r_696dde38_adjustlocalvars_L000112
 add SP, #4 ' CALL addrg
C_s6k43r_696dde38_localstat_L000670_684
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43q_696dde38_checktoclose_L000666
 add SP, #4 ' CALL addrg
' C_s6k43r_696dde38_localstat_L000670_671 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43t_696dde38_funcname_L000685 ' <symbol:funcname>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k415_696dde38_singlevar_L000176
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k43t_696dde38_funcname_L000685_688 ' JUMPV addrg
C_s6k43t_696dde38_funcname_L000685_687
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41u_696dde38_fieldsel_L000302
 add SP, #4 ' CALL addrg
C_s6k43t_696dde38_funcname_L000685_688
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #46 wz
 jmp #BR_Z
 long @C_s6k43t_696dde38_funcname_L000685_687 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #58 wz
 jmp #BRNZ
 long @C_s6k43t_696dde38_funcname_L000685_690 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41u_696dde38_fieldsel_L000302
 add SP, #4 ' CALL addrg
C_s6k43t_696dde38_funcname_L000685_690
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_s6k43t_696dde38_funcname_L000685_686 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43u_696dde38_funcstat_L000692 ' <symbol:funcstat>
 jmp #NEWF
 sub SP, #36
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43t_696dde38_funcname_L000685
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42a_696dde38_body_L000372
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4p_696dde38_check_readonly_L000096
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__storevar
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
' C_s6k43u_696dde38_funcstat_L000692_693 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #36 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k43v_696dde38_exprstat_L000694 ' <symbol:exprstat>
 jmp #NEWF
 sub SP, #28
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42h_696dde38_suffixedexp_L000415
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #61 wz
 jmp #BR_Z
 long @C_s6k43v_696dde38_exprstat_L000694_699 ' EQI4
 cmps r22,  #44 wz
 jmp #BRNZ
 long @C_s6k43v_696dde38_exprstat_L000694_697 ' NEI4
C_s6k43v_696dde38_exprstat_L000694_699
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42u_696dde38_restassign_L000539
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k43v_696dde38_exprstat_L000694_698 ' JUMPV addrg
C_s6k43v_696dde38_exprstat_L000694_697
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_s6k43v_696dde38_exprstat_L000694_700 ' EQI4
 jmp #LODL
 long @C_s6k42u_696dde38_restassign_L000539_544_L000545
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s6k43v_696dde38_exprstat_L000694_700
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 jmp #LODL
 long $1000000
 mov r18, RI ' reg <- con
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_s6k43v_696dde38_exprstat_L000694_698
' C_s6k43v_696dde38_exprstat_L000694_695 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #28 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k440_696dde38_retstat_L000705 ' <symbol:retstat>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41s_696dde38_block_follow_L000286
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s6k440_696dde38_retstat_L000705_709 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #59 wz
 jmp #BRNZ
 long @C_s6k440_696dde38_retstat_L000705_707 ' NEI4
C_s6k440_696dde38_retstat_L000705_709
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s6k440_696dde38_retstat_L000705_708 ' JUMPV addrg
C_s6k440_696dde38_retstat_L000705_707
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k42c_696dde38_explist_L000378
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_s6k440_696dde38_retstat_L000705_712 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s6k440_696dde38_retstat_L000705_710 ' NEI4
C_s6k440_696dde38_retstat_L000705_712
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setreturns
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #18 wz
 jmp #BRNZ
 long @C_s6k440_696dde38_retstat_L000705_713 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_s6k440_696dde38_retstat_L000705_713 ' NEI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #15 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s6k440_696dde38_retstat_L000705_713 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #2 ' LSHI4 coni
 adds r20, r22 ' ADDI/P (1)
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 shl r18, #2 ' LSHI4 coni
 adds r22, r18 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff80
 mov r18, RI ' reg <- con
 and r22, r18 ' BANDI/U (1)
 or r22, #69 ' BORU4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_s6k440_696dde38_retstat_L000705_713
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s6k440_696dde38_retstat_L000705_711 ' JUMPV addrg
C_s6k440_696dde38_retstat_L000705_710
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_s6k440_696dde38_retstat_L000705_717 ' NEI4
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s6k440_696dde38_retstat_L000705_718 ' JUMPV addrg
C_s6k440_696dde38_retstat_L000705_717
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
C_s6k440_696dde38_retstat_L000705_718
C_s6k440_696dde38_retstat_L000705_711
C_s6k440_696dde38_retstat_L000705_708
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-28)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__ret
 add SP, #8 ' CALL addrg
 mov r2, #59 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
' C_s6k440_696dde38_retstat_L000705_706 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k4_696dde38_statement_L000022 ' <symbol:statement>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaE__incC_stack ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRI4 reg
 cmps r21,  #257 wz,wc
 jmp #BR_B
 long @C_s6k4_696dde38_statement_L000022_737 ' LTI4
 cmps r21,  #273 wz,wc
 jmp #BR_A
 long @C_s6k4_696dde38_statement_L000022_738 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s6k4_696dde38_statement_L000022_739_L000741-1028
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s6k4_696dde38_statement_L000022_739_L000741 ' <symbol:739>
 long @C_s6k4_696dde38_statement_L000022_735
 long @C_s6k4_696dde38_statement_L000022_726
 long @C_s6k4_696dde38_statement_L000022_720
 long @C_s6k4_696dde38_statement_L000022_720
 long @C_s6k4_696dde38_statement_L000022_720
 long @C_s6k4_696dde38_statement_L000022_720
 long @C_s6k4_696dde38_statement_L000022_727
 long @C_s6k4_696dde38_statement_L000022_729
 long @C_s6k4_696dde38_statement_L000022_736
 long @C_s6k4_696dde38_statement_L000022_724
 long @C_s6k4_696dde38_statement_L000022_720
 long @C_s6k4_696dde38_statement_L000022_730
 long @C_s6k4_696dde38_statement_L000022_720
 long @C_s6k4_696dde38_statement_L000022_720
 long @C_s6k4_696dde38_statement_L000022_720
 long @C_s6k4_696dde38_statement_L000022_728
 long @C_s6k4_696dde38_statement_L000022_734

' Catalina Code

DAT ' code segment
C_s6k4_696dde38_statement_L000022_737
 cmps r21,  #59 wz
 jmp #BR_Z
 long @C_s6k4_696dde38_statement_L000022_723 ' EQI4
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_720 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_738
 mov r22, #277 ' reg <- coni
 cmps r21, r22 wz
 jmp #BR_Z
 long @C_s6k4_696dde38_statement_L000022_725 ' EQI4
 cmps r21, r22 wz,wc
 jmp #BR_B
 long @C_s6k4_696dde38_statement_L000022_720 ' LTI4
' C_s6k4_696dde38_statement_L000022_743 ' (symbol refcount = 0)
 cmps r21,  #287 wz
 jmp #BR_Z
 long @C_s6k4_696dde38_statement_L000022_733 ' EQI4
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_720 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_723
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_724
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43k_696dde38_ifstat_L000643
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_725
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k436_696dde38_whilestat_L000581
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_726
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k42s_696dde38_block_L000517 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #258 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4c_696dde38_check_match_L000053
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_727
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43h_696dde38_forstat_L000618
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_728
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k437_696dde38_repeatstat_L000583
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_729
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k43u_696dde38_funcstat_L000692
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_730
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, #264 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k49_696dde38_testnext_L000043
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s6k4_696dde38_statement_L000022_731 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k43l_696dde38_localfunc_L000650 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_731
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k43r_696dde38_localstat_L000670 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_733
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4e_696dde38_str_checkname_L000061 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k435_696dde38_labelstat_L000576
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_734
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k440_696dde38_retstat_L000705 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_735
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k432_696dde38_breakstat_L000568 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_736
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k431_696dde38_gotostat_L000562 ' CALL addrg
 jmp #JMPA
 long @C_s6k4_696dde38_statement_L000022_721 ' JUMPV addrg
C_s6k4_696dde38_statement_L000022_720
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k43v_696dde38_exprstat_L000694 ' CALL addrg
C_s6k4_696dde38_statement_L000022_721
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 adds r22, #52 ' ADDP4 coni
 mov r20, r0 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s6k4_696dde38_statement_L000022_719 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s6k443_696dde38_mainfunc_L000744 ' <symbol:mainfunc>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k41q_696dde38_open_func_L000278
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k427_696dde38_setvararg_L000352
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k4u_696dde38_allocupvalue_L000133 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k443_696dde38_mainfunc_L000744_747 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s6k443_696dde38_mainfunc_L000744_747 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov RI, r21
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s6k443_696dde38_mainfunc_L000744_747 ' JUMPV addrg
C_s6k443_696dde38_mainfunc_L000744_747
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41t_696dde38_statlist_L000295 ' CALL addrg
 mov r2, #288 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k4a_696dde38_check_L000047
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s6k41r_696dde38_close_func_L000282 ' CALL addrg
' C_s6k443_696dde38_mainfunc_L000744_745 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export luaY_parser

 alignl ' align long
C_luaY__parser ' <symbol:luaY_parser>
 jmp #NEWF
 sub SP, #120
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__newL_closure
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-124)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r13
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #70 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaD__inctop ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__new ' CALL addrg
 mov RI, FP
 sub RI, #-(-76)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r13
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaD__inctop ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaF__newproto ' CALL addrg
 mov r20, r15
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-60)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r20, r15
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaY__parser_752 ' EQI4
 mov r20, r15
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaY__parser_752 ' EQI4
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaY__parser_752 ' JUMPV addrg
C_luaY__parser_752
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-60) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #76 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #5 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaY__parser_754 ' EQI4
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaY__parser_754 ' EQI4
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #76 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaY__parser_754 ' JUMPV addrg
C_luaY__parser_754
 mov RI, FP
 sub RI, #-(-80)
 wrlong r23, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-72)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, FP
 sub r5, #-(-120) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaX__setinput
 add SP, #16 ' CALL addrg
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-120) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6k443_696dde38_mainfunc_L000744
 add SP, #4 ' CALL addrg
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
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaY__parser_748 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #120 ' framesize
 jmp #RETF


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
C_s6k43r_696dde38_localstat_L000670_679_L000680 ' <symbol:679>
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
C_s6k43m_696dde38_getlocalattribute_L000652_664_L000665 ' <symbol:664>
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
C_s6k43m_696dde38_getlocalattribute_L000652_662_L000663 ' <symbol:662>
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_s6k43m_696dde38_getlocalattribute_L000652_658_L000659 ' <symbol:658>
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_s6k43h_696dde38_forstat_L000618_625_L000626 ' <symbol:625>
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
C_s6k43e_696dde38_fornum_L000607_609_L000610 ' <symbol:609>
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
C_s6k439_696dde38_fixforjump_L000591_597_L000598 ' <symbol:597>
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
C_s6k433_696dde38_checkrepeated_L000570_574_L000575 ' <symbol:574>
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
C_s6k42u_696dde38_restassign_L000539_544_L000545 ' <symbol:544>
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
C_s6k42i_696dde38_simpleexp_L000433_447_L000448 ' <symbol:447>
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
C_s6k42f_696dde38_primaryexp_L000405_412_L000413 ' <symbol:412>
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
C_s6k42d_696dde38_funcargs_L000383_396_L000397 ' <symbol:396>
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
C_s6k42a_696dde38_body_L000372_376_L000377 ' <symbol:376>
 byte 115
 byte 101
 byte 108
 byte 102
 byte 0

 alignl ' align long
C_s6k428_696dde38_parlist_L000354_366_L000367 ' <symbol:366>
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
C_s6k420_696dde38_recfield_L000306_310_L000311 ' <symbol:310>
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
C_s6k41n_696dde38_addprototype_L000265_269_L000270 ' <symbol:269>
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
C_s6k41i_696dde38_undefgoto_L000245_253_L000254 ' <symbol:253>
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
C_s6k41i_696dde38_undefgoto_L000245_251_L000252 ' <symbol:251>
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
C_s6k41i_696dde38_undefgoto_L000245_249_L000250 ' <symbol:249>
 byte 98
 byte 114
 byte 101
 byte 97
 byte 107
 byte 0

 alignl ' align long
C_s6k41b_696dde38_newlabelentry_L000213_215_L000216 ' <symbol:215>
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
C_s6k417_696dde38_jumpscopeerror_L000193_195_L000196 ' <symbol:195>
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
C_s6k4u_696dde38_allocupvalue_L000133_135_L000136 ' <symbol:135>
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
C_s6k4p_696dde38_check_readonly_L000096_110_L000111 ' <symbol:110>
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
C_s6k4i_696dde38_registerlocalvar_L000069_71_L000072 ' <symbol:71>
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
C_s6k4c_696dde38_check_match_L000053_59_L000060 ' <symbol:59>
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
C_s6k44_696dde38_errorlimit_L000028_37_L000038 ' <symbol:37>
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
C_s6k44_696dde38_errorlimit_L000028_32_L000033 ' <symbol:32>
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
C_s6k44_696dde38_errorlimit_L000028_30_L000031 ' <symbol:30>
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
C_s6k42_696dde38_error_expected_L000024_26_L000027 ' <symbol:26>
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
