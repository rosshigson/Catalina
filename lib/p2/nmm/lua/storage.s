' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_srdg1_67b1112e_pstart_L000003 ' <symbol:pstart>
 long $0

 alignl ' align long
C_srdg2_67b1112e_storageI_nitialized_L000004 ' <symbol:storageInitialized>
 byte $0

' Catalina Export mountFatVolume

' Catalina Code

DAT ' code segment

 alignl ' align long
C_mountF_atV_olume ' <symbol:mountFatVolume>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $500000 ' save registers
 mov r2, ##512 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, ##@C_srdg3_67b1112e_fatscratch_L000005 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, ##@C_srdg3_67b1112e_fatscratch_L000005 ' reg ARG ADDRG
 mov r5, #0 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_mountF_atV_olume_7 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_7
 mov r22, ##@C_srdg3_67b1112e_fatscratch_L000005+450 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #11 wz
 if_z jmp #\C_mountF_atV_olume_19 ' EQI4
 mov r22, ##@C_srdg3_67b1112e_fatscratch_L000005+450 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #12 wz
 if_z jmp #\C_mountF_atV_olume_19 ' EQI4
 mov r22, ##@C_srdg3_67b1112e_fatscratch_L000005+450 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #4 wz
 if_z jmp #\C_mountF_atV_olume_19 ' EQI4
 mov r22, ##@C_srdg3_67b1112e_fatscratch_L000005+450 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #6 wz
 if_z jmp #\C_mountF_atV_olume_19 ' EQI4
 mov r22, ##@C_srdg3_67b1112e_fatscratch_L000005+450 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #14 wz
 if_nz jmp #\C_mountF_atV_olume_9 ' NEI4
C_mountF_atV_olume_19
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r22, #0 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C_srdg3_67b1112e_fatscratch_L000005
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov RI, #0
 wrlong RI, --PTRA ' stack ARG coni
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__G_etP_tnS_tart
 add SP, #20 ' CALL addrg
 wrlong r0, ##@C_srdg1_67b1112e_pstart_L000003 ' ASGNU4 addrg reg
 jmp #\@C_mountF_atV_olume_10 ' JUMPV addrg
C_mountF_atV_olume_9
 mov r22, #0 ' reg <- coni
 wrlong r22, ##@C_srdg1_67b1112e_pstart_L000003 ' ASGNU4 addrg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_10
 mov r22, ##@C_srdg1_67b1112e_pstart_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_mountF_atV_olume_20  ' NEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_20
 mov r2, ##@C_srdg_67b1112e_vi_L000002 ' reg ARG ADDRG
 mov r3, ##@C_srdg1_67b1112e_pstart_L000003
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, ##@C_srdg3_67b1112e_fatscratch_L000005 ' reg ARG ADDRG
 mov r5, #0 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etV_olI_nfo
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_mountF_atV_olume_22 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_22
 mov r22, #1 ' reg <- coni
 wrbyte r22, ##@C_srdg2_67b1112e_storageI_nitialized_L000004 ' ASGNU1 addrg reg
 mov r22, ##@C_srdg_67b1112e_vi_L000002+1 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_mountF_atV_olume_24 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_24
 mov r22, ##@C_srdg_67b1112e_vi_L000002+1 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_mountF_atV_olume_27 ' NEI4
 mov r0, #2 ' reg <- coni
 jmp #\@C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_27
 mov r22, ##@C_srdg_67b1112e_vi_L000002+1 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_mountF_atV_olume_30 ' NEI4
 mov r0, #3 ' reg <- coni
 jmp #\@C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_30
 mov r0, #0 ' reg <- coni
C_mountF_atV_olume_6
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export buildfn

 alignl ' align long
C_buildfn ' <symbol:buildfn>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #13 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r19, #0 ' reg <- coni
C_buildfn_34
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #32 wz
 if_z jmp #\C_buildfn_38 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r19 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_buildfn_38
