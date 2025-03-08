' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s3ck1_67cacca9_pstart_L000003 ' <symbol:pstart>
 long $0

 alignl ' align long
C_s3ck2_67cacca9_storageI_nitialized_L000004 ' <symbol:storageInitialized>
 byte $0

' Catalina Export mountFatVolume

' Catalina Code

DAT ' code segment

 alignl ' align long
C_mountF_atV_olume ' <symbol:mountFatVolume>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck3_67cacca9_fatscratch_L000005 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck3_67cacca9_fatscratch_L000005 ' reg ARG ADDRG
 word I16A_MOVI + (r5)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__R_eadS_ector)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_mountF_atV_olume_7)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_mountF_atV_olume_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_mountF_atV_olume_7
 alignl ' align long
 long I32_LODA + (@C_s3ck3_67cacca9_fatscratch_L000005+450)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_mountF_atV_olume_19)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_s3ck3_67cacca9_fatscratch_L000005+450)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (12)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_mountF_atV_olume_19)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_s3ck3_67cacca9_fatscratch_L000005+450)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_mountF_atV_olume_19)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_s3ck3_67cacca9_fatscratch_L000005+450)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_mountF_atV_olume_19)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_s3ck3_67cacca9_fatscratch_L000005+450)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (14)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_mountF_atV_olume_9)<<S32 ' NEI4 reg coni
 alignl ' align long
C_mountF_atV_olume_19
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 alignl ' align long
 long I32_LODA + (@C_s3ck3_67cacca9_fatscratch_L000005)<<S32
 word I16B_PSHL ' stack ARG ADDRG
 word I16A_MOVI + RI<<D16A + (0)<<S16A
 word I16B_PSHL ' stack ARG coni
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_D_F_S__G_etP_tnS_tart)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_s3ck1_67cacca9_pstart_L000003)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_JMPA + (@C_mountF_atV_olume_10)<<S32 ' JUMPV addrg
 alignl ' align long
C_mountF_atV_olume_9
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_s3ck1_67cacca9_pstart_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_mountF_atV_olume_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_mountF_atV_olume_10
 alignl ' align long
 long I32_LODI + (@C_s3ck1_67cacca9_pstart_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_mountF_atV_olume_20)<<S32 ' NEU4 reg reg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_mountF_atV_olume_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_mountF_atV_olume_20
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s3ck_67cacca9_vi_L000002 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODI + (@C_s3ck1_67cacca9_pstart_L000003)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck3_67cacca9_fatscratch_L000005 ' reg ARG ADDRG
 word I16A_MOVI + (r5)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_D_F_S__G_etV_olI_nfo)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_mountF_atV_olume_22)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_mountF_atV_olume_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_mountF_atV_olume_22
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_s3ck2_67cacca9_storageI_nitialized_L000004)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 alignl ' align long
 long I32_LODA + (@C_s3ck_67cacca9_vi_L000002+1)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_mountF_atV_olume_24)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_mountF_atV_olume_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_mountF_atV_olume_24
 alignl ' align long
 long I32_LODA + (@C_s3ck_67cacca9_vi_L000002+1)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_mountF_atV_olume_27)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_mountF_atV_olume_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_mountF_atV_olume_27
 alignl ' align long
 long I32_LODA + (@C_s3ck_67cacca9_vi_L000002+1)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_mountF_atV_olume_30)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_mountF_atV_olume_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_mountF_atV_olume_30
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_mountF_atV_olume_6
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export buildfn

 alignl ' align long
C_buildfn ' <symbol:buildfn>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (13)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_buildfn_34
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_buildfn_38)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_buildfn_38
' C_buildfn_35 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_buildfn_34)<<S32 ' LTI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_buildfn_42_L000043 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncmp)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_buildfn_40)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(46)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r19)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
C_buildfn_44
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_buildfn_48)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_buildfn_48
' C_buildfn_45 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (11)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_buildfn_44)<<S32 ' LTI4 reg coni
 alignl ' align long
C_buildfn_40
' C_buildfn_33 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s3ck5_67cacca9_upper_L000050 ' <symbol:upper>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_s3ck5_67cacca9_upper_L000050_53)<<S32 ' JUMPV addrg
 alignl ' align long
C_s3ck5_67cacca9_upper_L000050_52
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_toupper)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_s3ck5_67cacca9_upper_L000050_53
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s3ck5_67cacca9_upper_L000050_52)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r23)<<S16A ' ASGNU1 reg reg
' C_s3ck5_67cacca9_upper_L000050_51 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export doDir

 alignl ' align long
C_doD_ir ' <symbol:doDir>
 alignl ' align long
 long I32_NEWF + 80<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s3ck5_67cacca9_upper_L000050)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_s3ck2_67cacca9_storageI_nitialized_L000004)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_doD_ir_56)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_doD_ir_55)<<S32 ' JUMPV addrg
 alignl ' align long
C_doD_ir_56
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck3_67cacca9_fatscratch_L000005 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_s3ck3_67cacca9_fatscratch_L000005 ' reg <- addrg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck_67cacca9_vi_L000002 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__O_penD_ir)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_doD_ir_62)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_doD_ir_60)<<S32 ' JUMPV addrg
 alignl ' align long
