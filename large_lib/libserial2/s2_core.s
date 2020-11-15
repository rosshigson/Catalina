' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 long ' align long
C_shj4_5f5d7c4d_mailbox_L000002 ' <symbol:mailbox>
 long $0

 long ' align long
C_shj41_5f5d7c4d_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 long ' align long
C_shj42_5f5d7c4d_initialize_L000004 ' <symbol:initialize>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_shj42_5f5d7c4d_initialize_L000004_6 ' NEU4
 mov r2, #23 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_shj42_5f5d7c4d_initialize_L000004_8 ' LTI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 mov r18, FP
 sub r18, #-(-4) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 shl r18, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r18 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 and r20, r22 ' BANDI/U (2)
 jmp #LODL
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov BC, r20
 jmp #WLNG ' ASGNP4 addrg reg
 shr r22, #24 ' RSHU4 coni
 jmp #LODL
 long @C_shj41_5f5d7c4d_lock_L000003
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_shj42_5f5d7c4d_initialize_L000004_10 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__locknew ' CALL addrg
 jmp #LODL
 long @C_shj41_5f5d7c4d_lock_L000003
 mov BC, r0
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_shj42_5f5d7c4d_initialize_L000004_11 ' LTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r20, RI ' reg <- INDIRI4 addrg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHI4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #2 ' LSHI4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_shj42_5f5d7c4d_initialize_L000004_11 ' JUMPV addrg
C_shj42_5f5d7c4d_initialize_L000004_10
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 subs r22, #1 ' SUBI4 coni
 jmp #LODL
 long @C_shj41_5f5d7c4d_lock_L000003
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
C_shj42_5f5d7c4d_initialize_L000004_11
C_shj42_5f5d7c4d_initialize_L000004_8
C_shj42_5f5d7c4d_initialize_L000004_6
' C_shj42_5f5d7c4d_initialize_L000004_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 long ' align long
C_shj43_5f5d7c4d_s2_wait_rxready_L000014 ' <symbol:s2_wait_rxready>
 jmp #PSHM
 long $d00000 ' save registers
 jmp #LODL
 long -2
 mov r23, RI ' reg <- con
 cmps r2,  #0 wz,wc
 jmp #BRBE
 long @C_shj43_5f5d7c4d_s2_wait_rxready_L000014_16 ' LEI4
C_shj43_5f5d7c4d_s2_wait_rxready_L000014_18
 subs r2, #1 ' SUBI4 coni
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_shj43_5f5d7c4d_s2_wait_rxready_L000014_21 ' NEI4
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -10
 mov r2, RI ' reg <- con
C_shj43_5f5d7c4d_s2_wait_rxready_L000014_21
' C_shj43_5f5d7c4d_s2_wait_rxready_L000014_19 ' (symbol refcount = 0)
 cmps r2,  #0 wz,wc
 jmp #BR_A
 long @C_shj43_5f5d7c4d_s2_wait_rxready_L000014_18 ' GTI4
 jmp #LODL
 long -10
 mov r22, RI ' reg <- con
 cmps r2, r22 wz
 jmp #BRNZ
 long @C_shj43_5f5d7c4d_s2_wait_rxready_L000014_17 ' NEI4
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_shj43_5f5d7c4d_s2_wait_rxready_L000014_17 ' JUMPV addrg
C_shj43_5f5d7c4d_s2_wait_rxready_L000014_16
C_shj43_5f5d7c4d_s2_wait_rxready_L000014_25
' C_shj43_5f5d7c4d_s2_wait_rxready_L000014_26 ' (symbol refcount = 0)
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_shj43_5f5d7c4d_s2_wait_rxready_L000014_25 ' NEI4
 mov r22, r3
 shl r22, #2 ' LSHU4 coni
 shl r22, #2 ' LSHU4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRI4 reg
C_shj43_5f5d7c4d_s2_wait_rxready_L000014_17
 mov r0, r23 ' CVI, CVU or LOAD
' C_shj43_5f5d7c4d_s2_wait_rxready_L000014_15 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_shj44_5f5d7c4d_s2_read_async_L000028 ' <symbol:s2_read_async>
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj43_5f5d7c4d_s2_wait_rxready_L000014
 add SP, #4 ' CALL addrg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