' C_buildfn_35 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #8 wcz
 if_b jmp #\C_buildfn_34 ' LTI4
 mov r2, #3 ' reg ARG coni
 mov r3, ##@C_buildfn_42_L000043 ' reg ARG ADDRG
 mov r4, r21
 adds r4, #8 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_buildfn_40 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r19, #8 ' reg <- coni
C_buildfn_44
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #32 wz
 if_z jmp #\C_buildfn_48 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r19 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_buildfn_48
' C_buildfn_45 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #11 wcz
 if_b jmp #\C_buildfn_44 ' LTI4
C_buildfn_40
' C_buildfn_33 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_srdg5_67b1112e_upper_L000050 ' <symbol:upper>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_srdg5_67b1112e_upper_L000050_53 ' JUMPV addrg
C_srdg5_67b1112e_upper_L000050_52
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r2, r20 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_srdg5_67b1112e_upper_L000050_53
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_srdg5_67b1112e_upper_L000050_52 ' NEI4
 mov r22, #0 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
' C_srdg5_67b1112e_upper_L000050_51 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export doDir

 alignl ' align long
C_doD_ir ' <symbol:doDir>
 calld PA,#NEWF
 sub SP, #80
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_srdg5_67b1112e_upper_L000050
 add SP, #4 ' CALL addrg
 mov r22, ##@C_srdg2_67b1112e_storageI_nitialized_L000004 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_doD_ir_56 ' NEI4
 jmp #\@C_doD_ir_55 ' JUMPV addrg
C_doD_ir_56
 mov r2, ##512 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, ##@C_srdg3_67b1112e_fatscratch_L000005 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov RI, ##@C_srdg3_67b1112e_fatscratch_L000005
 mov BC, FP
 sub BC, #-(-44)
 wrlong RI, BC ' ASGNP4 addrli addrg
 mov r2, FP
 sub r2, #-(-52) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C_srdg_67b1112e_vi_L000002 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_doD_ir_62 ' EQU4
 jmp #\@C_doD_ir_60 ' JUMPV addrg
C_doD_ir_61
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_doD_ir_64 ' EQI4
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_buildfn
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, FP
 sub r20, #-(-7) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #8 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-6) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #16 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-5) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #24 ' LSHU4 coni
 mov r17, r22 ' BORI/U
 or r17, r20 ' BORI/U (3)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_doD_ir_70 ' LEI4
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_amatch
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_doD_ir_71 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-25) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 mov RI, r19
 calld PA,#CALI
 add SP, #8 ' CALL indirect
 jmp #\@C_doD_ir_71 ' JUMPV addrg
C_doD_ir_70
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-25) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-68) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 mov RI, r19
 calld PA,#CALI
 add SP, #8 ' CALL indirect
C_doD_ir_71
C_doD_ir_64
C_doD_ir_62
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 mov r4, ##@C_srdg_67b1112e_vi_L000002 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_doD_ir_61 ' EQU4
C_doD_ir_60
C_doD_ir_55
 calld PA,#POPM ' restore registers
 add SP, #80 ' framesize
 calld PA,#RETF


 alignl ' align long
C_srdg6_67b1112e_listF_ile_L000076 ' <symbol:listFile>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_srdg6_67b1112e_listF_ile_L000076_78_L000079 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_printf
 add SP, #4 ' CALL addrg
' C_srdg6_67b1112e_listF_ile_L000076_77 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export listDir

 alignl ' align long
C_listD_ir ' <symbol:listDir>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##@C_srdg6_67b1112e_listF_ile_L000076 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_doD_ir
 add SP, #8 ' CALL addrg
' C_listD_ir_80 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export listDirStart

 alignl ' align long
C_listD_irS_tart ' <symbol:listDirStart>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_srdg2_67b1112e_storageI_nitialized_L000004 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_listD_irS_tart_86 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_listD_irS_tart_85 ' JUMPV addrg
C_listD_irS_tart_86
 mov r2, ##512 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, ##@C_srdg3_67b1112e_fatscratch_L000005 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, ##@C_srdg3_67b1112e_fatscratch_L000005 ' reg <- addrg
 wrlong r22, ##@C_srdg8_67b1112e_sdi_L000081+8 ' ASGNP4 addrg reg
 mov r2, ##@C_srdg8_67b1112e_sdi_L000081 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C_srdg_67b1112e_vi_L000002 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_listD_irS_tart_89 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C_listD_irS_tart_85 ' JUMPV addrg
