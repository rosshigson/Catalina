' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s1v8_68dcc03b_startupD_ata_L000002 ' <symbol:startupData>
 long $0

 alignl ' align long
C_s1v81_68dcc03b_deviceD_ata_L000003 ' <symbol:deviceData>
 long $0

 alignl ' align long
C_s1v82_68dcc03b_Q_osD_ata_L000004 ' <symbol:QosData>
 long $0

 alignl ' align long
C_s1v83_68dcc03b_mailboxes_L000005 ' <symbol:mailboxes>
 long $0

 alignl ' align long
C_s1v84_68dcc03b_drivercog_L000006 ' <symbol:drivercog>
 long -1

 alignl ' align long
C_s1v85_68dcc03b_driverlock_L000007 ' <symbol:driverlock>
 long -1

 alignl ' align long
C_s1v86_68dcc03b_delayT_able_L000008 ' <symbol:delayTable>
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
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #3 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_s1v83_68dcc03b_mailboxes_L000005
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_psram_getM_ailbox_9 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export psram_initialize

 alignl ' align long
C_psram_initialize ' <symbol:psram_initialize>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_s1v8_68dcc03b_startupD_ata_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_psram_initialize_11 ' NEU4
 mov r2, #28 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 jmp #LODL
 long @C_s1v84_68dcc03b_drivercog_L000006
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_s1v84_68dcc03b_drivercog_L000006
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_psram_initialize_13 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 jmp #LODI
 long @C_s1v84_68dcc03b_drivercog_L000006
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
 long @C_s1v8_68dcc03b_startupD_ata_L000002
 mov r22, RI ' reg <- addrg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 and r20, r18 ' BANDI/U (2)
 jmp #LODL
 long @C_s1v8_68dcc03b_startupD_ata_L000002
 wrlong r20, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_s1v81_68dcc03b_deviceD_ata_L000003
 mov r20, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 jmp #LODL
 long @C_s1v81_68dcc03b_deviceD_ata_L000003
 wrlong r22, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_s1v82_68dcc03b_Q_osD_ata_L000004
 mov r22, RI ' reg <- addrg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #128 ' ADDP4 coni
 jmp #LODL
 long @C_s1v82_68dcc03b_Q_osD_ata_L000004
 wrlong r20, RI ' ASGNP4 addrg reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 jmp #LODL
 long @C_s1v83_68dcc03b_mailboxes_L000005
 wrlong r22, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_s1v85_68dcc03b_driverlock_L000007
 mov r22, RI ' reg <- addrg
 mov r20, r18
 shr r20, #24 ' RSHU4 coni
 jmp #LODL
 long @C_s1v85_68dcc03b_driverlock_L000007
 wrlong r20, RI ' ASGNI4 addrg reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_psram_initialize_15 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C_s1v85_68dcc03b_driverlock_L000007
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_s1v85_68dcc03b_driverlock_L000007
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_psram_initialize_16 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODI
 long @C_s1v85_68dcc03b_driverlock_L000007
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
 long @C_s1v84_68dcc03b_drivercog_L000006
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
 long @C_psram_initialize_16 ' JUMPV addrg
C_psram_initialize_15
 jmp #LODL
 long @C_s1v85_68dcc03b_driverlock_L000007
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_s1v85_68dcc03b_driverlock_L000007
 wrlong r22, RI ' ASGNI4 addrg reg
C_psram_initialize_16
C_psram_initialize_13
C_psram_initialize_11
 jmp #LODI
 long @C_s1v84_68dcc03b_drivercog_L000006
 mov r0, RI ' reg <- INDIRI4 addrg
' C_psram_initialize_10 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export psram_stop

 alignl ' align long
C_psram_stop ' <symbol:psram_stop>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, #0 ' reg <- coni
 jmp #LODL
 long -1
 mov r19, RI ' reg <- con
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_initialize ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_psram_stop_20 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__cogstop ' CALL addrg
 mov r23, #0 ' reg <- coni
C_psram_stop_22
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_psram_stop_26 ' GEI4
 mov r22, #16 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_psram_stop_26
