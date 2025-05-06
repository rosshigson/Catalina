' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sg1g2_67ea404e_error_expected_L000022 ' <symbol:error_expected>
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
 long @C_sg1g2_67ea404e_error_expected_L000022_24_L000025
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
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
' C_sg1g2_67ea404e_error_expected_L000022_23 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g4_67ea404e_errorlimit_L000026 ' <symbol:errorlimit>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $eaa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #40 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_sg1g4_67ea404e_errorlimit_L000026_33 ' NEI4
 jmp #LODL
 long @C_sg1g4_67ea404e_errorlimit_L000026_28_L000029
 mov r13, RI ' reg <- addrg
 jmp #JMPA
 long @C_sg1g4_67ea404e_errorlimit_L000026_34 ' JUMPV addrg
C_sg1g4_67ea404e_errorlimit_L000026_33
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sg1g4_67ea404e_errorlimit_L000026_30_L000031
 mov r3, RI ' reg ARG ADDRG
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_sg1g4_67ea404e_errorlimit_L000026_34
 jmp #LODF
 long -12
 wrlong r13, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sg1g4_67ea404e_errorlimit_L000026_35_L000036
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #16 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
' C_sg1g4_67ea404e_errorlimit_L000026_27 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g8_67ea404e_checklimit_L000037 ' <symbol:checklimit>
 jmp #NEWF
 jmp #PSHM
 long $aa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21, r19 wz,wc
 jmp #BRBE
 long @C_sg1g8_67ea404e_checklimit_L000037_39 ' LEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g4_67ea404e_errorlimit_L000026
 add SP, #8 ' CALL addrg
C_sg1g8_67ea404e_checklimit_L000037_39
' C_sg1g8_67ea404e_checklimit_L000037_38 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g9_67ea404e_testnext_L000041 ' <symbol:testnext>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_sg1g9_67ea404e_testnext_L000041_43 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg1g9_67ea404e_testnext_L000041_42 ' JUMPV addrg
C_sg1g9_67ea404e_testnext_L000041_43
 mov r0, #0 ' RET coni
C_sg1g9_67ea404e_testnext_L000041_42
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1ga_67ea404e_check_L000045 ' <symbol:check>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BR_Z
 long @C_sg1ga_67ea404e_check_L000045_47 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2_67ea404e_error_expected_L000022
 add SP, #4 ' CALL addrg
C_sg1ga_67ea404e_check_L000045_47
' C_sg1ga_67ea404e_check_L000045_46 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1gb_67ea404e_checknext_L000049 ' <symbol:checknext>
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
 long @C_sg1ga_67ea404e_check_L000045
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
' C_sg1gb_67ea404e_checknext_L000049_50 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1gc_67ea404e_check_match_L000051 ' <symbol:check_match>
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
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg1gc_67ea404e_check_match_L000051_53 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r17, r22 wz
 jmp #BRNZ
 long @C_sg1gc_67ea404e_check_match_L000051_55 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2_67ea404e_error_expected_L000022
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1gc_67ea404e_check_match_L000051_56 ' JUMPV addrg
C_sg1gc_67ea404e_check_match_L000051_55
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
 long @C_sg1gc_67ea404e_check_match_L000051_57_L000058
 mov r5, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
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
C_sg1gc_67ea404e_check_match_L000051_56
C_sg1gc_67ea404e_check_match_L000051_53
' C_sg1gc_67ea404e_check_match_L000051_52 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1ge_67ea404e_str_checkname_L000059 ' <symbol:str_checkname>
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
 long @C_sg1ga_67ea404e_check_L000045
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_sg1ge_67ea404e_str_checkname_L000059_60 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1gf_67ea404e_init_exp_L000061 ' <symbol:init_exp>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r20, r4
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r20, r4
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 wrlong r3, r4 ' ASGNI4 reg reg
 mov r22, r4
 adds r22, #4 ' ADDP4 coni
 wrlong r2, r22 ' ASGNI4 reg reg
' C_sg1gf_67ea404e_init_exp_L000061_62 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1gg_67ea404e_codestring_L000063 ' <symbol:codestring>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r20, r3
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, #7 ' reg <- coni
 wrlong r22, r3 ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
' C_sg1gg_67ea404e_codestring_L000063_64 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1gh_67ea404e_codename_L000065 ' <symbol:codename>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gg_67ea404e_codestring_L000063
 add SP, #4 ' CALL addrg
' C_sg1gh_67ea404e_codename_L000065_66 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1gi_67ea404e_registerlocalvar_L000067 ' <symbol:registerlocalvar>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r17, r21 ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_sg1gi_67ea404e_registerlocalvar_L000067_69_L000070
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 32767
 mov r3, RI ' reg ARG con
 mov r4, #12 ' reg ARG coni
 mov r5, r17
 adds r5, #32 ' ADDP4 coni
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sg1gi_67ea404e_registerlocalvar_L000067_72 ' JUMPV addrg
C_sg1gi_67ea404e_registerlocalvar_L000067_71
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r20, #12 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C_sg1gi_67ea404e_registerlocalvar_L000067_72
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_sg1gi_67ea404e_registerlocalvar_L000067_71 ' LTI4
 mov r22, #12 ' reg <- coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 rdword r20, r20 ' reg <- INDIRI2 reg
 shl r20, #16
 sar r20, #16 ' sign extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, #12 ' reg <- coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 rdword r20, r20 ' reg <- INDIRI2 reg
 shl r20, #16
 sar r20, #16 ' sign extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1gi_67ea404e_registerlocalvar_L000067_75 ' EQI4
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1gi_67ea404e_registerlocalvar_L000067_75 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1gi_67ea404e_registerlocalvar_L000067_75 ' JUMPV addrg
C_sg1gi_67ea404e_registerlocalvar_L000067_75
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 rdword r20, r22 ' reg <- INDIRI2 reg
 mov r18, r20 ' CVII
 mov r18, r20 ' CVII
 shl r18, #16
 sar r18, #16 ' sign extend
 adds r18, #1 ' ADDI4 coni
 wrword r18, r22 ' ASGNI2 reg reg
 mov r0, r20 ' CVII
 mov r0, r20 ' CVII
 shl r0, #16
 sar r0, #16 ' sign extend
' C_sg1gi_67ea404e_registerlocalvar_L000067_68 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1gk_67ea404e_new_localvar_L000076 ' <symbol:new_localvar>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_sg1gi_67ea404e_registerlocalvar_L000067_69_L000070
 mov r2, RI ' reg ARG ADDRG
 mov r3, #200 ' reg ARG coni
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov r20, r17
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r4, r22 ' SUBI/P
 subs r4, r20 ' SUBI/P (3)
 mov r5, r17 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g8_67ea404e_checklimit_L000037
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_sg1gi_67ea404e_registerlocalvar_L000067_69_L000070
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 65535
 mov r3, RI ' reg ARG con
 mov r4, #16 ' reg ARG coni
 mov r5, r19
 adds r5, #8 ' ADDP4 coni
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 rdlong r22, r19 ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r19 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 wrlong r18, r22 ' ASGNI4 reg reg
 mov r22, r20
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r19 ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov r20, r17
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
' C_sg1gk_67ea404e_new_localvar_L000076_77 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1gl_67ea404e_getlocalvardesc_L000078 ' <symbol:getlocalvardesc>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r2 ' ADDI/P (1)
 shl r22, #4 ' LSHI4 coni
 mov r20, r3
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_sg1gl_67ea404e_getlocalvardesc_L000078_79 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1gm_67ea404e_reglevel_L000080 ' <symbol:reglevel>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sg1gm_67ea404e_reglevel_L000080_83 ' JUMPV addrg
C_sg1gm_67ea404e_reglevel_L000080_82
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BR_Z
 long @C_sg1gm_67ea404e_reglevel_L000080_85 ' EQI4
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_sg1gm_67ea404e_reglevel_L000080_81 ' JUMPV addrg
C_sg1gm_67ea404e_reglevel_L000080_85
C_sg1gm_67ea404e_reglevel_L000080_83
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 subs r21, #1 ' SUBI4 coni
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_sg1gm_67ea404e_reglevel_L000080_82 ' GTI4
 mov r0, #0 ' RET coni
C_sg1gm_67ea404e_reglevel_L000080_81
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
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gm_67ea404e_reglevel_L000080
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaY__nvarstack_87 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1gn_67ea404e_localdebuginfo_L000088 ' <symbol:localdebuginfo>
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
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sg1gn_67ea404e_localdebuginfo_L000088_90 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sg1gn_67ea404e_localdebuginfo_L000088_89 ' JUMPV addrg
C_sg1gn_67ea404e_localdebuginfo_L000088_90
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #12 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r0, r22 ' ADDI/P (1)
C_sg1gn_67ea404e_localdebuginfo_L000088_89
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1go_67ea404e_init_var_L000092 ' <symbol:init_var>
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
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, #9 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 wrword r20, r22 ' ASGNU2 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov r22, r0
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r20 ' ASGNU1 reg reg
' C_sg1go_67ea404e_init_var_L000092_93 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1gp_67ea404e_check_readonly_L000094 ' <symbol:check_readonly>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 rdlong r19, r21 ' reg <- INDIRI4 reg
 cmps r19,  #9 wz
 jmp #BR_Z
 long @C_sg1gp_67ea404e_check_readonly_L000094_100 ' EQI4
 cmps r19,  #10 wz
 jmp #BR_Z
 long @C_sg1gp_67ea404e_check_readonly_L000094_103 ' EQI4
 cmps r19,  #11 wz
 jmp #BR_Z
 long @C_sg1gp_67ea404e_check_readonly_L000094_99 ' EQI4
 jmp #JMPA
 long @C_sg1gp_67ea404e_check_readonly_L000094_95 ' JUMPV addrg
C_sg1gp_67ea404e_check_readonly_L000094_99
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_sg1gp_67ea404e_check_readonly_L000094_97 ' JUMPV addrg
C_sg1gp_67ea404e_check_readonly_L000094_100
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg1gp_67ea404e_check_readonly_L000094_97 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_sg1gp_67ea404e_check_readonly_L000094_97 ' JUMPV addrg
C_sg1gp_67ea404e_check_readonly_L000094_103
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #60 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg1gp_67ea404e_check_readonly_L000094_97 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
C_sg1gp_67ea404e_check_readonly_L000094_97
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sg1gp_67ea404e_check_readonly_L000094_106 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #16 ' ADDP4 coni
 jmp #LODL
 long @C_sg1gp_67ea404e_check_readonly_L000094_108_L000109
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
C_sg1gp_67ea404e_check_readonly_L000094_106
C_sg1gp_67ea404e_check_readonly_L000094_95
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1gr_67ea404e_adjustlocalvars_L000110 ' <symbol:adjustlocalvars>
 jmp #NEWF
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110_115 ' JUMPV addrg
C_sg1gr_67ea404e_adjustlocalvars_L000110_112
 mov r22, r19
 adds r22, #50 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 mov r18, r20 ' CVUI
 and r18, cviu_m1 ' zero extend
 adds r18, #1 ' ADDI4 coni
 wrbyte r18, r22 ' ASGNU1 reg reg
 mov r11, r20 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r20, r13
 adds r20, #6 ' ADDP4 coni
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gi_67ea404e_registerlocalvar_L000067
 add SP, #8 ' CALL addrg
 mov r20, r13
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNI2 reg reg
' C_sg1gr_67ea404e_adjustlocalvars_L000110_113 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sg1gr_67ea404e_adjustlocalvars_L000110_115
 cmps r17, r21 wz,wc
 jmp #BR_B
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110_112 ' LTI4
' C_sg1gr_67ea404e_adjustlocalvars_L000110_111 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1gs_67ea404e_removevars_L000116 ' <symbol:removevars>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r23
 adds r18, #50 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 subs r18, r21 ' SUBI/P (1)
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sg1gs_67ea404e_removevars_L000116_119 ' JUMPV addrg
C_sg1gs_67ea404e_removevars_L000116_118
 mov r22, r23
 adds r22, #50 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gn_67ea404e_localdebuginfo_L000088
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sg1gs_67ea404e_removevars_L000116_121 ' EQU4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
C_sg1gs_67ea404e_removevars_L000116_121
C_sg1gs_67ea404e_removevars_L000116_119
 mov r22, r23
 adds r22, #50 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r21 wz,wc
 jmp #BR_A
 long @C_sg1gs_67ea404e_removevars_L000116_118 ' GTI4
' C_sg1gs_67ea404e_removevars_L000116_117 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1gt_67ea404e_searchupvalue_L000123 ' <symbol:searchupvalue>
 jmp #PSHM
 long $f00000 ' save registers
 rdlong r22, r3 ' reg <- INDIRP4 reg
 adds r22, #60 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_sg1gt_67ea404e_searchupvalue_L000123_128 ' JUMPV addrg
