' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sbp4_6709f805_startupD_ata_L000002 ' <symbol:startupData>
 long $0

 alignl ' align long
C_sbp41_6709f805_deviceD_ata_L000003 ' <symbol:deviceData>
 long $0

 alignl ' align long
C_sbp42_6709f805_Q_osD_ata_L000004 ' <symbol:QosData>
 long $0

 alignl ' align long
C_sbp43_6709f805_mailboxes_L000005 ' <symbol:mailboxes>
 long $0

 alignl ' align long
C_sbp44_6709f805_drivercog_L000006 ' <symbol:drivercog>
 long -1

 alignl ' align long
C_sbp45_6709f805_driverlock_L000007 ' <symbol:driverlock>
 long -1

 alignl ' align long
C_sbp46_6709f805_delayT_able_r_L000008 ' <symbol:delayTable_r>
 long $6
 long $57bcf00
 long $80befc0
 long $b34a700
 long $df28e80
 long $10b07600
 long $125bb500
 long $0

 alignl ' align long
C_sbp47_6709f805_delayT_able_f_L000009 ' <symbol:delayTable_f>
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
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #3 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp43_6709f805_mailboxes_L000005
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_hyper_getM_ailbox_10 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export hyper_initialize

 alignl ' align long
C_hyper_initialize ' <symbol:hyper_initialize>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_sbp4_6709f805_startupD_ata_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_hyper_initialize_12 ' NEU4
 mov r2, #26 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 jmp #LODL
 long @C_sbp44_6709f805_drivercog_L000006
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_hyper_initialize_14 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r18, RI ' reg <- INDIRI4 addrg
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #LODL
 long @C_sbp4_6709f805_startupD_ata_L000002
 mov r22, RI ' reg <- addrg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 and r20, r18 ' BANDI/U (2)
 jmp #LODL
 long @C_sbp4_6709f805_startupD_ata_L000002
 wrlong r20, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 jmp #LODL
 long @C_sbp41_6709f805_deviceD_ata_L000003
 wrlong r22, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_sbp42_6709f805_Q_osD_ata_L000004
 mov r22, RI ' reg <- addrg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #128 ' ADDP4 coni
 jmp #LODL
 long @C_sbp42_6709f805_Q_osD_ata_L000004
 wrlong r20, RI ' ASGNP4 addrg reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 jmp #LODL
 long @C_sbp43_6709f805_mailboxes_L000005
 wrlong r22, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_sbp45_6709f805_driverlock_L000007
 mov r22, RI ' reg <- addrg
 mov r20, r18
 shr r20, #24 ' RSHU4 coni
 jmp #LODL
 long @C_sbp45_6709f805_driverlock_L000007
 wrlong r20, RI ' ASGNI4 addrg reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_hyper_initialize_16 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C_sbp45_6709f805_driverlock_L000007
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_hyper_initialize_17 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r20, RI ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r20, RI ' reg <- INDIRI4 addrg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_hyper_initialize_17 ' JUMPV addrg
C_hyper_initialize_16
 jmp #LODL
 long @C_sbp45_6709f805_driverlock_L000007
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_sbp45_6709f805_driverlock_L000007
 wrlong r22, RI ' ASGNI4 addrg reg
C_hyper_initialize_17
C_hyper_initialize_14
C_hyper_initialize_12
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r0, RI ' reg <- INDIRI4 addrg
' C_hyper_initialize_11 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_stop

 alignl ' align long
C_hyper_stop ' <symbol:hyper_stop>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, #0 ' reg <- coni
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_hyper_stop_21 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__cogstop ' CALL addrg
 mov r23, #0 ' reg <- coni
C_hyper_stop_23
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_hyper_stop_27 ' GEI4
 mov r22, #16 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_hyper_stop_27
' C_hyper_stop_24 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wcz
 jmp #BR_B
 long @C_hyper_stop_23 ' LTI4
C_hyper_stop_21
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sbp44_6709f805_drivercog_L000006
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r20, RI ' reg <- INDIRI4 addrg
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_hyper_stop_29 ' EQI4
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockret ' CALL addrg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_sbp45_6709f805_driverlock_L000007
 wrlong r22, RI ' ASGNI4 addrg reg
