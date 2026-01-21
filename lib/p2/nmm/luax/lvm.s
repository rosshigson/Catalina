' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_svmg_696de09b_l_strton_L000018 ' <symbol:l_strton>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_svmg_696de09b_l_strton_L000018_20 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_svmg_696de09b_l_strton_L000018_19 ' JUMPV addrg
C_svmg_696de09b_l_strton_L000018_20
 rdlong r19, r23 ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__str2num
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r19
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20,  #255 wz
 if_z jmp #\C_svmg_696de09b_l_strton_L000018_26 ' EQI4
 mov r20, r19
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r15, r20 ' CVI, CVU or LOAD
 jmp #\@C_svmg_696de09b_l_strton_L000018_27 ' JUMPV addrg
C_svmg_696de09b_l_strton_L000018_26
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 rdlong r15, r20 ' reg <- INDIRU4 reg
C_svmg_696de09b_l_strton_L000018_27
 mov r20, r15
 add r20, #1 ' ADDU4 coni
 cmp r22, r20 wz
 if_nz jmp #\C_svmg_696de09b_l_strton_L000018_24  ' NEU4
 mov r17, #1 ' reg <- coni
 jmp #\@C_svmg_696de09b_l_strton_L000018_25 ' JUMPV addrg
C_svmg_696de09b_l_strton_L000018_24
 mov r17, #0 ' reg <- coni
C_svmg_696de09b_l_strton_L000018_25
 mov r0, r17 ' CVI, CVU or LOAD
C_svmg_696de09b_l_strton_L000018_19
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaV_tonumber_

 alignl ' align long
C_luaV__tonumber_ ' <symbol:luaV_tonumber_>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__tonumber__29 ' NEI4
 rdlong r0, r23 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 wrlong r0, r21 ' ASGNF4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaV__tonumber__28 ' JUMPV addrg
C_luaV__tonumber__29
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmg_696de09b_l_strton_L000018
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaV__tonumber__31 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__tonumber__35 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaV__tonumber__36 ' JUMPV addrg
C_luaV__tonumber__35
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRF4 reg
C_luaV__tonumber__36
 wrlong r19, r21 ' ASGNF4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaV__tonumber__28 ' JUMPV addrg
C_luaV__tonumber__31
 mov r0, #0 ' reg <- coni
C_luaV__tonumber__28
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaV_flttointeger

 alignl ' align long
C_luaV__flttointeger ' <symbol:luaV_flttointeger>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_floor ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_luaV__flttointeger_38 ' EQF4
 cmps r19,  #0 wz
 if_nz jmp #\C_luaV__flttointeger_40 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaV__flttointeger_37 ' JUMPV addrg
C_luaV__flttointeger_40
 cmps r19,  #2 wz
 if_nz jmp #\C_luaV__flttointeger_42 ' NEI4
 mov r22, ##@C_luaV__flttointeger_44_L000045
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r17, r0 ' CVI, CVU or LOAD
C_luaV__flttointeger_42
C_luaV__flttointeger_38
 mov r22, ##@C_luaV__flttointeger_49_L000050
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_b jmp #\C_luaV__flttointeger_47 ' LTF4
 mov r22, ##@C_luaV__flttointeger_51_L000052
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_luaV__flttointeger_47 ' GEF4
 mov r0, r17 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 wrlong r0, r21 ' ASGNI4 reg reg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__flttointeger_47 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_luaV__flttointeger_48 ' JUMPV addrg
C_luaV__flttointeger_47
 mov r15, #0 ' reg <- coni
C_luaV__flttointeger_48
 mov r0, r15 ' CVI, CVU or LOAD
C_luaV__flttointeger_37
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaV_tointegerns

 alignl ' align long
C_luaV__tointegerns ' <symbol:luaV_tointegerns>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__tointegerns_54 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 rdlong r4, r23 ' reg <- INDIRF4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaV__tointegerns_53 ' JUMPV addrg
C_luaV__tointegerns_54
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__tointegerns_56 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaV__tointegerns_53 ' JUMPV addrg
C_luaV__tointegerns_56
 mov r0, #0 ' reg <- coni
C_luaV__tointegerns_53
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaV_tointeger

 alignl ' align long
C_luaV__tointeger ' <symbol:luaV_tointeger>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmg_696de09b_l_strton_L000018
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaV__tointeger_59 ' EQI4
 mov r23, FP
 sub r23, #-(-12) ' reg <- addrli
C_luaV__tointeger_59
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaV__tointeger_58 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmg4_696de09b_forlimit_L000061 ' <symbol:forlimit>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r17,  #0 wcz
 if_ae jmp #\C_svmg4_696de09b_forlimit_L000061_66 ' GEI4
 mov r15, #2 ' reg <- coni
 jmp #\@C_svmg4_696de09b_forlimit_L000061_67 ' JUMPV addrg
C_svmg4_696de09b_forlimit_L000061_66
 mov r15, #1 ' reg <- coni
C_svmg4_696de09b_forlimit_L000061_67
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_svmg4_696de09b_forlimit_L000061_63 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_svmg4_696de09b_forlimit_L000061_71 ' NEI4
 rdlong r22, r21 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r13, #1 ' reg <- coni
 jmp #\@C_svmg4_696de09b_forlimit_L000061_72 ' JUMPV addrg
C_svmg4_696de09b_forlimit_L000061_71
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_svmg4_696de09b_forlimit_L000061_72
 cmps r13,  #0 wz
 if_nz jmp #\C_svmg4_696de09b_forlimit_L000061_68 ' NEI4
 mov r2, ##@C_svmg4_696de09b_forlimit_L000061_73_L000074 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__forerror
 add SP, #8 ' CALL addrg
C_svmg4_696de09b_forlimit_L000061_68
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmg4_696de09b_forlimit_L000061_75 ' GEF4
 cmps r17,  #0 wcz
 if_ae jmp #\C_svmg4_696de09b_forlimit_L000061_79 ' GEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_svmg4_696de09b_forlimit_L000061_62 ' JUMPV addrg
C_svmg4_696de09b_forlimit_L000061_79
 mov r22, ##2147483647 ' reg <- con
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #\@C_svmg4_696de09b_forlimit_L000061_76 ' JUMPV addrg
C_svmg4_696de09b_forlimit_L000061_75
 cmps r17,  #0 wcz
 if_be jmp #\C_svmg4_696de09b_forlimit_L000061_81 ' LEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_svmg4_696de09b_forlimit_L000061_62 ' JUMPV addrg
C_svmg4_696de09b_forlimit_L000061_81
 mov r22, ##-2147483648 ' reg <- con
 wrlong r22, r19 ' ASGNI4 reg reg
C_svmg4_696de09b_forlimit_L000061_76
C_svmg4_696de09b_forlimit_L000061_63
 cmps r17,  #0 wcz
 if_be jmp #\C_svmg4_696de09b_forlimit_L000061_86 ' LEI4
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r23, r22 wcz
 if_be jmp #\C_svmg4_696de09b_forlimit_L000061_88 ' LEI4
 mov r11, #1 ' reg <- coni
 jmp #\@C_svmg4_696de09b_forlimit_L000061_89 ' JUMPV addrg
C_svmg4_696de09b_forlimit_L000061_88
 mov r11, #0 ' reg <- coni
C_svmg4_696de09b_forlimit_L000061_89
 mov r13, r11 ' CVI, CVU or LOAD
 jmp #\@C_svmg4_696de09b_forlimit_L000061_87 ' JUMPV addrg
C_svmg4_696de09b_forlimit_L000061_86
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r23, r22 wcz
 if_ae jmp #\C_svmg4_696de09b_forlimit_L000061_90 ' GEI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_svmg4_696de09b_forlimit_L000061_91 ' JUMPV addrg
C_svmg4_696de09b_forlimit_L000061_90
 mov r9, #0 ' reg <- coni
C_svmg4_696de09b_forlimit_L000061_91
 mov r13, r9 ' CVI, CVU or LOAD
C_svmg4_696de09b_forlimit_L000061_87
 mov r0, r13 ' CVI, CVU or LOAD
C_svmg4_696de09b_forlimit_L000061_62
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmg7_696de09b_forprep_L000092 ' <symbol:forprep>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, r21 ' CVI, CVU or LOAD
 mov r15, r21
 adds r15, #8 ' ADDP4 coni
 mov r19, r21
 adds r19, #16 ' ADDP4 coni
 mov r22, #3 ' reg <- coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_94 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_94 ' NEI4
 rdlong r22, r17 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_96 ' NEI4
 mov r2, ##@C_svmg7_696de09b_forprep_L000092_98_L000099 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_svmg7_696de09b_forprep_L000092_96
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r15 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_svmg4_696de09b_forlimit_L000061
 add SP, #16 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_svmg7_696de09b_forprep_L000092_100 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_svmg7_696de09b_forprep_L000092_93 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_100
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_svmg7_696de09b_forprep_L000092_102 ' LEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_z jmp #\C_svmg7_696de09b_forprep_L000092_103 ' EQI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNU4 addrli reg
 jmp #\@C_svmg7_696de09b_forprep_L000092_103 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_102
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 neg r20, r20 ' NEGI4
 add r20, #1 ' ADDU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNU4 addrli reg
C_svmg7_696de09b_forprep_L000092_103
 mov RI, FP
 sub RI, #-(-24)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_svmg7_696de09b_forprep_L000092_95 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_94
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_109 ' NEI4
 rdlong r22, r15 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r13, #1 ' reg <- coni
 jmp #\@C_svmg7_696de09b_forprep_L000092_110 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_109
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_svmg7_696de09b_forprep_L000092_110
 cmps r13,  #0 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_106 ' NEI4
 mov r2, ##@C_svmg4_696de09b_forlimit_L000061_73_L000074 ' reg ARG ADDRG
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__forerror
 add SP, #8 ' CALL addrg
C_svmg7_696de09b_forprep_L000092_106
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_114 ' NEI4
 rdlong r22, r19 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r11, #1 ' reg <- coni
 jmp #\@C_svmg7_696de09b_forprep_L000092_115 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_114
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
C_svmg7_696de09b_forprep_L000092_115
 cmps r11,  #0 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_111 ' NEI4
 mov r2, ##@C_svmg7_696de09b_forprep_L000092_116_L000117 ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__forerror
 add SP, #8 ' CALL addrg
C_svmg7_696de09b_forprep_L000092_111
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_121 ' NEI4
 rdlong r22, r17 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r9, #1 ' reg <- coni
 jmp #\@C_svmg7_696de09b_forprep_L000092_122 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_121
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_svmg7_696de09b_forprep_L000092_122
 cmps r9,  #0 wz
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_118 ' NEI4
 mov r2, ##@C_svmg7_696de09b_forprep_L000092_123_L000124 ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__forerror
 add SP, #8 ' CALL addrg
C_svmg7_696de09b_forprep_L000092_118
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_svmg7_696de09b_forprep_L000092_125 ' NEF4
 mov r2, ##@C_svmg7_696de09b_forprep_L000092_98_L000099 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_svmg7_696de09b_forprep_L000092_125
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmg7_696de09b_forprep_L000092_132 ' GEF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmg7_696de09b_forprep_L000092_134 ' GEF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_svmg7_696de09b_forprep_L000092_135 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_134
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_svmg7_696de09b_forprep_L000092_135
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRI4 reg
 jmp #\@C_svmg7_696de09b_forprep_L000092_133 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_132
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmg7_696de09b_forprep_L000092_136 ' GEF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_svmg7_696de09b_forprep_L000092_137 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_136
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C_svmg7_696de09b_forprep_L000092_137
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRI4 reg
C_svmg7_696de09b_forprep_L000092_133
 cmps r7,  #0 wz
 if_z jmp #\C_svmg7_696de09b_forprep_L000092_127 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_svmg7_696de09b_forprep_L000092_93 ' JUMPV addrg