C_sg1gt_67ea404e_searchupvalue_L000123_125
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sg1gt_67ea404e_searchupvalue_L000123_129 ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sg1gt_67ea404e_searchupvalue_L000123_124 ' JUMPV addrg
C_sg1gt_67ea404e_searchupvalue_L000123_129
' C_sg1gt_67ea404e_searchupvalue_L000123_126 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_sg1gt_67ea404e_searchupvalue_L000123_128
 mov r22, r3
 adds r22, #51 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r23, r22 wz,wc
 jmp #BR_B
 long @C_sg1gt_67ea404e_searchupvalue_L000123_125 ' LTI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_sg1gt_67ea404e_searchupvalue_L000123_124
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1gu_67ea404e_allocupvalue_L000131 ' <symbol:allocupvalue>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r21, r23 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_sg1gu_67ea404e_allocupvalue_L000131_133_L000134
 mov r2, RI ' reg ARG ADDRG
 mov r3, #255 ' reg ARG coni
 mov r22, r23
 adds r22, #51 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r4, r22
 adds r4, #1 ' ADDI4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g8_67ea404e_checklimit_L000037
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_sg1gu_67ea404e_allocupvalue_L000131_133_L000134
 mov r2, RI ' reg ARG ADDRG
 mov r3, #255 ' reg ARG coni
 mov r22, #8 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21
 adds r5, #12 ' ADDP4 coni
 mov r22, r23
 adds r22, #51 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, r21
 adds r22, #60 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sg1gu_67ea404e_allocupvalue_L000131_136 ' JUMPV addrg
C_sg1gu_67ea404e_allocupvalue_L000131_135
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C_sg1gu_67ea404e_allocupvalue_L000131_136
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sg1gu_67ea404e_allocupvalue_L000131_135 ' LTI4
 mov r22, r23
 adds r22, #51 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 mov r18, r20 ' CVUI
 and r18, cviu_m1 ' zero extend
 adds r18, #1 ' ADDI4 coni
 wrbyte r18, r22 ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_sg1gu_67ea404e_allocupvalue_L000131_132 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g10_67ea404e_newupvalue_L000138 ' <symbol:newupvalue>
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
 long @C_sg1gu_67ea404e_allocupvalue_L000131 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_sg1g10_67ea404e_newupvalue_L000138_140 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 mov r20, r17
 adds r20, #6 ' ADDP4 coni
 mov r22, r0
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r20 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sg1g10_67ea404e_newupvalue_L000138_141 ' JUMPV addrg
C_sg1g10_67ea404e_newupvalue_L000138_140
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #6 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #60 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #6 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sg1g10_67ea404e_newupvalue_L000138_141
 wrlong r21, r17 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g10_67ea404e_newupvalue_L000138_143 ' EQI4
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g10_67ea404e_newupvalue_L000138_143 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g10_67ea404e_newupvalue_L000138_143 ' JUMPV addrg
C_sg1g10_67ea404e_newupvalue_L000138_143
 mov r22, r23
 adds r22, #51 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 subs r0, #1 ' SUBI4 coni
' C_sg1g10_67ea404e_newupvalue_L000138_139 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g11_67ea404e_searchvar_L000144 ' <symbol:searchvar>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #50 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22
 subs r17, #1 ' SUBI4 coni
 jmp #JMPA
 long @C_sg1g11_67ea404e_searchvar_L000144_149 ' JUMPV addrg
C_sg1g11_67ea404e_searchvar_L000144_146
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r15
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sg1g11_67ea404e_searchvar_L000144_150 ' NEU4
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sg1g11_67ea404e_searchvar_L000144_152 ' NEI4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' ADDI/P
 adds r2, r17 ' ADDI/P (3)
 mov r3, #11 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g11_67ea404e_searchvar_L000144_153 ' JUMPV addrg
C_sg1g11_67ea404e_searchvar_L000144_152
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1go_67ea404e_init_var_L000092
 add SP, #8 ' CALL addrg
C_sg1g11_67ea404e_searchvar_L000144_153
 rdlong r0, r19 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_sg1g11_67ea404e_searchvar_L000144_145 ' JUMPV addrg
C_sg1g11_67ea404e_searchvar_L000144_150
' C_sg1g11_67ea404e_searchvar_L000144_147 ' (symbol refcount = 0)
 subs r17, #1 ' SUBI4 coni
C_sg1g11_67ea404e_searchvar_L000144_149
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_sg1g11_67ea404e_searchvar_L000144_146 ' GEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C_sg1g11_67ea404e_searchvar_L000144_145
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g12_67ea404e_markupval_L000154 ' <symbol:markupval>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sg1g12_67ea404e_markupval_L000154_157 ' JUMPV addrg
C_sg1g12_67ea404e_markupval_L000154_156
 rdlong r23, r23 ' reg <- INDIRP4 reg
C_sg1g12_67ea404e_markupval_L000154_157
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r2 wz,wc
 jmp #BR_A
 long @C_sg1g12_67ea404e_markupval_L000154_156 ' GTI4
 mov r22, r23
 adds r22, #13 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #54 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sg1g12_67ea404e_markupval_L000154_155 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1g13_67ea404e_marktobeclosed_L000159 ' <symbol:marktobeclosed>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #13 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #15 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #54 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sg1g13_67ea404e_marktobeclosed_L000159_160 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1g14_67ea404e_singlevaraux_L000161 ' <symbol:singlevaraux>
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
 long @C_sg1g14_67ea404e_singlevaraux_L000161_163 ' NEU4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g14_67ea404e_singlevaraux_L000161_164 ' JUMPV addrg
C_sg1g14_67ea404e_singlevaraux_L000161_163
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g11_67ea404e_searchvar_L000144
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_sg1g14_67ea404e_singlevaraux_L000161_165 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_sg1g14_67ea404e_singlevaraux_L000161_166 ' NEI4
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_sg1g14_67ea404e_singlevaraux_L000161_166 ' NEI4
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m2 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g12_67ea404e_markupval_L000154
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g14_67ea404e_singlevaraux_L000161_166 ' JUMPV addrg
C_sg1g14_67ea404e_singlevaraux_L000161_165
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gt_67ea404e_searchupvalue_L000123
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_sg1g14_67ea404e_singlevaraux_L000161_169 ' GEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g14_67ea404e_singlevaraux_L000161
 add SP, #12 ' CALL addrg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BR_Z
 long @C_sg1g14_67ea404e_singlevaraux_L000161_173 ' EQI4
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_sg1g14_67ea404e_singlevaraux_L000161_162 ' NEI4
C_sg1g14_67ea404e_singlevaraux_L000161_173
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g10_67ea404e_newupvalue_L000138
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
' C_sg1g14_67ea404e_singlevaraux_L000161_172 ' (symbol refcount = 0)
C_sg1g14_67ea404e_singlevaraux_L000161_169
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #10 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
C_sg1g14_67ea404e_singlevaraux_L000161_166
C_sg1g14_67ea404e_singlevaraux_L000161_164
C_sg1g14_67ea404e_singlevaraux_L000161_162
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g15_67ea404e_singlevar_L000174 ' <symbol:singlevar>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g14_67ea404e_singlevaraux_L000161
 add SP, #12 ' CALL addrg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sg1g15_67ea404e_singlevar_L000174_176 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g14_67ea404e_singlevaraux_L000161
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gg_67ea404e_codestring_L000063
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
C_sg1g15_67ea404e_singlevar_L000174_176
' C_sg1g15_67ea404e_singlevar_L000174_175 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g16_67ea404e_adjust_assign_L000178 ' <symbol:adjust_assign>
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
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r15, r21 ' SUBI/P
 subs r15, r19 ' SUBI/P (3)
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_sg1g16_67ea404e_adjust_assign_L000178_182 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_sg1g16_67ea404e_adjust_assign_L000178_180 ' NEI4
C_sg1g16_67ea404e_adjust_assign_L000178_182
 mov r22, r15
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_sg1g16_67ea404e_adjust_assign_L000178_183 ' GEI4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_sg1g16_67ea404e_adjust_assign_L000178_183
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
 long @C_sg1g16_67ea404e_adjust_assign_L000178_181 ' JUMPV addrg
C_sg1g16_67ea404e_adjust_assign_L000178_180
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg1g16_67ea404e_adjust_assign_L000178_185 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
C_sg1g16_67ea404e_adjust_assign_L000178_185
 cmps r15,  #0 wz,wc
 jmp #BRBE
 long @C_sg1g16_67ea404e_adjust_assign_L000178_187 ' LEI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov r4, r13 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__nil
 add SP, #8 ' CALL addrg
C_sg1g16_67ea404e_adjust_assign_L000178_187
C_sg1g16_67ea404e_adjust_assign_L000178_181
 cmps r15,  #0 wz,wc
 jmp #BRBE
 long @C_sg1g16_67ea404e_adjust_assign_L000178_189 ' LEI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g16_67ea404e_adjust_assign_L000178_190 ' JUMPV addrg
C_sg1g16_67ea404e_adjust_assign_L000178_189
 mov r22, r13
 adds r22, #52 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 adds r20, r15 ' ADDI/P (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sg1g16_67ea404e_adjust_assign_L000178_190
' C_sg1g16_67ea404e_adjust_assign_L000178_179 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g17_67ea404e_jumpscopeerror_L000191 ' <symbol:jumpscopeerror>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long @C_sg1g17_67ea404e_jumpscopeerror_L000191_193_L000194
 mov r19, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r4, r22
 adds r4, #16 ' ADDP4 coni
 mov r5, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
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
' C_sg1g17_67ea404e_jumpscopeerror_L000191_192 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g19_67ea404e_solvegoto_L000195 ' <symbol:solvegoto>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r15, r22
 adds r15, #12 ' ADDP4 coni
 mov r22, r21
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r15 ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_sg1g19_67ea404e_solvegoto_L000195_197 ' GEI4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g17_67ea404e_jumpscopeerror_L000191
 add SP, #4 ' CALL addrg
C_sg1g19_67ea404e_solvegoto_L000195_197
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchlist
 add SP, #8 ' CALL addrg
 mov r17, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sg1g19_67ea404e_solvegoto_L000195_202 ' JUMPV addrg
C_sg1g19_67ea404e_solvegoto_L000195_199
 mov r22, r17
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r15 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 adds r22, #16 ' ADDI4 coni
 mov r1, r22 ' ADDI/P
 adds r1, r20 ' ADDI/P (3)
 jmp #CPYB
 long 16 ' ASGNB
' C_sg1g19_67ea404e_solvegoto_L000195_200 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sg1g19_67ea404e_solvegoto_L000195_202
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_sg1g19_67ea404e_solvegoto_L000195_199 ' LTI4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_sg1g19_67ea404e_solvegoto_L000195_196 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1a_67ea404e_findlabel_L000203 ' <symbol:findlabel>
 jmp #PSHM
 long $f80000 ' save registers
 mov r22, r3
 adds r22, #48 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r3
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_sg1g1a_67ea404e_findlabel_L000203_208 ' JUMPV addrg
C_sg1g1a_67ea404e_findlabel_L000203_205
 mov r22, r23
 shl r22, #4 ' LSHI4 coni
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r19, r22 ' ADDI/P
 adds r19, r20 ' ADDI/P (3)
 rdlong r22, r19 ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sg1g1a_67ea404e_findlabel_L000203_209 ' NEU4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sg1g1a_67ea404e_findlabel_L000203_204 ' JUMPV addrg
C_sg1g1a_67ea404e_findlabel_L000203_209
' C_sg1g1a_67ea404e_findlabel_L000203_206 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_sg1g1a_67ea404e_findlabel_L000203_208
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r23, r22 wz,wc
 jmp #BR_B
 long @C_sg1g1a_67ea404e_findlabel_L000203_205 ' LTI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sg1g1a_67ea404e_findlabel_L000203_204
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1g1b_67ea404e_newlabelentry_L000211 ' <symbol:newlabelentry>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_sg1g1b_67ea404e_newlabelentry_L000211_213_L000214
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
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r23 ' ASGNP4 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #50 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #13 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, r15
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_sg1g1b_67ea404e_newlabelentry_L000211_212 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1d_67ea404e_newgotoentry_L000215 ' <symbol:newgotoentry>
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
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r5, r22
 adds r5, #12 ' ADDP4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sg1g1b_67ea404e_newlabelentry_L000211
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sg1g1d_67ea404e_newgotoentry_L000215_216 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1e_67ea404e_solvegotos_L000217 ' <symbol:solvegotos>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #12 ' ADDP4 coni
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_sg1g1e_67ea404e_solvegotos_L000217_220 ' JUMPV addrg
C_sg1g1e_67ea404e_solvegotos_L000217_219
 mov r22, r19
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r21 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sg1g1e_67ea404e_solvegotos_L000217_222 ' NEU4
 mov r22, r19
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #13 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 or r15, r22 ' BORI/U (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g19_67ea404e_solvegoto_L000195
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g1e_67ea404e_solvegotos_L000217_223 ' JUMPV addrg
C_sg1g1e_67ea404e_solvegotos_L000217_222
 adds r19, #1 ' ADDI4 coni
