' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_safc9_6a9cb625_noiseR_eset_L000011 ' <symbol:noiseReset>
 long 0

 alignl ' align long
C_safca_6a9cb625_regist_L000012 ' <symbol:regist>
 long 0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_safcb_6a9cb625_waitS_amples_L000013 ' <symbol:waitSamples>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_safc1_6a9cb625_readptr_L000003
 mov r22, RI ' reg <- INDIRP4 addrg
 jmp #LODI
 long @C_safc4_6a9cb625_loopptr_L000006
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_safcb_6a9cb625_waitS_amples_L000013_15' LTU4
 jmp #LODI
 long @C_safc5_6a9cb625_loopleft_L000007
 mov r22, RI ' reg <- INDIRU4 addrg
 sub r22, r23 ' SUBU (1)
 jmp #LODL
 long @C_safc5_6a9cb625_loopleft_L000007
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
C_safcb_6a9cb625_waitS_amples_L000013_15
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long $ac44
 mov r20, RI ' reg <- con
 jmp #LODI
 long @C_safc8_6a9cb625_speed_divisor_L000010
 mov r18, RI ' reg <- INDIRU4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #DIVU ' DIVU
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r21, r0 ' CVI, CVU or LOAD
 cmp r21,  #50 wz,wc 
 jmp #BRAE
 long @C_safcb_6a9cb625_waitS_amples_L000013_17 ' GEU4
 mov r21, #50 ' reg <- coni
C_safcb_6a9cb625_waitS_amples_L000013_17
 jmp #LODI
 long @C_safc_6a9cb625_waitF_or_L000002
 mov r22, RI ' reg <- INDIRU4 addrg
 add r22, r21 ' ADDU (1)
 jmp #LODL
 long @C_safc_6a9cb625_waitF_or_L000002
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #LODI
 long @C_safc_6a9cb625_waitF_or_L000002
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 sub r22, r20 ' SUBU (1)
 cmp r22,  #100 wz,wc 
 jmp #BRAE
 long @C_safcb_6a9cb625_waitS_amples_L000013_19 ' GEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0
 adds r22, #100 ' ADDI4 coni
 jmp #LODL
 long @C_safc_6a9cb625_waitF_or_L000002
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
C_safcb_6a9cb625_waitS_amples_L000013_19
' C_safcb_6a9cb625_waitS_amples_L000013_14 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_safcc_6a9cb625_getn_L000021 ' <symbol:getn>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_safc1_6a9cb625_readptr_L000003
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #LODI
 long @C_safc1_6a9cb625_readptr_L000003
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, r21 ' ADDI/P (2)
 jmp #LODL
 long @C_safc1_6a9cb625_readptr_L000003
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
' C_safcc_6a9cb625_getn_L000021_22 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export sne_setRegister

 alignl ' align long
C_sne_setR_egister ' <symbol:sne_setRegister>
 jmp #PSHM
 long $550000 ' save registers
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_setR_egister_24 ' EQU4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sne_setR_egister_26 ' EQI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r20, r22
 sar r20, #4 ' RSHI4 coni
 and r20, #7 ' BANDI4 coni
 jmp #LODL
 long @C_safca_6a9cb625_regist_L000012
 mov BC, r20
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_safca_6a9cb625_regist_L000012
 mov r20, RI ' reg <- INDIRI4 addrg
 shl r20, #2 ' LSHI4 coni
 jmp #LODI
 long @C_S_N_R_egisters
 mov r18, RI ' reg <- INDIRP4 addrg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long 1008
 mov r16, RI ' reg <- con
 and r18, r16 ' BANDI/U (1)
 and r22, #15 ' BANDI4 coni
 or r22, r18 ' BORI/U (2)
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sne_setR_egister_27 ' JUMPV addrg
C_sne_setR_egister_26
 jmp #LODI
 long @C_safca_6a9cb625_regist_L000012
 mov r22, RI ' reg <- INDIRI4 addrg
 mov r20, r22
 and r20, #1 ' BANDI4 coni
 cmps r20,  #0 wz
 jmp #BRNZ
 long @C_sne_setR_egister_30 ' NEI4
 cmps r22,  #5 wz,wc
 jmp #BRBE
 long @C_sne_setR_egister_28 ' LEI4
C_sne_setR_egister_30
 jmp #LODI
 long @C_safca_6a9cb625_regist_L000012
 mov r22, RI ' reg <- INDIRI4 addrg
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_S_N_R_egisters
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r2 ' CVUI
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sne_setR_egister_29 ' JUMPV addrg
C_sne_setR_egister_28
 jmp #LODI
 long @C_safca_6a9cb625_regist_L000012
 mov r22, RI ' reg <- INDIRI4 addrg
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_S_N_R_egisters
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 and r20, #15 ' BANDU4 coni
 mov r18, r2 ' CVUI
 and r18, cviu_m1 ' zero extend
 and r18, #63 ' BANDI4 coni
 shl r18, #4 ' LSHI4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_sne_setR_egister_29