C_svmg7_696de09b_forprep_L000092_127
 mov RI, FP
 sub RI, #-(-28)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_svmg7_696de09b_forprep_L000092_95
 mov r0, #0 ' reg <- coni
C_svmg7_696de09b_forprep_L000092_93
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgb_696de09b_floatforloop_L000138 ' <symbol:floatforloop>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRF4 reg
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRF4 reg
 rdlong r23, r2 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmgb_696de09b_floatforloop_L000138_145 ' GEF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_a jmp #\C_svmgb_696de09b_floatforloop_L000138_147 ' GTF4
 mov r15, #1 ' reg <- coni
 jmp #\@C_svmgb_696de09b_floatforloop_L000138_148 ' JUMPV addrg
C_svmgb_696de09b_floatforloop_L000138_147
 mov r15, #0 ' reg <- coni
C_svmgb_696de09b_floatforloop_L000138_148
 mov r17, r15 ' CVI, CVU or LOAD
 jmp #\@C_svmgb_696de09b_floatforloop_L000138_146 ' JUMPV addrg
C_svmgb_696de09b_floatforloop_L000138_145
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_a jmp #\C_svmgb_696de09b_floatforloop_L000138_149 ' GTF4
 mov r13, #1 ' reg <- coni
 jmp #\@C_svmgb_696de09b_floatforloop_L000138_150 ' JUMPV addrg
C_svmgb_696de09b_floatforloop_L000138_149
 mov r13, #0 ' reg <- coni
C_svmgb_696de09b_floatforloop_L000138_150
 mov r17, r13 ' CVI, CVU or LOAD
C_svmgb_696de09b_floatforloop_L000138_146
 cmps r17,  #0 wz
 if_z jmp #\C_svmgb_696de09b_floatforloop_L000138_140 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r23, r22 ' ASGNF4 reg reg
 mov r22, r2
 adds r22, #24 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r23, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_svmgb_696de09b_floatforloop_L000138_139 ' JUMPV addrg
C_svmgb_696de09b_floatforloop_L000138_140
 mov r0, #0 ' reg <- coni
C_svmgb_696de09b_floatforloop_L000138_139
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaV_finishget

 alignl ' align long
C_luaV__finishget ' <symbol:luaV_finishget>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, #0 ' reg <- coni
C_luaV__finishget_152
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__finishget_156  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__finishget_157 ' NEI4
 mov r2, ##@C_luaV__finishget_160_L000161 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
 jmp #\@C_luaV__finishget_157 ' JUMPV addrg
C_luaV__finishget_156
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__finishget_164  ' NEU4
 mov r11, ##0 ' reg <- con
 jmp #\@C_luaV__finishget_165 ' JUMPV addrg
C_luaV__finishget_164
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__finishget_166 ' EQU4
 mov r9, ##0 ' reg <- con
 jmp #\@C_luaV__finishget_167 ' JUMPV addrg
C_luaV__finishget_166
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #152 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #0 ' reg ARG coni
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_luaV__finishget_167
 mov r11, r9 ' CVI, CVU or LOAD
C_luaV__finishget_165
 mov r15, r11 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__finishget_168  ' NEU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__finishget_151 ' JUMPV addrg
C_luaV__finishget_168
C_luaV__finishget_157
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #6 wz
 if_nz jmp #\C_luaV__finishget_170 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__callT_M_res
 add SP, #16 ' CALL addrg
 jmp #\@C_luaV__finishget_151 ' JUMPV addrg
C_luaV__finishget_170
 mov r23, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__finishget_176 ' EQI4
 mov r17, ##0 ' reg <- con
 mov r11, #0 ' reg <- coni
 jmp #\@C_luaV__finishget_177 ' JUMPV addrg
C_luaV__finishget_176
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__finishget_178 ' EQI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_luaV__finishget_179 ' JUMPV addrg
C_luaV__finishget_178
 mov r9, #0 ' reg <- coni
C_luaV__finishget_179
 mov r11, r9 ' CVI, CVU or LOAD
C_luaV__finishget_177
 cmps r11,  #0 wz
 if_z jmp #\C_luaV__finishget_172 ' EQI4
 mov r7, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r0, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__finishget_151 ' JUMPV addrg
C_luaV__finishget_172
' C_luaV__finishget_153 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
 mov r22, ##2000 ' reg <- con
 cmps r13, r22 wcz
 if_b jmp #\C_luaV__finishget_152 ' LTI4
 mov r2, ##@C_luaV__finishget_180_L000181 ' reg ARG ADDRG
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__finishget_151
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaV_finishset

 alignl ' align long
C_luaV__finishset ' <symbol:luaV_finishset>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
C_luaV__finishset_183
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__finishset_187 ' EQU4
 rdlong r11, r23 ' reg <- INDIRP4 reg
 mov r22, r11
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__finishset_191  ' NEU4
 mov r9, ##0 ' reg <- con
 jmp #\@C_luaV__finishset_192 ' JUMPV addrg
C_luaV__finishset_191
 mov r22, r11
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__finishset_193 ' EQU4
 mov r7, ##0 ' reg <- con
 jmp #\@C_luaV__finishset_194 ' JUMPV addrg
C_luaV__finishset_193
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #156 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #1 ' reg ARG coni
 mov r22, r11
 adds r22, #24 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r7, r22 ' CVI, CVU or LOAD
C_luaV__finishset_194
 mov r9, r7 ' CVI, CVU or LOAD
C_luaV__finishset_192
 mov r13, r9 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__finishset_188  ' NEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r11, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r11 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r11
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffffc0 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__finishset_198 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, r11
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__finishset_198 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__finishset_198 ' EQI4
 mov r2, r11 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__finishset_198 ' JUMPV addrg
 jmp #\@C_luaV__finishset_198 ' JUMPV addrg
C_luaV__finishset_198
 jmp #\@C_luaV__finishset_182 ' JUMPV addrg
C_luaV__finishset_187
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__finishset_201 ' NEI4
 mov r2, ##@C_luaV__finishget_160_L000161 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
C_luaV__finishset_201
C_luaV__finishset_188
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #6 wz
 if_nz jmp #\C_luaV__finishset_203 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, r13 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__callT_M_
 add SP, #16 ' CALL addrg
 jmp #\@C_luaV__finishset_182 ' JUMPV addrg
C_luaV__finishset_203
 mov r23, r13 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__finishset_209 ' EQI4
 mov r17, ##0 ' reg <- con
 mov r11, #0 ' reg <- coni
 jmp #\@C_luaV__finishset_210 ' JUMPV addrg
C_luaV__finishset_209
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__finishset_211 ' EQI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_luaV__finishset_212 ' JUMPV addrg
C_luaV__finishset_211
 mov r9, #0 ' reg <- coni
C_luaV__finishset_212
 mov r11, r9 ' CVI, CVU or LOAD
C_luaV__finishset_210
 cmps r11,  #0 wz
 if_z jmp #\C_luaV__finishset_205 ' EQI4
 mov r7, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r0, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__finishset_214 ' EQI4
 mov r22, #0 ' reg <- coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__finishset_214 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__finishset_214 ' EQI4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__finishset_214 ' JUMPV addrg
 jmp #\@C_luaV__finishset_214 ' JUMPV addrg
C_luaV__finishset_214
 jmp #\@C_luaV__finishset_182 ' JUMPV addrg
C_luaV__finishset_205
' C_luaV__finishset_184 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 mov r22, ##2000 ' reg <- con
 cmps r15, r22 wcz
 if_b jmp #\C_luaV__finishset_183 ' LTI4
 mov r2, ##@C_luaV__finishset_217_L000218 ' reg ARG ADDRG
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__finishset_182
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgf_696de09b_l_strcmp_L000219 ' <symbol:l_strcmp>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $eaaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r23
 adds r19, #16 ' ADDP4 coni
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #255 wz
 if_z jmp #\C_svmgf_696de09b_l_strcmp_L000219_222 ' EQI4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_svmgf_696de09b_l_strcmp_L000219_223 ' JUMPV addrg
C_svmgf_696de09b_l_strcmp_L000219_222
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRU4 reg
C_svmgf_696de09b_l_strcmp_L000219_223
 mov r15, r11 ' CVI, CVU or LOAD
 mov r17, r21
 adds r17, #16 ' ADDP4 coni
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #255 wz
 if_z jmp #\C_svmgf_696de09b_l_strcmp_L000219_225 ' EQI4
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r9, r22 ' CVI, CVU or LOAD
 jmp #\@C_svmgf_696de09b_l_strcmp_L000219_226 ' JUMPV addrg
C_svmgf_696de09b_l_strcmp_L000219_225
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
C_svmgf_696de09b_l_strcmp_L000219_226
 mov r13, r9 ' CVI, CVU or LOAD
C_svmgf_696de09b_l_strcmp_L000219_227
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcoll
 add SP, #4 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 cmps r7,  #0 wz
 if_z jmp #\C_svmgf_696de09b_l_strcmp_L000219_231 ' EQI4
 mov r0, r7 ' CVI, CVU or LOAD
 jmp #\@C_svmgf_696de09b_l_strcmp_L000219_220 ' JUMPV addrg
C_svmgf_696de09b_l_strcmp_L000219_231
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r13 wz
 if_nz jmp #\C_svmgf_696de09b_l_strcmp_L000219_233  ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r15 wz
 if_nz jmp #\C_svmgf_696de09b_l_strcmp_L000219_236  ' NEU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_svmgf_696de09b_l_strcmp_L000219_237 ' JUMPV addrg
C_svmgf_696de09b_l_strcmp_L000219_236
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_svmgf_696de09b_l_strcmp_L000219_237
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_svmgf_696de09b_l_strcmp_L000219_220 ' JUMPV addrg
C_svmgf_696de09b_l_strcmp_L000219_233
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r15 wz
 if_nz jmp #\C_svmgf_696de09b_l_strcmp_L000219_238  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_svmgf_696de09b_l_strcmp_L000219_220 ' JUMPV addrg
C_svmgf_696de09b_l_strcmp_L000219_238
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r19, r22 ' ADDI/P (2)
 sub r15, r22 ' SUBU (1)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r17, r22 ' ADDI/P (2)
 sub r13, r22 ' SUBU (1)
 jmp #\@C_svmgf_696de09b_l_strcmp_L000219_227 ' JUMPV addrg
C_svmgf_696de09b_l_strcmp_L000219_220
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgg_696de09b_L_T_intfloat_L000240 ' <symbol:LTintfloat>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##$1000000 ' reg <- con
 add r22, r20 ' ADDU (1)
 mov r20, ##$2000000 ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_svmgg_696de09b_L_T_intfloat_L000240_242 ' GTU4
 mov r0, r23 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmgg_696de09b_L_T_intfloat_L000240_245 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #\@C_svmgg_696de09b_L_T_intfloat_L000240_246 ' JUMPV addrg
C_svmgg_696de09b_L_T_intfloat_L000240_245
 mov r19, #0 ' reg <- coni
C_svmgg_696de09b_L_T_intfloat_L000240_246
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_svmgg_696de09b_L_T_intfloat_L000240_241 ' JUMPV addrg
C_svmgg_696de09b_L_T_intfloat_L000240_242
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_svmgg_696de09b_L_T_intfloat_L000240_247 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r23, r22 wcz
 if_ae jmp #\C_svmgg_696de09b_L_T_intfloat_L000240_250 ' GEI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_svmgg_696de09b_L_T_intfloat_L000240_251 ' JUMPV addrg
