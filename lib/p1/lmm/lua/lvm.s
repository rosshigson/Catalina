' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s478_6695052b_l_strton_L000016 ' <symbol:l_strton>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s478_6695052b_l_strton_L000016_18 ' EQI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_s478_6695052b_l_strton_L000016_17 ' JUMPV addrg
C_s478_6695052b_l_strton_L000016_18
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__str2num
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #4 ' reg <- coni
 rdlong r18, r23 ' reg <- INDIRP4 reg
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 cmps r18, r20 wz
 jmp #BRNZ
 long @C_s478_6695052b_l_strton_L000016_24 ' NEI4
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r17, r20 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478_6695052b_l_strton_L000016_25 ' JUMPV addrg
C_s478_6695052b_l_strton_L000016_24
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r17, r20 ' reg <- INDIRU4 reg
C_s478_6695052b_l_strton_L000016_25
 mov r20, r17
 add r20, #1 ' ADDU4 coni
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s478_6695052b_l_strton_L000016_22 ' NEU4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478_6695052b_l_strton_L000016_23 ' JUMPV addrg
C_s478_6695052b_l_strton_L000016_22
 mov r19, #0 ' reg <- coni
C_s478_6695052b_l_strton_L000016_23
 mov r0, r19 ' CVI, CVU or LOAD
C_s478_6695052b_l_strton_L000016_17
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaV_tonumber_

 alignl ' align long
C_luaV__tonumber_ ' <symbol:luaV_tonumber_>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__tonumber__27 ' NEI4
 rdlong r0, r23 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 wrlong r0, r21 ' ASGNF4 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaV__tonumber__26 ' JUMPV addrg
C_luaV__tonumber__27
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478_6695052b_l_strton_L000016
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaV__tonumber__29 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__tonumber__33 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__tonumber__34 ' JUMPV addrg
C_luaV__tonumber__33
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRF4 reg
C_luaV__tonumber__34
 wrlong r19, r21 ' ASGNF4 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaV__tonumber__26 ' JUMPV addrg
C_luaV__tonumber__29
 mov r0, #0 ' RET coni
C_luaV__tonumber__26
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaV_flttointeger

 alignl ' align long
C_luaV__flttointeger ' <symbol:luaV_flttointeger>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_floor ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_luaV__flttointeger_36 ' EQF4
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_luaV__flttointeger_38 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaV__flttointeger_35 ' JUMPV addrg
C_luaV__flttointeger_38
 cmps r19,  #2 wz
 jmp #BRNZ
 long @C_luaV__flttointeger_40 ' NEI4
 jmp #LODI
 long @C_luaV__flttointeger_42_L000043
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r17, r0 ' CVI, CVU or LOAD
C_luaV__flttointeger_40
C_luaV__flttointeger_36
 jmp #LODI
 long @C_luaV__flttointeger_47_L000048
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_luaV__flttointeger_45 ' LTF4
 jmp #LODI
 long @C_luaV__flttointeger_49_L000050
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_luaV__flttointeger_45 ' GEF4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 wrlong r0, r21 ' ASGNI4 reg reg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__flttointeger_45 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__flttointeger_46 ' JUMPV addrg
C_luaV__flttointeger_45
 mov r15, #0 ' reg <- coni
C_luaV__flttointeger_46
 mov r0, r15 ' CVI, CVU or LOAD
C_luaV__flttointeger_35
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaV_tointegerns

 alignl ' align long
C_luaV__tointegerns ' <symbol:luaV_tointegerns>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__tointegerns_52 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 rdlong r4, r23 ' reg <- INDIRF4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__tointegerns_51 ' JUMPV addrg
C_luaV__tointegerns_52
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__tointegerns_54 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaV__tointegerns_51 ' JUMPV addrg
C_luaV__tointegerns_54
 mov r0, #0 ' RET coni
C_luaV__tointegerns_51
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaV_tointeger

 alignl ' align long
C_luaV__tointeger ' <symbol:luaV_tointeger>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478_6695052b_l_strton_L000016
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaV__tointeger_57 ' EQI4
 mov r23, FP
 sub r23, #-(-12) ' reg <- addrli
C_luaV__tointeger_57
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaV__tointeger_56 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s4784_6695052b_forlimit_L000059 ' <symbol:forlimit>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_s4784_6695052b_forlimit_L000059_64 ' GEI4
 mov r15, #2 ' reg <- coni
 jmp #JMPA
 long @C_s4784_6695052b_forlimit_L000059_65 ' JUMPV addrg
C_s4784_6695052b_forlimit_L000059_64
 mov r15, #1 ' reg <- coni
C_s4784_6695052b_forlimit_L000059_65
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s4784_6695052b_forlimit_L000059_61 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s4784_6695052b_forlimit_L000059_69 ' NEI4
 rdlong r22, r21 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_s4784_6695052b_forlimit_L000059_70 ' JUMPV addrg
C_s4784_6695052b_forlimit_L000059_69
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s4784_6695052b_forlimit_L000059_70
 cmps r13,  #0 wz
 jmp #BRNZ
 long @C_s4784_6695052b_forlimit_L000059_66 ' NEI4
 jmp #LODL
 long @C_s4784_6695052b_forlimit_L000059_71_L000072
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__forerror
 add SP, #8 ' CALL addrg
C_s4784_6695052b_forlimit_L000059_66
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s4784_6695052b_forlimit_L000059_73 ' GEF4
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_s4784_6695052b_forlimit_L000059_77 ' GEI4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s4784_6695052b_forlimit_L000059_60 ' JUMPV addrg
C_s4784_6695052b_forlimit_L000059_77
 jmp #LODL
 long 2147483647
 mov r22, RI ' reg <- con
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s4784_6695052b_forlimit_L000059_74 ' JUMPV addrg
C_s4784_6695052b_forlimit_L000059_73
 cmps r17,  #0 wz,wc
 jmp #BRBE
 long @C_s4784_6695052b_forlimit_L000059_79 ' LEI4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s4784_6695052b_forlimit_L000059_60 ' JUMPV addrg
C_s4784_6695052b_forlimit_L000059_79
 jmp #LODL
 long -2147483648
 mov r22, RI ' reg <- con
 wrlong r22, r19 ' ASGNI4 reg reg
C_s4784_6695052b_forlimit_L000059_74
C_s4784_6695052b_forlimit_L000059_61
 cmps r17,  #0 wz,wc
 jmp #BRBE
 long @C_s4784_6695052b_forlimit_L000059_84 ' LEI4
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r23, r22 wz,wc
 jmp #BRBE
 long @C_s4784_6695052b_forlimit_L000059_86 ' LEI4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_s4784_6695052b_forlimit_L000059_87 ' JUMPV addrg
C_s4784_6695052b_forlimit_L000059_86
 mov r11, #0 ' reg <- coni
C_s4784_6695052b_forlimit_L000059_87
 mov r13, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s4784_6695052b_forlimit_L000059_85 ' JUMPV addrg
C_s4784_6695052b_forlimit_L000059_84
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r23, r22 wz,wc
 jmp #BRAE
 long @C_s4784_6695052b_forlimit_L000059_88 ' GEI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_s4784_6695052b_forlimit_L000059_89 ' JUMPV addrg
C_s4784_6695052b_forlimit_L000059_88
 mov r9, #0 ' reg <- coni
C_s4784_6695052b_forlimit_L000059_89
 mov r13, r9 ' CVI, CVU or LOAD
C_s4784_6695052b_forlimit_L000059_85
 mov r0, r13 ' CVI, CVU or LOAD
C_s4784_6695052b_forlimit_L000059_60
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s4787_6695052b_forprep_L000090 ' <symbol:forprep>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
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
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_92 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_92 ' NEI4
 rdlong r22, r17 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_94 ' NEI4
 jmp #LODL
 long @C_s4787_6695052b_forprep_L000090_96_L000097
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_s4787_6695052b_forprep_L000090_94
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s4784_6695052b_forlimit_L000059
 add SP, #16 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s4787_6695052b_forprep_L000090_98 ' EQI4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_91 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_98
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_s4787_6695052b_forprep_L000090_100 ' LEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_s4787_6695052b_forprep_L000090_101 ' EQI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_101 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_100
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 neg r20, r20 ' NEGI4
 add r20, #1 ' ADDU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNU4 addrl reg
C_s4787_6695052b_forprep_L000090_101
 jmp #LODF
 long -24
 wrlong r15, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_93 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_92
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_107 ' NEI4
 rdlong r22, r15 ' reg <- INDIRF4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_108 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_107
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s4787_6695052b_forprep_L000090_108
 cmps r13,  #0 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_104 ' NEI4
 jmp #LODL
 long @C_s4784_6695052b_forlimit_L000059_71_L000072
 mov r2, RI ' reg ARG ADDRG
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__forerror
 add SP, #8 ' CALL addrg
C_s4787_6695052b_forprep_L000090_104
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_112 ' NEI4
 rdlong r22, r19 ' reg <- INDIRF4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_113 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_112
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
C_s4787_6695052b_forprep_L000090_113
 cmps r11,  #0 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_109 ' NEI4
 jmp #LODL
 long @C_s4787_6695052b_forprep_L000090_114_L000115
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__forerror
 add SP, #8 ' CALL addrg
C_s4787_6695052b_forprep_L000090_109
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_119 ' NEI4
 rdlong r22, r17 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_120 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_119
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_s4787_6695052b_forprep_L000090_120
 cmps r9,  #0 wz
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_116 ' NEI4
 jmp #LODL
 long @C_s4787_6695052b_forprep_L000090_121_L000122
 mov r2, RI ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__forerror
 add SP, #8 ' CALL addrg
C_s4787_6695052b_forprep_L000090_116
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_s4787_6695052b_forprep_L000090_123 ' NEF4
 jmp #LODL
 long @C_s4787_6695052b_forprep_L000090_96_L000097
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_s4787_6695052b_forprep_L000090_123
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s4787_6695052b_forprep_L000090_130 ' GEF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s4787_6695052b_forprep_L000090_132 ' GEF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_133 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_132
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_s4787_6695052b_forprep_L000090_133
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_131 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_130
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s4787_6695052b_forprep_L000090_134 ' GEF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_135 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_134
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
C_s4787_6695052b_forprep_L000090_135
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRI4 reg
C_s4787_6695052b_forprep_L000090_131
 cmps r7,  #0 wz
 jmp #BR_Z
 long @C_s4787_6695052b_forprep_L000090_125 ' EQI4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s4787_6695052b_forprep_L000090_91 ' JUMPV addrg
C_s4787_6695052b_forprep_L000090_125
 jmp #LODF
 long -28
 wrlong r15, RI ' ASGNP4 addrl reg
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
 jmp #LODF
 long -28
 wrlong r19, RI ' ASGNP4 addrl reg
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
 jmp #LODF
 long -28
 wrlong r21, RI ' ASGNP4 addrl reg
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
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
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
C_s4787_6695052b_forprep_L000090_93
 mov r0, #0 ' RET coni
