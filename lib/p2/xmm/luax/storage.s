' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_smac1_67ea4184_pstart_L000003 ' <symbol:pstart>
 long $0

 alignl ' align long
C_smac2_67ea4184_storageI_nitialized_L000004 ' <symbol:storageInitialized>
 byte $0

' Catalina Export mountFatVolume

' Catalina Code

DAT ' code segment

 alignl ' align long
C_mountF_atV_olume ' <symbol:mountFatVolume>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005
 mov r4, RI ' reg ARG ADDRG
 mov r5, #0 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_mountF_atV_olume_7 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_7
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005+450
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #11 wz
 jmp #BR_Z
 long @C_mountF_atV_olume_19 ' EQI4
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005+450
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #12 wz
 jmp #BR_Z
 long @C_mountF_atV_olume_19 ' EQI4
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005+450
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #4 wz
 jmp #BR_Z
 long @C_mountF_atV_olume_19 ' EQI4
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005+450
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #6 wz
 jmp #BR_Z
 long @C_mountF_atV_olume_19 ' EQI4
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005+450
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #14 wz
 jmp #BRNZ
 long @C_mountF_atV_olume_9 ' NEI4
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
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005
 jmp #PSHL ' stack ARG ADDRG
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__G_etP_tnS_tart
 add SP, #20 ' CALL addrg
 jmp #LODL
 long @C_smac1_67ea4184_pstart_L000003
 mov BC, r0
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #JMPA
 long @C_mountF_atV_olume_10 ' JUMPV addrg
C_mountF_atV_olume_9
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_smac1_67ea4184_pstart_L000003
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_10
 jmp #LODI
 long @C_smac1_67ea4184_pstart_L000003
 mov r22, RI ' reg <- INDIRU4 addrg
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_mountF_atV_olume_20 ' NEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_20
 jmp #LODL
 long @C_smac_67ea4184_vi_L000002
 mov r2, RI ' reg ARG ADDRG
 jmp #LODI
 long @C_smac1_67ea4184_pstart_L000003
 mov r3, RI ' reg ARG INDIR ADDRG
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005
 mov r4, RI ' reg ARG ADDRG
 mov r5, #0 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etV_olI_nfo
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_mountF_atV_olume_22 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_22
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C_smac2_67ea4184_storageI_nitialized_L000004
 mov BC, r22
 jmp #WBYT ' ASGNU1 addrg reg
 jmp #LODL
 long @C_smac_67ea4184_vi_L000002+1
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_mountF_atV_olume_24 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_24
 jmp #LODL
 long @C_smac_67ea4184_vi_L000002+1
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_mountF_atV_olume_27 ' NEI4
 mov r0, #2 ' reg <- coni
 jmp #JMPA
 long @C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_27
 jmp #LODL
 long @C_smac_67ea4184_vi_L000002+1
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_mountF_atV_olume_30 ' NEI4
 mov r0, #3 ' reg <- coni
 jmp #JMPA
 long @C_mountF_atV_olume_6 ' JUMPV addrg
C_mountF_atV_olume_30
 mov r0, #0 ' reg <- coni
C_mountF_atV_olume_6
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export buildfn

 alignl ' align long
C_buildfn ' <symbol:buildfn>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #13 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r19, #0 ' reg <- coni
C_buildfn_34
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #32 wz
 jmp #BR_Z
 long @C_buildfn_38 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r19 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_buildfn_38
' C_buildfn_35 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #8 wz,wc
 jmp #BR_B
 long @C_buildfn_34 ' LTI4
 mov r2, #3 ' reg ARG coni
 jmp #LODL
 long @C_buildfn_42_L000043
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21
 adds r4, #8 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strncmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_buildfn_40 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #46 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r19, #8 ' reg <- coni
C_buildfn_44
 mov r22, r19 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #32 wz
 jmp #BR_Z
 long @C_buildfn_48 ' EQI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r19 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_buildfn_48
' C_buildfn_45 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #11 wz,wc
 jmp #BR_B
 long @C_buildfn_44 ' LTI4
C_buildfn_40
' C_buildfn_33 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_smac5_67ea4184_upper_L000050 ' <symbol:upper>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_smac5_67ea4184_upper_L000050_53 ' JUMPV addrg
C_smac5_67ea4184_upper_L000050_52
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov r2, r20 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_toupper ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_smac5_67ea4184_upper_L000050_53
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_smac5_67ea4184_upper_L000050_52 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, r23
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
' C_smac5_67ea4184_upper_L000050_51 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export doDir

 alignl ' align long
C_doD_ir ' <symbol:doDir>
 jmp #NEWF
 sub SP, #80
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smac5_67ea4184_upper_L000050
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_smac2_67ea4184_storageI_nitialized_L000004
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_doD_ir_56 ' NEI4
 jmp #JMPA
 long @C_doD_ir_55 ' JUMPV addrg
