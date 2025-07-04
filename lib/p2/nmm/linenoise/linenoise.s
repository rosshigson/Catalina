' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export my_write

 alignl ' align long
C_my_write ' <symbol:my_write>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 jmp #\@C_my_write_7 ' JUMPV addrg
C_my_write_4
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
' C_my_write_5 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_my_write_7
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22, r19 wcz 
 if_b jmp #\C_my_write_4 ' LTU4
 mov r0, r17 ' CVI, CVU or LOAD
' C_my_write_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export my_read

 alignl ' align long
C_my_read ' <symbol:my_read>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 jmp #\@C_my_read_12 ' JUMPV addrg
C_my_read_9
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_k_wait ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_nz jmp #\C_my_read_13 ' NEI4
 mov r17, #4 ' reg <- coni
C_my_read_13
 mov r22, r15 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_my_read_10 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_my_read_12
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22, r19 wcz 
 if_b jmp #\C_my_read_9 ' LTU4
 mov r0, r15 ' CVI, CVU or LOAD
' C_my_read_8 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export strdup

 alignl ' align long
C_strdup ' <symbol:strdup>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22
 add r2, #1 ' ADDU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_strdup_16 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
C_strdup_16
 mov r0, r21 ' CVI, CVU or LOAD
' C_strdup_15 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export strcasecmp

 alignl ' align long
C_strcasecmp ' <symbol:strcasecmp>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_strcasecmp_20 ' JUMPV addrg
C_strcasecmp_19
 adds r23, #1 ' ADDP4 coni
 adds r21, #1 ' ADDP4 coni
C_strcasecmp_20
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C_strcasecmp_23 ' EQI4
 rdbyte r18, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r18, r20 wz
 if_z jmp #\C_strcasecmp_23 ' EQI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 rdbyte r2, r21 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 cmps r22, r0 wz
 if_z jmp #\C_strcasecmp_19 ' EQI4
C_strcasecmp_23
 rdbyte r2, r23 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 rdbyte r2, r21 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
' C_strcasecmp_18 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export snprintf

 alignl ' align long
C_snprintf ' <symbol:snprintf>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #16
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_vsprintf
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_snprintf_24 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export my_lndebug

 alignl ' align long
C_my_lndebug ' <symbol:my_lndebug>
 calld PA,#NEWF
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r0, #0 ' reg <- coni
' C_my_lndebug_26 ' (symbol refcount = 0)
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sg78_6864c5c0_unsupported_term_L000027 ' <symbol:unsupported_term>
 long @C_sg781_6864c5c0_28_L000029
 long @C_sg782_6864c5c0_30_L000031
 long @C_sg783_6864c5c0_32_L000033
 long $0

 alignl ' align long
C_sg784_6864c5c0_completionC_allback_L000034 ' <symbol:completionCallback>
 long $0

 alignl ' align long
C_sg785_6864c5c0_hintsC_allback_L000035 ' <symbol:hintsCallback>
 long $0

 alignl ' align long
C_sg786_6864c5c0_freeH_intsC_allback_L000036 ' <symbol:freeHintsCallback>
 long $0

 alignl ' align long
C_sg78a_6864c5c0_maskmode_L000040 ' <symbol:maskmode>
 long 0

 alignl ' align long
C_sg78b_6864c5c0_rawmode_L000041 ' <symbol:rawmode>
 long 0

 alignl ' align long
C_sg78c_6864c5c0_mlmode_L000042 ' <symbol:mlmode>
 long 0

 alignl ' align long
C_sg78d_6864c5c0_atexit_registered_L000043 ' <symbol:atexit_registered>
 long 0

 alignl ' align long
C_sg78e_6864c5c0_history_max_len_L000044 ' <symbol:history_max_len>
 long 100

 alignl ' align long
C_sg78f_6864c5c0_history_len_L000045 ' <symbol:history_len>
 long 0

 alignl ' align long
C_sg78g_6864c5c0_history_L000046 ' <symbol:history>
 long $0

' Catalina Export linenoiseMaskModeEnable

' Catalina Code

DAT ' code segment

 alignl ' align long
C_linenoiseM_askM_odeE_nable ' <symbol:linenoiseMaskModeEnable>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, #1 ' reg <- coni
 wrlong r22, ##@C_sg78a_6864c5c0_maskmode_L000040 ' ASGNI4 addrg reg
' C_linenoiseM_askM_odeE_nable_49 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export linenoiseMaskModeDisable

 alignl ' align long
C_linenoiseM_askM_odeD_isable ' <symbol:linenoiseMaskModeDisable>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_sg78a_6864c5c0_maskmode_L000040 ' ASGNI4 addrg reg
' C_linenoiseM_askM_odeD_isable_50 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export linenoiseSetMultiLine

 alignl ' align long
C_linenoiseS_etM_ultiL_ine ' <symbol:linenoiseSetMultiLine>
 wrlong r2, ##@C_sg78c_6864c5c0_mlmode_L000042 ' ASGNI4 addrg reg
' C_linenoiseS_etM_ultiL_ine_51 ' (symbol refcount = 0)
 calld PA,#RETN


 alignl ' align long
C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052 ' <symbol:isUnsupportedTerm>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r2, ##@C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_54_L000055 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getenv ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_56  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_53 ' JUMPV addrg
C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_56
 mov r23, #0 ' reg <- coni
 jmp #\@C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_61 ' JUMPV addrg
C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_58
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78_6864c5c0_unsupported_term_L000027 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcasecmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_62 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_53 ' JUMPV addrg
C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_62
' C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_59 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_61
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78_6864c5c0_unsupported_term_L000027 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_58  ' NEU4
 mov r0, #0 ' reg <- coni
C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_53
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sg78l_6864c5c0_getC_ursorP_osition_L000064 ' <symbol:getCursorPosition>
 calld PA,#NEWF
 sub SP, #40
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r2, #4 ' reg ARG coni
 mov r3, ##@C_sg78l_6864c5c0_getC_ursorP_osition_L000064_68_L000069 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_write
 add SP, #8 ' CALL addrg
 cmps r0,  #4 wz
 if_z jmp #\C_sg78l_6864c5c0_getC_ursorP_osition_L000064_71 ' EQI4
 mov r0, ##-1 ' RET con
 jmp #\@C_sg78l_6864c5c0_getC_ursorP_osition_L000064_65 ' JUMPV addrg
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_70
 mov r2, #1 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r3, r19 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_read
 add SP, #8 ' CALL addrg
 cmps r0,  #1 wz
 if_z jmp #\C_sg78l_6864c5c0_getC_ursorP_osition_L000064_73 ' EQI4
 jmp #\@C_sg78l_6864c5c0_getC_ursorP_osition_L000064_72 ' JUMPV addrg
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_73
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #82 wz
 if_nz jmp #\C_sg78l_6864c5c0_getC_ursorP_osition_L000064_75 ' NEI4
 jmp #\@C_sg78l_6864c5c0_getC_ursorP_osition_L000064_72 ' JUMPV addrg
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_75
 add r19, #1 ' ADDU4 coni
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_71
 cmp r19,  #31 wcz 
 if_b jmp #\C_sg78l_6864c5c0_getC_ursorP_osition_L000064_70 ' LTU4
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_72
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #27 wz
 if_nz jmp #\C_sg78l_6864c5c0_getC_ursorP_osition_L000064_80 ' NEI4
 mov r22, FP
 sub r22, #-(-35) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #91 wz
 if_z jmp #\C_sg78l_6864c5c0_getC_ursorP_osition_L000064_77 ' EQI4
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_80
 mov r0, ##-1 ' RET con
 jmp #\@C_sg78l_6864c5c0_getC_ursorP_osition_L000064_65 ' JUMPV addrg
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_77
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, ##@C_sg78l_6864c5c0_getC_ursorP_osition_L000064_84_L000085 ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-34) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sscanf
 add SP, #12 ' CALL addrg
 cmps r0,  #2 wz
 if_z jmp #\C_sg78l_6864c5c0_getC_ursorP_osition_L000064_81 ' EQI4
 mov r0, ##-1 ' RET con
 jmp #\@C_sg78l_6864c5c0_getC_ursorP_osition_L000064_65 ' JUMPV addrg
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_81
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_65
 calld PA,#POPM ' restore registers
 add SP, #40 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sg78o_6864c5c0_getC_olumns_L000086 ' <symbol:getColumns>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg78l_6864c5c0_getC_ursorP_osition_L000064
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_nz jmp #\C_sg78o_6864c5c0_getC_olumns_L000086_88 ' NEI4
 jmp #\@C_sg78o_6864c5c0_getC_olumns_L000086_90 ' JUMPV addrg
C_sg78o_6864c5c0_getC_olumns_L000086_88
 mov r2, #6 ' reg ARG coni
 mov r3, ##@C_sg78o_6864c5c0_getC_olumns_L000086_93_L000094 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_write
 add SP, #8 ' CALL addrg
 cmps r0,  #6 wz
 if_z jmp #\C_sg78o_6864c5c0_getC_olumns_L000086_91 ' EQI4
 jmp #\@C_sg78o_6864c5c0_getC_olumns_L000086_90 ' JUMPV addrg