C_sne_setR_egister_27
 jmp #LODI
 long @C_safca_6a9cb625_regist_L000012
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_sne_setR_egister_31 ' NEI4
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C_safc9_6a9cb625_noiseR_eset_L000011
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
C_sne_setR_egister_31
C_sne_setR_egister_24
' C_sne_setR_egister_23 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_safcd_6a9cb625_sne_updateR_egisters_L000033 ' <symbol:sne_updateRegisters>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_safcd_6a9cb625_sne_updateR_egisters_L000033_35 ' EQU4
 mov r2, #32 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_S_N_R_egisters
 mov r4, RI ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memmove
 add SP, #8 ' CALL addrg
C_safcd_6a9cb625_sne_updateR_egisters_L000033_35
' C_safcd_6a9cb625_sne_updateR_egisters_L000033_34 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_safce_6a9cb625_sne_flipR_egisters_L000037 ' <symbol:sne_flipRegisters>
 jmp #NEWF
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_safce_6a9cb625_sne_flipR_egisters_L000037_39 ' EQU4
 jmp #LODI
 long @C_safc9_6a9cb625_noiseR_eset_L000011
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_safce_6a9cb625_sne_flipR_egisters_L000037_41 ' EQI4
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 and r20, #255 ' BANDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_safc9_6a9cb625_noiseR_eset_L000011
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_safce_6a9cb625_sne_flipR_egisters_L000037_42 ' JUMPV addrg
C_safce_6a9cb625_sne_flipR_egisters_L000037_41
 jmp #LODI
 long @C_S_N_R_egisters
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 or r20, #256 ' BORU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_safce_6a9cb625_sne_flipR_egisters_L000037_42
 jmp #LODI
 long @C_S_N_R_egisters
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_safcd_6a9cb625_sne_updateR_egisters_L000033 ' CALL addrg
C_safce_6a9cb625_sne_flipR_egisters_L000037_39
' C_safce_6a9cb625_sne_flipR_egisters_L000037_38 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export sne_playVGM

 alignl ' align long
C_sne_playV_G_M_ ' <symbol:sne_playVGM>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sne_setF_req
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_safc8_6a9cb625_speed_divisor_L000010
 mov BC, r21
 jmp #WLNG ' ASGNU4 addrg reg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 adds r22, r23 ' ADDI/P (1)
 adds r22, #52 ' ADDP4 coni
 jmp #LODL
 long @C_safc1_6a9cb625_readptr_L000003
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 adds r22, r23 ' ADDI/P (1)
 jmp #LODL
 long @C_safc4_6a9cb625_loopptr_L000006
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #LODI
 long @C_safc4_6a9cb625_loopptr_L000006
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_playV_G_M__44 ' EQU4
 jmp #LODI
 long @C_safc4_6a9cb625_loopptr_L000006
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #28 ' ADDP4 coni
 jmp #LODL
 long @C_safc4_6a9cb625_loopptr_L000006
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
C_sne_playV_G_M__44
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long @C_safc6_6a9cb625_looplength_L000008
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODI
 long @C_safc6_6a9cb625_looplength_L000008
 mov r22, RI ' reg <- INDIRU4 addrg
 jmp #LODL
 long @C_safc5_6a9cb625_loopleft_L000007
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 jmp #LODL
 long 10000000
 mov r20, RI ' reg <- con
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 jmp #LODL
 long @C_safc_6a9cb625_waitF_or_L000002
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #JMPA
 long @C_sne_playV_G_M__47 ' JUMPV addrg
