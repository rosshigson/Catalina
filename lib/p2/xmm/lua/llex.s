' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s77g_670edbcb_luaX__tokens_L000019 ' <symbol:luaX_tokens>
 long @C_s77g1_670edbcb_20_L000021
 long @C_s77g2_670edbcb_22_L000023
 long @C_s77g3_670edbcb_24_L000025
 long @C_s77g4_670edbcb_26_L000027
 long @C_s77g5_670edbcb_28_L000029
 long @C_s77g6_670edbcb_30_L000031
 long @C_s77g7_670edbcb_32_L000033
 long @C_s77g8_670edbcb_34_L000035
 long @C_s77g9_670edbcb_36_L000037
 long @C_s77ga_670edbcb_38_L000039
 long @C_s77gb_670edbcb_40_L000041
 long @C_s77gc_670edbcb_42_L000043
 long @C_s77gd_670edbcb_44_L000045
 long @C_s77ge_670edbcb_46_L000047
 long @C_s77gf_670edbcb_48_L000049
 long @C_s77gg_670edbcb_50_L000051
 long @C_s77gh_670edbcb_52_L000053
 long @C_s77gi_670edbcb_54_L000055
 long @C_s77gj_670edbcb_56_L000057
 long @C_s77gk_670edbcb_58_L000059
 long @C_s77gl_670edbcb_60_L000061
 long @C_s77gm_670edbcb_62_L000063
 long @C_s77gn_670edbcb_64_L000065
 long @C_s77go_670edbcb_66_L000067
 long @C_s77gp_670edbcb_68_L000069
 long @C_s77gq_670edbcb_70_L000071
 long @C_s77gr_670edbcb_72_L000073
 long @C_s77gs_670edbcb_74_L000075
 long @C_s77gt_670edbcb_76_L000077
 long @C_s77gu_670edbcb_78_L000079
 long @C_s77gv_670edbcb_80_L000081
 long @C_s77g10_670edbcb_82_L000083
 long @C_s77g11_670edbcb_84_L000085
 long @C_s77g12_670edbcb_86_L000087
 long @C_s77g13_670edbcb_88_L000089
 long @C_s77g14_670edbcb_90_L000091
 long @C_s77g15_670edbcb_92_L000093

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s77g17_670edbcb_save_L000095 ' <symbol:save>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_s77g17_670edbcb_save_L000095_97 ' LEU4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $3fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_s77g17_670edbcb_save_L000095_99' LTU4
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_s77g17_670edbcb_save_L000095_101_L000102
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
C_s77g17_670edbcb_save_L000095_99
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 shl r20, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 regl
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r0 ' CVI, CVU or LOAD
 mov RI, r19
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__saferealloc_
 add SP, #12 ' CALL addrg
 mov RI, r19
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_s77g17_670edbcb_save_L000095_97
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 add r18, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 mov r20, r21 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s77g17_670edbcb_save_L000095_96 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaX_init

 alignl ' align long
C_luaX__init ' <symbol:luaX_init>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #4 ' reg ARG coni
 jmp #LODL
 long @C_luaX__init_104_L000105
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
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
 long @C_luaC__fix
 add SP, #4 ' CALL addrg
 mov r21, #0 ' reg <- coni
C_luaX__init_106
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s77g_670edbcb_luaX__tokens_L000019
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__fix
 add SP, #4 ' CALL addrg
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov r20, r21
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaX__init_107 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #22 wz,wc
 jmp #BR_B
 long @C_luaX__init_106 ' LTI4
' C_luaX__init_103 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaX_token2str

 alignl ' align long
C_luaX__token2str ' <symbol:luaX_token2str>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #256 wz,wc
 jmp #BRAE
 long @C_luaX__token2str_111 ' GEI4
 jmp #LODL
 long @C_luai_ctype_+1
 mov r22, RI ' reg <- addrg
 adds r22, r21 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaX__token2str_113 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaX__token2str_116_L000117
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
 jmp #JMPA
 long @C_luaX__token2str_110 ' JUMPV addrg
C_luaX__token2str_113
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_luaX__token2str_118_L000119
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
 jmp #JMPA
 long @C_luaX__token2str_110 ' JUMPV addrg
C_luaX__token2str_111
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s77g_670edbcb_luaX__tokens_L000019-1024
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmps r21,  #288 wz,wc
 jmp #BRAE
 long @C_luaX__token2str_121 ' GEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_luaX__token2str_123_L000124
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
 jmp #JMPA
 long @C_luaX__token2str_110 ' JUMPV addrg
C_luaX__token2str_121
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
C_luaX__token2str_110
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s77g1d_670edbcb_txtT_oken_L000125 ' <symbol:txtToken>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #289 wz,wc
 jmp #BR_B
 long @C_s77g1d_670edbcb_txtT_oken_L000125_127 ' LTI4
 cmps r21,  #292 wz,wc
 jmp #BR_A
 long @C_s77g1d_670edbcb_txtT_oken_L000125_127 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s77g1d_670edbcb_txtT_oken_L000125_130_L000132-1156
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s77g1d_670edbcb_txtT_oken_L000125_130_L000132 ' <symbol:130>
 long @C_s77g1d_670edbcb_txtT_oken_L000125_129
 long @C_s77g1d_670edbcb_txtT_oken_L000125_129
 long @C_s77g1d_670edbcb_txtT_oken_L000125_129
 long @C_s77g1d_670edbcb_txtT_oken_L000125_129

' Catalina Code

DAT ' code segment
C_s77g1d_670edbcb_txtT_oken_L000125_129
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_luaX__token2str_123_L000124
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
 jmp #JMPA
 long @C_s77g1d_670edbcb_txtT_oken_L000125_126 ' JUMPV addrg
C_s77g1d_670edbcb_txtT_oken_L000125_127
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__token2str
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s77g1d_670edbcb_txtT_oken_L000125_126
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g16_670edbcb_lexerror_L000094 ' <symbol:lexerror>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__addinfo
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_s77g16_670edbcb_lexerror_L000094_135 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1d_670edbcb_txtT_oken_L000125
 add SP, #4 ' CALL addrg
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s77g16_670edbcb_lexerror_L000094_137_L000138
 mov r4, RI ' reg ARG ADDRG
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
C_s77g16_670edbcb_lexerror_L000094_135
 mov r2, #3 ' reg ARG coni
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
' C_s77g16_670edbcb_lexerror_L000094_134 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaX_syntaxerror

 alignl ' align long
