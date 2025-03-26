' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s9v8_67e34742_startupD_ata_L000002 ' <symbol:startupData>
 long $0

 alignl ' align long
C_s9v81_67e34742_deviceD_ata_L000003 ' <symbol:deviceData>
 long $0

 alignl ' align long
C_s9v82_67e34742_Q_osD_ata_L000004 ' <symbol:QosData>
 long $0

 alignl ' align long
C_s9v83_67e34742_mailboxes_L000005 ' <symbol:mailboxes>
 long $0

 alignl ' align long
C_s9v84_67e34742_drivercog_L000006 ' <symbol:drivercog>
 long -1

 alignl ' align long
C_s9v85_67e34742_driverlock_L000007 ' <symbol:driverlock>
 long -1

 alignl ' align long
C_s9v86_67e34742_delayT_able_r_L000008 ' <symbol:delayTable_r>
 long $6
 long $57bcf00
 long $80befc0
 long $b34a700
 long $df28e80
 long $10b07600
 long $125bb500
 long $0

 alignl ' align long
C_s9v87_67e34742_delayT_able_f_L000009 ' <symbol:delayTable_f>
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
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, #3 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r2 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v83_67e34742_mailboxes_L000005
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_hyper_getM_ailbox_10 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export hyper_initialize

 alignl ' align long
C_hyper_initialize ' <symbol:hyper_initialize>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##@C_s9v8_67e34742_startupD_ata_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_hyper_initialize_12  ' NEU4
 mov r2, #26 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locate_plugin ' CALL addrg
 wrlong r0, ##@C_s9v84_67e34742_drivercog_L000006 ' ASGNI4 addrg reg
 mov r22, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_hyper_initialize_14 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r20, ##$ffffff ' reg <- con
 mov r18, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r18, r18 ' reg <- INDIRI4 addrg
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##@C_s9v8_67e34742_startupD_ata_L000002 ' reg <- addrg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 and r20, r18 ' BANDI/U (2)
 wrlong r20, ##@C_s9v8_67e34742_startupD_ata_L000002 ' ASGNP4 addrg reg
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 wrlong r22, ##@C_s9v81_67e34742_deviceD_ata_L000003 ' ASGNP4 addrg reg
 mov r22, ##@C_s9v82_67e34742_Q_osD_ata_L000004 ' reg <- addrg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #128 ' ADDP4 coni
 wrlong r20, ##@C_s9v82_67e34742_Q_osD_ata_L000004 ' ASGNP4 addrg reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 wrlong r22, ##@C_s9v83_67e34742_mailboxes_L000005 ' ASGNP4 addrg reg
 mov r22, ##@C_s9v85_67e34742_driverlock_L000007 ' reg <- addrg
 mov r20, r18
 shr r20, #24 ' RSHU4 coni
 wrlong r20, ##@C_s9v85_67e34742_driverlock_L000007 ' ASGNI4 addrg reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_hyper_initialize_16 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C_s9v85_67e34742_driverlock_L000007 ' ASGNI4 addrg reg
 mov r22, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_hyper_initialize_17 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r20, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_hyper_initialize_17 ' JUMPV addrg
C_hyper_initialize_16
 mov r22, ##@C_s9v85_67e34742_driverlock_L000007 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, ##@C_s9v85_67e34742_driverlock_L000007 ' ASGNI4 addrg reg
C_hyper_initialize_17
C_hyper_initialize_14
C_hyper_initialize_12
 mov r0, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r0, r0 ' reg <- INDIRI4 addrg
' C_hyper_initialize_11 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hyper_stop

 alignl ' align long
C_hyper_stop ' <symbol:hyper_stop>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, #0 ' reg <- coni
 mov r19, ##-1 ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r19, r22 wz
 if_z jmp #\C_hyper_stop_21 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__cogstop ' CALL addrg
 mov r23, #0 ' reg <- coni
C_hyper_stop_23
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_hyper_stop_27 ' GEI4
 mov r22, #16 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_hyper_stop_27
' C_hyper_stop_24 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wcz
 if_b jmp #\C_hyper_stop_23 ' LTI4
C_hyper_stop_21
 mov r22, ##-1 ' reg <- con
 wrlong r22, ##@C_s9v84_67e34742_drivercog_L000006 ' ASGNI4 addrg reg
 mov r20, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r20, r22 wz
 if_z jmp #\C_hyper_stop_29 ' EQI4
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockret ' CALL addrg
 mov r22, ##-1 ' reg <- con
 wrlong r22, ##@C_s9v85_67e34742_driverlock_L000007 ' ASGNI4 addrg reg