C_s4787_6695052b_forprep_L000090_91
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_s478b_6695052b_floatforloop_L000136 ' <symbol:floatforloop>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s478b_6695052b_floatforloop_L000136_143 ' GEF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_s478b_6695052b_floatforloop_L000136_145 ' GTF4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478b_6695052b_floatforloop_L000136_146 ' JUMPV addrg
C_s478b_6695052b_floatforloop_L000136_145
 mov r15, #0 ' reg <- coni
C_s478b_6695052b_floatforloop_L000136_146
 mov r17, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478b_6695052b_floatforloop_L000136_144 ' JUMPV addrg
C_s478b_6695052b_floatforloop_L000136_143
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_s478b_6695052b_floatforloop_L000136_147 ' GTF4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478b_6695052b_floatforloop_L000136_148 ' JUMPV addrg
C_s478b_6695052b_floatforloop_L000136_147
 mov r13, #0 ' reg <- coni
C_s478b_6695052b_floatforloop_L000136_148
 mov r17, r13 ' CVI, CVU or LOAD
C_s478b_6695052b_floatforloop_L000136_144
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s478b_6695052b_floatforloop_L000136_138 ' EQI4
 jmp #LODF
 long -8
 wrlong r2, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r23, r22 ' ASGNF4 reg reg
 mov r22, r2
 adds r22, #24 ' ADDP4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
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
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_s478b_6695052b_floatforloop_L000136_137 ' JUMPV addrg
C_s478b_6695052b_floatforloop_L000136_138
 mov r0, #0 ' RET coni
C_s478b_6695052b_floatforloop_L000136_137
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaV_finishget

 alignl ' align long
C_luaV__finishget ' <symbol:luaV_finishget>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, #0 ' reg <- coni
C_luaV__finishget_150
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__finishget_154 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__finishget_155 ' NEI4
 jmp #LODL
 long @C_luaV__finishget_158_L000159
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaV__finishget_155 ' JUMPV addrg
C_luaV__finishget_154
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__finishget_162 ' NEU4
 jmp #LODL
 long 0
 mov r11, RI ' reg <- con
 jmp #JMPA
 long @C_luaV__finishget_163 ' JUMPV addrg
C_luaV__finishget_162
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__finishget_164 ' EQU4
 jmp #LODL
 long 0
 mov r9, RI ' reg <- con
 jmp #JMPA
 long @C_luaV__finishget_165 ' JUMPV addrg
C_luaV__finishget_164
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
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_luaV__finishget_165
 mov r11, r9 ' CVI, CVU or LOAD
C_luaV__finishget_163
 mov r15, r11 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__finishget_166 ' NEU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__finishget_149 ' JUMPV addrg
C_luaV__finishget_166
C_luaV__finishget_155
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_luaV__finishget_168 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__callT_M_res
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaV__finishget_149 ' JUMPV addrg
C_luaV__finishget_168
 mov r23, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__finishget_174 ' EQI4
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaV__finishget_175 ' JUMPV addrg
C_luaV__finishget_174
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__finishget_176 ' EQI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__finishget_177 ' JUMPV addrg
C_luaV__finishget_176
 mov r9, #0 ' reg <- coni
C_luaV__finishget_177
 mov r11, r9 ' CVI, CVU or LOAD
C_luaV__finishget_175
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C_luaV__finishget_170 ' EQI4
 mov r7, r19 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r17, RI ' ASGNP4 addrl reg
 mov r0, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__finishget_149 ' JUMPV addrg
C_luaV__finishget_170
' C_luaV__finishget_151 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
 jmp #LODL
 long 2000
 mov r22, RI ' reg <- con
 cmps r13, r22 wz,wc
 jmp #BR_B
 long @C_luaV__finishget_150 ' LTI4
 jmp #LODL
 long @C_luaV__finishget_178_L000179
 mov r2, RI ' reg ARG ADDRG
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__finishget_149
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaV_finishset

 alignl ' align long
C_luaV__finishset ' <symbol:luaV_finishset>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
C_luaV__finishset_181
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__finishset_185 ' EQU4
 rdlong r11, r23 ' reg <- INDIRP4 reg
 mov r22, r11
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__finishset_189 ' NEU4
 jmp #LODL
 long 0
 mov r9, RI ' reg <- con
 jmp #JMPA
 long @C_luaV__finishset_190 ' JUMPV addrg
C_luaV__finishset_189
 mov r22, r11
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__finishset_191 ' EQU4
 jmp #LODL
 long 0
 mov r7, RI ' reg <- con
 jmp #JMPA
 long @C_luaV__finishset_192 ' JUMPV addrg
C_luaV__finishset_191
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
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r7, r22 ' CVI, CVU or LOAD
C_luaV__finishset_192
 mov r9, r7 ' CVI, CVU or LOAD
C_luaV__finishset_190
 mov r13, r9 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__finishset_186 ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r11 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
 mov r22, r11
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffc0
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__finishset_196 ' EQI4
 mov r20, r11
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__finishset_196 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__finishset_196 ' EQI4
 mov r2, r11 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__finishset_196 ' JUMPV addrg
C_luaV__finishset_196
 jmp #JMPA
 long @C_luaV__finishset_180 ' JUMPV addrg
C_luaV__finishset_185
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__finishset_197 ' NEI4
 jmp #LODL
 long @C_luaV__finishget_158_L000159
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
C_luaV__finishset_197
C_luaV__finishset_186
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_luaV__finishset_199 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, r13 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__callT_M_
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaV__finishset_180 ' JUMPV addrg
C_luaV__finishset_199
 mov r23, r13 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__finishset_205 ' EQI4
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaV__finishset_206 ' JUMPV addrg
C_luaV__finishset_205
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__finishset_207 ' EQI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__finishset_208 ' JUMPV addrg
C_luaV__finishset_207
 mov r9, #0 ' reg <- coni
C_luaV__finishset_208
 mov r11, r9 ' CVI, CVU or LOAD
C_luaV__finishset_206
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C_luaV__finishset_201 ' EQI4
 mov r7, r17 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r19, RI ' ASGNP4 addrl reg
 mov r0, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__finishset_210 ' EQI4
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__finishset_210 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__finishset_210 ' EQI4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__finishset_210 ' JUMPV addrg
C_luaV__finishset_210
 jmp #JMPA
 long @C_luaV__finishset_180 ' JUMPV addrg
C_luaV__finishset_201
' C_luaV__finishset_182 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 jmp #LODL
 long 2000
 mov r22, RI ' reg <- con
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_luaV__finishset_181 ' LTI4
 jmp #LODL
 long @C_luaV__finishset_211_L000212
 mov r2, RI ' reg ARG ADDRG
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__finishset_180
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s478f_6695052b_l_strcmp_L000213 ' <symbol:l_strcmp>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r23
 adds r19, #16 ' ADDP4 coni
 mov r22, #4 ' reg <- coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s478f_6695052b_l_strcmp_L000213_216 ' NEI4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478f_6695052b_l_strcmp_L000213_217 ' JUMPV addrg
C_s478f_6695052b_l_strcmp_L000213_216
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRU4 reg
C_s478f_6695052b_l_strcmp_L000213_217
 mov r15, r11 ' CVI, CVU or LOAD
 mov r17, r21
 adds r17, #16 ' ADDP4 coni
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s478f_6695052b_l_strcmp_L000213_219 ' NEI4
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r9, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478f_6695052b_l_strcmp_L000213_220 ' JUMPV addrg
C_s478f_6695052b_l_strcmp_L000213_219
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
C_s478f_6695052b_l_strcmp_L000213_220
 mov r13, r9 ' CVI, CVU or LOAD
C_s478f_6695052b_l_strcmp_L000213_221
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcoll
 add SP, #4 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 cmps r7,  #0 wz
 jmp #BR_Z
 long @C_s478f_6695052b_l_strcmp_L000213_225 ' EQI4
 mov r0, r7 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478f_6695052b_l_strcmp_L000213_214 ' JUMPV addrg
C_s478f_6695052b_l_strcmp_L000213_225
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r13 wz
 jmp #BRNZ
 long @C_s478f_6695052b_l_strcmp_L000213_227 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r15 wz
 jmp #BRNZ
 long @C_s478f_6695052b_l_strcmp_L000213_230 ' NEU4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_s478f_6695052b_l_strcmp_L000213_231 ' JUMPV addrg
C_s478f_6695052b_l_strcmp_L000213_230
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_s478f_6695052b_l_strcmp_L000213_231
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_s478f_6695052b_l_strcmp_L000213_214 ' JUMPV addrg
C_s478f_6695052b_l_strcmp_L000213_227
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22, r15 wz
 jmp #BRNZ
 long @C_s478f_6695052b_l_strcmp_L000213_232 ' NEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s478f_6695052b_l_strcmp_L000213_214 ' JUMPV addrg
C_s478f_6695052b_l_strcmp_L000213_232
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r19, r22 ' ADDI/P (2)
 sub r15, r22 ' SUBU (1)
 adds r17, r22 ' ADDI/P (2)
 sub r13, r22 ' SUBU (1)
 jmp #JMPA
 long @C_s478f_6695052b_l_strcmp_L000213_221 ' JUMPV addrg
C_s478f_6695052b_l_strcmp_L000213_214
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s478g_6695052b_L_T_intfloat_L000234 ' <symbol:LTintfloat>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long $1000000
 mov r20, RI ' reg <- con
 add r22, r20 ' ADDU (1)
 jmp #LODL
 long $2000000
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_s478g_6695052b_L_T_intfloat_L000234_236 ' GTU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s478g_6695052b_L_T_intfloat_L000234_239 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478g_6695052b_L_T_intfloat_L000234_240 ' JUMPV addrg
C_s478g_6695052b_L_T_intfloat_L000234_239
 mov r19, #0 ' reg <- coni
C_s478g_6695052b_L_T_intfloat_L000234_240
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478g_6695052b_L_T_intfloat_L000234_235 ' JUMPV addrg
C_s478g_6695052b_L_T_intfloat_L000234_236
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s478g_6695052b_L_T_intfloat_L000234_241 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r23, r22 wz,wc
 jmp #BRAE
 long @C_s478g_6695052b_L_T_intfloat_L000234_244 ' GEI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478g_6695052b_L_T_intfloat_L000234_245 ' JUMPV addrg
C_s478g_6695052b_L_T_intfloat_L000234_244
 mov r17, #0 ' reg <- coni
C_s478g_6695052b_L_T_intfloat_L000234_245
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478g_6695052b_L_T_intfloat_L000234_235 ' JUMPV addrg
C_s478g_6695052b_L_T_intfloat_L000234_241
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_s478g_6695052b_L_T_intfloat_L000234_247 ' LEF4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478g_6695052b_L_T_intfloat_L000234_248 ' JUMPV addrg
C_s478g_6695052b_L_T_intfloat_L000234_247
 mov r15, #0 ' reg <- coni