' C_shj44_5f5d7c4d_s2_read_async_L000028_29 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_shj45_5f5d7c4d_s2_read_L000030 ' <symbol:s2_read>
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj44_5f5d7c4d_s2_read_async_L000028
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj43_5f5d7c4d_s2_wait_rxready_L000014
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_shj45_5f5d7c4d_s2_read_L000030_31 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_shj46_5f5d7c4d_s2_wait_txready_L000032 ' <symbol:s2_wait_txready>
 jmp #PSHM
 long $500000 ' save registers
C_shj46_5f5d7c4d_s2_wait_txready_L000032_34
' C_shj46_5f5d7c4d_s2_wait_txready_L000032_35 ' (symbol refcount = 0)
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_shj46_5f5d7c4d_s2_wait_txready_L000032_34 ' NEI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_shj46_5f5d7c4d_s2_wait_txready_L000032_33 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_shj47_5f5d7c4d_s2_write_async_L000037 ' <symbol:s2_write_async>
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_shj46_5f5d7c4d_s2_wait_txready_L000032 ' CALL addrg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #12 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r20, RI ' reg <- INDIRP4 addrg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
' C_shj47_5f5d7c4d_s2_write_async_L000037_38 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_shj48_5f5d7c4d_s2_write_L000039 ' <symbol:s2_write>
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj47_5f5d7c4d_s2_write_async_L000037
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_shj46_5f5d7c4d_s2_wait_txready_L000032 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_shj48_5f5d7c4d_s2_write_L000039_40 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_shj49_5f5d7c4d_s2_txsize_L000041 ' <symbol:s2_txsize>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r3, RI ' reg ARG con
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj48_5f5d7c4d_s2_write_L000039
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_shj49_5f5d7c4d_s2_txsize_L000041_42 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 long ' align long
C_shj4a_5f5d7c4d_s2_txcount_L000043 ' <symbol:s2_txcount>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long -3
 mov r3, RI ' reg ARG con
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj48_5f5d7c4d_s2_write_L000039
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_shj4a_5f5d7c4d_s2_txcount_L000043_44 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export s2_rxcheck

 long ' align long
C_s2_rxcheck ' <symbol:s2_rxcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s2_rxcheck_46 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_shj42_5f5d7c4d_initialize_L000004 ' CALL addrg
C_s2_rxcheck_46
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s2_rxcheck_50 ' EQU4
 cmp r23,  #1 wz,wc 
 jmp #BRBE
 long @C_s2_rxcheck_48 ' LEU4
C_s2_rxcheck_50
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s2_rxcheck_45 ' JUMPV addrg
C_s2_rxcheck_48
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_rxcheck_51 ' LTI4
C_s2_rxcheck_53
' C_s2_rxcheck_54 ' (symbol refcount = 0)
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s2_rxcheck_53 ' EQI4
C_s2_rxcheck_51
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj45_5f5d7c4d_s2_read_L000030
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_rxcheck_56 ' LTI4
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s2_rxcheck_56
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_s2_rxcheck_45
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s2_rxflush

 long ' align long
C_s2_rxflush ' <symbol:s2_rxflush>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s2_rxflush_59 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_shj42_5f5d7c4d_initialize_L000004 ' CALL addrg
C_s2_rxflush_59
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s2_rxflush_63 ' EQU4
 cmp r23,  #1 wz,wc 
 jmp #BRBE
 long @C_s2_rxflush_61 ' LEU4
C_s2_rxflush_63
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s2_rxflush_58 ' JUMPV addrg
C_s2_rxflush_61
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_rxflush_70 ' LTI4
C_s2_rxflush_66
' C_s2_rxflush_67 ' (symbol refcount = 0)
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s2_rxflush_66 ' EQI4
C_s2_rxflush_69
C_s2_rxflush_70
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj45_5f5d7c4d_s2_read_L000030
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_s2_rxflush_69 ' GEI4
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_rxflush_72 ' LTI4
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s2_rxflush_72
 mov r0, #0 ' reg <- coni