' C_psram_stop_23 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wcz
 jmp #BR_B
 long @C_psram_stop_22 ' LTI4
C_psram_stop_20
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_s1v84_68dcc03b_drivercog_L000006
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_s1v85_68dcc03b_driverlock_L000007
 mov r20, RI ' reg <- INDIRI4 addrg
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_psram_stop_28 ' EQI4
 jmp #LODI
 long @C_s1v85_68dcc03b_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockret ' CALL addrg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_s1v85_68dcc03b_driverlock_L000007
 wrlong r22, RI ' ASGNI4 addrg reg
C_psram_stop_28
 mov r0, r23 ' CVI, CVU or LOAD
' C_psram_stop_19 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export psram_getDriverLock

 alignl ' align long
C_psram_getD_riverL_ock ' <symbol:psram_getDriverLock>
 jmp #NEWF
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_initialize ' CALL addrg
 jmp #LODI
 long @C_s1v85_68dcc03b_driverlock_L000007
 mov r0, RI ' reg <- INDIRI4 addrg
' C_psram_getD_riverL_ock_30 ' (symbol refcount = 0)
 jmp #RETF


 alignl ' align long
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031 ' <symbol:psram_modifyBankParams>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #LODI
 long @C_s1v84_68dcc03b_drivercog_L000006
 mov r22, RI ' reg <- INDIRI4 addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_33 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_32 ' JUMPV addrg
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_33
 jmp #LODI
 long @C_s1v84_68dcc03b_drivercog_L000006
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_psram_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_36 ' JUMPV addrg
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_35
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_36
 jmp #LODI
 long @C_s1v85_68dcc03b_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_35 ' EQI4
 mov r15, #0 ' reg <- coni
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_38
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_s1v81_68dcc03b_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, r23 ' BANDI/U (1)
 mov r13, r22 ' BORI/U
 or r13, r21 ' BORI/U (3)
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 wrlong r13, r22 ' ASGNI4 reg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, #224 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r18, r15
 shl r18, #24 ' LSHI4 coni
 adds r20, r18 ' ADDI/P (1)
 mov r22, r20 ' ADDI/P
 adds r22, r0 ' ADDI/P (3)
 wrlong r22, r17 ' ASGNI4 reg reg
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_42
 rdlong r19, r17 ' reg <- INDIRI4 reg
' C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_43 ' (symbol refcount = 0)
 cmps r19,  #0 wcz
 jmp #BR_B
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_42 ' LTI4
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_45 ' NEI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_s1v81_68dcc03b_deviceD_ata_L000003
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r13, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_46 ' JUMPV addrg
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_45
 neg r19, r19 ' NEGI4
 jmp #JMPA
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_40 ' JUMPV addrg
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_46
' C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_39 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #2 wcz
 jmp #BR_B
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_38 ' LTI4
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_40
 jmp #LODI
 long @C_s1v85_68dcc03b_driverlock_L000007
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r0, r19 ' CVI, CVU or LOAD
C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031_32
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s1v88_68dcc03b_psram_lookupD_elay_L000047 ' <symbol:psram_lookupDelay>
 jmp #PSHM
 long $f40000 ' save registers
 mov r21, #0 ' reg <- coni
 mov r23, #0 ' reg <- coni
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s1v86_68dcc03b_delayT_able_L000008
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s1v88_68dcc03b_psram_lookupD_elay_L000047_50 ' JUMPV addrg
C_s1v88_68dcc03b_psram_lookupD_elay_L000047_49
 mov r22, r2 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s1v86_68dcc03b_delayT_able_L000008+4
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BRAE
 long @C_s1v88_68dcc03b_psram_lookupD_elay_L000047_53 ' GEU4
 jmp #JMPA
 long @C_s1v88_68dcc03b_psram_lookupD_elay_L000047_51 ' JUMPV addrg
C_s1v88_68dcc03b_psram_lookupD_elay_L000047_53
 adds r23, #1 ' ADDI4 coni
 adds r21, #1 ' ADDI4 coni
