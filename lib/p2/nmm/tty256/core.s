' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_skmk_664ed9ec_rxbase_L000002 ' <symbol:rxbase>
 long $0

 alignl ' align long
C_skmk1_664ed9ec_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_skmk2_664ed9ec_initialize_L000004 ' <symbol:initialize>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_skmk2_664ed9ec_initialize_L000004_6  ' NEU4
 mov r2, #18 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__locate_plugin ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C_skmk2_664ed9ec_initialize_L000004_8 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r20, ##$ffffff ' reg <- con
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r20, r22 ' BANDI/U (2)
 wrlong r20, ##@C_skmk_664ed9ec_rxbase_L000002 ' ASGNP4 addrg reg
 mov r20, ##@C_skmk1_664ed9ec_lock_L000003 ' reg <- addrg
 shr r22, #24 ' RSHU4 coni
 wrlong r22, ##@C_skmk1_664ed9ec_lock_L000003 ' ASGNI4 addrg reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_skmk2_664ed9ec_initialize_L000004_10 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C_skmk1_664ed9ec_lock_L000003 ' ASGNI4 addrg reg
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_skmk2_664ed9ec_initialize_L000004_11 ' LTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_skmk2_664ed9ec_initialize_L000004_11 ' JUMPV addrg
C_skmk2_664ed9ec_initialize_L000004_10
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, ##@C_skmk1_664ed9ec_lock_L000003 ' ASGNI4 addrg reg
C_skmk2_664ed9ec_initialize_L000004_11
C_skmk2_664ed9ec_initialize_L000004_8
C_skmk2_664ed9ec_initialize_L000004_6
' C_skmk2_664ed9ec_initialize_L000004_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export tty_rxflush

 alignl ' align long
C_tty_rxflush ' <symbol:tty_rxflush>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_tty_rxflush_18  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_skmk2_664ed9ec_initialize_L000004 ' CALL addrg
C_tty_rxflush_17
C_tty_rxflush_18
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_tty_rxcheck ' CALL addrg
 cmps r0,  #0 wcz
 if_ae jmp #\C_tty_rxflush_17 ' GEI4
 mov r0, #0 ' reg <- coni
' C_tty_rxflush_14 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export tty_rxcheck

 alignl ' align long
C_tty_rxcheck ' <symbol:tty_rxcheck>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_tty_rxcheck_21  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_skmk2_664ed9ec_initialize_L000004 ' CALL addrg
C_tty_rxcheck_21
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_tty_rxcheck_23 ' LTI4
 mov r2, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_tty_rxcheck_23
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_z jmp #\C_tty_rxcheck_25 ' EQI4
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRI4 reg
 adds r22, #36 ' ADDP4 coni
 adds r22, r18 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #255 ' BANDI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 jmp #\@C_tty_rxcheck_26 ' JUMPV addrg
C_tty_rxcheck_25
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_tty_rxcheck_26
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_tty_rxcheck_27 ' LTI4
 mov r2, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_tty_rxcheck_27
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_tty_rxcheck_20 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export tty_rx

 alignl ' align long
C_tty_rx ' <symbol:tty_rx>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_tty_rx_33  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_skmk2_664ed9ec_initialize_L000004 ' CALL addrg
C_tty_rx_32
C_tty_rx_33
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_tty_rxcheck ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wcz
 if_b jmp #\C_tty_rx_32 ' LTI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_tty_rx_29 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export tty_tx

 alignl ' align long
C_tty_tx ' <symbol:tty_tx>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_tty_tx_36  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_skmk2_664ed9ec_initialize_L000004 ' CALL addrg
C_tty_tx_36
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_tty_tx_41 ' LTI4
 mov r2, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_tty_tx_40
C_tty_tx_41
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #255 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_tty_tx_40 ' EQI4
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #292 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (2)
 wrbyte r23, r22 ' ASGNU1 reg reg
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 and r20, #255 ' BANDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_tty_tx_43 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_tty_rx ' CALL addrg
C_tty_tx_43
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_tty_tx_45 ' LTI4
 mov r2, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_tty_tx_45
 mov r0, #0 ' reg <- coni
' C_tty_tx_35 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export tty_txflush

 alignl ' align long
C_tty_txflush ' <symbol:tty_txflush>
 calld PA,#NEWF
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_tty_txflush_48  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_skmk2_664ed9ec_initialize_L000004 ' CALL addrg
C_tty_txflush_48
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_tty_txflush_53 ' LTI4
 mov r2, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_tty_txflush_52
C_tty_txflush_53
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_nz jmp #\C_tty_txflush_52 ' NEI4
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_tty_txflush_55 ' LTI4
 mov r2, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_tty_txflush_55
 mov r0, #0 ' reg <- coni
' C_tty_txflush_47 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export tty_txcheck

 alignl ' align long
C_tty_txcheck ' <symbol:tty_txcheck>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_tty_txcheck_58  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_skmk2_664ed9ec_initialize_L000004 ' CALL addrg
C_tty_txcheck_58
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_tty_txcheck_60 ' LTI4
 mov r2, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_tty_txcheck_60
 mov r22, ##@C_skmk_664ed9ec_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, #256 ' ADDI4 coni
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r20
 neg r22, r22 ' SUBI/P (2)
 and r22, #255 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_tty_txcheck_62 ' LTI4
 mov r2, ##@C_skmk1_664ed9ec_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_tty_txcheck_62
 mov r22, #255 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
' C_tty_txcheck_57 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import _locknew

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