C_svmgg_696de09b_L_T_intfloat_L000240_250
 mov r17, #0 ' reg <- coni
C_svmgg_696de09b_L_T_intfloat_L000240_251
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_svmgg_696de09b_L_T_intfloat_L000240_241 ' JUMPV addrg
C_svmgg_696de09b_L_T_intfloat_L000240_247
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_svmgg_696de09b_L_T_intfloat_L000240_253 ' LEF4
 mov r15, #1 ' reg <- coni
 jmp #\@C_svmgg_696de09b_L_T_intfloat_L000240_254 ' JUMPV addrg
C_svmgg_696de09b_L_T_intfloat_L000240_253
 mov r15, #0 ' reg <- coni
C_svmgg_696de09b_L_T_intfloat_L000240_254
 mov r0, r15 ' CVI, CVU or LOAD
C_svmgg_696de09b_L_T_intfloat_L000240_241
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgh_696de09b_L_E_intfloat_L000255 ' <symbol:LEintfloat>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##$1000000 ' reg <- con
 add r22, r20 ' ADDU (1)
 mov r20, ##$2000000 ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_svmgh_696de09b_L_E_intfloat_L000255_257 ' GTU4
 mov r0, r23 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_a jmp #\C_svmgh_696de09b_L_E_intfloat_L000255_260 ' GTF4
 mov r19, #1 ' reg <- coni
 jmp #\@C_svmgh_696de09b_L_E_intfloat_L000255_261 ' JUMPV addrg
C_svmgh_696de09b_L_E_intfloat_L000255_260
 mov r19, #0 ' reg <- coni
C_svmgh_696de09b_L_E_intfloat_L000255_261
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_svmgh_696de09b_L_E_intfloat_L000255_256 ' JUMPV addrg
C_svmgh_696de09b_L_E_intfloat_L000255_257
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_svmgh_696de09b_L_E_intfloat_L000255_262 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r23, r22 wcz
 if_a jmp #\C_svmgh_696de09b_L_E_intfloat_L000255_265 ' GTI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_svmgh_696de09b_L_E_intfloat_L000255_266 ' JUMPV addrg
C_svmgh_696de09b_L_E_intfloat_L000255_265
 mov r17, #0 ' reg <- coni
C_svmgh_696de09b_L_E_intfloat_L000255_266
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_svmgh_696de09b_L_E_intfloat_L000255_256 ' JUMPV addrg
C_svmgh_696de09b_L_E_intfloat_L000255_262
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_svmgh_696de09b_L_E_intfloat_L000255_268 ' LEF4
 mov r15, #1 ' reg <- coni
 jmp #\@C_svmgh_696de09b_L_E_intfloat_L000255_269 ' JUMPV addrg
C_svmgh_696de09b_L_E_intfloat_L000255_268
 mov r15, #0 ' reg <- coni
C_svmgh_696de09b_L_E_intfloat_L000255_269
 mov r0, r15 ' CVI, CVU or LOAD
C_svmgh_696de09b_L_E_intfloat_L000255_256
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgi_696de09b_L_T_floatint_L000270 ' <symbol:LTfloatint>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, ##$1000000 ' reg <- con
 add r22, r20 ' ADDU (1)
 mov r20, ##$2000000 ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_svmgi_696de09b_L_T_floatint_L000270_272 ' GTU4
 mov r0, r21 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FCMP
 if_ae jmp #\C_svmgi_696de09b_L_T_floatint_L000270_275 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #\@C_svmgi_696de09b_L_T_floatint_L000270_276 ' JUMPV addrg
C_svmgi_696de09b_L_T_floatint_L000270_275
 mov r19, #0 ' reg <- coni
C_svmgi_696de09b_L_T_floatint_L000270_276
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_svmgi_696de09b_L_T_floatint_L000270_271 ' JUMPV addrg
C_svmgi_696de09b_L_T_floatint_L000270_272
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_svmgi_696de09b_L_T_floatint_L000270_277 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wcz
 if_ae jmp #\C_svmgi_696de09b_L_T_floatint_L000270_280 ' GEI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_svmgi_696de09b_L_T_floatint_L000270_281 ' JUMPV addrg
C_svmgi_696de09b_L_T_floatint_L000270_280
 mov r17, #0 ' reg <- coni
C_svmgi_696de09b_L_T_floatint_L000270_281
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_svmgi_696de09b_L_T_floatint_L000270_271 ' JUMPV addrg
C_svmgi_696de09b_L_T_floatint_L000270_277
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmgi_696de09b_L_T_floatint_L000270_283 ' GEF4
 mov r15, #1 ' reg <- coni
 jmp #\@C_svmgi_696de09b_L_T_floatint_L000270_284 ' JUMPV addrg
C_svmgi_696de09b_L_T_floatint_L000270_283
 mov r15, #0 ' reg <- coni
C_svmgi_696de09b_L_T_floatint_L000270_284
 mov r0, r15 ' CVI, CVU or LOAD
C_svmgi_696de09b_L_T_floatint_L000270_271
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgj_696de09b_L_E_floatint_L000285 ' <symbol:LEfloatint>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, ##$1000000 ' reg <- con
 add r22, r20 ' ADDU (1)
 mov r20, ##$2000000 ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_svmgj_696de09b_L_E_floatint_L000285_287 ' GTU4
 mov r0, r21 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FCMP
 if_a jmp #\C_svmgj_696de09b_L_E_floatint_L000285_290 ' GTF4
 mov r19, #1 ' reg <- coni
 jmp #\@C_svmgj_696de09b_L_E_floatint_L000285_291 ' JUMPV addrg
C_svmgj_696de09b_L_E_floatint_L000285_290
 mov r19, #0 ' reg <- coni
C_svmgj_696de09b_L_E_floatint_L000285_291
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_svmgj_696de09b_L_E_floatint_L000285_286 ' JUMPV addrg
C_svmgj_696de09b_L_E_floatint_L000285_287
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_svmgj_696de09b_L_E_floatint_L000285_292 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wcz
 if_a jmp #\C_svmgj_696de09b_L_E_floatint_L000285_295 ' GTI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_svmgj_696de09b_L_E_floatint_L000285_296 ' JUMPV addrg
C_svmgj_696de09b_L_E_floatint_L000285_295
 mov r17, #0 ' reg <- coni
C_svmgj_696de09b_L_E_floatint_L000285_296
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_svmgj_696de09b_L_E_floatint_L000285_286 ' JUMPV addrg
C_svmgj_696de09b_L_E_floatint_L000285_292
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmgj_696de09b_L_E_floatint_L000285_298 ' GEF4
 mov r15, #1 ' reg <- coni
 jmp #\@C_svmgj_696de09b_L_E_floatint_L000285_299 ' JUMPV addrg
C_svmgj_696de09b_L_E_floatint_L000285_298
 mov r15, #0 ' reg <- coni
C_svmgj_696de09b_L_E_floatint_L000285_299
 mov r0, r15 ' CVI, CVU or LOAD
C_svmgj_696de09b_L_E_floatint_L000285_286
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgk_696de09b_L_T_num_L000300 ' <symbol:LTnum>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_svmgk_696de09b_L_T_num_L000300_302 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_svmgk_696de09b_L_T_num_L000300_304 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdlong r20, r21 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_ae jmp #\C_svmgk_696de09b_L_T_num_L000300_307 ' GEI4
 mov r19, #1 ' reg <- coni
 jmp #\@C_svmgk_696de09b_L_T_num_L000300_308 ' JUMPV addrg
C_svmgk_696de09b_L_T_num_L000300_307
 mov r19, #0 ' reg <- coni
C_svmgk_696de09b_L_T_num_L000300_308
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_svmgk_696de09b_L_T_num_L000300_301 ' JUMPV addrg
C_svmgk_696de09b_L_T_num_L000300_304
 rdlong r2, r21 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgg_696de09b_L_T_intfloat_L000240
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_svmgk_696de09b_L_T_num_L000300_301 ' JUMPV addrg
C_svmgk_696de09b_L_T_num_L000300_302
 rdlong r22, r23 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_svmgk_696de09b_L_T_num_L000300_309 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 rdlong r20, r21 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_svmgk_696de09b_L_T_num_L000300_312 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #\@C_svmgk_696de09b_L_T_num_L000300_313 ' JUMPV addrg
C_svmgk_696de09b_L_T_num_L000300_312
 mov r19, #0 ' reg <- coni
C_svmgk_696de09b_L_T_num_L000300_313
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_svmgk_696de09b_L_T_num_L000300_301 ' JUMPV addrg
C_svmgk_696de09b_L_T_num_L000300_309
 rdlong r2, r21 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgi_696de09b_L_T_floatint_L000270
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_svmgk_696de09b_L_T_num_L000300_301
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgl_696de09b_L_E_num_L000314 ' <symbol:LEnum>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_svmgl_696de09b_L_E_num_L000314_316 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_svmgl_696de09b_L_E_num_L000314_318 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdlong r20, r21 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_a jmp #\C_svmgl_696de09b_L_E_num_L000314_321 ' GTI4
 mov r19, #1 ' reg <- coni
 jmp #\@C_svmgl_696de09b_L_E_num_L000314_322 ' JUMPV addrg
C_svmgl_696de09b_L_E_num_L000314_321
 mov r19, #0 ' reg <- coni
C_svmgl_696de09b_L_E_num_L000314_322
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_svmgl_696de09b_L_E_num_L000314_315 ' JUMPV addrg
C_svmgl_696de09b_L_E_num_L000314_318
 rdlong r2, r21 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgh_696de09b_L_E_intfloat_L000255
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_svmgl_696de09b_L_E_num_L000314_315 ' JUMPV addrg
C_svmgl_696de09b_L_E_num_L000314_316
 rdlong r22, r23 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_svmgl_696de09b_L_E_num_L000314_323 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 rdlong r20, r21 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_a jmp #\C_svmgl_696de09b_L_E_num_L000314_326 ' GTF4
 mov r19, #1 ' reg <- coni
 jmp #\@C_svmgl_696de09b_L_E_num_L000314_327 ' JUMPV addrg
C_svmgl_696de09b_L_E_num_L000314_326
 mov r19, #0 ' reg <- coni
C_svmgl_696de09b_L_E_num_L000314_327
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_svmgl_696de09b_L_E_num_L000314_315 ' JUMPV addrg
C_svmgl_696de09b_L_E_num_L000314_323
 rdlong r2, r21 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgj_696de09b_L_E_floatint_L000285
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_svmgl_696de09b_L_E_num_L000314_315
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgm_696de09b_lessthanothers_L000328 ' <symbol:lessthanothers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_svmgm_696de09b_lessthanothers_L000328_330 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_svmgm_696de09b_lessthanothers_L000328_330 ' NEI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgf_696de09b_l_strcmp_L000219
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_ae jmp #\C_svmgm_696de09b_lessthanothers_L000328_333 ' GEI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_svmgm_696de09b_lessthanothers_L000328_334 ' JUMPV addrg
C_svmgm_696de09b_lessthanothers_L000328_333
 mov r17, #0 ' reg <- coni
C_svmgm_696de09b_lessthanothers_L000328_334
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_svmgm_696de09b_lessthanothers_L000328_329 ' JUMPV addrg
C_svmgm_696de09b_lessthanothers_L000328_330
 mov r2, #20 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__callorderT_M_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_svmgm_696de09b_lessthanothers_L000328_329
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaV_lessthan

 alignl ' align long
