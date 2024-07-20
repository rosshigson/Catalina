' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_si2o_66950533_rxbase_L000002 ' <symbol:rxbase>
 long $0

 alignl ' align long
C_si2o1_66950533_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_si2o2_66950533_initialize_L000004 ' <symbol:initialize>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_si2o2_66950533_initialize_L000004_6 ' NEU4
 mov r2, #17 ' reg ARG coni
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
 long @C_si2o2_66950533_initialize_L000004_8 ' LTI4
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
 long @C_si2o_66950533_rxbase_L000002
 wrlong r20, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_si2o1_66950533_lock_L000003
 mov r20, RI ' reg <- addrg
 shr r22, #24 ' RSHU4 coni
 jmp #LODL
 long @C_si2o1_66950533_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_si2o2_66950533_initialize_L000004_10 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C_si2o1_66950533_lock_L000003
 wrlong r0, RI ' ASGNI4 addrg reg
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_si2o2_66950533_initialize_L000004_11 ' LTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
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
 long @C_si2o2_66950533_initialize_L000004_11 ' JUMPV addrg
C_si2o2_66950533_initialize_L000004_10
 jmp #LODL
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_si2o1_66950533_lock_L000003
 wrlong r22, RI ' ASGNI4 addrg reg
C_si2o2_66950533_initialize_L000004_11
C_si2o2_66950533_initialize_L000004_8
C_si2o2_66950533_initialize_L000004_6
' C_si2o2_66950533_initialize_L000004_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export s4_rxflush

 alignl ' align long
C_s4_rxflush ' <symbol:s4_rxflush>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s4_rxflush_15 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si2o2_66950533_initialize_L000004 ' CALL addrg
C_s4_rxflush_15
 cmp r23,  #3 wz,wc 
 jmp #BRBE
 long @C_s4_rxflush_20 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s4_rxflush_14 ' JUMPV addrg
C_s4_rxflush_19
C_s4_rxflush_20
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s4_rxcheck ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s4_rxflush_19 ' GEI4
 mov r0, #0 ' RET coni
C_s4_rxflush_14
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s4_rxcheck

 alignl ' align long
C_s4_rxcheck ' <symbol:s4_rxcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d54000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s4_rxcheck_23 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si2o2_66950533_initialize_L000004 ' CALL addrg
C_s4_rxcheck_23
 cmp r23,  #3 wz,wc 
 jmp #BRBE
 long @C_s4_rxcheck_25 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s4_rxcheck_22 ' JUMPV addrg
C_s4_rxcheck_25
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_rxcheck_27 ' LTI4
C_s4_rxcheck_29
' C_s4_rxcheck_30 ' (symbol refcount = 0)
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s4_rxcheck_29 ' EQI4
C_s4_rxcheck_27
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #16 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r18, r22 wz
 jmp #BR_Z
 long @C_s4_rxcheck_32 ' EQI4
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r23
 shl r20, #2 ' LSHU4 coni
 mov r18, r22
 adds r18, #16 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov r18, r22
 adds r18, #192 ' ADDP4 coni
 adds r18, r23 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 rdlong r16, r20 ' reg <- INDIRI4 reg
 mov r14, r23
 shl r14, #4 ' LSHU4 coni
 shl r14, #2 ' LSHU4 coni
 adds r22, #324 ' ADDP4 coni
 adds r22, r14 ' ADDI/P (2)
 adds r22, r16 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 xor r22, r18 ' BXORI/U (2)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 and r22, #63 ' BANDI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s4_rxcheck_33 ' JUMPV addrg
C_s4_rxcheck_32
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_s4_rxcheck_33
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_rxcheck_34 ' LTI4
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s4_rxcheck_34
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s4_rxcheck_22
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s4_rxcount

 alignl ' align long
C_s4_rxcount ' <symbol:s4_rxcount>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s4_rxcount_37 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si2o2_66950533_initialize_L000004 ' CALL addrg
C_s4_rxcount_37
 cmp r23,  #3 wz,wc 
 jmp #BRBE
 long @C_s4_rxcount_39 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s4_rxcount_36 ' JUMPV addrg
C_s4_rxcount_39
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_rxcount_41 ' LTI4
C_s4_rxcount_43
' C_s4_rxcount_44 ' (symbol refcount = 0)
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s4_rxcount_43 ' EQI4
C_s4_rxcount_41
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r22 ' ADDI/P
 adds r18, r20 ' ADDI/P (3)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r18, #16 ' ADDI4 coni
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r18
 neg r22, r22 ' SUBI/P (2)
 and r22, #15 ' BANDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_rxcount_46 ' LTI4
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s4_rxcount_46
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s4_rxcount_36
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s4_rx

 alignl ' align long