C_luaX__syntaxerror ' <symbol:luaX_syntaxerror>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
' C_luaX__syntaxerror_139 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaX_newstring

 alignl ' align long
C_luaX__newstring ' <symbol:luaX_newstring>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getstr
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaX__newstring_141 ' EQI4
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaX__newstring_142 ' JUMPV addrg
C_luaX__newstring_141
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
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
 long @C_luaX__newstring_143 ' LEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_luaX__newstring_143
 mov r22, r17
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
C_luaX__newstring_142
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaX__newstring_140 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s77g1h_670edbcb_inclinenumber_L000145 ' <symbol:inclinenumber>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1h_670edbcb_inclinenumber_L000145_148 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1h_670edbcb_inclinenumber_L000145_149 ' JUMPV addrg
C_s77g1h_670edbcb_inclinenumber_L000145_148
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
C_s77g1h_670edbcb_inclinenumber_L000145_149
 mov RI, r23
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_s77g1h_670edbcb_inclinenumber_L000145_152 ' EQI4
 cmps r22,  #13 wz
 jmp #BRNZ
 long @C_s77g1h_670edbcb_inclinenumber_L000145_150 ' NEI4
C_s77g1h_670edbcb_inclinenumber_L000145_152
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_s77g1h_670edbcb_inclinenumber_L000145_150 ' EQI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1h_670edbcb_inclinenumber_L000145_154 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1h_670edbcb_inclinenumber_L000145_155 ' JUMPV addrg
C_s77g1h_670edbcb_inclinenumber_L000145_154
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_s77g1h_670edbcb_inclinenumber_L000145_155
 mov RI, r23
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
C_s77g1h_670edbcb_inclinenumber_L000145_150
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long 2147483647
 mov r22, RI ' reg <- con
 cmps r20, r22 wz,wc
 jmp #BR_B
 long @C_s77g1h_670edbcb_inclinenumber_L000145_156 ' LTI4
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_s77g1h_670edbcb_inclinenumber_L000145_158_L000159
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
C_s77g1h_670edbcb_inclinenumber_L000145_156
' C_s77g1h_670edbcb_inclinenumber_L000145_146 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaX_setinput

 alignl ' align long
C_luaX__setinput ' <symbol:luaX_setinput>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #288 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #4 ' reg ARG coni
 jmp #LODL
 long @C_luaX__init_104_L000105
 mov r3, RI ' reg ARG ADDRG
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r20, r23
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #32 ' reg ARG coni
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, #1 ' reg <- coni
 mov r18, r22
 adds r18, #8 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r0 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__saferealloc_
 add SP, #12 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_luaX__setinput_160 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g1j_670edbcb_check_next1_L000161 ' <symbol:check_next1>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_s77g1j_670edbcb_check_next1_L000161_163 ' NEI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1j_670edbcb_check_next1_L000161_166 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1j_670edbcb_check_next1_L000161_167 ' JUMPV addrg
C_s77g1j_670edbcb_check_next1_L000161_166
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_s77g1j_670edbcb_check_next1_L000161_167
 mov RI, r23
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s77g1j_670edbcb_check_next1_L000161_162 ' JUMPV addrg
C_s77g1j_670edbcb_check_next1_L000161_163
 mov r0, #0 ' reg <- coni
C_s77g1j_670edbcb_check_next1_L000161_162
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g1k_670edbcb_check_next2_L000168 ' <symbol:check_next2>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r21
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_s77g1k_670edbcb_check_next2_L000168_172 ' EQI4
 mov r20, r21
 adds r20, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s77g1k_670edbcb_check_next2_L000168_170 ' NEI4
C_s77g1k_670edbcb_check_next2_L000168_172
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1k_670edbcb_check_next2_L000168_174 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1k_670edbcb_check_next2_L000168_175 ' JUMPV addrg
C_s77g1k_670edbcb_check_next2_L000168_174
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_s77g1k_670edbcb_check_next2_L000168_175
 mov RI, r23
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_s77g1k_670edbcb_check_next2_L000168_169 ' JUMPV addrg
C_s77g1k_670edbcb_check_next2_L000168_170
 mov r0, #0 ' reg <- coni
C_s77g1k_670edbcb_check_next2_L000168_169
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g1l_670edbcb_read_numeral_L000176 ' <symbol:read_numeral>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s77g1l_670edbcb_read_numeral_L000176_178_L000179
 mov r19, RI ' reg <- addrg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1l_670edbcb_read_numeral_L000176_181 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1l_670edbcb_read_numeral_L000176_182 ' JUMPV addrg
C_s77g1l_670edbcb_read_numeral_L000176_181
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g1l_670edbcb_read_numeral_L000176_182
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #48 wz
 jmp #BRNZ
 long @C_s77g1l_670edbcb_read_numeral_L000176_183 ' NEI4
 jmp #LODL
 long @C_s77g1l_670edbcb_read_numeral_L000176_185_L000186
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1k_670edbcb_check_next2_L000168
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g1l_670edbcb_read_numeral_L000176_183 ' EQI4
 jmp #LODL
 long @C_s77g1l_670edbcb_read_numeral_L000176_187_L000188
 mov r19, RI ' reg <- addrg
C_s77g1l_670edbcb_read_numeral_L000176_183
C_s77g1l_670edbcb_read_numeral_L000176_189
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1k_670edbcb_check_next2_L000168
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g1l_670edbcb_read_numeral_L000176_193 ' EQI4
 jmp #LODL
 long @C_s77g1l_670edbcb_read_numeral_L000176_195_L000196
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1k_670edbcb_check_next2_L000168
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s77g1l_670edbcb_read_numeral_L000176_189 ' JUMPV addrg
C_s77g1l_670edbcb_read_numeral_L000176_193
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #16 ' BANDI4 coni
 cmps r20,  #0 wz
 jmp #BRNZ
 long @C_s77g1l_670edbcb_read_numeral_L000176_200 ' NEI4
 cmps r22,  #46 wz
 jmp #BRNZ
 long @C_s77g1l_670edbcb_read_numeral_L000176_191 ' NEI4