C_luaV__lessthan ' <symbol:luaV_lessthan>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #3 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__lessthan_336 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__lessthan_336 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgk_696de09b_L_T_num_L000300
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaV__lessthan_335 ' JUMPV addrg
C_luaV__lessthan_336
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgm_696de09b_lessthanothers_L000328
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaV__lessthan_335
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_svmgn_696de09b_lessequalothers_L000338 ' <symbol:lessequalothers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_svmgn_696de09b_lessequalothers_L000338_340 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_svmgn_696de09b_lessequalothers_L000338_340 ' NEI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgf_696de09b_l_strcmp_L000219
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_a jmp #\C_svmgn_696de09b_lessequalothers_L000338_343 ' GTI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_svmgn_696de09b_lessequalothers_L000338_344 ' JUMPV addrg
C_svmgn_696de09b_lessequalothers_L000338_343
 mov r17, #0 ' reg <- coni
C_svmgn_696de09b_lessequalothers_L000338_344
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_svmgn_696de09b_lessequalothers_L000338_339 ' JUMPV addrg
C_svmgn_696de09b_lessequalothers_L000338_340
 mov r2, #21 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__callorderT_M_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_svmgn_696de09b_lessequalothers_L000338_339
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaV_lessequal

 alignl ' align long
C_luaV__lessequal ' <symbol:luaV_lessequal>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #3 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__lessequal_346 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__lessequal_346 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgl_696de09b_L_E_num_L000314
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaV__lessequal_345 ' JUMPV addrg
C_luaV__lessequal_346
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgn_696de09b_lessequalothers_L000338
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaV__lessequal_345
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaV_equalobj

 alignl ' align long
C_luaV__equalobj ' <symbol:luaV_equalobj>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #63 ' BANDI4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #63 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__equalobj_349 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_353 ' NEI4
 cmps r22,  #3 wz
 if_z jmp #\C_luaV__equalobj_351 ' EQI4
C_luaV__equalobj_353
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_351
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__equalobj_355 ' EQI4
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaV__equalobj_355 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_355 ' NEI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_356 ' JUMPV addrg
C_luaV__equalobj_355
 mov r17, #0 ' reg <- coni
C_luaV__equalobj_356
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_349
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22
 and r17, #63 ' BANDI4 coni
 cmps r17,  #0 wcz
 if_b jmp #\C_luaV__equalobj_357 ' LTI4
 cmps r17,  #7 wcz
 if_a jmp #\C_luaV__equalobj_423 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaV__equalobj_424_L000426 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__equalobj_424_L000426 ' <symbol:424>
 long @C_luaV__equalobj_360
 long @C_luaV__equalobj_360
 long @C_luaV__equalobj_369
 long @C_luaV__equalobj_361
 long @C_luaV__equalobj_377
 long @C_luaV__equalobj_401
 long @C_luaV__equalobj_357
 long @C_luaV__equalobj_382

' Catalina Code

DAT ' code segment
C_luaV__equalobj_423
 cmps r17,  #17 wcz
 if_b jmp #\C_luaV__equalobj_357 ' LTI4
 cmps r17,  #22 wcz
 if_a jmp #\C_luaV__equalobj_357 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaV__equalobj_427_L000429-68 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__equalobj_427_L000429 ' <symbol:427>
 long @C_luaV__equalobj_360
 long @C_luaV__equalobj_357
 long @C_luaV__equalobj_365
 long @C_luaV__equalobj_381
 long @C_luaV__equalobj_357
 long @C_luaV__equalobj_373

' Catalina Code

DAT ' code segment
C_luaV__equalobj_360
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_361
 rdlong r22, r21 ' reg <- INDIRI4 reg
 rdlong r20, r19 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_363 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_364 ' JUMPV addrg
C_luaV__equalobj_363
 mov r15, #0 ' reg <- coni
C_luaV__equalobj_364
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_365
 rdlong r22, r21 ' reg <- INDIRF4 reg
 rdlong r20, r19 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_luaV__equalobj_367 ' NEF4
 mov r13, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_368 ' JUMPV addrg
C_luaV__equalobj_367
 mov r13, #0 ' reg <- coni
C_luaV__equalobj_368
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_369
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_371  ' NEU4
 mov r11, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_372 ' JUMPV addrg
C_luaV__equalobj_371
 mov r11, #0 ' reg <- coni
C_luaV__equalobj_372
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_373
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_375  ' NEU4
 mov r9, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_376 ' JUMPV addrg
C_luaV__equalobj_375
 mov r9, #0 ' reg <- coni
C_luaV__equalobj_376
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_377
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_379  ' NEU4
 mov r7, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_380 ' JUMPV addrg
C_luaV__equalobj_379
 mov r7, #0 ' reg <- coni
C_luaV__equalobj_380
 mov r0, r7 ' CVI, CVU or LOAD
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_381
 rdlong r2, r19 ' reg <- INDIRP4 reg
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__eqlngstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_382
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_383  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_383
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_385  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_385
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_389  ' NEU4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_390 ' JUMPV addrg
C_luaV__equalobj_389
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__equalobj_391 ' EQU4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_392 ' JUMPV addrg
C_luaV__equalobj_391
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #172 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #5 ' reg ARG coni
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__equalobj_392
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__equalobj_390
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_358  ' NEU4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_397  ' NEU4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_398 ' JUMPV addrg
C_luaV__equalobj_397
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__equalobj_399 ' EQU4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_400 ' JUMPV addrg
C_luaV__equalobj_399
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #172 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #5 ' reg ARG coni
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__equalobj_400
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__equalobj_398
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_358 ' JUMPV addrg
C_luaV__equalobj_401
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_402  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_402
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_404  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_404
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_408  ' NEU4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_409 ' JUMPV addrg
C_luaV__equalobj_408
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__equalobj_410 ' EQU4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_411 ' JUMPV addrg
C_luaV__equalobj_410
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #172 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #5 ' reg ARG coni
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__equalobj_411
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__equalobj_409
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_358  ' NEU4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_416  ' NEU4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_417 ' JUMPV addrg
C_luaV__equalobj_416
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__equalobj_418 ' EQU4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_419 ' JUMPV addrg
C_luaV__equalobj_418
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #172 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #5 ' reg ARG coni
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__equalobj_419
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__equalobj_417
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__equalobj_358 ' JUMPV addrg
C_luaV__equalobj_357
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_luaV__equalobj_421  ' NEU4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__equalobj_422 ' JUMPV addrg
C_luaV__equalobj_421
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__equalobj_422
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_358
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__equalobj_431  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaV__equalobj_348 ' JUMPV addrg
C_luaV__equalobj_431
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__callT_M_res
 add SP, #16 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_luaV__equalobj_434 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__equalobj_434 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_luaV__equalobj_435 ' JUMPV addrg
C_luaV__equalobj_434
 mov r15, #0 ' reg <- coni
C_luaV__equalobj_435
 mov r0, r15 ' CVI, CVU or LOAD
C_luaV__equalobj_348
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


 alignl ' align long
C_svmgs_696de09b_copy2buff_L000436 ' <symbol:copy2buff>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
C_svmgs_696de09b_copy2buff_L000436_438
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, r23
 neg r22, r22 ' SUBI/P (2)
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r22, r15
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #255 wz
 if_z jmp #\C_svmgs_696de09b_copy2buff_L000436_442 ' EQI4
 mov r22, r15
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_svmgs_696de09b_copy2buff_L000436_443 ' JUMPV addrg
C_svmgs_696de09b_copy2buff_L000436_442
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRU4 reg
C_svmgs_696de09b_copy2buff_L000436_443
 mov r13, r11 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r13 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r15
 adds r3, #16 ' ADDP4 coni
 mov r4, r17 ' ADDI/P
 adds r4, r19 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 add r17, r13 ' ADDU (1)
' C_svmgs_696de09b_copy2buff_L000436_439 ' (symbol refcount = 0)
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_a jmp #\C_svmgs_696de09b_copy2buff_L000436_438 ' GTI4
' C_svmgs_696de09b_copy2buff_L000436_437 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaV_concat

 alignl ' align long
C_luaV__concat ' <symbol:luaV_concat>
 calld PA,#NEWF
 sub SP, #40
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #1 wz
 if_nz jmp #\C_luaV__concat_445 ' NEI4
 jmp #\@C_luaV__concat_444 ' JUMPV addrg
C_luaV__concat_445
C_luaV__concat_447
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r17, #2 ' reg <- coni
 mov r22, ##-12 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #4 wz
 if_z jmp #\C_luaV__concat_453 ' EQI4
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__concat_454 ' NEI4
C_luaV__concat_453
 mov r22, ##-4 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #4 wz
 if_z jmp #\C_luaV__concat_450 ' EQI4
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__concat_454 ' NEI4
 mov r22, ##-8 ' reg <- con
 mov r2, r19 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__tostring
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__concat_450 ' NEI4
C_luaV__concat_454
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaT__tryconcatT_M_ ' CALL addrg
 jmp #\@C_luaV__concat_451 ' JUMPV addrg
C_luaV__concat_450
 mov r22, ##-4 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #68 wz
 if_nz jmp #\C_luaV__concat_455 ' NEI4
 mov r22, ##-8 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__concat_455 ' NEI4
 mov r22, ##-12 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #4 wz
 if_z jmp #\C_luaV__concat_458 ' EQI4
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__concat_458 ' NEI4
 mov r22, ##-16 ' reg <- con
 mov r2, r19 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__tostring
 add SP, #4 ' CALL addrg
C_luaV__concat_458
 jmp #\@C_luaV__concat_456 ' JUMPV addrg
C_luaV__concat_455
 mov r22, ##-12 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #68 wz
 if_nz jmp #\C_luaV__concat_459 ' NEI4
 mov r22, ##-16 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__concat_459 ' NEI4
 mov r22, ##-16 ' reg <- con
 mov r15, r19 ' ADDI/P
 adds r15, r22 ' ADDI/P (3)
 mov r22, ##-8 ' reg <- con
 mov r13, r19 ' ADDI/P
 adds r13, r22 ' ADDI/P (3)
 mov r0, r15 ' CVI, CVU or LOAD
 mov r1, r13 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__concat_460 ' JUMPV addrg
C_luaV__concat_459
 mov r22, ##-8 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #255 wz
 if_z jmp #\C_luaV__concat_462 ' EQI4
 mov r22, ##-8 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #\@C_luaV__concat_463 ' JUMPV addrg
C_luaV__concat_462
 mov r22, ##-8 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRU4 reg
C_luaV__concat_463
 mov r15, r11 ' CVI, CVU or LOAD
 mov r17, #1 ' reg <- coni
 jmp #\@C_luaV__concat_467 ' JUMPV addrg
C_luaV__concat_464
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 subs r22, r19
 neg r22, r22 ' SUBI/P (2)
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #255 wz
 if_z jmp #\C_luaV__concat_469 ' EQI4
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 subs r22, r19
 neg r22, r22 ' SUBI/P (2)
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r7, r22 ' CVI, CVU or LOAD
 jmp #\@C_luaV__concat_470 ' JUMPV addrg
C_luaV__concat_469
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 subs r22, r19
 neg r22, r22 ' SUBI/P (2)
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r7, r22 ' reg <- INDIRU4 reg
C_luaV__concat_470
 mov r9, r7 ' CVI, CVU or LOAD
 mov r22, ##$7fffffeb ' reg <- con
 sub r22, r15 ' SUBU (1)
 cmp r9, r22 wcz 
 if_b jmp #\C_luaV__concat_471 ' LTU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 shl r20, #3 ' LSHI4 coni
 subs r20, r19
 neg r20, r20 ' SUBI/P (2)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, ##@C_luaV__concat_473_L000474 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__concat_471
 add r15, r9 ' ADDU (1)
