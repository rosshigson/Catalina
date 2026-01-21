' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_salk_696de09a_luaX__tokens_L000021 ' <symbol:luaX_tokens>
 long @C_salk1_696de09a_22_L000023
 long @C_salk2_696de09a_24_L000025
 long @C_salk3_696de09a_26_L000027
 long @C_salk4_696de09a_28_L000029
 long @C_salk5_696de09a_30_L000031
 long @C_salk6_696de09a_32_L000033
 long @C_salk7_696de09a_34_L000035
 long @C_salk8_696de09a_36_L000037
 long @C_salk9_696de09a_38_L000039
 long @C_salka_696de09a_40_L000041
 long @C_salkb_696de09a_42_L000043
 long @C_salkc_696de09a_44_L000045
 long @C_salkd_696de09a_46_L000047
 long @C_salke_696de09a_48_L000049
 long @C_salkf_696de09a_50_L000051
 long @C_salkg_696de09a_52_L000053
 long @C_salkh_696de09a_54_L000055
 long @C_salki_696de09a_56_L000057
 long @C_salkj_696de09a_58_L000059
 long @C_salkk_696de09a_60_L000061
 long @C_salkl_696de09a_62_L000063
 long @C_salkm_696de09a_64_L000065
 long @C_salkn_696de09a_66_L000067
 long @C_salko_696de09a_68_L000069
 long @C_salkp_696de09a_70_L000071
 long @C_salkq_696de09a_72_L000073
 long @C_salkr_696de09a_74_L000075
 long @C_salks_696de09a_76_L000077
 long @C_salkt_696de09a_78_L000079
 long @C_salku_696de09a_80_L000081
 long @C_salkv_696de09a_82_L000083
 long @C_salk10_696de09a_84_L000085
 long @C_salk11_696de09a_86_L000087
 long @C_salk12_696de09a_88_L000089
 long @C_salk13_696de09a_90_L000091
 long @C_salk14_696de09a_92_L000093
 long @C_salk15_696de09a_94_L000095

' Catalina Code

DAT ' code segment

 alignl ' align long
C_salk17_696de09a_save_L000097 ' <symbol:save>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_salk17_696de09a_save_L000097_99 ' LEU4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$3fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_b jmp #\C_salk17_696de09a_save_L000097_101 ' LTU4
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_salk17_696de09a_save_L000097_103_L000104 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
C_salk17_696de09a_save_L000097_101
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 shl r20, #1 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 rdlong r22, r22 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r3, r0 ' CVI, CVU or LOAD
 rdlong r4, r19 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__saferealloc_
 add SP, #12 ' CALL addrg
 wrlong r0, r19 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_salk17_696de09a_save_L000097_99
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 add r18, #1 ' ADDU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_salk17_696de09a_save_L000097_98 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaX_init

 alignl ' align long
C_luaX__init ' <symbol:luaX_init>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #4 ' reg ARG coni
 mov r3, ##@C_luaX__init_106_L000107 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
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
 calld PA,#CALA
 long @C_luaC__fix
 add SP, #4 ' CALL addrg
 mov r21, #0 ' reg <- coni
C_luaX__init_108
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_salk_696de09a_luaX__tokens_L000021 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__fix
 add SP, #4 ' CALL addrg
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov r20, r21
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaX__init_109 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #22 wcz
 if_b jmp #\C_luaX__init_108 ' LTI4
' C_luaX__init_105 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaX_token2str

 alignl ' align long
C_luaX__token2str ' <symbol:luaX_token2str>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #256 wcz
 if_ae jmp #\C_luaX__token2str_113 ' GEI4
 mov r22, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r21 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaX__token2str_115 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_luaX__token2str_118_L000119 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaX__token2str_112 ' JUMPV addrg
C_luaX__token2str_115
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_luaX__token2str_120_L000121 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaX__token2str_112 ' JUMPV addrg
C_luaX__token2str_113
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_salk_696de09a_luaX__tokens_L000021-1024 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmps r21,  #288 wcz
 if_ae jmp #\C_luaX__token2str_123 ' GEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##@C_luaX__token2str_125_L000126 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaX__token2str_112 ' JUMPV addrg
C_luaX__token2str_123
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
C_luaX__token2str_112
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_salk1d_696de09a_txtT_oken_L000127 ' <symbol:txtToken>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #289 wcz
 if_b jmp #\C_salk1d_696de09a_txtT_oken_L000127_129 ' LTI4
 cmps r21,  #292 wcz
 if_a jmp #\C_salk1d_696de09a_txtT_oken_L000127_129 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_salk1d_696de09a_txtT_oken_L000127_132_L000134-1156 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_salk1d_696de09a_txtT_oken_L000127_132_L000134 ' <symbol:132>
 long @C_salk1d_696de09a_txtT_oken_L000127_131
 long @C_salk1d_696de09a_txtT_oken_L000127_131
 long @C_salk1d_696de09a_txtT_oken_L000127_131
 long @C_salk1d_696de09a_txtT_oken_L000127_131

' Catalina Code

DAT ' code segment
C_salk1d_696de09a_txtT_oken_L000127_131
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C_luaX__token2str_125_L000126 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_salk1d_696de09a_txtT_oken_L000127_128 ' JUMPV addrg
C_salk1d_696de09a_txtT_oken_L000127_129
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__token2str
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_salk1d_696de09a_txtT_oken_L000127_128
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk16_696de09a_lexerror_L000096 ' <symbol:lexerror>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__addinfo
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 if_z jmp #\C_salk16_696de09a_lexerror_L000096_137 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1d_696de09a_txtT_oken_L000127
 add SP, #4 ' CALL addrg
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, ##@C_salk16_696de09a_lexerror_L000096_139_L000140 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
C_salk16_696de09a_lexerror_L000096_137
 mov r2, #3 ' reg ARG coni
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
' C_salk16_696de09a_lexerror_L000096_136 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaX_syntaxerror

 alignl ' align long
C_luaX__syntaxerror ' <symbol:luaX_syntaxerror>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
' C_luaX__syntaxerror_141 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaX_newstring

 alignl ' align long
