' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sa98_6174adf0_rxbase_L000002 ' <symbol:rxbase>
 long $0

 alignl ' align long
C_sa981_6174adf0_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sa982_6174adf0_initialize_L000004 ' <symbol:initialize>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 mov r22, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_sa982_6174adf0_initialize_L000004_6  ' NEU4
 mov r2, #17 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__locate_plugin ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C_sa982_6174adf0_initialize_L000004_8 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__registry ' CALL addrg
 mov r20, ##$ffffff ' reg <- con
 mov r18, FP
 sub r18, #-(-4) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r20, r22 ' BANDI/U (2)
 wrlong r20, ##@C_sa98_6174adf0_rxbase_L000002 ' ASGNP4 addrg reg
 mov r20, ##@C_sa981_6174adf0_lock_L000003 ' reg <- addrg
 shr r22, #24 ' RSHU4 coni
 wrlong r22, ##@C_sa981_6174adf0_lock_L000003 ' ASGNI4 addrg reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sa982_6174adf0_initialize_L000004_10 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C_sa981_6174adf0_lock_L000003 ' ASGNI4 addrg reg
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_sa982_6174adf0_initialize_L000004_11 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##@C_sa981_6174adf0_lock_L000003
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
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
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sa982_6174adf0_initialize_L000004_11 ' JUMPV addrg
C_sa982_6174adf0_initialize_L000004_10
 mov r22, ##@C_sa981_6174adf0_lock_L000003 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, ##@C_sa981_6174adf0_lock_L000003 ' ASGNI4 addrg reg
C_sa982_6174adf0_initialize_L000004_11
C_sa982_6174adf0_initialize_L000004_8
C_sa982_6174adf0_initialize_L000004_6
' C_sa982_6174adf0_initialize_L000004_5 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export s4_rxflush

 alignl ' align long
C_s4_rxflush ' <symbol:s4_rxflush>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s4_rxflush_15  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sa982_6174adf0_initialize_L000004 ' CALL addrg
C_s4_rxflush_15
 cmp r23,  #3 wcz 
 if_be jmp #\C_s4_rxflush_20 ' LEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_s4_rxflush_14 ' JUMPV addrg
C_s4_rxflush_19
C_s4_rxflush_20
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s4_rxcheck ' CALL addrg
 cmps r0,  #0 wcz
 if_ae jmp #\C_s4_rxflush_19 ' GEI4
 mov r0, #0 ' reg <- coni
C_s4_rxflush_14
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s4_rxcheck

 alignl ' align long
C_s4_rxcheck ' <symbol:s4_rxcheck>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $d54000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s4_rxcheck_23  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sa982_6174adf0_initialize_L000004 ' CALL addrg
C_s4_rxcheck_23
 cmp r23,  #3 wcz 
 if_be jmp #\C_s4_rxcheck_25 ' LEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_s4_rxcheck_22 ' JUMPV addrg
C_s4_rxcheck_25
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s4_rxcheck_27 ' LTI4
 mov r2, ##@C_sa981_6174adf0_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s4_rxcheck_27
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #16 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r18, r22 wz
 if_z jmp #\C_s4_rxcheck_29 ' EQI4
 mov r22, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, r23
 shl r20, #2 ' LSHU4 coni
 mov r18, r22
 adds r18, #16 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov r18, r22
 adds r18, #192 ' ADDP4 coni
 adds r18, r23 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 rdlong r16, r20 ' reg <- INDIRI4 reg
 mov r14, r23
 shl r14, #4 ' LSHU4 coni
 shl r14, #2 ' LSHU4 coni
 adds r22, #324 ' ADDP4 coni
 adds r22, r14 ' ADDI/P (2)
 adds r22, r16 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 xor r22, r18 ' BXORI/U (2)
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #63 ' BANDI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 jmp #\@C_s4_rxcheck_30 ' JUMPV addrg
C_s4_rxcheck_29
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s4_rxcheck_30
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s4_rxcheck_31 ' LTI4
 mov r2, ##@C_sa981_6174adf0_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s4_rxcheck_31
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s4_rxcheck_22
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export s4_rx

 alignl ' align long