' C_luaV__concat_465 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_luaV__concat_467
 cmps r17, r21 wcz
 if_ae jmp #\C_luaV__concat_476 ' GEI4
 mov r22, #3 ' reg <- coni
 mov r20, r17
 shl r20, #3 ' LSHI4 coni
 subs r20, r19
 neg r20, r20 ' SUBI/P (2)
 mov r18, ##-4 ' reg <- con
 adds r18, r20 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #15 ' BANDI4 coni
 cmps r18,  #4 wz
 if_z jmp #\C_luaV__concat_464 ' EQI4
 cmps r18, r22 wz
 if_nz jmp #\C_luaV__concat_476 ' NEI4
 mov r22, ##-8 ' reg <- con
 mov r2, r20 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__tostring
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__concat_464 ' NEI4
C_luaV__concat_476
 cmp r15,  #40 wcz 
 if_a jmp #\C_luaV__concat_477 ' GTU4
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgs_696de09b_copy2buff_L000436
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #\@C_luaV__concat_478 ' JUMPV addrg
C_luaV__concat_477
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__createlngstrobj
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r13
 adds r2, #16 ' ADDP4 coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgs_696de09b_copy2buff_L000436
 add SP, #8 ' CALL addrg
C_luaV__concat_478
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 mov r9, r19 ' SUBI/P
 subs r9, r22 ' SUBI/P (3)
 mov r7, r13 ' CVI, CVU or LOAD
 wrlong r7, r9 ' ASGNP4 reg reg
 mov r22, r9
 adds r22, #4 ' ADDP4 coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaV__concat_460
C_luaV__concat_456
C_luaV__concat_451
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 subs r21, r22 ' SUBI/P (1)
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r17
 shl r18, #3 ' LSHI4 coni
 subs r18, #8 ' SUBI4 coni
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_luaV__concat_448 ' (symbol refcount = 0)
 cmps r21,  #1 wcz
 if_a jmp #\C_luaV__concat_447 ' GTI4
C_luaV__concat_444
 calld PA,#POPM ' restore registers
 add SP, #40 ' framesize
 calld PA,#RETF


' Catalina Export luaV_objlen

 alignl ' align long
C_luaV__objlen ' <symbol:luaV_objlen>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22
 and r17, #63 ' BANDI4 coni
 mov r22, #4 ' reg <- coni
 cmps r17, r22 wz
 if_z jmp #\C_luaV__objlen_492 ' EQI4
 cmps r17,  #5 wz
 if_z jmp #\C_luaV__objlen_483 ' EQI4
 cmps r17, r22 wcz
 if_b jmp #\C_luaV__objlen_480 ' LTI4
' C_luaV__objlen_498 ' (symbol refcount = 0)
 cmps r17,  #20 wz
 if_z jmp #\C_luaV__objlen_493 ' EQI4
 jmp #\@C_luaV__objlen_480 ' JUMPV addrg
C_luaV__objlen_483
 rdlong r22, r19 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__objlen_486  ' NEU4
 mov r15, ##0 ' reg <- con
 jmp #\@C_luaV__objlen_487 ' JUMPV addrg
C_luaV__objlen_486
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__objlen_488 ' EQU4
 mov r13, ##0 ' reg <- con
 jmp #\@C_luaV__objlen_489 ' JUMPV addrg
C_luaV__objlen_488
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #168 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #4 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_luaV__objlen_489
 mov r15, r13 ' CVI, CVU or LOAD
C_luaV__objlen_487
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__objlen_490 ' EQU4
 jmp #\@C_luaV__objlen_481 ' JUMPV addrg
C_luaV__objlen_490
 mov RI, FP
 sub RI, #-(-16)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__getn ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__objlen_479 ' JUMPV addrg
C_luaV__objlen_492
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__objlen_479 ' JUMPV addrg
C_luaV__objlen_493
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__objlen_479 ' JUMPV addrg
C_luaV__objlen_480
 mov r2, #4 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__objlen_481 ' NEI4
 mov r2, ##@C_luaV__objlen_496_L000497 ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
C_luaV__objlen_481
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__callT_M_res
 add SP, #16 ' CALL addrg
C_luaV__objlen_479
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export luaV_idiv

 alignl ' align long
C_luaV__idiv ' <symbol:luaV_idiv>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 add r20, #1 ' ADDU4 coni
 cmp r20, r22 wcz 
 if_a jmp #\C_luaV__idiv_500 ' GTU4
 cmps r19,  #0 wz
 if_nz jmp #\C_luaV__idiv_502 ' NEI4
 mov r2, ##@C_luaV__idiv_504_L000505 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__idiv_502
 mov r22, #0 ' reg <- coni
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_luaV__idiv_499 ' JUMPV addrg
C_luaV__idiv_500
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r20, r21 ' BXORI/U
 xor r20, r19 ' BXORI/U (3)
 cmps r20, r22 wcz
 if_ae jmp #\C_luaV__idiv_506 ' GEI4
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r22 wz
 if_z jmp #\C_luaV__idiv_506 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__idiv_506
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_luaV__idiv_499
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaV_mod

 alignl ' align long
C_luaV__mod ' <symbol:luaV_mod>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 add r20, #1 ' ADDU4 coni
 cmp r20, r22 wcz 
 if_a jmp #\C_luaV__mod_509 ' GTU4
 cmps r19,  #0 wz
 if_nz jmp #\C_luaV__mod_511 ' NEI4
 mov r2, ##@C_luaV__mod_513_L000514 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__mod_511
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaV__mod_508 ' JUMPV addrg
C_luaV__mod_509
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r1, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__mod_515 ' EQI4
 xor r22, r19 ' BXORI/U (1)
 cmps r22, r20 wcz
 if_ae jmp #\C_luaV__mod_515 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__mod_515
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_luaV__mod_508
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaV_modf

 alignl ' align long
C_luaV__modf ' <symbol:luaV_modf>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fmod
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_luaV__modf_523 ' LEF4
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_luaV__modf_525 ' GEF4
 mov r13, #1 ' reg <- coni
 jmp #\@C_luaV__modf_526 ' JUMPV addrg
C_luaV__modf_525
 mov r13, #0 ' reg <- coni
C_luaV__modf_526
 mov r15, r13 ' CVI, CVU or LOAD
 jmp #\@C_luaV__modf_524 ' JUMPV addrg
C_luaV__modf_523
 mov r22, ##@C_svmg4_696de09b_forlimit_L000061_77_L000078
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_luaV__modf_527 ' GEF4
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_luaV__modf_527 ' LEF4
 mov r11, #1 ' reg <- coni
 jmp #\@C_luaV__modf_528 ' JUMPV addrg
C_luaV__modf_527
 mov r11, #0 ' reg <- coni
C_luaV__modf_528
 mov r15, r11 ' CVI, CVU or LOAD
C_luaV__modf_524
 cmps r15,  #0 wz
 if_z jmp #\C_luaV__modf_518 ' EQI4
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r17, r0 ' CVI, CVU or LOAD
C_luaV__modf_518
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaV__modf_517 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaV_shiftl

 alignl ' align long
C_luaV__shiftl ' <symbol:luaV_shiftl>
 calld PA,#PSHM
 long $500000 ' save registers
 cmps r2,  #0 wcz
 if_ae jmp #\C_luaV__shiftl_530 ' GEI4
 mov r22, ##-32 ' reg <- con
 cmps r2, r22 wcz
 if_a jmp #\C_luaV__shiftl_532 ' GTI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaV__shiftl_529 ' JUMPV addrg
C_luaV__shiftl_532
 mov r22, r3 ' CVI, CVU or LOAD
 neg r20, r2 ' NEGI4
 shr r22, r20 ' RSHU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_luaV__shiftl_529 ' JUMPV addrg
C_luaV__shiftl_530
 cmps r2,  #32 wcz
 if_b jmp #\C_luaV__shiftl_534 ' LTI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaV__shiftl_529 ' JUMPV addrg
C_luaV__shiftl_534
 mov r22, r3 ' CVI, CVU or LOAD
 mov r20, r2 ' CVI, CVU or LOAD
 shl r22, r20 ' LSHI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
C_luaV__shiftl_529
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_svmg11_696de09b_pushclosure_L000536 ' <symbol:pushclosure>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #60 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRP4 reg
 mov r2, r9 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__newL_closure
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
 mov r7, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r13, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r7 ' ASGNP4 reg reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #70 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r15, #0 ' reg <- coni
 jmp #\@C_svmg11_696de09b_pushclosure_L000536_541 ' JUMPV addrg
C_svmg11_696de09b_pushclosure_L000536_538
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 adds r22, r11 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_svmg11_696de09b_pushclosure_L000536_542 ' EQI4
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 adds r22, r11 ' ADDI/P (1)
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #3 ' LSHI4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r19 ' ADDI/P (3)
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__findupval
 add SP, #4 ' CALL addrg
 mov r20, r15
 shl r20, #2 ' LSHI4 coni
 mov r18, r13
 adds r18, #16 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 wrlong r0, r20 ' ASGNP4 reg reg
 jmp #\@C_svmg11_696de09b_pushclosure_L000536_543 ' JUMPV addrg
C_svmg11_696de09b_pushclosure_L000536_542
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, r13
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15
 shl r20, #3 ' LSHI4 coni
 adds r20, r11 ' ADDI/P (1)
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #2 ' LSHI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_svmg11_696de09b_pushclosure_L000536_543
 mov r22, #0 ' reg <- coni
 mov r20, r13
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_svmg11_696de09b_pushclosure_L000536_545 ' EQI4
 mov r20, r15
 shl r20, #2 ' LSHI4 coni
 mov r18, r13
 adds r18, #16 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_svmg11_696de09b_pushclosure_L000536_545 ' EQI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, r13
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r13 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_svmg11_696de09b_pushclosure_L000536_545 ' JUMPV addrg
C_svmg11_696de09b_pushclosure_L000536_545
' C_svmg11_696de09b_pushclosure_L000536_539 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_svmg11_696de09b_pushclosure_L000536_541
 cmps r15, r9 wcz
 if_b jmp #\C_svmg11_696de09b_pushclosure_L000536_538 ' LTI4
' C_svmg11_696de09b_pushclosure_L000536_537 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaV_finishOp

 alignl ' align long
C_luaV__finishO_p ' <symbol:luaV_finishOp>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 reg
 cmps r19,  #11 wcz
 if_b jmp #\C_luaV__finishO_p_548 ' LTI4
 cmps r19,  #20 wcz
 if_a jmp #\C_luaV__finishO_p_561 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaV__finishO_p_562_L000564-44 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__finishO_p_562_L000564 ' <symbol:562>
 long @C_luaV__finishO_p_551
 long @C_luaV__finishO_p_551
 long @C_luaV__finishO_p_551
 long @C_luaV__finishO_p_551
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_551

' Catalina Code

DAT ' code segment
C_luaV__finishO_p_561
 cmps r19,  #46 wcz
 if_b jmp #\C_luaV__finishO_p_548 ' LTI4
 cmps r19,  #70 wcz
 if_a jmp #\C_luaV__finishO_p_548 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaV__finishO_p_566_L000568-184 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__finishO_p_566_L000568 ' <symbol:566>
 long @C_luaV__finishO_p_550
 long @C_luaV__finishO_p_550
 long @C_luaV__finishO_p_550
 long @C_luaV__finishO_p_551
 long @C_luaV__finishO_p_551
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_551
 long @C_luaV__finishO_p_558
 long @C_luaV__finishO_p_559
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_552
 long @C_luaV__finishO_p_552
 long @C_luaV__finishO_p_552
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_552
 long @C_luaV__finishO_p_552
 long @C_luaV__finishO_p_552
 long @C_luaV__finishO_p_552
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_548
 long @C_luaV__finishO_p_560

