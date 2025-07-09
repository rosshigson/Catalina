' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_sde87_686cc474_recalculate_L000008 ' <symbol:recalculate>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODA + (@C_sde8_686cc474_old_freq_L000001)<<S32
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $f4240 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl_p1
 long I32_LODA + (@C_sde81_686cc474_cnt_usec_L000002)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl_p1
 long I32_LODA + (@C_sde82_686cc474_cnt_msec_L000003)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitus)<<S32 ' CALL addrg
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_sde86_686cc474_overhead_L000007 ' reg <- addrg
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r20)<<D16A + (r21)<<S16A ' SUBU (3)
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 alignl_p1
 long I32_LODA + (@C_sde86_686cc474_overhead_L000007)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODI + (@C_sde81_686cc474_cnt_usec_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r18)<<D16A + (r20)<<S16A ' ADDU (3)
 word I16A_SUBI + (r18)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl_p1
 long I32_LODA + (@C_sde84_686cc474_min_usec_L000005)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl_p1
 long I32_LODI + (@C_sde82_686cc474_cnt_msec_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl_p1
 long I32_LODA + (@C_sde85_686cc474_min_msec_L000006)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrg reg
' C_sde87_686cc474_recalculate_L000008_9 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export min_waitus

 alignl_label
C_min_waitus ' <symbol:min_waitus>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde8_686cc474_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_min_waitus_11)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sde87_686cc474_recalculate_L000008)<<S32 ' CALL addrg
 alignl_label
C_min_waitus_11
 alignl_p1
 long I32_LODI + (@C_sde84_686cc474_min_usec_L000005)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
' C_min_waitus_10 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export min_waitms

 alignl_label
C_min_waitms ' <symbol:min_waitms>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde8_686cc474_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_min_waitms_14)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sde87_686cc474_recalculate_L000008)<<S32 ' CALL addrg
 alignl_label
C_min_waitms_14
 alignl_p1
 long I32_LODI + (@C_sde85_686cc474_min_msec_L000006)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
' C_min_waitms_13 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export min_wait

 alignl_label
C_min_wait ' <symbol:min_wait>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde8_686cc474_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_min_wait_17)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sde87_686cc474_recalculate_L000008)<<S32 ' CALL addrg
 alignl_label
C_min_wait_17
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
' C_min_wait_16 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _wait

 alignl_label
C__wait ' <symbol:_wait>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
' loading argument C__wait_20_L000021 to PASM eliminated
' ticks resolves to C identifier ticks (PASM r2)
' ticks resolves to C identifier ticks (PASM r2)
'START PASM ... 

#ifdef COMPACT
 word I16B_EXEC
 alignl
#endif
 cmp r2, #0 wz
 mov r1, CNT
 if_nz add r1, r2
 if_nz waitcnt r1, #0
 if_z mov r0, CNT
 if_z sub r0, r1
#ifdef COMPACT
 jmp #EXEC_STOP
#endif

'... END PASM
' call to PASM eliminated
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C__wait_19 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export _waitus

 alignl_label
C__waitus ' <symbol:_waitus>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde8_686cc474_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__waitus_23)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sde87_686cc474_recalculate_L000008)<<S32 ' CALL addrg
 alignl_label
C__waitus_23
 alignl_p1
 long I32_LODI + (@C_sde81_686cc474_cnt_usec_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde86_686cc474_overhead_L000007)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C__waitus_28)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde86_686cc474_overhead_L000007)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C__waitus_28)<<S32 ' JUMPV addrg
 alignl_label
C__waitus_27
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r22)<<S16A ' SUBU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C__waitus_28
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_A + (@C__waitus_27)<<S32 ' GTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C__waitus_30)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C__waitus_22)<<S32 ' JUMPV addrg
 alignl_label
C__waitus_30
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C__waitus_32)<<S32 ' LEI4 reg coni
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C__waitus_22)<<S32 ' JUMPV addrg
 alignl_label
C__waitus_32
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C__waitus_34)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C__waitus_22)<<S32 ' JUMPV addrg
 alignl_label
C__waitus_34
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl_label
C__waitus_22
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _waitms

 alignl_label
C__waitms ' <symbol:_waitms>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde8_686cc474_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__waitms_37)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sde87_686cc474_recalculate_L000008)<<S32 ' CALL addrg
 alignl_label
C__waitms_37
 alignl_p1
 long I32_LODI + (@C_sde82_686cc474_cnt_msec_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde86_686cc474_overhead_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C__waitms_42)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_LODI + (@C_sde86_686cc474_overhead_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_SUB + (r19)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C__waitms_42)<<S32 ' JUMPV addrg
 alignl_label
C__waitms_41
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r22)<<S16A ' SUBU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 word I16A_SUB + (r19)<<D16A + (r21)<<S16A ' SUBU (1)
 alignl_label
C__waitms_42
 word I16A_CMP + (r19)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_A + (@C__waitms_41)<<S32 ' GTU4 reg reg
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C__waitms_44)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C__waitms_36)<<S32 ' JUMPV addrg
 alignl_label
C__waitms_44
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__waitms_46)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 alignl_label
C__waitms_46
 alignl_label
C__waitms_36
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _waitsec

 alignl_label
C__waitsec ' <symbol:_waitsec>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sde8_686cc474_old_freq_L000001)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__waitsec_52)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sde87_686cc474_recalculate_L000008)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C__waitsec_52)<<S32 ' JUMPV addrg
 alignl_label
C__waitsec_51
 alignl_p1
 long I32_LODI + (@C_sde83_686cc474_min_tick_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r22)<<S16A ' SUBU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__wait)<<S32 ' CALL addrg
 word I16A_SUBI + (r23)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl_label
C__waitsec_52
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__waitsec_51)<<S32 ' NEU4 reg coni
' C__waitsec_48 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Data

DAT ' uninitialized data segment

 alignl_label
C_sde86_686cc474_overhead_L000007 ' <symbol:overhead>
 byte 0[4]

 alignl_label
C_sde85_686cc474_min_msec_L000006 ' <symbol:min_msec>
 byte 0[4]

 alignl_label
C_sde84_686cc474_min_usec_L000005 ' <symbol:min_usec>
 byte 0[4]

 alignl_label
C_sde83_686cc474_min_tick_L000004 ' <symbol:min_tick>
 byte 0[4]

 alignl_label
C_sde82_686cc474_cnt_msec_L000003 ' <symbol:cnt_msec>
 byte 0[4]

 alignl_label
C_sde81_686cc474_cnt_usec_L000002 ' <symbol:cnt_usec>
 byte 0[4]

 alignl_label
C_sde8_686cc474_old_freq_L000001 ' <symbol:old_freq>
 byte 0[4]

' Catalina Code

DAT ' code segment
' end