C_hyper_stop_29
 mov r0, r23 ' CVI, CVU or LOAD
' C_hyper_stop_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_getDriverCogId

 alignl ' align long
C_hyper_getD_riverC_ogI_d ' <symbol:hyper_getDriverCogId>
 jmp #NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r0, RI ' reg <- INDIRI4 addrg
' C_hyper_getD_riverC_ogI_d_31 ' (symbol refcount = 0)
 jmp #RETF


' Catalina Export hyper_getDriverLock

 alignl ' align long
C_hyper_getD_riverL_ock ' <symbol:hyper_getDriverLock>
 jmp #NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r0, RI ' reg <- INDIRI4 addrg
' C_hyper_getD_riverL_ock_32 ' (symbol refcount = 0)
 jmp #RETF


 alignl ' align long
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033 ' <symbol:hyper_getStartBank>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #255 ' BANDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #25 wz
 jmp #BRNZ
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_35 ' NEI4
 and r23, #14 ' BANDI4 coni
 jmp #JMPA
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_36 ' JUMPV addrg
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_35
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #26 wz
 jmp #BRNZ
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_37 ' NEI4
 and r23, #12 ' BANDI4 coni
 jmp #JMPA
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_38 ' JUMPV addrg
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_37
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #27 wz
 jmp #BRNZ
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_39 ' NEI4
 and r23, #8 ' BANDI4 coni
 jmp #JMPA
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_40 ' JUMPV addrg
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_39
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #28 wz
 jmp #BRNZ
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_41 ' NEI4
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_42 ' JUMPV addrg
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_41
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #28 wcz
 jmp #BRBE
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_43 ' LEI4
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_34 ' JUMPV addrg
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_43
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_42
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_40
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_38
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_36
 mov r0, r23 ' CVI, CVU or LOAD
C_sbp48_6709f805_hyper_getS_tartB_ank_L000033_34
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_getFlashSize

 alignl ' align long
C_hyper_getF_lashS_ize ' <symbol:hyper_getFlashSize>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long 1024
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_hyper_getF_lashS_ize_46 ' NEI4
 jmp #LODL
 long -22
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_getF_lashS_ize_45 ' JUMPV addrg
C_hyper_getF_lashS_ize_46
 mov r22, #2 ' reg <- coni
 mov r20, r21
 shl r20, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r18, RI ' reg <- INDIRP4 addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 and r20, #255 ' BANDI4 coni
 shl r22, r20 ' LSHI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_getF_lashS_ize_45
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_getFlashBurstSize

 alignl ' align long
C_hyper_getF_lashB_urstS_ize ' <symbol:hyper_getFlashBurstSize>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long 1024
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_hyper_getF_lashB_urstS_ize_49 ' NEI4
 jmp #LODL
 long -22
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_getF_lashB_urstS_ize_48 ' JUMPV addrg
C_hyper_getF_lashB_urstS_ize_49
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #16 ' RSHU4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_getF_lashB_urstS_ize_48
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_readRaw

 alignl ' align long
C_hyper_readR_aw ' <symbol:hyper_readRaw>
 jmp #NEWF
 jmp #PSHM
 long $ffa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r15 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_hyper_readR_aw_55 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_readR_aw_51 ' JUMPV addrg
C_hyper_readR_aw_54
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_hyper_readR_aw_55
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_readR_aw_54 ' EQI4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, #144 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long $f000000
 mov r16, RI ' reg <- con
 and r18, r16 ' BANDI/U (1)
 add r20, r18 ' ADDU (1)
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 wrlong r22, r15 ' ASGNI4 reg reg
C_hyper_readR_aw_57
 rdlong r17, r15 ' reg <- INDIRI4 reg
' C_hyper_readR_aw_58 ' (symbol refcount = 0)
 cmps r17,  #0 wcz
 jmp #BR_B
 long @C_hyper_readR_aw_57 ' LTI4
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 cmps r17,  #0 wcz
 jmp #BRBE
 long @C_hyper_readR_aw_61 ' LEI4
 neg r13, r17 ' NEGI4
 jmp #JMPA
 long @C_hyper_readR_aw_62 ' JUMPV addrg