C_sg78o_6864c5c0_getC_olumns_L000086_91
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg78l_6864c5c0_getC_ursorP_osition_L000064
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r19, r22 wz
 if_nz jmp #\C_sg78o_6864c5c0_getC_olumns_L000086_95 ' NEI4
 jmp #\@C_sg78o_6864c5c0_getC_olumns_L000086_90 ' JUMPV addrg
C_sg78o_6864c5c0_getC_olumns_L000086_95
 cmps r19, r17 wcz
 if_be jmp #\C_sg78o_6864c5c0_getC_olumns_L000086_97 ' LEI4
 mov r2, r19 ' SUBI/P
 subs r2, r17 ' SUBI/P (3)
 mov r3, ##@C_sg78o_6864c5c0_getC_olumns_L000086_99_L000100 ' reg ARG ADDRG
 mov r4, #32 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-36) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_write
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_sg78o_6864c5c0_getC_olumns_L000086_101 ' NEI4
C_sg78o_6864c5c0_getC_olumns_L000086_101
C_sg78o_6864c5c0_getC_olumns_L000086_97
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_sg78o_6864c5c0_getC_olumns_L000086_87 ' JUMPV addrg
C_sg78o_6864c5c0_getC_olumns_L000086_90
 mov r0, #80 ' reg <- coni
C_sg78o_6864c5c0_getC_olumns_L000086_87
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Export linenoiseClearScreen

 alignl ' align long
C_linenoiseC_learS_creen ' <symbol:linenoiseClearScreen>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, #7 ' reg ARG coni
 mov r3, ##@C_linenoiseC_learS_creen_106_L000107 ' reg ARG ADDRG
 mov r4, #1 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_write
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wcz
 if_a jmp #\C_linenoiseC_learS_creen_104 ' GTI4
C_linenoiseC_learS_creen_104
' C_linenoiseC_learS_creen_103 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sg78s_6864c5c0_linenoiseB_eep_L000108 ' <symbol:linenoiseBeep>
 calld PA,#NEWF
 mov r2, ##@C_sg78s_6864c5c0_linenoiseB_eep_L000108_110_L000111 ' reg ARG ADDRG
 mov r3, ##@C___stderr ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fprintf
 add SP, #4 ' CALL addrg
 mov r2, ##@C___stderr ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
' C_sg78s_6864c5c0_linenoiseB_eep_L000108_109 ' (symbol refcount = 0)
 calld PA,#RETF


 alignl ' align long
C_sg78u_6864c5c0_freeC_ompletions_L000112 ' <symbol:freeCompletions>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 jmp #\@C_sg78u_6864c5c0_freeC_ompletions_L000112_117 ' JUMPV addrg
C_sg78u_6864c5c0_freeC_ompletions_L000112_114
 mov r22, r21
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
' C_sg78u_6864c5c0_freeC_ompletions_L000112_115 ' (symbol refcount = 0)
 add r21, #1 ' ADDU4 coni
C_sg78u_6864c5c0_freeC_ompletions_L000112_117
 rdlong r22, r23 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_b jmp #\C_sg78u_6864c5c0_freeC_ompletions_L000112_114 ' LTU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sg78u_6864c5c0_freeC_ompletions_L000112_118 ' EQU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_sg78u_6864c5c0_freeC_ompletions_L000112_118
' C_sg78u_6864c5c0_freeC_ompletions_L000112_113 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_121_L000122 ' <symbol:121>
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038 ' <symbol:refreshLineWithCompletion>
 calld PA,#NEWF
 sub SP, #64
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, ##@C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_121_L000122 ' reg <- addrg
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_123  ' NEU4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r22, ##@C_sg784_6864c5c0_completionC_allback_L000034
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #4 ' CALL indirect
 mov r21, FP
 sub r21, #-(-12) ' reg <- addrli
C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_123
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 rdlong r20, r21 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_125 ' GEU4
 mov r0, FP
 sub r0, #-(-68) ' reg <- addrli
 mov r1, r23 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 56 ' ASGNB
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #2 ' LSHU4 coni
 mov r18, r21
 adds r18, #4 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_126 ' JUMPV addrg
C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_125
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039
 add SP, #4 ' CALL addrg
C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_126
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 cmp r22, r20 wz
 if_z jmp #\C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_130 ' EQU4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78u_6864c5c0_freeC_ompletions_L000112 ' CALL addrg
C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_130
' C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038_120 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #64 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sg7810_6864c5c0_completeL_ine_L000132_134_L000135 ' <symbol:134>
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sg7810_6864c5c0_completeL_ine_L000132 ' <symbol:completeLine>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, ##@C_sg7810_6864c5c0_completeL_ine_L000132_134_L000135 ' reg <- addrg
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r22, ##@C_sg784_6864c5c0_completionC_allback_L000034
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #4 ' CALL indirect
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_136  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sg78s_6864c5c0_linenoiseB_eep_L000108 ' CALL addrg
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 jmp #\@C_sg7810_6864c5c0_completeL_ine_L000132_137 ' JUMPV addrg
C_sg7810_6864c5c0_completeL_ine_L000132_136
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #9 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_141 ' EQI4
 cmps r19, r22 wcz
 if_b jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_138 ' LTI4
' C_sg7810_6864c5c0_completeL_ine_L000132_154 ' (symbol refcount = 0)
 cmps r19,  #27 wz
 if_z jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_146 ' EQI4
 jmp #\@C_sg7810_6864c5c0_completeL_ine_L000132_138 ' JUMPV addrg
C_sg7810_6864c5c0_completeL_ine_L000132_141
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_142 ' NEI4
 mov r22, #1 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sg7810_6864c5c0_completeL_ine_L000132_143 ' JUMPV addrg
C_sg7810_6864c5c0_completeL_ine_L000132_142
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r18, #1 ' ADDU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r18 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r1, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_144  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sg78s_6864c5c0_linenoiseB_eep_L000108 ' CALL addrg
C_sg7810_6864c5c0_completeL_ine_L000132_144
C_sg7810_6864c5c0_completeL_ine_L000132_143
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_sg7810_6864c5c0_completeL_ine_L000132_139 ' JUMPV addrg
C_sg7810_6864c5c0_completeL_ine_L000132_146
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_147 ' GEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_sg7810_6864c5c0_completeL_ine_L000132_147
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #\@C_sg7810_6864c5c0_completeL_ine_L000132_139 ' JUMPV addrg
C_sg7810_6864c5c0_completeL_ine_L000132_138
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_149 ' GEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C_sg7810_6864c5c0_completeL_ine_L000132_151_L000152 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
C_sg7810_6864c5c0_completeL_ine_L000132_149
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
C_sg7810_6864c5c0_completeL_ine_L000132_139
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_155 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sg7810_6864c5c0_completeL_ine_L000132_155 ' GEU4
 mov r2, #3 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038
 add SP, #8 ' CALL addrg
 jmp #\@C_sg7810_6864c5c0_completeL_ine_L000132_156 ' JUMPV addrg
C_sg7810_6864c5c0_completeL_ine_L000132_155
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_sg7810_6864c5c0_completeL_ine_L000132_156
C_sg7810_6864c5c0_completeL_ine_L000132_137
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78u_6864c5c0_freeC_ompletions_L000112 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r0, r22 ' reg <- CVUI4 INDIRU1 reg
' C_sg7810_6864c5c0_completeL_ine_L000132_133 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Export linenoiseSetCompletionCallback

 alignl ' align long
C_linenoiseS_etC_ompletionC_allback ' <symbol:linenoiseSetCompletionCallback>
 wrlong r2, ##@C_sg784_6864c5c0_completionC_allback_L000034 ' ASGNP4 addrg reg
' C_linenoiseS_etC_ompletionC_allback_157 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export linenoiseSetHintsCallback

 alignl ' align long
C_linenoiseS_etH_intsC_allback ' <symbol:linenoiseSetHintsCallback>
 wrlong r2, ##@C_sg785_6864c5c0_hintsC_allback_L000035 ' ASGNP4 addrg reg
' C_linenoiseS_etH_intsC_allback_158 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export linenoiseSetFreeHintsCallback

 alignl ' align long
C_linenoiseS_etF_reeH_intsC_allback ' <symbol:linenoiseSetFreeHintsCallback>
 wrlong r2, ##@C_sg786_6864c5c0_freeH_intsC_allback_L000036 ' ASGNP4 addrg reg
' C_linenoiseS_etF_reeH_intsC_allback_159 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export linenoiseAddCompletion

 alignl ' align long
C_linenoiseA_ddC_ompletion ' <symbol:linenoiseAddCompletion>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17
 add r2, #1 ' ADDU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseA_ddC_ompletion_161  ' NEU4
 jmp #\@C_linenoiseA_ddC_ompletion_160 ' JUMPV addrg
C_linenoiseA_ddC_ompletion_161
 mov r2, r17
 add r2, #1 ' ADDU4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_realloc
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseA_ddC_ompletion_163  ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 jmp #\@C_linenoiseA_ddC_ompletion_160 ' JUMPV addrg
C_linenoiseA_ddC_ompletion_163
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 rdlong r22, r23 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 wrlong r20, r23 ' ASGNU4 reg reg
 shl r22, #2 ' LSHU4 coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 wrlong r19, r22 ' ASGNP4 reg reg
