' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s5uo7_66cc6597_recalculate_L000008 ' <symbol:recalculate>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODA + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $f4240 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl ' align long
 long I32_LODA + (@C_s5uo1_66cc6597_cnt_usec_L000002)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl ' align long
 long I32_LODA + (@C_s5uo2_66cc6597_cnt_msec_L000003)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitus)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_s5uo6_66cc6597_overhead_L000007 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r20)<<D16A + (r21)<<S16A ' SUBU (3)
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 alignl ' align long
 long I32_LODA + (@C_s5uo6_66cc6597_overhead_L000007)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl ' align long
 long I32_LODI + (@C_s5uo1_66cc6597_cnt_usec_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r18)<<D16A + (r20)<<S16A ' ADDU (3)
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl ' align long
 long I32_LODA + (@C_s5uo4_66cc6597_min_usec_L000005)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_s5uo2_66cc6597_cnt_msec_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl ' align long
 long I32_LODA + (@C_s5uo5_66cc6597_min_msec_L000006)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
' C_s5uo7_66cc6597_recalculate_L000008_9 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export min_waitus

 alignl ' align long
C_min_waitus ' <symbol:min_waitus>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_min_waitus_11)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
C_min_waitus_11
 alignl ' align long
 long I32_LODI + (@C_s5uo4_66cc6597_min_usec_L000005)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
' C_min_waitus_10 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export min_waitms

 alignl ' align long
C_min_waitms ' <symbol:min_waitms>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_min_waitms_14)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
C_min_waitms_14
 alignl ' align long
 long I32_LODI + (@C_s5uo5_66cc6597_min_msec_L000006)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
' C_min_waitms_13 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export min_wait

 alignl ' align long
C_min_wait ' <symbol:min_wait>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_min_wait_17)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
C_min_wait_17
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
' C_min_wait_16 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _wait

 alignl ' align long
C__wait ' <symbol:_wait>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
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
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C__wait_19 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export _iwait

 alignl ' align long
C__iwait ' <symbol:_iwait>
' loading argument C__iwait_23_L000024 to PASM eliminated
' cnt resolves to C identifier cnt (PASM r2)
' delay resolves to C identifier delay (PASM r3)
' cnt resolves to C identifier cnt (PASM r2)
'START PASM ... 
 word I16B_EXEC
 alignl ' align long
   cmp    r2, #0 wz
 if_z     add PC, #(@_IWAIT_RET-@_IWAIT_0)
_IWAIT_0
   getct  r0
_IWAIT_LOOP
   addct2 r0, r3
_IWAIT_POLL
   pollct2 wc
 if_nc sub PC,#(@_IWAIT_POLLED-@_IWAIT_POLL)
_IWAIT_POLLED
   sub    r2, #1 wz
  if_nz sub PC,#(@_IWAIT_RET-@_IWAIT_LOOP)
_IWAIT_RET
 jmp #EXEC_STOP

'... END PASM
' call to PASM eliminated
' C__iwait_22 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Export _iwaitus

 alignl ' align long
C__iwaitus ' <symbol:_iwaitus>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__iwaitus_26)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
C__iwaitus_26
 alignl ' align long
 long I32_LODI + (@C_s5uo4_66cc6597_min_usec_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__iwaitus_29)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_s5uo4_66cc6597_min_usec_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r19)<<D16A + (r23)<<S16A ' SUBU
 word I16A_SUB + (r19)<<D16A + (r22)<<S16A ' SUBU (3)
 alignl ' align long
 long I32_JMPA + (@C__iwaitus_30)<<S32 ' JUMPV addrg
 alignl ' align long
C__iwaitus_29
 alignl ' align long
 long I32_LODI + (@C_s5uo4_66cc6597_min_usec_L000005)<<S32
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 alignl ' align long
C__iwaitus_30
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo1_66cc6597_cnt_usec_L000002)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__iwait)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C__iwaitus_25 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _iwaitms

 alignl ' align long
C__iwaitms ' <symbol:_iwaitms>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__iwaitms_32)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
C__iwaitms_32
 alignl ' align long
 long I32_LODI + (@C_s5uo5_66cc6597_min_msec_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__iwaitms_35)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_s5uo5_66cc6597_min_msec_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r19)<<D16A + (r23)<<S16A ' SUBU
 word I16A_SUB + (r19)<<D16A + (r22)<<S16A ' SUBU (3)
 alignl ' align long
 long I32_JMPA + (@C__iwaitms_36)<<S32 ' JUMPV addrg
 alignl ' align long