C_hyper_stop_29
 mov r0, r23 ' CVI, CVU or LOAD
' C_hyper_stop_20 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_getDriverCogId

 alignl ' align long
C_hyper_getD_riverC_ogI_d ' <symbol:hyper_getDriverCogId>
 calld PA,#NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r0, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r0, r0 ' reg <- INDIRI4 addrg
' C_hyper_getD_riverC_ogI_d_31 ' (symbol refcount = 0)
 calld PA,#RETF


' Catalina Export hyper_getDriverLock

 alignl ' align long
C_hyper_getD_riverL_ock ' <symbol:hyper_getDriverLock>
 calld PA,#NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r0, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r0, r0 ' reg <- INDIRI4 addrg
' C_hyper_getD_riverL_ock_32 ' (symbol refcount = 0)
 calld PA,#RETF


 alignl ' align long
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033 ' <symbol:hyper_getStartBank>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #255 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #25 wz
 if_nz jmp #\C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_35 ' NEI4
 and r23, #14 ' BANDI4 coni
 jmp #\@C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_36 ' JUMPV addrg
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_35
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #26 wz
 if_nz jmp #\C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_37 ' NEI4
 and r23, #12 ' BANDI4 coni
 jmp #\@C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_38 ' JUMPV addrg
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_37
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #27 wz
 if_nz jmp #\C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_39 ' NEI4
 and r23, #8 ' BANDI4 coni
 jmp #\@C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_40 ' JUMPV addrg
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_39
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #28 wz
 if_nz jmp #\C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_41 ' NEI4
 mov r23, #0 ' reg <- coni
 jmp #\@C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_42 ' JUMPV addrg
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_41
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #28 wcz
 if_be jmp #\C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_43 ' LEI4
 mov r0, ##-6 ' RET con
 jmp #\@C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_34 ' JUMPV addrg
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_43
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_42
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_40
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_38
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_36
 mov r0, r23 ' CVI, CVU or LOAD
C_s9v88_67e34742_hyper_getS_tartB_ank_L000033_34
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hyper_getFlashSize

 alignl ' align long
C_hyper_getF_lashS_ize ' <symbol:hyper_getFlashSize>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1024 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_nz jmp #\C_hyper_getF_lashS_ize_46 ' NEI4
 mov r0, ##-22 ' RET con
 jmp #\@C_hyper_getF_lashS_ize_45 ' JUMPV addrg
C_hyper_getF_lashS_ize_46
 mov r22, #2 ' reg <- coni
 mov r20, r21
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r18, r18 ' reg <- INDIRP4 addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 and r20, #255 ' BANDI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_getF_lashS_ize_45
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hyper_getFlashBurstSize

 alignl ' align long
C_hyper_getF_lashB_urstS_ize ' <symbol:hyper_getFlashBurstSize>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1024 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_nz jmp #\C_hyper_getF_lashB_urstS_ize_49 ' NEI4
 mov r0, ##-22 ' RET con
 jmp #\@C_hyper_getF_lashB_urstS_ize_48 ' JUMPV addrg
C_hyper_getF_lashB_urstS_ize_49
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #16 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_getF_lashB_urstS_ize_48
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hyper_readRaw

 alignl ' align long
C_hyper_readR_aw ' <symbol:hyper_readRaw>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ffa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r2, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r15 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_hyper_readR_aw_55 ' GEI4
 mov r0, ##-28 ' RET con
 jmp #\@C_hyper_readR_aw_51 ' JUMPV addrg
C_hyper_readR_aw_54
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_hyper_readR_aw_55
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_hyper_readR_aw_54 ' EQI4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r20, #144 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r23 ' CVI, CVU or LOAD
 mov r16, ##$f000000 ' reg <- con
 and r18, r16 ' BANDI/U (1)
 add r20, r18 ' ADDU (1)
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 wrlong r22, r15 ' ASGNI4 reg reg
C_hyper_readR_aw_57
 rdlong r17, r15 ' reg <- INDIRI4 reg
' C_hyper_readR_aw_58 ' (symbol refcount = 0)
 cmps r17,  #0 wcz
 if_b jmp #\C_hyper_readR_aw_57 ' LTI4
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 cmps r17,  #0 wcz
 if_be jmp #\C_hyper_readR_aw_61 ' LEI4
 neg r13, r17 ' NEGI4
 jmp #\@C_hyper_readR_aw_62 ' JUMPV addrg