C_linenoiseA_ddC_ompletion_160
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sg7813_6864c5c0_abI_nit_L000165 ' <symbol:abInit>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##0 ' reg <- con
 wrlong r22, r2 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_sg7813_6864c5c0_abI_nit_L000165_166 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sg7814_6864c5c0_abA_ppend_L000167 ' <symbol:abAppend>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r19 ' ADDI/P (1)
 mov r2, r22 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_realloc
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sg7814_6864c5c0_abA_ppend_L000167_169  ' NEU4
 jmp #\@C_sg7814_6864c5c0_abA_ppend_L000167_168 ' JUMPV addrg
C_sg7814_6864c5c0_abA_ppend_L000167_169
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r4, r22 ' ADDI/P
 adds r4, r17 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 wrlong r17, r23 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, r19 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
C_sg7814_6864c5c0_abA_ppend_L000167_168
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sg7815_6864c5c0_abF_ree_L000171 ' <symbol:abFree>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
' C_sg7815_6864c5c0_abF_ree_L000171_172 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export refreshShowHints

 alignl ' align long
C_refreshS_howH_ints ' <symbol:refreshShowHints>
 calld PA,#NEWF
 sub SP, #84
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##@C_sg785_6864c5c0_hintsC_allback_L000035
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_refreshS_howH_ints_174 ' EQU4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r20, r21
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_refreshS_howH_ints_174 ' GEU4
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov r22, ##@C_sg785_6864c5c0_hintsC_allback_L000035
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #8 ' CALL indirect
 mov RI, FP
 sub RI, #-(-80)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_refreshS_howH_ints_176 ' EQU4
 mov RI, FP
 sub RI, #-(-80)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r19 ' CVI, CVU or LOAD
 mov r18, r21
 adds r18, #40 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (1)
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-88) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_refreshS_howH_ints_178 ' LEI4
 mov r22, FP
 sub r22, #-(-88) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNI4 addrli reg
C_refreshS_howH_ints_178
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_refreshS_howH_ints_180 ' NEI4
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_refreshS_howH_ints_180 ' NEI4
 mov r22, #37 ' reg <- coni
 mov RI, FP
 sub RI, #-(-72)
 wrlong r22, RI ' ASGNI4 addrli reg
C_refreshS_howH_ints_180
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_refreshS_howH_ints_184 ' NEI4
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_refreshS_howH_ints_182 ' EQI4
C_refreshS_howH_ints_184
 mov RI, FP
 sub RI, #-(-72)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-76)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, ##@C_refreshS_howH_ints_185_L000186 ' reg ARG ADDRG
 mov r5, #64 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-68)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_snprintf
 add SP, #16 ' CALL addrg
 jmp #\@C_refreshS_howH_ints_183 ' JUMPV addrg
C_refreshS_howH_ints_182
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-68)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_refreshS_howH_ints_183
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-84)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-80)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_refreshS_howH_ints_189 ' NEI4
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_refreshS_howH_ints_187 ' EQI4
C_refreshS_howH_ints_189
 mov r2, #4 ' reg ARG coni
 mov r3, ##@C_refreshS_howH_ints_190_L000191 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_refreshS_howH_ints_187
 mov r22, ##@C_sg786_6864c5c0_freeH_intsC_allback_L000036
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_refreshS_howH_ints_192 ' EQU4
 mov RI, FP
 sub RI, #-(-80)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, ##@C_sg786_6864c5c0_freeH_intsC_allback_L000036
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 calld PA,#CALI ' CALL indirect
C_refreshS_howH_ints_192
C_refreshS_howH_ints_176
C_refreshS_howH_ints_174
' C_refreshS_howH_ints_173 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #84 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194 ' <symbol:refreshSingleLine>
 calld PA,#NEWF
 sub SP, #76
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRU4 reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRU4 reg
 jmp #\@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_197 ' JUMPV addrg
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_196
 adds r13, #1 ' ADDP4 coni
 sub r19, #1 ' SUBU4 coni
 sub r15, #1 ' SUBU4 coni
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_197
 mov r22, r17 ' ADDU
 add r22, r15 ' ADDU (3)
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_196 ' GEU4
 jmp #\@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_200 ' JUMPV addrg
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_199
 sub r19, #1 ' SUBU4 coni
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_200
 mov r22, r17 ' ADDU
 add r22, r19 ' ADDU (3)
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_a jmp #\C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_199 ' GTU4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg7813_6864c5c0_abI_nit_L000165 ' CALL addrg
 mov r2, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_202_L000203 ' reg ARG ADDRG
 mov r3, #64 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-76) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
 mov r22, r21
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_204 ' EQI4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
 mov r22, ##@C_sg78a_6864c5c0_maskmode_L000040
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #1 wz
 if_nz jmp #\C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_206 ' NEI4
 jmp #\@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_209 ' JUMPV addrg
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_208
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_211_L000212 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_209
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 sub r19, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_208  ' NEU4
 jmp #\@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_207 ' JUMPV addrg
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_206
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_207
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_refreshS_howH_ints
 add SP, #8 ' CALL addrg
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_204
 mov r2, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_213_L000214 ' reg ARG ADDRG
 mov r3, #64 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-76) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
 mov r22, r21
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_215 ' EQI4
 mov r22, r15 ' ADDU
 add r22, r17 ' ADDU (3)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_217_L000218 ' reg ARG ADDRG
 mov r4, #64 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-76) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-76) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_215
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-80)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_write
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_219 ' NEI4
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_219
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg7815_6864c5c0_abF_ree_L000171 ' CALL addrg
' C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_195 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #76 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222 ' <symbol:refreshMultiLine>
 calld PA,#NEWF
 sub SP, #88
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #40 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (1)
 add r20, r22 ' ADDU (1)
 sub r20, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #36 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (1)
 add r20, r22 ' ADDU (1)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-80)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-88)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg7813_6864c5c0_abI_nit_L000165 ' CALL addrg
 mov r22, r21
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_224 ' EQI4
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r17
 neg r22, r22 ' SUBI/P (2)
 cmps r22,  #0 wcz
 if_be jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_226 ' LEI4
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r17 ' SUBI/P
 subs r2, r22 ' SUBI/P (3)
 mov r3, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_228_L000229 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_lndebug
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-80) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r17 ' SUBI/P
 subs r2, r22 ' SUBI/P (3)
 mov r3, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_230_L000231 ' reg ARG ADDRG
 mov r4, #64 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-68) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_226
 mov r19, #0 ' reg <- coni
 jmp #\@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_235 ' JUMPV addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_232
 mov r2, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_236_L000237 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_my_lndebug ' CALL addrg
 mov r2, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_238_L000239 ' reg ARG ADDRG
 mov r3, #64 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
' C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_233 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_235
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 cmps r19, r22 wcz
 if_b jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_232 ' LTI4
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_224
 mov r22, r21
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_240 ' EQI4
 mov r2, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_242_L000243 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_my_lndebug ' CALL addrg
 mov r2, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_244_L000245 ' reg ARG ADDRG
 mov r3, #64 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_240
 mov r22, r21
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_246 ' EQI4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
 mov r22, ##@C_sg78a_6864c5c0_maskmode_L000040
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #1 wz
 if_nz jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_248 ' NEI4
 mov r11, #0 ' reg <- coni
 jmp #\@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_253 ' JUMPV addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_250
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_211_L000212 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
' C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_251 ' (symbol refcount = 0)
 add r11, #1 ' ADDU4 coni
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_253
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r11, r22 wcz 
 if_b jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_250 ' LTU4
 jmp #\@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_249 ' JUMPV addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_248
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_249
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_refreshS_howH_ints
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #0 ' reg <- coni
 cmp r22, r20 wz
 if_z jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_254 ' EQU4
 mov r18, r23
 adds r18, #40 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 cmp r22, r18 wz
 if_nz jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_254  ' NEU4
 mov r18, r15 ' CVI, CVU or LOAD
 add r22, r18 ' ADDU (1)
 mov r18, r23
 adds r18, #44 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r18 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r1, r20 wz
 if_nz jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_254  ' NEU4
 mov r2, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_256_L000257 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_my_lndebug ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_258_L000259 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
 mov r2, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_202_L000203 ' reg ARG ADDRG
 mov r3, #64 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
 adds r13, #1 ' ADDI4 coni
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r13, r22 wcz
 if_be jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_260 ' LEI4
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_260
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_254
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r15 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #32 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (1)
 add r20, r22 ' ADDU (1)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-84)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-84)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_262_L000263 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_lndebug
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r13
 neg r22, r22 ' SUBI/P (2)
 cmps r22,  #0 wcz
 if_be jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_264 ' LEI4
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r13 ' SUBI/P
 subs r2, r22 ' SUBI/P (3)
 mov r3, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_266_L000267 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_lndebug
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-84) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r13 ' SUBI/P
 subs r2, r22 ' SUBI/P (3)
 mov r3, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_268_L000269 ' reg ARG ADDRG
 mov r4, #64 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-68) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_264
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r15 ' ADDI/P (2)
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-92)
 wrlong r1, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_270_L000271 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_lndebug
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_272 ' EQI4
 mov RI, FP
 sub RI, #-(-92)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_217_L000218 ' reg ARG ADDRG
 mov r4, #64 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-68) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #12 ' CALL addrg
 jmp #\@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_273 ' JUMPV addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_272
 mov r2, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_202_L000203 ' reg ARG ADDRG
 mov r3, #64 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_snprintf
 add SP, #8 ' CALL addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_273
 mov r2, FP
 sub r2, #-(-68) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-76) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7814_6864c5c0_abA_ppend_L000167
 add SP, #8 ' CALL addrg
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_246
 mov r2, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_258_L000259 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_my_lndebug ' CALL addrg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-76)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-88)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_write
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_274 ' NEI4
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_274
 mov r2, FP
 sub r2, #-(-76) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg7815_6864c5c0_abF_ree_L000171 ' CALL addrg
