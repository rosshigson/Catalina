' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sr9c_6ac84fdb_wait100ms_L000003 ' <symbol:wait100ms>
 calld PA,#NEWF
 calld PA,#PSHM
 long $540000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r18 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r22 ' ADDU
 add r2, r0 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitcnt ' CALL addrg
' C_sr9c_6ac84fdb_wait100ms_L000003_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sr9c1_6ac84fdb_xdigit_L000005 ' <symbol:xdigit>
 calld PA,#PSHM
 long $400000 ' save registers
 cmps r2,  #10 wcz
 if_b jmp #\C_sr9c1_6ac84fdb_xdigit_L000005_7 ' LTI4
 mov r22, r2
 subs r22, #10 ' SUBI4 coni
 adds r22, #65 ' ADDI4 coni
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
 jmp #\@C_sr9c1_6ac84fdb_xdigit_L000005_6 ' JUMPV addrg
C_sr9c1_6ac84fdb_xdigit_L000005_7
 mov r22, r2
 adds r22, #48 ' ADDI4 coni
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
C_sr9c1_6ac84fdb_xdigit_L000005_6
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export DFS_WriteSector

 alignl ' align long
C_D_F_S__W_riteS_ector ' <symbol:DFS_WriteSector>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
C_D_F_S__W_riteS_ector_10
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sd_sectwrite
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz
 if_nz jmp #\C_D_F_S__W_riteS_ector_14 ' NEI4
 jmp #\@C_D_F_S__W_riteS_ector_12 ' JUMPV addrg
C_D_F_S__W_riteS_ector_14
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_sr9c_6ac84fdb_wait100ms_L000003 ' CALL addrg
' C_D_F_S__W_riteS_ector_11 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #10 wcz
 if_b jmp #\C_D_F_S__W_riteS_ector_10 ' LTI4
C_D_F_S__W_riteS_ector_12
 mov r0, r13 ' CVI, CVU or LOAD
' C_D_F_S__W_riteS_ector_9 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import sd_sectwrite

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _clockfreq
' end