C_s77g1l_670edbcb_read_numeral_L000176_200
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1l_670edbcb_read_numeral_L000176_202 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1l_670edbcb_read_numeral_L000176_203 ' JUMPV addrg
C_s77g1l_670edbcb_read_numeral_L000176_202
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_s77g1l_670edbcb_read_numeral_L000176_203
 mov RI, r23
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s77g1l_670edbcb_read_numeral_L000176_189 ' JUMPV addrg
C_s77g1l_670edbcb_read_numeral_L000176_191
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s77g1l_670edbcb_read_numeral_L000176_204 ' EQI4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1l_670edbcb_read_numeral_L000176_208 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1l_670edbcb_read_numeral_L000176_209 ' JUMPV addrg
C_s77g1l_670edbcb_read_numeral_L000176_208
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_s77g1l_670edbcb_read_numeral_L000176_209
 mov RI, r23
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
C_s77g1l_670edbcb_read_numeral_L000176_204
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__str2num
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BRNZ
 long @C_s77g1l_670edbcb_read_numeral_L000176_210 ' NEU4
 mov r2, #289 ' reg ARG coni
 jmp #LODL
 long @C_s77g1l_670edbcb_read_numeral_L000176_212_L000213
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
C_s77g1l_670edbcb_read_numeral_L000176_210
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s77g1l_670edbcb_read_numeral_L000176_214 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #290 ' reg <- coni
 jmp #JMPA
 long @C_s77g1l_670edbcb_read_numeral_L000176_177 ' JUMPV addrg
C_s77g1l_670edbcb_read_numeral_L000176_214
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNF4 reg reg
 mov r0, #289 ' reg <- coni
C_s77g1l_670edbcb_read_numeral_L000176_177
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s77g1r_670edbcb_skip_sep_L000217 ' <symbol:skip_sep>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1r_670edbcb_skip_sep_L000217_220 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1r_670edbcb_skip_sep_L000217_221 ' JUMPV addrg
C_s77g1r_670edbcb_skip_sep_L000217_220
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_s77g1r_670edbcb_skip_sep_L000217_221
 mov RI, r23
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s77g1r_670edbcb_skip_sep_L000217_223 ' JUMPV addrg
C_s77g1r_670edbcb_skip_sep_L000217_222
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1r_670edbcb_skip_sep_L000217_226 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1r_670edbcb_skip_sep_L000217_227 ' JUMPV addrg
C_s77g1r_670edbcb_skip_sep_L000217_226
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g1r_670edbcb_skip_sep_L000217_227
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 add r21, #1 ' ADDU4 coni
C_s77g1r_670edbcb_skip_sep_L000217_223
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #61 wz
 jmp #BR_Z
 long @C_s77g1r_670edbcb_skip_sep_L000217_222 ' EQI4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s77g1r_670edbcb_skip_sep_L000217_230 ' NEI4
 mov r17, r21
 add r17, #2 ' ADDU4 coni
 jmp #JMPA
 long @C_s77g1r_670edbcb_skip_sep_L000217_231 ' JUMPV addrg
C_s77g1r_670edbcb_skip_sep_L000217_230
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_s77g1r_670edbcb_skip_sep_L000217_232 ' NEU4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s77g1r_670edbcb_skip_sep_L000217_233 ' JUMPV addrg
C_s77g1r_670edbcb_skip_sep_L000217_232
 mov r15, #0 ' reg <- coni
C_s77g1r_670edbcb_skip_sep_L000217_233
 mov r17, r15 ' CVI, CVU or LOAD
C_s77g1r_670edbcb_skip_sep_L000217_231
 mov r0, r17 ' CVI, CVU or LOAD
' C_s77g1r_670edbcb_skip_sep_L000217_218 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s77g1s_670edbcb_read_long_string_L000234 ' <symbol:read_long_string>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_237 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_238 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_237
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g1s_670edbcb_read_long_string_L000234_238
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_241 ' EQI4
 cmps r22,  #13 wz
 jmp #BRNZ
 long @C_s77g1s_670edbcb_read_long_string_L000234_239 ' NEI4
C_s77g1s_670edbcb_read_long_string_L000234_241
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g1h_670edbcb_inclinenumber_L000145 ' CALL addrg
C_s77g1s_670edbcb_read_long_string_L000234_239
C_s77g1s_670edbcb_read_long_string_L000234_242
 mov RI, r23
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 cmps r15,  #10 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_266 ' EQI4
 mov r22, #13 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_266 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_A
 long @C_s77g1s_670edbcb_read_long_string_L000234_278 ' GTI4
' C_s77g1s_670edbcb_read_long_string_L000234_277 ' (symbol refcount = 0)
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_249 ' EQI4
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_246 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_278
 cmps r15,  #93 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_259 ' EQI4
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_246 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_249
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_255 ' EQU4
 jmp #LODL
 long @C_s77g1s_670edbcb_read_long_string_L000234_250_L000251
 mov r13, RI ' reg <- addrg
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_256 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_255
 jmp #LODL
 long @C_s77g1s_670edbcb_read_long_string_L000234_252_L000253
 mov r13, RI ' reg <- addrg