' C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_223 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #88 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039 ' <symbol:refreshLineWithFlags>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_sg78c_6864c5c0_mlmode_L000042
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_z jmp #\C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039_278 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222
 add SP, #4 ' CALL addrg
 jmp #\@C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039_279 ' JUMPV addrg
C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039_278
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194
 add SP, #4 ' CALL addrg
C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039_279
' C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039_277 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sg78i_6864c5c0_refreshL_ine_L000048 ' <symbol:refreshLine>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039
 add SP, #4 ' CALL addrg
' C_sg78i_6864c5c0_refreshL_ine_L000048_280 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseHide

 alignl ' align long
C_linenoiseH_ide ' <symbol:linenoiseHide>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sg78c_6864c5c0_mlmode_L000042
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_z jmp #\C_linenoiseH_ide_282 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222
 add SP, #4 ' CALL addrg
 jmp #\@C_linenoiseH_ide_283 ' JUMPV addrg
C_linenoiseH_ide_282
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194
 add SP, #4 ' CALL addrg
C_linenoiseH_ide_283
' C_linenoiseH_ide_281 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseShow

 alignl ' align long
C_linenoiseS_how ' <symbol:linenoiseShow>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_linenoiseS_how_285 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, ##0 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg788_6864c5c0_refreshL_ineW_ithC_ompletion_L000038
 add SP, #8 ' CALL addrg
 jmp #\@C_linenoiseS_how_286 ' JUMPV addrg
C_linenoiseS_how_285
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg789_6864c5c0_refreshL_ineW_ithF_lags_L000039
 add SP, #4 ' CALL addrg
C_linenoiseS_how_286
' C_linenoiseS_how_284 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseEditInsert

 alignl ' align long
C_linenoiseE_ditI_nsert ' <symbol:linenoiseEditInsert>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_linenoiseE_ditI_nsert_288 ' GEU4
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_linenoiseE_ditI_nsert_290  ' NEU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 wrbyte r21, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##@C_sg78c_6864c5c0_mlmode_L000042
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C_linenoiseE_ditI_nsert_292 ' NEI4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r20, r23
 adds r20, #44 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_linenoiseE_ditI_nsert_292 ' GEU4
 mov r22, ##@C_sg785_6864c5c0_hintsC_allback_L000035
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseE_ditI_nsert_292  ' NEU4
 mov r22, ##@C_sg78a_6864c5c0_maskmode_L000040
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #1 wz
 if_nz jmp #\C_linenoiseE_ditI_nsert_295 ' NEI4
 mov r19, #42 ' reg <- coni
 jmp #\@C_linenoiseE_ditI_nsert_296 ' JUMPV addrg
C_linenoiseE_ditI_nsert_295
 mov r19, r21 ' CVUI
 and r19, cviu_m1 ' zero extend
C_linenoiseE_ditI_nsert_296
 mov r22, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_write
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_linenoiseE_ditI_nsert_291 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_linenoiseE_ditI_nsert_287 ' JUMPV addrg
C_linenoiseE_ditI_nsert_292
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
 jmp #\@C_linenoiseE_ditI_nsert_291 ' JUMPV addrg
C_linenoiseE_ditI_nsert_290
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r2, r20 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memmove
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 wrbyte r21, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_linenoiseE_ditI_nsert_291
C_linenoiseE_ditI_nsert_288
 mov r0, #0 ' reg <- coni
C_linenoiseE_ditI_nsert_287
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export linenoiseEditMoveLeft

 alignl ' align long
C_linenoiseE_ditM_oveL_eft ' <symbol:linenoiseEditMoveLeft>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseE_ditM_oveL_eft_300 ' EQU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_linenoiseE_ditM_oveL_eft_300
' C_linenoiseE_ditM_oveL_eft_299 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseEditMoveRight

 alignl ' align long
C_linenoiseE_ditM_oveR_ight ' <symbol:linenoiseEditMoveRight>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_linenoiseE_ditM_oveR_ight_303 ' EQU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_linenoiseE_ditM_oveR_ight_303
' C_linenoiseE_ditM_oveR_ight_302 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseEditMoveHome

 alignl ' align long
C_linenoiseE_ditM_oveH_ome ' <symbol:linenoiseEditMoveHome>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseE_ditM_oveH_ome_306 ' EQU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_linenoiseE_ditM_oveH_ome_306
' C_linenoiseE_ditM_oveH_ome_305 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseEditMoveEnd

 alignl ' align long
C_linenoiseE_ditM_oveE_nd ' <symbol:linenoiseEditMoveEnd>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_linenoiseE_ditM_oveE_nd_309 ' EQU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_linenoiseE_ditM_oveE_nd_309
' C_linenoiseE_ditM_oveE_nd_308 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseEditHistoryNext

 alignl ' align long
C_linenoiseE_ditH_istoryN_ext ' <symbol:linenoiseEditHistoryNext>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #1 wcz
 if_be jmp #\C_linenoiseE_ditH_istoryN_ext_312 ' LEI4
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 subs r22, #1 ' SUBI4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r22, r20 ' SUBI/P (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strdup ' CALL addrg
 mov r20, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 subs r20, #1 ' SUBI4 coni
 mov r18, r23
 adds r18, #52 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 subs r20, r18 ' SUBI/P (1)
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 adds r20, r18 ' ADDI/P (1)
 wrlong r0, r20 ' ASGNP4 reg reg
 cmps r21,  #1 wz
 if_nz jmp #\C_linenoiseE_ditH_istoryN_ext_315 ' NEI4
 mov r19, #1 ' reg <- coni
 jmp #\@C_linenoiseE_ditH_istoryN_ext_316 ' JUMPV addrg
C_linenoiseE_ditH_istoryN_ext_315
 mov r19, ##-1 ' reg <- con
C_linenoiseE_ditH_istoryN_ext_316
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, r19 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_linenoiseE_ditH_istoryN_ext_317 ' GEI4
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_linenoiseE_ditH_istoryN_ext_311 ' JUMPV addrg
C_linenoiseE_ditH_istoryN_ext_317
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r22, r20 wcz
 if_b jmp #\C_linenoiseE_ditH_istoryN_ext_319 ' LTI4
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_linenoiseE_ditH_istoryN_ext_311 ' JUMPV addrg
C_linenoiseE_ditH_istoryN_ext_319
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRU4 reg
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 subs r22, #1 ' SUBI4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r22, r20 ' SUBI/P (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_linenoiseE_ditH_istoryN_ext_312
C_linenoiseE_ditH_istoryN_ext_311
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseEditDelete

 alignl ' align long
C_linenoiseE_ditD_elete ' <symbol:linenoiseEditDelete>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseE_ditD_elete_322 ' EQU4
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wcz 
 if_ae jmp #\C_linenoiseE_ditD_elete_322 ' GEU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, r22 ' SUBU (1)
 mov r2, r20
 sub r2, #1 ' SUBU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memmove
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_linenoiseE_ditD_elete_322
' C_linenoiseE_ditD_elete_321 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseEditBackspace

 alignl ' align long
C_linenoiseE_ditB_ackspace ' <symbol:linenoiseEditBackspace>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_z jmp #\C_linenoiseE_ditB_ackspace_325 ' EQU4
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_z jmp #\C_linenoiseE_ditB_ackspace_325 ' EQU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r2, r20 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memmove
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
C_linenoiseE_ditB_ackspace_325
' C_linenoiseE_ditB_ackspace_324 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseEditDeletePrevWord

 alignl ' align long
C_linenoiseE_ditD_eleteP_revW_ord ' <symbol:linenoiseEditDeletePrevWord>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRU4 reg
 jmp #\@C_linenoiseE_ditD_eleteP_revW_ord_329 ' JUMPV addrg
C_linenoiseE_ditD_eleteP_revW_ord_328
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_linenoiseE_ditD_eleteP_revW_ord_329
 mov r22, #32 ' reg <- coni
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 if_z jmp #\C_linenoiseE_ditD_eleteP_revW_ord_331 ' EQU4
 sub r20, #1 ' SUBU4 coni
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_z jmp #\C_linenoiseE_ditD_eleteP_revW_ord_328 ' EQI4
C_linenoiseE_ditD_eleteP_revW_ord_331
 jmp #\@C_linenoiseE_ditD_eleteP_revW_ord_333 ' JUMPV addrg
