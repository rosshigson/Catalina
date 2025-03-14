' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_shtc_67d10fe5_startupD_ata_L000002 ' <symbol:startupData>
 long $0

 alignl ' align long
C_shtc1_67d10fe5_deviceD_ata_L000003 ' <symbol:deviceData>
 long $0

 alignl ' align long
C_shtc2_67d10fe5_Q_osD_ata_L000004 ' <symbol:QosData>
 long $0

 alignl ' align long
C_shtc3_67d10fe5_mailboxes_L000005 ' <symbol:mailboxes>
 long $0

 alignl ' align long
C_shtc4_67d10fe5_drivercog_L000006 ' <symbol:drivercog>
 long -1

 alignl ' align long
C_shtc5_67d10fe5_driverlock_L000007 ' <symbol:driverlock>
 long -1

 alignl ' align long
C_shtc6_67d10fe5_delayT_able_r_L000008 ' <symbol:delayTable_r>
 long $6
 long $57bcf00
 long $80befc0
 long $b34a700
 long $df28e80
 long $10b07600
 long $125bb500
 long $0

 alignl ' align long
C_shtc7_67d10fe5_delayT_able_f_L000009 ' <symbol:delayTable_f>
 long $5
 long $42c1d80
 long $68e7780
 long $9896800
 long $d693a40
 long $1082af40
 long $1312d000
 long $0

' Catalina Export hyper_getMailbox

' Catalina Code

DAT ' code segment

 alignl ' align long
C_hyper_getM_ailbox ' <symbol:hyper_getMailbox>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc3_67d10fe5_mailboxes_L000005)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
' C_hyper_getM_ailbox_10 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export hyper_initialize

 alignl ' align long
C_hyper_initialize ' <symbol:hyper_initialize>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $554000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_shtc_67d10fe5_startupD_ata_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_initialize_12)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (26)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_initialize_14)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffffff ' reg <- con
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
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
 alignl ' align long
 long @C_shtc_67d10fe5_startupD_ata_L000002 ' reg <- addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (2)
 alignl ' align long
 long I32_LODA + (@C_shtc_67d10fe5_startupD_ata_L000002)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_shtc1_67d10fe5_deviceD_ata_L000003 ' reg <- addrg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODA + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_shtc2_67d10fe5_Q_osD_ata_L000004 ' reg <- addrg
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_LODS + (r14)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r14)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODA + (@C_shtc2_67d10fe5_Q_osD_ata_L000004)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODA + (@C_shtc3_67d10fe5_mailboxes_L000005)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_shtc5_67d10fe5_driverlock_L000007 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r18)<<S16A
 word I16A_SHRI + (r20)<<D16A + (24)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_LODA + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_initialize_16)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_initialize_17)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hyper_initialize_17)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_initialize_16
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_shtc5_67d10fe5_driverlock_L000007 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_hyper_initialize_17
 alignl ' align long
C_hyper_initialize_14
 alignl ' align long
C_hyper_initialize_12
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
' C_hyper_initialize_11 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_stop

 alignl ' align long
C_hyper_stop ' <symbol:hyper_stop>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hyper_stop_21)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__cogstop)<<S32 ' CALL addrg
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_hyper_stop_23
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hyper_stop_27)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_hyper_stop_27
' C_hyper_stop_24 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_stop_23)<<S32 ' LTI4 reg coni
 alignl ' align long
C_hyper_stop_21
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_LODA + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hyper_stop_29)<<S32 ' EQI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockret)<<S32 ' CALL addrg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_LODA + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_hyper_stop_29
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_hyper_stop_20 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getDriverCogId

 alignl ' align long
C_hyper_getD_riverC_ogI_d ' <symbol:hyper_getDriverCogId>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
' C_hyper_getD_riverC_ogI_d_31 ' (symbol refcount = 0)
 word I16B_RETF + 0<<S32
 alignl ' align long

' Catalina Export hyper_getDriverLock

 alignl ' align long
C_hyper_getD_riverL_ock ' <symbol:hyper_getDriverLock>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
' C_hyper_getD_riverL_ock_32 ' (symbol refcount = 0)
 word I16B_RETF + 0<<S32
 alignl ' align long

 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033 ' <symbol:hyper_getStartBank>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (25)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_35)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (14)<<S16A ' reg <- coni
 word I16A_AND + (r23)<<D16A + (r22)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_JMPA + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_36)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_35
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (26)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_37)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_AND + (r23)<<D16A + (r22)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_JMPA + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_38)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_37
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (27)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_39)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r23)<<D16A + (r22)<<S16A ' BANDI/U (1)
 alignl ' align long
 long I32_JMPA + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_40)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_39
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (28)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_41)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_42)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_41
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (28)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_43)<<S32 ' LEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_34)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_43
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_42
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_40
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_38
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_36
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033_34
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getFlashSize

 alignl ' align long