C_s4_rx ' <symbol:s4_rx>
 PRIMITIVE(#PSHM)
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s4_rx_34  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sa982_6174adf0_initialize_L000004 ' CALL addrg
C_s4_rx_34
 cmp r23,  #3 wcz 
 if_be jmp #\C_s4_rx_39 ' LEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_s4_rx_33 ' JUMPV addrg
C_s4_rx_38
C_s4_rx_39
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s4_rxcheck ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wcz
 if_b jmp #\C_s4_rx_38 ' LTI4
 mov r0, r21 ' CVI, CVU or LOAD
C_s4_rx_33
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s4_tx

 alignl ' align long
C_s4_tx ' <symbol:s4_tx>
 PRIMITIVE(#PSHM)
 long $f50000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s4_tx_42  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sa982_6174adf0_initialize_L000004 ' CALL addrg
C_s4_tx_42
 cmp r23,  #3 wcz 
 if_be jmp #\C_s4_tx_44 ' LEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_s4_tx_41 ' JUMPV addrg
C_s4_tx_44
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s4_tx_49 ' LTI4
 mov r2, ##@C_sa981_6174adf0_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s4_tx_48
C_s4_tx_49
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #48 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #15 ' BANDI4 coni
 cmps r18, r22 wz
 if_z jmp #\C_s4_tx_48 ' EQI4
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #32 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHU4 coni
 mov r16, ##580 ' reg <- con
 adds r20, r16 ' ADDI/P (1)
 adds r22, r20 ' ADDI/P (1)
 adds r22, r18 ' ADDI/P (2)
 wrbyte r21, r22 ' ASGNU1 reg reg
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 and r20, #15 ' BANDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r20, #128 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s4_tx_51 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s4_rx ' CALL addrg
C_s4_tx_51
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s4_tx_53 ' LTI4
 mov r2, ##@C_sa981_6174adf0_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s4_tx_53
 mov r0, #0 ' reg <- coni
C_s4_tx_41
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s4_txflush

 alignl ' align long
C_s4_txflush ' <symbol:s4_txflush>
 PRIMITIVE(#PSHM)
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s4_txflush_56  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sa982_6174adf0_initialize_L000004 ' CALL addrg
C_s4_txflush_56
 cmp r23,  #3 wcz 
 if_be jmp #\C_s4_txflush_58 ' LEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_s4_txflush_55 ' JUMPV addrg
C_s4_txflush_58
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s4_txflush_63 ' LTI4
 mov r2, ##@C_sa981_6174adf0_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s4_txflush_62
C_s4_txflush_63
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #48 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r18, r22 wz
 if_nz jmp #\C_s4_txflush_62 ' NEI4
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s4_txflush_65 ' LTI4
 mov r2, ##@C_sa981_6174adf0_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s4_txflush_65
 mov r0, #0 ' reg <- coni
C_s4_txflush_55
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export s4_txcheck

 alignl ' align long
C_s4_txcheck ' <symbol:s4_txcheck>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s4_txcheck_68  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_sa982_6174adf0_initialize_L000004 ' CALL addrg
C_s4_txcheck_68
 cmp r23,  #3 wcz 
 if_be jmp #\C_s4_txcheck_70 ' LEU4
 mov r0, ##-1 ' RET con
 jmp #\@C_s4_txcheck_67 ' JUMPV addrg
C_s4_txcheck_70
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s4_txcheck_72 ' LTI4
 mov r2, ##@C_sa981_6174adf0_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__acquire_lock ' CALL addrg
C_s4_txcheck_72
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sa98_6174adf0_rxbase_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #32 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r18, #16 ' ADDI4 coni
 adds r20, #48 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r18
 neg r22, r22 ' SUBI/P (2)
 and r22, #15 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sa981_6174adf0_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s4_txcheck_74 ' LTI4
 mov r2, ##@C_sa981_6174adf0_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__release_lock ' CALL addrg
C_s4_txcheck_74
 mov r22, #15 ' reg <- coni
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
C_s4_txcheck_67
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _locknew

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