C_s478g_6695052b_L_T_intfloat_L000234_248
 mov r0, r15 ' CVI, CVU or LOAD
C_s478g_6695052b_L_T_intfloat_L000234_235
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s478h_6695052b_L_E_intfloat_L000249 ' <symbol:LEintfloat>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long $1000000
 mov r20, RI ' reg <- con
 add r22, r20 ' ADDU (1)
 jmp #LODL
 long $2000000
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_s478h_6695052b_L_E_intfloat_L000249_251 ' GTU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_s478h_6695052b_L_E_intfloat_L000249_254 ' GTF4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478h_6695052b_L_E_intfloat_L000249_255 ' JUMPV addrg
C_s478h_6695052b_L_E_intfloat_L000249_254
 mov r19, #0 ' reg <- coni
C_s478h_6695052b_L_E_intfloat_L000249_255
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478h_6695052b_L_E_intfloat_L000249_250 ' JUMPV addrg
C_s478h_6695052b_L_E_intfloat_L000249_251
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s478h_6695052b_L_E_intfloat_L000249_256 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r23, r22 wz,wc
 jmp #BR_A
 long @C_s478h_6695052b_L_E_intfloat_L000249_259 ' GTI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478h_6695052b_L_E_intfloat_L000249_260 ' JUMPV addrg
C_s478h_6695052b_L_E_intfloat_L000249_259
 mov r17, #0 ' reg <- coni
C_s478h_6695052b_L_E_intfloat_L000249_260
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478h_6695052b_L_E_intfloat_L000249_250 ' JUMPV addrg
C_s478h_6695052b_L_E_intfloat_L000249_256
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_s478h_6695052b_L_E_intfloat_L000249_262 ' LEF4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478h_6695052b_L_E_intfloat_L000249_263 ' JUMPV addrg
C_s478h_6695052b_L_E_intfloat_L000249_262
 mov r15, #0 ' reg <- coni
C_s478h_6695052b_L_E_intfloat_L000249_263
 mov r0, r15 ' CVI, CVU or LOAD
C_s478h_6695052b_L_E_intfloat_L000249_250
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s478i_6695052b_L_T_floatint_L000264 ' <symbol:LTfloatint>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $1000000
 mov r20, RI ' reg <- con
 add r22, r20 ' ADDU (1)
 jmp #LODL
 long $2000000
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_s478i_6695052b_L_T_floatint_L000264_266 ' GTU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FCMP
 jmp #BRAE
 long @C_s478i_6695052b_L_T_floatint_L000264_269 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478i_6695052b_L_T_floatint_L000264_270 ' JUMPV addrg
C_s478i_6695052b_L_T_floatint_L000264_269
 mov r19, #0 ' reg <- coni
C_s478i_6695052b_L_T_floatint_L000264_270
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478i_6695052b_L_T_floatint_L000264_265 ' JUMPV addrg
C_s478i_6695052b_L_T_floatint_L000264_266
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s478i_6695052b_L_T_floatint_L000264_271 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wz,wc
 jmp #BRAE
 long @C_s478i_6695052b_L_T_floatint_L000264_274 ' GEI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478i_6695052b_L_T_floatint_L000264_275 ' JUMPV addrg
C_s478i_6695052b_L_T_floatint_L000264_274
 mov r17, #0 ' reg <- coni
C_s478i_6695052b_L_T_floatint_L000264_275
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478i_6695052b_L_T_floatint_L000264_265 ' JUMPV addrg
C_s478i_6695052b_L_T_floatint_L000264_271
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s478i_6695052b_L_T_floatint_L000264_277 ' GEF4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478i_6695052b_L_T_floatint_L000264_278 ' JUMPV addrg
C_s478i_6695052b_L_T_floatint_L000264_277
 mov r15, #0 ' reg <- coni
C_s478i_6695052b_L_T_floatint_L000264_278
 mov r0, r15 ' CVI, CVU or LOAD
C_s478i_6695052b_L_T_floatint_L000264_265
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s478j_6695052b_L_E_floatint_L000279 ' <symbol:LEfloatint>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $1000000
 mov r20, RI ' reg <- con
 add r22, r20 ' ADDU (1)
 jmp #LODL
 long $2000000
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_s478j_6695052b_L_E_floatint_L000279_281 ' GTU4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FCMP
 jmp #BR_A
 long @C_s478j_6695052b_L_E_floatint_L000279_284 ' GTF4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478j_6695052b_L_E_floatint_L000279_285 ' JUMPV addrg
C_s478j_6695052b_L_E_floatint_L000279_284
 mov r19, #0 ' reg <- coni
C_s478j_6695052b_L_E_floatint_L000279_285
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478j_6695052b_L_E_floatint_L000279_280 ' JUMPV addrg
C_s478j_6695052b_L_E_floatint_L000279_281
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s478j_6695052b_L_E_floatint_L000279_286 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r21 wz,wc
 jmp #BR_A
 long @C_s478j_6695052b_L_E_floatint_L000279_289 ' GTI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478j_6695052b_L_E_floatint_L000279_290 ' JUMPV addrg
C_s478j_6695052b_L_E_floatint_L000279_289
 mov r17, #0 ' reg <- coni
C_s478j_6695052b_L_E_floatint_L000279_290
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478j_6695052b_L_E_floatint_L000279_280 ' JUMPV addrg
C_s478j_6695052b_L_E_floatint_L000279_286
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s478j_6695052b_L_E_floatint_L000279_292 ' GEF4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478j_6695052b_L_E_floatint_L000279_293 ' JUMPV addrg
C_s478j_6695052b_L_E_floatint_L000279_292
 mov r15, #0 ' reg <- coni
C_s478j_6695052b_L_E_floatint_L000279_293
 mov r0, r15 ' CVI, CVU or LOAD
C_s478j_6695052b_L_E_floatint_L000279_280
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s478k_6695052b_L_T_num_L000294 ' <symbol:LTnum>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s478k_6695052b_L_T_num_L000294_296 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s478k_6695052b_L_T_num_L000294_298 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdlong r20, r21 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_s478k_6695052b_L_T_num_L000294_301 ' GEI4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478k_6695052b_L_T_num_L000294_302 ' JUMPV addrg
C_s478k_6695052b_L_T_num_L000294_301
 mov r19, #0 ' reg <- coni
C_s478k_6695052b_L_T_num_L000294_302
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478k_6695052b_L_T_num_L000294_295 ' JUMPV addrg
C_s478k_6695052b_L_T_num_L000294_298
 rdlong r2, r21 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478g_6695052b_L_T_intfloat_L000234
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478k_6695052b_L_T_num_L000294_295 ' JUMPV addrg
C_s478k_6695052b_L_T_num_L000294_296
 rdlong r22, r23 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s478k_6695052b_L_T_num_L000294_303 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 rdlong r20, r21 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_s478k_6695052b_L_T_num_L000294_306 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478k_6695052b_L_T_num_L000294_307 ' JUMPV addrg
C_s478k_6695052b_L_T_num_L000294_306
 mov r19, #0 ' reg <- coni
C_s478k_6695052b_L_T_num_L000294_307
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478k_6695052b_L_T_num_L000294_295 ' JUMPV addrg
C_s478k_6695052b_L_T_num_L000294_303
 rdlong r2, r21 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478i_6695052b_L_T_floatint_L000264
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s478k_6695052b_L_T_num_L000294_295
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s478l_6695052b_L_E_num_L000308 ' <symbol:LEnum>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s478l_6695052b_L_E_num_L000308_310 ' NEI4
 rdlong r22, r23 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_s478l_6695052b_L_E_num_L000308_312 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdlong r20, r21 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_s478l_6695052b_L_E_num_L000308_315 ' GTI4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478l_6695052b_L_E_num_L000308_316 ' JUMPV addrg
C_s478l_6695052b_L_E_num_L000308_315
 mov r19, #0 ' reg <- coni
C_s478l_6695052b_L_E_num_L000308_316
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478l_6695052b_L_E_num_L000308_309 ' JUMPV addrg
C_s478l_6695052b_L_E_num_L000308_312
 rdlong r2, r21 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478h_6695052b_L_E_intfloat_L000249
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478l_6695052b_L_E_num_L000308_309 ' JUMPV addrg
C_s478l_6695052b_L_E_num_L000308_310
 rdlong r22, r23 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_s478l_6695052b_L_E_num_L000308_317 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 rdlong r20, r21 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_s478l_6695052b_L_E_num_L000308_320 ' GTF4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478l_6695052b_L_E_num_L000308_321 ' JUMPV addrg
C_s478l_6695052b_L_E_num_L000308_320
 mov r19, #0 ' reg <- coni
C_s478l_6695052b_L_E_num_L000308_321
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478l_6695052b_L_E_num_L000308_309 ' JUMPV addrg
C_s478l_6695052b_L_E_num_L000308_317
 rdlong r2, r21 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478j_6695052b_L_E_floatint_L000279
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s478l_6695052b_L_E_num_L000308_309
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s478m_6695052b_lessthanothers_L000322 ' <symbol:lessthanothers>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s478m_6695052b_lessthanothers_L000322_324 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s478m_6695052b_lessthanothers_L000322_324 ' NEI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478f_6695052b_l_strcmp_L000213
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s478m_6695052b_lessthanothers_L000322_327 ' GEI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478m_6695052b_lessthanothers_L000322_328 ' JUMPV addrg
C_s478m_6695052b_lessthanothers_L000322_327
 mov r17, #0 ' reg <- coni
C_s478m_6695052b_lessthanothers_L000322_328
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478m_6695052b_lessthanothers_L000322_323 ' JUMPV addrg
C_s478m_6695052b_lessthanothers_L000322_324
 mov r2, #20 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__callorderT_M_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s478m_6695052b_lessthanothers_L000322_323
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaV_lessthan

 alignl ' align long
C_luaV__lessthan ' <symbol:luaV_lessthan>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #3 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__lessthan_330 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__lessthan_330 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478k_6695052b_L_T_num_L000294
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__lessthan_329 ' JUMPV addrg
C_luaV__lessthan_330
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478m_6695052b_lessthanothers_L000322
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaV__lessthan_329
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s478n_6695052b_lessequalothers_L000332 ' <symbol:lessequalothers>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s478n_6695052b_lessequalothers_L000332_334 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s478n_6695052b_lessequalothers_L000332_334 ' NEI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478f_6695052b_l_strcmp_L000213
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_s478n_6695052b_lessequalothers_L000332_337 ' GTI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_s478n_6695052b_lessequalothers_L000332_338 ' JUMPV addrg
C_s478n_6695052b_lessequalothers_L000332_337
 mov r17, #0 ' reg <- coni
C_s478n_6695052b_lessequalothers_L000332_338
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478n_6695052b_lessequalothers_L000332_333 ' JUMPV addrg
C_s478n_6695052b_lessequalothers_L000332_334
 mov r2, #21 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__callorderT_M_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s478n_6695052b_lessequalothers_L000332_333
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaV_lessequal

 alignl ' align long