C_sg1g1e_67ea404e_solvegotos_L000217_223
C_sg1g1e_67ea404e_solvegotos_L000217_220
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sg1g1e_67ea404e_solvegotos_L000217_219 ' LTI4
 mov r0, r15 ' CVI, CVU or LOAD
' C_sg1g1e_67ea404e_solvegotos_L000217_218 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1f_67ea404e_createlabel_L000224 ' <symbol:createlabel>
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
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g1b_67ea404e_newlabelentry_L000211
 add SP, #16 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sg1g1f_67ea404e_createlabel_L000224_226 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r13 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 mov r20, r15
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sg1g1f_67ea404e_createlabel_L000224_226
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r13 ' reg <- INDIRP4 reg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1e_67ea404e_solvegotos_L000217
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g1f_67ea404e_createlabel_L000224_228 ' EQI4
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg1g1f_67ea404e_createlabel_L000224_225 ' JUMPV addrg
C_sg1g1f_67ea404e_createlabel_L000224_228
 mov r0, #0 ' RET coni
C_sg1g1f_67ea404e_createlabel_L000224_225
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g1g_67ea404e_movegotosout_L000230 ' <symbol:movegotosout>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #12 ' ADDP4 coni
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_sg1g1g_67ea404e_movegotosout_L000230_235 ' JUMPV addrg
C_sg1g1g_67ea404e_movegotosout_L000230_232
 mov r22, r19
 shl r22, #4 ' LSHI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gm_67ea404e_reglevel_L000080
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gm_67ea404e_reglevel_L000080
 add SP, #4 ' CALL addrg
 cmps r22, r0 wz,wc
 jmp #BRBE
 long @C_sg1g1g_67ea404e_movegotosout_L000230_236 ' LEI4
 mov r22, r15
 adds r22, #13 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r21
 adds r18, #13 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sg1g1g_67ea404e_movegotosout_L000230_236
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sg1g1g_67ea404e_movegotosout_L000230_233 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sg1g1g_67ea404e_movegotosout_L000230_235
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sg1g1g_67ea404e_movegotosout_L000230_232 ' LTI4
' C_sg1g1g_67ea404e_movegotosout_L000230_231 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1h_67ea404e_enterblock_L000238 ' <symbol:enterblock>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #14 ' ADDP4 coni
 wrbyte r2, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 mov r20, r4
 adds r20, #50 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov r20, r4
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 mov r20, r4
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #13 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_sg1g1h_67ea404e_enterblock_L000238_241 ' EQU4
 adds r22, #15 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg1g1h_67ea404e_enterblock_L000238_241 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_sg1g1h_67ea404e_enterblock_L000238_242 ' JUMPV addrg
C_sg1g1h_67ea404e_enterblock_L000238_241
 mov r23, #0 ' reg <- coni
C_sg1g1h_67ea404e_enterblock_L000238_242
 mov r22, r3
 adds r22, #15 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r3 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 wrlong r3, r22 ' ASGNP4 reg reg
' C_sg1g1h_67ea404e_enterblock_L000238_239 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1g1i_67ea404e_undefgoto_L000243 ' <symbol:undefgoto>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long @C_sg1g1i_67ea404e_undefgoto_L000243_247_L000248
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 rdlong r20, r21 ' reg <- INDIRP4 reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_sg1g1i_67ea404e_undefgoto_L000243_245 ' NEU4
 jmp #LODL
 long @C_sg1g1i_67ea404e_undefgoto_L000243_249_L000250
 mov r19, RI ' reg <- addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sg1g1i_67ea404e_undefgoto_L000243_246 ' JUMPV addrg
C_sg1g1i_67ea404e_undefgoto_L000243_245
 jmp #LODL
 long @C_sg1g1i_67ea404e_undefgoto_L000243_251_L000252
 mov r19, RI ' reg <- addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #16 ' ADDP4 coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_sg1g1i_67ea404e_undefgoto_L000243_246
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
' C_sg1g1i_67ea404e_undefgoto_L000243_244 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1m_67ea404e_leaveblock_L000253 ' <symbol:leaveblock>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gm_67ea404e_reglevel_L000080
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #14 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg1g1m_67ea404e_leaveblock_L000253_255 ' EQI4
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long @C_sg1g1i_67ea404e_undefgoto_L000243_247_L000248
 mov r3, RI ' reg ARG ADDRG
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g1f_67ea404e_createlabel_L000224
 add SP, #12 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
C_sg1g1m_67ea404e_leaveblock_L000253_255
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sg1g1m_67ea404e_leaveblock_L000253_257 ' NEI4
 rdlong r20, r21 ' reg <- INDIRP4 reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_sg1g1m_67ea404e_leaveblock_L000253_257 ' EQU4
 mov r20, r21
 adds r20, #13 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g1m_67ea404e_leaveblock_L000253_257 ' EQI4
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
C_sg1g1m_67ea404e_leaveblock_L000253_257
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r21 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gs_67ea404e_removevars_L000116
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sg1g1m_67ea404e_leaveblock_L000253_259 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1g_67ea404e_movegotosout_L000230
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g1m_67ea404e_leaveblock_L000253_260 ' JUMPV addrg
C_sg1g1m_67ea404e_leaveblock_L000253_259
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r19
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_sg1g1m_67ea404e_leaveblock_L000253_261 ' GEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 mov r20, r19
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1i_67ea404e_undefgoto_L000243
 add SP, #4 ' CALL addrg
C_sg1g1m_67ea404e_leaveblock_L000253_261
C_sg1g1m_67ea404e_leaveblock_L000253_260
' C_sg1g1m_67ea404e_leaveblock_L000253_254 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g1n_67ea404e_addprototype_L000263 ' <symbol:addprototype>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 rdlong r21, r19 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_sg1g1n_67ea404e_addprototype_L000263_265 ' LTI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_sg1g1n_67ea404e_addprototype_L000263_267_L000268
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 131071
 mov r3, RI ' reg ARG con
 mov r4, #4 ' reg ARG coni
 mov r5, r21
 adds r5, #28 ' ADDP4 coni
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, r21
 adds r22, #56 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sg1g1n_67ea404e_addprototype_L000263_270 ' JUMPV addrg
C_sg1g1n_67ea404e_addprototype_L000263_269
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C_sg1g1n_67ea404e_addprototype_L000263_270
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r13, r22 wz,wc
 jmp #BR_B
 long @C_sg1g1n_67ea404e_addprototype_L000263_269 ' LTI4
C_sg1g1n_67ea404e_addprototype_L000263_265
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 wrlong r18, r22 ' ASGNI4 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaF__newproto ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 shl r20, #2 ' LSHI4 coni
 mov r18, r21
 adds r18, #56 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g1n_67ea404e_addprototype_L000263_273 ' EQI4
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g1n_67ea404e_addprototype_L000263_273 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g1n_67ea404e_addprototype_L000263_273 ' JUMPV addrg
C_sg1g1n_67ea404e_addprototype_L000263_273
 mov r0, r17 ' CVI, CVU or LOAD
' C_sg1g1n_67ea404e_addprototype_L000263_264 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1p_67ea404e_codeclosure_L000274 ' <symbol:codeclosure>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
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
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
' C_sg1g1p_67ea404e_codeclosure_L000274_275 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1q_67ea404e_open_func_L000276 ' <symbol:open_func>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r17, r21 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov r20, r17
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #53 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #51 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrword r20, r22 ' ASGNI2 reg reg
 mov r22, r21
 adds r22, #50 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #54 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #40 ' ADDP4 coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #76 ' ADDP4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g1q_67ea404e_open_func_L000276_279 ' EQI4
 mov r20, r17
 adds r20, #76 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g1q_67ea404e_open_func_L000276_279 ' EQI4
 mov r22, r17
 adds r22, #76 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g1q_67ea404e_open_func_L000276_279 ' JUMPV addrg
C_sg1g1q_67ea404e_open_func_L000276_279
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
' C_sg1g1q_67ea404e_open_func_L000276_277 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1r_67ea404e_close_func_L000280 ' <symbol:close_func>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 rdlong r21, r19 ' reg <- INDIRP4 reg
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
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__finish ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #20 ' ADDP4 coni
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #24 ' ADDP4 coni
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r2, #8 ' reg ARG coni
 mov r22, r19
 adds r22, #36 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #36 ' ADDP4 coni
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r2, #8 ' reg ARG coni
 mov r22, r19
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #16 ' ADDP4 coni
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r2, #4 ' reg ARG coni
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, r21
 adds r4, #28 ' ADDP4 coni
 mov r22, r21
 adds r22, #56 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r2, #12 ' reg ARG coni
 mov r22, r19
 adds r22, #48 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r4, r21
 adds r4, #32 ' ADDP4 coni
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r2, #8 ' reg ARG coni
 mov r22, r19
 adds r22, #51 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov r4, r21
 adds r4, #12 ' ADDP4 coni
 mov r22, r21
 adds r22, #60 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__shrinkvector_
 add SP, #16 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_sg1g1r_67ea404e_close_func_L000280_282 ' LEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_sg1g1r_67ea404e_close_func_L000280_282
' C_sg1g1r_67ea404e_close_func_L000280_281 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1s_67ea404e_block_follow_L000284 ' <symbol:block_follow>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRI4 reg
 mov r22, #276 ' reg <- coni
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_sg1g1s_67ea404e_block_follow_L000284_290 ' EQI4
 cmps r23, r22 wz,wc
 jmp #BR_A
 long @C_sg1g1s_67ea404e_block_follow_L000284_292 ' GTI4
' C_sg1g1s_67ea404e_block_follow_L000284_291 ' (symbol refcount = 0)
 cmps r23,  #259 wz
 jmp #BR_Z
 long @C_sg1g1s_67ea404e_block_follow_L000284_289 ' EQI4
 cmps r23,  #260 wz
 jmp #BR_Z
 long @C_sg1g1s_67ea404e_block_follow_L000284_289 ' EQI4
 cmps r23,  #261 wz
 jmp #BR_Z
 long @C_sg1g1s_67ea404e_block_follow_L000284_289 ' EQI4
 jmp #JMPA
 long @C_sg1g1s_67ea404e_block_follow_L000284_286 ' JUMPV addrg
C_sg1g1s_67ea404e_block_follow_L000284_292
 cmps r23,  #288 wz
 jmp #BR_Z
 long @C_sg1g1s_67ea404e_block_follow_L000284_289 ' EQI4
 jmp #JMPA
 long @C_sg1g1s_67ea404e_block_follow_L000284_286 ' JUMPV addrg
C_sg1g1s_67ea404e_block_follow_L000284_289
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg1g1s_67ea404e_block_follow_L000284_285 ' JUMPV addrg
C_sg1g1s_67ea404e_block_follow_L000284_290
 mov r0, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sg1g1s_67ea404e_block_follow_L000284_285 ' JUMPV addrg
C_sg1g1s_67ea404e_block_follow_L000284_286
 mov r0, #0 ' RET coni
C_sg1g1s_67ea404e_block_follow_L000284_285
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1g1t_67ea404e_statlist_L000293 ' <symbol:statlist>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sg1g1t_67ea404e_statlist_L000293_296 ' JUMPV addrg
C_sg1g1t_67ea404e_statlist_L000293_295
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #273 wz
 jmp #BRNZ
 long @C_sg1g1t_67ea404e_statlist_L000293_298 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g_67ea404e_statement_L000020 ' CALL addrg
 jmp #JMPA
 long @C_sg1g1t_67ea404e_statlist_L000293_294 ' JUMPV addrg