C_luaX__newstring ' <symbol:luaX_newstring>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getstr
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaX__newstring_143 ' EQI4
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 jmp #\@C_luaX__newstring_144 ' JUMPV addrg
C_luaX__newstring_143
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r17
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_luaX__newstring_145 ' LEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_luaX__newstring_145
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaX__newstring_144
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaX__newstring_142 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_salk1h_696de09a_inclinenumber_L000147 ' <symbol:inclinenumber>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1h_696de09a_inclinenumber_L000147_150 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r21, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1h_696de09a_inclinenumber_L000147_151 ' JUMPV addrg
C_salk1h_696de09a_inclinenumber_L000147_150
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
C_salk1h_696de09a_inclinenumber_L000147_151
 wrlong r21, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_z jmp #\C_salk1h_696de09a_inclinenumber_L000147_154 ' EQI4
 cmps r22,  #13 wz
 if_nz jmp #\C_salk1h_696de09a_inclinenumber_L000147_152 ' NEI4
C_salk1h_696de09a_inclinenumber_L000147_154
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_salk1h_696de09a_inclinenumber_L000147_152 ' EQI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1h_696de09a_inclinenumber_L000147_156 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r19, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1h_696de09a_inclinenumber_L000147_157 ' JUMPV addrg
C_salk1h_696de09a_inclinenumber_L000147_156
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_salk1h_696de09a_inclinenumber_L000147_157
 wrlong r19, r23 ' ASGNI4 reg reg
C_salk1h_696de09a_inclinenumber_L000147_152
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, ##2147483647 ' reg <- con
 cmps r20, r22 wcz
 if_b jmp #\C_salk1h_696de09a_inclinenumber_L000147_158 ' LTI4
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_salk1h_696de09a_inclinenumber_L000147_160_L000161 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
C_salk1h_696de09a_inclinenumber_L000147_158
' C_salk1h_696de09a_inclinenumber_L000147_148 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaX_setinput

 alignl ' align long
C_luaX__setinput ' <symbol:luaX_setinput>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #288 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r2, #4 ' reg ARG coni
 mov r3, ##@C_luaX__init_106_L000107 ' reg ARG ADDRG
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r20, r23
 adds r20, #56 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r2, #32 ' reg ARG coni
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #1 ' reg <- coni
 mov r18, r22
 adds r18, #8 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r3, r0 ' CVI, CVU or LOAD
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r5, r20 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__saferealloc_
 add SP, #12 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, #32 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_luaX__setinput_162 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk1j_696de09a_check_next1_L000163 ' <symbol:check_next1>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 if_nz jmp #\C_salk1j_696de09a_check_next1_L000163_165 ' NEI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1j_696de09a_check_next1_L000163_168 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r19, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1j_696de09a_check_next1_L000163_169 ' JUMPV addrg
C_salk1j_696de09a_check_next1_L000163_168
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_salk1j_696de09a_check_next1_L000163_169
 wrlong r19, r23 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_salk1j_696de09a_check_next1_L000163_164 ' JUMPV addrg
C_salk1j_696de09a_check_next1_L000163_165
 mov r0, #0 ' reg <- coni
C_salk1j_696de09a_check_next1_L000163_164
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk1k_696de09a_check_next2_L000170 ' <symbol:check_next2>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_z jmp #\C_salk1k_696de09a_check_next2_L000170_174 ' EQI4
 mov r20, r21
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_nz jmp #\C_salk1k_696de09a_check_next2_L000170_172 ' NEI4
C_salk1k_696de09a_check_next2_L000170_174
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1k_696de09a_check_next2_L000170_176 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r19, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1k_696de09a_check_next2_L000170_177 ' JUMPV addrg
C_salk1k_696de09a_check_next2_L000170_176
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_salk1k_696de09a_check_next2_L000170_177
 wrlong r19, r23 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_salk1k_696de09a_check_next2_L000170_171 ' JUMPV addrg
C_salk1k_696de09a_check_next2_L000170_172
 mov r0, #0 ' reg <- coni
C_salk1k_696de09a_check_next2_L000170_171
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk1l_696de09a_read_numeral_L000178 ' <symbol:read_numeral>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, ##@C_salk1l_696de09a_read_numeral_L000178_180_L000181 ' reg <- addrg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1l_696de09a_read_numeral_L000178_183 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1l_696de09a_read_numeral_L000178_184 ' JUMPV addrg
C_salk1l_696de09a_read_numeral_L000178_183
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk1l_696de09a_read_numeral_L000178_184
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #48 wz
 if_nz jmp #\C_salk1l_696de09a_read_numeral_L000178_185 ' NEI4
 mov r2, ##@C_salk1l_696de09a_read_numeral_L000178_187_L000188 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1k_696de09a_check_next2_L000170
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk1l_696de09a_read_numeral_L000178_185 ' EQI4
 mov r19, ##@C_salk1l_696de09a_read_numeral_L000178_189_L000190 ' reg <- addrg
C_salk1l_696de09a_read_numeral_L000178_185
C_salk1l_696de09a_read_numeral_L000178_191
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1k_696de09a_check_next2_L000170
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk1l_696de09a_read_numeral_L000178_195 ' EQI4
 mov r2, ##@C_salk1l_696de09a_read_numeral_L000178_197_L000198 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1k_696de09a_check_next2_L000170
 add SP, #4 ' CALL addrg
 jmp #\@C_salk1l_696de09a_read_numeral_L000178_191 ' JUMPV addrg
C_salk1l_696de09a_read_numeral_L000178_195
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #16 ' BANDI4 coni
 cmps r20,  #0 wz
 if_nz jmp #\C_salk1l_696de09a_read_numeral_L000178_202 ' NEI4
 cmps r22,  #46 wz
 if_nz jmp #\C_salk1l_696de09a_read_numeral_L000178_193 ' NEI4
C_salk1l_696de09a_read_numeral_L000178_202
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1l_696de09a_read_numeral_L000178_204 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r15, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1l_696de09a_read_numeral_L000178_205 ' JUMPV addrg
C_salk1l_696de09a_read_numeral_L000178_204
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_salk1l_696de09a_read_numeral_L000178_205
 wrlong r15, r23 ' ASGNI4 reg reg
 jmp #\@C_salk1l_696de09a_read_numeral_L000178_191 ' JUMPV addrg
