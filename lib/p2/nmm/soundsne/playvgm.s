' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_se8o9_6a9cb816_noiseR_eset_L000011 ' <symbol:noiseReset>
 long 0

 alignl ' align long
C_se8oa_6a9cb816_regist_L000012 ' <symbol:regist>
 long 0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_se8ob_6a9cb816_waitS_amples_L000013 ' <symbol:waitSamples>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_se8o1_6a9cb816_readptr_L000003
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, ##@C_se8o4_6a9cb816_loopptr_L000006
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C_se8ob_6a9cb816_waitS_amples_L000013_15 ' LTU4
 mov r22, ##@C_se8o5_6a9cb816_loopleft_L000007 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, r23 ' SUBU (1)
 wrlong r22, ##@C_se8o5_6a9cb816_loopleft_L000007 ' ASGNU4 addrg reg
C_se8ob_6a9cb816_waitS_amples_L000013_15
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##$ac44 ' reg <- con
 mov r18, ##@C_se8o8_6a9cb816_speed_divisor_L000010
 rdlong r18, r18 ' reg <- INDIRU4 addrg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r0 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r0, r23 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #50 wcz 
 if_ae jmp #\C_se8ob_6a9cb816_waitS_amples_L000013_17 ' GEU4
 mov r21, #50 ' reg <- coni
C_se8ob_6a9cb816_waitS_amples_L000013_17
 mov r22, ##@C_se8o_6a9cb816_waitF_or_L000002 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r21 ' ADDU (1)
 wrlong r22, ##@C_se8o_6a9cb816_waitF_or_L000002 ' ASGNU4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##@C_se8o_6a9cb816_waitF_or_L000002
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 cmp r22,  #100 wcz 
 if_ae jmp #\C_se8ob_6a9cb816_waitS_amples_L000013_19 ' GEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r22, r0
 adds r22, #100 ' ADDI4 coni
 wrlong r22, ##@C_se8o_6a9cb816_waitF_or_L000002 ' ASGNU4 addrg reg
C_se8ob_6a9cb816_waitS_amples_L000013_19
' C_se8ob_6a9cb816_waitS_amples_L000013_14 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_se8oc_6a9cb816_getn_L000021 ' <symbol:getn>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_se8o1_6a9cb816_readptr_L000003
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, ##@C_se8o1_6a9cb816_readptr_L000003 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r21 ' ADDI/P (2)
 wrlong r22, ##@C_se8o1_6a9cb816_readptr_L000003 ' ASGNP4 addrg reg
' C_se8oc_6a9cb816_getn_L000021_22 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export sne_setRegister

 alignl ' align long
C_sne_setR_egister ' <symbol:sne_setRegister>
 calld PA,#PSHM
 long $550000 ' save registers
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_sne_setR_egister_24 ' EQU4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sne_setR_egister_26 ' EQI4
 mov r22, ##@C_se8oa_6a9cb816_regist_L000012 ' reg <- addrg
 mov r20, r2 ' CVUI
 and r20, cviu_m1 ' zero extend
 mov r18, r20
 sar r18, #4 ' RSHI4 coni
 and r18, #7 ' BANDI4 coni
 wrlong r18, ##@C_se8oa_6a9cb816_regist_L000012 ' ASGNI4 addrg reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r18, ##@C_S_N_R_egisters
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 adds r22, r18 ' ADDI/P (1)
 rdlong r18, r22 ' reg <- INDIRU4 reg
 mov r16, ##1008 ' reg <- con
 and r18, r16 ' BANDI/U (1)
 and r20, #15 ' BANDI4 coni
 or r20, r18 ' BORI/U (2)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sne_setR_egister_27 ' JUMPV addrg
C_sne_setR_egister_26
 mov r22, ##@C_se8oa_6a9cb816_regist_L000012
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, r22
 and r20, #1 ' BANDI4 coni
 cmps r20,  #0 wz
 if_nz jmp #\C_sne_setR_egister_30 ' NEI4
 cmps r22,  #5 wcz
 if_be jmp #\C_sne_setR_egister_28 ' LEI4
C_sne_setR_egister_30
 mov r22, ##@C_se8oa_6a9cb816_regist_L000012
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_S_N_R_egisters
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r2 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sne_setR_egister_29 ' JUMPV addrg
C_sne_setR_egister_28
 mov r22, ##@C_se8oa_6a9cb816_regist_L000012
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_S_N_R_egisters
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #15 ' BANDU4 coni
 mov r18, r2 ' CVUI
 and r18, cviu_m1 ' zero extend
 and r18, #63 ' BANDI4 coni
 shl r18, #4 ' LSHI4 coni
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_sne_setR_egister_29
C_sne_setR_egister_27
 mov r22, ##@C_se8oa_6a9cb816_regist_L000012
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #6 wz
 if_nz jmp #\C_sne_setR_egister_31 ' NEI4
 mov r22, #1 ' reg <- coni
 wrlong r22, ##@C_se8o9_6a9cb816_noiseR_eset_L000011 ' ASGNI4 addrg reg