C_sg1g1t_67ea404e_statlist_L000293_298
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g_67ea404e_statement_L000020 ' CALL addrg
C_sg1g1t_67ea404e_statlist_L000293_296
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1s_67ea404e_block_follow_L000284
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g1t_67ea404e_statlist_L000293_295 ' EQI4
C_sg1g1t_67ea404e_statlist_L000293_294
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g1u_67ea404e_fieldsel_L000300 ' <symbol:fieldsel>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1gh_67ea404e_codename_L000065
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
' C_sg1g1u_67ea404e_fieldsel_L000300_301 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g1v_67ea404e_yindex_L000302 ' <symbol:yindex>
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
 long @C_sg1g1_67ea404e_expr_L000021
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
' C_sg1g1v_67ea404e_yindex_L000302_303 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g20_67ea404e_recfield_L000304 ' <symbol:recfield>
 jmp #NEWF
 sub SP, #52
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #291 wz
 jmp #BRNZ
 long @C_sg1g20_67ea404e_recfield_L000304_306 ' NEI4
 jmp #LODL
 long @C_sg1g20_67ea404e_recfield_L000304_308_L000309
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 2147483647
 mov r3, RI ' reg ARG con
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov r5, r19 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g8_67ea404e_checklimit_L000037
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gh_67ea404e_codename_L000065
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g20_67ea404e_recfield_L000304_307 ' JUMPV addrg
C_sg1g20_67ea404e_recfield_L000304_306
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1v_67ea404e_yindex_L000302
 add SP, #4 ' CALL addrg
C_sg1g20_67ea404e_recfield_L000304_307
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r1, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g1_67ea404e_expr_L000021
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
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sg1g20_67ea404e_recfield_L000304_305 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #52 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g22_67ea404e_closelistfield_L000310 ' <symbol:closelistfield>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sg1g22_67ea404e_closelistfield_L000310_312 ' NEI4
 jmp #JMPA
 long @C_sg1g22_67ea404e_closelistfield_L000310_311 ' JUMPV addrg
C_sg1g22_67ea404e_closelistfield_L000310_312
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #50 wz
 jmp #BRNZ
 long @C_sg1g22_67ea404e_closelistfield_L000310_314 ' NEI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setlist
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_sg1g22_67ea404e_closelistfield_L000310_314
C_sg1g22_67ea404e_closelistfield_L000310_311
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g23_67ea404e_lastlistfield_L000316 ' <symbol:lastlistfield>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sg1g23_67ea404e_lastlistfield_L000316_318 ' NEI4
 jmp #JMPA
 long @C_sg1g23_67ea404e_lastlistfield_L000316_317 ' JUMPV addrg
C_sg1g23_67ea404e_lastlistfield_L000316_318
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_sg1g23_67ea404e_lastlistfield_L000316_322 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_sg1g23_67ea404e_lastlistfield_L000316_320 ' NEI4
C_sg1g23_67ea404e_lastlistfield_L000316_322
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
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setlist
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sg1g23_67ea404e_lastlistfield_L000316_321 ' JUMPV addrg
C_sg1g23_67ea404e_lastlistfield_L000316_320
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg1g23_67ea404e_lastlistfield_L000316_323 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
C_sg1g23_67ea404e_lastlistfield_L000316_323
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setlist
 add SP, #12 ' CALL addrg
C_sg1g23_67ea404e_lastlistfield_L000316_321
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
C_sg1g23_67ea404e_lastlistfield_L000316_317
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g24_67ea404e_listfield_L000325 ' <symbol:listfield>
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
 long @C_sg1g1_67ea404e_expr_L000021
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_sg1g24_67ea404e_listfield_L000325_326 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g25_67ea404e_field_L000327 ' <symbol:field>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r22, #91 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sg1g25_67ea404e_field_L000327_335 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sg1g25_67ea404e_field_L000327_329 ' LTI4
' C_sg1g25_67ea404e_field_L000327_336 ' (symbol refcount = 0)
 cmps r19,  #291 wz
 jmp #BR_Z
 long @C_sg1g25_67ea404e_field_L000327_332 ' EQI4
 jmp #JMPA
 long @C_sg1g25_67ea404e_field_L000327_329 ' JUMPV addrg
C_sg1g25_67ea404e_field_L000327_332
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__lookahead ' CALL addrg
 cmps r0,  #61 wz
 jmp #BR_Z
 long @C_sg1g25_67ea404e_field_L000327_333 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g24_67ea404e_listfield_L000325
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g25_67ea404e_field_L000327_330 ' JUMPV addrg
C_sg1g25_67ea404e_field_L000327_333
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g20_67ea404e_recfield_L000304
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g25_67ea404e_field_L000327_330 ' JUMPV addrg
C_sg1g25_67ea404e_field_L000327_335
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g20_67ea404e_recfield_L000304
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g25_67ea404e_field_L000327_330 ' JUMPV addrg
C_sg1g25_67ea404e_field_L000327_329
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g24_67ea404e_listfield_L000325
 add SP, #4 ' CALL addrg
C_sg1g25_67ea404e_field_L000327_330
' C_sg1g25_67ea404e_field_L000327_328 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g26_67ea404e_constructor_L000337 ' <symbol:constructor>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
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
 jmp #LODF
 long -44
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -20
 wrlong r21, RI ' ASGNP4 addrl reg
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, #8 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
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
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 mov r2, #123 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
C_sg1g26_67ea404e_constructor_L000337_343
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #125 wz
 jmp #BRNZ
 long @C_sg1g26_67ea404e_constructor_L000337_346 ' NEI4
 jmp #JMPA
 long @C_sg1g26_67ea404e_constructor_L000337_345 ' JUMPV addrg
C_sg1g26_67ea404e_constructor_L000337_346
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g22_67ea404e_closelistfield_L000310
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g25_67ea404e_field_L000327
 add SP, #4 ' CALL addrg
' C_sg1g26_67ea404e_constructor_L000337_344 ' (symbol refcount = 0)
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sg1g26_67ea404e_constructor_L000337_343 ' NEI4
 mov r2, #59 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg1g26_67ea404e_constructor_L000337_343 ' NEI4
C_sg1g26_67ea404e_constructor_L000337_345
 mov RI, FP
 sub RI, #-(-40)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #123 ' reg ARG coni
 mov r4, #125 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gc_67ea404e_check_match_L000051
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g23_67ea404e_lastlistfield_L000316
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
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
' C_sg1g26_67ea404e_constructor_L000337_338 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g27_67ea404e_setvararg_L000350 ' <symbol:setvararg>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
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
' C_sg1g27_67ea404e_setvararg_L000350_351 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g28_67ea404e_parlist_L000352 ' <symbol:parlist>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 rdlong r22, r19 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r21, #0 ' reg <- coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #41 wz
 jmp #BR_Z
 long @C_sg1g28_67ea404e_parlist_L000352_354 ' EQI4
C_sg1g28_67ea404e_parlist_L000352_356
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
 mov r22, #280 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_sg1g28_67ea404e_parlist_L000352_363 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_sg1g28_67ea404e_parlist_L000352_359 ' LTI4
' C_sg1g28_67ea404e_parlist_L000352_366 ' (symbol refcount = 0)
 cmps r17,  #291 wz
 jmp #BR_Z
 long @C_sg1g28_67ea404e_parlist_L000352_362 ' EQI4
 jmp #JMPA
 long @C_sg1g28_67ea404e_parlist_L000352_359 ' JUMPV addrg
C_sg1g28_67ea404e_parlist_L000352_362
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sg1g28_67ea404e_parlist_L000352_360 ' JUMPV addrg
C_sg1g28_67ea404e_parlist_L000352_363
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_sg1g28_67ea404e_parlist_L000352_360 ' JUMPV addrg
C_sg1g28_67ea404e_parlist_L000352_359
 jmp #LODL
 long @C_sg1g28_67ea404e_parlist_L000352_364_L000365
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sg1g28_67ea404e_parlist_L000352_360
' C_sg1g28_67ea404e_parlist_L000352_357 ' (symbol refcount = 0)
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_sg1g28_67ea404e_parlist_L000352_367 ' NEI4
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg1g28_67ea404e_parlist_L000352_356 ' NEI4
C_sg1g28_67ea404e_parlist_L000352_367
C_sg1g28_67ea404e_parlist_L000352_354
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 mov r20, r19
 adds r20, #50 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_sg1g28_67ea404e_parlist_L000352_368 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g27_67ea404e_setvararg_L000350
 add SP, #4 ' CALL addrg
C_sg1g28_67ea404e_parlist_L000352_368
 mov r22, r19
 adds r22, #50 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
' C_sg1g28_67ea404e_parlist_L000352_353 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g2a_67ea404e_body_L000370 ' <symbol:body>
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
 long @C_sg1g1n_67ea404e_addprototype_L000263 ' CALL addrg
 jmp #LODF
 long -60
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #40 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-60) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1q_67ea404e_open_func_L000276
 add SP, #8 ' CALL addrg
 mov r2, #40 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sg1g2a_67ea404e_body_L000370_372 ' EQI4
 mov r2, #4 ' reg ARG coni
 jmp #LODL
 long @C_sg1g2a_67ea404e_body_L000370_374_L000375
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
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110
 add SP, #4 ' CALL addrg
C_sg1g2a_67ea404e_body_L000370_372
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g28_67ea404e_parlist_L000352 ' CALL addrg
 mov r2, #41 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1t_67ea404e_statlist_L000293 ' CALL addrg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #264 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gc_67ea404e_check_match_L000051
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1p_67ea404e_codeclosure_L000274
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1r_67ea404e_close_func_L000280 ' CALL addrg
' C_sg1g2a_67ea404e_body_L000370_371 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #72 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g2c_67ea404e_explist_L000376 ' <symbol:explist>
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
 long @C_sg1g1_67ea404e_expr_L000021
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2c_67ea404e_explist_L000376_379 ' JUMPV addrg
C_sg1g2c_67ea404e_explist_L000376_378
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g1_67ea404e_expr_L000021
 add SP, #4 ' CALL addrg
 adds r19, #1 ' ADDI4 coni
C_sg1g2c_67ea404e_explist_L000376_379
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg1g2c_67ea404e_explist_L000376_378 ' NEI4
 mov r0, r19 ' CVI, CVU or LOAD
' C_sg1g2c_67ea404e_explist_L000376_377 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g2d_67ea404e_funcargs_L000381 ' <symbol:funcargs>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRI4 reg
 mov r22, #123 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_sg1g2d_67ea404e_funcargs_L000381_392 ' EQI4
 cmps r13, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2d_67ea404e_funcargs_L000381_397 ' GTI4
' C_sg1g2d_67ea404e_funcargs_L000381_396 ' (symbol refcount = 0)
 cmps r13,  #40 wz
 jmp #BR_Z
 long @C_sg1g2d_67ea404e_funcargs_L000381_386 ' EQI4
 jmp #JMPA
 long @C_sg1g2d_67ea404e_funcargs_L000381_383 ' JUMPV addrg
C_sg1g2d_67ea404e_funcargs_L000381_397
 cmps r13,  #292 wz
 jmp #BR_Z
 long @C_sg1g2d_67ea404e_funcargs_L000381_393 ' EQI4
 jmp #JMPA
 long @C_sg1g2d_67ea404e_funcargs_L000381_383 ' JUMPV addrg
C_sg1g2d_67ea404e_funcargs_L000381_386
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #41 wz
 jmp #BRNZ
 long @C_sg1g2d_67ea404e_funcargs_L000381_387 ' NEI4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sg1g2d_67ea404e_funcargs_L000381_388 ' JUMPV addrg
C_sg1g2d_67ea404e_funcargs_L000381_387
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2c_67ea404e_explist_L000376
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_sg1g2d_67ea404e_funcargs_L000381_391 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_sg1g2d_67ea404e_funcargs_L000381_389 ' NEI4
C_sg1g2d_67ea404e_funcargs_L000381_391
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setreturns
 add SP, #8 ' CALL addrg
C_sg1g2d_67ea404e_funcargs_L000381_389
C_sg1g2d_67ea404e_funcargs_L000381_388
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #40 ' reg ARG coni
 mov r4, #41 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gc_67ea404e_check_match_L000051
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2d_67ea404e_funcargs_L000381_384 ' JUMPV addrg
C_sg1g2d_67ea404e_funcargs_L000381_392
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g26_67ea404e_constructor_L000337
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2d_67ea404e_funcargs_L000381_384 ' JUMPV addrg
C_sg1g2d_67ea404e_funcargs_L000381_393
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gg_67ea404e_codestring_L000063
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 jmp #JMPA
 long @C_sg1g2d_67ea404e_funcargs_L000381_384 ' JUMPV addrg