C_salk1l_696de09a_read_numeral_L000178_193
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_salk1l_696de09a_read_numeral_L000178_206 ' EQI4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1l_696de09a_read_numeral_L000178_210 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r15, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1l_696de09a_read_numeral_L000178_211 ' JUMPV addrg
C_salk1l_696de09a_read_numeral_L000178_210
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_salk1l_696de09a_read_numeral_L000178_211
 wrlong r15, r23 ' ASGNI4 reg reg
C_salk1l_696de09a_read_numeral_L000178_206
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__str2num
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C_salk1l_696de09a_read_numeral_L000178_212  ' NEU4
 mov r2, #289 ' reg ARG coni
 mov r3, ##@C_salk1l_696de09a_read_numeral_L000178_214_L000215 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
C_salk1l_696de09a_read_numeral_L000178_212
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_salk1l_696de09a_read_numeral_L000178_216 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r0, #290 ' reg <- coni
 jmp #\@C_salk1l_696de09a_read_numeral_L000178_179 ' JUMPV addrg
C_salk1l_696de09a_read_numeral_L000178_216
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 wrlong r22, r21 ' ASGNF4 reg reg
 mov r0, #289 ' reg <- coni
C_salk1l_696de09a_read_numeral_L000178_179
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_salk1r_696de09a_skip_sep_L000219 ' <symbol:skip_sep>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1r_696de09a_skip_sep_L000219_222 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r19, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1r_696de09a_skip_sep_L000219_223 ' JUMPV addrg
C_salk1r_696de09a_skip_sep_L000219_222
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_salk1r_696de09a_skip_sep_L000219_223
 wrlong r19, r23 ' ASGNI4 reg reg
 jmp #\@C_salk1r_696de09a_skip_sep_L000219_225 ' JUMPV addrg
C_salk1r_696de09a_skip_sep_L000219_224
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1r_696de09a_skip_sep_L000219_228 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1r_696de09a_skip_sep_L000219_229 ' JUMPV addrg
C_salk1r_696de09a_skip_sep_L000219_228
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk1r_696de09a_skip_sep_L000219_229
 wrlong r17, r23 ' ASGNI4 reg reg
 add r21, #1 ' ADDU4 coni
C_salk1r_696de09a_skip_sep_L000219_225
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #61 wz
 if_z jmp #\C_salk1r_696de09a_skip_sep_L000219_224 ' EQI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_salk1r_696de09a_skip_sep_L000219_232 ' NEI4
 mov r17, r21
 add r17, #2 ' ADDU4 coni
 jmp #\@C_salk1r_696de09a_skip_sep_L000219_233 ' JUMPV addrg
C_salk1r_696de09a_skip_sep_L000219_232
 cmp r21,  #0 wz
 if_nz jmp #\C_salk1r_696de09a_skip_sep_L000219_234  ' NEU4
 mov r15, #1 ' reg <- coni
 jmp #\@C_salk1r_696de09a_skip_sep_L000219_235 ' JUMPV addrg
C_salk1r_696de09a_skip_sep_L000219_234
 mov r15, #0 ' reg <- coni
C_salk1r_696de09a_skip_sep_L000219_235
 mov r17, r15 ' CVI, CVU or LOAD
C_salk1r_696de09a_skip_sep_L000219_233
 mov r0, r17 ' CVI, CVU or LOAD
' C_salk1r_696de09a_skip_sep_L000219_220 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_salk1s_696de09a_read_long_string_L000236 ' <symbol:read_long_string>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_239 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_240 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_239
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk1s_696de09a_read_long_string_L000236_240
 wrlong r17, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_243 ' EQI4
 cmps r22,  #13 wz
 if_nz jmp #\C_salk1s_696de09a_read_long_string_L000236_241 ' NEI4
C_salk1s_696de09a_read_long_string_L000236_243
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk1h_696de09a_inclinenumber_L000147 ' CALL addrg
C_salk1s_696de09a_read_long_string_L000236_241
C_salk1s_696de09a_read_long_string_L000236_244
 rdlong r15, r23 ' reg <- INDIRI4 reg
 cmps r15,  #10 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_268 ' EQI4
 mov r22, #13 ' reg <- coni
 cmps r15, r22 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_268 ' EQI4
 cmps r15, r22 wcz
 if_a jmp #\C_salk1s_696de09a_read_long_string_L000236_280 ' GTI4
' C_salk1s_696de09a_read_long_string_L000236_279 ' (symbol refcount = 0)
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_251 ' EQI4
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_248 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_280
 cmps r15,  #93 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_261 ' EQI4
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_248 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_251
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_257 ' EQU4
 mov r13, ##@C_salk1s_696de09a_read_long_string_L000236_252_L000253 ' reg <- addrg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_258 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_257
 mov r13, ##@C_salk1s_696de09a_read_long_string_L000236_254_L000255 ' reg <- addrg
C_salk1s_696de09a_read_long_string_L000236_258
 mov RI, FP
 sub RI, #-(-12)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, ##@C_salk1s_696de09a_read_long_string_L000236_259_L000260 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
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
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_244 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_261
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk1r_696de09a_skip_sep_L000219 ' CALL addrg
 cmp r0, r19 wz
 if_nz jmp #\C_salk1s_696de09a_read_long_string_L000236_244  ' NEU4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_265 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r13, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_266 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_265
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_salk1s_696de09a_read_long_string_L000236_266
 wrlong r13, r23 ' ASGNI4 reg reg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_267 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_268
 mov r2, #10 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk1h_696de09a_inclinenumber_L000147 ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_salk1s_696de09a_read_long_string_L000236_244  ' NEU4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_244 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_248
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_271 ' EQU4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_274 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r13, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_275 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_274
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_salk1s_696de09a_read_long_string_L000236_275
 wrlong r13, r23 ' ASGNI4 reg reg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_244 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_271
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_277 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r11, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_278 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_277
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
C_salk1s_696de09a_read_long_string_L000236_278
 wrlong r11, r23 ' ASGNI4 reg reg
 jmp #\@C_salk1s_696de09a_read_long_string_L000236_244 ' JUMPV addrg
C_salk1s_696de09a_read_long_string_L000236_267
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_salk1s_696de09a_read_long_string_L000236_281 ' EQU4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r19
 shl r18, #1 ' LSHU4 coni
 mov r2, r20 ' SUBU
 sub r2, r18 ' SUBU (3)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r19 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 wrlong r0, r21 ' ASGNP4 reg reg