C_hyper_readR_aw_61
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRI4 reg
C_hyper_readR_aw_62
 mov r0, r13 ' CVI, CVU or LOAD
C_hyper_readR_aw_51
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_writeRaw

 alignl ' align long
C_hyper_writeR_aw ' <symbol:hyper_writeRaw>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r2, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 rdlong r22, r13 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_hyper_writeR_aw_67 ' GEI4
 mov r0, ##-28 ' RET con
 jmp #\@C_hyper_writeR_aw_63 ' JUMPV addrg
C_hyper_writeR_aw_66
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_hyper_writeR_aw_67
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_hyper_writeR_aw_66 ' EQI4
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, ##65535 ' reg <- con
 and r20, r21 ' BANDI/U (2)
 mov r18, r17
 shl r18, #16 ' LSHI4 coni
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
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
 if_b jmp #\C_hyper_writeR_aw_69 ' LTI4
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 neg r0, r15 ' NEGI4
C_hyper_writeR_aw_63
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hyper_modifyBankParams

 alignl ' align long
C_hyper_modifyB_ankP_arams ' <symbol:hyper_modifyBankParams>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_hyper_modifyB_ankP_arams_73 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_hyper_modifyB_ankP_arams_72 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_73
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9v88_67e34742_hyper_getS_tartB_ank_L000033 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 cmps r7,  #0 wcz
 if_ae jmp #\C_hyper_modifyB_ankP_arams_75 ' GEI4
 mov r0, ##-6 ' RET con
 jmp #\@C_hyper_modifyB_ankP_arams_72 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_75
 mov r22, r7
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r9, r22
 and r9, #255 ' BANDI4 coni
 mov r2, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_hyper_modifyB_ankP_arams_78 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_77
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_hyper_modifyB_ankP_arams_78
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_hyper_modifyB_ankP_arams_77 ' EQI4
 mov r13, r7 ' CVI, CVU or LOAD
 jmp #\@C_hyper_modifyB_ankP_arams_83 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_80
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, r21 ' BANDI/U (1)
 or r22, r19 ' BORI/U (1)
 mov r11, r22 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 wrlong r11, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
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
 if_b jmp #\C_hyper_modifyB_ankP_arams_85 ' LTI4
 cmps r17,  #0 wz
 if_nz jmp #\C_hyper_modifyB_ankP_arams_88 ' NEI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r11, r22 ' ASGNI4 reg reg
 jmp #\@C_hyper_modifyB_ankP_arams_89 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_88
 neg r17, r17 ' NEGI4
C_hyper_modifyB_ankP_arams_89
' C_hyper_modifyB_ankP_arams_81 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
C_hyper_modifyB_ankP_arams_83
 cmps r9,  #24 wcz
 if_ae jmp #\C_hyper_modifyB_ankP_arams_90 ' GEI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_hyper_modifyB_ankP_arams_91 ' JUMPV addrg
C_hyper_modifyB_ankP_arams_90
 mov r22, #1 ' reg <- coni
 mov r20, r9
 subs r20, #24 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_hyper_modifyB_ankP_arams_91
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r7 ' ADDI/P (2)
 cmps r13, r22 wcz
 if_be jmp #\C_hyper_modifyB_ankP_arams_80 ' LEI4
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
C_hyper_modifyB_ankP_arams_72
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9v89_67e34742_getB_ankP_arams_L000092 ' <symbol:getBankParams>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ff0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_s9v89_67e34742_getB_ankP_arams_L000092_95 ' JUMPV addrg
C_s9v89_67e34742_getB_ankP_arams_L000092_94
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_s9v89_67e34742_getB_ankP_arams_L000092_95
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9v89_67e34742_getB_ankP_arams_L000092_94 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r20, #160 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r23 ' CVI, CVU or LOAD
 mov r16, ##$f000000 ' reg <- con
 and r18, r16 ' BANDI/U (1)
 add r20, r18 ' ADDU (1)
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 wrlong r22, r17 ' ASGNI4 reg reg
C_s9v89_67e34742_getB_ankP_arams_L000092_97
 rdlong r19, r17 ' reg <- INDIRI4 reg