C_sg1g2d_67ea404e_funcargs_L000381_383
 jmp #LODL
 long @C_sg1g2d_67ea404e_funcargs_L000381_394_L000395
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sg1g2d_67ea404e_funcargs_L000381_384
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_sg1g2d_67ea404e_funcargs_L000381_400 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_sg1g2d_67ea404e_funcargs_L000381_398 ' NEI4
C_sg1g2d_67ea404e_funcargs_L000381_400
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sg1g2d_67ea404e_funcargs_L000381_399 ' JUMPV addrg
C_sg1g2d_67ea404e_funcargs_L000381_398
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg1g2d_67ea404e_funcargs_L000381_401 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
C_sg1g2d_67ea404e_funcargs_L000381_401
 mov r22, r17
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r15
 adds r20, #1 ' ADDI4 coni
 subs r22, r20 ' SUBI/P (1)
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
C_sg1g2d_67ea404e_funcargs_L000381_399
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r4, r22
 adds r4, #1 ' ADDI4 coni
 mov r5, r15 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #68
 jmp #PSHL ' stack ARG coni
 mov RI, r17
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
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #52 ' ADDP4 coni
 mov r20, r15
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sg1g2d_67ea404e_funcargs_L000381_382 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g2f_67ea404e_primaryexp_L000403 ' <symbol:primaryexp>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r22, #40 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sg1g2f_67ea404e_primaryexp_L000403_408 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sg1g2f_67ea404e_primaryexp_L000403_405 ' LTI4
' C_sg1g2f_67ea404e_primaryexp_L000403_412 ' (symbol refcount = 0)
 cmps r19,  #291 wz
 jmp #BR_Z
 long @C_sg1g2f_67ea404e_primaryexp_L000403_409 ' EQI4
 jmp #JMPA
 long @C_sg1g2f_67ea404e_primaryexp_L000403_405 ' JUMPV addrg
C_sg1g2f_67ea404e_primaryexp_L000403_408
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1_67ea404e_expr_L000021
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
 long @C_sg1gc_67ea404e_check_match_L000051
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2f_67ea404e_primaryexp_L000403_404 ' JUMPV addrg
C_sg1g2f_67ea404e_primaryexp_L000403_409
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g15_67ea404e_singlevar_L000174
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2f_67ea404e_primaryexp_L000403_404 ' JUMPV addrg
C_sg1g2f_67ea404e_primaryexp_L000403_405
 jmp #LODL
 long @C_sg1g2f_67ea404e_primaryexp_L000403_410_L000411
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sg1g2f_67ea404e_primaryexp_L000403_404
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g2h_67ea404e_suffixedexp_L000413 ' <symbol:suffixedexp>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2f_67ea404e_primaryexp_L000403
 add SP, #4 ' CALL addrg
C_sg1g2h_67ea404e_suffixedexp_L000413_415
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 mov r22, #58 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_424 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_427 ' GTI4
' C_sg1g2h_67ea404e_suffixedexp_L000413_426 ' (symbol refcount = 0)
 mov r22, #40 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_425 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_414 ' LTI4
' C_sg1g2h_67ea404e_suffixedexp_L000413_428 ' (symbol refcount = 0)
 cmps r15,  #46 wz
 jmp #BR_Z
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_422 ' EQI4
 jmp #JMPA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_414 ' JUMPV addrg
C_sg1g2h_67ea404e_suffixedexp_L000413_427
 mov r22, #123 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_425 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_430 ' GTI4
' C_sg1g2h_67ea404e_suffixedexp_L000413_429 ' (symbol refcount = 0)
 cmps r15,  #91 wz
 jmp #BR_Z
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_423 ' EQI4
 jmp #JMPA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_414 ' JUMPV addrg
C_sg1g2h_67ea404e_suffixedexp_L000413_430
 cmps r15,  #292 wz
 jmp #BR_Z
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_425 ' EQI4
 jmp #JMPA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_414 ' JUMPV addrg
C_sg1g2h_67ea404e_suffixedexp_L000413_422
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1u_67ea404e_fieldsel_L000300
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_415 ' JUMPV addrg
C_sg1g2h_67ea404e_suffixedexp_L000413_423
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
 long @C_sg1g1v_67ea404e_yindex_L000302
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
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_415 ' JUMPV addrg
C_sg1g2h_67ea404e_suffixedexp_L000413_424
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
 long @C_sg1gh_67ea404e_codename_L000065
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
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2d_67ea404e_funcargs_L000381
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_415 ' JUMPV addrg
C_sg1g2h_67ea404e_suffixedexp_L000413_425
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2d_67ea404e_funcargs_L000381
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413_415 ' JUMPV addrg
C_sg1g2h_67ea404e_suffixedexp_L000413_414
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g2i_67ea404e_simpleexp_L000431 ' <symbol:simpleexp>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRI4 reg
 mov r22, #269 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_439 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2i_67ea404e_simpleexp_L000431_450 ' GTI4
' C_sg1g2i_67ea404e_simpleexp_L000431_449 ' (symbol refcount = 0)
 mov r22, #123 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_447 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sg1g2i_67ea404e_simpleexp_L000431_433 ' LTI4
' C_sg1g2i_67ea404e_simpleexp_L000431_451 ' (symbol refcount = 0)
 cmps r19,  #262 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_441 ' EQI4
 cmps r19,  #264 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_448 ' EQI4
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_433 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_450
 mov r22, #280 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_442 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2i_67ea404e_simpleexp_L000431_453 ' GTI4
' C_sg1g2i_67ea404e_simpleexp_L000431_452 ' (symbol refcount = 0)
 cmps r19,  #275 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_440 ' EQI4
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_433 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_453
 cmps r19,  #289 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_436 ' EQI4
 cmps r19,  #290 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_437 ' EQI4
 cmps r19,  #292 wz
 jmp #BR_Z
 long @C_sg1g2i_67ea404e_simpleexp_L000431_438 ' EQI4
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_433 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_436
 mov r2, #0 ' reg ARG coni
 mov r3, #5 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_434 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_437
 mov r2, #0 ' reg ARG coni
 mov r3, #6 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_434 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_438
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gg_67ea404e_codestring_L000063
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_434 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_439
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_434 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_440
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_434 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_441
 mov r2, #0 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_434 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_442
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sg1g2i_67ea404e_simpleexp_L000431_443 ' NEI4
 jmp #LODL
 long @C_sg1g2i_67ea404e_simpleexp_L000431_445_L000446
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sg1g2i_67ea404e_simpleexp_L000431_443
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
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_434 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_447
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g26_67ea404e_constructor_L000337
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_432 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_448
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, #0 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2a_67ea404e_body_L000370
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_432 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_433
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2i_67ea404e_simpleexp_L000431_432 ' JUMPV addrg
C_sg1g2i_67ea404e_simpleexp_L000431_434
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
C_sg1g2i_67ea404e_simpleexp_L000431_432
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g2k_67ea404e_getunopr_L000454 ' <symbol:getunopr>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, #45 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_sg1g2k_67ea404e_getunopr_L000454_459 ' EQI4
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2k_67ea404e_getunopr_L000454_463 ' GTI4
' C_sg1g2k_67ea404e_getunopr_L000454_462 ' (symbol refcount = 0)
 cmps r2,  #35 wz
 jmp #BR_Z
 long @C_sg1g2k_67ea404e_getunopr_L000454_461 ' EQI4
 jmp #JMPA
 long @C_sg1g2k_67ea404e_getunopr_L000454_456 ' JUMPV addrg
C_sg1g2k_67ea404e_getunopr_L000454_463
 mov r22, #126 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_sg1g2k_67ea404e_getunopr_L000454_460 ' EQI4
 cmps r2, r22 wz,wc
 jmp #BR_B
 long @C_sg1g2k_67ea404e_getunopr_L000454_456 ' LTI4
' C_sg1g2k_67ea404e_getunopr_L000454_464 ' (symbol refcount = 0)
 cmps r2,  #270 wz
 jmp #BR_Z
 long @C_sg1g2k_67ea404e_getunopr_L000454_458 ' EQI4
 jmp #JMPA
 long @C_sg1g2k_67ea404e_getunopr_L000454_456 ' JUMPV addrg
C_sg1g2k_67ea404e_getunopr_L000454_458
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_sg1g2k_67ea404e_getunopr_L000454_455 ' JUMPV addrg
C_sg1g2k_67ea404e_getunopr_L000454_459
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_sg1g2k_67ea404e_getunopr_L000454_455 ' JUMPV addrg
C_sg1g2k_67ea404e_getunopr_L000454_460
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg1g2k_67ea404e_getunopr_L000454_455 ' JUMPV addrg
C_sg1g2k_67ea404e_getunopr_L000454_461
 mov r0, #3 ' RET coni
 jmp #JMPA
 long @C_sg1g2k_67ea404e_getunopr_L000454_455 ' JUMPV addrg
C_sg1g2k_67ea404e_getunopr_L000454_456
 mov r0, #4 ' RET coni
C_sg1g2k_67ea404e_getunopr_L000454_455
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sg1g2l_67ea404e_getbinopr_L000465 ' <symbol:getbinopr>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #94 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_sg1g2l_67ea404e_getbinopr_L000465_473 ' EQI4
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2l_67ea404e_getbinopr_L000465_491 ' GTI4
' C_sg1g2l_67ea404e_getbinopr_L000465_490 ' (symbol refcount = 0)
 cmps r2,  #37 wz,wc
 jmp #BR_B
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467 ' LTI4
 cmps r2,  #47 wz,wc
 jmp #BR_A
 long @C_sg1g2l_67ea404e_getbinopr_L000465_492 ' GTI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sg1g2l_67ea404e_getbinopr_L000465_493_L000495-148
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg1g2l_67ea404e_getbinopr_L000465_493_L000495 ' <symbol:493>
 long @C_sg1g2l_67ea404e_getbinopr_L000465_472
 long @C_sg1g2l_67ea404e_getbinopr_L000465_476
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_471
 long @C_sg1g2l_67ea404e_getbinopr_L000465_469
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_470
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_474

' Catalina Code

DAT ' code segment
C_sg1g2l_67ea404e_getbinopr_L000465_492
 cmps r2,  #60 wz
 jmp #BR_Z
 long @C_sg1g2l_67ea404e_getbinopr_L000465_484 ' EQI4
 cmps r2,  #62 wz
 jmp #BR_Z
 long @C_sg1g2l_67ea404e_getbinopr_L000465_486 ' EQI4
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_491
 mov r22, #256 ' reg <- coni
 cmps r2, r22 wz
 jmp #BR_Z
 long @C_sg1g2l_67ea404e_getbinopr_L000465_488 ' EQI4
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2l_67ea404e_getbinopr_L000465_498 ' GTI4
' C_sg1g2l_67ea404e_getbinopr_L000465_497 ' (symbol refcount = 0)
 cmps r2,  #124 wz
 jmp #BR_Z
 long @C_sg1g2l_67ea404e_getbinopr_L000465_477 ' EQI4
 cmps r2,  #126 wz
 jmp #BR_Z
 long @C_sg1g2l_67ea404e_getbinopr_L000465_478 ' EQI4
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_498
 cmps r2,  #271 wz,wc
 jmp #BR_B
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467 ' LTI4
 cmps r2,  #286 wz,wc
 jmp #BR_A
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467 ' GTI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sg1g2l_67ea404e_getbinopr_L000465_499_L000501-1084
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg1g2l_67ea404e_getbinopr_L000465_499_L000501 ' <symbol:499>
 long @C_sg1g2l_67ea404e_getbinopr_L000465_489
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_475
 long @C_sg1g2l_67ea404e_getbinopr_L000465_481
 long @C_sg1g2l_67ea404e_getbinopr_L000465_467
 long @C_sg1g2l_67ea404e_getbinopr_L000465_483
 long @C_sg1g2l_67ea404e_getbinopr_L000465_487
 long @C_sg1g2l_67ea404e_getbinopr_L000465_485
 long @C_sg1g2l_67ea404e_getbinopr_L000465_482
 long @C_sg1g2l_67ea404e_getbinopr_L000465_479
 long @C_sg1g2l_67ea404e_getbinopr_L000465_480

' Catalina Code

DAT ' code segment
C_sg1g2l_67ea404e_getbinopr_L000465_469
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_470
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_471
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_472
 mov r0, #3 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_473
 mov r0, #4 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_474
 mov r0, #5 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_475
 mov r0, #6 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_476
 mov r0, #7 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_477
 mov r0, #8 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_478
 mov r0, #9 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_479
 mov r0, #10 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_480
 mov r0, #11 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_481
 mov r0, #12 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_482
 mov r0, #16 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_483
 mov r0, #13 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_484
 mov r0, #14 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_485
 mov r0, #15 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_486
 mov r0, #17 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_487
 mov r0, #18 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_488
 mov r0, #19 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_489
 mov r0, #20 ' RET coni
 jmp #JMPA
 long @C_sg1g2l_67ea404e_getbinopr_L000465_466 ' JUMPV addrg