C_hyper_readR_aw_61
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRI4 reg
C_hyper_readR_aw_62
 mov r0, r13 ' CVI, CVU or LOAD
C_hyper_readR_aw_51
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_writeRaw

 alignl ' align long
C_hyper_writeR_aw ' <symbol:hyper_writeRaw>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 rdlong r22, r13 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_hyper_writeR_aw_67 ' GEI4
 jmp #LODL
 long -28
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_writeR_aw_63 ' JUMPV addrg
C_hyper_writeR_aw_66
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_hyper_writeR_aw_67
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_writeR_aw_66 ' EQI4
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 65535
 mov r20, RI ' reg <- con
 and r20, r21 ' BANDI/U (2)
 mov r18, r17
 shl r18, #16 ' LSHI4 coni
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, #208 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 and r18, #15 ' BANDU4 coni
 shl r18, #24 ' LSHU4 coni
 add r20, r18 ' ADDU (1)
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 wrlong r22, r13 ' ASGNI4 reg reg
C_hyper_writeR_aw_69
 rdlong r15, r13 ' reg <- INDIRI4 reg
' C_hyper_writeR_aw_70 ' (symbol refcount = 0)
 cmps r15,  #0 wcz
 jmp #BR_B
 long @C_hyper_writeR_aw_69 ' LTI4
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 neg r0, r15 ' NEGI4
C_hyper_writeR_aw_63
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_modifyBankParams

 alignl ' align long
C_hyper_modifyB_ankP_arams ' <symbol:hyper_modifyBankParams>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_hyper_modifyB_ankP_arams_73 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_modifyB_ankP_arams_72 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_73
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbp48_6709f805_hyper_getS_tartB_ank_L000033 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 cmps r7,  #0 wcz
 jmp #BRAE
 long @C_hyper_modifyB_ankP_arams_75 ' GEI4
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_modifyB_ankP_arams_72 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_75
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r9, r22
 and r9, #255 ' BANDI4 coni
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_modifyB_ankP_arams_78 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_77
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_hyper_modifyB_ankP_arams_78
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_modifyB_ankP_arams_77 ' EQI4
 mov r13, r7 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_modifyB_ankP_arams_83 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_80
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, r21 ' BANDI/U (1)
 or r22, r19 ' BORI/U (1)
 mov r11, r22 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 wrlong r11, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, #224 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r13
 shl r18, #24 ' LSHI4 coni
 adds r20, r18 ' ADDI/P (1)
 mov r22, r20 ' ADDI/P
 adds r22, r0 ' ADDI/P (3)
 wrlong r22, r15 ' ASGNI4 reg reg
C_hyper_modifyB_ankP_arams_85
 rdlong r17, r15 ' reg <- INDIRI4 reg
' C_hyper_modifyB_ankP_arams_86 ' (symbol refcount = 0)
 cmps r17,  #0 wcz
 jmp #BR_B
 long @C_hyper_modifyB_ankP_arams_85 ' LTI4
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_hyper_modifyB_ankP_arams_88 ' NEI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r11, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_hyper_modifyB_ankP_arams_89 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_88
 neg r17, r17 ' NEGI4
C_hyper_modifyB_ankP_arams_89
' C_hyper_modifyB_ankP_arams_81 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
C_hyper_modifyB_ankP_arams_83
 cmps r9,  #24 wcz
 jmp #BRAE
 long @C_hyper_modifyB_ankP_arams_90 ' GEI4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_hyper_modifyB_ankP_arams_91 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_90
 mov r22, #1 ' reg <- coni
 mov r20, r9
 subs r20, #24 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_hyper_modifyB_ankP_arams_91
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r7 ' ADDI/P (2)
 cmps r13, r22 wcz
 jmp #BRBE
 long @C_hyper_modifyB_ankP_arams_80 ' LEI4
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
C_hyper_modifyB_ankP_arams_72
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbp49_6709f805_getB_ankP_arams_L000092 ' <symbol:getBankParams>
 jmp #NEWF
 jmp #PSHM
 long $ff0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_95 ' JUMPV addrg