C_salk1s_696de09a_read_long_string_L000236_281
' C_salk1s_696de09a_read_long_string_L000236_237 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_salk20_696de09a_esccheck_L000283 ' <symbol:esccheck>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 if_nz jmp #\C_salk20_696de09a_esccheck_L000283_285 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_salk20_696de09a_esccheck_L000283_287 ' EQI4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk20_696de09a_esccheck_L000283_290 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk20_696de09a_esccheck_L000283_291 ' JUMPV addrg
C_salk20_696de09a_esccheck_L000283_290
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk20_696de09a_esccheck_L000283_291
 wrlong r17, r23 ' ASGNI4 reg reg
C_salk20_696de09a_esccheck_L000283_287
 mov r2, #292 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
C_salk20_696de09a_esccheck_L000283_285
' C_salk20_696de09a_esccheck_L000283_284 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk21_696de09a_gethexa_L000292 ' <symbol:gethexa>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk21_696de09a_gethexa_L000292_295 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r21, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk21_696de09a_gethexa_L000292_296 ' JUMPV addrg
C_salk21_696de09a_gethexa_L000292_295
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
C_salk21_696de09a_gethexa_L000292_296
 wrlong r21, r23 ' ASGNI4 reg reg
 mov r2, ##@C_salk21_696de09a_gethexa_L000292_298_L000299 ' reg ARG ADDRG
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r22
 and r3, #16 ' BANDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk20_696de09a_esccheck_L000283
 add SP, #8 ' CALL addrg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaO__hexavalue ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_salk21_696de09a_gethexa_L000292_293 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk23_696de09a_readhexaesc_L000300 ' <symbol:readhexaesc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk21_696de09a_gethexa_L000292 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk21_696de09a_gethexa_L000292 ' CALL addrg
 mov r20, r21
 shl r20, #4 ' LSHI4 coni
 mov r21, r20 ' ADDI/P
 adds r21, r0 ' ADDI/P (3)
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #2 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_salk23_696de09a_readhexaesc_L000300_301 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk24_696de09a_readutf8esc_L000302 ' <symbol:readutf8esc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #4 ' reg <- coni
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk24_696de09a_readutf8esc_L000302_305 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk24_696de09a_readutf8esc_L000302_306 ' JUMPV addrg
C_salk24_696de09a_readutf8esc_L000302_305
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk24_696de09a_readutf8esc_L000302_306
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r2, ##@C_salk24_696de09a_readutf8esc_L000302_308_L000309 ' reg ARG ADDRG
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #123 wz
 if_nz jmp #\C_salk24_696de09a_readutf8esc_L000302_310 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_salk24_696de09a_readutf8esc_L000302_311 ' JUMPV addrg
C_salk24_696de09a_readutf8esc_L000302_310
 mov r15, #0 ' reg <- coni
C_salk24_696de09a_readutf8esc_L000302_311
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk20_696de09a_esccheck_L000283
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk21_696de09a_gethexa_L000292 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_salk24_696de09a_readutf8esc_L000302_313 ' JUMPV addrg
C_salk24_696de09a_readutf8esc_L000302_312
 adds r19, #1 ' ADDI4 coni
 mov r2, ##@C_salk24_696de09a_readutf8esc_L000302_318_L000319 ' reg ARG ADDRG
 mov r22, ##$7ffffff ' reg <- con
 cmp r21, r22 wcz 
 if_a jmp #\C_salk24_696de09a_readutf8esc_L000302_320 ' GTU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_salk24_696de09a_readutf8esc_L000302_321 ' JUMPV addrg
C_salk24_696de09a_readutf8esc_L000302_320
 mov r13, #0 ' reg <- coni
C_salk24_696de09a_readutf8esc_L000302_321
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk20_696de09a_esccheck_L000283
 add SP, #8 ' CALL addrg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaO__hexavalue ' CALL addrg
 mov r20, r21
 shl r20, #4 ' LSHU4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r20 ' ADDU
 add r21, r22 ' ADDU (3)
C_salk24_696de09a_readutf8esc_L000302_313
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk24_696de09a_readutf8esc_L000302_322 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r13, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk24_696de09a_readutf8esc_L000302_323 ' JUMPV addrg
C_salk24_696de09a_readutf8esc_L000302_322
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_salk24_696de09a_readutf8esc_L000302_323
 wrlong r13, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_salk24_696de09a_readutf8esc_L000302_312 ' NEI4
 mov r2, ##@C_salk24_696de09a_readutf8esc_L000302_325_L000326 ' reg ARG ADDRG
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #125 wz
 if_nz jmp #\C_salk24_696de09a_readutf8esc_L000302_327 ' NEI4
 mov r11, #1 ' reg <- coni
 jmp #\@C_salk24_696de09a_readutf8esc_L000302_328 ' JUMPV addrg
C_salk24_696de09a_readutf8esc_L000302_327
 mov r11, #0 ' reg <- coni
C_salk24_696de09a_readutf8esc_L000302_328
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk20_696de09a_esccheck_L000283
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk24_696de09a_readutf8esc_L000302_330 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r9, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk24_696de09a_readutf8esc_L000302_331 ' JUMPV addrg
C_salk24_696de09a_readutf8esc_L000302_330
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_salk24_696de09a_readutf8esc_L000302_331
 wrlong r9, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r19 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_salk24_696de09a_readutf8esc_L000302_303 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk28_696de09a_utf8esc_L000332 ' <symbol:utf8esc>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk24_696de09a_readutf8esc_L000302 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__utf8esc
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_salk28_696de09a_utf8esc_L000332_337 ' JUMPV addrg
C_salk28_696de09a_utf8esc_L000332_334
 mov r22, #8 ' reg <- coni
 subs r22, r21 ' SUBI/P (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
' C_salk28_696de09a_utf8esc_L000332_335 ' (symbol refcount = 0)
 subs r21, #1 ' SUBI4 coni
C_salk28_696de09a_utf8esc_L000332_337
 cmps r21,  #0 wcz
 if_a jmp #\C_salk28_696de09a_utf8esc_L000332_334 ' GTI4
