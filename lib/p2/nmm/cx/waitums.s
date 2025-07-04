' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sa9s7_6864c61c_recalculate_L000008 ' <symbol:recalculate>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 wrlong r23, ##@C_sa9s_6864c61c_old_freq_L000001 ' ASGNU4 addrg reg
 mov r22, ##$f4240 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r23, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r0, ##@C_sa9s1_6864c61c_cnt_usec_L000002 ' ASGNU4 addrg reg
 mov r22, ##1000 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r23, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r0, ##@C_sa9s2_6864c61c_cnt_msec_L000003 ' ASGNU4 addrg reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
 wrlong r0, ##@C_sa9s3_6864c61c_min_tick_L000004 ' ASGNU4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitus ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s6_6864c61c_overhead_L000007 ' reg <- addrg
 mov r20, r19 ' SUBU
 sub r20, r21 ' SUBU (3)
 mov r18, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r18, r18 ' reg <- INDIRU4 addrg
 sub r20, r18 ' SUBU (1)
 wrlong r20, ##@C_sa9s6_6864c61c_overhead_L000007 ' ASGNU4 addrg reg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #100 wcz 
 if_be jmp #\C_sa9s7_6864c61c_recalculate_L000008_10 ' LEU4
 mov r22, ##@C_sa9s6_6864c61c_overhead_L000007 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #100 ' SUBU4 coni
 wrlong r22, ##@C_sa9s6_6864c61c_overhead_L000007 ' ASGNU4 addrg reg
C_sa9s7_6864c61c_recalculate_L000008_10
 mov r22, ##@C_sa9s6_6864c61c_overhead_L000007
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, ##@C_sa9s1_6864c61c_cnt_usec_L000002
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 mov r18, r22 ' ADDU
 add r18, r20 ' ADDU (3)
 sub r18, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r18, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r0, ##@C_sa9s4_6864c61c_min_usec_L000005 ' ASGNU4 addrg reg
 mov r20, ##@C_sa9s2_6864c61c_cnt_msec_L000003
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 add r22, r20 ' ADDU (1)
 sub r22, #1 ' SUBU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r0, ##@C_sa9s5_6864c61c_min_msec_L000006 ' ASGNU4 addrg reg
' C_sa9s7_6864c61c_recalculate_L000008_9 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export min_waitus

 alignl ' align long
C_min_waitus ' <symbol:min_waitus>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 if_z jmp #\C_min_waitus_13 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
C_min_waitus_13
 mov r0, ##@C_sa9s4_6864c61c_min_usec_L000005
 rdlong r0, r0 ' reg <- INDIRU4 addrg
' C_min_waitus_12 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export min_waitms

 alignl ' align long
C_min_waitms ' <symbol:min_waitms>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 if_z jmp #\C_min_waitms_16 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
C_min_waitms_16
 mov r0, ##@C_sa9s5_6864c61c_min_msec_L000006
 rdlong r0, r0 ' reg <- INDIRU4 addrg
' C_min_waitms_15 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export min_wait

 alignl ' align long
C_min_wait ' <symbol:min_wait>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 if_z jmp #\C_min_wait_19 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
C_min_wait_19
 mov r0, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r0, r0 ' reg <- INDIRU4 addrg
' C_min_wait_18 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _wait

 alignl ' align long
C__wait ' <symbol:_wait>
 calld PA,#PSHM
 long $400000 ' save registers
' loading argument C__wait_22_L000023 to PASM eliminated
' ticks resolves to C identifier ticks (PASM r2)
' ticks resolves to C identifier ticks (PASM r2)
'START PASM ... 
#ifdef COMPACT
 word I16B_EXEC
   alignl ' align long
#endif
 cmp r2, #0 wz
 getct  r1
 if_nz addct2 r1, r2
 if_nz waitct2
 if_z getct r0
 if_z sub r0, r1
#ifdef COMPACT
 jmp #EXEC_STOP
#endif

'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
' C__wait_21 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export _iwait

 alignl ' align long
C__iwait ' <symbol:_iwait>
' loading argument C__iwait_25_L000026 to PASM eliminated
' cnt resolves to C identifier cnt (PASM r2)
' delay resolves to C identifier delay (PASM r3)
' cnt resolves to C identifier cnt (PASM r2)
'START PASM ... 
   cmp    r2, #0 wz
 if_z     jmp #_IWAIT_RET
   getct  r0
_IWAIT_LOOP
   addct2 r0, r3
_IWAIT_POLL
   pollct2 wc
 if_nc jmp #_IWAIT_POLL
   djnz   r2, #_IWAIT_LOOP
_IWAIT_RET

'... END PASM
' call to PASM eliminated
' C__iwait_24 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export _iwaitus

 alignl ' align long
C__iwaitus ' <symbol:_iwaitus>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 if_z jmp #\C__iwaitus_28 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
C__iwaitus_28
 mov r22, ##@C_sa9s4_6864c61c_min_usec_L000005
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r23, r22 wcz 
 if_be jmp #\C__iwaitus_31 ' LEU4
 mov r22, ##@C_sa9s4_6864c61c_min_usec_L000005
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r19, r23 ' SUBU
 sub r19, r22 ' SUBU (3)
 jmp #\@C__iwaitus_32 ' JUMPV addrg
C__iwaitus_31
 mov r19, ##@C_sa9s4_6864c61c_min_usec_L000005
 rdlong r19, r19 ' reg <- INDIRU4 addrg