C_s77g1s_670edbcb_read_long_string_L000234_256
 mov RI, FP
 sub RI, #-(-12)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_s77g1s_670edbcb_read_long_string_L000234_257_L000258
 mov r4, RI ' reg ARG ADDRG
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
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #288 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_242 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_259
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g1r_670edbcb_skip_sep_L000217 ' CALL addrg
 cmp r0, r19 wz
 jmp #BRNZ
 long @C_s77g1s_670edbcb_read_long_string_L000234_242 ' NEU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_263 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_264 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_263
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s77g1s_670edbcb_read_long_string_L000234_264
 mov RI, r23
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_265 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_266
 mov r2, #10 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g1h_670edbcb_inclinenumber_L000145 ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s77g1s_670edbcb_read_long_string_L000234_242 ' NEU4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_242 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_246
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_269 ' EQU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_272 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_273 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_272
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s77g1s_670edbcb_read_long_string_L000234_273
 mov RI, r23
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_242 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_269
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_275 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r11, r22 ' CVUI
 and r11, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_276 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_275
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
C_s77g1s_670edbcb_read_long_string_L000234_276
 mov RI, r23
 mov BC, r11
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s77g1s_670edbcb_read_long_string_L000234_242 ' JUMPV addrg
C_s77g1s_670edbcb_read_long_string_L000234_265
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s77g1s_670edbcb_read_long_string_L000234_279 ' EQU4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r19
 shl r18, #1 ' LSHU4 coni
 mov r2, r20 ' SUBU
 sub r2, r18 ' SUBU (3)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r3, r19 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov RI, r21
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
C_s77g1s_670edbcb_read_long_string_L000234_279
' C_s77g1s_670edbcb_read_long_string_L000234_235 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s77g20_670edbcb_esccheck_L000281 ' <symbol:esccheck>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_s77g20_670edbcb_esccheck_L000281_283 ' NEI4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_s77g20_670edbcb_esccheck_L000281_285 ' EQI4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g20_670edbcb_esccheck_L000281_288 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g20_670edbcb_esccheck_L000281_289 ' JUMPV addrg
C_s77g20_670edbcb_esccheck_L000281_288
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g20_670edbcb_esccheck_L000281_289
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
C_s77g20_670edbcb_esccheck_L000281_285
 mov r2, #292 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
C_s77g20_670edbcb_esccheck_L000281_283
' C_s77g20_670edbcb_esccheck_L000281_282 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g21_670edbcb_gethexa_L000290 ' <symbol:gethexa>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g21_670edbcb_gethexa_L000290_293 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g21_670edbcb_gethexa_L000290_294 ' JUMPV addrg
C_s77g21_670edbcb_gethexa_L000290_293
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
C_s77g21_670edbcb_gethexa_L000290_294
 mov RI, r23
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long @C_s77g21_670edbcb_gethexa_L000290_296_L000297
 mov r2, RI ' reg ARG ADDRG
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r3, r22
 and r3, #16 ' BANDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g20_670edbcb_esccheck_L000281
 add SP, #8 ' CALL addrg
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__hexavalue ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s77g21_670edbcb_gethexa_L000290_291 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g23_670edbcb_readhexaesc_L000298 ' <symbol:readhexaesc>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g21_670edbcb_gethexa_L000290 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g21_670edbcb_gethexa_L000290 ' CALL addrg
 mov r20, r21
 shl r20, #4 ' LSHI4 coni
 mov r21, r20 ' ADDI/P
 adds r21, r0 ' ADDI/P (3)
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_s77g23_670edbcb_readhexaesc_L000298_299 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g24_670edbcb_readutf8esc_L000300 ' <symbol:readutf8esc>
 jmp #NEWF
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #4 ' reg <- coni
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g24_670edbcb_readutf8esc_L000300_303 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g24_670edbcb_readutf8esc_L000300_304 ' JUMPV addrg
C_s77g24_670edbcb_readutf8esc_L000300_303
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g24_670edbcb_readutf8esc_L000300_304
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long @C_s77g24_670edbcb_readutf8esc_L000300_306_L000307
 mov r2, RI ' reg ARG ADDRG
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #123 wz
 jmp #BRNZ
 long @C_s77g24_670edbcb_readutf8esc_L000300_308 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s77g24_670edbcb_readutf8esc_L000300_309 ' JUMPV addrg
C_s77g24_670edbcb_readutf8esc_L000300_308
 mov r15, #0 ' reg <- coni
C_s77g24_670edbcb_readutf8esc_L000300_309
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g20_670edbcb_esccheck_L000281
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g21_670edbcb_gethexa_L000290 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s77g24_670edbcb_readutf8esc_L000300_311 ' JUMPV addrg
C_s77g24_670edbcb_readutf8esc_L000300_310
 adds r19, #1 ' ADDI4 coni
 jmp #LODL
 long @C_s77g24_670edbcb_readutf8esc_L000300_316_L000317
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long $7ffffff
 mov r22, RI ' reg <- con
 cmp r21, r22 wz,wc 
 jmp #BR_A
 long @C_s77g24_670edbcb_readutf8esc_L000300_318 ' GTU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_s77g24_670edbcb_readutf8esc_L000300_319 ' JUMPV addrg
C_s77g24_670edbcb_readutf8esc_L000300_318
 mov r13, #0 ' reg <- coni
C_s77g24_670edbcb_readutf8esc_L000300_319
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g20_670edbcb_esccheck_L000281
 add SP, #8 ' CALL addrg
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__hexavalue ' CALL addrg
 mov r20, r21
 shl r20, #4 ' LSHU4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r20 ' ADDU
 add r21, r22 ' ADDU (3)
C_s77g24_670edbcb_readutf8esc_L000300_311
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g24_670edbcb_readutf8esc_L000300_320 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g24_670edbcb_readutf8esc_L000300_321 ' JUMPV addrg
C_s77g24_670edbcb_readutf8esc_L000300_320
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s77g24_670edbcb_readutf8esc_L000300_321
 mov RI, r23
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s77g24_670edbcb_readutf8esc_L000300_310 ' NEI4
 jmp #LODL
 long @C_s77g24_670edbcb_readutf8esc_L000300_323_L000324
 mov r2, RI ' reg ARG ADDRG
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #125 wz
 jmp #BRNZ
 long @C_s77g24_670edbcb_readutf8esc_L000300_325 ' NEI4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_s77g24_670edbcb_readutf8esc_L000300_326 ' JUMPV addrg
C_s77g24_670edbcb_readutf8esc_L000300_325
 mov r11, #0 ' reg <- coni
C_s77g24_670edbcb_readutf8esc_L000300_326
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g20_670edbcb_esccheck_L000281
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g24_670edbcb_readutf8esc_L000300_328 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r9, r22 ' CVUI
 and r9, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g24_670edbcb_readutf8esc_L000300_329 ' JUMPV addrg