' C_salk28_696de09a_utf8esc_L000332_333 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_salk29_696de09a_readdecesc_L000338 ' <symbol:readdecesc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 jmp #\@C_salk29_696de09a_readdecesc_L000338_343 ' JUMPV addrg
C_salk29_696de09a_readdecesc_L000338_340
 mov r22, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdlong r22, r23 ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (2)
 mov r21, r22
 subs r21, #48 ' SUBI4 coni
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk29_696de09a_readdecesc_L000338_346 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk29_696de09a_readdecesc_L000338_347 ' JUMPV addrg
C_salk29_696de09a_readdecesc_L000338_346
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk29_696de09a_readdecesc_L000338_347
 wrlong r17, r23 ' ASGNI4 reg reg
' C_salk29_696de09a_readdecesc_L000338_341 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_salk29_696de09a_readdecesc_L000338_343
 cmps r19,  #3 wcz
 if_ae jmp #\C_salk29_696de09a_readdecesc_L000338_348 ' GEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_salk29_696de09a_readdecesc_L000338_340 ' NEI4
C_salk29_696de09a_readdecesc_L000338_348
 mov r2, ##@C_salk29_696de09a_readdecesc_L000338_350_L000351 ' reg ARG ADDRG
 cmps r21,  #255 wcz
 if_a jmp #\C_salk29_696de09a_readdecesc_L000338_352 ' GTI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_salk29_696de09a_readdecesc_L000338_353 ' JUMPV addrg
C_salk29_696de09a_readdecesc_L000338_352
 mov r17, #0 ' reg <- coni
C_salk29_696de09a_readdecesc_L000338_353
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk20_696de09a_esccheck_L000283
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r19 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_salk29_696de09a_readdecesc_L000338_339 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_salk2b_696de09a_read_string_L000354 ' <symbol:read_string>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_357 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_358 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_357
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2b_696de09a_read_string_L000354_358
 wrlong r17, r23 ' ASGNI4 reg reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_360 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_359
 rdlong r15, r23 ' reg <- INDIRI4 reg
 cmps r15,  #10 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_368 ' EQI4
 mov r22, #13 ' reg <- coni
 cmps r15, r22 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_368 ' EQI4
 cmps r15, r22 wcz
 if_a jmp #\C_salk2b_696de09a_read_string_L000354_425 ' GTI4
' C_salk2b_696de09a_read_string_L000354_424 ' (symbol refcount = 0)
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_365 ' EQI4
 jmp #\@C_salk2b_696de09a_read_string_L000354_362 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_425
 cmps r15,  #92 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_369 ' EQI4
 jmp #\@C_salk2b_696de09a_read_string_L000354_362 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_365
 mov r2, #288 ' reg ARG coni
 mov r3, ##@C_salk2b_696de09a_read_string_L000354_366_L000367 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
 jmp #\@C_salk2b_696de09a_read_string_L000354_363 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_368
 mov r2, #292 ' reg ARG coni
 mov r3, ##@C_salk2b_696de09a_read_string_L000354_366_L000367 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
 jmp #\@C_salk2b_696de09a_read_string_L000354_363 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_369
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_371 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r13, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_372 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_371
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_salk2b_696de09a_read_string_L000354_372
 wrlong r13, r23 ' ASGNI4 reg reg
 rdlong r11, r23 ' reg <- INDIRI4 reg
 mov r22, #39 ' reg <- coni
 cmps r11, r22 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_389 ' EQI4
 cmps r11, r22 wcz
 if_a jmp #\C_salk2b_696de09a_read_string_L000354_409 ' GTI4
' C_salk2b_696de09a_read_string_L000354_408 ' (symbol refcount = 0)
 cmps r11,  #10 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_387 ' EQI4
 mov r22, #13 ' reg <- coni
 cmps r11, r22 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_387 ' EQI4
 cmps r11, r22 wcz
 if_a jmp #\C_salk2b_696de09a_read_string_L000354_411 ' GTI4
' C_salk2b_696de09a_read_string_L000354_410 ' (symbol refcount = 0)
 mov r22, ##-1 ' reg <- con
 cmps r11, r22 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_363 ' EQI4
 jmp #\@C_salk2b_696de09a_read_string_L000354_373 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_411
 cmps r11,  #34 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_389 ' EQI4
 jmp #\@C_salk2b_696de09a_read_string_L000354_373 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_409
 cmps r11,  #97 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_376 ' EQI4
 cmps r11,  #98 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_378 ' EQI4
 mov r22, #102 ' reg <- coni
 cmps r11, r22 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_379 ' EQI4
 cmps r11, r22 wcz
 if_a jmp #\C_salk2b_696de09a_read_string_L000354_413 ' GTI4
' C_salk2b_696de09a_read_string_L000354_412 ' (symbol refcount = 0)
 cmps r11,  #92 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_389 ' EQI4
 jmp #\@C_salk2b_696de09a_read_string_L000354_373 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_413
 cmps r11,  #110 wcz
 if_b jmp #\C_salk2b_696de09a_read_string_L000354_373 ' LTI4
 cmps r11,  #122 wcz
 if_a jmp #\C_salk2b_696de09a_read_string_L000354_373 ' GTI4
 mov r22, r11
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_salk2b_696de09a_read_string_L000354_414_L000416-440 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_salk2b_696de09a_read_string_L000354_414_L000416 ' <symbol:414>
 long @C_salk2b_696de09a_read_string_L000354_380
 long @C_salk2b_696de09a_read_string_L000354_373
 long @C_salk2b_696de09a_read_string_L000354_373
 long @C_salk2b_696de09a_read_string_L000354_373
 long @C_salk2b_696de09a_read_string_L000354_381
 long @C_salk2b_696de09a_read_string_L000354_373
 long @C_salk2b_696de09a_read_string_L000354_382
 long @C_salk2b_696de09a_read_string_L000354_385
 long @C_salk2b_696de09a_read_string_L000354_383
 long @C_salk2b_696de09a_read_string_L000354_373
 long @C_salk2b_696de09a_read_string_L000354_384
 long @C_salk2b_696de09a_read_string_L000354_373
 long @C_salk2b_696de09a_read_string_L000354_391

' Catalina Code

