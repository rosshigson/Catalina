' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export gm_bound_limits

 alignl ' align long
C_gm_bound_limits ' <symbol:gm_bound_limits>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long @C_sga0_67cacb84_m_min_L000001
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sga01_67cacb84_m_max_L000002
 mov BC, r4
 jmp #WLNG ' ASGNI4 addrg reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long @C_sga0_67cacb84_m_min_L000001+4
 mov BC, r22
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sga01_67cacb84_m_max_L000002+4
 mov BC, r3
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sga0_67cacb84_m_min_L000001+8
 mov BC, r5
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sga01_67cacb84_m_max_L000002+8
 mov BC, r2
 jmp #WLNG ' ASGNI4 addrg reg
' C_gm_bound_limits_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export gm_bound_scales

 alignl ' align long
C_gm_bound_scales ' <symbol:gm_bound_scales>
 jmp #LODL
 long @C_sga02_67cacb84_m_div_L000003
 mov BC, r4
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sga02_67cacb84_m_div_L000003+4
 mov BC, r3
 jmp #WLNG ' ASGNI4 addrg reg
 jmp #LODL
 long @C_sga02_67cacb84_m_div_L000003+8
 mov BC, r2
 jmp #WLNG ' ASGNI4 addrg reg
' C_gm_bound_scales_10 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export gm_abs

 alignl ' align long
C_gm_abs ' <symbol:gm_abs>
 cmps r2,  #0 wz,wc
 jmp #BRAE
 long @C_gm_abs_14 ' GEI4
 neg r0, r2 ' NEGI4
 jmp #JMPA
 long @C_gm_abs_13 ' JUMPV addrg
C_gm_abs_14
 mov r0, r2 ' CVI, CVU or LOAD
C_gm_abs_13
 jmp #RETN


' Catalina Export gm_bound_preset

 alignl ' align long
C_gm_bound_preset ' <symbol:gm_bound_preset>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ff8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r23, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNI4 addrli reg
 mov r17, #0 ' reg <- coni
C_gm_bound_preset_19
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sga02_67cacb84_m_div_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_m_abs ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sga03_67cacb84_m_acc_L000004
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_sga0_67cacb84_m_min_L000001
 mov r16, RI ' reg <- addrg
 adds r22, r16 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, r18
 neg r22, r22 ' SUBI/P (2)
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r15 ' ADDI/P (3)
 sar r22, #1 ' RSHI4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
' C_gm_bound_preset_20 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #3 wz,wc
 jmp #BR_B
 long @C_gm_bound_preset_19 ' LTI4
' C_gm_bound_preset_16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export gm_limit

 alignl ' align long
C_gm_limit ' <symbol:gm_limit>
 jmp #NEWF
 jmp #PSHM
 long $fd0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_gm_limit_24 ' GEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_gm_limit_23 ' JUMPV addrg
C_gm_limit_24
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sga02_67cacb84_m_div_L000003
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 mov RI, r20
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_m_abs ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sga01_67cacb84_m_max_L000002
 mov r18, RI ' reg <- addrg
 adds r18, r22 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_sga0_67cacb84_m_min_L000001
 mov r16, RI ' reg <- addrg
 adds r22, r16 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, r18
 neg r22, r22 ' SUBI/P (2)
 adds r22, #1 ' ADDI4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r19, r0
 subs r19, #1 ' SUBI4 coni
 cmps r21, r19 wz,wc
 jmp #BRBE
 long @C_gm_limit_26 ' LEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_gm_limit_23 ' JUMPV addrg
C_gm_limit_26
 mov r0, r21 ' CVI, CVU or LOAD
C_gm_limit_23
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export gm_bound

 alignl ' align long
C_gm_bound ' <symbol:gm_bound>
 jmp #NEWF
 jmp #PSHM
 long $fd0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sga02_67cacb84_m_div_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 cmps r19,  #0 wz,wc
 jmp #BRAE
 long @C_gm_bound_29 ' GEI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sga03_67cacb84_m_acc_L000004
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r2, r20 ' SUBI/P
 subs r2, r21 ' SUBI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_m_limit
 add SP, #4 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_gm_bound_30 ' JUMPV addrg
C_gm_bound_29
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sga03_67cacb84_m_acc_L000004
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r2, r20 ' ADDI/P
 adds r2, r21 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_m_limit
 add SP, #4 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
C_gm_bound_30
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_m_abs ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sga0_67cacb84_m_min_L000001
 mov r18, RI ' reg <- addrg
 adds r18, r20 ' ADDI/P (2)
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_sga03_67cacb84_m_acc_L000004
 mov r16, RI ' reg <- addrg
 adds r20, r16 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 adds r0, r18 ' ADDI/P (2)
' C_gm_bound_28 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export gm_bound_x

 alignl ' align long
C_gm_bound_x ' <symbol:gm_bound_x>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_gm_delta_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_m_bound
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_gm_bound_x_31 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export gm_bound_y

 alignl ' align long
C_gm_bound_y ' <symbol:gm_bound_y>
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_gm_delta_y ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_m_bound
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_gm_bound_y_32 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import m_bound

' Catalina Import m_limit

' Catalina Import m_abs

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sga03_67cacb84_m_acc_L000004 ' <symbol:m_acc>
 byte 0[12]

 alignl ' align long
C_sga02_67cacb84_m_div_L000003 ' <symbol:m_div>
 byte 0[12]

 alignl ' align long
C_sga01_67cacb84_m_max_L000002 ' <symbol:m_max>
 byte 0[12]

 alignl ' align long
C_sga0_67cacb84_m_min_L000001 ' <symbol:m_min>
 byte 0[12]

' Catalina Code

DAT ' code segment

' Catalina Import gm_delta_y

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import gm_delta_x

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