C_sbp49_6709f805_getB_ankP_arams_L000092_94
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_sbp49_6709f805_getB_ankP_arams_L000092_95
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_94 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, #160 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long $f000000
 mov r16, RI ' reg <- con
 and r18, r16 ' BANDI/U (1)
 add r20, r18 ' ADDU (1)
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 wrlong r22, r17 ' ASGNI4 reg reg
C_sbp49_6709f805_getB_ankP_arams_L000092_97
 rdlong r19, r17 ' reg <- INDIRI4 reg
' C_sbp49_6709f805_getB_ankP_arams_L000092_98 ' (symbol refcount = 0)
 cmps r19,  #0 wcz
 jmp #BR_B
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_97 ' LTI4
 cmps r19,  #0 wcz
 jmp #BRBE
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_100 ' LEI4
 neg r19, r19 ' NEGI4
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_93 ' JUMPV addrg
C_sbp49_6709f805_getB_ankP_arams_L000092_100
 cmps r21,  #1 wz
 jmp #BRNZ
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_102 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #16 ' RSHU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_103 ' JUMPV addrg
C_sbp49_6709f805_getB_ankP_arams_L000092_102
 cmps r21,  #2 wz
 jmp #BRNZ
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_104 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #12 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_105 ' JUMPV addrg
C_sbp49_6709f805_getB_ankP_arams_L000092_104
 cmps r21,  #4 wz
 jmp #BRNZ
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_106 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #8 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_107 ' JUMPV addrg
C_sbp49_6709f805_getB_ankP_arams_L000092_106
 cmps r21,  #3 wz
 jmp #BRNZ
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_108 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long 2048
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_110 ' EQU4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #7 ' BANDU4 coni
 jmp #LODL
 long 2048
 mov r20, RI ' reg <- con
 add r22, r20 ' ADDU (1)
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_109 ' JUMPV addrg
C_sbp49_6709f805_getB_ankP_arams_L000092_110
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092_109 ' JUMPV addrg
C_sbp49_6709f805_getB_ankP_arams_L000092_108
 jmp #LODL
 long -6
 mov r19, RI ' reg <- con
C_sbp49_6709f805_getB_ankP_arams_L000092_109
C_sbp49_6709f805_getB_ankP_arams_L000092_107
C_sbp49_6709f805_getB_ankP_arams_L000092_105
C_sbp49_6709f805_getB_ankP_arams_L000092_103
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_sbp49_6709f805_getB_ankP_arams_L000092_93
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sbp4a_6709f805_validH_yperR_A_M__L000112 ' <symbol:validHyperRAM>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long 1024
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sbp4a_6709f805_validH_yperR_A_M__L000112_114 ' EQI4
 jmp #LODL
 long -23
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sbp4a_6709f805_validH_yperR_A_M__L000112_113 ' JUMPV addrg
C_sbp4a_6709f805_validH_yperR_A_M__L000112_114
 mov r0, #0 ' RET coni
C_sbp4a_6709f805_validH_yperR_A_M__L000112_113
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sbp4b_6709f805_hyper_lookupD_elay_L000116 ' <symbol:hyper_lookupDelay>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbp4a_6709f805_validH_yperR_A_M__L000112 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_118 ' NEI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sbp46_6709f805_delayT_able_r_L000008
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_121 ' JUMPV addrg
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_120
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sbp46_6709f805_delayT_able_r_L000008+4
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BRAE
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_124 ' GEU4
 jmp #JMPA
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_119 ' JUMPV addrg
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_124
 adds r19, #1 ' ADDI4 coni
 adds r17, #1 ' ADDI4 coni
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_121
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sbp46_6709f805_delayT_able_r_L000008+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_120 ' NEU4
 jmp #JMPA
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_119 ' JUMPV addrg
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_118
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sbp47_6709f805_delayT_able_f_L000009
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_128 ' JUMPV addrg
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_127
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sbp47_6709f805_delayT_able_f_L000009+4
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BRAE
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_131 ' GEU4
 jmp #JMPA
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_129 ' JUMPV addrg
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_131
 adds r19, #1 ' ADDI4 coni
 adds r17, #1 ' ADDI4 coni
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_128
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sbp47_6709f805_delayT_able_f_L000009+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116_127 ' NEU4
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_129
C_sbp4b_6709f805_hyper_lookupD_elay_L000116_119
 mov r0, r17 ' CVI, CVU or LOAD