' Catalina Code

DAT ' code segment
C_luaV__finishO_p_550
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__finishO_p_548 ' JUMPV addrg
C_luaV__finishO_p_551
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__finishO_p_548 ' JUMPV addrg
C_luaV__finishO_p_552
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_luaV__finishO_p_554 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__finishO_p_554 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_luaV__finishO_p_555 ' JUMPV addrg
C_luaV__finishO_p_554
 mov r17, #0 ' reg <- coni
C_luaV__finishO_p_555
 mov RI, FP
 sub RI, #-(-20)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__finishO_p_548 ' EQI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_luaV__finishO_p_548 ' JUMPV addrg
C_luaV__finishO_p_558
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-16 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-28)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__concat
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__finishO_p_548 ' JUMPV addrg
C_luaV__finishO_p_559
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-4 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_luaV__finishO_p_548 ' JUMPV addrg
C_luaV__finishO_p_560
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-4 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaV__finishO_p_548
' C_luaV__finishO_p_546 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Export luaV_execute

 alignl ' align long
C_luaV__execute ' <symbol:luaV_execute>
 calld PA,#NEWF
 sub SP, #56
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
C_luaV__execute_571
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_572
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r11, r22 ' reg <- INDIRP4 reg
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #48 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 cmps r15,  #0 wz
 if_z jmp #\C_luaV__execute_573 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaG__tracecall ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_luaV__execute_573
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r19, r22
 adds r19, #8 ' ADDP4 coni
C_luaV__execute_575
 cmps r15,  #0 wz
 if_z jmp #\C_luaV__execute_579 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__traceexec
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r19, r22
 adds r19, #8 ' ADDP4 coni
C_luaV__execute_579
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r22, r9
 and r22, #127 ' BANDU4 coni
 mov r7, r22 ' CVI, CVU or LOAD
 cmps r7,  #0 wcz
 if_b jmp #\C_luaV__execute_575 ' LTI4
 cmps r7,  #82 wcz
 if_a jmp #\C_luaV__execute_575 ' GTI4
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaV__execute_1294_L001296 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__execute_1294_L001296 ' <symbol:1294>
 long @C_luaV__execute_584
 long @C_luaV__execute_585
 long @C_luaV__execute_586
 long @C_luaV__execute_587
 long @C_luaV__execute_588
 long @C_luaV__execute_589
 long @C_luaV__execute_590
 long @C_luaV__execute_591
 long @C_luaV__execute_592
 long @C_luaV__execute_596
 long @C_luaV__execute_597
 long @C_luaV__execute_602
 long @C_luaV__execute_611
 long @C_luaV__execute_632
 long @C_luaV__execute_644
 long @C_luaV__execute_653
 long @C_luaV__execute_669
 long @C_luaV__execute_697
 long @C_luaV__execute_716
 long @C_luaV__execute_732
 long @C_luaV__execute_742
 long @C_luaV__execute_754
 long @C_luaV__execute_759
 long @C_luaV__execute_776
 long @C_luaV__execute_793
 long @C_luaV__execute_810
 long @C_luaV__execute_827
 long @C_luaV__execute_847
 long @C_luaV__execute_862
 long @C_luaV__execute_879
 long @C_luaV__execute_885
 long @C_luaV__execute_891
 long @C_luaV__execute_897
 long @C_luaV__execute_903
 long @C_luaV__execute_909
 long @C_luaV__execute_926
 long @C_luaV__execute_943
 long @C_luaV__execute_960
 long @C_luaV__execute_977
 long @C_luaV__execute_995
 long @C_luaV__execute_1010
 long @C_luaV__execute_1027
 long @C_luaV__execute_1036
 long @C_luaV__execute_1045
 long @C_luaV__execute_1063
 long @C_luaV__execute_1054
 long @C_luaV__execute_1072
 long @C_luaV__execute_1073
 long @C_luaV__execute_1074
 long @C_luaV__execute_1075
 long @C_luaV__execute_1086
 long @C_luaV__execute_1092
 long @C_luaV__execute_1096
 long @C_luaV__execute_1097
 long @C_luaV__execute_1100
 long @C_luaV__execute_1101
 long @C_luaV__execute_1102
 long @C_luaV__execute_1103
 long @C_luaV__execute_1106
 long @C_luaV__execute_1116
 long @C_luaV__execute_1126
 long @C_luaV__execute_1129
 long @C_luaV__execute_1142
 long @C_luaV__execute_1155
 long @C_luaV__execute_1168
 long @C_luaV__execute_1181
 long @C_luaV__execute_1194
 long @C_luaV__execute_1200
 long @C_luaV__execute_1207
 long @C_luaV__execute_1212
 long @C_luaV__execute_1223
 long @C_luaV__execute_1234
 long @C_luaV__execute_1241
 long @C_luaV__execute_1252
 long @C_luaV__execute_1259
 long @C_luaV__execute_1262
 long @C_luaV__execute_1264
 long @C_luaV__execute_1268
 long @C_luaV__execute_1271
 long @C_luaV__execute_1286
 long @C_luaV__execute_1289
 long @C_luaV__execute_1290
 long @C_luaV__execute_575

' Catalina Code

DAT ' code segment
C_luaV__execute_584
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_585
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##65535 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_586
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##65535 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r0, r20 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_587
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_588
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 rdlong r22, r17 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_589
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_590
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_591
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_592
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_593
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNP4 addrli reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaV__execute_594 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r20, RI ' ASGNI4 addrli reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__execute_593 ' NEI4
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_596
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, r11
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_597
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #16 ' reg <- coni
 mov RI, r9
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #255 ' BANDU4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r11
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_599 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_599 ' EQI4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_599 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_luaV__execute_599 ' JUMPV addrg
 jmp #\@C_luaV__execute_599 ' JUMPV addrg
C_luaV__execute_599
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_602
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #16 ' reg <- coni
 mov RI, r9
 shr RI, r22
 mov r22, RI ' RSHU (2)
 and r22, #255 ' BANDU4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r11
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_607 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_608 ' JUMPV addrg
C_luaV__execute_607
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_609 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_610 ' JUMPV addrg
C_luaV__execute_609
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_610
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_608
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_603 ' EQI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_603
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_611
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_620 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_622 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_623 ' JUMPV addrg
C_luaV__execute_622
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaV__execute_626 ' GEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_627 ' JUMPV addrg
C_luaV__execute_626
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_627
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_624 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_625 ' JUMPV addrg
C_luaV__execute_624
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_625
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_623
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_621 ' JUMPV addrg
C_luaV__execute_620
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_628 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_629 ' JUMPV addrg
C_luaV__execute_628
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_630 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_631 ' JUMPV addrg
C_luaV__execute_630
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_631
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_629
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_621
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_612 ' EQI4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-56) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_612
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_632
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_638 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_639 ' JUMPV addrg
C_luaV__execute_638
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaV__execute_642 ' GEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_643 ' JUMPV addrg
C_luaV__execute_642
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_643
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_640 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_641 ' JUMPV addrg
C_luaV__execute_640
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_641
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_639
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_633 ' EQI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_633
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_644
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_649 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_650 ' JUMPV addrg
C_luaV__execute_649
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_651 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_652 ' JUMPV addrg
C_luaV__execute_651
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_652
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_650
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_645 ' EQI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_645
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_653
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r11
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_655 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_656 ' JUMPV addrg
C_luaV__execute_655
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_656
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_661 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_662 ' JUMPV addrg
C_luaV__execute_661
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_663 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_664 ' JUMPV addrg
C_luaV__execute_663
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_664
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_662
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_657 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_666 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_666 ' EQI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_666 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__execute_666 ' JUMPV addrg
 jmp #\@C_luaV__execute_666 ' JUMPV addrg
C_luaV__execute_666
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_657
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_669
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_671 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_672 ' JUMPV addrg
C_luaV__execute_671
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_672
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_681 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_683 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_684 ' JUMPV addrg
C_luaV__execute_683
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaV__execute_687 ' GEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_688 ' JUMPV addrg
C_luaV__execute_687
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_688
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_685 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_686 ' JUMPV addrg
C_luaV__execute_685
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_686
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_684
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_682 ' JUMPV addrg
C_luaV__execute_681
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_689 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_690 ' JUMPV addrg
C_luaV__execute_689
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_691 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_692 ' JUMPV addrg
C_luaV__execute_691
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_692
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_690
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_682
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_673 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-56)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-60)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-60) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_694 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_694 ' EQI4
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_694 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__execute_694 ' JUMPV addrg
 jmp #\@C_luaV__execute_694 ' JUMPV addrg
C_luaV__execute_694
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_673
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_697
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_699 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_700 ' JUMPV addrg
C_luaV__execute_699
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_700
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_706 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_707 ' JUMPV addrg
C_luaV__execute_706
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaV__execute_710 ' GEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_711 ' JUMPV addrg
C_luaV__execute_710
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_711
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_708 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_709 ' JUMPV addrg
C_luaV__execute_708
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_709
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_707
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_701 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_713 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_713 ' EQI4
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_713 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__execute_713 ' JUMPV addrg
 jmp #\@C_luaV__execute_713 ' JUMPV addrg
C_luaV__execute_713
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_701
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-44) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_716
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_718 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_719 ' JUMPV addrg
C_luaV__execute_718
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_719
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_724 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_725 ' JUMPV addrg
C_luaV__execute_724
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_726 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_727 ' JUMPV addrg
C_luaV__execute_726
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_727
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_725
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_720 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_729 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_729 ' EQI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_729 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__execute_729 ' JUMPV addrg
 jmp #\@C_luaV__execute_729 ' JUMPV addrg
C_luaV__execute_729
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_720
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_732
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_luaV__execute_733 ' LEI4
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_733
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_735 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 shr r20, #7 ' RSHU4 coni
 mov r18, ##$1ffffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 shl r20, #8 ' LSHI4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_735
 adds r17, #4 ' ADDP4 coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__new ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_739 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_737 ' EQI4
