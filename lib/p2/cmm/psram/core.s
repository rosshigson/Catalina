' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_simg_68dcc298_startupD_ata_L000002 ' <symbol:startupData>
 long $0

 alignl_label
C_simg1_68dcc298_deviceD_ata_L000003 ' <symbol:deviceData>
 long $0

 alignl_label
C_simg2_68dcc298_Q_osD_ata_L000004 ' <symbol:QosData>
 long $0

 alignl_label
C_simg3_68dcc298_mailboxes_L000005 ' <symbol:mailboxes>
 long $0

 alignl_label
C_simg4_68dcc298_drivercog_L000006 ' <symbol:drivercog>
 long -1

 alignl_label
C_simg5_68dcc298_driverlock_L000007 ' <symbol:driverlock>
 long -1

 alignl_label
C_simg6_68dcc298_delayT_able_L000008 ' <symbol:delayTable>
 long $7
 long $57bcf00
 long $8f0d180
 long $c474f80
 long $f60c480
 long $127a3980
 long $13d92d40
 long $0

' Catalina Export psram_getMailbox

' Catalina Code

DAT ' code segment

 alignl_label
C_psram_getM_ailbox ' <symbol:psram_getMailbox>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_simg3_68dcc298_mailboxes_L000005)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
' C_psram_getM_ailbox_9 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export psram_initialize

 alignl_label
C_psram_initialize ' <symbol:psram_initialize>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $554000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_simg_68dcc298_startupD_ata_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_psram_initialize_11)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (28)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_simg4_68dcc298_drivercog_L000006)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODI + (@C_simg4_68dcc298_drivercog_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_psram_initialize_13)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 alignl_p1
 long I32_LODI + (@C_simg4_68dcc298_drivercog_L000006)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_simg_68dcc298_startupD_ata_L000002 ' reg <- addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (2)
 alignl_p1
 long I32_LODA + (@C_simg_68dcc298_startupD_ata_L000002)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_simg1_68dcc298_deviceD_ata_L000003 ' reg <- addrg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODA + (@C_simg1_68dcc298_deviceD_ata_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_simg2_68dcc298_Q_osD_ata_L000004 ' reg <- addrg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r14)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r14)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODA + (@C_simg2_68dcc298_Q_osD_ata_L000004)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODA + (@C_simg3_68dcc298_mailboxes_L000005)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_simg5_68dcc298_driverlock_L000007 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r18)<<S16A
 word I16A_SHRI + (r20)<<D16A + (24)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_LODA + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_psram_initialize_15)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODI + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_psram_initialize_16)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_LODI + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_simg4_68dcc298_drivercog_L000006)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_psram_initialize_16)<<S32 ' JUMPV addrg
 alignl_label
C_psram_initialize_15
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_simg5_68dcc298_driverlock_L000007 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_p1
 long I32_LODA + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C_psram_initialize_16
 alignl_label
C_psram_initialize_13
 alignl_label
C_psram_initialize_11
 alignl_p1
 long I32_LODI + (@C_simg4_68dcc298_drivercog_L000006)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
' C_psram_initialize_10 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export psram_stop

 alignl_label
C_psram_stop ' <symbol:psram_stop>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_psram_stop_20)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__cogstop)<<S32 ' CALL addrg
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_psram_stop_22
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_psram_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_psram_stop_26)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_label
C_psram_stop_26
' C_psram_stop_23 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_B + (@C_psram_stop_22)<<S32 ' LTI4 reg coni
 alignl_label
C_psram_stop_20
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_simg4_68dcc298_drivercog_L000006)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_LODI + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_psram_stop_28)<<S32 ' EQI4 reg reg
 alignl_p1
 long I32_LODI + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockret)<<S32 ' CALL addrg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C_psram_stop_28
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_psram_stop_19 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export psram_getDriverLock

 alignl_label
C_psram_getD_riverL_ock ' <symbol:psram_getDriverLock>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
' C_psram_getD_riverL_ock_30 ' (symbol refcount = 0)
 word I16B_RETF + 0<<S32
 alignl_p1

 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031 ' <symbol:psram_modifyBankParams>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODI + (@C_simg4_68dcc298_drivercog_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_33)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-15)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_32)<<S32 ' JUMPV addrg
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_33
 alignl_p1
 long I32_LODI + (@C_simg4_68dcc298_drivercog_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_psram_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_36)<<S32 ' JUMPV addrg
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_35
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_36
 alignl_p1
 long I32_LODI + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_35)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_38
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_simg1_68dcc298_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r13)<<D16A + (r21)<<S16A ' BORI/U (3)
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((224)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r18)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_42
 word I16A_RDLONG + (r19)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