C_hyper_getF_lashS_ize ' <symbol:hyper_getFlashSize>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((1024)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_getF_lashS_ize_46)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-22)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_getF_lashS_ize_45)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_getF_lashS_ize_46
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_hyper_getF_lashS_ize_45
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getFlashBurstSize

 alignl ' align long
C_hyper_getF_lashB_urstS_ize ' <symbol:hyper_getFlashBurstSize>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((1024)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_getF_lashB_urstS_ize_49)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-22)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_getF_lashB_urstS_ize_48)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_getF_lashB_urstS_ize_49
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_hyper_getF_lashB_urstS_ize_48
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_readRaw

 alignl ' align long
C_hyper_readR_aw ' <symbol:hyper_readRaw>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ffa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hyper_readR_aw_55)<<S32 ' GEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-28)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_readR_aw_51)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_readR_aw_54
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl ' align long
C_hyper_readR_aw_55
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hyper_readR_aw_54)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((144)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long $f000000 ' reg <- con
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_hyper_readR_aw_57
 word I16A_RDLONG + (r17)<<D16A + (r15)<<S16A ' reg <- INDIRI4 reg
' C_hyper_readR_aw_58 ' (symbol refcount = 0)
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_readR_aw_57)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hyper_readR_aw_61)<<S32 ' LEI4 reg coni
 word I16A_NEG + (r13)<<D16A + (r17)<<S16A ' NEGI4
 alignl ' align long
 long I32_JMPA + (@C_hyper_readR_aw_62)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_readR_aw_61
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
C_hyper_readR_aw_62
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hyper_readR_aw_51
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_writeRaw

 alignl ' align long
C_hyper_writeR_aw ' <symbol:hyper_writeRaw>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $ffa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r13)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hyper_writeR_aw_67)<<S32 ' GEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-28)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_writeR_aw_63)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_writeR_aw_66
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl ' align long
C_hyper_writeR_aw_67
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hyper_writeR_aw_66)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((65535)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r18)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r18)<<D16A + (16)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((208)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOVI + (r16)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r18)<<D16A + (24)<<S16A ' SHLU4 reg coni
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16A_WRLONG + (r22)<<D16A + (r13)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_hyper_writeR_aw_69
 word I16A_RDLONG + (r15)<<D16A + (r13)<<S16A ' reg <- INDIRI4 reg
' C_hyper_writeR_aw_70 ' (symbol refcount = 0)
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_writeR_aw_69)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16A_NEG + (r0)<<D16A + (r15)<<S16A ' NEGI4
 alignl ' align long
C_hyper_writeR_aw_63
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_modifyBankParams

 alignl ' align long
C_hyper_modifyB_ankP_arams ' <symbol:hyper_modifyBankParams>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $feaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_modifyB_ankP_arams_73)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-15)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_modifyB_ankP_arams_72)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_modifyB_ankP_arams_73
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shtc8_67d10fe5_hyper_getS_tartB_ank_L000033)<<S32 ' CALL addrg
 word I16A_MOV + (r9)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r9)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hyper_modifyB_ankP_arams_75)<<S32 ' GEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_modifyB_ankP_arams_72)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_modifyB_ankP_arams_75
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r10)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_hyper_modifyB_ankP_arams_78)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_modifyB_ankP_arams_77
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl ' align long
C_hyper_modifyB_ankP_arams_78
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hyper_modifyB_ankP_arams_77)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r13)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_hyper_modifyB_ankP_arams_83)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_modifyB_ankP_arams_80
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r19)<<S16A ' BORI/U (1)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((224)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r18)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_hyper_modifyB_ankP_arams_85
 word I16A_RDLONG + (r17)<<D16A + (r15)<<S16A ' reg <- INDIRI4 reg
' C_hyper_modifyB_ankP_arams_86 ' (symbol refcount = 0)
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_modifyB_ankP_arams_85)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_modifyB_ankP_arams_88)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hyper_modifyB_ankP_arams_89)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_modifyB_ankP_arams_88
 word I16A_NEG + (r17)<<D16A + (r17)<<S16A ' NEGI4
 alignl ' align long