C_s77g24_670edbcb_readutf8esc_L000300_328
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_s77g24_670edbcb_readutf8esc_L000300_329
 mov RI, r23
 mov BC, r9
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r19 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_s77g24_670edbcb_readutf8esc_L000300_301 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g28_670edbcb_utf8esc_L000330 ' <symbol:utf8esc>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g24_670edbcb_readutf8esc_L000300 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__utf8esc
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s77g28_670edbcb_utf8esc_L000330_335 ' JUMPV addrg
C_s77g28_670edbcb_utf8esc_L000330_332
 mov r22, #8 ' reg <- coni
 subs r22, r21 ' SUBI/P (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
' C_s77g28_670edbcb_utf8esc_L000330_333 ' (symbol refcount = 0)
 subs r21, #1 ' SUBI4 coni
C_s77g28_670edbcb_utf8esc_L000330_335
 cmps r21,  #0 wz,wc
 jmp #BR_A
 long @C_s77g28_670edbcb_utf8esc_L000330_332 ' GTI4
' C_s77g28_670edbcb_utf8esc_L000330_331 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s77g29_670edbcb_readdecesc_L000336 ' <symbol:readdecesc>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_s77g29_670edbcb_readdecesc_L000336_341 ' JUMPV addrg
C_s77g29_670edbcb_readdecesc_L000336_338
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (2)
 mov r21, r22
 subs r21, #48 ' SUBI4 coni
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g29_670edbcb_readdecesc_L000336_344 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g29_670edbcb_readdecesc_L000336_345 ' JUMPV addrg
C_s77g29_670edbcb_readdecesc_L000336_344
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g29_670edbcb_readdecesc_L000336_345
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
' C_s77g29_670edbcb_readdecesc_L000336_339 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s77g29_670edbcb_readdecesc_L000336_341
 cmps r19,  #3 wz,wc
 jmp #BRAE
 long @C_s77g29_670edbcb_readdecesc_L000336_346 ' GEI4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s77g29_670edbcb_readdecesc_L000336_338 ' NEI4
C_s77g29_670edbcb_readdecesc_L000336_346
 jmp #LODL
 long @C_s77g29_670edbcb_readdecesc_L000336_348_L000349
 mov r2, RI ' reg ARG ADDRG
 cmps r21,  #255 wz,wc
 jmp #BR_A
 long @C_s77g29_670edbcb_readdecesc_L000336_350 ' GTI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s77g29_670edbcb_readdecesc_L000336_351 ' JUMPV addrg
C_s77g29_670edbcb_readdecesc_L000336_350
 mov r17, #0 ' reg <- coni
C_s77g29_670edbcb_readdecesc_L000336_351
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g20_670edbcb_esccheck_L000281
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r19 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_s77g29_670edbcb_readdecesc_L000336_337 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s77g2b_670edbcb_read_string_L000352 ' <symbol:read_string>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_355 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_356 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_355
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2b_670edbcb_read_string_L000352_356
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_358 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_357
 mov RI, r23
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 cmps r15,  #10 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_366 ' EQI4
 mov r22, #13 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_366 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_A
 long @C_s77g2b_670edbcb_read_string_L000352_423 ' GTI4
' C_s77g2b_670edbcb_read_string_L000352_422 ' (symbol refcount = 0)
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_363 ' EQI4
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_360 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_423
 cmps r15,  #92 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_367 ' EQI4
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_360 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_363
 mov r2, #288 ' reg ARG coni
 jmp #LODL
 long @C_s77g2b_670edbcb_read_string_L000352_364_L000365
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_361 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_366
 mov r2, #292 ' reg ARG coni
 jmp #LODL
 long @C_s77g2b_670edbcb_read_string_L000352_364_L000365
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_361 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_367
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_369 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_370 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_369
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s77g2b_670edbcb_read_string_L000352_370
 mov RI, r23
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r11, BC ' reg <- INDIRI4 reg
 mov r22, #39 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_387 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_A
 long @C_s77g2b_670edbcb_read_string_L000352_407 ' GTI4
' C_s77g2b_670edbcb_read_string_L000352_406 ' (symbol refcount = 0)
 cmps r11,  #10 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_385 ' EQI4
 mov r22, #13 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_385 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_A
 long @C_s77g2b_670edbcb_read_string_L000352_409 ' GTI4
' C_s77g2b_670edbcb_read_string_L000352_408 ' (symbol refcount = 0)
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_361 ' EQI4
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_371 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_409
 cmps r11,  #34 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_387 ' EQI4
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_371 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_407
 cmps r11,  #97 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_374 ' EQI4
 cmps r11,  #98 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_376 ' EQI4
 mov r22, #102 ' reg <- coni
 cmps r11, r22 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_377 ' EQI4
 cmps r11, r22 wz,wc
 jmp #BR_A
 long @C_s77g2b_670edbcb_read_string_L000352_411 ' GTI4
' C_s77g2b_670edbcb_read_string_L000352_410 ' (symbol refcount = 0)
 cmps r11,  #92 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_387 ' EQI4
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_371 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_411
 cmps r11,  #110 wz,wc
 jmp #BR_B
 long @C_s77g2b_670edbcb_read_string_L000352_371 ' LTI4
 cmps r11,  #122 wz,wc
 jmp #BR_A
 long @C_s77g2b_670edbcb_read_string_L000352_371 ' GTI4
 mov r22, r11
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s77g2b_670edbcb_read_string_L000352_412_L000414-440
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s77g2b_670edbcb_read_string_L000352_412_L000414 ' <symbol:412>
 long @C_s77g2b_670edbcb_read_string_L000352_378
 long @C_s77g2b_670edbcb_read_string_L000352_371
 long @C_s77g2b_670edbcb_read_string_L000352_371
 long @C_s77g2b_670edbcb_read_string_L000352_371
 long @C_s77g2b_670edbcb_read_string_L000352_379
 long @C_s77g2b_670edbcb_read_string_L000352_371
 long @C_s77g2b_670edbcb_read_string_L000352_380
 long @C_s77g2b_670edbcb_read_string_L000352_383
 long @C_s77g2b_670edbcb_read_string_L000352_381
 long @C_s77g2b_670edbcb_read_string_L000352_371
 long @C_s77g2b_670edbcb_read_string_L000352_382
 long @C_s77g2b_670edbcb_read_string_L000352_371
 long @C_s77g2b_670edbcb_read_string_L000352_389

' Catalina Code