' C_s9v89_67e34742_getB_ankP_arams_L000092_98 ' (symbol refcount = 0)
 cmps r19,  #0 wcz
 if_b jmp #\C_s9v89_67e34742_getB_ankP_arams_L000092_97 ' LTI4
 cmps r19,  #0 wcz
 if_be jmp #\C_s9v89_67e34742_getB_ankP_arams_L000092_100 ' LEI4
 neg r19, r19 ' NEGI4
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_s9v89_67e34742_getB_ankP_arams_L000092_93 ' JUMPV addrg
C_s9v89_67e34742_getB_ankP_arams_L000092_100
 cmps r21,  #1 wz
 if_nz jmp #\C_s9v89_67e34742_getB_ankP_arams_L000092_102 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #16 ' RSHU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #\@C_s9v89_67e34742_getB_ankP_arams_L000092_103 ' JUMPV addrg
C_s9v89_67e34742_getB_ankP_arams_L000092_102
 cmps r21,  #2 wz
 if_nz jmp #\C_s9v89_67e34742_getB_ankP_arams_L000092_104 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #12 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #\@C_s9v89_67e34742_getB_ankP_arams_L000092_105 ' JUMPV addrg
C_s9v89_67e34742_getB_ankP_arams_L000092_104
 cmps r21,  #4 wz
 if_nz jmp #\C_s9v89_67e34742_getB_ankP_arams_L000092_106 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #8 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #\@C_s9v89_67e34742_getB_ankP_arams_L000092_107 ' JUMPV addrg
C_s9v89_67e34742_getB_ankP_arams_L000092_106
 cmps r21,  #3 wz
 if_nz jmp #\C_s9v89_67e34742_getB_ankP_arams_L000092_108 ' NEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##2048 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_s9v89_67e34742_getB_ankP_arams_L000092_110 ' EQU4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #7 ' BANDU4 coni
 mov r20, ##2048 ' reg <- con
 add r22, r20 ' ADDU (1)
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #\@C_s9v89_67e34742_getB_ankP_arams_L000092_109 ' JUMPV addrg
C_s9v89_67e34742_getB_ankP_arams_L000092_110
 mov r19, #0 ' reg <- coni
 jmp #\@C_s9v89_67e34742_getB_ankP_arams_L000092_109 ' JUMPV addrg
C_s9v89_67e34742_getB_ankP_arams_L000092_108
 mov r19, ##-6 ' reg <- con
C_s9v89_67e34742_getB_ankP_arams_L000092_109
C_s9v89_67e34742_getB_ankP_arams_L000092_107
C_s9v89_67e34742_getB_ankP_arams_L000092_105
C_s9v89_67e34742_getB_ankP_arams_L000092_103
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_s9v89_67e34742_getB_ankP_arams_L000092_93
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9v8a_67e34742_validH_yperR_A_M__L000112 ' <symbol:validHyperRAM>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1024 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C_s9v8a_67e34742_validH_yperR_A_M__L000112_114 ' EQI4
 mov r0, ##-23 ' RET con
 jmp #\@C_s9v8a_67e34742_validH_yperR_A_M__L000112_113 ' JUMPV addrg
C_s9v8a_67e34742_validH_yperR_A_M__L000112_114
 mov r0, #0 ' reg <- coni
C_s9v8a_67e34742_validH_yperR_A_M__L000112_113
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9v8b_67e34742_hyper_lookupD_elay_L000116 ' <symbol:hyper_lookupDelay>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9v8a_67e34742_validH_yperR_A_M__L000112 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9v8b_67e34742_hyper_lookupD_elay_L000116_118 ' NEI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v86_67e34742_delayT_able_r_L000008 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_s9v8b_67e34742_hyper_lookupD_elay_L000116_121 ' JUMPV addrg
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_120
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C_s9v86_67e34742_delayT_able_r_L000008+4 ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_s9v8b_67e34742_hyper_lookupD_elay_L000116_124 ' GEU4
 jmp #\@C_s9v8b_67e34742_hyper_lookupD_elay_L000116_119 ' JUMPV addrg
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_124
 adds r19, #1 ' ADDI4 coni
 adds r17, #1 ' ADDI4 coni
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_121
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v86_67e34742_delayT_able_r_L000008+4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s9v8b_67e34742_hyper_lookupD_elay_L000116_120  ' NEU4
 jmp #\@C_s9v8b_67e34742_hyper_lookupD_elay_L000116_119 ' JUMPV addrg
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_118
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v87_67e34742_delayT_able_f_L000009 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C_s9v8b_67e34742_hyper_lookupD_elay_L000116_128 ' JUMPV addrg
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_127
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C_s9v87_67e34742_delayT_able_f_L000009+4 ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_s9v8b_67e34742_hyper_lookupD_elay_L000116_131 ' GEU4
 jmp #\@C_s9v8b_67e34742_hyper_lookupD_elay_L000116_129 ' JUMPV addrg
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_131
 adds r19, #1 ' ADDI4 coni
 adds r17, #1 ' ADDI4 coni
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_128
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v87_67e34742_delayT_able_f_L000009+4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s9v8b_67e34742_hyper_lookupD_elay_L000116_127  ' NEU4
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_129
C_s9v8b_67e34742_hyper_lookupD_elay_L000116_119
 mov r0, r17 ' CVI, CVU or LOAD
