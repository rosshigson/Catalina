' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_soek7_67b10fa6_recalculate_L000008 ' <symbol:recalculate>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_soek_67b10fa6_old_freq_L000001
 wrlong r23, RI ' ASGNU4 addrg reg
 jmp #LODL
 long $f4240
 mov r22, RI ' reg <- con
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODL
 long @C_soek1_67b10fa6_cnt_usec_L000002
 wrlong r0, RI ' ASGNU4 addrg reg
 jmp #LODL
 long 1000
 mov r22, RI ' reg <- con
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODL
 long @C_soek2_67b10fa6_cnt_msec_L000003
 wrlong r0, RI ' ASGNU4 addrg reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #LODL
 long @C_soek3_67b10fa6_min_tick_L000004
 wrlong r0, RI ' ASGNU4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitus ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_soek6_67b10fa6_overhead_L000007
 mov r22, RI ' reg <- addrg
 mov r20, r19 ' SUBU
 sub r20, r21 ' SUBU (3)
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r18, RI ' reg <- INDIRU4 addrg
 sub r20, r18 ' SUBU (1)
 jmp #LODL
 long @C_soek6_67b10fa6_overhead_L000007
 wrlong r20, RI ' ASGNU4 addrg reg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODI
 long @C_soek1_67b10fa6_cnt_usec_L000002
 mov r20, RI ' reg <- INDIRU4 addrg
 mov r18, r22 ' ADDU
 add r18, r20 ' ADDU (3)
 sub r18, #1 ' SUBU4 coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODL
 long @C_soek4_67b10fa6_min_usec_L000005
 wrlong r0, RI ' ASGNU4 addrg reg
 jmp #LODI
 long @C_soek2_67b10fa6_cnt_msec_L000003
 mov r20, RI ' reg <- INDIRU4 addrg
 add r22, r20 ' ADDU (1)
 sub r22, #1 ' SUBU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODL
 long @C_soek5_67b10fa6_min_msec_L000006
 wrlong r0, RI ' ASGNU4 addrg reg
' C_soek7_67b10fa6_recalculate_L000008_9 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export min_waitus

 alignl ' align long
C_min_waitus ' <symbol:min_waitus>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 jmp #BR_Z
 long @C_min_waitus_11 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
C_min_waitus_11
 jmp #LODI
 long @C_soek4_67b10fa6_min_usec_L000005
 mov r0, RI ' reg <- INDIRU4 addrg
' C_min_waitus_10 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export min_waitms

 alignl ' align long
C_min_waitms ' <symbol:min_waitms>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 jmp #BR_Z
 long @C_min_waitms_14 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
C_min_waitms_14
 jmp #LODI
 long @C_soek5_67b10fa6_min_msec_L000006
 mov r0, RI ' reg <- INDIRU4 addrg
' C_min_waitms_13 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export min_wait

 alignl ' align long
C_min_wait ' <symbol:min_wait>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 jmp #BR_Z
 long @C_min_wait_17 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
C_min_wait_17
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r0, RI ' reg <- INDIRU4 addrg
' C_min_wait_16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _wait

 alignl ' align long
C__wait ' <symbol:_wait>
 jmp #PSHM
 long $400000 ' save registers
' loading argument C__wait_20_L000021 to PASM eliminated
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
' C__wait_19 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export _iwait

 alignl ' align long
C__iwait ' <symbol:_iwait>
' loading argument C__iwait_23_L000024 to PASM eliminated
' cnt resolves to C identifier cnt (PASM r2)
' delay resolves to C identifier delay (PASM r3)
' cnt resolves to C identifier cnt (PASM r2)
'START PASM ... 
   cmp    r2, #0 wz
   jmp #BR_Z
   long @_IWAIT_RET
_IWAIT_0
   getct  r0
_IWAIT_LOOP
   addct2 r0, r3
_IWAIT_POLL
   pollct2 wc
   jmp #BRAE
   long @_IWAIT_POLL
   sub    r2, #1 wz
   jmp #BRNZ
   long @_IWAIT_LOOP
_IWAIT_RET

'... END PASM
' call to PASM eliminated
' C__iwait_22 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export _iwaitus

 alignl ' align long
C__iwaitus ' <symbol:_iwaitus>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__iwaitus_26 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
C__iwaitus_26
 jmp #LODI
 long @C_soek4_67b10fa6_min_usec_L000005
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wcz 
 jmp #BRBE
 long @C__iwaitus_29 ' LEU4
 jmp #LODI
 long @C_soek4_67b10fa6_min_usec_L000005
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r19, r23 ' SUBU
 sub r19, r22 ' SUBU (3)
 jmp #JMPA
 long @C__iwaitus_30 ' JUMPV addrg
C__iwaitus_29
 jmp #LODI
 long @C_soek4_67b10fa6_min_usec_L000005
 mov r19, RI ' reg <- INDIRU4 addrg
C__iwaitus_30
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek1_67b10fa6_cnt_usec_L000002
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitus_25 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _iwaitms

 alignl ' align long
