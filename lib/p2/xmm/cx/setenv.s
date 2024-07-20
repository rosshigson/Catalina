' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sfr4_669506a8_find_name_L000003 ' <symbol:find_name>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sfr4_669506a8_find_name_L000003_6 ' JUMPV addrg
C_sfr4_669506a8_find_name_L000003_5
 mov RI, r19
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sfr4_669506a8_find_name_L000003_9 ' JUMPV addrg
C_sfr4_669506a8_find_name_L000003_8
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
C_sfr4_669506a8_find_name_L000003_9
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_sfr4_669506a8_find_name_L000003_12 ' EQI4
 cmps r22,  #61 wz
 jmp #BR_Z
 long @C_sfr4_669506a8_find_name_L000003_12 ' EQI4
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sfr4_669506a8_find_name_L000003_8 ' NEI4
C_sfr4_669506a8_find_name_L000003_12
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_sfr4_669506a8_find_name_L000003_18 ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sfr4_669506a8_find_name_L000003_18 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #61 wz
 jmp #BRNZ
 long @C_sfr4_669506a8_find_name_L000003_15 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
C_sfr4_669506a8_find_name_L000003_15
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sfr4_669506a8_find_name_L000003_4 ' JUMPV addrg
C_sfr4_669506a8_find_name_L000003_17
 adds r17, #1 ' ADDP4 coni
C_sfr4_669506a8_find_name_L000003_18
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_sfr4_669506a8_find_name_L000003_20 ' EQI4
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sfr4_669506a8_find_name_L000003_17 ' NEI4
C_sfr4_669506a8_find_name_L000003_20
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_sfr4_669506a8_find_name_L000003_21 ' NEI4
 adds r17, #1 ' ADDP4 coni
C_sfr4_669506a8_find_name_L000003_21
C_sfr4_669506a8_find_name_L000003_6
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sfr4_669506a8_find_name_L000003_5 ' NEI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sfr4_669506a8_find_name_L000003_4
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sfr41_669506a8_delete_name_L000023 ' <symbol:delete_name>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sfr41_669506a8_delete_name_L000023_26 ' JUMPV addrg
C_sfr41_669506a8_delete_name_L000023_25
 mov r19, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sfr41_669506a8_delete_name_L000023_29 ' JUMPV addrg
C_sfr41_669506a8_delete_name_L000023_28
 adds r19, #1 ' ADDP4 coni
C_sfr41_669506a8_delete_name_L000023_29
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_sfr41_669506a8_delete_name_L000023_32 ' EQI4
 cmps r22,  #61 wz
 jmp #BR_Z
 long @C_sfr41_669506a8_delete_name_L000023_32 ' EQI4
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_28 ' NEI4
C_sfr41_669506a8_delete_name_L000023_32
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_47 ' NEU4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_47 ' NEI4
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #61 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_34 ' NEI4
 adds r19, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_sfr41_669506a8_delete_name_L000023_38 ' JUMPV addrg
C_sfr41_669506a8_delete_name_L000023_37
 adds r19, #1 ' ADDP4 coni
C_sfr41_669506a8_delete_name_L000023_38
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sfr41_669506a8_delete_name_L000023_40 ' EQI4
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_37 ' NEI4
C_sfr41_669506a8_delete_name_L000023_40
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_44 ' NEI4
 adds r19, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_sfr41_669506a8_delete_name_L000023_44 ' JUMPV addrg
C_sfr41_669506a8_delete_name_L000023_43
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 adds r17, #1 ' ADDP4 coni
 adds r19, #1 ' ADDP4 coni
C_sfr41_669506a8_delete_name_L000023_44
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_43 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, r17
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sfr41_669506a8_delete_name_L000023_34 ' JUMPV addrg
C_sfr41_669506a8_delete_name_L000023_46
 adds r17, #1 ' ADDP4 coni
C_sfr41_669506a8_delete_name_L000023_47
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_sfr41_669506a8_delete_name_L000023_49 ' EQI4
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_46 ' NEI4
C_sfr41_669506a8_delete_name_L000023_49
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_50 ' NEI4
 adds r17, #1 ' ADDP4 coni