C_luaV__lessequal ' <symbol:luaV_lessequal>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #3 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__lessequal_340 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__lessequal_340 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478l_6695052b_L_E_num_L000308
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__lessequal_339 ' JUMPV addrg
C_luaV__lessequal_340
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478n_6695052b_lessequalothers_L000332
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaV__lessequal_339
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaV_equalobj

 alignl ' align long
C_luaV__equalobj ' <symbol:luaV_equalobj>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #63 ' BANDI4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #63 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__equalobj_343 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_347 ' NEI4
 cmps r22,  #3 wz
 jmp #BR_Z
 long @C_luaV__equalobj_345 ' EQI4
C_luaV__equalobj_347
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_345
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__equalobj_349 ' EQI4
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaV__equalobj_349 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_349 ' NEI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__equalobj_350 ' JUMPV addrg
C_luaV__equalobj_349
 mov r17, #0 ' reg <- coni
C_luaV__equalobj_350
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_343
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22
 and r17, #63 ' BANDI4 coni
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_luaV__equalobj_351 ' LTI4
 cmps r17,  #7 wz,wc
 jmp #BR_A
 long @C_luaV__equalobj_417 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaV__equalobj_418_L000420
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__equalobj_418_L000420 ' <symbol:418>
 long @C_luaV__equalobj_354
 long @C_luaV__equalobj_354
 long @C_luaV__equalobj_363
 long @C_luaV__equalobj_355
 long @C_luaV__equalobj_371
 long @C_luaV__equalobj_395
 long @C_luaV__equalobj_351
 long @C_luaV__equalobj_376

' Catalina Code

DAT ' code segment
C_luaV__equalobj_417
 cmps r17,  #17 wz,wc
 jmp #BR_B
 long @C_luaV__equalobj_351 ' LTI4
 cmps r17,  #22 wz,wc
 jmp #BR_A
 long @C_luaV__equalobj_351 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaV__equalobj_421_L000423-68
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__equalobj_421_L000423 ' <symbol:421>
 long @C_luaV__equalobj_354
 long @C_luaV__equalobj_351
 long @C_luaV__equalobj_359
 long @C_luaV__equalobj_375
 long @C_luaV__equalobj_351
 long @C_luaV__equalobj_367

' Catalina Code

DAT ' code segment
C_luaV__equalobj_354
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_355
 rdlong r22, r21 ' reg <- INDIRI4 reg
 rdlong r20, r19 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_357 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__equalobj_358 ' JUMPV addrg
C_luaV__equalobj_357
 mov r15, #0 ' reg <- coni
C_luaV__equalobj_358
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_359
 rdlong r22, r21 ' reg <- INDIRF4 reg
 rdlong r20, r19 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_luaV__equalobj_361 ' NEF4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__equalobj_362 ' JUMPV addrg
C_luaV__equalobj_361
 mov r13, #0 ' reg <- coni
C_luaV__equalobj_362
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_363
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_365 ' NEU4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__equalobj_366 ' JUMPV addrg
C_luaV__equalobj_365
 mov r11, #0 ' reg <- coni
C_luaV__equalobj_366
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_367
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_369 ' NEU4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__equalobj_370 ' JUMPV addrg
C_luaV__equalobj_369
 mov r9, #0 ' reg <- coni
C_luaV__equalobj_370
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_371
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_373 ' NEU4
 mov r7, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__equalobj_374 ' JUMPV addrg
C_luaV__equalobj_373
 mov r7, #0 ' reg <- coni
C_luaV__equalobj_374
 mov r0, r7 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_375
 rdlong r2, r19 ' reg <- INDIRP4 reg
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__eqlngstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_376
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_377 ' NEU4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_377
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_379 ' NEU4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_379
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_383 ' NEU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_384 ' JUMPV addrg
C_luaV__equalobj_383
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__equalobj_385 ' EQU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_386 ' JUMPV addrg
C_luaV__equalobj_385
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
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__equalobj_386
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__equalobj_384
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_352 ' NEU4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_391 ' NEU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_392 ' JUMPV addrg
C_luaV__equalobj_391
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__equalobj_393 ' EQU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_394 ' JUMPV addrg
C_luaV__equalobj_393
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
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__equalobj_394
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__equalobj_392
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_352 ' JUMPV addrg
C_luaV__equalobj_395
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_396 ' NEU4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_396
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_398 ' NEU4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_398
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_402 ' NEU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_403 ' JUMPV addrg
C_luaV__equalobj_402
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__equalobj_404 ' EQU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_405 ' JUMPV addrg
C_luaV__equalobj_404
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
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__equalobj_405
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__equalobj_403
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_352 ' NEU4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_410 ' NEU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_411 ' JUMPV addrg
C_luaV__equalobj_410
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #32 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__equalobj_412 ' EQU4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_413 ' JUMPV addrg
C_luaV__equalobj_412
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
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__equalobj_413
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__equalobj_411
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_352 ' JUMPV addrg
C_luaV__equalobj_351
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaV__equalobj_415 ' NEU4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__equalobj_416 ' JUMPV addrg
C_luaV__equalobj_415
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__equalobj_416
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_352
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__equalobj_425 ' NEU4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaV__equalobj_342 ' JUMPV addrg
C_luaV__equalobj_425
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
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__callT_M_res
 add SP, #16 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_luaV__equalobj_428 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__equalobj_428 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__equalobj_429 ' JUMPV addrg
C_luaV__equalobj_428
 mov r15, #0 ' reg <- coni
C_luaV__equalobj_429
 mov r0, r15 ' CVI, CVU or LOAD
C_luaV__equalobj_342
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_s478s_6695052b_copy2buff_L000430 ' <symbol:copy2buff>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
C_s478s_6695052b_copy2buff_L000430_432
 mov r22, #4 ' reg <- coni
 mov r20, r21
 shl r20, #3 ' LSHI4 coni
 subs r20, r23
 neg r20, r20 ' SUBI/P (2)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s478s_6695052b_copy2buff_L000430_436 ' NEI4
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, r23
 neg r22, r22 ' SUBI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s478s_6695052b_copy2buff_L000430_437 ' JUMPV addrg
C_s478s_6695052b_copy2buff_L000430_436
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, r23
 neg r22, r22 ' SUBI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRU4 reg
C_s478s_6695052b_copy2buff_L000430_437
 mov r15, r13 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 subs r22, r23
 neg r22, r22 ' SUBI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #16 ' ADDP4 coni
 mov r4, r17 ' ADDI/P
 adds r4, r19 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 add r17, r15 ' ADDU (1)
' C_s478s_6695052b_copy2buff_L000430_433 ' (symbol refcount = 0)
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_s478s_6695052b_copy2buff_L000430_432 ' GTI4
' C_s478s_6695052b_copy2buff_L000430_431 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaV_concat

 alignl ' align long
C_luaV__concat ' <symbol:luaV_concat>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #1 wz
 jmp #BRNZ
 long @C_luaV__concat_439 ' NEI4
 jmp #JMPA
 long @C_luaV__concat_438 ' JUMPV addrg
C_luaV__concat_439
C_luaV__concat_441
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r17, #2 ' reg <- coni
 jmp #LODL
 long -12
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #4 wz
 jmp #BR_Z
 long @C_luaV__concat_447 ' EQI4
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__concat_448 ' NEI4
C_luaV__concat_447
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #4 wz
 jmp #BR_Z
 long @C_luaV__concat_444 ' EQI4
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__concat_448 ' NEI4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 mov r2, r19 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__tostring
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__concat_444 ' NEI4
C_luaV__concat_448
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaT__tryconcatT_M_ ' CALL addrg
 jmp #JMPA
 long @C_luaV__concat_445 ' JUMPV addrg
C_luaV__concat_444
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #68 wz
 jmp #BRNZ
 long @C_luaV__concat_449 ' NEI4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__concat_449 ' NEI4
 jmp #LODL
 long -12
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #4 wz
 jmp #BR_Z
 long @C_luaV__concat_452 ' EQI4
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__concat_452 ' NEI4
 jmp #LODL
 long -16
 mov r22, RI ' reg <- con
 mov r2, r19 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__tostring
 add SP, #4 ' CALL addrg
C_luaV__concat_452
 jmp #JMPA
 long @C_luaV__concat_450 ' JUMPV addrg
C_luaV__concat_449
 jmp #LODL
 long -12
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #68 wz
 jmp #BRNZ
 long @C_luaV__concat_453 ' NEI4
 jmp #LODL
 long -16
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__concat_453 ' NEI4
 jmp #LODL
 long -16
 mov r22, RI ' reg <- con
 mov r15, r19 ' ADDI/P
 adds r15, r22 ' ADDI/P (3)
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 mov r13, r19 ' ADDI/P
 adds r13, r22 ' ADDI/P (3)
 mov r0, r15 ' CVI, CVU or LOAD
 mov r1, r13 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__concat_454 ' JUMPV addrg
C_luaV__concat_453
 mov r22, #4 ' reg <- coni
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r20, r19 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__concat_456 ' NEI4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__concat_457 ' JUMPV addrg
C_luaV__concat_456
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRU4 reg
C_luaV__concat_457
 mov r15, r11 ' CVI, CVU or LOAD
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__concat_461 ' JUMPV addrg
C_luaV__concat_458
 mov r22, #4 ' reg <- coni
 mov r20, r17
 shl r20, #3 ' LSHI4 coni
 subs r20, r19
 neg r20, r20 ' SUBI/P (2)
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__concat_463 ' NEI4
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 subs r22, r19
 neg r22, r22 ' SUBI/P (2)
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r7, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__concat_464 ' JUMPV addrg
C_luaV__concat_463
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 subs r22, r19
 neg r22, r22 ' SUBI/P (2)
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r7, r22 ' reg <- INDIRU4 reg
C_luaV__concat_464
 mov r9, r7 ' CVI, CVU or LOAD
 jmp #LODL
 long $7fffffff
 mov r22, RI ' reg <- con
 sub r22, r15 ' SUBU (1)
 cmp r9, r22 wz,wc 
 jmp #BR_B
 long @C_luaV__concat_465' LTU4
 jmp #LODL
 long @C_luaV__concat_467_L000468
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__concat_465
 add r15, r9 ' ADDU (1)
' C_luaV__concat_459 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_luaV__concat_461
 cmps r17, r21 wz,wc
 jmp #BRAE
 long @C_luaV__concat_470 ' GEI4
 mov r22, #3 ' reg <- coni
 mov r20, r17
 shl r20, #3 ' LSHI4 coni
 subs r20, r19
 neg r20, r20 ' SUBI/P (2)
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r18, r20 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #15 ' BANDI4 coni
 cmps r18,  #4 wz
 jmp #BR_Z
 long @C_luaV__concat_458 ' EQI4
 cmps r18, r22 wz
 jmp #BRNZ
 long @C_luaV__concat_470 ' NEI4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 mov r2, r20 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__tostring
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__concat_458 ' NEI4
C_luaV__concat_470
 cmp r15,  #40 wz,wc 
 jmp #BR_A
 long @C_luaV__concat_471 ' GTU4
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478s_6695052b_copy2buff_L000430
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__concat_472 ' JUMPV addrg
C_luaV__concat_471
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__createlngstrobj
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r13
 adds r2, #16 ' ADDP4 coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478s_6695052b_copy2buff_L000430
 add SP, #8 ' CALL addrg