' C_s9v8b_67e34742_hyper_lookupD_elay_L000116_117 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_setDelay

 alignl ' align long
C_hyper_setD_elay ' <symbol:hyper_setDelay>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 cmps r21,  #15 wcz
 if_be jmp #\C_hyper_setD_elay_135 ' LEI4
 mov r0, ##-6 ' RET con
 jmp #\@C_hyper_setD_elay_134 ' JUMPV addrg
C_hyper_setD_elay_135
 mov r22, r21
 and r22, #15 ' BANDI4 coni
 shl r22, #12 ' LSHI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##$ffff0fff ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_hyper_modifyB_ankP_arams
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_hyper_setD_elay_134
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_setDelayFrequency

 alignl ' align long
C_hyper_setD_elayF_requency ' <symbol:hyper_setDelayFrequency>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 shr r22, #24 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 cmps r21,  #0 wz
 if_nz jmp #\C_hyper_setD_elayF_requency_138 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_hyper_setD_elayF_requency_138
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9v8b_67e34742_hyper_lookupD_elay_L000116
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_hyper_setD_elay
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_setD_elayF_requency_137 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hyper_getDelay

 alignl ' align long
C_hyper_getD_elay ' <symbol:hyper_getDelay>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9v89_67e34742_getB_ankP_arams_L000092
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_getD_elay_140 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_setBurst

 alignl ' align long
C_hyper_setB_urst ' <symbol:hyper_setBurst>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 cmp r21,  #8 wcz 
 if_ae jmp #\C_hyper_setB_urst_142 ' GEU4
 mov r0, ##-6 ' RET con
 jmp #\@C_hyper_setB_urst_141 ' JUMPV addrg
C_hyper_setB_urst_142
 mov r22, ##$fff0 ' reg <- con
 cmp r21, r22 wcz 
 if_be jmp #\C_hyper_setB_urst_144 ' LEU4
 mov r21, ##$fff0 ' reg <- con
C_hyper_setB_urst_144
 mov r22, ##$fffffff8 ' reg <- con
 and r21, r22 ' BANDI/U (1)
 mov r2, r21
 shl r2, #16 ' LSHU4 coni
 mov r3, ##$fff8 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_hyper_modifyB_ankP_arams
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_hyper_setB_urst_141
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_getBurst

 alignl ' align long
C_hyper_getB_urst ' <symbol:hyper_getBurst>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9v89_67e34742_getB_ankP_arams_L000092
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_getB_urst_146 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_getFlags

 alignl ' align long
C_hyper_getF_lags ' <symbol:hyper_getFlags>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9v89_67e34742_getB_ankP_arams_L000092
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_hyper_getF_lags_147 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_setQos

 alignl ' align long
C_hyper_setQ_os ' <symbol:hyper_setQos>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r15, ##-1 ' reg <- con
 mov r19, ##-1 ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C_hyper_setQ_os_149 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_hyper_setQ_os_148 ' JUMPV addrg
C_hyper_setQ_os_149
 cmps r23,  #0 wcz
 if_b jmp #\C_hyper_setQ_os_153 ' LTI4
 cmps r23,  #7 wcz
 if_be jmp #\C_hyper_setQ_os_151 ' LEI4
C_hyper_setQ_os_153
 mov r0, ##-6 ' RET con
 jmp #\@C_hyper_setQ_os_148 ' JUMPV addrg
C_hyper_setQ_os_151
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v82_67e34742_Q_osD_ata_L000004
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##-512 ' reg <- con
 and r20, r21 ' BANDI/U (2)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_getD_riverL_ock ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_hyper_setQ_os_155 ' JUMPV addrg
