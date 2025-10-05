' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sgsg_68dcc32d_mailbox_L000002 ' <symbol:mailbox>
 long $0

 alignl ' align long
C_sgsg1_68dcc32d_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sgsg2_68dcc32d_initialize_L000004 ' <symbol:initialize>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_sgsg2_68dcc32d_initialize_L000004_6  ' NEU4
 mov r2, #23 ' reg ARG coni
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
 if_b jmp #\C_sgsg2_68dcc32d_initialize_L000004_8 ' LTI4
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
 wrlong r20, ##@C_sgsg_68dcc32d_mailbox_L000002 ' ASGNP4 addrg reg
 mov r20, ##@C_sgsg1_68dcc32d_lock_L000003 ' reg <- addrg
 shr r22, #24 ' RSHU4 coni
 wrlong r22, ##@C_sgsg1_68dcc32d_lock_L000003 ' ASGNI4 addrg reg
 rdlong r22, r20 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sgsg2_68dcc32d_initialize_L000004_10 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__locknew ' CALL addrg
 wrlong r0, ##@C_sgsg1_68dcc32d_lock_L000003 ' ASGNI4 addrg reg
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_sgsg2_68dcc32d_initialize_L000004_11 ' LTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##@C_sgsg1_68dcc32d_lock_L000003
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
 jmp #\@C_sgsg2_68dcc32d_initialize_L000004_11 ' JUMPV addrg
C_sgsg2_68dcc32d_initialize_L000004_10
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 wrlong r22, ##@C_sgsg1_68dcc32d_lock_L000003 ' ASGNI4 addrg reg
C_sgsg2_68dcc32d_initialize_L000004_11
C_sgsg2_68dcc32d_initialize_L000004_8
C_sgsg2_68dcc32d_initialize_L000004_6
' C_sgsg2_68dcc32d_initialize_L000004_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sgsg3_68dcc32d_s_wait_rxready_L000014 ' <symbol:s_wait_rxready>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, ##-2 ' reg <- con
 cmps r2,  #0 wcz
 if_be jmp #\C_sgsg3_68dcc32d_s_wait_rxready_L000014_16 ' LEI4
C_sgsg3_68dcc32d_s_wait_rxready_L000014_18
 subs r2, #1 ' SUBI4 coni
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sgsg3_68dcc32d_s_wait_rxready_L000014_21 ' NEI4
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRI4 reg
 mov r2, ##-10 ' reg <- con
C_sgsg3_68dcc32d_s_wait_rxready_L000014_21
' C_sgsg3_68dcc32d_s_wait_rxready_L000014_19 ' (symbol refcount = 0)
 cmps r2,  #0 wcz
 if_a jmp #\C_sgsg3_68dcc32d_s_wait_rxready_L000014_18 ' GTI4
 mov r22, ##-10 ' reg <- con
 cmps r2, r22 wz
 if_nz jmp #\C_sgsg3_68dcc32d_s_wait_rxready_L000014_17 ' NEI4
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##-1 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, ##-1 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_sgsg3_68dcc32d_s_wait_rxready_L000014_17 ' JUMPV addrg
C_sgsg3_68dcc32d_s_wait_rxready_L000014_16
C_sgsg3_68dcc32d_s_wait_rxready_L000014_25
' C_sgsg3_68dcc32d_s_wait_rxready_L000014_26 ' (symbol refcount = 0)
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sgsg3_68dcc32d_s_wait_rxready_L000014_25 ' NEI4
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRI4 reg
C_sgsg3_68dcc32d_s_wait_rxready_L000014_17
 mov r0, r23 ' CVI, CVU or LOAD
' C_sgsg3_68dcc32d_s_wait_rxready_L000014_15 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sgsg4_68dcc32d_s_read_async_L000028 ' <symbol:s_read_async>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##-1 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg3_68dcc32d_s_wait_rxready_L000014
 add SP, #4 ' CALL addrg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r21, r22 ' ASGNI4 reg reg