' C_sbp4b_6709f805_hyper_lookupD_elay_L000116_117 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_setDelay

 alignl ' align long
C_hyper_setD_elay ' <symbol:hyper_setDelay>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 cmps r21,  #15 wcz
 jmp #BRBE
 long @C_hyper_setD_elay_135 ' LEI4
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_setD_elay_134 ' JUMPV addrg
C_hyper_setD_elay_135
 mov r22, r21
 and r22, #15 ' BANDI4 coni
 shl r22, #12 ' LSHI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffff0fff
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_modifyB_ankP_arams
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_hyper_setD_elay_134
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_setDelayFrequency

 alignl ' align long
C_hyper_setD_elayF_requency ' <symbol:hyper_setDelayFrequency>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_hyper_setD_elayF_requency_138 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_hyper_setD_elayF_requency_138
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbp4b_6709f805_hyper_lookupD_elay_L000116
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_setD_elay
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_setD_elayF_requency_137 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_getDelay

 alignl ' align long
C_hyper_getD_elay ' <symbol:hyper_getDelay>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_getD_elay_140 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_setBurst

 alignl ' align long
C_hyper_setB_urst ' <symbol:hyper_setBurst>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 cmp r21,  #8 wcz 
 jmp #BRAE
 long @C_hyper_setB_urst_142 ' GEU4
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_setB_urst_141 ' JUMPV addrg
C_hyper_setB_urst_142
 jmp #LODL
 long $fff0
 mov r22, RI ' reg <- con
 cmp r21, r22 wcz 
 jmp #BRBE
 long @C_hyper_setB_urst_144 ' LEU4
 jmp #LODL
 long $fff0
 mov r21, RI ' reg <- con
C_hyper_setB_urst_144
 jmp #LODL
 long $fffffff8
 mov r22, RI ' reg <- con
 and r21, r22 ' BANDI/U (1)
 mov r2, r21
 shl r2, #16 ' LSHU4 coni
 jmp #LODL
 long $fff8
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_modifyB_ankP_arams
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_hyper_setB_urst_141
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_getBurst

 alignl ' align long
C_hyper_getB_urst ' <symbol:hyper_getBurst>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_getB_urst_146 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_getFlags

 alignl ' align long
C_hyper_getF_lags ' <symbol:hyper_getFlags>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sbp49_6709f805_getB_ankP_arams_L000092
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_getF_lags_147 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_setQos

 alignl ' align long
C_hyper_setQ_os ' <symbol:hyper_setQos>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODL
 long -1
 mov r15, RI ' reg <- con
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_hyper_setQ_os_149 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_setQ_os_148 ' JUMPV addrg
C_hyper_setQ_os_149
 cmps r23,  #0 wcz
 jmp #BR_B
 long @C_hyper_setQ_os_153 ' LTI4
 cmps r23,  #7 wcz
 jmp #BRBE
 long @C_hyper_setQ_os_151 ' LEI4
C_hyper_setQ_os_153
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_hyper_setQ_os_148 ' JUMPV addrg
C_hyper_setQ_os_151
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp42_6709f805_Q_osD_ata_L000004
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long -512
 mov r20, RI ' reg <- con
 and r20, r21 ' BANDI/U (2)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_getD_riverL_ock ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_setQ_os_155 ' JUMPV addrg
C_hyper_setQ_os_154
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_hyper_setQ_os_155
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_setQ_os_154 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, #240 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r20 ' ADDI/P
 adds r22, r0 ' ADDI/P (3)
 wrlong r22, r17 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_hyper_setQ_os_158 ' JUMPV addrg