C_linenoiseE_ditD_eleteP_revW_ord_332
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_linenoiseE_ditD_eleteP_revW_ord_333
 mov r22, #32 ' reg <- coni
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20,  #0 wz
 if_z jmp #\C_linenoiseE_ditD_eleteP_revW_ord_335 ' EQU4
 sub r20, #1 ' SUBU4 coni
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_linenoiseE_ditD_eleteP_revW_ord_332 ' NEI4
C_linenoiseE_ditD_eleteP_revW_ord_335
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov RI, r21
 sub RI, r20
 mov r20, RI ' SUBU (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, r21 ' SUBU (1)
 mov r2, r20
 add r2, #1 ' ADDU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r3, r21 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memmove
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
' C_linenoiseE_ditD_eleteP_revW_ord_327 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export linenoiseEditStart

 alignl ' align long
C_linenoiseE_ditS_tart ' <symbol:linenoiseEditStart>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_linenoiseE_ditS_tart_338 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_linenoiseE_ditS_tart_339 ' JUMPV addrg
C_linenoiseE_ditS_tart_338
 mov r15, #0 ' reg <- coni
C_linenoiseE_ditS_tart_339
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 wrlong r15, r22 ' ASGNI4 reg reg
 mov r22, ##-1 ' reg <- con
 cmps r23, r22 wz
 if_z jmp #\C_linenoiseE_ditS_tart_341 ' EQI4
 mov r13, r23 ' CVI, CVU or LOAD
 jmp #\@C_linenoiseE_ditS_tart_342 ' JUMPV addrg
C_linenoiseE_ditS_tart_341
 mov r13, #1 ' reg <- coni
C_linenoiseE_ditS_tart_342
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 wrlong r13, r22 ' ASGNI4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #32 ' ADDP4 coni
 wrlong r20, r18 ' ASGNU4 reg reg
 adds r22, #36 ' ADDP4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #40 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #12
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg78o_6864c5c0_getC_olumns_L000086
 add SP, #4 ' CALL addrg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #48 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, ##@C_linenoiseE_ditS_tart_343_L000344 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseH_istoryA_dd ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #28 ' ADDP4 coni
 rdlong r2, r20 ' reg <- INDIRU4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_write
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_linenoiseE_ditS_tart_345 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_linenoiseE_ditS_tart_336 ' JUMPV addrg
C_linenoiseE_ditS_tart_345
 mov r0, #0 ' reg <- coni
C_linenoiseE_ditS_tart_336
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

' Catalina Export linenoiseEditMore

 alignl ' align long
C_linenoiseE_ditM_ore ' <symbol:linenoiseEditMore>
 long @C_sg781r_6864c5c0_347_L000348

' Catalina Export linenoiseEditFeed

' Catalina Code

DAT ' code segment

 alignl ' align long
C_linenoiseE_ditF_eed ' <symbol:linenoiseEditFeed>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_read
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_a jmp #\C_linenoiseE_ditF_eed_350 ' GTI4
 mov r0, ##0 ' RET con
 jmp #\@C_linenoiseE_ditF_eed_349 ' JUMPV addrg
C_linenoiseE_ditF_eed_350
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_354 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #9 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_352 ' NEI4
C_linenoiseE_ditF_eed_354
 mov r22, ##@C_sg784_6864c5c0_completionC_allback_L000034
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseE_ditF_eed_352 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sg7810_6864c5c0_completeL_ine_L000132
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_linenoiseE_ditF_eed_355 ' GEI4
 mov r0, ##0 ' RET con
 jmp #\@C_linenoiseE_ditF_eed_349 ' JUMPV addrg
C_linenoiseE_ditF_eed_355
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_357 ' NEI4
 mov r0, ##@C_linenoiseE_ditM_ore
 rdlong r0, r0 ' reg <- INDIRP4 addrg
 jmp #\@C_linenoiseE_ditF_eed_349 ' JUMPV addrg
C_linenoiseE_ditF_eed_357
C_linenoiseE_ditF_eed_352
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r21, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r21,  #1 wcz
 if_b jmp #\C_linenoiseE_ditF_eed_359 ' LTI4
 cmps r21,  #27 wcz
 if_a jmp #\C_linenoiseE_ditF_eed_436 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_linenoiseE_ditF_eed_437_L000439-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_linenoiseE_ditF_eed_437_L000439 ' <symbol:437>
 long @C_linenoiseE_ditF_eed_432
 long @C_linenoiseE_ditF_eed_377
 long @C_linenoiseE_ditF_eed_367
 long @C_linenoiseE_ditF_eed_369
 long @C_linenoiseE_ditF_eed_433
 long @C_linenoiseE_ditF_eed_378
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_368
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_362
 long @C_linenoiseE_ditF_eed_431
 long @C_linenoiseE_ditF_eed_434
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_380
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_379
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_372
 long @C_linenoiseE_ditF_eed_430
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_435
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_359
 long @C_linenoiseE_ditF_eed_381

' Catalina Code

DAT ' code segment
C_linenoiseE_ditF_eed_436
 cmps r21,  #127 wz
 if_z jmp #\C_linenoiseE_ditF_eed_368 ' EQI4
 jmp #\@C_linenoiseE_ditF_eed_359 ' JUMPV addrg
C_linenoiseE_ditF_eed_362
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045 ' reg <- addrg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, ##@C_sg78f_6864c5c0_history_len_L000045 ' ASGNI4 addrg reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r22, ##@C_sg78c_6864c5c0_mlmode_L000042
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_z jmp #\C_linenoiseE_ditF_eed_363 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveE_nd ' CALL addrg
C_linenoiseE_ditF_eed_363
 mov r22, ##@C_sg785_6864c5c0_hintsC_allback_L000035
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseE_ditF_eed_365 ' EQU4
 mov r22, ##@C_sg785_6864c5c0_hintsC_allback_L000035
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##0 ' reg <- con
 wrlong r22, ##@C_sg785_6864c5c0_hintsC_allback_L000035 ' ASGNP4 addrg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, ##@C_sg785_6864c5c0_hintsC_allback_L000035 ' ASGNP4 addrg reg
C_linenoiseE_ditF_eed_365
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strdup ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_linenoiseE_ditF_eed_349 ' JUMPV addrg
C_linenoiseE_ditF_eed_367
 mov r22, #11 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##0 ' RET con
 jmp #\@C_linenoiseE_ditF_eed_349 ' JUMPV addrg
C_linenoiseE_ditF_eed_368
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditB_ackspace ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_369
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseE_ditF_eed_370 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditD_elete ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_370
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045 ' reg <- addrg
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, ##@C_sg78f_6864c5c0_history_len_L000045 ' ASGNI4 addrg reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r22, #2 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##0 ' RET con
 jmp #\@C_linenoiseE_ditF_eed_349 ' JUMPV addrg
C_linenoiseE_ditF_eed_372
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseE_ditF_eed_360 ' EQU4
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_linenoiseE_ditF_eed_360 ' GEU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r22
 sub r18, #1 ' SUBU4 coni
 adds r18, r20 ' ADDI/P (1)
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r18 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, #1 ' SUBU4 coni
 cmp r22, r20 wz
 if_z jmp #\C_linenoiseE_ditF_eed_375 ' EQU4
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_linenoiseE_ditF_eed_375
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_377
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveL_eft ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_378
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveR_ight ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_379
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_linenoiseE_ditH_istoryN_ext
 add SP, #4 ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_380
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_linenoiseE_ditH_istoryN_ext
 add SP, #4 ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_381
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_read
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_382 ' NEI4
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_382
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-15) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_read
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_384 ' NEI4
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_384
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #91 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_387 ' NEI4
 mov r22, FP
 sub r22, #-(-15) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wcz
 if_b jmp #\C_linenoiseE_ditF_eed_389 ' LTI4
 mov r22, FP
 sub r22, #-(-15) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #57 wcz
 if_a jmp #\C_linenoiseE_ditF_eed_389 ' GTI4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-14) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_read
 add SP, #8 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_393 ' NEI4
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_393
 mov r22, FP
 sub r22, #-(-14) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #126 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_360 ' NEI4
 mov r22, FP
 sub r22, #-(-15) ' reg <- addrli
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19,  #49 wz
 if_z jmp #\C_linenoiseE_ditF_eed_404 ' EQI4
 cmps r19,  #51 wz
 if_z jmp #\C_linenoiseE_ditF_eed_403 ' EQI4
 cmps r19,  #52 wz
 if_z jmp #\C_linenoiseE_ditF_eed_405 ' EQI4
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_403
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditD_elete ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_404
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveH_ome ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_405
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveE_nd ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_389
 mov r22, FP
 sub r22, #-(-15) ' reg <- addrli
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19,  #65 wcz
 if_b jmp #\C_linenoiseE_ditF_eed_360 ' LTI4
 cmps r19,  #72 wcz
 if_a jmp #\C_linenoiseE_ditF_eed_360 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_linenoiseE_ditF_eed_416_L000418-260 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_linenoiseE_ditF_eed_416_L000418 ' <symbol:416>
 long @C_linenoiseE_ditF_eed_410
 long @C_linenoiseE_ditF_eed_411
 long @C_linenoiseE_ditF_eed_412
 long @C_linenoiseE_ditF_eed_413
 long @C_linenoiseE_ditF_eed_360
 long @C_linenoiseE_ditF_eed_415
 long @C_linenoiseE_ditF_eed_360
 long @C_linenoiseE_ditF_eed_414