C_sne_setR_egister_31
C_sne_setR_egister_24
' C_sne_setR_egister_23 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_se8od_6a9cb816_sne_updateR_egisters_L000033 ' <symbol:sne_updateRegisters>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_se8od_6a9cb816_sne_updateR_egisters_L000033_35 ' EQU4
 mov r2, #32 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C_S_N_R_egisters
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memmove
 add SP, #8 ' CALL addrg
C_se8od_6a9cb816_sne_updateR_egisters_L000033_35
' C_se8od_6a9cb816_sne_updateR_egisters_L000033_34 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_se8oe_6a9cb816_sne_flipR_egisters_L000037 ' <symbol:sne_flipRegisters>
 calld PA,#NEWF
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_se8oe_6a9cb816_sne_flipR_egisters_L000037_39 ' EQU4
 mov r22, ##@C_se8o9_6a9cb816_noiseR_eset_L000011
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_z jmp #\C_se8oe_6a9cb816_sne_flipR_egisters_L000037_41 ' EQI4
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 and r20, #255 ' BANDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_se8o9_6a9cb816_noiseR_eset_L000011 ' ASGNI4 addrg reg
 jmp #\@C_se8oe_6a9cb816_sne_flipR_egisters_L000037_42 ' JUMPV addrg
C_se8oe_6a9cb816_sne_flipR_egisters_L000037_41
 mov r22, ##@C_S_N_R_egisters
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 or r20, #256 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
C_se8oe_6a9cb816_sne_flipR_egisters_L000037_42
 mov r2, ##@C_S_N_R_egisters
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_se8od_6a9cb816_sne_updateR_egisters_L000033 ' CALL addrg
C_se8oe_6a9cb816_sne_flipR_egisters_L000037_39
' C_se8oe_6a9cb816_sne_flipR_egisters_L000037_38 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export sne_playVGM

 alignl ' align long
C_sne_playV_G_M_ ' <symbol:sne_playVGM>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sne_setF_req
 add SP, #4 ' CALL addrg
 wrlong r21, ##@C_se8o8_6a9cb816_speed_divisor_L000010 ' ASGNU4 addrg reg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r22, r23 ' ADDI/P (1)
 adds r22, #52 ' ADDP4 coni
 wrlong r22, ##@C_se8o1_6a9cb816_readptr_L000003 ' ASGNP4 addrg reg
 mov r22, ##@C_se8o4_6a9cb816_loopptr_L000006 ' reg <- addrg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 adds r20, r23 ' ADDI/P (1)
 wrlong r20, ##@C_se8o4_6a9cb816_loopptr_L000006 ' ASGNP4 addrg reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sne_playV_G_M__44 ' EQU4
 mov r22, ##@C_se8o4_6a9cb816_loopptr_L000006 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 wrlong r22, ##@C_se8o4_6a9cb816_loopptr_L000006 ' ASGNP4 addrg reg
C_sne_playV_G_M__44
 mov r22, ##@C_se8o6_6a9cb816_looplength_L000008 ' reg <- addrg
 mov r20, r23
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, ##@C_se8o6_6a9cb816_looplength_L000008 ' ASGNU4 addrg reg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, ##@C_se8o5_6a9cb816_loopleft_L000007 ' ASGNU4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r20, ##10000000 ' reg <- con
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 wrlong r22, ##@C_se8o_6a9cb816_waitF_or_L000002 ' ASGNU4 addrg reg
 jmp #\@C_sne_playV_G_M__47 ' JUMPV addrg
C_sne_playV_G_M__46
 mov r17, #1 ' reg <- coni
 jmp #\@C_sne_playV_G_M__50 ' JUMPV addrg
C_sne_playV_G_M__49
 mov r22, ##@C_se8o5_6a9cb816_loopleft_L000007
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_sne_playV_G_M__52  ' NEU4
 mov r22, ##@C_se8o4_6a9cb816_loopptr_L000006
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_sne_playV_G_M__54 ' EQU4
 mov r22, ##@C_se8o6_6a9cb816_looplength_L000008
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_sne_playV_G_M__54 ' EQU4
 mov r22, ##@C_se8o6_6a9cb816_looplength_L000008
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 wrlong r22, ##@C_se8o5_6a9cb816_loopleft_L000007 ' ASGNU4 addrg reg
 mov r22, ##@C_se8o4_6a9cb816_loopptr_L000006
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 wrlong r22, ##@C_se8o1_6a9cb816_readptr_L000003 ' ASGNP4 addrg reg
C_sne_playV_G_M__54
C_sne_playV_G_M__52
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se8oc_6a9cb816_getn_L000021
 add SP, #4 ' CALL addrg
 mov r22, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg <- addrg
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19,  #80 wcz
 if_b jmp #\C_sne_playV_G_M__57 ' LTI4
 cmps r19,  #143 wcz
 if_a jmp #\C_sne_playV_G_M__77 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sne_playV_G_M__78_L000080-320 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sne_playV_G_M__78_L000080 ' <symbol:78>
 long @C_sne_playV_G_M__58
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__59
 long @C_sne_playV_G_M__59
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__66
 long @C_sne_playV_G_M__68
 long @C_sne_playV_G_M__69
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__43
 long @C_sne_playV_G_M__71
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__57
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__65
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62
 long @C_sne_playV_G_M__62