C_hyper_setQ_os_157
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_hyper_setQ_os_158
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_hyper_setQ_os_157 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_setQ_os_148
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export hyper_getQos

 alignl ' align long
C_hyper_getQ_os ' <symbol:hyper_getQos>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 mov r22, r23
 and r22, #7 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp42_6709f805_Q_osD_ata_L000004
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_hyper_getQ_os_160 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_getBankParameters

 alignl ' align long
C_hyper_getB_ankP_arameters ' <symbol:hyper_getBankParameters>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 cmps r23,  #15 wcz
 jmp #BRBE
 long @C_hyper_getB_ankP_arameters_162 ' LEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_hyper_getB_ankP_arameters_161 ' JUMPV addrg
C_hyper_getB_ankP_arameters_162
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_getB_ankP_arameters_161
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_getPinParameters

 alignl ' align long
C_hyper_getP_inP_arameters ' <symbol:hyper_getPinParameters>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_hyper_initialize ' CALL addrg
 cmps r23,  #15 wcz
 jmp #BRBE
 long @C_hyper_getP_inP_arameters_165 ' LEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_hyper_getP_inP_arameters_164 ' JUMPV addrg
C_hyper_getP_inP_arameters_165
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 adds r22, #64 ' ADDI4 coni
 jmp #LODI
 long @C_sbp41_6709f805_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_getP_inP_arameters_164
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readRamIR

 alignl ' align long
C_hyper_readR_amI_R_ ' <symbol:hyper_readRamIR>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbp4a_6709f805_validH_yperR_A_M__L000112 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_hyper_readR_amI_R__168 ' NEI4
 mov r2, r21
 and r2, #1 ' BANDI4 coni
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long 57344
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_aw
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_hyper_readR_amI_R__168
 mov r0, r17 ' CVI, CVU or LOAD
' C_hyper_readR_amI_R__167 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_readRamCR

 alignl ' align long
C_hyper_readR_amC_R_ ' <symbol:hyper_readRamCR>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sbp4a_6709f805_validH_yperR_A_M__L000112 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_hyper_readR_amC_R__171 ' NEI4
 mov r22, r21
 and r22, #1 ' BANDI4 coni
 jmp #LODL
 long 16777216
 mov r20, RI ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 shl r22, #3 ' LSHI4 coni
 jmp #LODL
 long 57344
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_hyper_readR_aw
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_hyper_readR_amC_R__171
 mov r0, r17 ' CVI, CVU or LOAD
' C_hyper_readR_amC_R__170 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export hyper_getDriverLatency

 alignl ' align long
C_hyper_getD_riverL_atency ' <symbol:hyper_getDriverLatency>
 jmp #NEWF
 jmp #PSHM
 long $fd0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_sbp44_6709f805_drivercog_L000006
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_hyper_getD_riverL_atency_175 ' JUMPV addrg
C_hyper_getD_riverL_atency_174
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_hyper_getD_riverL_atency_175
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_hyper_getD_riverL_atency_174 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long $f000000
 mov r16, RI ' reg <- con
 and r18, r16 ' BANDI/U (1)
 add r20, r18 ' ADDU (1)
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 wrlong r22, r19 ' ASGNI4 reg reg
C_hyper_getD_riverL_atency_177
 rdlong r21, r19 ' reg <- INDIRI4 reg
' C_hyper_getD_riverL_atency_178 ' (symbol refcount = 0)
 cmps r21,  #0 wcz
 jmp #BR_B
 long @C_hyper_getD_riverL_atency_177 ' LTI4
 cmps r21,  #0 wcz
 jmp #BRBE
 long @C_hyper_getD_riverL_atency_180 ' LEI4
 neg r21, r21 ' NEGI4
 jmp #JMPA
 long @C_hyper_getD_riverL_atency_181 ' JUMPV addrg
C_hyper_getD_riverL_atency_180
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #1 ' RSHU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
C_hyper_getD_riverL_atency_181
 jmp #LODI
 long @C_sbp45_6709f805_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_hyper_getD_riverL_atency_173 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


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