C__iwaitus_32
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_sa9s1_6864c61c_cnt_usec_L000002
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitus_27 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _iwaitms

 alignl ' align long
C__iwaitms ' <symbol:_iwaitms>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 if_z jmp #\C__iwaitms_34 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
C__iwaitms_34
 mov r22, ##@C_sa9s5_6864c61c_min_msec_L000006
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r23, r22 wcz 
 if_be jmp #\C__iwaitms_37 ' LEU4
 mov r22, ##@C_sa9s5_6864c61c_min_msec_L000006
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r19, r23 ' SUBU
 sub r19, r22 ' SUBU (3)
 jmp #\@C__iwaitms_38 ' JUMPV addrg
C__iwaitms_37
 mov r19, ##@C_sa9s5_6864c61c_min_msec_L000006
 rdlong r19, r19 ' reg <- INDIRU4 addrg
C__iwaitms_38
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_sa9s2_6864c61c_cnt_msec_L000003
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitms_33 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _iwaitsec

 alignl ' align long
C__iwaitsec ' <symbol:_iwaitsec>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 if_z jmp #\C__iwaitsec_40 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
C__iwaitsec_40
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitsec_39 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _waitus

 alignl ' align long
C__waitus ' <symbol:_waitus>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 if_z jmp #\C__waitus_43 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
C__waitus_43
 mov r22, ##@C_sa9s1_6864c61c_cnt_usec_L000002
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r23, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, ##@C_sa9s6_6864c61c_overhead_L000007
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 cmp r22, r20 wcz 
 if_b jmp #\C__waitus_48 ' LTU4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, ##@C_sa9s6_6864c61c_overhead_L000007
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #\@C__waitus_48 ' JUMPV addrg
C__waitus_47
 mov r22, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, r21 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
C__waitus_48
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22, r21 wcz 
 if_a jmp #\C__waitus_47 ' GTU4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 cmp r22, r20 wcz 
 if_be jmp #\C__waitus_50 ' LEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
 jmp #\@C__waitus_42 ' JUMPV addrg
C__waitus_50
 cmps r19,  #0 wcz
 if_be jmp #\C__waitus_52 ' LEI4
 mov r2, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
 jmp #\@C__waitus_42 ' JUMPV addrg
C__waitus_52
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r20, r20 ' reg <- INDIRU4 addrg
 cmp r22, r20 wcz 
 if_be jmp #\C__waitus_54 ' LEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
 jmp #\@C__waitus_42 ' JUMPV addrg
C__waitus_54
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
C__waitus_42
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _waitms

 alignl ' align long
C__waitms ' <symbol:_waitms>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 if_z jmp #\C__waitms_57 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
C__waitms_57
 mov r22, ##@C_sa9s2_6864c61c_cnt_msec_L000003
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r23, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s6_6864c61c_overhead_L000007
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r19, r22 wcz 
 if_b jmp #\C__waitms_62 ' LTU4
 mov r22, ##@C_sa9s6_6864c61c_overhead_L000007
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 sub r19, r22 ' SUBU (1)
 jmp #\@C__waitms_62 ' JUMPV addrg
C__waitms_61
 mov r22, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
 sub r19, r21 ' SUBU (1)
C__waitms_62
 cmp r19, r21 wcz 
 if_a jmp #\C__waitms_61 ' GTU4
 mov r22, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r19, r22 wcz 
 if_be jmp #\C__waitms_64 ' LEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
 jmp #\@C__waitms_56 ' JUMPV addrg
C__waitms_64
 cmp r19,  #0 wz
 if_z jmp #\C__waitms_66 ' EQU4
 mov r2, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r2, r2
 ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
C__waitms_66
C__waitms_56
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _waitsec

 alignl ' align long
C__waitsec ' <symbol:_waitsec>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_sa9s_6864c61c_old_freq_L000001
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 if_z jmp #\C__waitsec_72 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sa9s7_6864c61c_recalculate_L000008 ' CALL addrg
 jmp #\@C__waitsec_72 ' JUMPV addrg
C__waitsec_71
 mov r22, ##@C_sa9s3_6864c61c_min_tick_L000004
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__wait ' CALL addrg
 sub r23, #1 ' SUBU4 coni
C__waitsec_72
 cmp r23,  #0 wz
 if_nz jmp #\C__waitsec_71  ' NEU4
' C__waitsec_68 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sa9s6_6864c61c_overhead_L000007 ' <symbol:overhead>
 byte 0[4]

 alignl ' align long
C_sa9s5_6864c61c_min_msec_L000006 ' <symbol:min_msec>
 byte 0[4]

 alignl ' align long
C_sa9s4_6864c61c_min_usec_L000005 ' <symbol:min_usec>
 byte 0[4]

 alignl ' align long
C_sa9s3_6864c61c_min_tick_L000004 ' <symbol:min_tick>
 byte 0[4]

 alignl ' align long
C_sa9s2_6864c61c_cnt_msec_L000003 ' <symbol:cnt_msec>
 byte 0[4]

 alignl ' align long
C_sa9s1_6864c61c_cnt_usec_L000002 ' <symbol:cnt_usec>
 byte 0[4]

 alignl ' align long
C_sa9s_6864c61c_old_freq_L000001 ' <symbol:old_freq>
 byte 0[4]

' Catalina Code

DAT ' code segment
' end