' Catalina Code

DAT ' code segment
C_sne_playV_G_M__77
 cmps r19,  #224 wz
 if_z jmp #\C_sne_playV_G_M__70 ' EQI4
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__58
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se8oc_6a9cb816_getn_L000021
 add SP, #4 ' CALL addrg
 mov r22, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg <- addrg
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sne_setR_egister ' CALL addrg
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__59
 mov r2, #2 ' reg ARG coni
 mov r3, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se8oc_6a9cb816_getn_L000021
 add SP, #4 ' CALL addrg
 mov r22, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg <- addrg
 rdbyte r15, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19,  #83 wz
 if_nz jmp #\C_sne_playV_G_M__57 ' NEI4
 adds r15, #256 ' ADDI4 coni
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__62
 cmps r19,  #128 wz
 if_z jmp #\C_sne_playV_G_M__57 ' EQI4
 mov r22, r19
 and r22, #15 ' BANDI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_se8ob_6a9cb816_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__65
 mov r22, r19
 and r22, #15 ' BANDI4 coni
 adds r22, #1 ' ADDI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_se8ob_6a9cb816_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__66
 mov r2, #2 ' reg ARG coni
 mov r3, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se8oc_6a9cb816_getn_L000021
 add SP, #4 ' CALL addrg
 mov r22, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C_se8o7_6a9cb816_buffer_L000009+1 ' reg <- addrg
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #8 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_se8ob_6a9cb816_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__68
 mov r2, ##735 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_se8ob_6a9cb816_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__69
 mov r2, ##882 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_se8ob_6a9cb816_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__70
 mov r2, #4 ' reg ARG coni
 mov r3, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se8oc_6a9cb816_getn_L000021
 add SP, #4 ' CALL addrg
 mov r22, ##@C_se8o7_6a9cb816_buffer_L000009
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 wrlong r22, ##@C_se8o3_6a9cb816_dataptr_L000005 ' ASGNP4 addrg reg
 jmp #\@C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__71
 mov r2, #6 ' reg ARG coni
 mov r3, ##@C_se8o7_6a9cb816_buffer_L000009 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_se8oc_6a9cb816_getn_L000021
 add SP, #4 ' CALL addrg
 mov r22, ##@C_se8o7_6a9cb816_buffer_L000009+1 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sne_playV_G_M__57 ' NEI4
 mov r22, ##@C_se8o1_6a9cb816_readptr_L000003 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, ##@C_se8o2_6a9cb816_database_L000004 ' ASGNP4 addrg reg
 mov r20, ##0 ' reg <- con
 wrlong r20, ##@C_se8o3_6a9cb816_dataptr_L000005 ' ASGNP4 addrg reg
 mov r20, ##@C_se8o7_6a9cb816_buffer_L000009+2
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 adds r22, r20 ' ADDI/P (2)
 wrlong r22, ##@C_se8o1_6a9cb816_readptr_L000003 ' ASGNP4 addrg reg
C_sne_playV_G_M__57
C_sne_playV_G_M__50
 cmps r17,  #0 wz
 if_nz jmp #\C_sne_playV_G_M__49 ' NEI4
 mov r2, ##@C_se8o_6a9cb816_waitF_or_L000002
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitcnt ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_se8oe_6a9cb816_sne_flipR_egisters_L000037 ' CALL addrg
C_sne_playV_G_M__47
 jmp #\@C_sne_playV_G_M__46 ' JUMPV addrg
C_sne_playV_G_M__43
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _waitcnt

' Catalina Import _cnt

' Catalina Import _clockfreq

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_se8o8_6a9cb816_speed_divisor_L000010 ' <symbol:speed_divisor>
 byte 0[4]

 alignl ' align long
C_se8o7_6a9cb816_buffer_L000009 ' <symbol:buffer>
 byte 0[64]

 alignl ' align long
C_se8o6_6a9cb816_looplength_L000008 ' <symbol:looplength>
 byte 0[4]

 alignl ' align long
C_se8o5_6a9cb816_loopleft_L000007 ' <symbol:loopleft>
 byte 0[4]

 alignl ' align long
C_se8o4_6a9cb816_loopptr_L000006 ' <symbol:loopptr>
 byte 0[4]

 alignl ' align long
C_se8o3_6a9cb816_dataptr_L000005 ' <symbol:dataptr>
 byte 0[4]

 alignl ' align long
C_se8o2_6a9cb816_database_L000004 ' <symbol:database>
 byte 0[4]

 alignl ' align long
C_se8o1_6a9cb816_readptr_L000003 ' <symbol:readptr>
 byte 0[4]

 alignl ' align long
C_se8o_6a9cb816_waitF_or_L000002 ' <symbol:waitFor>
 byte 0[4]

' Catalina Code

DAT ' code segment

' Catalina Import SNRegisters

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import memmove

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import memcpy

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sne_setFreq

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