DAT ' code segment
C_s77g2b_670edbcb_read_string_L000352_374
 mov r22, #7 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_376
 mov r22, #8 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_377
 mov r22, #12 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_378
 mov r22, #10 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_379
 mov r22, #13 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_380
 mov r22, #9 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_381
 mov r22, #11 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_382
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g23_670edbcb_readhexaesc_L000298 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_383
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g28_670edbcb_utf8esc_L000330 ' CALL addrg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_361 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_385
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g1h_670edbcb_inclinenumber_L000145 ' CALL addrg
 mov r22, #10 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_386 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_387
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_375 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_389
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_391 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r9, r22 ' CVUI
 and r9, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_392 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_391
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_s77g2b_670edbcb_read_string_L000352_392
 mov RI, r23
 mov BC, r9
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_394 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_393
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_399 ' EQI4
 cmps r22,  #13 wz
 jmp #BRNZ
 long @C_s77g2b_670edbcb_read_string_L000352_397 ' NEI4
C_s77g2b_670edbcb_read_string_L000352_399
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g1h_670edbcb_inclinenumber_L000145 ' CALL addrg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_398 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_397
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_401 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r7, r22 ' CVUI
 and r7, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_402 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_401
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r7, r22 ' CVI, CVU or LOAD
C_s77g2b_670edbcb_read_string_L000352_402
 mov RI, r23
 mov BC, r7
 jmp #WLNG ' ASGNI4 reg reg
C_s77g2b_670edbcb_read_string_L000352_398
C_s77g2b_670edbcb_read_string_L000352_394
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s77g2b_670edbcb_read_string_L000352_393 ' NEI4
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_361 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_371
 jmp #LODL
 long @C_s77g2b_670edbcb_read_string_L000352_404_L000405
 mov r2, RI ' reg ARG ADDRG
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r3, r22
 and r3, #2 ' BANDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g20_670edbcb_esccheck_L000281
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g29_670edbcb_readdecesc_L000336 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_386 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_375
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_417 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r9, r22 ' CVUI
 and r9, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_418 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_417
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_s77g2b_670edbcb_read_string_L000352_418
 mov RI, r23
 mov BC, r9
 jmp #WLNG ' ASGNI4 reg reg
C_s77g2b_670edbcb_read_string_L000352_386
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_361 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_360
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_420 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_421 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_420
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s77g2b_670edbcb_read_string_L000352_421
 mov RI, r23
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
C_s77g2b_670edbcb_read_string_L000352_361
C_s77g2b_670edbcb_read_string_L000352_358
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_s77g2b_670edbcb_read_string_L000352_357 ' NEI4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2b_670edbcb_read_string_L000352_425 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2b_670edbcb_read_string_L000352_426 ' JUMPV addrg
C_s77g2b_670edbcb_read_string_L000352_425
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_s77g2b_670edbcb_read_string_L000352_426
 mov RI, r23
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r2, r20
 sub r2, #2 ' SUBU4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov RI, r19
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
' C_s77g2b_670edbcb_read_string_L000352_353 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s77g2g_670edbcb_llex_L000427 ' <symbol:llex>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_s77g2g_670edbcb_llex_L000427_429
 mov RI, r23
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 cmps r19,  #32 wz,wc
 jmp #BR_B
 long @C_s77g2g_670edbcb_llex_L000427_537 ' LTI4
 cmps r19,  #62 wz,wc
 jmp #BR_A
 long @C_s77g2g_670edbcb_llex_L000427_538 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s77g2g_670edbcb_llex_L000427_539_L000541-128
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s77g2g_670edbcb_llex_L000427_539_L000541 ' <symbol:539>
 long @C_s77g2g_670edbcb_llex_L000427_437
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_508
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_508
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_441
 long @C_s77g2g_670edbcb_llex_L000427_509
 long @C_s77g2g_670edbcb_llex_L000427_490
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_520
 long @C_s77g2g_670edbcb_llex_L000427_502
 long @C_s77g2g_670edbcb_llex_L000427_433
 long @C_s77g2g_670edbcb_llex_L000427_474
 long @C_s77g2g_670edbcb_llex_L000427_468
 long @C_s77g2g_670edbcb_llex_L000427_482

' Catalina Code

DAT ' code segment
C_s77g2g_670edbcb_llex_L000427_537
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_521 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_s77g2g_670edbcb_llex_L000427_433 ' LTI4
' C_s77g2g_670edbcb_llex_L000427_543 ' (symbol refcount = 0)
 cmps r19,  #9 wz,wc
 jmp #BR_B
 long @C_s77g2g_670edbcb_llex_L000427_433 ' LTI4
 cmps r19,  #13 wz,wc
 jmp #BR_A
 long @C_s77g2g_670edbcb_llex_L000427_433 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s77g2g_670edbcb_llex_L000427_544_L000546-36
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s77g2g_670edbcb_llex_L000427_544_L000546 ' <symbol:544>
 long @C_s77g2g_670edbcb_llex_L000427_437
 long @C_s77g2g_670edbcb_llex_L000427_436
 long @C_s77g2g_670edbcb_llex_L000427_437
 long @C_s77g2g_670edbcb_llex_L000427_437
 long @C_s77g2g_670edbcb_llex_L000427_436

' Catalina Code

DAT ' code segment
C_s77g2g_670edbcb_llex_L000427_538
 mov r22, #91 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_461 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_s77g2g_670edbcb_llex_L000427_433 ' LTI4