C__iwaitms ' <symbol:_iwaitms>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__iwaitms_32 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
C__iwaitms_32
 jmp #LODI
 long @C_soek5_67b10fa6_min_msec_L000006
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wcz 
 jmp #BRBE
 long @C__iwaitms_35 ' LEU4
 jmp #LODI
 long @C_soek5_67b10fa6_min_msec_L000006
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r19, r23 ' SUBU
 sub r19, r22 ' SUBU (3)
 jmp #JMPA
 long @C__iwaitms_36 ' JUMPV addrg
C__iwaitms_35
 jmp #LODI
 long @C_soek5_67b10fa6_min_msec_L000006
 mov r19, RI ' reg <- INDIRU4 addrg
C__iwaitms_36
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek2_67b10fa6_cnt_msec_L000003
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitms_31 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _iwaitsec

 alignl ' align long
C__iwaitsec ' <symbol:_iwaitsec>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__iwaitsec_38 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
C__iwaitsec_38
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitsec_37 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _waitus

 alignl ' align long
C__waitus ' <symbol:_waitus>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__waitus_41 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
C__waitus_41
 jmp #LODI
 long @C_soek1_67b10fa6_cnt_usec_L000002
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek6_67b10fa6_overhead_L000007
 mov r20, RI ' reg <- INDIRU4 addrg
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C__waitus_46' LTU4
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek6_67b10fa6_overhead_L000007
 mov r20, RI ' reg <- INDIRU4 addrg
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__waitus_46 ' JUMPV addrg
C__waitus_45
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, r21 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
C__waitus_46
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22, r21 wcz 
 jmp #BR_A
 long @C__waitus_45 ' GTU4
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r20, RI ' reg <- INDIRU4 addrg
 cmp r22, r20 wcz 
 jmp #BRBE
 long @C__waitus_48 ' LEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #JMPA
 long @C__waitus_40 ' JUMPV addrg
C__waitus_48
 cmps r19,  #0 wcz
 jmp #BRBE
 long @C__waitus_50 ' LEI4
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #JMPA
 long @C__waitus_40 ' JUMPV addrg
C__waitus_50
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r20, RI ' reg <- INDIRU4 addrg
 cmp r22, r20 wcz 
 jmp #BRBE
 long @C__waitus_52 ' LEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #JMPA
 long @C__waitus_40 ' JUMPV addrg
C__waitus_52
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
C__waitus_40
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _waitms

 alignl ' align long
C__waitms ' <symbol:_waitms>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__waitms_55 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
C__waitms_55
 jmp #LODI
 long @C_soek2_67b10fa6_cnt_msec_L000003
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek6_67b10fa6_overhead_L000007
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r19, r22 wcz 
 jmp #BR_B
 long @C__waitms_60' LTU4
 jmp #LODI
 long @C_soek6_67b10fa6_overhead_L000007
 mov r22, RI ' reg <- INDIRU4 addrg
 sub r19, r22 ' SUBU (1)
 jmp #JMPA
 long @C__waitms_60 ' JUMPV addrg
C__waitms_59
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 sub r19, r21 ' SUBU (1)
C__waitms_60
 cmp r19, r21 wcz 
 jmp #BR_A
 long @C__waitms_59 ' GTU4
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r19, r22 wcz 
 jmp #BRBE
 long @C__waitms_62 ' LEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #JMPA
 long @C__waitms_54 ' JUMPV addrg
C__waitms_62
 cmp r19,  #0 wz
 jmp #BR_Z
 long @C__waitms_64 ' EQU4
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
C__waitms_64
C__waitms_54
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _waitsec

 alignl ' align long
C__waitsec ' <symbol:_waitsec>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_soek_67b10fa6_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__waitsec_70 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_soek7_67b10fa6_recalculate_L000008 ' CALL addrg
 jmp #JMPA
 long @C__waitsec_70 ' JUMPV addrg
C__waitsec_69
 jmp #LODI
 long @C_soek3_67b10fa6_min_tick_L000004
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 sub r23, #1 ' SUBU4 coni
C__waitsec_70
 cmp r23,  #0 wz
 jmp #BRNZ
 long @C__waitsec_69 ' NEU4
' C__waitsec_66 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_soek6_67b10fa6_overhead_L000007 ' <symbol:overhead>
 byte 0[4]

 alignl ' align long
C_soek5_67b10fa6_min_msec_L000006 ' <symbol:min_msec>
 byte 0[4]

 alignl ' align long
C_soek4_67b10fa6_min_usec_L000005 ' <symbol:min_usec>
 byte 0[4]

 alignl ' align long
C_soek3_67b10fa6_min_tick_L000004 ' <symbol:min_tick>
 byte 0[4]

 alignl ' align long
C_soek2_67b10fa6_cnt_msec_L000003 ' <symbol:cnt_msec>
 byte 0[4]

 alignl ' align long
C_soek1_67b10fa6_cnt_usec_L000002 ' <symbol:cnt_usec>
 byte 0[4]

 alignl ' align long
C_soek_67b10fa6_old_freq_L000001 ' <symbol:old_freq>
 byte 0[4]

' Catalina Code

DAT ' code segment
' end