C_listD_irS_tart_89
 mov r0, #0 ' reg <- coni
C_listD_irS_tart_85
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export listDirNext

 alignl ' align long
C_listD_irN_ext ' <symbol:listDirNext>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #\@C_listD_irN_ext_93 ' JUMPV addrg
C_listD_irN_ext_92
 mov r22, ##@C_srdg9_67b1112e_sde_L000082 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_listD_irN_ext_95 ' EQI4
 mov r2, ##@C_srdg9_67b1112e_sde_L000082 ' reg ARG ADDRG
 mov r3, ##@C_srdgb_67b1112e_fnam_L000084 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_buildfn
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_listD_irN_ext_97 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_srdg5_67b1112e_upper_L000050
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, ##@C_srdgb_67b1112e_fnam_L000084 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_amatch
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_listD_irN_ext_98 ' EQI4
 mov r2, ##@C_srdgb_67b1112e_fnam_L000084 ' reg ARG ADDRG
 mov r3, ##@C_listD_irN_ext_101_L000102 ' reg ARG ADDRG
 mov r4, ##@C_srdga_67b1112e_snm_L000083 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r0, ##@C_srdga_67b1112e_snm_L000083 ' reg <- addrg
 jmp #\@C_listD_irN_ext_91 ' JUMPV addrg
C_listD_irN_ext_97
 mov r2, ##@C_srdgb_67b1112e_fnam_L000084 ' reg ARG ADDRG
 mov r3, ##@C_listD_irN_ext_101_L000102 ' reg ARG ADDRG
 mov r4, ##@C_srdga_67b1112e_snm_L000083 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r0, ##@C_srdga_67b1112e_snm_L000083 ' reg <- addrg
 jmp #\@C_listD_irN_ext_91 ' JUMPV addrg
C_listD_irN_ext_98
C_listD_irN_ext_95
C_listD_irN_ext_93
 mov r2, ##@C_srdg9_67b1112e_sde_L000082 ' reg ARG ADDRG
 mov r3, ##@C_srdg8_67b1112e_sdi_L000081 ' reg ARG ADDRG
 mov r4, ##@C_srdg_67b1112e_vi_L000002 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_listD_irN_ext_92 ' EQU4
 mov r0, ##0 ' RET con
C_listD_irN_ext_91
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Import amatch

' Catalina Import strlen

' Catalina Import toupper

' Catalina Import strncmp

' Catalina Import memset

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_srdgb_67b1112e_fnam_L000084 ' <symbol:fnam>
 byte 0[13]

 alignl ' align long
C_srdga_67b1112e_snm_L000083 ' <symbol:snm>
 byte 0[13]

 alignl ' align long
C_srdg9_67b1112e_sde_L000082 ' <symbol:sde>
 byte 0[32]

 alignl ' align long
C_srdg8_67b1112e_sdi_L000081 ' <symbol:sdi>
 byte 0[16]

 alignl ' align long
C_srdg3_67b1112e_fatscratch_L000005 ' <symbol:fatscratch>
 byte 0[512]

 alignl ' align long
C_srdg_67b1112e_vi_L000002 ' <symbol:vi>
 byte 0[52]

' Catalina Code

DAT ' code segment

' Catalina Import DFS_GetNext

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import DFS_OpenDir

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import DFS_GetVolInfo

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import DFS_GetPtnStart

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import DFS_ReadSector

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import sprintf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import printf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_listD_irN_ext_101_L000102 ' <symbol:101>
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_srdg6_67b1112e_listF_ile_L000076_78_L000079 ' <symbol:78>
 byte 37
 byte 115
 byte 10
 byte 0

 alignl ' align long
C_buildfn_42_L000043 ' <symbol:42>
 byte 32
 byte 32
 byte 32
 byte 0

' Catalina Code

DAT ' code segment
' end