C_sne_playV_G_M__46
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_sne_playV_G_M__50 ' JUMPV addrg
C_sne_playV_G_M__49
 jmp #LODI
 long @C_safc5_6a9cb625_loopleft_L000007
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sne_playV_G_M__52 ' NEU4
 jmp #LODI
 long @C_safc4_6a9cb625_loopptr_L000006
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_playV_G_M__54 ' EQU4
 jmp #LODI
 long @C_safc6_6a9cb625_looplength_L000008
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sne_playV_G_M__54 ' EQU4
 jmp #LODI
 long @C_safc6_6a9cb625_looplength_L000008
 mov r22, RI ' reg <- INDIRU4 addrg
 jmp #LODL
 long @C_safc5_6a9cb625_loopleft_L000007
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODI
 long @C_safc4_6a9cb625_loopptr_L000006
 mov r22, RI ' reg <- INDIRP4 addrg
 jmp #LODL
 long @C_safc1_6a9cb625_readptr_L000003
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
C_sne_playV_G_M__54
C_sne_playV_G_M__52
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_safcc_6a9cb625_getn_L000021
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 cmps r19,  #80 wz,wc
 jmp #BR_B
 long @C_sne_playV_G_M__57 ' LTI4
 cmps r19,  #143 wz,wc
 jmp #BR_A
 long @C_sne_playV_G_M__77 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sne_playV_G_M__78_L000080-320
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 jmp #BR_Z
 long @C_sne_playV_G_M__70 ' EQI4
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__58
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_safcc_6a9cb625_getn_L000021
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sne_setR_egister ' CALL addrg
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__59
 mov r2, #2 ' reg ARG coni
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_safcc_6a9cb625_getn_L000021
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 cmps r19,  #83 wz
 jmp #BRNZ
 long @C_sne_playV_G_M__57 ' NEI4
 adds r15, #256 ' ADDI4 coni
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__62
 cmps r19,  #128 wz
 jmp #BR_Z
 long @C_sne_playV_G_M__57 ' EQI4
 mov r22, r19
 and r22, #15 ' BANDI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_safcb_6a9cb625_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__65
 mov r22, r19
 and r22, #15 ' BANDI4 coni
 adds r22, #1 ' ADDI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_safcb_6a9cb625_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__66
 mov r2, #2 ' reg ARG coni
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_safcc_6a9cb625_getn_L000021
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009+1
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 addrg
 and r20, cviu_m1 ' zero extend
 shl r20, #8 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_safcb_6a9cb625_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__68
 jmp #LODL
 long 735
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_safcb_6a9cb625_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__69
 jmp #LODL
 long 882
 mov r2, RI ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_safcb_6a9cb625_waitS_amples_L000013 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__70
 mov r2, #4 ' reg ARG coni
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_safcc_6a9cb625_getn_L000021
 add SP, #4 ' CALL addrg
 jmp #LODI
 long @C_safc7_6a9cb625_buffer_L000009
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long @C_safc3_6a9cb625_dataptr_L000005
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #JMPA
 long @C_sne_playV_G_M__57 ' JUMPV addrg
C_sne_playV_G_M__71
 mov r2, #6 ' reg ARG coni
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_safcc_6a9cb625_getn_L000021
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_safc7_6a9cb625_buffer_L000009+1
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sne_playV_G_M__57 ' NEI4
 jmp #LODI
 long @C_safc1_6a9cb625_readptr_L000003
 mov r22, RI ' reg <- INDIRP4 addrg
 jmp #LODL
 long @C_safc2_6a9cb625_database_L000004
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 jmp #LODL
 long @C_safc3_6a9cb625_dataptr_L000005
 mov BC, r20
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #LODI
 long @C_safc7_6a9cb625_buffer_L000009+2
 mov r20, RI ' reg <- INDIRI4 addrg
 adds r22, r20 ' ADDI/P (2)
 jmp #LODL
 long @C_safc1_6a9cb625_readptr_L000003
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
C_sne_playV_G_M__57
C_sne_playV_G_M__50
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_sne_playV_G_M__49 ' NEI4
 jmp #LODI
 long @C_safc_6a9cb625_waitF_or_L000002
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitcnt ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_safce_6a9cb625_sne_flipR_egisters_L000037 ' CALL addrg
C_sne_playV_G_M__47
 jmp #JMPA
 long @C_sne_playV_G_M__46 ' JUMPV addrg
C_sne_playV_G_M__43
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _waitcnt

' Catalina Import _cnt

' Catalina Import _clockfreq

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_safc8_6a9cb625_speed_divisor_L000010 ' <symbol:speed_divisor>
 byte 0[4]

 alignl ' align long
C_safc7_6a9cb625_buffer_L000009 ' <symbol:buffer>
 byte 0[64]

 alignl ' align long
C_safc6_6a9cb625_looplength_L000008 ' <symbol:looplength>
 byte 0[4]

 alignl ' align long
C_safc5_6a9cb625_loopleft_L000007 ' <symbol:loopleft>
 byte 0[4]

 alignl ' align long
C_safc4_6a9cb625_loopptr_L000006 ' <symbol:loopptr>
 byte 0[4]

 alignl ' align long
C_safc3_6a9cb625_dataptr_L000005 ' <symbol:dataptr>
 byte 0[4]

 alignl ' align long
C_safc2_6a9cb625_database_L000004 ' <symbol:database>
 byte 0[4]

 alignl ' align long
C_safc1_6a9cb625_readptr_L000003 ' <symbol:readptr>
 byte 0[4]

 alignl ' align long
C_safc_6a9cb625_waitF_or_L000002 ' <symbol:waitFor>
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
