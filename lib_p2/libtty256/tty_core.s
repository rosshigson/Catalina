' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s5co_6174ad01_rxbase_L000002 ' <symbol:rxbase>
 long $0

 alignl ' align long
C_s5co1_6174ad01_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s5co2_6174ad01_initialize_L000004 ' <symbol:initialize>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s5co2_6174ad01_initialize_L000004_6 ' NEU4
 mov r2, #18 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__locate_plugin ' CALL addrg
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s5co2_6174ad01_initialize_L000004_8 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__registry ' CALL addrg
 PRIMITIVE(#LODL)
 long $ffffff
 mov r20, RI ' reg <- con
 mov r18, FP
 sub r18, #-(-4) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r20, r22 ' BANDI/U (2)
 PRIMITIVE(#LODL)
 long @C_s5co_6174ad01_rxbase_L000002
 wrlong r20, RI ' ASGNP4 addrg reg
 PRIMITIVE(#LODL)
 long @C_s5co1_6174ad01_lock_L000003
 mov r20, RI ' reg <- addrg
 shr r22, #24 ' RSHU4 coni
 PRIMITIVE(#LODL)
 long @C_s5co1_6174ad01_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s5co2_6174ad01_initialize_L000004_10 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__locknew ' CALL addrg
 PRIMITIVE(#LODL)
 long @C_s5co1_6174ad01_lock_L000003
 wrlong r0, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_s5co2_6174ad01_initialize_L000004_11 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r20, RI ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 PRIMITIVE(#JMPA)
 long @C_s5co2_6174ad01_initialize_L000004_11 ' JUMPV addrg
C_s5co2_6174ad01_initialize_L000004_10
 PRIMITIVE(#LODL)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 PRIMITIVE(#LODL)
 long @C_s5co1_6174ad01_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
C_s5co2_6174ad01_initialize_L000004_11
C_s5co2_6174ad01_initialize_L000004_8
C_s5co2_6174ad01_initialize_L000004_6
' C_s5co2_6174ad01_initialize_L000004_5 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export tty_rxflush

 alignl ' align long
C_tty_rxflush ' <symbol:tty_rxflush>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_tty_rxflush_18 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_s5co2_6174ad01_initialize_L000004 ' CALL addrg
C_tty_rxflush_17
C_tty_rxflush_18
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_tty_rxcheck ' CALL addrg
 cmps r0,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_tty_rxflush_17 ' GEI4
 mov r0, #0 ' RET coni
' C_tty_rxflush_14 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export tty_rxcheck

 alignl ' align long
C_tty_rxcheck ' <symbol:tty_rxcheck>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_tty_rxcheck_21 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_s5co2_6174ad01_initialize_L000004 ' CALL addrg
C_tty_rxcheck_21
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_rxcheck_23 ' LTI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_tty_rxcheck_23
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_tty_rxcheck_25 ' EQI4
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRI4 reg
 adds r22, #36 ' ADDP4 coni
 adds r22, r18 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #255 ' BANDI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 PRIMITIVE(#JMPA)
 long @C_tty_rxcheck_26 ' JUMPV addrg
C_tty_rxcheck_25
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
C_tty_rxcheck_26
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_rxcheck_27 ' LTI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_tty_rxcheck_27
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_tty_rxcheck_20 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export tty_rx

 alignl ' align long
C_tty_rx ' <symbol:tty_rx>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_tty_rx_33 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_s5co2_6174ad01_initialize_L000004 ' CALL addrg
C_tty_rx_32
C_tty_rx_33
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_tty_rxcheck ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_rx_32 ' LTI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_tty_rx_29 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export tty_tx

 alignl ' align long
C_tty_tx ' <symbol:tty_tx>
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_tty_tx_36 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_s5co2_6174ad01_initialize_L000004 ' CALL addrg
C_tty_tx_36
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_tx_41 ' LTI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_tty_tx_40
C_tty_tx_41
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #255 ' BANDI4 coni
 cmps r20, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_tty_tx_40 ' EQI4
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #292 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (2)
 wrbyte r23, r22 ' ASGNU1 reg reg
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 and r20, #255 ' BANDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_tty_tx_43 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_tty_rx ' CALL addrg
C_tty_tx_43
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_tx_45 ' LTI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_tty_tx_45
 mov r0, #0 ' RET coni
' C_tty_tx_35 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export tty_txflush

 alignl ' align long
C_tty_txflush ' <symbol:tty_txflush>
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_tty_txflush_48 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_s5co2_6174ad01_initialize_L000004 ' CALL addrg
C_tty_txflush_48
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_txflush_53 ' LTI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_tty_txflush_52
C_tty_txflush_53
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_tty_txflush_52 ' NEI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_txflush_55 ' LTI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_tty_txflush_55
 mov r0, #0 ' RET coni
' C_tty_txflush_47 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export tty_txcheck

 alignl ' align long
C_tty_txcheck ' <symbol:tty_txcheck>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_tty_txcheck_58 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_s5co2_6174ad01_initialize_L000004 ' CALL addrg
C_tty_txcheck_58
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_txcheck_60 ' LTI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_tty_txcheck_60
 PRIMITIVE(#LODI)
 long @C_s5co_6174ad01_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, #256 ' ADDI4 coni
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r20
 neg r22, r22 ' SUBI/P (2)
 and r22, #255 ' BANDI4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C_tty_txcheck_62 ' LTI4
 PRIMITIVE(#LODI)
 long @C_s5co1_6174ad01_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_tty_txcheck_62
 mov r22, #255 ' reg <- coni
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
' C_tty_txcheck_57 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _locknew

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