' Catalina Code

DAT ' code segment
C_linenoiseE_ditF_eed_410
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_linenoiseE_ditH_istoryN_ext
 add SP, #4 ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_411
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_linenoiseE_ditH_istoryN_ext
 add SP, #4 ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_412
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveR_ight ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_413
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveL_eft ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_414
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveH_ome ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_415
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveE_nd ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_387
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #79 wz
 if_nz jmp #\C_linenoiseE_ditF_eed_360 ' NEI4
 mov r22, FP
 sub r22, #-(-15) ' reg <- addrli
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19,  #70 wz
 if_z jmp #\C_linenoiseE_ditF_eed_427 ' EQI4
 cmps r19,  #72 wz
 if_z jmp #\C_linenoiseE_ditF_eed_426 ' EQI4
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_426
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveH_ome ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_427
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveE_nd ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_359
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_linenoiseE_ditI_nsert
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_linenoiseE_ditF_eed_360 ' EQI4
 mov r0, ##0 ' RET con
 jmp #\@C_linenoiseE_ditF_eed_349 ' JUMPV addrg
C_linenoiseE_ditF_eed_430
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 wrlong r22, r20 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_431
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #40 ' ADDP4 coni
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_432
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveH_ome ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_433
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditM_oveE_nd ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_434
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_linenoiseC_learS_creen ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sg78i_6864c5c0_refreshL_ine_L000048 ' CALL addrg
 jmp #\@C_linenoiseE_ditF_eed_360 ' JUMPV addrg
C_linenoiseE_ditF_eed_435
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditD_eleteP_revW_ord ' CALL addrg
C_linenoiseE_ditF_eed_360
 mov r0, ##@C_linenoiseE_ditM_ore
 rdlong r0, r0 ' reg <- INDIRP4 addrg
C_linenoiseE_ditF_eed_349
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Export linenoiseEditStop

 alignl ' align long
C_linenoiseE_ditS_top ' <symbol:linenoiseEditStop>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_258_L000259 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_printf ' CALL addrg
' C_linenoiseE_ditS_top_441 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442 ' <symbol:linenoiseBlockingEdit>
 calld PA,#NEWF
 sub SP, #56
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 if_nz jmp #\C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442_444  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##0 ' RET con
 jmp #\@C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442_443 ' JUMPV addrg
C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442_444
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov RI, FP
 sub RI, #-(-60)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_linenoiseE_ditS_tart
 add SP, #20 ' CALL addrg
C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442_446
' C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442_447 ' (symbol refcount = 0)
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditF_eed ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_linenoiseE_ditM_ore
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 if_z jmp #\C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442_446 ' EQU4
 mov r2, FP
 sub r2, #-(-60) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseE_ditS_top ' CALL addrg
 mov r0, r15 ' CVI, CVU or LOAD
C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442_443
 calld PA,#POPM ' restore registers
 add SP, #56 ' framesize
 calld PA,#RETF


' Catalina Export linenoisePrintKeyCodes

 alignl ' align long
C_linenoiseP_rintK_eyC_odes ' <symbol:linenoisePrintKeyCodes>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r2, ##@C_linenoiseP_rintK_eyC_odes_450_L000451 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_printf ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 jmp #\@C_linenoiseP_rintK_eyC_odes_453 ' JUMPV addrg
C_linenoiseP_rintK_eyC_odes_452
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, #0 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_my_read
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r23,  #0 wcz
 if_a jmp #\C_linenoiseP_rintK_eyC_odes_455 ' GTI4
 jmp #\@C_linenoiseP_rintK_eyC_odes_453 ' JUMPV addrg
C_linenoiseP_rintK_eyC_odes_455
 mov r2, #3 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-7) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memmove
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-5)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, ##@C_linenoiseP_rintK_eyC_odes_461_L000462 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_linenoiseP_rintK_eyC_odes_459 ' NEI4
 jmp #\@C_linenoiseP_rintK_eyC_odes_454 ' JUMPV addrg
C_linenoiseP_rintK_eyC_odes_459
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 subs r22, #32 ' SUBI4 coni
 cmp r22,  #95 wcz 
 if_ae jmp #\C_linenoiseP_rintK_eyC_odes_466 ' GEU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r21, r22 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_linenoiseP_rintK_eyC_odes_467 ' JUMPV addrg
C_linenoiseP_rintK_eyC_odes_466
 mov r21, #63 ' reg <- coni
C_linenoiseP_rintK_eyC_odes_467
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, ##@C_linenoiseP_rintK_eyC_odes_463_L000464 ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_printf
 add SP, #12 ' CALL addrg
 mov r2, ##@C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_202_L000203 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_printf ' CALL addrg
 mov r2, ##@C___stdout ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
C_linenoiseP_rintK_eyC_odes_453
 jmp #\@C_linenoiseP_rintK_eyC_odes_452 ' JUMPV addrg
C_linenoiseP_rintK_eyC_odes_454
' C_linenoiseP_rintK_eyC_odes_449 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037 ' <symbol:linenoiseNoTTY>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, ##0 ' reg <- con
 mov r21, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 jmp #\@C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_470 ' JUMPV addrg
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_469
 cmp r21, r19 wz
 if_nz jmp #\C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_472  ' NEU4
 cmp r19,  #0 wz
 if_nz jmp #\C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_474  ' NEU4
 mov r19, #16 ' reg <- coni
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_474
 shl r19, #1 ' LSHU4 coni
 mov r17, r23 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_realloc
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_476  ' NEU4
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_478 ' EQU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_478
 mov r0, ##0 ' RET con
 jmp #\@C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_468 ' JUMPV addrg
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_476
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_472
 mov r2, ##@C___stdin ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fgetc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_z jmp #\C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_482 ' EQI4
 cmps r17,  #10 wz
 if_nz jmp #\C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_480 ' NEI4
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_482
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_nz jmp #\C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_483 ' NEI4
 cmp r21,  #0 wz
 if_nz jmp #\C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_483  ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r0, ##0 ' RET con
 jmp #\@C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_468 ' JUMPV addrg
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_483
 mov r22, r21 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_468 ' JUMPV addrg
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_480
 mov r22, r21 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 add r21, #1 ' ADDU4 coni
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_470
 jmp #\@C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_469 ' JUMPV addrg
 mov r0, ##0 ' RET con
C_sg787_6864c5c0_linenoiseN_oT_T_Y__L000037_468
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoise

 alignl ' align long
C_linenoise ' <symbol:linenoise>
 calld PA,#NEWF
 sub SP, ##1028
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##1024 ' reg ARG con
 mov r4, FP
 adds r4, ##(-1028)
' reg ARG ADDRL
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 wrlong RI, --PTRA ' stack ARG coni
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sg7820_6864c5c0_linenoiseB_lockingE_dit_L000442
 add SP, #16 ' CALL addrg
 mov RI, ##-1032
 adds RI, FP
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, ##-1032
 adds r22, FP
 ' reg <- addrl
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_linenoise_485 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##1028 ' framesize
 calld PA,#RETF


' Catalina Export linenoiseFree

 alignl ' align long
C_linenoiseF_ree ' <symbol:linenoiseFree>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_linenoiseE_ditM_ore
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_linenoiseF_ree_487  ' NEU4
 jmp #\@C_linenoiseF_ree_486 ' JUMPV addrg
C_linenoiseF_ree_487
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_linenoiseF_ree_486
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sg7824_6864c5c0_freeH_istory_L000489 ' <symbol:freeHistory>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_sg7824_6864c5c0_freeH_istory_L000489_491 ' EQU4
 mov r23, #0 ' reg <- coni
 jmp #\@C_sg7824_6864c5c0_freeH_istory_L000489_496 ' JUMPV addrg
C_sg7824_6864c5c0_freeH_istory_L000489_493
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
' C_sg7824_6864c5c0_freeH_istory_L000489_494 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_sg7824_6864c5c0_freeH_istory_L000489_496
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r23, r22 wcz
 if_b jmp #\C_sg7824_6864c5c0_freeH_istory_L000489_493 ' LTI4
 mov r2, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_sg7824_6864c5c0_freeH_istory_L000489_491
' C_sg7824_6864c5c0_freeH_istory_L000489_490 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sg78h_6864c5c0_linenoiseA_tE_xit_L000047 ' <symbol:linenoiseAtExit>
 calld PA,#NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sg7824_6864c5c0_freeH_istory_L000489 ' CALL addrg
' C_sg78h_6864c5c0_linenoiseA_tE_xit_L000047_497 ' (symbol refcount = 0)
 calld PA,#RETF


