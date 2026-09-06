' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_sggg9_6a9cb76c_noiseR_eset_L000011 ' <symbol:noiseReset>
 long 0

 alignl_label
C_sggga_6a9cb76c_regist_L000012 ' <symbol:regist>
 long 0

' Catalina Code

DAT ' code segment

 alignl_label
C_sgggb_6a9cb76c_waitS_amples_L000013 ' <symbol:waitSamples>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_sggg1_6a9cb76c_readptr_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODI + (@C_sggg4_6a9cb76c_loopptr_L000006)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sgggb_6a9cb76c_waitS_amples_L000013_15)<<S32 ' LTU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sggg5_6a9cb76c_loopleft_L000007 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r23)<<S16A ' SUBU (1)
 alignl_p1
 long I32_LODA + (@C_sggg5_6a9cb76c_loopleft_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_label
C_sgggb_6a9cb76c_waitS_amples_L000013_15
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ac44 ' reg <- con
 alignl_p1
 long I32_LODI + (@C_sggg8_6a9cb76c_speed_divisor_L000010)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + RI<<D32 + (50)<<S32
 word I16A_CMP + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_sgggb_6a9cb76c_waitS_amples_L000013_17)<<S32 ' GEU4 reg coni
 alignl_p1
 long I32_MOVI + (r21)<<D32 +(50)<<S32 ' reg <- conli
 alignl_label
C_sgggb_6a9cb76c_waitS_amples_L000013_17
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sggg_6a9cb76c_waitF_or_L000002 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (1)
 alignl_p1
 long I32_LODA + (@C_sggg_6a9cb76c_waitF_or_L000002)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_LODI + (@C_sggg_6a9cb76c_waitF_or_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (100)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_sgggb_6a9cb76c_waitS_amples_L000013_19)<<S32 ' GEU4 reg coni
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODA + (@C_sggg_6a9cb76c_waitF_or_L000002)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_label
C_sgggb_6a9cb76c_waitS_amples_L000013_19
' C_sgggb_6a9cb76c_waitS_amples_L000013_14 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sgggc_6a9cb76c_getn_L000021 ' <symbol:getn>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sggg1_6a9cb76c_readptr_L000003)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_memcpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sggg1_6a9cb76c_readptr_L000003 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODA + (@C_sggg1_6a9cb76c_readptr_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
' C_sgggc_6a9cb76c_getn_L000021_22 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export sne_setRegister

 alignl_label
C_sne_setR_egister ' <symbol:sne_setRegister>
 alignl_p1
 long I32_PSHM + $550000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_setR_egister_24)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_setR_egister_26)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sggga_6a9cb76c_regist_L000012 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_SARI + (r18)<<D16A + (4)<<S16A ' SHRI4 reg coni
 word I16A_MOVI + (r16)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODA + (@C_sggga_6a9cb76c_regist_L000012)<<S32
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r18)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long 1008 ' reg <- con
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_MOVI + (r16)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sne_setR_egister_27)<<S32 ' JUMPV addrg
 alignl_label
C_sne_setR_egister_26
 alignl_p1
 long I32_LODI + (@C_sggga_6a9cb76c_regist_L000012)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sne_setR_egister_30)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sne_setR_egister_28)<<S32 ' LEI4 reg coni
 alignl_label
C_sne_setR_egister_30
 alignl_p1
 long I32_LODI + (@C_sggga_6a9cb76c_regist_L000012)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sne_setR_egister_29)<<S32 ' JUMPV addrg
 alignl_label
C_sne_setR_egister_28
 alignl_p1
 long I32_LODI + (@C_sggga_6a9cb76c_regist_L000012)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r18)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r18)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r18)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_sne_setR_egister_29
 alignl_label
C_sne_setR_egister_27
 alignl_p1
 long I32_LODI + (@C_sggga_6a9cb76c_regist_L000012)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sne_setR_egister_31)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_sggg9_6a9cb76c_noiseR_eset_L000011)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C_sne_setR_egister_31
 alignl_label
