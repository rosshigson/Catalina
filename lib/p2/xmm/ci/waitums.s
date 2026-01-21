' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s7f47_696ddef9_recalculate_L000008 ' <symbol:recalculate>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s7f4_696ddef9_old_freq_L000001
 mov BC, r23
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODL
 long $f4240
 mov r22, RI ' reg <- con
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODL
 long @C_s7f41_696ddef9_cnt_usec_L000002
 mov BC, r0
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODL
 long 1000
 mov r22, RI ' reg <- con
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODL
 long @C_s7f42_696ddef9_cnt_msec_L000003
 mov BC, r0
 jmp #WLNG ' ASGNU4 addrg reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #LODL
 long @C_s7f43_696ddef9_min_tick_L000004
 mov BC, r0
 jmp #WLNG ' ASGNU4 addrg reg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitus ' CALL addrg
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
 mov r22, r19 ' SUBU
 sub r22, r21 ' SUBU (3)
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r20, RI ' reg <- INDIRU4 addrg
 shl r20, #1 ' LSHU4 coni
 sub r22, r20 ' SUBU (1)
 jmp #LODL
 long @C_s7f46_696ddef9_overhead_L000007
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODI
 long @C_s7f46_696ddef9_overhead_L000007
 mov r22, RI ' reg <- INDIRU4 addrg
 jmp #LODI
 long @C_s7f41_696ddef9_cnt_usec_L000002
 mov r20, RI ' reg <- INDIRU4 addrg
 mov r18, r22 ' ADDU
 add r18, r20 ' ADDU (3)
 sub r18, #1 ' SUBU4 coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODL
 long @C_s7f44_696ddef9_min_usec_L000005
 mov BC, r0
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODI
 long @C_s7f42_696ddef9_cnt_msec_L000003
 mov r20, RI ' reg <- INDIRU4 addrg
 add r22, r20 ' ADDU (1)
 sub r22, #1 ' SUBU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODL
 long @C_s7f45_696ddef9_min_msec_L000006
 mov BC, r0
 jmp #WLNG ' ASGNU4 addrg reg
' C_s7f47_696ddef9_recalculate_L000008_9 ' (symbol refcount = 0)
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 jmp #BR_Z
 long @C_min_waitus_11 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
C_min_waitus_11
 jmp #LODI
 long @C_s7f44_696ddef9_min_usec_L000005
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 jmp #BR_Z
 long @C_min_waitms_14 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
C_min_waitms_14
 jmp #LODI
 long @C_s7f45_696ddef9_min_msec_L000006
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wz
 jmp #BR_Z
 long @C_min_wait_17 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
C_min_wait_17
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r0, RI ' reg <- INDIRU4 addrg
' C_min_wait_16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _wait

 alignl ' align long
C__wait ' <symbol:_wait>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 cmp r23,  #0 wz
 jmp #BR_Z
 long @C__wait_20 ' EQU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
C__wait_20
' loading argument C__wait_22_L000023 to PASM eliminated
' ticks resolves to C identifier ticks (PASM r23)
' ticks resolves to C identifier ticks (PASM r23)
'START PASM ... 
#ifdef COMPACT
 word I16B_EXEC
   alignl ' align long
#endif
 cmp r23, #0 wz
 getct  r1
 if_nz addct2 r1, r23
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
 jmp #RETF


' Catalina Export _iwait

 alignl ' align long
C__iwait ' <symbol:_iwait>
' loading argument C__iwait_25_L000026 to PASM eliminated
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
' C__iwait_24 ' (symbol refcount = 0)
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__iwaitus_28 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
C__iwaitus_28
 jmp #LODI
 long @C_s7f44_696ddef9_min_usec_L000005
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wz,wc 
 jmp #BRBE
 long @C__iwaitus_31 ' LEU4
 jmp #LODI
 long @C_s7f44_696ddef9_min_usec_L000005
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r19, r23 ' SUBU
 sub r19, r22 ' SUBU (3)
 jmp #JMPA
 long @C__iwaitus_32 ' JUMPV addrg
C__iwaitus_31
 jmp #LODI
 long @C_s7f44_696ddef9_min_usec_L000005
 mov r19, RI ' reg <- INDIRU4 addrg
C__iwaitus_32
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s7f41_696ddef9_cnt_usec_L000002
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitus_27 ' (symbol refcount = 0)
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__iwaitms_34 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
C__iwaitms_34
 jmp #LODI
 long @C_s7f45_696ddef9_min_msec_L000006
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r23, r22 wz,wc 
 jmp #BRBE
 long @C__iwaitms_37 ' LEU4
 jmp #LODI
 long @C_s7f45_696ddef9_min_msec_L000006
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r19, r23 ' SUBU
 sub r19, r22 ' SUBU (3)
 jmp #JMPA
 long @C__iwaitms_38 ' JUMPV addrg