' C_s77g2g_670edbcb_llex_L000427_548 ' (symbol refcount = 0)
 cmps r19,  #126 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_496 ' EQI4
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_433 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_436
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g1h_670edbcb_inclinenumber_L000145 ' CALL addrg
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_429 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_437
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_439 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_440 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_439
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_440
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_429 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_441
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_443 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_444 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_443
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_444
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_445 ' EQI4
 mov r0, #45 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_445
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_448 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_449 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_448
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_449
 mov RI, r23
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #91 wz
 jmp #BRNZ
 long @C_s77g2g_670edbcb_llex_L000427_455 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g1r_670edbcb_skip_sep_L000217 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #2 wz,wc 
 jmp #BR_B
 long @C_s77g2g_670edbcb_llex_L000427_455' LTU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1s_670edbcb_read_long_string_L000234
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_429 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_454
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_458 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_459 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_458
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_459
 mov RI, r23
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
C_s77g2g_670edbcb_llex_L000427_455
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_460 ' EQI4
 cmps r22,  #13 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_460 ' EQI4
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s77g2g_670edbcb_llex_L000427_454 ' NEI4
C_s77g2g_670edbcb_llex_L000427_460
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_429 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_461
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s77g1r_670edbcb_skip_sep_L000217 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #2 wz,wc 
 jmp #BR_B
 long @C_s77g2g_670edbcb_llex_L000427_462' LTU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1s_670edbcb_read_long_string_L000234
 add SP, #8 ' CALL addrg
 mov r0, #292 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_462
 cmp r17,  #0 wz
 jmp #BRNZ
 long @C_s77g2g_670edbcb_llex_L000427_464 ' NEU4
 mov r2, #292 ' reg ARG coni
 jmp #LODL
 long @C_s77g2g_670edbcb_llex_L000427_466_L000467
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g16_670edbcb_lexerror_L000094
 add SP, #8 ' CALL addrg
C_s77g2g_670edbcb_llex_L000427_464
 mov r0, #91 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_468
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_470 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_471 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_470
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_471
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_472 ' EQI4
 mov r0, #281 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_472
 mov r0, #61 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_474
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_476 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_477 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_476
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_477
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_478 ' EQI4
 mov r0, #283 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_478
 mov r2, #60 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_480 ' EQI4
 mov r0, #285 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_480
 mov r0, #60 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_482
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_484 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_485 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_484
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_485
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_486 ' EQI4
 mov r0, #282 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_486
 mov r2, #62 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_488 ' EQI4
 mov r0, #286 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_488
 mov r0, #62 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_490
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_492 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_493 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_492
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_493
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #47 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_494 ' EQI4
 mov r0, #278 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_494
 mov r0, #47 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_496
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_498 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_499 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_498
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_499
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_500 ' EQI4
 mov r0, #284 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_500
 mov r0, #126 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_502
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_504 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_505 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_504
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_505
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #58 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_506 ' EQI4
 mov r0, #287 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_506
 mov r0, #58 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_508
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g2b_670edbcb_read_string_L000352
 add SP, #8 ' CALL addrg
 mov r0, #292 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_509
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_511 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_512 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_511
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_512
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #46 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_513 ' EQI4
 mov r2, #46 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1j_670edbcb_check_next1_L000161
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_515 ' EQI4
 mov r0, #280 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_515
 mov r0, #279 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_513
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s77g2g_670edbcb_llex_L000427_517 ' NEI4
 mov r0, #46 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_517
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1l_670edbcb_read_numeral_L000176
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_520
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g1l_670edbcb_read_numeral_L000176
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_521
 mov r0, #288 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_433
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_522 ' EQI4
C_s77g2g_670edbcb_llex_L000427_525
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g17_670edbcb_save_L000095
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_529 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_530 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_529
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_530
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
' C_s77g2g_670edbcb_llex_L000427_526 ' (symbol refcount = 0)
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s77g2g_670edbcb_llex_L000427_525 ' NEI4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r2, BC ' reg <- INDIRU4 reg
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, #4 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 cmps r18, r20 wz
 jmp #BRNZ
 long @C_s77g2g_670edbcb_llex_L000427_532 ' NEI4
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_s77g2g_670edbcb_llex_L000427_532 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #1 ' SUBI4 coni
 mov r0, r22
 adds r0, #256 ' ADDI4 coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_532
 mov r0, #291 ' reg <- coni
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_428 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_522
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s77g2g_670edbcb_llex_L000427_535 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s77g2g_670edbcb_llex_L000427_536 ' JUMPV addrg
C_s77g2g_670edbcb_llex_L000427_535
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s77g2g_670edbcb_llex_L000427_536
 mov RI, r23
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_s77g2g_670edbcb_llex_L000427_428
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaX_next

 alignl ' align long
C_luaX__next ' <symbol:luaX_next>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #288 wz
 jmp #BR_Z
 long @C_luaX__next_550 ' EQI4
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, r23
 adds r1, #20 ' ADDP4 coni
 jmp #CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #288 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaX__next_551 ' JUMPV addrg
C_luaX__next_550
 mov r2, r23
 adds r2, #16 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g2g_670edbcb_llex_L000427
 add SP, #4 ' CALL addrg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
C_luaX__next_551
' C_luaX__next_549 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaX_lookahead

 alignl ' align long
C_luaX__lookahead ' <symbol:luaX_lookahead>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23
 adds r2, #24 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s77g2g_670edbcb_llex_L000427
 add SP, #4 ' CALL addrg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_luaX__lookahead_552 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


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

 alignl ' align long
C_s77g2g_670edbcb_llex_L000427_466_L000467 ' <symbol:466>
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

 alignl ' align long
C_s77g2b_670edbcb_read_string_L000352_404_L000405 ' <symbol:404>
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

 alignl ' align long
C_s77g2b_670edbcb_read_string_L000352_364_L000365 ' <symbol:364>
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

 alignl ' align long
C_s77g29_670edbcb_readdecesc_L000336_348_L000349 ' <symbol:348>
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

 alignl ' align long
C_s77g24_670edbcb_readutf8esc_L000300_323_L000324 ' <symbol:323>
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

 alignl ' align long
C_s77g24_670edbcb_readutf8esc_L000300_316_L000317 ' <symbol:316>
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

 alignl ' align long
C_s77g24_670edbcb_readutf8esc_L000300_306_L000307 ' <symbol:306>
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

 alignl ' align long
C_s77g21_670edbcb_gethexa_L000290_296_L000297 ' <symbol:296>
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

 alignl ' align long
C_s77g1s_670edbcb_read_long_string_L000234_257_L000258 ' <symbol:257>
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

 alignl ' align long
C_s77g1s_670edbcb_read_long_string_L000234_252_L000253 ' <symbol:252>
 byte 99
 byte 111
 byte 109
 byte 109
 byte 101
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_s77g1s_670edbcb_read_long_string_L000234_250_L000251 ' <symbol:250>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s77g1l_670edbcb_read_numeral_L000176_212_L000213 ' <symbol:212>
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

 alignl ' align long