C_sne_setR_egister_24
' C_sne_setR_egister_23 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sgggd_6a9cb76c_sne_updateR_egisters_L000033 ' <symbol:sne_updateRegisters>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sgggd_6a9cb76c_sne_updateR_egisters_L000033_35)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_memmove)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sgggd_6a9cb76c_sne_updateR_egisters_L000033_35
' C_sgggd_6a9cb76c_sne_updateR_egisters_L000033_34 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sggge_6a9cb76c_sne_flipR_egisters_L000037 ' <symbol:sne_flipRegisters>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sggge_6a9cb76c_sne_flipR_egisters_L000037_39)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODI + (@C_sggg9_6a9cb76c_noiseR_eset_L000011)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sggge_6a9cb76c_sne_flipR_egisters_L000037_41)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(255)<<S32 ' reg <- conli
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_sggg9_6a9cb76c_noiseR_eset_L000011)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_JMPA + (@C_sggge_6a9cb76c_sne_flipR_egisters_L000037_42)<<S32 ' JUMPV addrg
 alignl_label
C_sggge_6a9cb76c_sne_flipR_egisters_L000037_41
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(256)<<S32 ' reg <- conli
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_sggge_6a9cb76c_sne_flipR_egisters_L000037_42
 alignl_p1
 long I32_LODI + (@C_S_N_R_egisters)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sgggd_6a9cb76c_sne_updateR_egisters_L000033)<<S32 ' CALL addrg
 alignl_label
C_sggge_6a9cb76c_sne_flipR_egisters_L000037_39
' C_sggge_6a9cb76c_sne_flipR_egisters_L000037_38 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export sne_playVGM

 alignl_label
C_sne_playV_G_M_ ' <symbol:sne_playVGM>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sne_setF_req)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_sggg8_6a9cb76c_speed_divisor_L000010)<<S32
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((52)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODA + (@C_sggg1_6a9cb76c_readptr_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sggg4_6a9cb76c_loopptr_L000006 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODA + (@C_sggg4_6a9cb76c_loopptr_L000006)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playV_G_M__44)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sggg4_6a9cb76c_loopptr_L000006 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODA + (@C_sggg4_6a9cb76c_loopptr_L000006)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_label
C_sne_playV_G_M__44
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sggg6_6a9cb76c_looplength_L000008 ' reg <- addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODA + (@C_sggg6_6a9cb76c_looplength_L000008)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODA + (@C_sggg5_6a9cb76c_loopleft_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 10000000 ' reg <- con
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODA + (@C_sggg_6a9cb76c_waitF_or_L000002)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__47)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__46
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__50)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__49
 alignl_p1
 long I32_LODI + (@C_sggg5_6a9cb76c_loopleft_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sne_playV_G_M__52)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_LODI + (@C_sggg4_6a9cb76c_loopptr_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playV_G_M__54)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODI + (@C_sggg6_6a9cb76c_looplength_L000008)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playV_G_M__54)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODI + (@C_sggg6_6a9cb76c_looplength_L000008)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 alignl_p1
 long I32_LODA + (@C_sggg5_6a9cb76c_loopleft_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_p1
 long I32_LODI + (@C_sggg4_6a9cb76c_loopptr_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl_p1
 long I32_LODA + (@C_sggg1_6a9cb76c_readptr_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_label
C_sne_playV_G_M__54
 alignl_label
C_sne_playV_G_M__52
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sggg7_6a9cb76c_buffer_L000009 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sgggc_6a9cb76c_getn_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_sggg7_6a9cb76c_buffer_L000009)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (80)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_sne_playV_G_M__57)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (143)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_sne_playV_G_M__77)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sne_playV_G_M__78_L000080-320 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
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
 alignl_label
