' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s2f8_670edce6_startupD_ata_L000002 ' <symbol:startupData>
 long $0

 alignl ' align long
C_s2f81_670edce6_deviceD_ata_L000003 ' <symbol:deviceData>
 long $0

 alignl ' align long
C_s2f82_670edce6_Q_osD_ata_L000004 ' <symbol:QosData>
 long $0

 alignl ' align long
C_s2f83_670edce6_mailboxes_L000005 ' <symbol:mailboxes>
 long $0

 alignl ' align long
C_s2f84_670edce6_drivercog_L000006 ' <symbol:drivercog>
 long -1

 alignl ' align long
C_s2f85_670edce6_driverlock_L000007 ' <symbol:driverlock>
 long -1

 alignl ' align long
C_s2f86_670edce6_delayT_able_L000008 ' <symbol:delayTable>
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

 alignl ' align long
C_psram_getM_ailbox ' <symbol:psram_getMailbox>
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
 mov r20, ##@C_s2f83_670edce6_mailboxes_L000005
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_psram_getM_ailbox_9 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export psram_initialize

 alignl ' align long
C_psram_initialize ' <symbol:psram_initialize>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##@C_s2f8_670edce6_startupD_ata_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_psram_initialize_11  ' NEU4
 mov r2, #28 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locate_plugin ' CALL addrg
 wrlong r0, ##@C_s2f84_670edce6_drivercog_L000006 ' ASGNI4 addrg reg
 mov r22, ##@C_s2f84_670edce6_drivercog_L000006
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_psram_initialize_13 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r20, ##$ffffff ' reg <- con
 mov r18, ##@C_s2f84_670edce6_drivercog_L000006
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
 mov r22, ##@C_s2f8_670edce6_startupD_ata_L000002 ' reg <- addrg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 and r20, r18 ' BANDI/U (2)
 wrlong r20, ##@C_s2f8_670edce6_startupD_ata_L000002 ' ASGNP4 addrg reg
 mov r20, ##@C_s2f81_670edce6_deviceD_ata_L000003 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 wrlong r22, ##@C_s2f81_670edce6_deviceD_ata_L000003 ' ASGNP4 addrg reg
 mov r22, ##@C_s2f82_670edce6_Q_osD_ata_L000004 ' reg <- addrg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #128 ' ADDP4 coni
 wrlong r20, ##@C_s2f82_670edce6_Q_osD_ata_L000004 ' ASGNP4 addrg reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 wrlong r22, ##@C_s2f83_670edce6_mailboxes_L000005 ' ASGNP4 addrg reg
 mov r22, ##@C_s2f85_670edce6_driverlock_L000007 ' reg <- addrg
 mov r20, r18
 shr r20, #24 ' RSHU4 coni
 wrlong r20, ##@C_s2f85_670edce6_driverlock_L000007 ' ASGNI4 addrg reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_psram_initialize_15 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C_s2f85_670edce6_driverlock_L000007 ' ASGNI4 addrg reg
 mov r22, ##@C_s2f85_670edce6_driverlock_L000007
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_psram_initialize_16 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##@C_s2f85_670edce6_driverlock_L000007
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
 mov r20, ##@C_s2f84_670edce6_drivercog_L000006
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
 jmp #\@C_psram_initialize_16 ' JUMPV addrg
C_psram_initialize_15
 mov r22, ##@C_s2f85_670edce6_driverlock_L000007 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, ##@C_s2f85_670edce6_driverlock_L000007 ' ASGNI4 addrg reg
C_psram_initialize_16
C_psram_initialize_13
C_psram_initialize_11
 mov r0, ##@C_s2f84_670edce6_drivercog_L000006
 rdlong r0, r0 ' reg <- INDIRI4 addrg
' C_psram_initialize_10 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export psram_stop

 alignl ' align long
C_psram_stop ' <symbol:psram_stop>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, #0 ' reg <- coni
 mov r19, ##-1 ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r19, r22 wz
 if_z jmp #\C_psram_stop_20 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__cogstop ' CALL addrg
 mov r23, #0 ' reg <- coni