' C_sgsg4_68dcc32d_s_read_async_L000028_29 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sgsg5_68dcc32d_s_read_L000030 ' <symbol:s_read>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg4_68dcc32d_s_read_async_L000028
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg3_68dcc32d_s_wait_rxready_L000014
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sgsg5_68dcc32d_s_read_L000030_31 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sgsg6_68dcc32d_s_wait_txready_L000032 ' <symbol:s_wait_txready>
 calld PA,#PSHM
 long $500000 ' save registers
C_sgsg6_68dcc32d_s_wait_txready_L000032_34
' C_sgsg6_68dcc32d_s_wait_txready_L000032_35 ' (symbol refcount = 0)
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sgsg6_68dcc32d_s_wait_txready_L000032_34 ' NEI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_sgsg6_68dcc32d_s_wait_txready_L000032_33 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sgsg7_68dcc32d_s_write_async_L000037 ' <symbol:s_write_async>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sgsg6_68dcc32d_s_wait_txready_L000032 ' CALL addrg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r20, r20 ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
' C_sgsg7_68dcc32d_s_write_async_L000037_38 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sgsg8_68dcc32d_s_write_L000039 ' <symbol:s_write>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg7_68dcc32d_s_write_async_L000037
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sgsg6_68dcc32d_s_wait_txready_L000032 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sgsg8_68dcc32d_s_write_L000039_40 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sgsg9_68dcc32d_s_txsize_L000041 ' <symbol:s_txsize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-4 ' reg ARG con
 mov r4, ##0 ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg8_68dcc32d_s_write_L000039
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sgsg9_68dcc32d_s_txsize_L000041_42 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sgsga_68dcc32d_s_txfree_L000043 ' <symbol:s_txfree>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-3 ' reg ARG con
 mov r4, ##0 ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg8_68dcc32d_s_write_L000039
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sgsga_68dcc32d_s_txfree_L000043_44 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export s_rxcheck

 alignl ' align long
C_s_rxcheck ' <symbol:s_rxcheck>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s_rxcheck_46  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sgsg2_68dcc32d_initialize_L000004 ' CALL addrg
C_s_rxcheck_46
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s_rxcheck_50 ' EQU4
 cmp r23,  #1 wcz 
 if_be jmp #\C_s_rxcheck_48 ' LEU4
C_s_rxcheck_50
 mov r0, ##-1 ' RET con
 jmp #\@C_s_rxcheck_45 ' JUMPV addrg
C_s_rxcheck_48
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_rxcheck_51 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_s_rxcheck_51
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg5_68dcc32d_s_read_L000030
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_rxcheck_53 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_s_rxcheck_53
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s_rxcheck_45
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export s_rxflush

 alignl ' align long
C_s_rxflush ' <symbol:s_rxflush>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s_rxflush_56  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sgsg2_68dcc32d_initialize_L000004 ' CALL addrg
C_s_rxflush_56
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s_rxflush_60 ' EQU4
 cmp r23,  #1 wcz 
 if_be jmp #\C_s_rxflush_58 ' LEU4
C_s_rxflush_60
 mov r0, ##-1 ' RET con
 jmp #\@C_s_rxflush_55 ' JUMPV addrg
C_s_rxflush_58
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_rxflush_64 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_s_rxflush_63
C_s_rxflush_64
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg5_68dcc32d_s_read_L000030
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wcz
 if_ae jmp #\C_s_rxflush_63 ' GEI4
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_rxflush_66 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_s_rxflush_66
 mov r0, #0 ' reg <- coni
C_s_rxflush_55
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export s_rxcount

 alignl ' align long
C_s_rxcount ' <symbol:s_rxcount>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s_rxcount_69  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sgsg2_68dcc32d_initialize_L000004 ' CALL addrg
C_s_rxcount_69
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s_rxcount_73 ' EQU4
 cmp r23,  #1 wcz 
 if_be jmp #\C_s_rxcount_71 ' LEU4
C_s_rxcount_73
 mov r0, ##-1 ' RET con
 jmp #\@C_s_rxcount_68 ' JUMPV addrg
C_s_rxcount_71
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_rxcount_74 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_s_rxcount_74
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-3 ' reg ARG con
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg5_68dcc32d_s_read_L000030
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_rxcount_76 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_s_rxcount_76
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s_rxcount_68
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export s_rx

 alignl ' align long