C_sne_playV_G_M__77
 alignl_p1
 long I32_MOVI + RI<<D32 + (224)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playV_G_M__70)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__58
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sggg7_6a9cb76c_buffer_L000009 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sgggc_6a9cb76c_getn_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_sggg7_6a9cb76c_buffer_L000009)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sne_setR_egister)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__59
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sggg7_6a9cb76c_buffer_L000009 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sgggc_6a9cb76c_getn_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_sggg7_6a9cb76c_buffer_L000009)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (83)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sne_playV_G_M__57)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__62
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sne_playV_G_M__57)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sgggb_6a9cb76c_waitS_amples_L000013)<<S32 ' CALL addrg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__65
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sgggb_6a9cb76c_waitS_amples_L000013)<<S32 ' CALL addrg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__66
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sggg7_6a9cb76c_buffer_L000009 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sgggc_6a9cb76c_getn_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_sggg7_6a9cb76c_buffer_L000009)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODA + (@C_sggg7_6a9cb76c_buffer_L000009+1)<<S32
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (8)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sgggb_6a9cb76c_waitS_amples_L000013)<<S32 ' CALL addrg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__68
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((735)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sgggb_6a9cb76c_waitS_amples_L000013)<<S32 ' CALL addrg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__69
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((882)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sgggb_6a9cb76c_waitS_amples_L000013)<<S32 ' CALL addrg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__70
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sggg7_6a9cb76c_buffer_L000009 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sgggc_6a9cb76c_getn_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_sggg7_6a9cb76c_buffer_L000009)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 alignl_p1
 long I32_LODA + (@C_sggg3_6a9cb76c_dataptr_L000005)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__57)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__71
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sggg7_6a9cb76c_buffer_L000009 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sgggc_6a9cb76c_getn_L000021)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_sggg7_6a9cb76c_buffer_L000009+1)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sne_playV_G_M__57)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sggg1_6a9cb76c_readptr_L000003 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODA + (@C_sggg2_6a9cb76c_database_L000004)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_LODA + (@C_sggg3_6a9cb76c_dataptr_L000005)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_LODI + (@C_sggg7_6a9cb76c_buffer_L000009+2)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODA + (@C_sggg1_6a9cb76c_readptr_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_label
C_sne_playV_G_M__57
 alignl_label
C_sne_playV_G_M__50
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sne_playV_G_M__49)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODI + (@C_sggg_6a9cb76c_waitF_or_L000002)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitcnt)<<S32 ' CALL addrg
 alignl_p1
 long I32_CALA + (@C_sggge_6a9cb76c_sne_flipR_egisters_L000037)<<S32 ' CALL addrg
 alignl_label
C_sne_playV_G_M__47
 alignl_p1
 long I32_JMPA + (@C_sne_playV_G_M__46)<<S32 ' JUMPV addrg
 alignl_label
C_sne_playV_G_M__43
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _waitcnt

' Catalina Import _cnt

' Catalina Import _clockfreq

' Catalina Data

DAT ' uninitialized data segment

 alignl_label
C_sggg8_6a9cb76c_speed_divisor_L000010 ' <symbol:speed_divisor>
 byte 0[4]

 alignl_label
C_sggg7_6a9cb76c_buffer_L000009 ' <symbol:buffer>
 byte 0[64]

 alignl_label
C_sggg6_6a9cb76c_looplength_L000008 ' <symbol:looplength>
 byte 0[4]

 alignl_label
C_sggg5_6a9cb76c_loopleft_L000007 ' <symbol:loopleft>
 byte 0[4]

 alignl_label
C_sggg4_6a9cb76c_loopptr_L000006 ' <symbol:loopptr>
 byte 0[4]

 alignl_label
C_sggg3_6a9cb76c_dataptr_L000005 ' <symbol:dataptr>
 byte 0[4]

 alignl_label
C_sggg2_6a9cb76c_database_L000004 ' <symbol:database>
 byte 0[4]

 alignl_label
C_sggg1_6a9cb76c_readptr_L000003 ' <symbol:readptr>
 byte 0[4]

 alignl_label
C_sggg_6a9cb76c_waitF_or_L000002 ' <symbol:waitFor>
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