C_psram_stop_22
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_ae jmp #\C_psram_stop_26 ' GEI4
 mov r22, #16 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_psram_stop_26
' C_psram_stop_23 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wcz
 if_b jmp #\C_psram_stop_22 ' LTI4
C_psram_stop_20
 mov r22, ##-1 ' reg <- con
 wrlong r22, ##@C_s2f84_670edce6_drivercog_L000006 ' ASGNI4 addrg reg
 mov r20, ##@C_s2f85_670edce6_driverlock_L000007
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 cmps r20, r22 wz
 if_z jmp #\C_psram_stop_28 ' EQI4
 mov r2, ##@C_s2f85_670edce6_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockret ' CALL addrg
 mov r22, ##-1 ' reg <- con
 wrlong r22, ##@C_s2f85_670edce6_driverlock_L000007 ' ASGNI4 addrg reg
C_psram_stop_28
 mov r0, r23 ' CVI, CVU or LOAD
' C_psram_stop_19 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_getDriverLock

 alignl ' align long
C_psram_getD_riverL_ock ' <symbol:psram_getDriverLock>
 calld PA,#NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r0, ##@C_s2f85_670edce6_driverlock_L000007
 rdlong r0, r0 ' reg <- INDIRI4 addrg
' C_psram_getD_riverL_ock_30 ' (symbol refcount = 0)
 calld PA,#RETF


 alignl ' align long
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031 ' <symbol:psram_modifyBankParams>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r22, ##@C_s2f84_670edce6_drivercog_L000006
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_33 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_32 ' JUMPV addrg
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_33
 mov r2, ##@C_s2f84_670edce6_drivercog_L000006
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_36 ' JUMPV addrg
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_35
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_36
 mov r2, ##@C_s2f85_670edce6_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_35 ' EQI4
 mov r15, #0 ' reg <- coni
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_38
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s2f81_670edce6_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, r23 ' BANDI/U (1)
 mov r13, r22 ' BORI/U
 or r13, r21 ' BORI/U (3)
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 wrlong r13, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r20, #224 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r15
 shl r18, #24 ' LSHI4 coni
 adds r20, r18 ' ADDI/P (1)
 mov r22, r20 ' ADDI/P
 adds r22, r0 ' ADDI/P (3)
 wrlong r22, r17 ' ASGNI4 reg reg
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_42
 rdlong r19, r17 ' reg <- INDIRI4 reg
' C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_43 ' (symbol refcount = 0)
 cmps r19,  #0 wcz
 if_b jmp #\C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_42 ' LTI4
 cmps r19,  #0 wz
 if_nz jmp #\C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_45 ' NEI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s2f81_670edce6_deviceD_ata_L000003
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r13, r22 ' ASGNI4 reg reg
 jmp #\@C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_46 ' JUMPV addrg
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_45
 neg r19, r19 ' NEGI4
 jmp #\@C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_40 ' JUMPV addrg
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_46
' C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_39 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #2 wcz
 if_b jmp #\C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_38 ' LTI4
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_40
 mov r2, ##@C_s2f85_670edce6_driverlock_L000007
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031_32
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2f88_670edce6_psram_lookupD_elay_L000047 ' <symbol:psram_lookupDelay>
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r21, #0 ' reg <- coni
 mov r23, #0 ' reg <- coni
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s2f86_670edce6_delayT_able_L000008 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #\@C_s2f88_670edce6_psram_lookupD_elay_L000047_50 ' JUMPV addrg
C_s2f88_670edce6_psram_lookupD_elay_L000047_49
 mov r22, r2 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C_s2f86_670edce6_delayT_able_L000008+4 ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_s2f88_670edce6_psram_lookupD_elay_L000047_53 ' GEU4
 jmp #\@C_s2f88_670edce6_psram_lookupD_elay_L000047_51 ' JUMPV addrg
