' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_src4_68804d15_rxbase_L000002 ' <symbol:rxbase>
 long $0

 alignl ' align long
C_src41_68804d15_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_src42_68804d15_initialize_L000004 ' <symbol:initialize>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_src42_68804d15_initialize_L000004_6 ' NEU4
 mov r2, #18 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_src42_68804d15_initialize_L000004_8 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r20, r22 ' BANDI/U (2)
 jmp #LODL
 long @C_src4_68804d15_rxbase_L000002
 wrlong r20, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_src41_68804d15_lock_L000003
 mov r20, RI ' reg <- addrg
 shr r22, #24 ' RSHU4 coni
 jmp #LODL
 long @C_src41_68804d15_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_src42_68804d15_initialize_L000004_10 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C_src41_68804d15_lock_L000003
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_src42_68804d15_initialize_L000004_11 ' LTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r20, RI ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #JMPA
 long @C_src42_68804d15_initialize_L000004_11 ' JUMPV addrg
C_src42_68804d15_initialize_L000004_10
 jmp #LODL
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_src41_68804d15_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
C_src42_68804d15_initialize_L000004_11
C_src42_68804d15_initialize_L000004_8
C_src42_68804d15_initialize_L000004_6
' C_src42_68804d15_initialize_L000004_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export s_rxflush

 alignl ' align long
C_s_rxflush ' <symbol:s_rxflush>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s_rxflush_18 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_src42_68804d15_initialize_L000004 ' CALL addrg
C_s_rxflush_17
C_s_rxflush_18
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_s_rxcheck ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s_rxflush_17 ' GEI4
 mov r0, #0 ' RET coni
' C_s_rxflush_14 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s_rxcheck

 alignl ' align long
C_s_rxcheck ' <symbol:s_rxcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s_rxcheck_21 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_src42_68804d15_initialize_L000004 ' CALL addrg
C_s_rxcheck_21
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s_rxcheck_23 ' LTI4
C_s_rxcheck_25
' C_s_rxcheck_26 ' (symbol refcount = 0)
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s_rxcheck_25 ' EQI4
C_s_rxcheck_23
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s_rxcheck_28 ' EQI4
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdlong r18, r20 ' reg <- INDIRI4 reg
 adds r22, #36 ' ADDP4 coni
 adds r22, r18 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #15 ' BANDI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s_rxcheck_29 ' JUMPV addrg
C_s_rxcheck_28
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_s_rxcheck_29
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s_rxcheck_30 ' LTI4
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s_rxcheck_30
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_s_rxcheck_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s_rx

 alignl ' align long
C_s_rx ' <symbol:s_rx>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s_rx_36 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_src42_68804d15_initialize_L000004 ' CALL addrg
C_s_rx_35
C_s_rx_36
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_s_rxcheck ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BR_B
 long @C_s_rx_35 ' LTI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_s_rx_32 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s_tx

 alignl ' align long
C_s_tx ' <symbol:s_tx>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s_tx_39 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_src42_68804d15_initialize_L000004 ' CALL addrg
C_s_tx_39
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s_tx_47 ' LTI4
C_s_tx_43
' C_s_tx_44 ' (symbol refcount = 0)
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s_tx_43 ' EQI4
C_s_tx_46
C_s_tx_47
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s_tx_46 ' EQI4
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #52 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (2)
 wrbyte r23, r22 ' ASGNU1 reg reg
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 and r20, #15 ' BANDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s_tx_49 ' EQI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_s_rx ' CALL addrg
C_s_tx_49
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s_tx_51 ' LTI4
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s_tx_51
 mov r0, #0 ' RET coni
' C_s_tx_38 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s_txflush

 alignl ' align long
C_s_txflush ' <symbol:s_txflush>
 jmp #NEWF
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s_txflush_54 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_src42_68804d15_initialize_L000004 ' CALL addrg
C_s_txflush_54
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s_txflush_62 ' LTI4
C_s_txflush_58
' C_s_txflush_59 ' (symbol refcount = 0)
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s_txflush_58 ' EQI4
C_s_txflush_61
C_s_txflush_62
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s_txflush_61 ' NEI4
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s_txflush_64 ' LTI4
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s_txflush_64
 mov r0, #0 ' RET coni
' C_s_txflush_53 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s_txcheck

 alignl ' align long
C_s_txcheck ' <symbol:s_txcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s_txcheck_67 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_src42_68804d15_initialize_L000004 ' CALL addrg
C_s_txcheck_67
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s_txcheck_69 ' LTI4
C_s_txcheck_71
' C_s_txcheck_72 ' (symbol refcount = 0)
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s_txcheck_71 ' EQI4
C_s_txcheck_69
 jmp #LODI
 long @C_src4_68804d15_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, #16 ' ADDI4 coni
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r20
 neg r22, r22 ' SUBI/P (2)
 and r22, #15 ' BANDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s_txcheck_74 ' LTI4
 jmp #LODI
 long @C_src41_68804d15_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s_txcheck_74
 mov r22, #15 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
' C_s_txcheck_66 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import _locknew

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