C_s_rx ' <symbol:s_rx>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s_rx_79  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sgsg2_68dcc32d_initialize_L000004 ' CALL addrg
C_s_rx_79
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s_rx_83 ' EQU4
 cmp r23,  #1 wcz 
 if_be jmp #\C_s_rx_81 ' LEU4
C_s_rx_83
 mov r0, ##-1 ' RET con
 jmp #\@C_s_rx_78 ' JUMPV addrg
C_s_rx_81
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_rx_84 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_s_rx_84
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg5_68dcc32d_s_read_L000030
 add SP, #8 ' CALL addrg
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_rx_86 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_s_rx_86
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s_rx_78
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export s_tx

 alignl ' align long
C_s_tx ' <symbol:s_tx>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s_tx_89  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sgsg2_68dcc32d_initialize_L000004 ' CALL addrg
C_s_tx_89
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s_tx_93 ' EQU4
 cmp r23,  #1 wcz 
 if_be jmp #\C_s_tx_91 ' LEU4
C_s_tx_93
 mov r0, ##-1 ' RET con
 jmp #\@C_s_tx_88 ' JUMPV addrg
C_s_tx_91
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_tx_94 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_s_tx_94
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov r4, ##$ffffffff ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg8_68dcc32d_s_write_L000039
 add SP, #8 ' CALL addrg
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_tx_96 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_s_tx_96
 mov r0, #0 ' reg <- coni
C_s_tx_88
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export s_txflush

 alignl ' align long
C_s_txflush ' <symbol:s_txflush>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s_txflush_99  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sgsg2_68dcc32d_initialize_L000004 ' CALL addrg
C_s_txflush_99
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s_txflush_103 ' EQU4
 cmp r23,  #1 wcz 
 if_be jmp #\C_s_txflush_101 ' LEU4
C_s_txflush_103
 mov r0, ##-1 ' RET con
 jmp #\@C_s_txflush_98 ' JUMPV addrg
C_s_txflush_101
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_txflush_104 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_s_txflush_104
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sgsg9_68dcc32d_s_txsize_L000041 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s_txflush_106
' C_s_txflush_107 ' (symbol refcount = 0)
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sgsga_68dcc32d_s_txfree_L000043 ' CALL addrg
 cmps r0, r21 wcz
 if_b jmp #\C_s_txflush_106 ' LTI4
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_txflush_109 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_s_txflush_109
 mov r0, #0 ' reg <- coni
C_s_txflush_98
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export s_txcheck

 alignl ' align long
C_s_txcheck ' <symbol:s_txcheck>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s_txcheck_112  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sgsg2_68dcc32d_initialize_L000004 ' CALL addrg
C_s_txcheck_112
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s_txcheck_116 ' EQU4
 cmp r23,  #1 wcz 
 if_be jmp #\C_s_txcheck_114 ' LEU4
C_s_txcheck_116
 mov r0, ##-1 ' RET con
 jmp #\@C_s_txcheck_111 ' JUMPV addrg
C_s_txcheck_114
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_txcheck_117 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__acquire_lock ' CALL addrg
C_s_txcheck_117
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##-2 ' reg ARG con
 mov r4, ##0 ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sgsg8_68dcc32d_s_write_L000039
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wcz
 if_b jmp #\C_s_txcheck_119 ' LTI4
 mov r2, ##@C_sgsg1_68dcc32d_lock_L000003
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__release_lock ' CALL addrg
C_s_txcheck_119
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s_txcheck_111
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export s_txcount

 alignl ' align long
C_s_txcount ' <symbol:s_txcount>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_s_txcount_122  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sgsg2_68dcc32d_initialize_L000004 ' CALL addrg
C_s_txcount_122
 mov r22, ##@C_sgsg_68dcc32d_mailbox_L000002
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_s_txcount_126 ' EQU4
 cmp r23,  #1 wcz 
 if_be jmp #\C_s_txcount_124 ' LEU4
C_s_txcount_126
 mov r0, ##-1 ' RET con
 jmp #\@C_s_txcount_121 ' JUMPV addrg
C_s_txcount_124
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sgsg9_68dcc32d_s_txsize_L000041 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sgsga_68dcc32d_s_txfree_L000043 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
C_s_txcount_121
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import _locknew

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
