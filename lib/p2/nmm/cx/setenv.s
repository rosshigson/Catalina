' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_se3g_67ea42a6_find_name_L000003 ' <symbol:find_name>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r23 ' CVI, CVU or LOAD
 jmp #\@C_se3g_67ea42a6_find_name_L000003_6 ' JUMPV addrg
C_se3g_67ea42a6_find_name_L000003_5
 wrlong r17, r19 ' ASGNP4 reg reg
 jmp #\@C_se3g_67ea42a6_find_name_L000003_9 ' JUMPV addrg
C_se3g_67ea42a6_find_name_L000003_8
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 wrlong r22, r19 ' ASGNP4 reg reg
C_se3g_67ea42a6_find_name_L000003_9
 rdlong r22, r19 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_z jmp #\C_se3g_67ea42a6_find_name_L000003_12 ' EQI4
 cmps r22,  #61 wz
 if_z jmp #\C_se3g_67ea42a6_find_name_L000003_12 ' EQI4
 cmps r22,  #0 wz
 if_nz jmp #\C_se3g_67ea42a6_find_name_L000003_8 ' NEI4
C_se3g_67ea42a6_find_name_L000003_12
 rdlong r22, r19 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_se3g_67ea42a6_find_name_L000003_18  ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_se3g_67ea42a6_find_name_L000003_18 ' NEI4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #61 wz
 if_nz jmp #\C_se3g_67ea42a6_find_name_L000003_15 ' NEI4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 wrlong r22, r19 ' ASGNP4 reg reg
C_se3g_67ea42a6_find_name_L000003_15
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_se3g_67ea42a6_find_name_L000003_4 ' JUMPV addrg
C_se3g_67ea42a6_find_name_L000003_17
 adds r17, #1 ' ADDP4 coni
C_se3g_67ea42a6_find_name_L000003_18
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_z jmp #\C_se3g_67ea42a6_find_name_L000003_20 ' EQI4
 cmps r22,  #0 wz
 if_nz jmp #\C_se3g_67ea42a6_find_name_L000003_17 ' NEI4
C_se3g_67ea42a6_find_name_L000003_20
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_se3g_67ea42a6_find_name_L000003_21 ' NEI4
 adds r17, #1 ' ADDP4 coni
C_se3g_67ea42a6_find_name_L000003_21
C_se3g_67ea42a6_find_name_L000003_6
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_se3g_67ea42a6_find_name_L000003_5 ' NEI4
 mov r22, ##0 ' reg <- con
 wrlong r22, r19 ' ASGNP4 reg reg
 mov r0, ##0 ' RET con
C_se3g_67ea42a6_find_name_L000003_4
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_se3g1_67ea42a6_delete_name_L000023 ' <symbol:delete_name>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, r23 ' CVI, CVU or LOAD
 jmp #\@C_se3g1_67ea42a6_delete_name_L000023_26 ' JUMPV addrg
C_se3g1_67ea42a6_delete_name_L000023_25
 mov r19, r17 ' CVI, CVU or LOAD
 jmp #\@C_se3g1_67ea42a6_delete_name_L000023_29 ' JUMPV addrg
C_se3g1_67ea42a6_delete_name_L000023_28
 adds r19, #1 ' ADDP4 coni
C_se3g1_67ea42a6_delete_name_L000023_29
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_z jmp #\C_se3g1_67ea42a6_delete_name_L000023_32 ' EQI4
 cmps r22,  #61 wz
 if_z jmp #\C_se3g1_67ea42a6_delete_name_L000023_32 ' EQI4
 cmps r22,  #0 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_28 ' NEI4
C_se3g1_67ea42a6_delete_name_L000023_32
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_47  ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_47 ' NEI4
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #61 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_34 ' NEI4
 adds r19, #1 ' ADDP4 coni
 jmp #\@C_se3g1_67ea42a6_delete_name_L000023_38 ' JUMPV addrg
C_se3g1_67ea42a6_delete_name_L000023_37
 adds r19, #1 ' ADDP4 coni