C_hyper_modifyB_ankP_arams_89
' C_hyper_modifyB_ankP_arams_81 ' (symbol refcount = 0)
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_hyper_modifyB_ankP_arams_83
 word I16A_CMPSI + (r10)<<D16A + (24)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hyper_modifyB_ankP_arams_90)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_hyper_modifyB_ankP_arams_91)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_modifyB_ankP_arams_90
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A
 word I16A_SUBSI + (r20)<<D16A + (24)<<S16A ' SUBI4 reg coni
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r8)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_hyper_modifyB_ankP_arams_91
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r8)<<S16A ' ADDI/P (3)
 word I16A_CMPS + (r13)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hyper_modifyB_ankP_arams_80)<<S32 ' LEI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hyper_modifyB_ankP_arams_72
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092 ' <symbol:getBankParams>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ff0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_95)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_94
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_95
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_94)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((160)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long $f000000 ' reg <- con
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_97
 word I16A_RDLONG + (r19)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
' C_shtc9_67d10fe5_getB_ankP_arams_L000092_98 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_97)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_100)<<S32 ' LEI4 reg coni
 word I16A_NEG + (r19)<<D16A + (r19)<<S16A ' NEGI4
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_93)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_100
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_102)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_103)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_102
 word I16A_CMPSI + (r21)<<D16A + (2)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_104)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHRI + (r22)<<D16A + (12)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_105)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_104
 word I16A_CMPSI + (r21)<<D16A + (4)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_106)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_107)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_106
 word I16A_CMPSI + (r21)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_108)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 2048 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_110)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 2048 ' reg <- con
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_109)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_110
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092_109)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_108
 word I16A_NEGI + (r19)<<D16A + (-(-6)&$1F)<<S16A ' reg <- conn
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_109
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_107
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_105
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_103
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_shtc9_67d10fe5_getB_ankP_arams_L000092_93
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shtca_67d10fe5_validH_yperR_A_M__L000112 ' <symbol:validHyperRAM>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((1024)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_shtca_67d10fe5_validH_yperR_A_M__L000112_114)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-23)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_shtca_67d10fe5_validH_yperR_A_M__L000112_113)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtca_67d10fe5_validH_yperR_A_M__L000112_114
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_shtca_67d10fe5_validH_yperR_A_M__L000112_113
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116 ' <symbol:hyper_lookupDelay>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shtca_67d10fe5_validH_yperR_A_M__L000112)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_118)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_shtc6_67d10fe5_delayT_able_r_L000008 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_121)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_120
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long @C_shtc6_67d10fe5_delayT_able_r_L000008+4 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_124)<<S32 ' GEU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_119)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_124
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_121
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_shtc6_67d10fe5_delayT_able_r_L000008+4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_120)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_119)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_118
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_shtc7_67d10fe5_delayT_able_f_L000009 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_128)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_127
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long @C_shtc7_67d10fe5_delayT_able_f_L000009+4 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_131)<<S32 ' GEU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_129)<<S32 ' JUMPV addrg
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_131
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_128
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_shtc7_67d10fe5_delayT_able_f_L000009+4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_127)<<S32 ' NEU4 reg coni
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_129
 alignl ' align long
C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_119
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_shtcb_67d10fe5_hyper_lookupD_elay_L000116_117 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_setDelay

 alignl ' align long
C_hyper_setD_elay ' <symbol:hyper_setDelay>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_CMPSI + (r21)<<D16A + (15)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hyper_setD_elay_135)<<S32 ' LEI4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_setD_elay_134)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_setD_elay_135
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_SHLI + (r22)<<D16A + (12)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + (($ffff0fff)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_hyper_modifyB_ankP_arams)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hyper_setD_elay_134
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_setDelayFrequency

 alignl ' align long
C_hyper_setD_elayF_requency ' <symbol:hyper_setDelayFrequency>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_setD_elayF_requency_138)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hyper_setD_elayF_requency_138
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shtcb_67d10fe5_hyper_lookupD_elay_L000116)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_hyper_setD_elay)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_setD_elayF_requency_137 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getDelay

 alignl ' align long
C_hyper_getD_elay ' <symbol:hyper_getDelay>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_getD_elay_140 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_setBurst

 alignl ' align long
C_hyper_setB_urst ' <symbol:hyper_setBurst>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_CMPI + (r21)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_hyper_setB_urst_142)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_setB_urst_141)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_setB_urst_142
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $fff0 ' reg <- con
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hyper_setB_urst_144)<<S32 ' LEU4 reg reg
 word I16B_LODL + (r21)<<D16B
 alignl ' align long
 long $fff0 ' reg <- con
 alignl ' align long
C_hyper_setB_urst_144
 word I16A_NEGI + (r22)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r21)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r2)<<D16A + (16)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r3)<<D32S + (($fff8)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_hyper_modifyB_ankP_arams)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hyper_setB_urst_141
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getBurst

 alignl ' align long