C_hyper_setQ_os_154
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_hyper_setQ_os_155
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_hyper_setQ_os_154 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r20, #240 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r20 ' ADDI/P
 adds r22, r0 ' ADDI/P (3)
 wrlong r22, r17 ' ASGNI4 reg reg
 jmp #\@C_hyper_setQ_os_158 ' JUMPV addrg
C_hyper_setQ_os_157
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_hyper_setQ_os_158
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C_hyper_setQ_os_157 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_setQ_os_148
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export hyper_getQos

 alignl ' align long
C_hyper_getQ_os ' <symbol:hyper_getQos>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 mov r22, r23
 and r22, #7 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v82_67e34742_Q_osD_ata_L000004
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_hyper_getQ_os_160 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_getBankParameters

 alignl ' align long
C_hyper_getB_ankP_arameters ' <symbol:hyper_getBankParameters>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 cmps r23,  #15 wcz
 if_be jmp #\C_hyper_getB_ankP_arameters_162 ' LEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_hyper_getB_ankP_arameters_161 ' JUMPV addrg
C_hyper_getB_ankP_arameters_162
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_getB_ankP_arameters_161
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_getPinParameters

 alignl ' align long
C_hyper_getP_inP_arameters ' <symbol:hyper_getPinParameters>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_hyper_initialize ' CALL addrg
 cmps r23,  #15 wcz
 if_be jmp #\C_hyper_getP_inP_arameters_165 ' LEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_hyper_getP_inP_arameters_164 ' JUMPV addrg
C_hyper_getP_inP_arameters_165
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 adds r22, #64 ' ADDI4 coni
 mov r20, ##@C_s9v81_67e34742_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_hyper_getP_inP_arameters_164
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_readRamIR

 alignl ' align long
C_hyper_readR_amI_R_ ' <symbol:hyper_readRamIR>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9v8a_67e34742_validH_yperR_A_M__L000112 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 if_nz jmp #\C_hyper_readR_amI_R__168 ' NEI4
 mov r2, r21
 and r2, #1 ' BANDI4 coni
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, ##57344 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_hyper_readR_aw
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_hyper_readR_amI_R__168
 mov r0, r17 ' CVI, CVU or LOAD
' C_hyper_readR_amI_R__167 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_readRamCR

 alignl ' align long
C_hyper_readR_amC_R_ ' <symbol:hyper_readRamCR>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9v8a_67e34742_validH_yperR_A_M__L000112 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 if_nz jmp #\C_hyper_readR_amC_R__171 ' NEI4
 mov r22, r21
 and r22, #1 ' BANDI4 coni
 mov r20, ##16777216 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, ##57344 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_hyper_readR_aw
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_hyper_readR_amC_R__171
 mov r0, r17 ' CVI, CVU or LOAD
' C_hyper_readR_amC_R__170 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export hyper_getDriverLatency

 alignl ' align long
C_hyper_getD_riverL_atency ' <symbol:hyper_getDriverLatency>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fd0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_s9v84_67e34742_drivercog_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_hyper_getM_ailbox ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_hyper_getD_riverL_atency_175 ' JUMPV addrg
C_hyper_getD_riverL_atency_174
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_hyper_getD_riverL_atency_175
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_hyper_getD_riverL_atency_174 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r20, #128 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r23 ' CVI, CVU or LOAD
 mov r16, ##$f000000 ' reg <- con
 and r18, r16 ' BANDI/U (1)
 add r20, r18 ' ADDU (1)
 mov r22, r0 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (2)
 wrlong r22, r19 ' ASGNI4 reg reg
C_hyper_getD_riverL_atency_177
 rdlong r21, r19 ' reg <- INDIRI4 reg
' C_hyper_getD_riverL_atency_178 ' (symbol refcount = 0)
 cmps r21,  #0 wcz
 if_b jmp #\C_hyper_getD_riverL_atency_177 ' LTI4
 cmps r21,  #0 wcz
 if_be jmp #\C_hyper_getD_riverL_atency_180 ' LEI4
 neg r21, r21 ' NEGI4
 jmp #\@C_hyper_getD_riverL_atency_181 ' JUMPV addrg
C_hyper_getD_riverL_atency_180
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #1 ' RSHU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
C_hyper_getD_riverL_atency_181
 mov r2, ##@C_s9v85_67e34742_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_hyper_getD_riverL_atency_173 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


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