C_s2f88_670edce6_psram_lookupD_elay_L000047_53
 adds r23, #1 ' ADDI4 coni
 adds r21, #1 ' ADDI4 coni
C_s2f88_670edce6_psram_lookupD_elay_L000047_50
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s2f86_670edce6_delayT_able_L000008+4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s2f88_670edce6_psram_lookupD_elay_L000047_49  ' NEU4
C_s2f88_670edce6_psram_lookupD_elay_L000047_51
 mov r0, r21 ' CVI, CVU or LOAD
' C_s2f88_670edce6_psram_lookupD_elay_L000047_48 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export psram_setDelay

 alignl ' align long
C_psram_setD_elay ' <symbol:psram_setDelay>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r22, r23
 and r22, #15 ' BANDI4 coni
 mov r2, r22
 shl r2, #12 ' LSHI4 coni
 mov r3, ##-61441 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_setD_elay_56 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_setFrequency

 alignl ' align long
C_psram_setF_requency ' <symbol:psram_setFrequency>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 cmps r23,  #0 wz
 if_nz jmp #\C_psram_setF_requency_58 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_psram_setF_requency_58
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2f88_670edce6_psram_lookupD_elay_L000047 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_psram_setD_elay ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_setF_requency_57 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_getDelay

 alignl ' align long
C_psram_getD_elay ' <symbol:psram_getDelay>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r22, ##@C_s2f81_670edce6_deviceD_ata_L000003
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sar r22, #12 ' RSHI4 coni
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_psram_getD_elay_60 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_setBurst

 alignl ' align long
C_psram_setB_urst ' <symbol:psram_setBurst>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r2, r23
 shl r2, #16 ' LSHI4 coni
 mov r3, ##65535 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2f87_670edce6_psram_modifyB_ankP_arams_L000031
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_setB_urst_61 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_getBurst

 alignl ' align long
C_psram_getB_urst ' <symbol:psram_getBurst>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r22, ##@C_s2f81_670edce6_deviceD_ata_L000003
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22
 sar r0, #16 ' RSHI4 coni
' C_psram_getB_urst_62 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export psram_setQos

 alignl ' align long
C_psram_setQ_os ' <symbol:psram_setQos>
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
 long @C_psram_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r15, r22 wz
 if_nz jmp #\C_psram_setQ_os_64 ' NEI4
 mov r0, ##-15 ' RET con
 jmp #\@C_psram_setQ_os_63 ' JUMPV addrg
C_psram_setQ_os_64
 cmps r23,  #0 wcz
 if_b jmp #\C_psram_setQ_os_68 ' LTI4
 cmps r23,  #7 wcz
 if_be jmp #\C_psram_setQ_os_66 ' LEI4
C_psram_setQ_os_68
 mov r0, ##-6 ' RET con
 jmp #\@C_psram_setQ_os_63 ' JUMPV addrg
C_psram_setQ_os_66
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s2f82_670edce6_Q_osD_ata_L000004
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##-512 ' reg <- con
 and r20, r21 ' BANDI/U (2)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_getD_riverL_ock ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_psram_setQ_os_70 ' JUMPV addrg
C_psram_setQ_os_69
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_psram_setQ_os_70
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_psram_setQ_os_69 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r20, #240 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r20 ' ADDI/P
 adds r22, r0 ' ADDI/P (3)
 wrlong r22, r17 ' ASGNI4 reg reg
 jmp #\@C_psram_setQ_os_73 ' JUMPV addrg
C_psram_setQ_os_72
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitms ' CALL addrg
C_psram_setQ_os_73
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C_psram_setQ_os_72 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__lockclr ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_psram_setQ_os_63
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export psram_getQos

 alignl ' align long
C_psram_getQ_os ' <symbol:psram_getQos>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_psram_initialize ' CALL addrg
 mov r22, r23
 and r22, #7 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s2f82_670edce6_Q_osD_ata_L000004
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_psram_getQ_os_75 ' (symbol refcount = 0)
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