C_sg1g2l_67ea404e_getbinopr_L000465_467
 mov r0, #21 ' RET coni
C_sg1g2l_67ea404e_getbinopr_L000465_466
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg1g2q_67ea404e_priority_L000504 ' <symbol:priority>
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
C_sg1g2r_67ea404e_subexpr_L000505 ' <symbol:subexpr>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaE__incC_stack ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g2k_67ea404e_getunopr_L000454 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #4 wz
 jmp #BR_Z
 long @C_sg1g2r_67ea404e_subexpr_L000505_507 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
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
 long @C_sg1g2r_67ea404e_subexpr_L000505
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
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__prefix
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2r_67ea404e_subexpr_L000505_508 ' JUMPV addrg
C_sg1g2r_67ea404e_subexpr_L000505_507
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2i_67ea404e_simpleexp_L000431
 add SP, #4 ' CALL addrg
C_sg1g2r_67ea404e_subexpr_L000505_508
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g2l_67ea404e_getbinopr_L000465 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sg1g2r_67ea404e_subexpr_L000505_510 ' JUMPV addrg
C_sg1g2r_67ea404e_subexpr_L000505_509
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRI4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__infix
 add SP, #8 ' CALL addrg
 mov r22, r17
 shl r22, #1 ' LSHI4 coni
 jmp #LODL
 long @C_sg1g2q_67ea404e_priority_L000504+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2r_67ea404e_subexpr_L000505
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__posfix
 add SP, #16 ' CALL addrg
 mov r17, r15 ' CVI, CVU or LOAD
C_sg1g2r_67ea404e_subexpr_L000505_510
 cmps r17,  #21 wz
 jmp #BR_Z
 long @C_sg1g2r_67ea404e_subexpr_L000505_513 ' EQI4
 mov r22, r17
 shl r22, #1 ' LSHI4 coni
 jmp #LODL
 long @C_sg1g2q_67ea404e_priority_L000504
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r19 wz,wc
 jmp #BR_A
 long @C_sg1g2r_67ea404e_subexpr_L000505_509 ' GTI4
C_sg1g2r_67ea404e_subexpr_L000505_513
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
' C_sg1g2r_67ea404e_subexpr_L000505_506 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g1_67ea404e_expr_L000021 ' <symbol:expr>
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
 long @C_sg1g2r_67ea404e_subexpr_L000505
 add SP, #8 ' CALL addrg
' C_sg1g1_67ea404e_expr_L000021_514 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g2s_67ea404e_block_L000515 ' <symbol:block>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1t_67ea404e_statlist_L000293 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
' C_sg1g2s_67ea404e_block_L000515_516 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g2t_67ea404e_check_conflict_L000517 ' <symbol:check_conflict>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r22, r13
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sg1g2t_67ea404e_check_conflict_L000517_522 ' JUMPV addrg
C_sg1g2t_67ea404e_check_conflict_L000517_519
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #12 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2t_67ea404e_check_conflict_L000517_523 ' GTI4
 cmps r22,  #15 wz,wc
 jmp #BR_A
 long @C_sg1g2t_67ea404e_check_conflict_L000517_523 ' GTI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #13 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_525 ' NEI4
 mov r22, #10 ' reg <- coni
 rdlong r20, r19 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_526 ' NEI4
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_526 ' NEI4
 mov r17, #1 ' reg <- coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #15 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sg1g2t_67ea404e_check_conflict_L000517_526 ' JUMPV addrg
C_sg1g2t_67ea404e_check_conflict_L000517_525
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_529 ' NEI4
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_529 ' NEI4
 mov r17, #1 ' reg <- coni
 mov r22, r21
 adds r22, #10 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sg1g2t_67ea404e_check_conflict_L000517_529
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #12 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_531 ' NEI4
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_531 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_531 ' NEI4
 mov r17, #1 ' reg <- coni
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrword r20, r22 ' ASGNI2 reg reg
C_sg1g2t_67ea404e_check_conflict_L000517_531
C_sg1g2t_67ea404e_check_conflict_L000517_526
C_sg1g2t_67ea404e_check_conflict_L000517_523
' C_sg1g2t_67ea404e_check_conflict_L000517_520 ' (symbol refcount = 0)
 rdlong r21, r21 ' reg <- INDIRP4 reg
C_sg1g2t_67ea404e_check_conflict_L000517_522
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_519 ' NEU4
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sg1g2t_67ea404e_check_conflict_L000517_533 ' EQI4
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_sg1g2t_67ea404e_check_conflict_L000517_535 ' NEI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
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
 long @C_sg1g2t_67ea404e_check_conflict_L000517_536 ' JUMPV addrg
C_sg1g2t_67ea404e_check_conflict_L000517_535
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
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
C_sg1g2t_67ea404e_check_conflict_L000517_536
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
C_sg1g2t_67ea404e_check_conflict_L000517_533
' C_sg1g2t_67ea404e_check_conflict_L000517_518 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g2u_67ea404e_restassign_L000537 ' <symbol:restassign>
 jmp #NEWF
 sub SP, #36
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #9 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_sg1g2u_67ea404e_restassign_L000537_541 ' GTI4
 cmps r22,  #15 wz,wc
 jmp #BRBE
 long @C_sg1g2u_67ea404e_restassign_L000537_539 ' LEI4
C_sg1g2u_67ea404e_restassign_L000537_541
 jmp #LODL
 long @C_sg1g2u_67ea404e_restassign_L000537_542_L000543
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sg1g2u_67ea404e_restassign_L000537_539
 mov r2, r21
 adds r2, #4 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gp_67ea404e_check_readonly_L000094
 add SP, #4 ' CALL addrg
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g2u_67ea404e_restassign_L000537_544 ' EQI4
 jmp #LODF
 long -40
 wrlong r21, RI ' ASGNP4 addrl reg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413
 add SP, #4 ' CALL addrg
 mov r22, #12 ' reg <- coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_sg1g2u_67ea404e_restassign_L000537_551 ' GTI4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #15 wz,wc
 jmp #BRBE
 long @C_sg1g2u_67ea404e_restassign_L000537_547 ' LEI4
C_sg1g2u_67ea404e_restassign_L000537_551
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2t_67ea404e_check_conflict_L000517
 add SP, #8 ' CALL addrg
C_sg1g2u_67ea404e_restassign_L000537_547
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g2u_67ea404e_restassign_L000537
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sg1g2u_67ea404e_restassign_L000537_545 ' JUMPV addrg
C_sg1g2u_67ea404e_restassign_L000537_544
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2c_67ea404e_explist_L000376
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r19 wz
 jmp #BR_Z
 long @C_sg1g2u_67ea404e_restassign_L000537_553 ' EQI4
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
 long @C_sg1g16_67ea404e_adjust_assign_L000178
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2u_67ea404e_restassign_L000537_554 ' JUMPV addrg
C_sg1g2u_67ea404e_restassign_L000537_553
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
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
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__storevar
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g2u_67ea404e_restassign_L000537_538 ' JUMPV addrg
C_sg1g2u_67ea404e_restassign_L000537_554
C_sg1g2u_67ea404e_restassign_L000537_545
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, #8 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gf_67ea404e_init_exp_L000061
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r21
 adds r3, #4 ' ADDP4 coni
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__storevar
 add SP, #8 ' CALL addrg
C_sg1g2u_67ea404e_restassign_L000537_538
 jmp #POPM ' restore registers
 add SP, #36 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g30_67ea404e_cond_L000555 ' <symbol:cond>
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
 long @C_sg1g1_67ea404e_expr_L000021
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_sg1g30_67ea404e_cond_L000555_557 ' NEI4
 mov r22, #3 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_sg1g30_67ea404e_cond_L000555_557
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__goiftrue
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_sg1g30_67ea404e_cond_L000555_556 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g31_67ea404e_gotostat_L000560 ' <symbol:gotostat>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1a_67ea404e_findlabel_L000203
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sg1g31_67ea404e_gotostat_L000560_562 ' NEU4
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
 long @C_sg1g1d_67ea404e_newgotoentry_L000215
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sg1g31_67ea404e_gotostat_L000560_563 ' JUMPV addrg
C_sg1g31_67ea404e_gotostat_L000560_562
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gm_67ea404e_reglevel_L000080
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r0, r20 wz,wc
 jmp #BRBE
 long @C_sg1g31_67ea404e_gotostat_L000560_564 ' LEI4
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
C_sg1g31_67ea404e_gotostat_L000560_564
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchlist
 add SP, #8 ' CALL addrg
C_sg1g31_67ea404e_gotostat_L000560_563
' C_sg1g31_67ea404e_gotostat_L000560_561 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g32_67ea404e_breakstat_L000566 ' <symbol:breakstat>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long @C_sg1g1i_67ea404e_undefgoto_L000243_247_L000248
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRP4 reg
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
 long @C_sg1g1d_67ea404e_newgotoentry_L000215
 add SP, #12 ' CALL addrg
' C_sg1g32_67ea404e_breakstat_L000566_567 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g33_67ea404e_checkrepeated_L000568 ' <symbol:checkrepeated>
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
 long @C_sg1g1a_67ea404e_findlabel_L000203
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sg1g33_67ea404e_checkrepeated_L000568_570 ' EQU4
 jmp #LODL
 long @C_sg1g33_67ea404e_checkrepeated_L000568_572_L000573
 mov BC, FP
 sub BC, #-(-12)
 wrlong RI, BC ' ASGNP4 addrli addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r21
 adds r3, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
C_sg1g33_67ea404e_checkrepeated_L000568_570
' C_sg1g33_67ea404e_checkrepeated_L000568_569 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g35_67ea404e_labelstat_L000574 ' <symbol:labelstat>
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
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g35_67ea404e_labelstat_L000574_577 ' JUMPV addrg
C_sg1g35_67ea404e_labelstat_L000574_576
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g_67ea404e_statement_L000020 ' CALL addrg
C_sg1g35_67ea404e_labelstat_L000574_577
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #59 wz
 jmp #BR_Z
 long @C_sg1g35_67ea404e_labelstat_L000574_576 ' EQI4
 cmps r22,  #287 wz
 jmp #BR_Z
 long @C_sg1g35_67ea404e_labelstat_L000574_576 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g33_67ea404e_checkrepeated_L000568
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1s_67ea404e_block_follow_L000284
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1f_67ea404e_createlabel_L000224
 add SP, #12 ' CALL addrg
' C_sg1g35_67ea404e_labelstat_L000574_575 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g36_67ea404e_whilestat_L000579 ' <symbol:whilestat>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__getlabel ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g30_67ea404e_cond_L000555 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
 mov r2, #258 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g2s_67ea404e_block_L000515 ' CALL addrg
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
 long @C_sg1gc_67ea404e_check_match_L000051
 add SP, #12 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
' C_sg1g36_67ea404e_whilestat_L000579_580 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g37_67ea404e_repeatstat_L000581 ' <symbol:repeatstat>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__getlabel ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1t_67ea404e_statlist_L000293 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #272 ' reg ARG coni
 mov r4, #276 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gc_67ea404e_check_match_L000051
 add SP, #12 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g30_67ea404e_cond_L000555 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
 mov r22, FP
 sub r22, #-(-7) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sg1g37_67ea404e_repeatstat_L000581_583 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 jmp #LODF
 long -44
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gm_67ea404e_reglevel_L000080
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
C_sg1g37_67ea404e_repeatstat_L000581_583
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
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
' C_sg1g37_67ea404e_repeatstat_L000581_582 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g38_67ea404e_exp1_L000587 ' <symbol:exp1>
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
 long @C_sg1g1_67ea404e_expr_L000021
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
' C_sg1g38_67ea404e_exp1_L000587_588 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g39_67ea404e_fixforjump_L000589 ' <symbol:fixforjump>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #1 ' ADDI4 coni
 mov r15, r19 ' SUBI/P
 subs r15, r22 ' SUBI/P (3)
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sg1g39_67ea404e_fixforjump_L000589_591 ' EQI4
 neg r15, r15 ' NEGI4
C_sg1g39_67ea404e_fixforjump_L000589_591
 jmp #LODL
 long 131071
 mov r22, RI ' reg <- con
 cmps r15, r22 wz,wc
 jmp #BRBE
 long @C_sg1g39_67ea404e_fixforjump_L000589_593 ' LEI4
 jmp #LODL
 long @C_sg1g39_67ea404e_fixforjump_L000589_595_L000596
 mov r2, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sg1g39_67ea404e_fixforjump_L000589_593
 rdlong r22, r13 ' reg <- INDIRU4 reg
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
 wrlong r22, r13 ' ASGNU4 reg reg