C_luaV__concat_472
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
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaV__concat_454
C_luaV__concat_450
C_luaV__concat_445
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
' C_luaV__concat_442 ' (symbol refcount = 0)
 cmps r21,  #1 wz,wc
 jmp #BR_A
 long @C_luaV__concat_441 ' GTI4
C_luaV__concat_438
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


' Catalina Export luaV_objlen

 alignl ' align long
C_luaV__objlen ' <symbol:luaV_objlen>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22
 and r17, #63 ' BANDI4 coni
 mov r22, #4 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_luaV__objlen_486 ' EQI4
 cmps r17,  #5 wz
 jmp #BR_Z
 long @C_luaV__objlen_477 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_luaV__objlen_474 ' LTI4
' C_luaV__objlen_492 ' (symbol refcount = 0)
 cmps r17,  #20 wz
 jmp #BR_Z
 long @C_luaV__objlen_487 ' EQI4
 jmp #JMPA
 long @C_luaV__objlen_474 ' JUMPV addrg
C_luaV__objlen_477
 rdlong r22, r19 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__objlen_480 ' NEU4
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 jmp #JMPA
 long @C_luaV__objlen_481 ' JUMPV addrg
C_luaV__objlen_480
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__objlen_482 ' EQU4
 jmp #LODL
 long 0
 mov r13, RI ' reg <- con
 jmp #JMPA
 long @C_luaV__objlen_483 ' JUMPV addrg
C_luaV__objlen_482
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
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_luaV__objlen_483
 mov r15, r13 ' CVI, CVU or LOAD
C_luaV__objlen_481
 jmp #LODF
 long -8
 wrlong r15, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__objlen_484 ' EQU4
 jmp #JMPA
 long @C_luaV__objlen_475 ' JUMPV addrg
C_luaV__objlen_484
 jmp #LODF
 long -16
 wrlong r21, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__objlen_473 ' JUMPV addrg
C_luaV__objlen_486
 jmp #LODF
 long -12
 wrlong r21, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__objlen_473 ' JUMPV addrg
C_luaV__objlen_487
 jmp #LODF
 long -12
 wrlong r21, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__objlen_473 ' JUMPV addrg
C_luaV__objlen_474
 mov r2, #4 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__objlen_475 ' NEI4
 jmp #LODL
 long @C_luaV__objlen_490_L000491
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__typeerror
 add SP, #8 ' CALL addrg
C_luaV__objlen_475
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
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
 long @C_luaT__callT_M_res
 add SP, #16 ' CALL addrg
C_luaV__objlen_473
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaV_idiv

 alignl ' align long
C_luaV__idiv ' <symbol:luaV_idiv>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 add r20, #1 ' ADDU4 coni
 cmp r20, r22 wz,wc 
 jmp #BR_A
 long @C_luaV__idiv_494 ' GTU4
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_luaV__idiv_496 ' NEI4
 jmp #LODL
 long @C_luaV__idiv_498_L000499
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__idiv_496
 mov r22, #0 ' reg <- coni
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__idiv_493 ' JUMPV addrg
C_luaV__idiv_494
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, #0 ' reg <- coni
 mov r20, r21 ' BXORI/U
 xor r20, r19 ' BXORI/U (3)
 cmps r20, r22 wz,wc
 jmp #BRAE
 long @C_luaV__idiv_500 ' GEI4
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r1, r22 wz
 jmp #BR_Z
 long @C_luaV__idiv_500 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__idiv_500
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_luaV__idiv_493
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaV_mod

 alignl ' align long
C_luaV__mod ' <symbol:luaV_mod>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 add r20, #1 ' ADDU4 coni
 cmp r20, r22 wz,wc 
 jmp #BR_A
 long @C_luaV__mod_503 ' GTU4
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_luaV__mod_505 ' NEI4
 jmp #LODL
 long @C_luaV__mod_507_L000508
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaV__mod_505
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaV__mod_502 ' JUMPV addrg
C_luaV__mod_503
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODF
 long -8
 wrlong r1, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__mod_509 ' EQI4
 xor r22, r19 ' BXORI/U (1)
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_luaV__mod_509 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r19 ' ADDI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__mod_509
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_luaV__mod_502
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaV_modf

 alignl ' align long
C_luaV__modf ' <symbol:luaV_modf>
 jmp #NEWF
 jmp #PSHM
 long $eaa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fmod
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_luaV__modf_517 ' LEF4
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_luaV__modf_519 ' GEF4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__modf_520 ' JUMPV addrg
C_luaV__modf_519
 mov r13, #0 ' reg <- coni
C_luaV__modf_520
 mov r15, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__modf_518 ' JUMPV addrg
C_luaV__modf_517
 jmp #LODI
 long @C_s4784_6695052b_forlimit_L000059_75_L000076
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_luaV__modf_521 ' GEF4
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_luaV__modf_521 ' LEF4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__modf_522 ' JUMPV addrg
C_luaV__modf_521
 mov r11, #0 ' reg <- coni
C_luaV__modf_522
 mov r15, r11 ' CVI, CVU or LOAD
C_luaV__modf_518
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaV__modf_512 ' EQI4
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r17, r0 ' CVI, CVU or LOAD
C_luaV__modf_512
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaV__modf_511 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaV_shiftl

 alignl ' align long
C_luaV__shiftl ' <symbol:luaV_shiftl>
 jmp #PSHM
 long $500000 ' save registers
 cmps r2,  #0 wz,wc
 jmp #BRAE
 long @C_luaV__shiftl_524 ' GEI4
 jmp #LODL
 long -32
 mov r22, RI ' reg <- con
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_luaV__shiftl_526 ' GTI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaV__shiftl_523 ' JUMPV addrg
C_luaV__shiftl_526
 mov r22, r3 ' CVI, CVU or LOAD
 neg r20, r2 ' NEGI4
 shr r22, r20 ' RSHU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaV__shiftl_523 ' JUMPV addrg
C_luaV__shiftl_524
 cmps r2,  #32 wz,wc
 jmp #BR_B
 long @C_luaV__shiftl_528 ' LTI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaV__shiftl_523 ' JUMPV addrg
C_luaV__shiftl_528
 mov r22, r3 ' CVI, CVU or LOAD
 mov r20, r2 ' CVI, CVU or LOAD
 shl r22, r20 ' LSHI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
C_luaV__shiftl_523
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s47811_6695052b_pushclosure_L000530 ' <symbol:pushclosure>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #CALA
 long @C_luaF__newL_closure
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #12 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
 mov r7, r17 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r13, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r7 ' ASGNP4 reg reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #70 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_s47811_6695052b_pushclosure_L000530_535 ' JUMPV addrg
C_s47811_6695052b_pushclosure_L000530_532
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 adds r22, r11 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s47811_6695052b_pushclosure_L000530_536 ' EQI4
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 adds r22, r11 ' ADDI/P (1)
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #3 ' LSHI4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r19 ' ADDI/P (3)
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__findupval
 add SP, #4 ' CALL addrg
 mov r20, r15
 shl r20, #2 ' LSHI4 coni
 mov r18, r13
 adds r18, #16 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 wrlong r0, r20 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s47811_6695052b_pushclosure_L000530_537 ' JUMPV addrg
C_s47811_6695052b_pushclosure_L000530_536
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, r13
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r15
 shl r20, #3 ' LSHI4 coni
 adds r20, r11 ' ADDI/P (1)
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #2 ' LSHI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_s47811_6695052b_pushclosure_L000530_537
 mov r22, #0 ' reg <- coni
 mov r20, r13
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s47811_6695052b_pushclosure_L000530_539 ' EQI4
 mov r20, r15
 shl r20, #2 ' LSHI4 coni
 mov r18, r13
 adds r18, #16 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s47811_6695052b_pushclosure_L000530_539 ' EQI4
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
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_s47811_6695052b_pushclosure_L000530_539 ' JUMPV addrg
C_s47811_6695052b_pushclosure_L000530_539
' C_s47811_6695052b_pushclosure_L000530_533 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s47811_6695052b_pushclosure_L000530_535
 cmps r15, r9 wz,wc
 jmp #BR_B
 long @C_s47811_6695052b_pushclosure_L000530_532 ' LTI4
' C_s47811_6695052b_pushclosure_L000530_531 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaV_finishOp

 alignl ' align long
C_luaV__finishO_p ' <symbol:luaV_finishOp>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRI4 reg
 cmps r19,  #11 wz,wc
 jmp #BR_B
 long @C_luaV__finishO_p_542 ' LTI4
 cmps r19,  #20 wz,wc
 jmp #BR_A
 long @C_luaV__finishO_p_555 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaV__finishO_p_556_L000558-44
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__finishO_p_556_L000558 ' <symbol:556>
 long @C_luaV__finishO_p_545
 long @C_luaV__finishO_p_545
 long @C_luaV__finishO_p_545
 long @C_luaV__finishO_p_545
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_545

' Catalina Code

DAT ' code segment
C_luaV__finishO_p_555
 cmps r19,  #46 wz,wc
 jmp #BR_B
 long @C_luaV__finishO_p_542 ' LTI4
 cmps r19,  #70 wz,wc
 jmp #BR_A
 long @C_luaV__finishO_p_542 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaV__finishO_p_560_L000562-184
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__finishO_p_560_L000562 ' <symbol:560>
 long @C_luaV__finishO_p_544
 long @C_luaV__finishO_p_544
 long @C_luaV__finishO_p_544
 long @C_luaV__finishO_p_545
 long @C_luaV__finishO_p_545
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_545
 long @C_luaV__finishO_p_552
 long @C_luaV__finishO_p_553
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_546
 long @C_luaV__finishO_p_546
 long @C_luaV__finishO_p_546
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_546
 long @C_luaV__finishO_p_546
 long @C_luaV__finishO_p_546
 long @C_luaV__finishO_p_546
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_542
 long @C_luaV__finishO_p_554

' Catalina Code

DAT ' code segment
C_luaV__finishO_p_544
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODF
 long -24
 wrlong r20, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__finishO_p_542 ' JUMPV addrg
C_luaV__finishO_p_545
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
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #LODF
 long -24
 wrlong r20, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__finishO_p_542 ' JUMPV addrg
C_luaV__finishO_p_546
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_luaV__finishO_p_548 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__finishO_p_548 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__finishO_p_549 ' JUMPV addrg
C_luaV__finishO_p_548
 mov r17, #0 ' reg <- coni