C_s4_rx ' <symbol:s4_rx>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s4_rx_49 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si2o2_66950533_initialize_L000004 ' CALL addrg
C_s4_rx_49
 cmp r23,  #3 wz,wc 
 jmp #BRBE
 long @C_s4_rx_54 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s4_rx_48 ' JUMPV addrg
C_s4_rx_53
C_s4_rx_54
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s4_rxcheck ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BR_B
 long @C_s4_rx_53 ' LTI4
 mov r0, r21 ' CVI, CVU or LOAD
C_s4_rx_48
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s4_tx

 alignl ' align long
C_s4_tx ' <symbol:s4_tx>
 jmp #NEWF
 jmp #PSHM
 long $f50000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s4_tx_57 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si2o2_66950533_initialize_L000004 ' CALL addrg
C_s4_tx_57
 cmp r23,  #3 wz,wc 
 jmp #BRBE
 long @C_s4_tx_59 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s4_tx_56 ' JUMPV addrg
C_s4_tx_59
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_tx_67 ' LTI4
C_s4_tx_63
' C_s4_tx_64 ' (symbol refcount = 0)
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s4_tx_63 ' EQI4
C_s4_tx_66
C_s4_tx_67
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
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
 jmp #BR_Z
 long @C_s4_tx_66 ' EQI4
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #32 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHU4 coni
 jmp #LODL
 long 580
 mov r16, RI ' reg <- con
 adds r20, r16 ' ADDI/P (1)
 adds r22, r20 ' ADDI/P (1)
 adds r22, r18 ' ADDI/P (2)
 wrbyte r21, r22 ' ASGNU1 reg reg
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 and r20, #15 ' BANDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r20, #128 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s4_tx_69 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s4_rx ' CALL addrg
C_s4_tx_69
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_tx_71 ' LTI4
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s4_tx_71
 mov r0, #0 ' RET coni
C_s4_tx_56
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s4_txflush

 alignl ' align long
C_s4_txflush ' <symbol:s4_txflush>
 jmp #NEWF
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s4_txflush_74 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si2o2_66950533_initialize_L000004 ' CALL addrg
C_s4_txflush_74
 cmp r23,  #3 wz,wc 
 jmp #BRBE
 long @C_s4_txflush_76 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s4_txflush_73 ' JUMPV addrg
C_s4_txflush_76
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_txflush_84 ' LTI4
C_s4_txflush_80
' C_s4_txflush_81 ' (symbol refcount = 0)
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s4_txflush_80 ' EQI4
C_s4_txflush_83
C_s4_txflush_84
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 mov r18, r20
 adds r18, #48 ' ADDP4 coni
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, #32 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r18, r22 wz
 jmp #BRNZ
 long @C_s4_txflush_83 ' NEI4
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_txflush_86 ' LTI4
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s4_txflush_86
 mov r0, #0 ' RET coni
C_s4_txflush_73
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export s4_txcheck

 alignl ' align long
C_s4_txcheck ' <symbol:s4_txcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s4_txcheck_89 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si2o2_66950533_initialize_L000004 ' CALL addrg
C_s4_txcheck_89
 cmp r23,  #3 wz,wc 
 jmp #BRBE
 long @C_s4_txcheck_91 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s4_txcheck_88 ' JUMPV addrg
C_s4_txcheck_91
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_txcheck_93 ' LTI4
C_s4_txcheck_95
' C_s4_txcheck_96 ' (symbol refcount = 0)
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s4_txcheck_95 ' EQI4
C_s4_txcheck_93
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
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
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_txcheck_98 ' LTI4
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s4_txcheck_98
 mov r22, #15 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
C_s4_txcheck_88
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s4_txcount

 alignl ' align long
C_s4_txcount ' <symbol:s4_txcount>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s4_txcount_101 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_si2o2_66950533_initialize_L000004 ' CALL addrg
C_s4_txcount_101
 cmp r23,  #3 wz,wc 
 jmp #BRBE
 long @C_s4_txcount_103 ' LEU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s4_txcount_100 ' JUMPV addrg
C_s4_txcount_103
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_txcount_105 ' LTI4
C_s4_txcount_107
' C_s4_txcount_108 ' (symbol refcount = 0)
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s4_txcount_107 ' EQI4
C_s4_txcount_105
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_si2o_66950533_rxbase_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
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
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s4_txcount_110 ' LTI4
 jmp #LODI
 long @C_si2o1_66950533_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s4_txcount_110
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s4_txcount_100
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import _locknew

' Catalina Import _locate_plugin

' Catalina Import _registry
' end