C_s1v88_68dcc03b_psram_lookupD_elay_L000047_50
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_s1v86_68dcc03b_delayT_able_L000008+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s1v88_68dcc03b_psram_lookupD_elay_L000047_49 ' NEU4
C_s1v88_68dcc03b_psram_lookupD_elay_L000047_51
 mov r0, r21 ' CVI, CVU or LOAD
' C_s1v88_68dcc03b_psram_lookupD_elay_L000047_48 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export psram_setDelay

 alignl ' align long
C_psram_setD_elay ' <symbol:psram_setDelay>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_initialize ' CALL addrg
 mov r22, r23
 and r22, #15 ' BANDI4 coni
 mov r2, r22
 shl r2, #12 ' LSHI4 coni
 jmp #LODL
 long -61441
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_setD_elay_56 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export psram_setFrequency

 alignl ' align long
C_psram_setF_requency ' <symbol:psram_setFrequency>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_initialize ' CALL addrg
 cmps r23,  #0 wz
 jmp #BRNZ
 long @C_psram_setF_requency_58 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
C_psram_setF_requency_58
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s1v88_68dcc03b_psram_lookupD_elay_L000047 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_psram_setD_elay ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_setF_requency_57 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export psram_getDelay

 alignl ' align long
C_psram_getD_elay ' <symbol:psram_getDelay>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_initialize ' CALL addrg
 jmp #LODI
 long @C_s1v81_68dcc03b_deviceD_ata_L000003
 mov r22, RI ' reg <- INDIRP4 addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sar r22, #12 ' RSHI4 coni
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_psram_getD_elay_60 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export psram_setBurst

 alignl ' align long
C_psram_setB_urst ' <symbol:psram_setBurst>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_initialize ' CALL addrg
 mov r2, r23
 shl r2, #16 ' LSHI4 coni
 jmp #LODL
 long 65535
 mov r3, RI ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s1v87_68dcc03b_psram_modifyB_ankP_arams_L000031
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_psram_setB_urst_61 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export psram_getBurst

 alignl ' align long
C_psram_getB_urst ' <symbol:psram_getBurst>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_initialize ' CALL addrg
 jmp #LODI
 long @C_s1v81_68dcc03b_deviceD_ata_L000003
 mov r22, RI ' reg <- INDIRP4 addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22
 sar r0, #16 ' RSHI4 coni
' C_psram_getB_urst_62 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export psram_setQos

 alignl ' align long
C_psram_setQ_os ' <symbol:psram_setQos>
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
 long @C_psram_initialize ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_psram_setQ_os_64 ' NEI4
 jmp #LODL
 long -15
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_psram_setQ_os_63 ' JUMPV addrg
C_psram_setQ_os_64
 cmps r23,  #0 wcz
 jmp #BR_B
 long @C_psram_setQ_os_68 ' LTI4
 cmps r23,  #7 wcz
 jmp #BRBE
 long @C_psram_setQ_os_66 ' LEI4
C_psram_setQ_os_68
 jmp #LODL
 long -6
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_psram_setQ_os_63 ' JUMPV addrg
C_psram_setQ_os_66
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_s1v82_68dcc03b_Q_osD_ata_L000004
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
 long @C_psram_getM_ailbox ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_getD_riverL_ock ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_psram_setQ_os_70 ' JUMPV addrg
C_psram_setQ_os_69
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_psram_setQ_os_70
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locktry ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_psram_setQ_os_69 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cogid ' CALL addrg
 mov r20, #240 ' reg <- coni
 shl r20, #24 ' LSHI4 coni
 mov r22, r20 ' ADDI/P
 adds r22, r0 ' ADDI/P (3)
 wrlong r22, r17 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_psram_setQ_os_73 ' JUMPV addrg
C_psram_setQ_os_72
 mov r2, #1 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitms ' CALL addrg
C_psram_setQ_os_73
 rdlong r22, r17 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_psram_setQ_os_72 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_psram_setQ_os_63
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export psram_getQos

 alignl ' align long
C_psram_getQ_os ' <symbol:psram_getQos>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_psram_initialize ' CALL addrg
 mov r22, r23
 and r22, #7 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_s1v82_68dcc03b_Q_osD_ata_L000004
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_psram_getQ_os_75 ' (symbol refcount = 0)
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