C_doD_ir_61
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_doD_ir_64)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_buildfn)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-7)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (8)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-6)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-5)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r17)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_doD_ir_70)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_amatch)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_doD_ir_71)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-25)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16B_CALI
 alignl ' align long
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL indirect
 alignl ' align long
 long I32_JMPA + (@C_doD_ir_71)<<S32 ' JUMPV addrg
 alignl ' align long
C_doD_ir_70
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-25)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-68)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 word I16A_MOV + RI<<D16A + (r19)<<S16A
 word I16B_CALI
 alignl ' align long
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL indirect
 alignl ' align long
C_doD_ir_71
 alignl ' align long
C_doD_ir_64
 alignl ' align long
C_doD_ir_62
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-52)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck_67cacca9_vi_L000002 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__G_etN_ext)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_doD_ir_61)<<S32 ' EQU4 reg coni
 alignl ' align long
C_doD_ir_60
 alignl ' align long
C_doD_ir_55
 word I16B_POPM + 20<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s3ck6_67cacca9_listF_ile_L000076 ' <symbol:listFile>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s3ck6_67cacca9_listF_ile_L000076_78_L000079 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_printf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s3ck6_67cacca9_listF_ile_L000076_77 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export listDir

 alignl ' align long
C_listD_ir ' <symbol:listDir>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s3ck6_67cacca9_listF_ile_L000076 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_doD_ir)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_listD_ir_80 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export listDirStart

 alignl ' align long
C_listD_irS_tart ' <symbol:listDirStart>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODA + (@C_s3ck2_67cacca9_storageI_nitialized_L000004)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_listD_irS_tart_86)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_listD_irS_tart_85)<<S32 ' JUMPV addrg
 alignl ' align long
C_listD_irS_tart_86
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck3_67cacca9_fatscratch_L000005 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_s3ck3_67cacca9_fatscratch_L000005 ' reg <- addrg
 alignl ' align long
 long I32_LODA + (@C_s3ck8_67cacca9_sdi_L000081+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s3ck8_67cacca9_sdi_L000081 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck_67cacca9_vi_L000002 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__O_penD_ir)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_listD_irS_tart_89)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_listD_irS_tart_85)<<S32 ' JUMPV addrg
 alignl ' align long
C_listD_irS_tart_89
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_listD_irS_tart_85
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export listDirNext

 alignl ' align long
C_listD_irN_ext ' <symbol:listDirNext>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_JMPA + (@C_listD_irN_ext_93)<<S32 ' JUMPV addrg
 alignl ' align long
C_listD_irN_ext_92
 alignl ' align long
 long I32_LODA + (@C_s3ck9_67cacca9_sde_L000082)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_listD_irN_ext_95)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s3ck9_67cacca9_sde_L000082 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s3ckb_67cacca9_fnam_L000084 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_buildfn)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_listD_irN_ext_97)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s3ck5_67cacca9_upper_L000050)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s3ckb_67cacca9_fnam_L000084 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_amatch)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_listD_irN_ext_98)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s3ckb_67cacca9_fnam_L000084 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_listD_irN_ext_101_L000102 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3cka_67cacca9_snm_L000083 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r0)<<D16B
 alignl ' align long
 long @C_s3cka_67cacca9_snm_L000083 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_listD_irN_ext_91)<<S32 ' JUMPV addrg
 alignl ' align long
C_listD_irN_ext_97
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s3ckb_67cacca9_fnam_L000084 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_listD_irN_ext_101_L000102 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3cka_67cacca9_snm_L000083 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sprintf)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r0)<<D16B
 alignl ' align long
 long @C_s3cka_67cacca9_snm_L000083 ' reg <- addrg
 alignl ' align long
 long I32_JMPA + (@C_listD_irN_ext_91)<<S32 ' JUMPV addrg
 alignl ' align long
C_listD_irN_ext_98
 alignl ' align long
C_listD_irN_ext_95
 alignl ' align long
C_listD_irN_ext_93
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_s3ck9_67cacca9_sde_L000082 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_s3ck8_67cacca9_sdi_L000081 ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_s3ck_67cacca9_vi_L000002 ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_D_F_S__G_etN_ext)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_listD_irN_ext_92)<<S32 ' EQU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C_listD_irN_ext_91
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import amatch

' Catalina Import strlen

' Catalina Import toupper

' Catalina Import strncmp

' Catalina Import memset

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s3ckb_67cacca9_fnam_L000084 ' <symbol:fnam>
 byte 0[13]

 alignl ' align long
C_s3cka_67cacca9_snm_L000083 ' <symbol:snm>
 byte 0[13]

 alignl ' align long
C_s3ck9_67cacca9_sde_L000082 ' <symbol:sde>
 byte 0[32]

 alignl ' align long
C_s3ck8_67cacca9_sdi_L000081 ' <symbol:sdi>
 byte 0[16]

 alignl ' align long
C_s3ck3_67cacca9_fatscratch_L000005 ' <symbol:fatscratch>
 byte 0[512]

 alignl ' align long
C_s3ck_67cacca9_vi_L000002 ' <symbol:vi>
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
C_s3ck6_67cacca9_listF_ile_L000076_78_L000079 ' <symbol:78>
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