C_doD_ir_56
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-44)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-52) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_smac_67ea4184_vi_L000002
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_doD_ir_62 ' EQU4
 jmp #JMPA
 long @C_doD_ir_60 ' JUMPV addrg
C_doD_ir_61
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_doD_ir_64 ' EQI4
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #CALA
 long @C_strlen ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_doD_ir_70 ' LEI4
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-68) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_amatch
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_doD_ir_71 ' EQI4
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
 jmp #CALI
 add SP, #8 ' CALL indirect
 jmp #JMPA
 long @C_doD_ir_71 ' JUMPV addrg
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
 jmp #CALI
 add SP, #8 ' CALL indirect
C_doD_ir_71
C_doD_ir_64
C_doD_ir_62
 mov r2, FP
 sub r2, #-(-36) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-52) ' reg ARG ADDRLi
 jmp #LODL
 long @C_smac_67ea4184_vi_L000002
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_doD_ir_61 ' EQU4
C_doD_ir_60
C_doD_ir_55
 jmp #POPM ' restore registers
 add SP, #80 ' framesize
 jmp #RETF


 alignl ' align long
C_smac6_67ea4184_listF_ile_L000076 ' <symbol:listFile>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_smac6_67ea4184_listF_ile_L000076_78_L000079
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_printf
 add SP, #4 ' CALL addrg
' C_smac6_67ea4184_listF_ile_L000076_77 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export listDir

 alignl ' align long
C_listD_ir ' <symbol:listDir>
 jmp #NEWF
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_smac6_67ea4184_listF_ile_L000076
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_doD_ir
 add SP, #8 ' CALL addrg
' C_listD_ir_80 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export listDirStart

 alignl ' align long
C_listD_irS_tart ' <symbol:listDirStart>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_smac2_67ea4184_storageI_nitialized_L000004
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_listD_irS_tart_86 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_listD_irS_tart_85 ' JUMPV addrg
C_listD_irS_tart_86
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_smac3_67ea4184_fatscratch_L000005
 mov r22, RI ' reg <- addrg
 jmp #LODL
 long @C_smac8_67ea4184_sdi_L000081+8
 mov BC, r22 
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #LODL
 long @C_smac8_67ea4184_sdi_L000081
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_smac_67ea4184_vi_L000002
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_listD_irS_tart_89 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_listD_irS_tart_85 ' JUMPV addrg
C_listD_irS_tart_89
 mov r0, #0 ' reg <- coni
C_listD_irS_tart_85
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export listDirNext

 alignl ' align long
C_listD_irN_ext ' <symbol:listDirNext>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_listD_irN_ext_93 ' JUMPV addrg
C_listD_irN_ext_92
 jmp #LODL
 long @C_smac9_67ea4184_sde_L000082
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_listD_irN_ext_95 ' EQI4
 jmp #LODL
 long @C_smac9_67ea4184_sde_L000082
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_smacb_67ea4184_fnam_L000084
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_buildfn
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_listD_irN_ext_97 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_smac5_67ea4184_upper_L000050
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 jmp #LODL
 long @C_smacb_67ea4184_fnam_L000084
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_amatch
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_listD_irN_ext_98 ' EQI4
 jmp #LODL
 long @C_smacb_67ea4184_fnam_L000084
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_listD_irN_ext_101_L000102
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_smaca_67ea4184_snm_L000083
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_smaca_67ea4184_snm_L000083
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_listD_irN_ext_91 ' JUMPV addrg
C_listD_irN_ext_97
 jmp #LODL
 long @C_smacb_67ea4184_fnam_L000084
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_listD_irN_ext_101_L000102
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_smaca_67ea4184_snm_L000083
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_smaca_67ea4184_snm_L000083
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_listD_irN_ext_91 ' JUMPV addrg
C_listD_irN_ext_98
C_listD_irN_ext_95
C_listD_irN_ext_93
 jmp #LODL
 long @C_smac9_67ea4184_sde_L000082
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_smac8_67ea4184_sdi_L000081
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_smac_67ea4184_vi_L000002
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_listD_irN_ext_92 ' EQU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_listD_irN_ext_91
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import amatch

' Catalina Import strlen

' Catalina Import toupper

' Catalina Import strncmp

' Catalina Import memset

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_smacb_67ea4184_fnam_L000084 ' <symbol:fnam>
 byte 0[13]

 alignl ' align long
C_smaca_67ea4184_snm_L000083 ' <symbol:snm>
 byte 0[13]

 alignl ' align long
C_smac9_67ea4184_sde_L000082 ' <symbol:sde>
 byte 0[32]

 alignl ' align long
C_smac8_67ea4184_sdi_L000081 ' <symbol:sdi>
 byte 0[16]

 alignl ' align long
C_smac3_67ea4184_fatscratch_L000005 ' <symbol:fatscratch>
 byte 0[512]

 alignl ' align long
C_smac_67ea4184_vi_L000002 ' <symbol:vi>
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
C_smac6_67ea4184_listF_ile_L000076_78_L000079 ' <symbol:78>
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