C_hyper_getB_urst ' <symbol:hyper_getBurst>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_getB_urst_146 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getFlags

 alignl ' align long
C_hyper_getF_lags ' <symbol:hyper_getFlags>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_shtc9_67d10fe5_getB_ankP_arams_L000092)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_hyper_getF_lags_147 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_setQos

 alignl ' align long
C_hyper_setQ_os ' <symbol:hyper_setQos>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_NEGI + (r15)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_setQ_os_149)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-15)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_setQ_os_148)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_setQ_os_149
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_setQ_os_153)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (7)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hyper_setQ_os_151)<<S32 ' LEI4 reg coni
 alignl ' align long
C_hyper_setQ_os_153
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-6)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_hyper_setQ_os_148)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_setQ_os_151
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc2_67d10fe5_Q_osD_ata_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((-512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C_hyper_getD_riverL_ock)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_hyper_setQ_os_155)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_setQ_os_154
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl ' align long
C_hyper_setQ_os_155
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hyper_setQ_os_154)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((240)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (3)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_hyper_setQ_os_158)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_setQ_os_157
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl ' align long
C_hyper_setQ_os_158
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_setQ_os_157)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_hyper_setQ_os_148
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getQos

 alignl ' align long
C_hyper_getQ_os ' <symbol:hyper_getQos>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc2_67d10fe5_Q_osD_ata_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
' C_hyper_getQ_os_160 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getBankParameters

 alignl ' align long
C_hyper_getB_ankP_arameters ' <symbol:hyper_getBankParameters>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_CMPSI + (r23)<<D16A + (15)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hyper_getB_ankP_arameters_162)<<S32 ' LEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_hyper_getB_ankP_arameters_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_getB_ankP_arameters_162
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
C_hyper_getB_ankP_arameters_161
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getPinParameters

 alignl ' align long
C_hyper_getP_inP_arameters ' <symbol:hyper_getPinParameters>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_hyper_initialize)<<S32 ' CALL addrg
 word I16A_CMPSI + (r23)<<D16A + (15)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hyper_getP_inP_arameters_165)<<S32 ' LEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_hyper_getP_inP_arameters_164)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_getP_inP_arameters_165
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODI + (@C_shtc1_67d10fe5_deviceD_ata_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
C_hyper_getP_inP_arameters_164
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_readRamIR

 alignl ' align long
C_hyper_readR_amI_R_ ' <symbol:hyper_readRamIR>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shtca_67d10fe5_validH_yperR_A_M__L000112)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_readR_amI_R__168)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' BANDI/U
 word I16A_AND + (r2)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((57344)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_hyper_readR_aw)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hyper_readR_amI_R__168
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_hyper_readR_amI_R__167 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_readRamCR

 alignl ' align long
C_hyper_readR_amC_R_ ' <symbol:hyper_readRamCR>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_shtca_67d10fe5_validH_yperR_A_M__L000112)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_hyper_readR_amC_R__171)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' BANDI/U
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long 16777216 ' reg <- con
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((57344)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_hyper_readR_aw)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hyper_readR_amC_R__171
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C_hyper_readR_amC_R__170 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export hyper_getDriverLatency

 alignl ' align long
C_hyper_getD_riverL_atency ' <symbol:hyper_getDriverLatency>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fd0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_shtc4_67d10fe5_drivercog_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_hyper_getM_ailbox)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_hyper_getD_riverL_atency_175)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_getD_riverL_atency_174
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitms)<<S32 ' CALL addrg
 alignl ' align long
C_hyper_getD_riverL_atency_175
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locktry)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_hyper_getD_riverL_atency_174)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r16)<<D16B
 alignl ' align long
 long $f000000 ' reg <- con
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_hyper_getD_riverL_atency_177
 word I16A_RDLONG + (r21)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
' C_hyper_getD_riverL_atency_178 ' (symbol refcount = 0)
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_hyper_getD_riverL_atency_177)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_hyper_getD_riverL_atency_180)<<S32 ' LEI4 reg coni
 word I16A_NEG + (r21)<<D16A + (r21)<<S16A ' NEGI4
 alignl ' align long
 long I32_JMPA + (@C_hyper_getD_riverL_atency_181)<<S32 ' JUMPV addrg
 alignl ' align long
C_hyper_getD_riverL_atency_180
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_hyper_getD_riverL_atency_181
 alignl ' align long
 long I32_LODI + (@C_shtc5_67d10fe5_driverlock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_hyper_getD_riverL_atency_173 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

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