' C_sg1g39_67ea404e_fixforjump_L000589_590 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg1g3b_67ea404e_forbody_L000597_forprep_L000600 ' <symbol:forprep>
 long 74
 long 75

 alignl ' align long
C_sg1g3b_67ea404e_forbody_L000597_forloop_L000602 ' <symbol:forloop>
 long 73
 long 77

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sg1g3b_67ea404e_forbody_L000597 ' <symbol:forbody>
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
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r2, #258 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sg1g3b_67ea404e_forbody_L000597_forprep_L000600
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r4, r22 ' reg <- INDIRI4 reg
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
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110
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
 long @C_sg1g2s_67ea404e_block_L000515 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
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
 long @C_sg1g39_67ea404e_fixforjump_L000589
 add SP, #12 ' CALL addrg
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sg1g3b_67ea404e_forbody_L000597_603 ' EQI4
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
C_sg1g3b_67ea404e_forbody_L000597_603
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sg1g3b_67ea404e_forbody_L000597_forloop_L000602
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__codeA_B_x
 add SP, #12 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
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
 long @C_sg1g39_67ea404e_fixforjump_L000589
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
' C_sg1g3b_67ea404e_forbody_L000597_598 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3e_67ea404e_fornum_L000605 ' <symbol:fornum>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_sg1g3e_67ea404e_fornum_L000605_607_L000608
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
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_sg1g3e_67ea404e_fornum_L000605_607_L000608
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
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_sg1g3e_67ea404e_fornum_L000605_607_L000608
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
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g38_67ea404e_exp1_L000587 ' CALL addrg
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g38_67ea404e_exp1_L000587 ' CALL addrg
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g3e_67ea404e_fornum_L000605_609 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g38_67ea404e_exp1_L000587 ' CALL addrg
 jmp #JMPA
 long @C_sg1g3e_67ea404e_fornum_L000605_610 ' JUMPV addrg
C_sg1g3e_67ea404e_fornum_L000605_609
 mov r2, #1 ' reg ARG coni
 mov r22, r17
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
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
C_sg1g3e_67ea404e_fornum_L000605_610
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110
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
 long @C_sg1g3b_67ea404e_forbody_L000597
 add SP, #16 ' CALL addrg
' C_sg1g3e_67ea404e_fornum_L000605_606 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3g_67ea404e_forlist_L000611 ' <symbol:forlist>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r19, #5 ' reg <- coni
 mov r22, r17
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_sg1g3e_67ea404e_fornum_L000605_607_L000608
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
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_sg1g3e_67ea404e_fornum_L000605_607_L000608
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
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_sg1g3e_67ea404e_fornum_L000605_607_L000608
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
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, #11 ' reg ARG coni
 jmp #LODL
 long @C_sg1g3e_67ea404e_fornum_L000605_607_L000608
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
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g3g_67ea404e_forlist_L000611_614 ' JUMPV addrg
C_sg1g3g_67ea404e_forlist_L000611_613
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 adds r19, #1 ' ADDI4 coni
C_sg1g3g_67ea404e_forlist_L000611_614
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg1g3g_67ea404e_forlist_L000611_613 ' NEI4
 mov r2, #267 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2c_67ea404e_explist_L000376
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
 long @C_sg1g16_67ea404e_adjust_assign_L000178
 add SP, #12 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g13_67ea404e_marktobeclosed_L000159 ' CALL addrg
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
 long @C_sg1g3b_67ea404e_forbody_L000597
 add SP, #16 ' CALL addrg
' C_sg1g3g_67ea404e_forlist_L000611_612 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3h_67ea404e_forstat_L000616 ' <symbol:forstat>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
 mov r22, #61 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_sg1g3h_67ea404e_forstat_L000616_621 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_sg1g3h_67ea404e_forstat_L000616_626 ' GTI4
' C_sg1g3h_67ea404e_forstat_L000616_625 ' (symbol refcount = 0)
 cmps r17,  #44 wz
 jmp #BR_Z
 long @C_sg1g3h_67ea404e_forstat_L000616_622 ' EQI4
 jmp #JMPA
 long @C_sg1g3h_67ea404e_forstat_L000616_618 ' JUMPV addrg
C_sg1g3h_67ea404e_forstat_L000616_626
 cmps r17,  #267 wz
 jmp #BR_Z
 long @C_sg1g3h_67ea404e_forstat_L000616_622 ' EQI4
 jmp #JMPA
 long @C_sg1g3h_67ea404e_forstat_L000616_618 ' JUMPV addrg
C_sg1g3h_67ea404e_forstat_L000616_621
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g3e_67ea404e_fornum_L000605
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g3h_67ea404e_forstat_L000616_619 ' JUMPV addrg
C_sg1g3h_67ea404e_forstat_L000616_622
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g3g_67ea404e_forlist_L000611
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g3h_67ea404e_forstat_L000616_619 ' JUMPV addrg
C_sg1g3h_67ea404e_forstat_L000616_618
 jmp #LODL
 long @C_sg1g3h_67ea404e_forstat_L000616_623_L000624
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sg1g3h_67ea404e_forstat_L000616_619
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #263 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gc_67ea404e_check_match_L000051
 add SP, #12 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
' C_sg1g3h_67ea404e_forstat_L000616_617 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3j_67ea404e_test_then_block_L000627 ' <symbol:test_then_block>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g1_67ea404e_expr_L000021
 add SP, #4 ' CALL addrg
 mov r2, #274 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #257 wz
 jmp #BRNZ
 long @C_sg1g3j_67ea404e_test_then_block_L000627_629 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long @C_sg1g1i_67ea404e_undefgoto_L000243_247_L000248
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g1d_67ea404e_newgotoentry_L000215
 add SP, #12 ' CALL addrg
C_sg1g3j_67ea404e_test_then_block_L000627_632
' C_sg1g3j_67ea404e_test_then_block_L000627_633 ' (symbol refcount = 0)
 mov r2, #59 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg1g3j_67ea404e_test_then_block_L000627_632 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1s_67ea404e_block_follow_L000284
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g3j_67ea404e_test_then_block_L000627_635 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
 jmp #JMPA
 long @C_sg1g3j_67ea404e_test_then_block_L000627_628 ' JUMPV addrg
C_sg1g3j_67ea404e_test_then_block_L000627_635
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sg1g3j_67ea404e_test_then_block_L000627_630 ' JUMPV addrg
C_sg1g3j_67ea404e_test_then_block_L000627_629
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g1h_67ea404e_enterblock_L000238
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
C_sg1g3j_67ea404e_test_then_block_L000627_630
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1t_67ea404e_statlist_L000293 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1m_67ea404e_leaveblock_L000253 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #259 wz
 jmp #BR_Z
 long @C_sg1g3j_67ea404e_test_then_block_L000627_640 ' EQI4
 cmps r22,  #260 wz
 jmp #BRNZ
 long @C_sg1g3j_67ea404e_test_then_block_L000627_638 ' NEI4
C_sg1g3j_67ea404e_test_then_block_L000627_640
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
C_sg1g3j_67ea404e_test_then_block_L000627_638
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
C_sg1g3j_67ea404e_test_then_block_L000627_628
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3k_67ea404e_ifstat_L000641 ' <symbol:ifstat>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g3j_67ea404e_test_then_block_L000627
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g3k_67ea404e_ifstat_L000641_644 ' JUMPV addrg
C_sg1g3k_67ea404e_ifstat_L000641_643
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g3j_67ea404e_test_then_block_L000627
 add SP, #4 ' CALL addrg
C_sg1g3k_67ea404e_ifstat_L000641_644
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #260 wz
 jmp #BR_Z
 long @C_sg1g3k_67ea404e_ifstat_L000641_643 ' EQI4
 mov r2, #259 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g3k_67ea404e_ifstat_L000641_646 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g2s_67ea404e_block_L000515 ' CALL addrg
C_sg1g3k_67ea404e_ifstat_L000641_646
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #266 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gc_67ea404e_check_match_L000051
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
' C_sg1g3k_67ea404e_ifstat_L000641_642 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3l_67ea404e_localfunc_L000648 ' <symbol:localfunc>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #50 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, #0 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2a_67ea404e_body_L000370
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gn_67ea404e_localdebuginfo_L000088
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
' C_sg1g3l_67ea404e_localfunc_L000648_649 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3m_67ea404e_getlocalattribute_L000650 ' <symbol:getlocalattribute>
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
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650_652 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 mov r22, r0
 adds r22, #16 ' ADDP4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, #62 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gb_67ea404e_checknext_L000049
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650_656_L000657
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
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650_654 ' NEI4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650_651 ' JUMPV addrg
C_sg1g3m_67ea404e_getlocalattribute_L000650_654
 jmp #LODL
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650_660_L000661
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
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650_658 ' NEI4
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650_651 ' JUMPV addrg
C_sg1g3m_67ea404e_getlocalattribute_L000650_658
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650_662_L000663
 mov r3, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
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
C_sg1g3m_67ea404e_getlocalattribute_L000650_652
 mov r0, #0 ' RET coni
C_sg1g3m_67ea404e_getlocalattribute_L000650_651
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3q_67ea404e_checktoclose_L000664 ' <symbol:checktoclose>
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
 long @C_sg1g3q_67ea404e_checktoclose_L000664_666 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g13_67ea404e_marktobeclosed_L000159 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gm_67ea404e_reglevel_L000080
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
C_sg1g3q_67ea404e_checktoclose_L000664_666
' C_sg1g3q_67ea404e_checktoclose_L000664_665 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sg1g3r_67ea404e_localstat_L000668 ' <symbol:localstat>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -1
 mov r13, RI ' reg <- con
 mov r15, #0 ' reg <- coni
C_sg1g3r_67ea404e_localstat_L000668_670
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gk_67ea404e_new_localvar_L000076
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g3m_67ea404e_getlocalattribute_L000650 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 mov r22, r0
 adds r22, #5 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r21,  #2 wz
 jmp #BRNZ
 long @C_sg1g3r_67ea404e_localstat_L000668_673 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r13, r22 wz
 jmp #BR_Z
 long @C_sg1g3r_67ea404e_localstat_L000668_675 ' EQI4
 jmp #LODL
 long @C_sg1g3r_67ea404e_localstat_L000668_677_L000678
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__semerror
 add SP, #4 ' CALL addrg
C_sg1g3r_67ea404e_localstat_L000668_675
 mov r22, r17
 adds r22, #50 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r13, r22 ' ADDI/P
 adds r13, r15 ' ADDI/P (3)
C_sg1g3r_67ea404e_localstat_L000668_673
 adds r15, #1 ' ADDI4 coni
' C_sg1g3r_67ea404e_localstat_L000668_671 ' (symbol refcount = 0)
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg1g3r_67ea404e_localstat_L000668_670 ' NEI4
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g3r_67ea404e_localstat_L000668_679 ' EQI4
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2c_67ea404e_explist_L000376
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sg1g3r_67ea404e_localstat_L000668_680 ' JUMPV addrg
C_sg1g3r_67ea404e_localstat_L000668_679
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_sg1g3r_67ea404e_localstat_L000668_680
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gl_67ea404e_getlocalvardesc_L000078
 add SP, #4 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_sg1g3r_67ea404e_localstat_L000668_681 ' NEI4
 mov r22, r11
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_sg1g3r_67ea404e_localstat_L000668_681 ' NEI4
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
 long @C_sg1g3r_67ea404e_localstat_L000668_681 ' EQI4
 mov r22, r11
 adds r22, #5 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r15
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #50 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sg1g3r_67ea404e_localstat_L000668_682 ' JUMPV addrg
C_sg1g3r_67ea404e_localstat_L000668_681
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
 long @C_sg1g16_67ea404e_adjust_assign_L000178
 add SP, #12 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gr_67ea404e_adjustlocalvars_L000110
 add SP, #4 ' CALL addrg
C_sg1g3r_67ea404e_localstat_L000668_682
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g3q_67ea404e_checktoclose_L000664
 add SP, #4 ' CALL addrg
' C_sg1g3r_67ea404e_localstat_L000668_669 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3t_67ea404e_funcname_L000683 ' <symbol:funcname>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g15_67ea404e_singlevar_L000174
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g3t_67ea404e_funcname_L000683_686 ' JUMPV addrg
C_sg1g3t_67ea404e_funcname_L000683_685
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1u_67ea404e_fieldsel_L000300
 add SP, #4 ' CALL addrg
C_sg1g3t_67ea404e_funcname_L000683_686
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #46 wz
 jmp #BR_Z
 long @C_sg1g3t_67ea404e_funcname_L000683_685 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #58 wz
 jmp #BRNZ
 long @C_sg1g3t_67ea404e_funcname_L000683_688 ' NEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1u_67ea404e_fieldsel_L000300
 add SP, #4 ' CALL addrg