C_luaV__finishO_p_549
 jmp #LODF
 long -20
 wrlong r17, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
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
 jmp #BR_Z
 long @C_luaV__finishO_p_542 ' EQI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_luaV__finishO_p_542 ' JUMPV addrg
C_luaV__finishO_p_552
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
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
 jmp #DIVS ' DIVI
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-28)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__concat
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__finishO_p_542 ' JUMPV addrg
C_luaV__finishO_p_553
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_luaV__finishO_p_542 ' JUMPV addrg
C_luaV__finishO_p_554
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
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaV__finishO_p_542
' C_luaV__finishO_p_540 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Export luaV_execute

 alignl ' align long
C_luaV__execute ' <symbol:luaV_execute>
 jmp #NEWF
 sub SP, #56
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
C_luaV__execute_565
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_566
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdlong r11, r22 ' reg <- INDIRP4 reg
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #48 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_567 ' EQI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r11
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaV__execute_569 ' NEU4
 mov r22, r11
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_571 ' EQI4
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaV__execute_572 ' JUMPV addrg
C_luaV__execute_571
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__hookcall
 add SP, #4 ' CALL addrg
C_luaV__execute_572
C_luaV__execute_569
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_luaV__execute_567
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #8 ' ADDP4 coni
C_luaV__execute_573
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_577 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__traceexec
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #8 ' ADDP4 coni
C_luaV__execute_577
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #4 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 mov r7, r22 ' ADDI/P
 adds r7, r17 ' ADDI/P (3)
 mov r22, r9
 and r22, #127 ' BANDU4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_luaV__execute_573 ' LTI4
 cmps r22,  #82 wz,wc
 jmp #BR_A
 long @C_luaV__execute_573 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaV__execute_1280_L001282
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaV__execute_1280_L001282 ' <symbol:1280>
 long @C_luaV__execute_582
 long @C_luaV__execute_583
 long @C_luaV__execute_584
 long @C_luaV__execute_585
 long @C_luaV__execute_586
 long @C_luaV__execute_587
 long @C_luaV__execute_588
 long @C_luaV__execute_589
 long @C_luaV__execute_590
 long @C_luaV__execute_594
 long @C_luaV__execute_595
 long @C_luaV__execute_598
 long @C_luaV__execute_607
 long @C_luaV__execute_628
 long @C_luaV__execute_640
 long @C_luaV__execute_649
 long @C_luaV__execute_663
 long @C_luaV__execute_689
 long @C_luaV__execute_706
 long @C_luaV__execute_720
 long @C_luaV__execute_730
 long @C_luaV__execute_742
 long @C_luaV__execute_747
 long @C_luaV__execute_764
 long @C_luaV__execute_781
 long @C_luaV__execute_798
 long @C_luaV__execute_815
 long @C_luaV__execute_835
 long @C_luaV__execute_850
 long @C_luaV__execute_867
 long @C_luaV__execute_873
 long @C_luaV__execute_879
 long @C_luaV__execute_885
 long @C_luaV__execute_891
 long @C_luaV__execute_897
 long @C_luaV__execute_914
 long @C_luaV__execute_931
 long @C_luaV__execute_948
 long @C_luaV__execute_965
 long @C_luaV__execute_983
 long @C_luaV__execute_998
 long @C_luaV__execute_1015
 long @C_luaV__execute_1024
 long @C_luaV__execute_1033
 long @C_luaV__execute_1051
 long @C_luaV__execute_1042
 long @C_luaV__execute_1060
 long @C_luaV__execute_1061
 long @C_luaV__execute_1062
 long @C_luaV__execute_1063
 long @C_luaV__execute_1074
 long @C_luaV__execute_1080
 long @C_luaV__execute_1084
 long @C_luaV__execute_1085
 long @C_luaV__execute_1088
 long @C_luaV__execute_1089
 long @C_luaV__execute_1090
 long @C_luaV__execute_1091
 long @C_luaV__execute_1094
 long @C_luaV__execute_1104
 long @C_luaV__execute_1114
 long @C_luaV__execute_1117
 long @C_luaV__execute_1130
 long @C_luaV__execute_1143
 long @C_luaV__execute_1156
 long @C_luaV__execute_1169
 long @C_luaV__execute_1182
 long @C_luaV__execute_1188
 long @C_luaV__execute_1195
 long @C_luaV__execute_1200
 long @C_luaV__execute_1211
 long @C_luaV__execute_1222
 long @C_luaV__execute_1229
 long @C_luaV__execute_1240
 long @C_luaV__execute_1247
 long @C_luaV__execute_1250
 long @C_luaV__execute_1252
 long @C_luaV__execute_1256
 long @C_luaV__execute_1259
 long @C_luaV__execute_1272
 long @C_luaV__execute_1275
 long @C_luaV__execute_1276
 long @C_luaV__execute_573

' Catalina Code

DAT ' code segment
C_luaV__execute_582
 jmp #LODF
 long -12
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_583
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long 65535
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -16
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_584
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long 65535
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -16
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r0, r20 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_585
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -16
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_586
 rdlong r22, r19 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -16
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_587
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_588
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_589
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_590
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_591
 mov r22, r7 ' CVI, CVU or LOAD
 mov r7, r22
 adds r7, #8 ' ADDP4 coni
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaV__execute_592 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r20, RI ' ASGNI4 addrl reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__execute_591 ' NEI4
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_594
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -16
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_595
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
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -20
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 mov r22, #0 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__execute_597 ' EQI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__execute_597 ' EQI4
 rdlong r20, r7 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__execute_597 ' EQI4
 rdlong r2, r7 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaV__execute_597 ' JUMPV addrg
C_luaV__execute_597
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_598
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
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_603 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_604 ' JUMPV addrg
C_luaV__execute_603
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_605 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_606 ' JUMPV addrg
C_luaV__execute_605
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_606
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_604
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_599 ' EQI4
 jmp #LODF
 long -36
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_599
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_607
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_616 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_618 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_619 ' JUMPV addrg
C_luaV__execute_618
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_luaV__execute_622 ' GEU4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_623 ' JUMPV addrg
C_luaV__execute_622
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_623
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_620 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_621 ' JUMPV addrg
C_luaV__execute_620
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_621
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_619
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_617 ' JUMPV addrg
C_luaV__execute_616
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_624 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_625 ' JUMPV addrg
C_luaV__execute_624
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_626 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_627 ' JUMPV addrg
C_luaV__execute_626
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_627
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_625
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_617
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_608 ' EQI4
 jmp #LODF
 long -52
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -56
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_608
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_628
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_634 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_635 ' JUMPV addrg
C_luaV__execute_634
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_luaV__execute_638 ' GEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_639 ' JUMPV addrg
C_luaV__execute_638
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_639
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_636 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_637 ' JUMPV addrg
C_luaV__execute_636
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_637
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_635
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_629 ' EQI4
 jmp #LODF
 long -36
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_629
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
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
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-40) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_640
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_645 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_646 ' JUMPV addrg
C_luaV__execute_645
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_647 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_648 ' JUMPV addrg
C_luaV__execute_647
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_648
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_646
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_641 ' EQI4
 jmp #LODF
 long -36
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_641
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_649
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
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_651 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_652 ' JUMPV addrg
C_luaV__execute_651
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_652
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_657 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_658 ' JUMPV addrg
C_luaV__execute_657
 mov RI, FP
 sub RI, #-(-28)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_659 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_660 ' JUMPV addrg
C_luaV__execute_659
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_660
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_658
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_653 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_662 ' EQI4
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_662 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_662 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__execute_662 ' JUMPV addrg
C_luaV__execute_662
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_653
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov RI, FP
 sub RI, #-(-24)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_663
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_665 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_666 ' JUMPV addrg
C_luaV__execute_665
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_666
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_675 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_677 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_678 ' JUMPV addrg
C_luaV__execute_677
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 rdlong r20, r7 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_luaV__execute_681 ' GEU4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 rdlong r20, r7 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_682 ' JUMPV addrg
C_luaV__execute_681
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 rdlong r3, r7 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_682
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_679 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_680 ' JUMPV addrg
C_luaV__execute_679
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_680
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_678
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_676 ' JUMPV addrg
C_luaV__execute_675
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_683 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_684 ' JUMPV addrg
C_luaV__execute_683
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 rdlong r3, r7 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_685 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -52
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_686 ' JUMPV addrg
C_luaV__execute_685
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -52
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_686
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_684
 mov r22, FP
 sub r22, #-(-48) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_676
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_667 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -56
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -60
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-56) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-60) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_688 ' EQI4
 rdlong r18, r7 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_688 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_688 ' EQI4
 rdlong r2, r7 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__execute_688 ' JUMPV addrg
C_luaV__execute_688
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_667
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov r5, r7 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_689
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_691 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_692 ' JUMPV addrg
C_luaV__execute_691
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_692
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_698 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_699 ' JUMPV addrg
C_luaV__execute_698
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub r22, #1 ' SUBU4 coni
 rdlong r20, r7 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_luaV__execute_702 ' GEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 rdlong r20, r7 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_703 ' JUMPV addrg
C_luaV__execute_702
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 rdlong r3, r7 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_703
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_700 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_701 ' JUMPV addrg
C_luaV__execute_700
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_701
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_699
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_693 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_705 ' EQI4
 rdlong r18, r7 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_705 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_705 ' EQI4
 rdlong r2, r7 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__execute_705 ' JUMPV addrg
C_luaV__execute_705
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_693
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNP4 addrl reg
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
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov r5, r7 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_706
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_708 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_709 ' JUMPV addrg
C_luaV__execute_708
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_709
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_714 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_715 ' JUMPV addrg
C_luaV__execute_714
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 rdlong r3, r7 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_716 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_717 ' JUMPV addrg
C_luaV__execute_716
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_717
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_715
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_710 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_719 ' EQI4
 rdlong r18, r7 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_719 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_719 ' EQI4
 rdlong r2, r7 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__execute_719 ' JUMPV addrg
C_luaV__execute_719
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_710
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov r5, r7 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_720
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_luaV__execute_721 ' LEI4
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_721
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_723 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 rdlong r20, r19 ' reg <- INDIRU4 reg
 shr r20, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 shl r20, #8 ' LSHI4 coni
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_723
 adds r19, #4 ' ADDP4 coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r7
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__new ' CALL addrg
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -24
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
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
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_727 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaV__execute_725 ' EQI4
C_luaV__execute_727
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
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
 jmp #CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
C_luaV__execute_725
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_luaV__execute_573 ' LEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r7
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_730
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_732 ' EQI4
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_733 ' JUMPV addrg
C_luaV__execute_732
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
C_luaV__execute_733
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r7
 adds r22, #8 ' ADDP4 coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_luaV__execute_738 ' EQI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_739 ' JUMPV addrg