C__iwaitms_37
 jmp #LODI
 long @C_s7f45_696ddef9_min_msec_L000006
 mov r19, RI ' reg <- INDIRU4 addrg
C__iwaitms_38
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s7f42_696ddef9_cnt_msec_L000003
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitms_33 ' (symbol refcount = 0)
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__iwaitsec_40 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
C__iwaitsec_40
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__iwait
 add SP, #4 ' CALL addrg
' C__iwaitsec_39 ' (symbol refcount = 0)
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__waitus_43 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
C__waitus_43
 jmp #LODI
 long @C_s7f41_696ddef9_cnt_usec_L000002
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s7f46_696ddef9_overhead_L000007
 mov r20, RI ' reg <- INDIRU4 addrg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C__waitus_48' LTU4
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s7f46_696ddef9_overhead_L000007
 mov r20, RI ' reg <- INDIRU4 addrg
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__waitus_48 ' JUMPV addrg
C__waitus_47
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, r21 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
C__waitus_48
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22, r21 wz,wc 
 jmp #BR_A
 long @C__waitus_47 ' GTU4
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r20, RI ' reg <- INDIRU4 addrg
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C__waitus_50 ' LEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #JMPA
 long @C__waitus_42 ' JUMPV addrg
C__waitus_50
 cmps r19,  #0 wz,wc
 jmp #BRBE
 long @C__waitus_52 ' LEI4
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #JMPA
 long @C__waitus_42 ' JUMPV addrg
C__waitus_52
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r20, RI ' reg <- INDIRU4 addrg
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C__waitus_54 ' LEU4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #JMPA
 long @C__waitus_42 ' JUMPV addrg
C__waitus_54
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
C__waitus_42
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__waitms_57 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
C__waitms_57
 jmp #LODI
 long @C_s7f42_696ddef9_cnt_msec_L000003
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_s7f46_696ddef9_overhead_L000007
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r19, r22 wz,wc 
 jmp #BR_B
 long @C__waitms_62' LTU4
 jmp #LODI
 long @C_s7f46_696ddef9_overhead_L000007
 mov r22, RI ' reg <- INDIRU4 addrg
 sub r19, r22 ' SUBU (1)
 jmp #JMPA
 long @C__waitms_62 ' JUMPV addrg
C__waitms_61
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 sub r19, r21 ' SUBU (1)
C__waitms_62
 cmp r19, r21 wz,wc 
 jmp #BR_A
 long @C__waitms_61 ' GTU4
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r19, r22 wz,wc 
 jmp #BRBE
 long @C__waitms_64 ' LEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 jmp #JMPA
 long @C__waitms_56 ' JUMPV addrg
C__waitms_64
 cmp r19,  #0 wz
 jmp #BR_Z
 long @C__waitms_66 ' EQU4
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
C__waitms_66
C__waitms_56
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
 long @C_s7f4_696ddef9_old_freq_L000001
 mov r22, RI ' reg <- INDIRU4 addrg
 cmp r21, r22 wz
 jmp #BR_Z
 long @C__waitsec_72 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s7f47_696ddef9_recalculate_L000008 ' CALL addrg
 jmp #JMPA
 long @C__waitsec_72 ' JUMPV addrg
C__waitsec_71
 jmp #LODI
 long @C_s7f43_696ddef9_min_tick_L000004
 mov r22, RI ' reg <- INDIRU4 addrg
 mov r2, r21 ' SUBU
 sub r2, r22 ' SUBU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__wait ' CALL addrg
 sub r23, #1 ' SUBU4 coni
C__waitsec_72
 cmp r23,  #0 wz
 jmp #BRNZ
 long @C__waitsec_71 ' NEU4
' C__waitsec_68 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s7f46_696ddef9_overhead_L000007 ' <symbol:overhead>
 byte 0[4]

 alignl ' align long
C_s7f45_696ddef9_min_msec_L000006 ' <symbol:min_msec>
 byte 0[4]

 alignl ' align long
C_s7f44_696ddef9_min_usec_L000005 ' <symbol:min_usec>
 byte 0[4]

 alignl ' align long
C_s7f43_696ddef9_min_tick_L000004 ' <symbol:min_tick>
 byte 0[4]

 alignl ' align long
C_s7f42_696ddef9_cnt_msec_L000003 ' <symbol:cnt_msec>
 byte 0[4]

 alignl ' align long
C_s7f41_696ddef9_cnt_usec_L000002 ' <symbol:cnt_usec>
 byte 0[4]

 alignl ' align long
C_s7f4_696ddef9_old_freq_L000001 ' <symbol:old_freq>
 byte 0[4]

' Catalina Code

DAT ' code segment
' end