DAT ' code segment
C_salk2b_696de09a_read_string_L000354_376
 mov r22, #7 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_378
 mov r22, #8 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_379
 mov r22, #12 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_380
 mov r22, #10 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_381
 mov r22, #13 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_382
 mov r22, #9 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_383
 mov r22, #11 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_384
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk23_696de09a_readhexaesc_L000300 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_385
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk28_696de09a_utf8esc_L000332 ' CALL addrg
 jmp #\@C_salk2b_696de09a_read_string_L000354_363 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_387
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk1h_696de09a_inclinenumber_L000147 ' CALL addrg
 mov r22, #10 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_388 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_389
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_377 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_391
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_393 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r9, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_394 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_393
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_salk2b_696de09a_read_string_L000354_394
 wrlong r9, r23 ' ASGNI4 reg reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_396 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_395
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_401 ' EQI4
 cmps r22,  #13 wz
 if_nz jmp #\C_salk2b_696de09a_read_string_L000354_399 ' NEI4
C_salk2b_696de09a_read_string_L000354_401
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk1h_696de09a_inclinenumber_L000147 ' CALL addrg
 jmp #\@C_salk2b_696de09a_read_string_L000354_400 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_399
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_403 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r7, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_404 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_403
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r7, r22 ' CVI, CVU or LOAD
C_salk2b_696de09a_read_string_L000354_404
 wrlong r7, r23 ' ASGNI4 reg reg
C_salk2b_696de09a_read_string_L000354_400
C_salk2b_696de09a_read_string_L000354_396
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_salk2b_696de09a_read_string_L000354_395 ' NEI4
 jmp #\@C_salk2b_696de09a_read_string_L000354_363 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_373
 mov r2, ##@C_salk2b_696de09a_read_string_L000354_406_L000407 ' reg ARG ADDRG
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r22
 and r3, #2 ' BANDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk20_696de09a_esccheck_L000283
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk29_696de09a_readdecesc_L000338 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_388 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_377
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_419 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r9, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_420 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_419
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_salk2b_696de09a_read_string_L000354_420
 wrlong r9, r23 ' ASGNI4 reg reg
C_salk2b_696de09a_read_string_L000354_388
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 jmp #\@C_salk2b_696de09a_read_string_L000354_363 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_362
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_422 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r13, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_423 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_422
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_salk2b_696de09a_read_string_L000354_423
 wrlong r13, r23 ' ASGNI4 reg reg
C_salk2b_696de09a_read_string_L000354_363
C_salk2b_696de09a_read_string_L000354_360
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22, r21 wz
 if_nz jmp #\C_salk2b_696de09a_read_string_L000354_359 ' NEI4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2b_696de09a_read_string_L000354_427 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r15, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2b_696de09a_read_string_L000354_428 ' JUMPV addrg
C_salk2b_696de09a_read_string_L000354_427
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_salk2b_696de09a_read_string_L000354_428
 wrlong r15, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r2, r20
 sub r2, #2 ' SUBU4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 wrlong r0, r19 ' ASGNP4 reg reg
' C_salk2b_696de09a_read_string_L000354_355 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_salk2g_696de09a_llex_L000429 ' <symbol:llex>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_salk2g_696de09a_llex_L000429_431
 rdlong r19, r23 ' reg <- INDIRI4 reg
 cmps r19,  #32 wcz
 if_b jmp #\C_salk2g_696de09a_llex_L000429_539 ' LTI4
 cmps r19,  #62 wcz
 if_a jmp #\C_salk2g_696de09a_llex_L000429_540 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_salk2g_696de09a_llex_L000429_541_L000543-128 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_salk2g_696de09a_llex_L000429_541_L000543 ' <symbol:541>
 long @C_salk2g_696de09a_llex_L000429_439
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_510
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_510
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_443
 long @C_salk2g_696de09a_llex_L000429_511
 long @C_salk2g_696de09a_llex_L000429_492
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_522
 long @C_salk2g_696de09a_llex_L000429_504
 long @C_salk2g_696de09a_llex_L000429_435
 long @C_salk2g_696de09a_llex_L000429_476
 long @C_salk2g_696de09a_llex_L000429_470
 long @C_salk2g_696de09a_llex_L000429_484

' Catalina Code

DAT ' code segment
C_salk2g_696de09a_llex_L000429_539
 mov r22, ##-1 ' reg <- con
 cmps r19, r22 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_523 ' EQI4
 cmps r19, r22 wcz
 if_b jmp #\C_salk2g_696de09a_llex_L000429_435 ' LTI4
' C_salk2g_696de09a_llex_L000429_545 ' (symbol refcount = 0)
 cmps r19,  #9 wcz
 if_b jmp #\C_salk2g_696de09a_llex_L000429_435 ' LTI4
 cmps r19,  #13 wcz
 if_a jmp #\C_salk2g_696de09a_llex_L000429_435 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_salk2g_696de09a_llex_L000429_546_L000548-36 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_salk2g_696de09a_llex_L000429_546_L000548 ' <symbol:546>
 long @C_salk2g_696de09a_llex_L000429_439
 long @C_salk2g_696de09a_llex_L000429_438
 long @C_salk2g_696de09a_llex_L000429_439
 long @C_salk2g_696de09a_llex_L000429_439
 long @C_salk2g_696de09a_llex_L000429_438

' Catalina Code

DAT ' code segment
C_salk2g_696de09a_llex_L000429_540
 mov r22, #91 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_463 ' EQI4
 cmps r19, r22 wcz
 if_b jmp #\C_salk2g_696de09a_llex_L000429_435 ' LTI4
' C_salk2g_696de09a_llex_L000429_550 ' (symbol refcount = 0)
 cmps r19,  #126 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_498 ' EQI4
 jmp #\@C_salk2g_696de09a_llex_L000429_435 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_438
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk1h_696de09a_inclinenumber_L000147 ' CALL addrg
 jmp #\@C_salk2g_696de09a_llex_L000429_431 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_439
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_441 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_442 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_441
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_442
 wrlong r17, r23 ' ASGNI4 reg reg
 jmp #\@C_salk2g_696de09a_llex_L000429_431 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_443
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_445 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_446 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_445
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_446
 wrlong r17, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #45 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_447 ' EQI4
 mov r0, #45 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_447
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_450 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r15, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_451 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_450
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_451
 wrlong r15, r23 ' ASGNI4 reg reg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #91 wz
 if_nz jmp #\C_salk2g_696de09a_llex_L000429_457 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk1r_696de09a_skip_sep_L000219 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #2 wcz 
 if_b jmp #\C_salk2g_696de09a_llex_L000429_457 ' LTU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##0 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1s_696de09a_read_long_string_L000236
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_salk2g_696de09a_llex_L000429_431 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_456
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_460 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r13, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_461 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_460
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_461
 wrlong r13, r23 ' ASGNI4 reg reg
