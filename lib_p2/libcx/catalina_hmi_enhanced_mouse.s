' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export m_bound_limits

 alignl ' align long
C_m_bound_limits ' <symbol:m_bound_limits>
 PRIMITIVE(#NEWF)
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long @C_sk9k_6132d0fd_m_min_L000002
 wrlong r22, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODL)
 long @C_sk9k1_6132d0fd_m_max_L000003
 wrlong r4, RI ' ASGNI4 addrg reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long @C_sk9k_6132d0fd_m_min_L000002+4
 wrlong r22, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODL)
 long @C_sk9k1_6132d0fd_m_max_L000003+4
 wrlong r3, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODL)
 long @C_sk9k_6132d0fd_m_min_L000002+8
 wrlong r5, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODL)
 long @C_sk9k1_6132d0fd_m_max_L000003+8
 wrlong r2, RI ' ASGNI4 addrg reg
' C_m_bound_limits_6 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETF)


' Catalina Export m_bound_scales

 alignl ' align long
C_m_bound_scales ' <symbol:m_bound_scales>
 PRIMITIVE(#LODL)
 long @C_sk9k2_6132d0fd_m_div_L000004
 wrlong r4, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODL)
 long @C_sk9k2_6132d0fd_m_div_L000004+4
 wrlong r3, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODL)
 long @C_sk9k2_6132d0fd_m_div_L000004+8
 wrlong r2, RI ' ASGNI4 addrg reg
' C_m_bound_scales_11 ' (symbol refcount = 0)
 PRIMITIVE(#RETN)


' Catalina Export m_abs

 alignl ' align long
C_m_abs ' <symbol:m_abs>
 cmps r2,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_m_abs_15 ' GEI4
 neg r0, r2 ' NEGI4
 PRIMITIVE(#JMPA)
 long @C_m_abs_14 ' JUMPV addrg
C_m_abs_15
 mov r0, r2 ' CVI, CVU or LOAD
C_m_abs_14
 PRIMITIVE(#RETN)


' Catalina Export m_bound_preset

 alignl ' align long
C_m_bound_preset ' <symbol:m_bound_preset>
 PRIMITIVE(#NEWF)
 sub SP, #12
 PRIMITIVE(#PSHM)
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 PRIMITIVE(#LODF)
 long -12
 wrlong r23, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODF)
 long -8
 wrlong r21, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODF)
 long -4
 wrlong r19, RI ' ASGNI4 addrl reg
 mov r17, #0 ' reg <- coni
C_m_bound_preset_20
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_sk9k2_6132d0fd_m_div_L000004
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_m_abs ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long @C_sk9k_6132d0fd_m_min_L000002
 mov r18, RI ' reg <- addrg
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 subs r20, r18 ' SUBI/P (1)
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 PRIMITIVE(#LODL)
 long @C_sk9k3_6132d0fd_m_acc_L000005
 mov r18, RI ' reg <- addrg
 adds r22, r18 ' ADDI/P (1)
 mov r20, r0 ' ADDI/P
 adds r20, r15 ' ADDI/P (3)
 sar r20, #1 ' RSHI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_m_bound_preset_21 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #3 wcz
 PRIMITIVE(#BR_B)
 long @C_m_bound_preset_20 ' LTI4
' C_m_bound_preset_17 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #12 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export m_limit

 alignl ' align long
C_m_limit ' <symbol:m_limit>
 PRIMITIVE(#PSHM)
 long $fd0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 cmps r21,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_m_limit_25 ' GEI4
 mov r0, #0 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_m_limit_24 ' JUMPV addrg
C_m_limit_25
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_sk9k2_6132d0fd_m_div_L000004
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r2, r20 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_m_abs ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C_sk9k1_6132d0fd_m_max_L000003
 mov r18, RI ' reg <- addrg
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long @C_sk9k_6132d0fd_m_min_L000002
 mov r16, RI ' reg <- addrg
 adds r22, r16 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r18
 neg r22, r22 ' SUBI/P (2)
 adds r22, #1 ' ADDI4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r19, r0
 subs r19, #1 ' SUBI4 coni
 cmps r21, r19 wcz
 PRIMITIVE(#BRBE)
 long @C_m_limit_27 ' LEI4
 mov r0, r19 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_m_limit_24 ' JUMPV addrg
C_m_limit_27
 mov r0, r21 ' CVI, CVU or LOAD
C_m_limit_24
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export m_bound

 alignl ' align long
C_m_bound ' <symbol:m_bound>
 PRIMITIVE(#PSHM)
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_sk9k2_6132d0fd_m_div_L000004
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRI4 reg
 cmps r19,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_m_bound_30 ' GEI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_sk9k3_6132d0fd_m_acc_L000005
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r2, r20 ' SUBI/P
 subs r2, r21 ' SUBI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_m_limit
 add SP, #4 ' CALL addrg
 wrlong r0, r22 ' ASGNI4 reg reg
 PRIMITIVE(#JMPA)
 long @C_m_bound_31 ' JUMPV addrg
C_m_bound_30
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_sk9k3_6132d0fd_m_acc_L000005
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r2, r20 ' ADDI/P
 adds r2, r21 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_m_limit
 add SP, #4 ' CALL addrg
 wrlong r0, r22 ' ASGNI4 reg reg
C_m_bound_31
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_m_abs ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C_sk9k3_6132d0fd_m_acc_L000005
 mov r18, RI ' reg <- addrg
 adds r18, r20 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C_sk9k_6132d0fd_m_min_L000002
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r20 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
' C_m_bound_29 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export m_bound_x

 alignl ' align long
C_m_bound_x ' <symbol:m_bound_x>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_m_delta_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_m_bound
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_bound_x_32 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export m_bound_y

 alignl ' align long
C_m_bound_y ' <symbol:m_bound_y>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_m_delta_y ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_m_bound
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_bound_y_33 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export m_bound_z

 alignl ' align long
C_m_bound_z ' <symbol:m_bound_z>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_m_delta_z ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_m_bound
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_bound_z_34 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sk9k3_6132d0fd_m_acc_L000005 ' <symbol:m_acc>
 byte 0[12]

 alignl ' align long
C_sk9k2_6132d0fd_m_div_L000004 ' <symbol:m_div>
 byte 0[12]

 alignl ' align long
C_sk9k1_6132d0fd_m_max_L000003 ' <symbol:m_max>
 byte 0[12]

 alignl ' align long
C_sk9k_6132d0fd_m_min_L000002 ' <symbol:m_min>
 byte 0[12]

' Catalina Code

DAT ' code segment

' Catalina Import m_delta_z

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import m_delta_y

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import m_delta_x

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