C_luaV__execute_738
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getstr
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_740 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_741 ' JUMPV addrg
C_luaV__execute_740
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_741
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_739
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_734 ' EQI4
 jmp #LODF
 long -40
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -44
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_734
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_742
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_743 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -24
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_743
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_573 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FADD ' ADDF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_747
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_748 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_748 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_748
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_756 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_757 ' JUMPV addrg
C_luaV__execute_756
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_758 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_759 ' JUMPV addrg
C_luaV__execute_758
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_759
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_757
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_760 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_761 ' JUMPV addrg
C_luaV__execute_760
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_762 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_763 ' JUMPV addrg
C_luaV__execute_762
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_763
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_761
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FADD ' ADDF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_764
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_765 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_765 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_765
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_773 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_774 ' JUMPV addrg
C_luaV__execute_773
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_775 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_776 ' JUMPV addrg
C_luaV__execute_775
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_776
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_774
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_777 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_778 ' JUMPV addrg
C_luaV__execute_777
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_779 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_780 ' JUMPV addrg
C_luaV__execute_779
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_780
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_778
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FSUB ' SUBF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_781
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_782 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_782 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_782
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_790 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_791 ' JUMPV addrg
C_luaV__execute_790
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_792 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_793 ' JUMPV addrg
C_luaV__execute_792
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_793
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_791
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_794 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_795 ' JUMPV addrg
C_luaV__execute_794
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_796 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_797 ' JUMPV addrg
C_luaV__execute_796
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_797
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_795
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FMUL ' MULF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_798
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_799 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_799 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_799
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_807 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_808 ' JUMPV addrg
C_luaV__execute_807
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_809 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_810 ' JUMPV addrg
C_luaV__execute_809
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_810
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_808
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_811 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_812 ' JUMPV addrg
C_luaV__execute_811
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_813 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_814 ' JUMPV addrg
C_luaV__execute_813
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_814
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_812
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_815
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_822 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_823 ' JUMPV addrg
C_luaV__execute_822
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_824 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_825 ' JUMPV addrg
C_luaV__execute_824
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_825
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_823
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_826 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_827 ' JUMPV addrg
C_luaV__execute_826
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_828 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_829 ' JUMPV addrg
C_luaV__execute_828
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_829
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_827
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_luaV__execute_833_L000834
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_luaV__execute_831 ' NEF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -48
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_832 ' JUMPV addrg
C_luaV__execute_831
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNF4 addrl reg
C_luaV__execute_832
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_835
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_842 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_843 ' JUMPV addrg
C_luaV__execute_842
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_844 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_845 ' JUMPV addrg
C_luaV__execute_844
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_845
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_843
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_846 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_847 ' JUMPV addrg
C_luaV__execute_846
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_848 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_849 ' JUMPV addrg
C_luaV__execute_848
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_849
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_847
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FDIV ' DIVF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_850
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_851 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_851 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_851
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_859 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_860 ' JUMPV addrg
C_luaV__execute_859
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_861 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_862 ' JUMPV addrg
C_luaV__execute_861
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_862
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_860
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_863 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_864 ' JUMPV addrg
C_luaV__execute_863
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_865 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_866 ' JUMPV addrg
C_luaV__execute_865
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_866
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_864
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_867
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_871 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_872 ' JUMPV addrg
C_luaV__execute_871
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_872
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -32
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_873
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_877 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_878 ' JUMPV addrg
C_luaV__execute_877
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_878
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -32
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_879
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_883 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_884 ' JUMPV addrg
C_luaV__execute_883
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_884
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -32
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_885
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_889 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_890 ' JUMPV addrg
C_luaV__execute_889
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_890
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r2, r22 ' NEGI4
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_891
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_895 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_896 ' JUMPV addrg
C_luaV__execute_895
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_896
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_897
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_898 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_898 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_898
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_906 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_907 ' JUMPV addrg
C_luaV__execute_906
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_908 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_909 ' JUMPV addrg
C_luaV__execute_908
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_909
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_907
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_910 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_911 ' JUMPV addrg
C_luaV__execute_910
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_912 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_913 ' JUMPV addrg
C_luaV__execute_912
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_913
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_911
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FADD ' ADDF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_914
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_915 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_915 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_915
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_923 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_924 ' JUMPV addrg
C_luaV__execute_923
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_925 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_926 ' JUMPV addrg
C_luaV__execute_925
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_926
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_924
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_927 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_928 ' JUMPV addrg
C_luaV__execute_927
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_929 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_930 ' JUMPV addrg
C_luaV__execute_929
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_930
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_928
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FSUB ' SUBF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_931
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_932 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_932 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_932
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_940 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_941 ' JUMPV addrg
C_luaV__execute_940
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_942 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_943 ' JUMPV addrg
C_luaV__execute_942
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_943
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_941
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_944 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_945 ' JUMPV addrg
C_luaV__execute_944
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_946 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_947 ' JUMPV addrg
C_luaV__execute_946
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_947
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_945
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FMUL ' MULF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_948
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_949 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_949 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_949
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_957 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_958 ' JUMPV addrg
C_luaV__execute_957
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_959 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_960 ' JUMPV addrg
C_luaV__execute_959
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_960
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_958
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_961 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_962 ' JUMPV addrg
C_luaV__execute_961
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_963 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_964 ' JUMPV addrg
C_luaV__execute_963
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_964
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_962
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_965
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_972 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_973 ' JUMPV addrg
C_luaV__execute_972
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_974 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_975 ' JUMPV addrg
C_luaV__execute_974
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_975
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_973
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_976 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_977 ' JUMPV addrg
C_luaV__execute_976
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_978 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_979 ' JUMPV addrg
C_luaV__execute_978
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_979
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_977
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_luaV__execute_833_L000834
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_luaV__execute_981 ' NEF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -48
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_982 ' JUMPV addrg
C_luaV__execute_981
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNF4 addrl reg
C_luaV__execute_982
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_983
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_990 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_991 ' JUMPV addrg
C_luaV__execute_990
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_992 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_993 ' JUMPV addrg
C_luaV__execute_992
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_993
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_991
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_994 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_995 ' JUMPV addrg
C_luaV__execute_994
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_996 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_997 ' JUMPV addrg
C_luaV__execute_996
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_997
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_995
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #FDIV ' DIVF4
 wrlong r0, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_998
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_999 ' NEI4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_999 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_999
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_1007 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1008 ' JUMPV addrg
C_luaV__execute_1007
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1009 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1010 ' JUMPV addrg
C_luaV__execute_1009
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1010
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1008
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_1011 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1012 ' JUMPV addrg
C_luaV__execute_1011
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1013 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1014 ' JUMPV addrg
C_luaV__execute_1013
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1014
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1012
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1015
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1020 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1021 ' JUMPV addrg
C_luaV__execute_1020
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1021
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1022 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1023 ' JUMPV addrg
C_luaV__execute_1022
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1023
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -36
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1024
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1029 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1030 ' JUMPV addrg
C_luaV__execute_1029
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1030
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1031 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1032 ' JUMPV addrg
C_luaV__execute_1031
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1032
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -36
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1033
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1038 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1039 ' JUMPV addrg
C_luaV__execute_1038
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1039
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1040 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1041 ' JUMPV addrg
C_luaV__execute_1040
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1041
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -36
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-24) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 xor r20, r18 ' BXORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1042
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1047 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1048 ' JUMPV addrg
C_luaV__execute_1047
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1048
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1049 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1050 ' JUMPV addrg
C_luaV__execute_1049
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1050
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -36
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1051
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1056 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1057 ' JUMPV addrg
C_luaV__execute_1056
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1057
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1058 ' NEI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1059 ' JUMPV addrg
C_luaV__execute_1058
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1059
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #LODF
 long -36
 wrlong r7, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1060
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov r5, r7 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1061
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov RI, r7
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybiniT_M_
 add SP, #20 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1062
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 and r22, #1 ' BANDU4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov RI, r7
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybinassocT_M_
 add SP, #20 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1063
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1064 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -24
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1064
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_1070 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1071 ' JUMPV addrg
C_luaV__execute_1070
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1072 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1073 ' JUMPV addrg
C_luaV__execute_1072
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1073
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1071
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1066 ' EQI4
 jmp #LODF
 long -28
 wrlong r7, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1066
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #18 ' reg ARG coni
 mov r3, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1074
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1078 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1079 ' JUMPV addrg
C_luaV__execute_1078
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1079
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1075 ' EQI4
 jmp #LODF
 long -24
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 jmp #LODL
 long $ffffffff
 mov r18, RI ' reg <- con
 xor r20, r18 ' BXORI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1075
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #19 ' reg ARG coni
 mov r3, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1080
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_luaV__execute_1083 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__execute_1081 ' NEI4
C_luaV__execute_1083
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1081
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1084
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 adds r2, r17 ' ADDI/P (3)
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__objlen
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1085
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 adds r20, r7 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_luaV__execute_573 ' LEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1088
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r7 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1089
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__newtbcupval
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1090
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1091
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
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
 jmp #BR_Z
 long @C_luaV__execute_1092 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1092
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1094
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_1095 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_1095 ' NEI4
 rdlong r22, r7 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_luaV__execute_1098 ' GEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1099 ' JUMPV addrg
C_luaV__execute_1098
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1099
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1096 ' JUMPV addrg
C_luaV__execute_1095
 mov r22, #3 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_1100 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_1100 ' NEI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478k_6695052b_L_T_num_L000294
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1101 ' JUMPV addrg
C_luaV__execute_1100
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478m_6695052b_lessthanothers_L000322
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1101
C_luaV__execute_1096
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1102 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1102
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1104
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #3 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_1105 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_1105 ' NEI4
 rdlong r22, r7 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_luaV__execute_1108 ' GTI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1109 ' JUMPV addrg
C_luaV__execute_1108
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1109
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1106 ' JUMPV addrg
C_luaV__execute_1105
 mov r22, #3 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_1110 ' NEI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaV__execute_1110 ' NEI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478l_6695052b_L_E_num_L000308
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1111 ' JUMPV addrg
C_luaV__execute_1110
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s478n_6695052b_lessequalothers_L000332
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1111
C_luaV__execute_1106
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1112 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1112
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1114
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r13 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1115 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1115
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1117
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1118 ' NEI4
 rdlong r22, r7 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaV__execute_1121 ' NEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1122 ' JUMPV addrg
C_luaV__execute_1121
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1122
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1119 ' JUMPV addrg
C_luaV__execute_1118
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_1123 ' NEI4
 rdlong r22, r7 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r0, r20 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FCMP
 jmp #BRNZ
 long @C_luaV__execute_1126 ' NEF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1127 ' JUMPV addrg
C_luaV__execute_1126
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1127
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1124 ' JUMPV addrg
C_luaV__execute_1123
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1124
C_luaV__execute_1119
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1128 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1128
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1130
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1131 ' NEI4
 rdlong r22, r7 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRAE
 long @C_luaV__execute_1134 ' GEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1135 ' JUMPV addrg