C_salk2g_696de09a_llex_L000429_457
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_462 ' EQI4
 cmps r22,  #13 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_462 ' EQI4
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_salk2g_696de09a_llex_L000429_456 ' NEI4
C_salk2g_696de09a_llex_L000429_462
 jmp #\@C_salk2g_696de09a_llex_L000429_431 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_463
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_salk1r_696de09a_skip_sep_L000219 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmp r17,  #2 wcz 
 if_b jmp #\C_salk2g_696de09a_llex_L000429_464 ' LTU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1s_696de09a_read_long_string_L000236
 add SP, #8 ' CALL addrg
 mov r0, #292 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_464
 cmp r17,  #0 wz
 if_nz jmp #\C_salk2g_696de09a_llex_L000429_466  ' NEU4
 mov r2, #292 ' reg ARG coni
 mov r3, ##@C_salk2g_696de09a_llex_L000429_468_L000469 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk16_696de09a_lexerror_L000096
 add SP, #8 ' CALL addrg
C_salk2g_696de09a_llex_L000429_466
 mov r0, #91 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_470
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_472 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_473 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_472
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_473
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_474 ' EQI4
 mov r0, #281 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_474
 mov r0, #61 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_476
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_478 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_479 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_478
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_479
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_480 ' EQI4
 mov r0, #283 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_480
 mov r2, #60 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_482 ' EQI4
 mov r0, #285 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_482
 mov r0, #60 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_484
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_486 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_487 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_486
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_487
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_488 ' EQI4
 mov r0, #282 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_488
 mov r2, #62 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_490 ' EQI4
 mov r0, #286 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_490
 mov r0, #62 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_492
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_494 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_495 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_494
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_495
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r2, #47 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_496 ' EQI4
 mov r0, #278 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_496
 mov r0, #47 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_498
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_500 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_501 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_500
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_501
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r2, #61 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_502 ' EQI4
 mov r0, #284 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_502
 mov r0, #126 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_504
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_506 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_507 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_506
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_507
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r2, #58 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_508 ' EQI4
 mov r0, #287 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_508
 mov r0, #58 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_510
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRI4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk2b_696de09a_read_string_L000354
 add SP, #8 ' CALL addrg
 mov r0, #292 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_511
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_513 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_514 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_513
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_514
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r2, #46 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_515 ' EQI4
 mov r2, #46 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1j_696de09a_check_next1_L000163
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_517 ' EQI4
 mov r0, #280 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_517
 mov r0, #279 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_515
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_salk2g_696de09a_llex_L000429_519 ' NEI4
 mov r0, #46 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_519
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1l_696de09a_read_numeral_L000178
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_522
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk1l_696de09a_read_numeral_L000178
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_523
 mov r0, #288 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_435
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_524 ' EQI4
C_salk2g_696de09a_llex_L000429_527
 rdlong r2, r23 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk17_696de09a_save_L000097
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_531 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_532 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_531
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_532
 wrlong r17, r23 ' ASGNI4 reg reg
' C_salk2g_696de09a_llex_L000429_528 ' (symbol refcount = 0)
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov r20, ##@C_luai_ctype_+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_salk2g_696de09a_llex_L000429_527 ' NEI4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRU4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__newstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #4 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 cmps r18, r20 wz
 if_nz jmp #\C_salk2g_696de09a_llex_L000429_534 ' NEI4
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_salk2g_696de09a_llex_L000429_534 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #1 ' SUBI4 coni
 mov r0, r22
 adds r0, #256 ' ADDI4 coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_534
 mov r0, #291 ' reg <- coni
 jmp #\@C_salk2g_696de09a_llex_L000429_430 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_524
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_salk2g_696de09a_llex_L000429_537 ' EQU4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r17, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_salk2g_696de09a_llex_L000429_538 ' JUMPV addrg
C_salk2g_696de09a_llex_L000429_537
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_salk2g_696de09a_llex_L000429_538
 wrlong r17, r23 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_salk2g_696de09a_llex_L000429_430
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaX_next

 alignl ' align long
C_luaX__next ' <symbol:luaX_next>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #288 wz
 if_z jmp #\C_luaX__next_552 ' EQI4
 mov r0, r23
 adds r0, #12 ' ADDP4 coni
 mov r1, r23
 adds r1, #20 ' ADDP4 coni
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #288 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_luaX__next_553 ' JUMPV addrg
C_luaX__next_552
 mov r2, r23
 adds r2, #16 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk2g_696de09a_llex_L000429
 add SP, #4 ' CALL addrg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
C_luaX__next_553
' C_luaX__next_551 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaX_lookahead

 alignl ' align long
C_luaX__lookahead ' <symbol:luaX_lookahead>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23
 adds r2, #24 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_salk2g_696de09a_llex_L000429
 add SP, #4 ' CALL addrg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luaX__lookahead_554 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


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
C_salk2g_696de09a_llex_L000429_468_L000469 ' <symbol:468>
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
C_salk2b_696de09a_read_string_L000354_406_L000407 ' <symbol:406>
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
C_salk2b_696de09a_read_string_L000354_366_L000367 ' <symbol:366>
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
C_salk29_696de09a_readdecesc_L000338_350_L000351 ' <symbol:350>
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
C_salk24_696de09a_readutf8esc_L000302_325_L000326 ' <symbol:325>
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
C_salk24_696de09a_readutf8esc_L000302_318_L000319 ' <symbol:318>
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
C_salk24_696de09a_readutf8esc_L000302_308_L000309 ' <symbol:308>
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
C_salk21_696de09a_gethexa_L000292_298_L000299 ' <symbol:298>
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
C_salk1s_696de09a_read_long_string_L000236_259_L000260 ' <symbol:259>
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
C_salk1s_696de09a_read_long_string_L000236_254_L000255 ' <symbol:254>
 byte 99
 byte 111
 byte 109
 byte 109
 byte 101
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_salk1s_696de09a_read_long_string_L000236_252_L000253 ' <symbol:252>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_salk1l_696de09a_read_numeral_L000178_214_L000215 ' <symbol:214>
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
C_salk1l_696de09a_read_numeral_L000178_197_L000198 ' <symbol:197>
 byte 45
 byte 43
 byte 0

 alignl ' align long