C__iwaitms_35
 alignl ' align long
 long I32_LODI + (@C_s5uo5_66cc6597_min_msec_L000006)<<S32
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 alignl ' align long
C__iwaitms_36
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo2_66cc6597_cnt_msec_L000003)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__iwait)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C__iwaitms_31 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _iwaitsec

 alignl ' align long
C__iwaitsec ' <symbol:_iwaitsec>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__iwaitsec_38)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
C__iwaitsec_38
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__iwait)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C__iwaitsec_37 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _waitus

 alignl ' align long
C__waitus ' <symbol:_waitus>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__waitus_41)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
C__waitus_41
 alignl ' align long
 long I32_LODI + (@C_s5uo1_66cc6597_cnt_usec_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo6_66cc6597_overhead_L000007)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__waitus_46)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo6_66cc6597_overhead_L000007)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__waitus_46)<<S32 ' JUMPV addrg
 alignl ' align long
C__waitus_45
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r22)<<S16A ' SUBU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C__waitus_46
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_A + (@C__waitus_45)<<S32 ' GTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__waitus_48)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__waitus_40)<<S32 ' JUMPV addrg
 alignl ' align long
C__waitus_48
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__waitus_50)<<S32 ' LEI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__waitus_40)<<S32 ' JUMPV addrg
 alignl ' align long
C__waitus_50
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__waitus_52)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__waitus_40)<<S32 ' JUMPV addrg
 alignl ' align long
C__waitus_52
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl ' align long
C__waitus_40
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _waitms

 alignl ' align long
C__waitms ' <symbol:_waitms>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__waitms_55)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
C__waitms_55
 alignl ' align long
 long I32_LODI + (@C_s5uo2_66cc6597_cnt_msec_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo6_66cc6597_overhead_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__waitms_60)<<S32 ' LTU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_s5uo6_66cc6597_overhead_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUB + (r19)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl ' align long
 long I32_JMPA + (@C__waitms_60)<<S32 ' JUMPV addrg
 alignl ' align long
C__waitms_59
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r22)<<S16A ' SUBU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 word I16A_SUB + (r19)<<D16A + (r21)<<S16A ' SUBU (1)
 alignl ' align long
C__waitms_60
 word I16A_CMP + (r19)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_A + (@C__waitms_59)<<S32 ' GTU4 reg reg
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__waitms_62)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__waitms_54)<<S32 ' JUMPV addrg
 alignl ' align long
C__waitms_62
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__waitms_64)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl ' align long
C__waitms_64
 alignl ' align long
C__waitms_54
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _waitsec

 alignl ' align long
C__waitsec ' <symbol:_waitsec>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_s5uo_66cc6597_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__waitsec_70)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s5uo7_66cc6597_recalculate_L000008)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C__waitsec_70)<<S32 ' JUMPV addrg
 alignl ' align long
C__waitsec_69
 alignl ' align long
 long I32_LODI + (@C_s5uo3_66cc6597_min_tick_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r22)<<S16A ' SUBU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 word I16A_SUBI + (r23)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl ' align long
C__waitsec_70
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__waitsec_69)<<S32 ' NEU4 reg coni
' C__waitsec_66 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s5uo6_66cc6597_overhead_L000007 ' <symbol:overhead>
 byte 0[4]

 alignl ' align long
C_s5uo5_66cc6597_min_msec_L000006 ' <symbol:min_msec>
 byte 0[4]

 alignl ' align long
C_s5uo4_66cc6597_min_usec_L000005 ' <symbol:min_usec>
 byte 0[4]

 alignl ' align long
C_s5uo3_66cc6597_min_tick_L000004 ' <symbol:min_tick>
 byte 0[4]

 alignl ' align long
C_s5uo2_66cc6597_cnt_msec_L000003 ' <symbol:cnt_msec>
 byte 0[4]

 alignl ' align long
C_s5uo1_66cc6597_cnt_usec_L000002 ' <symbol:cnt_usec>
 byte 0[4]

 alignl ' align long
C_s5uo_66cc6597_old_freq_L000001 ' <symbol:old_freq>
 byte 0[4]

' Catalina Code

DAT ' code segment
' end