C_se3g1_67ea42a6_delete_name_L000023_38
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_se3g1_67ea42a6_delete_name_L000023_40 ' EQI4
 cmps r22,  #10 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_37 ' NEI4
C_se3g1_67ea42a6_delete_name_L000023_40
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_44 ' NEI4
 adds r19, #1 ' ADDP4 coni
 jmp #\@C_se3g1_67ea42a6_delete_name_L000023_44 ' JUMPV addrg
C_se3g1_67ea42a6_delete_name_L000023_43
 rdbyte r22, r19 ' reg <- INDIRU1 reg
 wrbyte r22, r17 ' ASGNU1 reg reg
 adds r17, #1 ' ADDP4 coni
 adds r19, #1 ' ADDP4 coni
C_se3g1_67ea42a6_delete_name_L000023_44
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_43 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r17 ' ASGNU1 reg reg
 jmp #\@C_se3g1_67ea42a6_delete_name_L000023_34 ' JUMPV addrg
C_se3g1_67ea42a6_delete_name_L000023_46
 adds r17, #1 ' ADDP4 coni
C_se3g1_67ea42a6_delete_name_L000023_47
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_z jmp #\C_se3g1_67ea42a6_delete_name_L000023_49 ' EQI4
 cmps r22,  #0 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_46 ' NEI4
C_se3g1_67ea42a6_delete_name_L000023_49
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_50 ' NEI4
 adds r17, #1 ' ADDP4 coni
C_se3g1_67ea42a6_delete_name_L000023_50
C_se3g1_67ea42a6_delete_name_L000023_34
C_se3g1_67ea42a6_delete_name_L000023_26
 rdbyte r22, r17 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_se3g1_67ea42a6_delete_name_L000023_25 ' NEI4
' C_se3g1_67ea42a6_delete_name_L000023_24 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_se3g2_67ea42a6_add_name_L000052 ' <symbol:add_name>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' ADDI/P
 adds r22, r13 ' ADDI/P (3)
 adds r22, r11 ' ADDI/P (1)
 adds r22, #2 ' ADDI4 coni
 mov r20, ##2048 ' reg <- con
 cmps r22, r20 wcz
 if_be jmp #\C_se3g2_67ea42a6_add_name_L000052_54 ' LEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_se3g2_67ea42a6_add_name_L000052_53 ' JUMPV addrg
C_se3g2_67ea42a6_add_name_L000052_54
 cmps r15,  #0 wcz
 if_be jmp #\C_se3g2_67ea42a6_add_name_L000052_56 ' LEI4
 mov r22, r15
 subs r22, #1 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_z jmp #\C_se3g2_67ea42a6_add_name_L000052_56 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #10 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_se3g2_67ea42a6_add_name_L000052_56
 mov r17, #0 ' reg <- coni
 jmp #\@C_se3g2_67ea42a6_add_name_L000052_61 ' JUMPV addrg
C_se3g2_67ea42a6_add_name_L000052_58
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, r17 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_se3g2_67ea42a6_add_name_L000052_59 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_se3g2_67ea42a6_add_name_L000052_61
 cmps r17, r13 wcz
 if_b jmp #\C_se3g2_67ea42a6_add_name_L000052_58 ' LTI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #61 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r17, #0 ' reg <- coni
 jmp #\@C_se3g2_67ea42a6_add_name_L000052_65 ' JUMPV addrg
C_se3g2_67ea42a6_add_name_L000052_62
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, r17 ' ADDI/P
 adds r20, r19 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_se3g2_67ea42a6_add_name_L000052_63 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_se3g2_67ea42a6_add_name_L000052_65
 cmps r17, r11 wcz
 if_b jmp #\C_se3g2_67ea42a6_add_name_L000052_62 ' LTI4
 mov r22, r15 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r0, #0 ' reg <- coni
C_se3g2_67ea42a6_add_name_L000052_53
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export setenv

 alignl ' align long
C_setenv ' <symbol:setenv>
 calld PA,#NEWF
 sub SP, ##2060
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, ##-2056
 adds RI, FP
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r2, ##@C_setenv_71_L000072 ' reg ARG ADDRG
 mov r3, ##@C_setenv_69_L000070 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_setenv_67 ' EQU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, ##2048 ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, FP
 adds r5, ##(-2056)