C_s2_rxflush_58
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export s2_rx

 long ' align long
C_s2_rx ' <symbol:s2_rx>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s2_rx_75 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_shj42_5f5d7c4d_initialize_L000004 ' CALL addrg
C_s2_rx_75
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s2_rx_79 ' EQU4
 cmp r23,  #1 wz,wc 
 jmp #BRBE
 long @C_s2_rx_77 ' LEU4
C_s2_rx_79
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s2_rx_74 ' JUMPV addrg
C_s2_rx_77
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_rx_80 ' LTI4
C_s2_rx_82
' C_s2_rx_83 ' (symbol refcount = 0)
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s2_rx_82 ' EQI4
C_s2_rx_80
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-4) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj45_5f5d7c4d_s2_read_L000030
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_rx_85 ' LTI4
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s2_rx_85
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_s2_rx_74
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export s2_tx

 long ' align long
C_s2_tx ' <symbol:s2_tx>
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s2_tx_88 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_shj42_5f5d7c4d_initialize_L000004 ' CALL addrg
C_s2_tx_88
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s2_tx_92 ' EQU4
 cmp r23,  #1 wz,wc 
 jmp #BRBE
 long @C_s2_tx_90 ' LEU4
C_s2_tx_92
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s2_tx_87 ' JUMPV addrg
C_s2_tx_90
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_tx_93 ' LTI4
C_s2_tx_95
' C_s2_tx_96 ' (symbol refcount = 0)
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s2_tx_95 ' EQI4
C_s2_tx_93
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVUI
 and r3, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffff
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj48_5f5d7c4d_s2_write_L000039
 add SP, #8 ' CALL addrg
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_tx_98 ' LTI4
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s2_tx_98
 mov r0, #0 ' reg <- coni
C_s2_tx_87
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export s2_txflush

 long ' align long
C_s2_txflush ' <symbol:s2_txflush>
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s2_txflush_101 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_shj42_5f5d7c4d_initialize_L000004 ' CALL addrg
C_s2_txflush_101
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s2_txflush_105 ' EQU4
 cmp r23,  #1 wz,wc 
 jmp #BRBE
 long @C_s2_txflush_103 ' LEU4
C_s2_txflush_105
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s2_txflush_100 ' JUMPV addrg
C_s2_txflush_103
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_txflush_106 ' LTI4
C_s2_txflush_108
' C_s2_txflush_109 ' (symbol refcount = 0)
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s2_txflush_108 ' EQI4
C_s2_txflush_106
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_shj49_5f5d7c4d_s2_txsize_L000041 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s2_txflush_111
' C_s2_txflush_112 ' (symbol refcount = 0)
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_shj4a_5f5d7c4d_s2_txcount_L000043 ' CALL addrg
 cmps r0, r21 wz,wc
 jmp #BR_B
 long @C_s2_txflush_111 ' LTI4
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_txflush_114 ' LTI4
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s2_txflush_114
 mov r0, #0 ' reg <- coni
C_s2_txflush_100
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export s2_txcheck

 long ' align long
C_s2_txcheck ' <symbol:s2_txcheck>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s2_txcheck_117 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_shj42_5f5d7c4d_initialize_L000004 ' CALL addrg
C_s2_txcheck_117
 jmp #LODI
 long @C_shj4_5f5d7c4d_mailbox_L000002
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s2_txcheck_121 ' EQU4
 cmp r23,  #1 wz,wc 
 jmp #BRBE
 long @C_s2_txcheck_119 ' LEU4
C_s2_txcheck_121
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s2_txcheck_116 ' JUMPV addrg
C_s2_txcheck_119
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_txcheck_122 ' LTI4
C_s2_txcheck_124
' C_s2_txcheck_125 ' (symbol refcount = 0)
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockset ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s2_txcheck_124 ' EQI4
C_s2_txcheck_122
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_shj48_5f5d7c4d_s2_write_L000039
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_s2_txcheck_127 ' LTI4
 jmp #LODI
 long @C_shj41_5f5d7c4d_lock_L000003
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__lockclr ' CALL addrg
C_s2_txcheck_127
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_s2_txcheck_116
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import _locknew

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