' Catalina Export linenoiseHistoryAdd

 alignl ' align long
C_linenoiseH_istoryA_dd ' <symbol:linenoiseHistoryAdd>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sg78e_6864c5c0_history_max_len_L000044
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryA_dd_499 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_linenoiseH_istoryA_dd_498 ' JUMPV addrg
C_linenoiseH_istoryA_dd_499
 mov r22, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryA_dd_501  ' NEU4
 mov r22, ##@C_sg78e_6864c5c0_history_max_len_L000044
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 wrlong r0, ##@C_sg78g_6864c5c0_history_L000046 ' ASGNP4 addrg reg
 mov r22, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryA_dd_503  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_linenoiseH_istoryA_dd_498 ' JUMPV addrg
C_linenoiseH_istoryA_dd_503
 mov r22, ##@C_sg78e_6864c5c0_history_max_len_L000044
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r3, #0 ' reg ARG coni
 mov r4, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
C_linenoiseH_istoryA_dd_501
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_z jmp #\C_linenoiseH_istoryA_dd_505 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 shl r22, #2 ' LSHI4 coni
 subs r22, #4 ' SUBI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryA_dd_505 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_linenoiseH_istoryA_dd_498 ' JUMPV addrg
C_linenoiseH_istoryA_dd_505
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strdup ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryA_dd_507  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_linenoiseH_istoryA_dd_498 ' JUMPV addrg
C_linenoiseH_istoryA_dd_507
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##@C_sg78e_6864c5c0_history_max_len_L000044
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r22, r20 wz
 if_nz jmp #\C_linenoiseH_istoryA_dd_509 ' NEI4
 mov r22, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r22, ##@C_sg78e_6864c5c0_history_max_len_L000044
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 subs r22, #1 ' SUBI4 coni
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r3, r22
 adds r3, #4 ' ADDP4 coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memmove
 add SP, #8 ' CALL addrg
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, ##@C_sg78f_6864c5c0_history_len_L000045 ' ASGNI4 addrg reg
C_linenoiseH_istoryA_dd_509
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045 ' reg <- addrg
 mov r20, #1 ' reg <- coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 wrlong r22, ##@C_sg78f_6864c5c0_history_len_L000045 ' ASGNI4 addrg reg
 mov r0, r20 ' CVI, CVU or LOAD
C_linenoiseH_istoryA_dd_498
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseHistorySetMaxLen

 alignl ' align long
C_linenoiseH_istoryS_etM_axL_en ' <symbol:linenoiseHistorySetMaxLen>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 cmps r23,  #1 wcz
 if_ae jmp #\C_linenoiseH_istoryS_etM_axL_en_512 ' GEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_linenoiseH_istoryS_etM_axL_en_511 ' JUMPV addrg
C_linenoiseH_istoryS_etM_axL_en_512
 mov r22, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseH_istoryS_etM_axL_en_514 ' EQU4
 mov r21, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r21, r21 ' reg <- INDIRI4 addrg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryS_etM_axL_en_516  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_linenoiseH_istoryS_etM_axL_en_511 ' JUMPV addrg
C_linenoiseH_istoryS_etM_axL_en_516
 cmps r23, r21 wcz
 if_ae jmp #\C_linenoiseH_istoryS_etM_axL_en_518 ' GEI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_linenoiseH_istoryS_etM_axL_en_523 ' JUMPV addrg
C_linenoiseH_istoryS_etM_axL_en_520
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
' C_linenoiseH_istoryS_etM_axL_en_521 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_linenoiseH_istoryS_etM_axL_en_523
 mov r22, r21 ' SUBI/P
 subs r22, r23 ' SUBI/P (3)
 cmps r19, r22 wcz
 if_b jmp #\C_linenoiseH_istoryS_etM_axL_en_520 ' LTI4
 mov r21, r23 ' CVI, CVU or LOAD
C_linenoiseH_istoryS_etM_axL_en_518
 mov r22, r23 ' CVI, CVU or LOAD
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r3, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 subs r22, r21 ' SUBI/P (1)
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, ##@C_sg78g_6864c5c0_history_L000046 ' ASGNP4 addrg reg
C_linenoiseH_istoryS_etM_axL_en_514
 mov r22, ##@C_sg78e_6864c5c0_history_max_len_L000044 ' reg <- addrg
 wrlong r23, ##@C_sg78e_6864c5c0_history_max_len_L000044 ' ASGNI4 addrg reg
 mov r20, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wcz
 if_be jmp #\C_linenoiseH_istoryS_etM_axL_en_524 ' LEI4
 mov r22, ##@C_sg78e_6864c5c0_history_max_len_L000044
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 wrlong r22, ##@C_sg78f_6864c5c0_history_len_L000045 ' ASGNI4 addrg reg
C_linenoiseH_istoryS_etM_axL_en_524
 mov r0, #1 ' reg <- coni
C_linenoiseH_istoryS_etM_axL_en_511
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export linenoiseHistorySave

 alignl ' align long
C_linenoiseH_istoryS_ave ' <symbol:linenoiseHistorySave>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_linenoiseH_istoryS_ave_527_L000528 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryS_ave_529  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_linenoiseH_istoryS_ave_526 ' JUMPV addrg
C_linenoiseH_istoryS_ave_529
 mov r21, #0 ' reg <- coni
 jmp #\@C_linenoiseH_istoryS_ave_534 ' JUMPV addrg
C_linenoiseH_istoryS_ave_531
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sg78g_6864c5c0_history_L000046
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C_linenoiseH_istoryS_ave_535_L000536 ' reg ARG ADDRG
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fprintf
 add SP, #8 ' CALL addrg
' C_linenoiseH_istoryS_ave_532 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_linenoiseH_istoryS_ave_534
 mov r22, ##@C_sg78f_6864c5c0_history_len_L000045
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r21, r22 wcz
 if_b jmp #\C_linenoiseH_istoryS_ave_531 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
 mov r0, #0 ' reg <- coni
C_linenoiseH_istoryS_ave_526
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export linenoiseHistoryLoad

 alignl ' align long
C_linenoiseH_istoryL_oad ' <symbol:linenoiseHistoryLoad>
 calld PA,#NEWF
 sub SP, ##1024
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_linenoiseH_istoryL_oad_538_L000539 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryL_oad_543  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_linenoiseH_istoryL_oad_537 ' JUMPV addrg
C_linenoiseH_istoryL_oad_542
 mov r2, #13 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1028)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryL_oad_545  ' NEU4
 mov r2, #10 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-1028)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_linenoiseH_istoryL_oad_545
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_linenoiseH_istoryL_oad_547 ' EQU4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r19 ' ASGNU1 reg reg
C_linenoiseH_istoryL_oad_547
 mov r2, FP
 adds r2, ##(-1028)
' reg ARG ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_linenoiseH_istoryA_dd ' CALL addrg
C_linenoiseH_istoryL_oad_543
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##1024 ' reg ARG con
 mov r4, FP
 adds r4, ##(-1028)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fgets
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_linenoiseH_istoryL_oad_542  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fclose ' CALL addrg
 mov r0, #0 ' reg <- coni
C_linenoiseH_istoryL_oad_537
 calld PA,#POPM ' restore registers
 add SP, ##1024 ' framesize
 calld PA,#RETF


' Catalina Import k_wait

' Catalina Import t_char

' Catalina Import toupper

' Catalina Import strlen

' Catalina Import memset

' Catalina Import strchr

' Catalina Import strcmp

' Catalina Import memcmp

' Catalina Import strncpy

' Catalina Import strcpy

' Catalina Import memmove

' Catalina Import memcpy

' Catalina Import errno

' Catalina Import fgets

' Catalina Import fgetc

' Catalina Import vsprintf

' Catalina Import sscanf

' Catalina Import printf

' Catalina Import fprintf

' Catalina Import fopen

' Catalina Import fflush

' Catalina Import fclose

' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin

' Catalina Import getenv

' Catalina Import realloc

' Catalina Import malloc

' Catalina Import free

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_linenoiseH_istoryL_oad_538_L000539 ' <symbol:538>
 byte 114
 byte 0

 alignl ' align long
C_linenoiseH_istoryS_ave_535_L000536 ' <symbol:535>
 byte 37
 byte 115
 byte 10
 byte 0

 alignl ' align long
C_linenoiseH_istoryS_ave_527_L000528 ' <symbol:527>
 byte 119
 byte 0

 alignl ' align long
C_linenoiseP_rintK_eyC_odes_463_L000464 ' <symbol:463>
 byte 39
 byte 37
 byte 99
 byte 39
 byte 32
 byte 37
 byte 48
 byte 50
 byte 120
 byte 32
 byte 40
 byte 37
 byte 100
 byte 41
 byte 32
 byte 40
 byte 116
 byte 121
 byte 112
 byte 101
 byte 32
 byte 113
 byte 117
 byte 105
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 101
 byte 120
 byte 105
 byte 116
 byte 41
 byte 10
 byte 0

 alignl ' align long