' reg ARG ADDRL
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fread
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##-2056
 adds r22, FP
 ' reg <- addrl
 adds r22, r17 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_setenv_68 ' JUMPV addrg
C_setenv_67
 mov r2, ##@C_setenv_75_L000076 ' reg ARG ADDRG
 mov r3, ##@C_setenv_69_L000070 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_setenv_73  ' NEU4
 mov r22, #2 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
 mov r0, ##-1 ' RET con
 jmp #\@C_setenv_66 ' JUMPV addrg
C_setenv_73
C_setenv_68
 mov r2, FP
 adds r2, ##(-2064)
' reg ARG ADDRL
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 adds r4, ##(-2056)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se3g_67ea42a6_find_name_L000003
 add SP, #8 ' CALL addrg
 mov RI, ##-2060
 adds RI, FP
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, ##-2060
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_setenv_77 ' EQU4
 cmps r19,  #0 wz
 if_z jmp #\C_setenv_77 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 adds r3, ##(-2056)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se3g1_67ea42a6_delete_name_L000023
 add SP, #4 ' CALL addrg
 mov r13, #1 ' reg <- coni
C_setenv_77
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_setenv_79 ' EQU4
 cmps r19,  #0 wz
 if_z jmp #\C_setenv_79 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 adds r4, ##(-2056)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se3g2_67ea42a6_add_name_L000052
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_setenv_81 ' EQI4
 mov r22, #27 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##-1 ' RET con
 jmp #\@C_setenv_66 ' JUMPV addrg
C_setenv_81
 mov r13, #1 ' reg <- coni
C_setenv_79
 cmps r13,  #0 wz
 if_z jmp #\C_setenv_83 ' EQI4
 mov r2, ##@C_setenv_87_L000088 ' reg ARG ADDRG
 mov r3, ##@C_setenv_69_L000070 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_setenv_85 ' EQU4
 mov r2, FP
 adds r2, ##(-2056)
' reg ARG ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_setenv_90 ' JUMPV addrg
C_setenv_89
 sub r17, #1 ' SUBU4 coni
C_setenv_90
 cmp r17,  #0 wz
 if_z jmp #\C_setenv_92 ' EQU4
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 mov r20, ##-2056
 adds r20, FP
 ' reg <- addrl
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #10 wz
 if_z jmp #\C_setenv_89 ' EQI4
C_setenv_92
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, FP
 adds r5, ##(-2056)
' reg ARG ADDRL
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 cmp r17, r0 wz
 if_z jmp #\C_setenv_93 ' EQU4
 mov r22, #2 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
 mov r0, ##-1 ' RET con
 jmp #\@C_setenv_66 ' JUMPV addrg
C_setenv_93
C_setenv_85
C_setenv_83
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
 mov r0, #0 ' reg <- coni
C_setenv_66
 calld PA,#POPM ' restore registers
 add SP, ##2060 ' framesize
 calld PA,#RETF


' Catalina Export unsetenv

 alignl ' align long
C_unsetenv ' <symbol:unsetenv>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, ##0 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_setenv
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_unsetenv_95 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import errno

' Catalina Import strlen

' Catalina Import strncmp

' Catalina Import fwrite

' Catalina Import fread

' Catalina Import fopen

' Catalina Import fclose

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_setenv_87_L000088 ' <symbol:87>
 byte 119
 byte 0

 alignl ' align long
C_setenv_75_L000076 ' <symbol:75>
 byte 119
 byte 43
 byte 0

 alignl ' align long
C_setenv_71_L000072 ' <symbol:71>
 byte 114
 byte 43
 byte 0

 alignl ' align long
C_setenv_69_L000070 ' <symbol:69>
 byte 67
 byte 65
 byte 84
 byte 65
 byte 76
 byte 89
 byte 83
 byte 84
 byte 46
 byte 69
 byte 78
 byte 86
 byte 0

' Catalina Code

DAT ' code segment
' end