C_salk1l_696de09a_read_numeral_L000178_189_L000190 ' <symbol:189>
 byte 80
 byte 112
 byte 0

 alignl ' align long
C_salk1l_696de09a_read_numeral_L000178_187_L000188 ' <symbol:187>
 byte 120
 byte 88
 byte 0

 alignl ' align long
C_salk1l_696de09a_read_numeral_L000178_180_L000181 ' <symbol:180>
 byte 69
 byte 101
 byte 0

 alignl ' align long
C_salk1h_696de09a_inclinenumber_L000147_160_L000161 ' <symbol:160>
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
C_salk16_696de09a_lexerror_L000096_139_L000140 ' <symbol:139>
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
C_luaX__token2str_125_L000126 ' <symbol:125>
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_luaX__token2str_120_L000121 ' <symbol:120>
 byte 39
 byte 60
 byte 92
 byte 37
 byte 100
 byte 62
 byte 39
 byte 0

 alignl ' align long
C_luaX__token2str_118_L000119 ' <symbol:118>
 byte 39
 byte 37
 byte 99
 byte 39
 byte 0

 alignl ' align long
C_luaX__init_106_L000107 ' <symbol:106>
 byte 95
 byte 69
 byte 78
 byte 86
 byte 0

 alignl ' align long
C_salk17_696de09a_save_L000097_103_L000104 ' <symbol:103>
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
C_salk15_696de09a_94_L000095 ' <symbol:94>
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
C_salk14_696de09a_92_L000093 ' <symbol:92>
 byte 60
 byte 110
 byte 97
 byte 109
 byte 101
 byte 62
 byte 0

 alignl ' align long
C_salk13_696de09a_90_L000091 ' <symbol:90>
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
C_salk12_696de09a_88_L000089 ' <symbol:88>
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
C_salk11_696de09a_86_L000087 ' <symbol:86>
 byte 60
 byte 101
 byte 111
 byte 102
 byte 62
 byte 0

 alignl ' align long
C_salk10_696de09a_84_L000085 ' <symbol:84>
 byte 58
 byte 58
 byte 0

 alignl ' align long
C_salkv_696de09a_82_L000083 ' <symbol:82>
 byte 62
 byte 62
 byte 0

 alignl ' align long
C_salku_696de09a_80_L000081 ' <symbol:80>
 byte 60
 byte 60
 byte 0

 alignl ' align long
C_salkt_696de09a_78_L000079 ' <symbol:78>
 byte 126
 byte 61
 byte 0

 alignl ' align long
C_salks_696de09a_76_L000077 ' <symbol:76>
 byte 60
 byte 61
 byte 0

 alignl ' align long
C_salkr_696de09a_74_L000075 ' <symbol:74>
 byte 62
 byte 61
 byte 0

 alignl ' align long
C_salkq_696de09a_72_L000073 ' <symbol:72>
 byte 61
 byte 61
 byte 0

 alignl ' align long
C_salkp_696de09a_70_L000071 ' <symbol:70>
 byte 46
 byte 46
 byte 46
 byte 0

 alignl ' align long
C_salko_696de09a_68_L000069 ' <symbol:68>
 byte 46
 byte 46
 byte 0

 alignl ' align long
C_salkn_696de09a_66_L000067 ' <symbol:66>
 byte 47
 byte 47
 byte 0

 alignl ' align long
C_salkm_696de09a_64_L000065 ' <symbol:64>
 byte 119
 byte 104
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_salkl_696de09a_62_L000063 ' <symbol:62>
 byte 117
 byte 110
 byte 116
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_salkk_696de09a_60_L000061 ' <symbol:60>
 byte 116
 byte 114
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_salkj_696de09a_58_L000059 ' <symbol:58>
 byte 116
 byte 104
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_salki_696de09a_56_L000057 ' <symbol:56>
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 0

 alignl ' align long
C_salkh_696de09a_54_L000055 ' <symbol:54>
 byte 114
 byte 101
 byte 112
 byte 101
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_salkg_696de09a_52_L000053 ' <symbol:52>
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_salkf_696de09a_50_L000051 ' <symbol:50>
 byte 110
 byte 111
 byte 116
 byte 0

 alignl ' align long
C_salke_696de09a_48_L000049 ' <symbol:48>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_salkd_696de09a_46_L000047 ' <symbol:46>
 byte 108
 byte 111
 byte 99
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_salkc_696de09a_44_L000045 ' <symbol:44>
 byte 105
 byte 110
 byte 0

 alignl ' align long
C_salkb_696de09a_42_L000043 ' <symbol:42>
 byte 105
 byte 102
 byte 0

 alignl ' align long
C_salka_696de09a_40_L000041 ' <symbol:40>
 byte 103
 byte 111
 byte 116
 byte 111
 byte 0

 alignl ' align long
C_salk9_696de09a_38_L000039 ' <symbol:38>
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
C_salk8_696de09a_36_L000037 ' <symbol:36>
 byte 102
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_salk7_696de09a_34_L000035 ' <symbol:34>
 byte 102
 byte 97
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_salk6_696de09a_32_L000033 ' <symbol:32>
 byte 101
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_salk5_696de09a_30_L000031 ' <symbol:30>
 byte 101
 byte 108
 byte 115
 byte 101
 byte 105
 byte 102
 byte 0

 alignl ' align long
C_salk4_696de09a_28_L000029 ' <symbol:28>
 byte 101
 byte 108
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_salk3_696de09a_26_L000027 ' <symbol:26>
 byte 100
 byte 111
 byte 0

 alignl ' align long
C_salk2_696de09a_24_L000025 ' <symbol:24>
 byte 98
 byte 114
 byte 101
 byte 97
 byte 107
 byte 0

 alignl ' align long
C_salk1_696de09a_22_L000023 ' <symbol:22>
 byte 97
 byte 110
 byte 100
 byte 0

' Catalina Code

DAT ' code segment
' end