C_sg1g3t_67ea404e_funcname_L000683_688
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_sg1g3t_67ea404e_funcname_L000683_684 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3u_67ea404e_funcstat_L000690 ' <symbol:funcstat>
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
 long @C_sg1g3t_67ea404e_funcname_L000683
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNI4 addrl reg
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
 long @C_sg1g2a_67ea404e_body_L000370
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gp_67ea404e_check_readonly_L000094
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__storevar
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
' C_sg1g3u_67ea404e_funcstat_L000690_691 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #36 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g3v_67ea404e_exprstat_L000692 ' <symbol:exprstat>
 jmp #NEWF
 sub SP, #28
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2h_67ea404e_suffixedexp_L000413
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #61 wz
 jmp #BR_Z
 long @C_sg1g3v_67ea404e_exprstat_L000692_697 ' EQI4
 cmps r22,  #44 wz
 jmp #BRNZ
 long @C_sg1g3v_67ea404e_exprstat_L000692_695 ' NEI4
C_sg1g3v_67ea404e_exprstat_L000692_697
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2u_67ea404e_restassign_L000537
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g3v_67ea404e_exprstat_L000692_696 ' JUMPV addrg
C_sg1g3v_67ea404e_exprstat_L000692_695
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_sg1g3v_67ea404e_exprstat_L000692_698 ' EQI4
 jmp #LODL
 long @C_sg1g2u_67ea404e_restassign_L000537_542_L000543
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sg1g3v_67ea404e_exprstat_L000692_698
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 jmp #LODL
 long $1000000
 mov r18, RI ' reg <- con
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_sg1g3v_67ea404e_exprstat_L000692_696
' C_sg1g3v_67ea404e_exprstat_L000692_693 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #28 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g40_67ea404e_retstat_L000703 ' <symbol:retstat>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g1s_67ea404e_block_follow_L000284
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sg1g40_67ea404e_retstat_L000703_707 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #59 wz
 jmp #BRNZ
 long @C_sg1g40_67ea404e_retstat_L000703_705 ' NEI4
C_sg1g40_67ea404e_retstat_L000703_707
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sg1g40_67ea404e_retstat_L000703_706 ' JUMPV addrg
C_sg1g40_67ea404e_retstat_L000703_705
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g2c_67ea404e_explist_L000376
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BR_Z
 long @C_sg1g40_67ea404e_retstat_L000703_710 ' EQI4
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_sg1g40_67ea404e_retstat_L000703_708 ' NEI4
C_sg1g40_67ea404e_retstat_L000703_710
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
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BRNZ
 long @C_sg1g40_67ea404e_retstat_L000703_711 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_sg1g40_67ea404e_retstat_L000703_711 ' NEI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #15 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sg1g40_67ea404e_retstat_L000703_711 ' NEI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 adds r20, r22 ' ADDI/P (1)
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #2 ' LSHI4 coni
 adds r22, r18 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff80
 mov r18, RI ' reg <- con
 and r22, r18 ' BANDI/U (1)
 or r22, #69 ' BORU4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
C_sg1g40_67ea404e_retstat_L000703_711
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sg1g40_67ea404e_retstat_L000703_709 ' JUMPV addrg
C_sg1g40_67ea404e_retstat_L000703_708
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_sg1g40_67ea404e_retstat_L000703_715 ' NEI4
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_sg1g40_67ea404e_retstat_L000703_716 ' JUMPV addrg
C_sg1g40_67ea404e_retstat_L000703_715
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
C_sg1g40_67ea404e_retstat_L000703_716
C_sg1g40_67ea404e_retstat_L000703_709
C_sg1g40_67ea404e_retstat_L000703_706
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
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
' C_sg1g40_67ea404e_retstat_L000703_704 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g_67ea404e_statement_L000020 ' <symbol:statement>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaE__incC_stack ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRI4 reg
 cmps r21,  #257 wz,wc
 jmp #BR_B
 long @C_sg1g_67ea404e_statement_L000020_735 ' LTI4
 cmps r21,  #273 wz,wc
 jmp #BR_A
 long @C_sg1g_67ea404e_statement_L000020_736 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sg1g_67ea404e_statement_L000020_737_L000739-1028
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg1g_67ea404e_statement_L000020_737_L000739 ' <symbol:737>
 long @C_sg1g_67ea404e_statement_L000020_733
 long @C_sg1g_67ea404e_statement_L000020_724
 long @C_sg1g_67ea404e_statement_L000020_718
 long @C_sg1g_67ea404e_statement_L000020_718
 long @C_sg1g_67ea404e_statement_L000020_718
 long @C_sg1g_67ea404e_statement_L000020_718
 long @C_sg1g_67ea404e_statement_L000020_725
 long @C_sg1g_67ea404e_statement_L000020_727
 long @C_sg1g_67ea404e_statement_L000020_734
 long @C_sg1g_67ea404e_statement_L000020_722
 long @C_sg1g_67ea404e_statement_L000020_718
 long @C_sg1g_67ea404e_statement_L000020_728
 long @C_sg1g_67ea404e_statement_L000020_718
 long @C_sg1g_67ea404e_statement_L000020_718
 long @C_sg1g_67ea404e_statement_L000020_718
 long @C_sg1g_67ea404e_statement_L000020_726
 long @C_sg1g_67ea404e_statement_L000020_732

' Catalina Code

DAT ' code segment
C_sg1g_67ea404e_statement_L000020_735
 cmps r21,  #59 wz
 jmp #BR_Z
 long @C_sg1g_67ea404e_statement_L000020_721 ' EQI4
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_718 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_736
 mov r22, #277 ' reg <- coni
 cmps r21, r22 wz
 jmp #BR_Z
 long @C_sg1g_67ea404e_statement_L000020_723 ' EQI4
 cmps r21, r22 wz,wc
 jmp #BR_B
 long @C_sg1g_67ea404e_statement_L000020_718 ' LTI4
' C_sg1g_67ea404e_statement_L000020_741 ' (symbol refcount = 0)
 cmps r21,  #287 wz
 jmp #BR_Z
 long @C_sg1g_67ea404e_statement_L000020_731 ' EQI4
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_718 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_721
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_722
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g3k_67ea404e_ifstat_L000641
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_723
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g36_67ea404e_whilestat_L000579
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_724
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g2s_67ea404e_block_L000515 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #258 ' reg ARG coni
 mov r4, #261 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1gc_67ea404e_check_match_L000051
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_725
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g3h_67ea404e_forstat_L000616
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_726
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g37_67ea404e_repeatstat_L000581
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_727
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g3u_67ea404e_funcstat_L000690
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_728
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, #264 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g9_67ea404e_testnext_L000041
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sg1g_67ea404e_statement_L000020_729 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g3l_67ea404e_localfunc_L000648 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_729
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g3r_67ea404e_localstat_L000668 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_731
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1ge_67ea404e_str_checkname_L000059 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g35_67ea404e_labelstat_L000574
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_732
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g40_67ea404e_retstat_L000703 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_733
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g32_67ea404e_breakstat_L000566 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_734
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g31_67ea404e_gotostat_L000560 ' CALL addrg
 jmp #JMPA
 long @C_sg1g_67ea404e_statement_L000020_719 ' JUMPV addrg
C_sg1g_67ea404e_statement_L000020_718
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g3v_67ea404e_exprstat_L000692 ' CALL addrg
C_sg1g_67ea404e_statement_L000020_719
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 adds r22, #52 ' ADDP4 coni
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_sg1g_67ea404e_statement_L000020_717 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sg1g43_67ea404e_mainfunc_L000742 ' <symbol:mainfunc>
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
 long @C_sg1g1q_67ea404e_open_func_L000276
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1g27_67ea404e_setvararg_L000350
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1gu_67ea404e_allocupvalue_L000131 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r19 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 rdlong r20, r21 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g43_67ea404e_mainfunc_L000742_745 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sg1g43_67ea404e_mainfunc_L000742_745 ' EQI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sg1g43_67ea404e_mainfunc_L000742_745 ' JUMPV addrg
C_sg1g43_67ea404e_mainfunc_L000742_745
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaX__next ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1t_67ea404e_statlist_L000293 ' CALL addrg
 mov r2, #288 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sg1ga_67ea404e_check_L000045
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sg1g1r_67ea404e_close_func_L000280 ' CALL addrg
' C_sg1g43_67ea404e_mainfunc_L000742_743 ' (symbol refcount = 0)
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
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -124
 wrlong r15, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r13 ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #70 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
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
 jmp #LODF
 long -76
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -124
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-124) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r13 ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
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
 wrlong r0, r20 ' ASGNP4 reg reg
 jmp #LODF
 long -60
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 mov r20, r15
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaY__parser_750 ' EQI4
 mov r20, r15
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaY__parser_750 ' EQI4
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
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
 long @C_luaY__parser_750 ' JUMPV addrg
C_luaY__parser_750
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
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #76 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaY__parser_752 ' EQI4
 adds r22, #76 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaY__parser_752 ' EQI4
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #76 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRP4 reg
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
 long @C_luaY__parser_752 ' JUMPV addrg
C_luaY__parser_752
 jmp #LODF
 long -80
 wrlong r23, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -72
 wrlong r21, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #76 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
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
 long @C_sg1g43_67ea404e_mainfunc_L000742
 add SP, #4 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaY__parser_746 ' (symbol refcount = 0)
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
C_sg1g3r_67ea404e_localstat_L000668_677_L000678 ' <symbol:677>
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
C_sg1g3m_67ea404e_getlocalattribute_L000650_662_L000663 ' <symbol:662>
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
C_sg1g3m_67ea404e_getlocalattribute_L000650_660_L000661 ' <symbol:660>
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_sg1g3m_67ea404e_getlocalattribute_L000650_656_L000657 ' <symbol:656>
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_sg1g3h_67ea404e_forstat_L000616_623_L000624 ' <symbol:623>
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
C_sg1g3e_67ea404e_fornum_L000605_607_L000608 ' <symbol:607>
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
C_sg1g39_67ea404e_fixforjump_L000589_595_L000596 ' <symbol:595>
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
C_sg1g33_67ea404e_checkrepeated_L000568_572_L000573 ' <symbol:572>
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
C_sg1g2u_67ea404e_restassign_L000537_542_L000543 ' <symbol:542>
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
C_sg1g2i_67ea404e_simpleexp_L000431_445_L000446 ' <symbol:445>
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
C_sg1g2f_67ea404e_primaryexp_L000403_410_L000411 ' <symbol:410>
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
C_sg1g2d_67ea404e_funcargs_L000381_394_L000395 ' <symbol:394>
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
C_sg1g2a_67ea404e_body_L000370_374_L000375 ' <symbol:374>
 byte 115
 byte 101
 byte 108
 byte 102
 byte 0

 alignl ' align long
C_sg1g28_67ea404e_parlist_L000352_364_L000365 ' <symbol:364>
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
C_sg1g20_67ea404e_recfield_L000304_308_L000309 ' <symbol:308>
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
C_sg1g1n_67ea404e_addprototype_L000263_267_L000268 ' <symbol:267>
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
C_sg1g1i_67ea404e_undefgoto_L000243_251_L000252 ' <symbol:251>
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
C_sg1g1i_67ea404e_undefgoto_L000243_249_L000250 ' <symbol:249>
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
C_sg1g1i_67ea404e_undefgoto_L000243_247_L000248 ' <symbol:247>
 byte 98
 byte 114
 byte 101
 byte 97
 byte 107
 byte 0

 alignl ' align long
C_sg1g1b_67ea404e_newlabelentry_L000211_213_L000214 ' <symbol:213>
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
C_sg1g17_67ea404e_jumpscopeerror_L000191_193_L000194 ' <symbol:193>
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
C_sg1gu_67ea404e_allocupvalue_L000131_133_L000134 ' <symbol:133>
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
C_sg1gp_67ea404e_check_readonly_L000094_108_L000109 ' <symbol:108>
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
C_sg1gi_67ea404e_registerlocalvar_L000067_69_L000070 ' <symbol:69>
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
C_sg1gc_67ea404e_check_match_L000051_57_L000058 ' <symbol:57>
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
C_sg1g4_67ea404e_errorlimit_L000026_35_L000036 ' <symbol:35>
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
C_sg1g4_67ea404e_errorlimit_L000026_30_L000031 ' <symbol:30>
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
C_sg1g4_67ea404e_errorlimit_L000026_28_L000029 ' <symbol:28>
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
C_sg1g2_67ea404e_error_expected_L000022_24_L000025 ' <symbol:24>
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