C_luaV__execute_739
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
C_luaV__execute_737
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_luaV__execute_575 ' LEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_742
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_744 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaV__execute_745 ' JUMPV addrg
C_luaV__execute_744
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_745
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_luaV__execute_750 ' EQI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_751 ' JUMPV addrg
C_luaV__execute_750
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getstr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_752 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_753 ' JUMPV addrg
C_luaV__execute_752
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_753
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_751
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_746 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_746
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_754
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_755 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_755
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_575 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_759
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_760 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_760 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_760
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_768 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_769 ' JUMPV addrg
C_luaV__execute_768
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_770 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_771 ' JUMPV addrg
C_luaV__execute_770
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_771
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_769
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_772 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_773 ' JUMPV addrg
C_luaV__execute_772
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_774 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_775 ' JUMPV addrg
C_luaV__execute_774
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_775
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_773
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_776
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_777 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_777 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_777
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_785 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_786 ' JUMPV addrg
C_luaV__execute_785
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_787 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_788 ' JUMPV addrg
C_luaV__execute_787
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_788
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_786
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_789 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_790 ' JUMPV addrg
C_luaV__execute_789
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_791 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_792 ' JUMPV addrg
C_luaV__execute_791
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_792
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_790
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_793
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_794 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_794 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_794
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_802 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_803 ' JUMPV addrg
C_luaV__execute_802
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_804 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_805 ' JUMPV addrg
C_luaV__execute_804
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_805
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_803
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_806 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_807 ' JUMPV addrg
C_luaV__execute_806
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_808 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_809 ' JUMPV addrg
C_luaV__execute_808
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_809
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_807
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_810
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_811 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_811 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__mod
 add SP, #8 ' CALL addrg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_811
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_819 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_820 ' JUMPV addrg
C_luaV__execute_819
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_821 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_822 ' JUMPV addrg
C_luaV__execute_821
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_822
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_820
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_823 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_824 ' JUMPV addrg
C_luaV__execute_823
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_825 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_826 ' JUMPV addrg
C_luaV__execute_825
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_826
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_824
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__modf
 add SP, #8 ' CALL addrg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_827
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_834 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_835 ' JUMPV addrg
C_luaV__execute_834
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_836 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_837 ' JUMPV addrg
C_luaV__execute_836
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_837
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_835
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_838 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_839 ' JUMPV addrg
C_luaV__execute_838
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_840 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_841 ' JUMPV addrg
C_luaV__execute_840
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_841
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_839
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_luaV__execute_845_L000846
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_luaV__execute_843 ' NEF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-48)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #\@C_luaV__execute_844 ' JUMPV addrg
C_luaV__execute_843
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNF4 addrli reg
C_luaV__execute_844
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_847
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_854 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_855 ' JUMPV addrg
C_luaV__execute_854
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_856 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_857 ' JUMPV addrg
C_luaV__execute_856
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_857
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_855
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_858 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_859 ' JUMPV addrg
C_luaV__execute_858
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_860 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_861 ' JUMPV addrg
C_luaV__execute_860
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_861
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_859
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_862
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_863 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_863 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__idiv
 add SP, #8 ' CALL addrg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_863
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_871 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_872 ' JUMPV addrg
C_luaV__execute_871
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_873 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_874 ' JUMPV addrg
C_luaV__execute_873
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_874
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_872
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_875 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_876 ' JUMPV addrg
C_luaV__execute_875
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_877 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_878 ' JUMPV addrg
C_luaV__execute_877
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_878
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_876
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_floor ' CALL addrg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_879
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_883 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_884 ' JUMPV addrg
C_luaV__execute_883
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_884
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_885
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_889 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_890 ' JUMPV addrg
C_luaV__execute_889
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_890
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_891
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_895 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_896 ' JUMPV addrg
C_luaV__execute_895
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_896
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 xor r20, r18 ' BXORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_897
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_901 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_902 ' JUMPV addrg
C_luaV__execute_901
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_902
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r2, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__shiftl
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_903
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_907 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_908 ' JUMPV addrg
C_luaV__execute_907
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_908
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__shiftl
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_909
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_910 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_910 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_910
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_918 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_919 ' JUMPV addrg
C_luaV__execute_918
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_920 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_921 ' JUMPV addrg
C_luaV__execute_920
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_921
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_919
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_922 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_923 ' JUMPV addrg
C_luaV__execute_922
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_924 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_925 ' JUMPV addrg
C_luaV__execute_924
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_925
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_923
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_926
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_927 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_927 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_927
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_935 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_936 ' JUMPV addrg
C_luaV__execute_935
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_937 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_938 ' JUMPV addrg
C_luaV__execute_937
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_938
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_936
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_939 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_940 ' JUMPV addrg
C_luaV__execute_939
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_941 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_942 ' JUMPV addrg
C_luaV__execute_941
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_942
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_940
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_943
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_944 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_944 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_944
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_952 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_953 ' JUMPV addrg
C_luaV__execute_952
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_954 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_955 ' JUMPV addrg
C_luaV__execute_954
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_955
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_953
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_956 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_957 ' JUMPV addrg
C_luaV__execute_956
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_958 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_959 ' JUMPV addrg
C_luaV__execute_958
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_959
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_957
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_960
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_961 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_961 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__mod
 add SP, #8 ' CALL addrg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_961
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_969 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_970 ' JUMPV addrg
C_luaV__execute_969
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_971 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_972 ' JUMPV addrg
C_luaV__execute_971
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_972
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_970
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_973 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_974 ' JUMPV addrg
C_luaV__execute_973
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_975 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_976 ' JUMPV addrg
C_luaV__execute_975
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_976
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_974
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__modf
 add SP, #8 ' CALL addrg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_977
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_984 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_985 ' JUMPV addrg
C_luaV__execute_984
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_986 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_987 ' JUMPV addrg
C_luaV__execute_986
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_987
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_985
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_988 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_989 ' JUMPV addrg
C_luaV__execute_988
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_990 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_991 ' JUMPV addrg
C_luaV__execute_990
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_991
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_989
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_luaV__execute_845_L000846
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_luaV__execute_993 ' NEF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-48)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #\@C_luaV__execute_994 ' JUMPV addrg
C_luaV__execute_993
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNF4 addrli reg
C_luaV__execute_994
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_995
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1002 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1003 ' JUMPV addrg
C_luaV__execute_1002
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1004 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1005 ' JUMPV addrg
C_luaV__execute_1004
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1005
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1003
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1006 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1007 ' JUMPV addrg
C_luaV__execute_1006
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1008 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1009 ' JUMPV addrg
C_luaV__execute_1008
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1009
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1007
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1010
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1011 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1011 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__idiv
 add SP, #8 ' CALL addrg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1011
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1019 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1020 ' JUMPV addrg
C_luaV__execute_1019
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1021 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1022 ' JUMPV addrg
C_luaV__execute_1021
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1022
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1020
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1023 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1024 ' JUMPV addrg
C_luaV__execute_1023
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1025 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1026 ' JUMPV addrg
C_luaV__execute_1025
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1026
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1024
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_floor ' CALL addrg
 mov r20, FP
 sub r20, #-(-44) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1027
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1032 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1033 ' JUMPV addrg
C_luaV__execute_1032
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1033
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1034 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1035 ' JUMPV addrg
C_luaV__execute_1034
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1035
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1036
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1041 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1042 ' JUMPV addrg
C_luaV__execute_1041
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1042
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1043 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1044 ' JUMPV addrg
C_luaV__execute_1043
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1044
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1045
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1050 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1051 ' JUMPV addrg
C_luaV__execute_1050
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1051
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1052 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1053 ' JUMPV addrg
C_luaV__execute_1052
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1053
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 xor r20, r18 ' BXORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1054
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1059 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1060 ' JUMPV addrg
C_luaV__execute_1059
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1060
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1061 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1062 ' JUMPV addrg
C_luaV__execute_1061
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1062
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__shiftl
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1063
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1068 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1069 ' JUMPV addrg
C_luaV__execute_1068
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1069
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1070 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1071 ' JUMPV addrg
C_luaV__execute_1070
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1071
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 adds r17, #4 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__shiftl
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1072
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##-8 ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1073
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##-8 ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-28)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__trybiniT_M_
 add SP, #20 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1074
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##-8 ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-28)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__trybinassocT_M_
 add SP, #20 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1075
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1076 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, FP
 sub r18, #-(-20) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1076
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1082 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1083 ' JUMPV addrg
C_luaV__execute_1082
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1084 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1085 ' JUMPV addrg
C_luaV__execute_1084
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1085
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1083
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1078 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 xor r20, Bit31 ' NEGF4
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1078
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #18 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1086
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1090 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1091 ' JUMPV addrg
C_luaV__execute_1090
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1091
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1087 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, ##$ffffffff ' reg <- con
 xor r20, r18 ' BXORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1087
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #19 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1092
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_luaV__execute_1095 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__execute_1093 ' NEI4
C_luaV__execute_1095
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1093
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1096
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r19 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__objlen
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1097
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__concat
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_luaV__execute_575 ' LEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1100
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1101
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__newtbcupval
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1102
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1103
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1104 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1104
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1106
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1107 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1107 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_ae jmp #\C_luaV__execute_1110 ' GEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1111 ' JUMPV addrg
C_luaV__execute_1110
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1111
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1108 ' JUMPV addrg
C_luaV__execute_1107
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1112 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1112 ' NEI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgk_696de09b_L_T_num_L000300
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1113 ' JUMPV addrg
C_luaV__execute_1112
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgm_696de09b_lessthanothers_L000328
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1113
C_luaV__execute_1108
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1114 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1114
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1116
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1117 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1117 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_a jmp #\C_luaV__execute_1120 ' GTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1121 ' JUMPV addrg
C_luaV__execute_1120
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1121
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1118 ' JUMPV addrg
C_luaV__execute_1117
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1122 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaV__execute_1122 ' NEI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgl_696de09b_L_E_num_L000314
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1123 ' JUMPV addrg
C_luaV__execute_1122
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmgn_696de09b_lessequalothers_L000338
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1123
C_luaV__execute_1118
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1124 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1124
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1126
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, ##0 ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1127 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1127
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1129
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1130 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_luaV__execute_1133 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1134 ' JUMPV addrg
C_luaV__execute_1133
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1134
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1131 ' JUMPV addrg
C_luaV__execute_1130
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1135 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r0, r20 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FCMP
 if_nz jmp #\C_luaV__execute_1138 ' NEF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1139 ' JUMPV addrg
C_luaV__execute_1138
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1139
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1136 ' JUMPV addrg
C_luaV__execute_1135
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1136
C_luaV__execute_1131
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1140 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1140
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1142
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1143 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_ae jmp #\C_luaV__execute_1146 ' GEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1147 ' JUMPV addrg
C_luaV__execute_1146
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1147
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1144 ' JUMPV addrg
C_luaV__execute_1143
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1148 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_luaV__execute_1151 ' GEF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1152 ' JUMPV addrg
C_luaV__execute_1151
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1152
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1149 ' JUMPV addrg
C_luaV__execute_1148
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #20 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__callorderiT_M_
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1149
C_luaV__execute_1144
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1153 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1153
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1155
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1156 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_a jmp #\C_luaV__execute_1159 ' GTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1160 ' JUMPV addrg
C_luaV__execute_1159
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1160
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1157 ' JUMPV addrg
C_luaV__execute_1156
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1161 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_a jmp #\C_luaV__execute_1164 ' GTF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1165 ' JUMPV addrg
C_luaV__execute_1164
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1165
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1162 ' JUMPV addrg
C_luaV__execute_1161
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #21 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__callorderiT_M_
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1162
C_luaV__execute_1157
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1166 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1166
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1168
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1169 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_luaV__execute_1172 ' LEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1173 ' JUMPV addrg
C_luaV__execute_1172
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1173
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1170 ' JUMPV addrg
C_luaV__execute_1169
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1174 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_luaV__execute_1177 ' LEF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1178 ' JUMPV addrg
C_luaV__execute_1177
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1178
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1175 ' JUMPV addrg
C_luaV__execute_1174
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #20 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__callorderiT_M_
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1175
C_luaV__execute_1170
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1179 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1179
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1181
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1182 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_b jmp #\C_luaV__execute_1185 ' LTI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1186 ' JUMPV addrg
C_luaV__execute_1185
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1186
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1183 ' JUMPV addrg
C_luaV__execute_1182
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaV__execute_1187 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_b jmp #\C_luaV__execute_1190 ' LTF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1191 ' JUMPV addrg
C_luaV__execute_1190
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1191
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1188 ' JUMPV addrg
C_luaV__execute_1187
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #21 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaT__callorderiT_M_
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1188
C_luaV__execute_1183
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1192 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1192
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1194
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_luaV__execute_1196 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1196 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1197 ' JUMPV addrg
C_luaV__execute_1196
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1197
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_z jmp #\C_luaV__execute_1198 ' EQI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1198
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1200
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_luaV__execute_1206 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__execute_1204 ' NEI4
C_luaV__execute_1206
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1205 ' JUMPV addrg
C_luaV__execute_1204
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1205
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 if_nz jmp #\C_luaV__execute_1201 ' NEI4
 adds r17, #4 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1201
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##67108860 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1207
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1208 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaV__execute_1208
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__precall
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaV__execute_1210  ' NEU4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1210
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRP4 reg
 jmp #\@C_luaV__execute_571 ' JUMPV addrg
