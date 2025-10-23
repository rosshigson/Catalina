' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export m_bound_limits

 alignl ' align long
C_m_bound_limits ' <symbol:m_bound_limits>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, ##@C_s4rk_68f739fb_m_min_L000002 ' ASGNI4 addrg reg
 wrlong r4, ##@C_s4rk1_68f739fb_m_max_L000003 ' ASGNI4 addrg reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, ##@C_s4rk_68f739fb_m_min_L000002+4 ' ASGNI4 addrg reg
 wrlong r3, ##@C_s4rk1_68f739fb_m_max_L000003+4 ' ASGNI4 addrg reg
 wrlong r5, ##@C_s4rk_68f739fb_m_min_L000002+8 ' ASGNI4 addrg reg
 wrlong r2, ##@C_s4rk1_68f739fb_m_max_L000003+8 ' ASGNI4 addrg reg
' C_m_bound_limits_6 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export m_bound_scales

 alignl ' align long
C_m_bound_scales ' <symbol:m_bound_scales>
 wrlong r4, ##@C_s4rk2_68f739fb_m_div_L000004 ' ASGNI4 addrg reg
 wrlong r3, ##@C_s4rk2_68f739fb_m_div_L000004+4 ' ASGNI4 addrg reg
 wrlong r2, ##@C_s4rk2_68f739fb_m_div_L000004+8 ' ASGNI4 addrg reg
' C_m_bound_scales_11 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export m_abs

 alignl ' align long
C_m_abs ' <symbol:m_abs>
 cmps r2,  #0 wcz
 if_ae jmp #\C_m_abs_15 ' GEI4
 neg r0, r2 ' NEGI4
 jmp #\@C_m_abs_14 ' JUMPV addrg
C_m_abs_15
 mov r0, r2 ' CVI, CVU or LOAD
C_m_abs_14
 calld PA,#RETN


' Catalina Export m_bound_preset

 alignl ' align long
C_m_bound_preset ' <symbol:m_bound_preset>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
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
C_m_bound_preset_20
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s4rk2_68f739fb_m_div_L000004 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_m_abs ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s4rk3_68f739fb_m_acc_L000005 ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r16, ##@C_s4rk_68f739fb_m_min_L000002 ' reg <- addrg
 adds r22, r16 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r18
 neg r22, r22 ' SUBI/P (2)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r15 ' ADDI/P (3)
 sar r22, #1 ' RSHI4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
' C_m_bound_preset_21 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #3 wcz
 if_b jmp #\C_m_bound_preset_20 ' LTI4
' C_m_bound_preset_17 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export m_limit

 alignl ' align long
C_m_limit ' <symbol:m_limit>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fd0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 cmps r21,  #0 wcz
 if_ae jmp #\C_m_limit_25 ' GEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_m_limit_24 ' JUMPV addrg
C_m_limit_25
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s4rk2_68f739fb_m_div_L000004 ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 rdlong r2, r20 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_m_abs ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, ##@C_s4rk1_68f739fb_m_max_L000003 ' reg <- addrg
 adds r18, r22 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r16, ##@C_s4rk_68f739fb_m_min_L000002 ' reg <- addrg
 adds r22, r16 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r18
 neg r22, r22 ' SUBI/P (2)
 adds r22, #1 ' ADDI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r19, r0
 subs r19, #1 ' SUBI4 coni
 cmps r21, r19 wcz
 if_be jmp #\C_m_limit_27 ' LEI4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_m_limit_24 ' JUMPV addrg
C_m_limit_27
 mov r0, r21 ' CVI, CVU or LOAD
C_m_limit_24
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export m_bound

 alignl ' align long
C_m_bound ' <symbol:m_bound>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fd0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s4rk2_68f739fb_m_div_L000004 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRI4 reg
 cmps r19,  #0 wcz
 if_ae jmp #\C_m_bound_30 ' GEI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s4rk3_68f739fb_m_acc_L000005 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r2, r20 ' SUBI/P
 subs r2, r21 ' SUBI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_m_limit
 add SP, #4 ' CALL addrg
 wrlong r0, r22 ' ASGNI4 reg reg
 jmp #\@C_m_bound_31 ' JUMPV addrg
C_m_bound_30
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s4rk3_68f739fb_m_acc_L000005 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r2, r20 ' ADDI/P
 adds r2, r21 ' ADDI/P (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_m_limit
 add SP, #4 ' CALL addrg
 wrlong r0, r22 ' ASGNI4 reg reg
C_m_bound_31
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_m_abs ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #2 ' LSHI4 coni
 mov r18, ##@C_s4rk_68f739fb_m_min_L000002 ' reg <- addrg
 adds r18, r20 ' ADDI/P (2)
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r16, ##@C_s4rk3_68f739fb_m_acc_L000005 ' reg <- addrg
 adds r20, r16 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 adds r0, r18 ' ADDI/P (2)
' C_m_bound_29 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export m_bound_x

 alignl ' align long
C_m_bound_x ' <symbol:m_bound_x>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_m_delta_x ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_m_bound
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_bound_x_32 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export m_bound_y

 alignl ' align long
C_m_bound_y ' <symbol:m_bound_y>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_m_delta_y ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_m_bound
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_bound_y_33 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export m_bound_z

 alignl ' align long
C_m_bound_z ' <symbol:m_bound_z>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_m_delta_z ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_m_bound
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_m_bound_z_34 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_s4rk3_68f739fb_m_acc_L000005 ' <symbol:m_acc>
 byte 0[12]

 alignl ' align long
C_s4rk2_68f739fb_m_div_L000004 ' <symbol:m_div>
 byte 0[12]

 alignl ' align long
C_s4rk1_68f739fb_m_max_L000003 ' <symbol:m_max>
 byte 0[12]

 alignl ' align long
C_s4rk_68f739fb_m_min_L000002 ' <symbol:m_min>
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