' C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_43 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_42)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_45)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_simg1_68dcc298_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_46)<<S32 ' JUMPV addrg
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_45
 word I16A_NEG + (r19)<<D16A + (r19)<<S16A ' NEGI4
 alignl_p1
 long I32_JMPA + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_40)<<S32 ' JUMPV addrg
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_46
' C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_39 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BR_B + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_38)<<S32 ' LTI4 reg coni
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_40
 alignl_p1
 long I32_LODI + (@C_simg5_68dcc298_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031_32
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_simg8_68dcc298_psram_lookupD_elay_L000047 ' <symbol:psram_lookupDelay>
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_simg6_68dcc298_delayT_able_L000008 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_simg8_68dcc298_psram_lookupD_elay_L000047_50)<<S32 ' JUMPV addrg
 alignl_label
C_simg8_68dcc298_psram_lookupD_elay_L000047_49
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_simg6_68dcc298_delayT_able_L000008+4 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_simg8_68dcc298_psram_lookupD_elay_L000047_53)<<S32 ' GEU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_simg8_68dcc298_psram_lookupD_elay_L000047_51)<<S32 ' JUMPV addrg
 alignl_label
C_simg8_68dcc298_psram_lookupD_elay_L000047_53
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_simg8_68dcc298_psram_lookupD_elay_L000047_50
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_simg6_68dcc298_delayT_able_L000008+4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_simg8_68dcc298_psram_lookupD_elay_L000047_49)<<S32 ' NEU4 reg coni
 alignl_label
C_simg8_68dcc298_psram_lookupD_elay_L000047_51
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_simg8_68dcc298_psram_lookupD_elay_L000047_48 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export psram_setDelay

 alignl_label
C_psram_setD_elay ' <symbol:psram_setDelay>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r2)<<D16A + (12)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-61441)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_psram_setD_elay_56 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export psram_setFrequency

 alignl_label
C_psram_setF_requency ' <symbol:psram_setFrequency>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_psram_setF_requency_58)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_psram_setF_requency_58
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_simg8_68dcc298_psram_lookupD_elay_L000047)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_psram_setD_elay)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_psram_setF_requency_57 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export psram_getDelay

 alignl_label
C_psram_getD_elay ' <symbol:psram_getDelay>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_simg1_68dcc298_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SARI + (r22)<<D16A + (12)<<S16A ' SHRI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r0)<<D16A + (r20)<<S16A ' BANDI/U (3)
' C_psram_getD_elay_60 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export psram_setBurst

 alignl_label
C_psram_setB_urst ' <symbol:psram_setBurst>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r2)<<D16A + (16)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((65535)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_simg7_68dcc298_psram_modifyB_ankP_arams_L000031)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_psram_setB_urst_61 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export psram_getBurst

 alignl_label
C_psram_getB_urst ' <symbol:psram_getBurst>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODI + (@C_simg1_68dcc298_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_SARI + (r0)<<D16A + (16)<<S16A ' SHRI4 reg coni
' C_psram_getB_urst_62 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export psram_setQos

 alignl_label
C_psram_setQ_os ' <symbol:psram_setQos>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_NEGI + (r15)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_psram_setQ_os_64)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-15)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_psram_setQ_os_63)<<S32 ' JUMPV addrg
 alignl_label
C_psram_setQ_os_64
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_psram_setQ_os_68)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (7)<<S16A
 alignl_p1
 long I32_BRBE + (@C_psram_setQ_os_66)<<S32 ' LEI4 reg coni
 alignl_label
C_psram_setQ_os_68
 alignl_p1
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C_psram_setQ_os_63)<<S32 ' JUMPV addrg
 alignl_label
C_psram_setQ_os_66
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_simg2_68dcc298_Q_osD_ata_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((-512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_psram_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_psram_getD_riverL_ock)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_psram_setQ_os_70)<<S32 ' JUMPV addrg
 alignl_label
C_psram_setQ_os_69
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_label
C_psram_setQ_os_70
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_psram_setQ_os_69)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((240)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_psram_setQ_os_73)<<S32 ' JUMPV addrg
 alignl_label
C_psram_setQ_os_72
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl_label
C_psram_setQ_os_73
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_psram_setQ_os_72)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_label
C_psram_setQ_os_63
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export psram_getQos

 alignl_label
C_psram_getQ_os ' <symbol:psram_getQos>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C_psram_initialize)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODI + (@C_simg2_68dcc298_Q_osD_ata_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
' C_psram_getQ_os_75 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _locate_plugin

' Catalina Import _registry

' Catalina Import _locktry

' Catalina Import _lockret

' Catalina Import _locknew

' Catalina Import _waitms

' Catalina Import _lockclr

' Catalina Import _cogstop

' Catalina Import _cogid

' Catalina Import _clockfreq
' end