C_s77g1l_670edbcb_read_numeral_L000176_195_L000196 ' <symbol:195>
 byte 45
 byte 43
 byte 0

 alignl ' align long
C_s77g1l_670edbcb_read_numeral_L000176_187_L000188 ' <symbol:187>
 byte 80
 byte 112
 byte 0

 alignl ' align long
C_s77g1l_670edbcb_read_numeral_L000176_185_L000186 ' <symbol:185>
 byte 120
 byte 88
 byte 0

 alignl ' align long
C_s77g1l_670edbcb_read_numeral_L000176_178_L000179 ' <symbol:178>
 byte 69
 byte 101
 byte 0

 alignl ' align long
C_s77g1h_670edbcb_inclinenumber_L000145_158_L000159 ' <symbol:158>
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

 alignl ' align long
C_s77g16_670edbcb_lexerror_L000094_137_L000138 ' <symbol:137>
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

 alignl ' align long
C_luaX__token2str_123_L000124 ' <symbol:123>
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_luaX__token2str_118_L000119 ' <symbol:118>
 byte 39
 byte 60
 byte 92
 byte 37
 byte 100
 byte 62
 byte 39
 byte 0

 alignl ' align long
C_luaX__token2str_116_L000117 ' <symbol:116>
 byte 39
 byte 37
 byte 99
 byte 39
 byte 0

 alignl ' align long
C_luaX__init_104_L000105 ' <symbol:104>
 byte 95
 byte 69
 byte 78
 byte 86
 byte 0

 alignl ' align long
C_s77g17_670edbcb_save_L000095_101_L000102 ' <symbol:101>
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

 alignl ' align long
C_s77g15_670edbcb_92_L000093 ' <symbol:92>
 byte 60
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 62
 byte 0

 alignl ' align long
C_s77g14_670edbcb_90_L000091 ' <symbol:90>
 byte 60
 byte 110
 byte 97
 byte 109
 byte 101
 byte 62
 byte 0

 alignl ' align long
C_s77g13_670edbcb_88_L000089 ' <symbol:88>
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

 alignl ' align long
C_s77g12_670edbcb_86_L000087 ' <symbol:86>
 byte 60
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 62
 byte 0

 alignl ' align long
C_s77g11_670edbcb_84_L000085 ' <symbol:84>
 byte 60
 byte 101
 byte 111
 byte 102
 byte 62
 byte 0

 alignl ' align long
C_s77g10_670edbcb_82_L000083 ' <symbol:82>
 byte 58
 byte 58
 byte 0

 alignl ' align long
C_s77gv_670edbcb_80_L000081 ' <symbol:80>
 byte 62
 byte 62
 byte 0

 alignl ' align long
C_s77gu_670edbcb_78_L000079 ' <symbol:78>
 byte 60
 byte 60
 byte 0

 alignl ' align long
C_s77gt_670edbcb_76_L000077 ' <symbol:76>
 byte 126
 byte 61
 byte 0

 alignl ' align long
C_s77gs_670edbcb_74_L000075 ' <symbol:74>
 byte 60
 byte 61
 byte 0

 alignl ' align long
C_s77gr_670edbcb_72_L000073 ' <symbol:72>
 byte 62
 byte 61
 byte 0

 alignl ' align long
C_s77gq_670edbcb_70_L000071 ' <symbol:70>
 byte 61
 byte 61
 byte 0

 alignl ' align long
C_s77gp_670edbcb_68_L000069 ' <symbol:68>
 byte 46
 byte 46
 byte 46
 byte 0

 alignl ' align long
C_s77go_670edbcb_66_L000067 ' <symbol:66>
 byte 46
 byte 46
 byte 0

 alignl ' align long
C_s77gn_670edbcb_64_L000065 ' <symbol:64>
 byte 47
 byte 47
 byte 0

 alignl ' align long
C_s77gm_670edbcb_62_L000063 ' <symbol:62>
 byte 119
 byte 104
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s77gl_670edbcb_60_L000061 ' <symbol:60>
 byte 117
 byte 110
 byte 116
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_s77gk_670edbcb_58_L000059 ' <symbol:58>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_s77gj_670edbcb_56_L000057 ' <symbol:56>
 byte 116
 byte 104
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_s77gi_670edbcb_54_L000055 ' <symbol:54>
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 0

 alignl ' align long
C_s77gh_670edbcb_52_L000053 ' <symbol:52>
 byte 114
 byte 101
 byte 112
 byte 101
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_s77gg_670edbcb_50_L000051 ' <symbol:50>
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_s77gf_670edbcb_48_L000049 ' <symbol:48>
 byte 110
 byte 111
 byte 116
 byte 0

 alignl ' align long
C_s77ge_670edbcb_46_L000047 ' <symbol:46>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_s77gd_670edbcb_44_L000045 ' <symbol:44>
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_s77gc_670edbcb_42_L000043 ' <symbol:42>
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_s77gb_670edbcb_40_L000041 ' <symbol:40>
 byte 105
 byte 102
 byte 0

 alignl ' align long
C_s77ga_670edbcb_38_L000039 ' <symbol:38>
 byte 103
 byte 111
 byte 116
 byte 111
 byte 0

 alignl ' align long
C_s77g9_670edbcb_36_L000037 ' <symbol:36>
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
C_s77g8_670edbcb_34_L000035 ' <symbol:34>
 byte 102
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_s77g7_670edbcb_32_L000033 ' <symbol:32>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_s77g6_670edbcb_30_L000031 ' <symbol:30>
 byte 101
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_s77g5_670edbcb_28_L000029 ' <symbol:28>
 byte 101
 byte 108
 byte 115
 byte 101
 byte 105
 byte 102
 byte 0

 alignl ' align long
C_s77g4_670edbcb_26_L000027 ' <symbol:26>
 byte 101
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_s77g3_670edbcb_24_L000025 ' <symbol:24>
 byte 100
 byte 111
 byte 0

 alignl ' align long
C_s77g2_670edbcb_22_L000023 ' <symbol:22>
 byte 98
 byte 114
 byte 101
 byte 97
 byte 107
 byte 0

 alignl ' align long
C_s77g1_670edbcb_20_L000021 ' <symbol:20>
 byte 97
 byte 110
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