C_luaV__execute_1134
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1135
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1132 ' JUMPV addrg
C_luaV__execute_1131
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_1136 ' NEI4
 rdlong r22, r7 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_luaV__execute_1139 ' GEF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1140 ' JUMPV addrg
C_luaV__execute_1139
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1140
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1137 ' JUMPV addrg
C_luaV__execute_1136
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov RI, r7
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__callorderiT_M_
 add SP, #20 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1137
C_luaV__execute_1132
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1141 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1141
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1143
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1144 ' NEI4
 rdlong r22, r7 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_luaV__execute_1147 ' GTI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1148 ' JUMPV addrg
C_luaV__execute_1147
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1148
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1145 ' JUMPV addrg
C_luaV__execute_1144
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_1149 ' NEI4
 rdlong r22, r7 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_luaV__execute_1152 ' GTF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1153 ' JUMPV addrg
C_luaV__execute_1152
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1153
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1150 ' JUMPV addrg
C_luaV__execute_1149
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov RI, r7
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__callorderiT_M_
 add SP, #20 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1150
C_luaV__execute_1145
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1154 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1154
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1156
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1157 ' NEI4
 rdlong r22, r7 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_luaV__execute_1160 ' LEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1161 ' JUMPV addrg
C_luaV__execute_1160
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1161
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1158 ' JUMPV addrg
C_luaV__execute_1157
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_1162 ' NEI4
 rdlong r22, r7 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_luaV__execute_1165 ' LEF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1166 ' JUMPV addrg
C_luaV__execute_1165
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1166
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1163 ' JUMPV addrg
C_luaV__execute_1162
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov RI, r7
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__callorderiT_M_
 add SP, #20 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1163
C_luaV__execute_1158
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1167 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1167
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1169
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #127 ' SUBI4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1170 ' NEI4
 rdlong r22, r7 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_luaV__execute_1173 ' LTI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1174 ' JUMPV addrg
C_luaV__execute_1173
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1174
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1171 ' JUMPV addrg
C_luaV__execute_1170
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaV__execute_1175 ' NEI4
 rdlong r22, r7 ' reg <- INDIRF4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_luaV__execute_1178 ' LTF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1179 ' JUMPV addrg
C_luaV__execute_1178
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1179
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1176 ' JUMPV addrg
C_luaV__execute_1175
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 mov RI, r7
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__callorderiT_M_
 add SP, #20 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_luaV__execute_1176
C_luaV__execute_1171
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1180 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1180
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1182
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_luaV__execute_1184 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1184 ' EQI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1185 ' JUMPV addrg
C_luaV__execute_1184
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1185
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1186 ' EQI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1186
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1188
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_luaV__execute_1194 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__execute_1192 ' NEI4
C_luaV__execute_1194
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1193 ' JUMPV addrg
C_luaV__execute_1192
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1193
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r9
 shr r20, #15 ' RSHU4 coni
 and r20, #1 ' BANDU4 coni
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaV__execute_1189 ' NEI4
 adds r19, #4 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1189
 jmp #LODF
 long -20
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 rdlong r22, r19 ' reg <- INDIRU4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long 67108860
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1195
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1196 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 adds r20, r7 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaV__execute_1196
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__precall
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__execute_1198 ' NEU4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1198
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaV__execute_565 ' JUMPV addrg
C_luaV__execute_1200
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1202 ' EQI4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1203 ' JUMPV addrg
C_luaV__execute_1202
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1203
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1204 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 adds r20, r7 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_luaV__execute_1205 ' JUMPV addrg
C_luaV__execute_1204
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r7 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
C_luaV__execute_1205
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1206 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__closeupval
 add SP, #4 ' CALL addrg
C_luaV__execute_1206
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r7 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaD__pretailcall
 add SP, #16 ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNI4 addrl reg
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_luaV__execute_1208 ' GEI4
 jmp #JMPA
 long @C_luaV__execute_565 ' JUMPV addrg
C_luaV__execute_1208
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
 jmp #CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_1210 ' JUMPV addrg
C_luaV__execute_1211
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_luaV__execute_1212 ' GEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r7 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
C_luaV__execute_1212
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1214 ' EQI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_luaV__execute_1216 ' GEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaV__execute_1216
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1218 ' EQI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #8 ' ADDP4 coni
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 mov r7, r22 ' ADDI/P
 adds r7, r17 ' ADDI/P (3)
C_luaV__execute_1218
C_luaV__execute_1214
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1220 ' EQI4
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
C_luaV__execute_1220
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 adds r20, r7 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_1210 ' JUMPV addrg
C_luaV__execute_1222
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1223 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 wrlong r7, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__execute_1210 ' JUMPV addrg
C_luaV__execute_1223
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r20, r17 ' ADDI/P (2)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1228 ' JUMPV addrg
C_luaV__execute_1225
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
' C_luaV__execute_1226 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1228
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_luaV__execute_1225 ' GTI4
 jmp #JMPA
 long @C_luaV__execute_1210 ' JUMPV addrg
C_luaV__execute_1229
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1230 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r7
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaV__execute_1231 ' JUMPV addrg
C_luaV__execute_1230
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__execute_1232 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r20, r17 ' ADDI/P (2)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_luaV__execute_1233 ' JUMPV addrg
C_luaV__execute_1232
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -20
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 wrlong r17, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_luaV__execute_1237 ' JUMPV addrg
C_luaV__execute_1234
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
' C_luaV__execute_1235 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1237
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz,wc
 jmp #BR_A
 long @C_luaV__execute_1234 ' GTI4
C_luaV__execute_1233
C_luaV__execute_1231
C_luaV__execute_1210
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1238 ' EQI4
 jmp #JMPA
 long @C_luaV__execute_564 ' JUMPV addrg
C_luaV__execute_1238
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaV__execute_566 ' JUMPV addrg
C_luaV__execute_1240
 mov r22, r7
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaV__execute_1241 ' NEI4
 mov r22, r7
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1242 ' EQU4
 mov r22, r7
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 rdlong r22, r7 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r7
 adds r22, #8 ' ADDP4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -24
 wrlong r7, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r7
 adds r22, #24 ' ADDP4 coni
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 subs r19, r22 ' SUBI/P (1)
 jmp #JMPA
 long @C_luaV__execute_1242 ' JUMPV addrg
C_luaV__execute_1241
 mov r2, r7 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s478b_6695052b_floatforloop_L000136 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1245 ' EQI4
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 subs r19, r22 ' SUBI/P (1)
C_luaV__execute_1245
C_luaV__execute_1242
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1247
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s4787_6695052b_forprep_L000090
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 adds r22, #4 ' ADDI4 coni
 adds r19, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1250
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r7
 adds r2, #24 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__newtbcupval
 add SP, #4 ' CALL addrg
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 adds r19, r22 ' ADDI/P (2)
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #4 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
C_luaV__execute_1252
' C_luaV__execute_1251 ' (symbol refcount = 0)
 mov r2, #24 ' reg ARG coni
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r7
 adds r4, #32 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r7
 adds r20, #56 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r7
 adds r3, #32 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1253 ' EQI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #8 ' ADDP4 coni
 mov r22, r9
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 shl r22, #3 ' LSHI4 coni
 mov r7, r22 ' ADDI/P
 adds r7, r17 ' ADDI/P (3)
C_luaV__execute_1253
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #4 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRU4 reg
C_luaV__execute_1256
' C_luaV__execute_1255 ' (symbol refcount = 0)
 mov r22, r7
 adds r22, #36 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_573 ' EQI4
 mov r22, r7
 adds r22, #16 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r7
 adds r22, #32 ' ADDP4 coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 subs r19, r22 ' SUBI/P (1)
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1259
 mov r22, r9
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 rdlong r22, r7 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaV__execute_1260 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r7 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaV__execute_1261 ' JUMPV addrg
C_luaV__execute_1260
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaV__execute_1261
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #LODL
 long $8000
 mov r22, RI ' reg <- con
 and r22, r9 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1262 ' EQI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r19 ' reg <- INDIRU4 reg
 shr r20, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 shl r20, #8 ' LSHI4 coni
 add r22, r20 ' ADDU (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 adds r19, #4 ' ADDP4 coni
C_luaV__execute_1262
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r0 wz,wc 
 jmp #BRBE
 long @C_luaV__execute_1269 ' LEU4
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__resizearray
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaV__execute_1269 ' JUMPV addrg
C_luaV__execute_1266
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 adds r22, r7 ' ADDI/P (1)
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 shl r22, #3 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1271 ' EQI4
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1271 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaV__execute_1271 ' EQI4
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaV__execute_1271 ' JUMPV addrg
C_luaV__execute_1271
' C_luaV__execute_1267 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_luaV__execute_1269
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_luaV__execute_1266 ' GTI4
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1272
 mov r22, r9
 shr r22, #15 ' RSHU4 coni
 jmp #LODL
 long $1ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, r11
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r11
 adds r4, #16 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s47811_6695052b_pushclosure_L000530
 add SP, #16 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_luaV__execute_573 ' LEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r7
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1275
 mov r22, r9
 shr r22, #24 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r7 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__getvarargs
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_1276
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
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
 jmp #CALA
 long @C_luaT__adjustvarargs
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaV__execute_1277 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__hookcall
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_luaV__execute_1277
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #8 ' ADDP4 coni
 jmp #JMPA
 long @C_luaV__execute_573 ' JUMPV addrg
C_luaV__execute_564
 jmp #POPM ' restore registers
 add SP, #56 ' framesize
 jmp #RETF


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
C_luaV__execute_833_L000834 ' <symbol:833>
 long $40000000 ' float

 alignl ' align long
C_luaV__mod_507_L000508 ' <symbol:507>
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
C_luaV__idiv_498_L000499 ' <symbol:498>
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
C_luaV__objlen_490_L000491 ' <symbol:490>
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
C_luaV__concat_467_L000468 ' <symbol:467>
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
C_luaV__finishset_211_L000212 ' <symbol:211>
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
C_luaV__finishget_178_L000179 ' <symbol:178>
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
C_luaV__finishget_158_L000159 ' <symbol:158>
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_s4787_6695052b_forprep_L000090_121_L000122 ' <symbol:121>
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
C_s4787_6695052b_forprep_L000090_114_L000115 ' <symbol:114>
 byte 115
 byte 116
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_s4787_6695052b_forprep_L000090_96_L000097 ' <symbol:96>
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
C_s4784_6695052b_forlimit_L000059_75_L000076 ' <symbol:75>
 long $0 ' float

 alignl ' align long
C_s4784_6695052b_forlimit_L000059_71_L000072 ' <symbol:71>
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_luaV__flttointeger_49_L000050 ' <symbol:49>
 long $4f000000 ' float

 alignl ' align long
C_luaV__flttointeger_47_L000048 ' <symbol:47>
 long $cf000000 ' float

 alignl ' align long
C_luaV__flttointeger_42_L000043 ' <symbol:42>
 long $3f800000 ' float

' Catalina Code

DAT ' code segment
' end