C_luaV__execute_1212
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1214 ' EQI4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1215 ' JUMPV addrg
C_luaV__execute_1214
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1215
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1216 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_luaV__execute_1217 ' JUMPV addrg
C_luaV__execute_1216
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_luaV__execute_1217
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1218 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__closeupval
 add SP, #4 ' CALL addrg
C_luaV__execute_1218
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaD__pretailcall
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 cmps r0,  #0 wcz
 if_ae jmp #\C_luaV__execute_1220 ' GEI4
 jmp #\@C_luaV__execute_571 ' JUMPV addrg
C_luaV__execute_1220
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 subs r22, r20 ' SUBI/P (1)
 wrlong r22, r21 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_1222 ' JUMPV addrg
C_luaV__execute_1223
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_luaV__execute_1224 ' GEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_luaV__execute_1224
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1226 ' EQI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaV__execute_1228 ' GEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaV__execute_1228
 mov r2, #1 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 if_z jmp #\C_luaV__execute_1230 ' EQI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r19, r22
 adds r19, #8 ' ADDP4 coni
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_1230
C_luaV__execute_1226
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1232 ' EQI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 shl r20, #3 ' LSHI4 coni
 subs r22, r20 ' SUBI/P (1)
 wrlong r22, r21 ' ASGNP4 reg reg
C_luaV__execute_1232
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_1222 ' JUMPV addrg
C_luaV__execute_1234
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1235 ' EQI4
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r15, #1 ' reg <- coni
 jmp #\@C_luaV__execute_1222 ' JUMPV addrg
C_luaV__execute_1235
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-8 ' reg <- con
 adds r20, r19 ' ADDI/P (2)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1240 ' JUMPV addrg
C_luaV__execute_1237
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 mov r22, r20
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaV__execute_1238 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1240
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C_luaV__execute_1237 ' GTI4
 jmp #\@C_luaV__execute_1222 ' JUMPV addrg
C_luaV__execute_1241
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1242 ' EQI4
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r15, #1 ' reg <- coni
 jmp #\@C_luaV__execute_1243 ' JUMPV addrg
C_luaV__execute_1242
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__execute_1244 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-8 ' reg <- con
 adds r20, r19 ' ADDI/P (2)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_luaV__execute_1245 ' JUMPV addrg
C_luaV__execute_1244
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##-8 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 jmp #\@C_luaV__execute_1249 ' JUMPV addrg
C_luaV__execute_1246
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 mov r22, r20
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaV__execute_1247 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1249
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wcz
 if_a jmp #\C_luaV__execute_1246 ' GTI4
C_luaV__execute_1245
C_luaV__execute_1243
C_luaV__execute_1222
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1250 ' EQI4
 jmp #\@C_luaV__execute_570 ' JUMPV addrg
C_luaV__execute_1250
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 jmp #\@C_luaV__execute_572 ' JUMPV addrg
C_luaV__execute_1252
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_luaV__execute_1253 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_luaV__execute_1254 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 subs r17, r22 ' SUBI/P (1)
 jmp #\@C_luaV__execute_1254 ' JUMPV addrg
C_luaV__execute_1253
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_svmgb_696de09b_floatforloop_L000138 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaV__execute_1257 ' EQI4
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 subs r17, r22 ' SUBI/P (1)
C_luaV__execute_1257
C_luaV__execute_1254
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1259
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_svmg7_696de09b_forprep_L000092
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 adds r22, #4 ' ADDI4 coni
 adds r17, r22 ' ADDI/P (2)
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1262
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #24 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__newtbcupval
 add SP, #4 ' CALL addrg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 adds r17, r22 ' ADDI/P (2)
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
C_luaV__execute_1264
' C_luaV__execute_1263 ' (symbol refcount = 0)
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #24 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #32 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #56 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #32 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 if_z jmp #\C_luaV__execute_1265 ' EQI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r19, r22
 adds r19, #8 ' ADDP4 coni
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaV__execute_1265
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
C_luaV__execute_1268
' C_luaV__execute_1267 ' (symbol refcount = 0)
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #36 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_575 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 subs r17, r22 ' SUBI/P (1)
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1271
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaV__execute_1272 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaV__execute_1273 ' JUMPV addrg
C_luaV__execute_1272
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaV__execute_1273
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##$8000 ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1274 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r17 ' reg <- INDIRU4 reg
 shr r20, #7 ' RSHU4 coni
 mov r18, ##$1ffffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 shl r20, #8 ' LSHI4 coni
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 adds r17, #4 ' ADDP4 coni
C_luaV__execute_1274
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r0 wcz 
 if_be jmp #\C_luaV__execute_1281 ' LEU4
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__resizearray
 add SP, #8 ' CALL addrg
 jmp #\@C_luaV__execute_1281 ' JUMPV addrg
C_luaV__execute_1278
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaV__execute_1283 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_1283 ' EQI4
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaV__execute_1283 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaV__execute_1283 ' JUMPV addrg
 jmp #\@C_luaV__execute_1283 ' JUMPV addrg
C_luaV__execute_1283
' C_luaV__execute_1279 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaV__execute_1281
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C_luaV__execute_1278 ' GTI4
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1286
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 mov r20, ##$1ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, r11
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r11
 adds r4, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_svmg11_696de09b_pushclosure_L000536
 add SP, #16 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_luaV__execute_575 ' LEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1289
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__getvarargs
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_1290
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__adjustvarargs
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 if_z jmp #\C_luaV__execute_1291 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__hookcall
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_luaV__execute_1291
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r19, r22
 adds r19, #8 ' ADDP4 coni
 jmp #\@C_luaV__execute_575 ' JUMPV addrg
C_luaV__execute_570
 calld PA,#POPM ' restore registers
 add SP, #56 ' framesize
 calld PA,#RETF


' Catalina Import luaH_realasize

' Catalina Import luaH_getn

' Catalina Import luaH_resizearray

' Catalina Import luaH_resize

' Catalina Import luaH_new

' Catalina Import luaH_finishset

' Catalina Import luaH_get

' Catalina Import luaH_getstr

' Catalina Import luaH_getshortstr

' Catalina Import luaH_getint

' Catalina Import luaS_createlngstrobj

' Catalina Import luaS_newlstr

' Catalina Import luaS_eqlngstr

' Catalina Import luaC_barrierback_

' Catalina Import luaC_barrier_

' Catalina Import luaC_step

' Catalina Import luaF_close

' Catalina Import luaF_closeupval

' Catalina Import luaF_newtbcupval

' Catalina Import luaF_findupval

' Catalina Import luaF_newLclosure

' Catalina Import luaD_poscall

' Catalina Import luaD_call

' Catalina Import luaD_precall

' Catalina Import luaD_pretailcall

' Catalina Import luaD_hookcall

' Catalina Import luaG_tracecall

' Catalina Import luaG_traceexec

' Catalina Import luaG_runerror

' Catalina Import luaG_forerror

' Catalina Import luaG_typeerror

' Catalina Import luaT_getvarargs

' Catalina Import luaT_adjustvarargs

' Catalina Import luaT_callorderiTM

' Catalina Import luaT_callorderTM

' Catalina Import luaT_trybiniTM

' Catalina Import luaT_trybinassocTM

' Catalina Import luaT_tryconcatTM

' Catalina Import luaT_trybinTM

' Catalina Import luaT_callTMres

' Catalina Import luaT_callTM

' Catalina Import luaT_gettmbyobj

' Catalina Import luaT_gettm

' Catalina Import luaO_tostring

' Catalina Import luaO_str2num

' Catalina Import strlen

' Catalina Import strcoll

' Catalina Import memcpy

' Catalina Import fmod

' Catalina Import pow

' Catalina Import floor

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__execute_845_L000846 ' <symbol:845>
 long $40000000 ' float

 alignl ' align long
C_luaV__mod_513_L000514 ' <symbol:513>
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
 byte 112
 byte 101
 byte 114
 byte 102
 byte 111
 byte 114
 byte 109
 byte 32
 byte 39
 byte 110
 byte 37
 byte 37
 byte 48
 byte 39
 byte 0

 alignl ' align long
C_luaV__idiv_504_L000505 ' <symbol:504>
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
 byte 100
 byte 105
 byte 118
 byte 105
 byte 100
 byte 101
 byte 32
 byte 98
 byte 121
 byte 32
 byte 122
 byte 101
 byte 114
 byte 111
 byte 0

 alignl ' align long
C_luaV__objlen_496_L000497 ' <symbol:496>
 byte 103
 byte 101
 byte 116
 byte 32
 byte 108
 byte 101
 byte 110
 byte 103
 byte 116
 byte 104
 byte 32
 byte 111
 byte 102
 byte 0

 alignl ' align long
C_luaV__concat_473_L000474 ' <symbol:473>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 108
 byte 101
 byte 110
 byte 103
 byte 116
 byte 104
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
C_luaV__finishset_217_L000218 ' <symbol:217>
 byte 39
 byte 95
 byte 95
 byte 110
 byte 101
 byte 119
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 39
 byte 32
 byte 99
 byte 104
 byte 97
 byte 105
 byte 110
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 59
 byte 32
 byte 112
 byte 111
 byte 115
 byte 115
 byte 105
 byte 98
 byte 108
 byte 101
 byte 32
 byte 108
 byte 111
 byte 111
 byte 112
 byte 0

 alignl ' align long
C_luaV__finishget_180_L000181 ' <symbol:180>
 byte 39
 byte 95
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 39
 byte 32
 byte 99
 byte 104
 byte 97
 byte 105
 byte 110
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 59
 byte 32
 byte 112
 byte 111
 byte 115
 byte 115
 byte 105
 byte 98
 byte 108
 byte 101
 byte 32
 byte 108
 byte 111
 byte 111
 byte 112
 byte 0

 alignl ' align long
C_luaV__finishget_160_L000161 ' <symbol:160>
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_svmg7_696de09b_forprep_L000092_123_L000124 ' <symbol:123>
 byte 105
 byte 110
 byte 105
 byte 116
 byte 105
 byte 97
 byte 108
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_svmg7_696de09b_forprep_L000092_116_L000117 ' <symbol:116>
 byte 115
 byte 116
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_svmg7_696de09b_forprep_L000092_98_L000099 ' <symbol:98>
 byte 39
 byte 102
 byte 111
 byte 114
 byte 39
 byte 32
 byte 115
 byte 116
 byte 101
 byte 112
 byte 32
 byte 105
 byte 115
 byte 32
 byte 122
 byte 101
 byte 114
 byte 111
 byte 0

 alignl ' align long
C_svmg4_696de09b_forlimit_L000061_77_L000078 ' <symbol:77>
 long $0 ' float

 alignl ' align long
C_svmg4_696de09b_forlimit_L000061_73_L000074 ' <symbol:73>
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_luaV__flttointeger_51_L000052 ' <symbol:51>
 long $4f000000 ' float

 alignl ' align long
C_luaV__flttointeger_49_L000050 ' <symbol:49>
 long $cf000000 ' float

 alignl ' align long
C_luaV__flttointeger_44_L000045 ' <symbol:44>
 long $3f800000 ' float

' Catalina Code

DAT ' code segment
' end