C_sfr41_669506a8_delete_name_L000023_50
C_sfr41_669506a8_delete_name_L000023_34
C_sfr41_669506a8_delete_name_L000023_26
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sfr41_669506a8_delete_name_L000023_25 ' NEI4
' C_sfr41_669506a8_delete_name_L000023_24 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sfr42_669506a8_add_name_L000052 ' <symbol:add_name>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' ADDI/P
 adds r22, r13 ' ADDI/P (3)
 adds r22, r11 ' ADDI/P (1)
 adds r22, #2 ' ADDI4 coni
 jmp #LODL
 long 2048
 mov r20, RI ' reg <- con
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_sfr42_669506a8_add_name_L000052_54 ' LEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sfr42_669506a8_add_name_L000052_53 ' JUMPV addrg
C_sfr42_669506a8_add_name_L000052_54
 cmps r15,  #0 wz,wc
 jmp #BRBE
 long @C_sfr42_669506a8_add_name_L000052_56 ' LEI4
 mov r22, r15
 subs r22, #1 ' SUBI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_sfr42_669506a8_add_name_L000052_56 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #10 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sfr42_669506a8_add_name_L000052_56
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sfr42_669506a8_add_name_L000052_61 ' JUMPV addrg
C_sfr42_669506a8_add_name_L000052_58
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, r17 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_sfr42_669506a8_add_name_L000052_59 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sfr42_669506a8_add_name_L000052_61
 cmps r17, r13 wz,wc
 jmp #BR_B
 long @C_sfr42_669506a8_add_name_L000052_58 ' LTI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #61 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sfr42_669506a8_add_name_L000052_65 ' JUMPV addrg
C_sfr42_669506a8_add_name_L000052_62
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, r17 ' ADDI/P
 adds r20, r19 ' ADDI/P (3)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_sfr42_669506a8_add_name_L000052_63 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sfr42_669506a8_add_name_L000052_65
 cmps r17, r11 wz,wc
 jmp #BR_B
 long @C_sfr42_669506a8_add_name_L000052_62 ' LTI4
 mov r22, r15 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r0, #0 ' reg <- coni
C_sfr42_669506a8_add_name_L000052_53
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export setenv

 alignl ' align long
C_setenv ' <symbol:setenv>
 jmp #NEWF
 jmp #LODL
 long 2060
 sub SP, RI
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -2056
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODL
 long @C_setenv_71_L000072
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_setenv_69_L000070
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_setenv_67 ' EQU4
 mov r2, r15 ' CVI, CVU or LOAD
 jmp #LODL
 long 2048
 mov r3, RI ' reg ARG con
 mov r4, #1 ' reg ARG coni
 jmp #LODF
 long -2056
 mov r5, RI ' reg ARG ADDRL
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_fread
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -2056
 mov r22, RI ' reg <- addrl
 adds r22, r17 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_setenv_68 ' JUMPV addrg
C_setenv_67
 jmp #LODL
 long @C_setenv_75_L000076
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_setenv_69_L000070
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_setenv_73 ' NEU4
 mov r22, #2 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_setenv_66 ' JUMPV addrg
C_setenv_73
C_setenv_68
 jmp #LODF
 long -2064
 mov r2, RI ' reg ARG ADDRL
 mov r3, r23 ' CVI, CVU or LOAD
 jmp #LODF
 long -2056
 mov r4, RI ' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sfr4_669506a8_find_name_L000003
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -2060
 wrlong r0, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -2060
 rdlong r22, RI ' reg <- INDIRP4 addrl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_setenv_77 ' EQU4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_setenv_77 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODF
 long -2056
 mov r3, RI ' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sfr41_669506a8_delete_name_L000023
 add SP, #4 ' CALL addrg
 mov r13, #1 ' reg <- coni
C_setenv_77
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_setenv_79 ' EQU4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_setenv_79 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 jmp #LODF
 long -2056
 mov r4, RI ' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sfr42_669506a8_add_name_L000052
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_setenv_81 ' EQI4
 mov r22, #27 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_setenv_66 ' JUMPV addrg
C_setenv_81
 mov r13, #1 ' reg <- coni
C_setenv_79
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C_setenv_83 ' EQI4
 jmp #LODL
 long @C_setenv_87_L000088
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_setenv_69_L000070
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_setenv_85 ' EQU4
 jmp #LODF
 long -2056
 mov r2, RI ' reg ARG ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_setenv_90 ' JUMPV addrg
C_setenv_89
 sub r17, #1 ' SUBU4 coni
C_setenv_90
 cmp r17,  #0 wz
 jmp #BR_Z
 long @C_setenv_92 ' EQU4
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 jmp #LODF
 long -2056
 mov r20, RI ' reg <- addrl
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz
 jmp #BR_Z
 long @C_setenv_89 ' EQI4
C_setenv_92
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 jmp #LODF
 long -2056
 mov r5, RI ' reg ARG ADDRL
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 cmp r17, r0 wz
 jmp #BR_Z
 long @C_setenv_93 ' EQU4
 mov r22, #2 ' reg <- coni
 jmp #LODL
 long @C_errno
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_setenv_66 ' JUMPV addrg
C_setenv_93
C_setenv_85
C_setenv_83
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fclose ' CALL addrg
 mov r0, #0 ' reg <- coni
C_setenv_66
 jmp #POPM ' restore registers
 jmp #LODL
 long 2060
 add SP, RI ' framesize
 jmp #RETF


' Catalina Export unsetenv

 alignl ' align long
C_unsetenv ' <symbol:unsetenv>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_setenv
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_unsetenv_95 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


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