C_linenoiseP_rintK_eyC_odes_461_L000462 ' <symbol:461>
 byte 113
 byte 117
 byte 105
 byte 116
 byte 0

 alignl ' align long
C_linenoiseP_rintK_eyC_odes_450_L000451 ' <symbol:450>
 byte 76
 byte 105
 byte 110
 byte 101
 byte 110
 byte 111
 byte 105
 byte 115
 byte 101
 byte 32
 byte 107
 byte 101
 byte 121
 byte 32
 byte 99
 byte 111
 byte 100
 byte 101
 byte 115
 byte 32
 byte 100
 byte 101
 byte 98
 byte 117
 byte 103
 byte 103
 byte 105
 byte 110
 byte 103
 byte 32
 byte 109
 byte 111
 byte 100
 byte 101
 byte 46
 byte 10
 byte 80
 byte 114
 byte 101
 byte 115
 byte 115
 byte 32
 byte 107
 byte 101
 byte 121
 byte 115
 byte 32
 byte 116
 byte 111
 byte 32
 byte 115
 byte 101
 byte 101
 byte 32
 byte 115
 byte 99
 byte 97
 byte 110
 byte 32
 byte 99
 byte 111
 byte 100
 byte 101
 byte 115
 byte 46
 byte 32
 byte 84
 byte 121
 byte 112
 byte 101
 byte 32
 byte 39
 byte 113
 byte 117
 byte 105
 byte 116
 byte 39
 byte 32
 byte 97
 byte 116
 byte 32
 byte 97
 byte 110
 byte 121
 byte 32
 byte 116
 byte 105
 byte 109
 byte 101
 byte 32
 byte 116
 byte 111
 byte 32
 byte 101
 byte 120
 byte 105
 byte 116
 byte 46
 byte 10
 byte 0

 alignl ' align long
C_sg781r_6864c5c0_347_L000348 ' <symbol:347>
 byte 73
 byte 102
 byte 32
 byte 121
 byte 111
 byte 117
 byte 32
 byte 115
 byte 101
 byte 101
 byte 32
 byte 116
 byte 104
 byte 105
 byte 115
 byte 44
 byte 32
 byte 121
 byte 111
 byte 117
 byte 32
 byte 97
 byte 114
 byte 101
 byte 32
 byte 109
 byte 105
 byte 115
 byte 117
 byte 115
 byte 105
 byte 110
 byte 103
 byte 32
 byte 116
 byte 104
 byte 101
 byte 32
 byte 65
 byte 80
 byte 73
 byte 58
 byte 32
 byte 119
 byte 104
 byte 101
 byte 110
 byte 32
 byte 108
 byte 105
 byte 110
 byte 101
 byte 110
 byte 111
 byte 105
 byte 115
 byte 101
 byte 69
 byte 100
 byte 105
 byte 116
 byte 70
 byte 101
 byte 101
 byte 100
 byte 40
 byte 41
 byte 32
 byte 105
 byte 115
 byte 32
 byte 99
 byte 97
 byte 108
 byte 108
 byte 101
 byte 100
 byte 44
 byte 32
 byte 105
 byte 102
 byte 32
 byte 105
 byte 116
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 115
 byte 32
 byte 108
 byte 105
 byte 110
 byte 101
 byte 110
 byte 111
 byte 105
 byte 115
 byte 101
 byte 69
 byte 100
 byte 105
 byte 116
 byte 77
 byte 111
 byte 114
 byte 101
 byte 32
 byte 116
 byte 104
 byte 101
 byte 32
 byte 117
 byte 115
 byte 101
 byte 114
 byte 32
 byte 105
 byte 115
 byte 32
 byte 121
 byte 101
 byte 116
 byte 32
 byte 101
 byte 100
 byte 105
 byte 116
 byte 105
 byte 110
 byte 103
 byte 32
 byte 116
 byte 104
 byte 101
 byte 32
 byte 108
 byte 105
 byte 110
 byte 101
 byte 46
 byte 32
 byte 83
 byte 101
 byte 101
 byte 32
 byte 116
 byte 104
 byte 101
 byte 32
 byte 82
 byte 69
 byte 65
 byte 68
 byte 77
 byte 69
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 109
 byte 111
 byte 114
 byte 101
 byte 32
 byte 105
 byte 110
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 46
 byte 0

 alignl ' align long
C_linenoiseE_ditS_tart_343_L000344 ' <symbol:343>
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_270_L000271 ' <symbol:270>
 byte 115
 byte 101
 byte 116
 byte 32
 byte 99
 byte 111
 byte 108
 byte 32
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_268_L000269 ' <symbol:268>
 byte 27
 byte 91
 byte 37
 byte 100
 byte 65
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_266_L000267 ' <symbol:266>
 byte 103
 byte 111
 byte 45
 byte 117
 byte 112
 byte 32
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_262_L000263 ' <symbol:262>
 byte 114
 byte 112
 byte 111
 byte 115
 byte 50
 byte 32
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_258_L000259 ' <symbol:258>
 byte 10
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_256_L000257 ' <symbol:256>
 byte 60
 byte 110
 byte 101
 byte 119
 byte 108
 byte 105
 byte 110
 byte 101
 byte 62
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_244_L000245 ' <symbol:244>
 byte 13
 byte 27
 byte 91
 byte 48
 byte 75
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_242_L000243 ' <symbol:242>
 byte 99
 byte 108
 byte 101
 byte 97
 byte 114
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_238_L000239 ' <symbol:238>
 byte 13
 byte 27
 byte 91
 byte 48
 byte 75
 byte 27
 byte 91
 byte 49
 byte 65
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_236_L000237 ' <symbol:236>
 byte 99
 byte 108
 byte 101
 byte 97
 byte 114
 byte 43
 byte 117
 byte 112
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_230_L000231 ' <symbol:230>
 byte 27
 byte 91
 byte 37
 byte 100
 byte 66
 byte 0

 alignl ' align long
C_sg781d_6864c5c0_refreshM_ultiL_ine_L000222_228_L000229 ' <symbol:228>
 byte 103
 byte 111
 byte 32
 byte 100
 byte 111
 byte 119
 byte 110
 byte 32
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_217_L000218 ' <symbol:217>
 byte 13
 byte 27
 byte 91
 byte 37
 byte 100
 byte 67
 byte 0

 alignl ' align long
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_213_L000214 ' <symbol:213>
 byte 27
 byte 91
 byte 48
 byte 75
 byte 0

 alignl ' align long
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_211_L000212 ' <symbol:211>
 byte 42
 byte 0

 alignl ' align long
C_sg7818_6864c5c0_refreshS_ingleL_ine_L000194_202_L000203 ' <symbol:202>
 byte 13
 byte 0

 alignl ' align long
C_refreshS_howH_ints_190_L000191 ' <symbol:190>
 byte 27
 byte 91
 byte 48
 byte 109
 byte 0

 alignl ' align long
C_refreshS_howH_ints_185_L000186 ' <symbol:185>
 byte 27
 byte 91
 byte 37
 byte 100
 byte 59
 byte 37
 byte 100
 byte 59
 byte 52
 byte 57
 byte 109
 byte 0

 alignl ' align long
C_sg7810_6864c5c0_completeL_ine_L000132_151_L000152 ' <symbol:151>
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_sg78s_6864c5c0_linenoiseB_eep_L000108_110_L000111 ' <symbol:110>
 byte 7
 byte 0

 alignl ' align long
C_linenoiseC_learS_creen_106_L000107 ' <symbol:106>
 byte 27
 byte 91
 byte 72
 byte 27
 byte 91
 byte 50
 byte 74
 byte 0

 alignl ' align long
C_sg78o_6864c5c0_getC_olumns_L000086_99_L000100 ' <symbol:99>
 byte 27
 byte 91
 byte 37
 byte 100
 byte 68
 byte 0

 alignl ' align long
C_sg78o_6864c5c0_getC_olumns_L000086_93_L000094 ' <symbol:93>
 byte 27
 byte 91
 byte 57
 byte 57
 byte 57
 byte 67
 byte 0

 alignl ' align long
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_84_L000085 ' <symbol:84>
 byte 37
 byte 100
 byte 59
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sg78l_6864c5c0_getC_ursorP_osition_L000064_68_L000069 ' <symbol:68>
 byte 27
 byte 91
 byte 54
 byte 110
 byte 0

 alignl ' align long
C_sg78j_6864c5c0_isU_nsupportedT_erm_L000052_54_L000055 ' <symbol:54>
 byte 84
 byte 69
 byte 82
 byte 77
 byte 0

 alignl ' align long
C_sg783_6864c5c0_32_L000033 ' <symbol:32>
 byte 101
 byte 109
 byte 97
 byte 99
 byte 115
 byte 0

 alignl ' align long
C_sg782_6864c5c0_30_L000031 ' <symbol:30>
 byte 99
 byte 111
 byte 110
 byte 115
 byte 50
 byte 53
 byte 0

 alignl ' align long
C_sg781_6864c5c0_28_L000029 ' <symbol:28>
 byte 100
 byte 117
 byte 109
 byte 98
 byte 0

' Catalina Code

DAT ' code segment
' end
