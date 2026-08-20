' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_justify

 alignl ' align long
C_g_justify ' <symbol:g_justify>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 mov r20, ##@C_G__V_A_R_+8
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, ##@C_G__V_A_R_+16
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r0, r22 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #5 ' reg <- coni
 mov r20, ##@C_G__V_A_R_+8
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (1)
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_G__V_A_R_+20
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 sar r22, #2 ' RSHI4 coni
 mov r17, r22
 and r17, #3 ' BANDI4 coni
 cmps r17,  #0 wcz
 if_b jmp #\C_g_justify_8 ' LTI4
 cmps r17,  #3 wcz
 if_a jmp #\C_g_justify_8 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_g_justify_16_L000018 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_g_justify_16_L000018 ' <symbol:16>
 long @C_g_justify_12
 long @C_g_justify_13
 long @C_g_justify_14
 long @C_g_justify_15

' Catalina Code

DAT ' code segment
C_g_justify_12
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_g_justify_9 ' JUMPV addrg
C_g_justify_13
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 sar r22, #1 ' RSHI4 coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_g_justify_9 ' JUMPV addrg
C_g_justify_14
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_g_justify_9 ' JUMPV addrg
C_g_justify_15
 mov r22, #0 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_g_justify_8
C_g_justify_9
 mov r22, ##@C_G__V_A_R_+20
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r15, r22
 and r15, #3 ' BANDI4 coni
 cmps r15,  #0 wcz
 if_b jmp #\C_g_justify_19 ' LTI4
 cmps r15,  #3 wcz
 if_a jmp #\C_g_justify_19 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_g_justify_29_L000031 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_g_justify_29_L000031 ' <symbol:29>
 long @C_g_justify_23
 long @C_g_justify_24
 long @C_g_justify_26
 long @C_g_justify_28

' Catalina Code

DAT ' code segment
C_g_justify_23
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #\@C_g_justify_20 ' JUMPV addrg
C_g_justify_24
 mov r22, ##@C_G__V_A_R_+12
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 neg r22, r22 ' NEGI4
 shl r22, #3 ' LSHI4 coni
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #\@C_g_justify_20 ' JUMPV addrg
C_g_justify_26
 mov r22, ##@C_G__V_A_R_+12
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 neg r22, r22 ' NEGI4
 shl r22, #4 ' LSHI4 coni
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #\@C_g_justify_20 ' JUMPV addrg
C_g_justify_28
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
C_g_justify_19
C_g_justify_20
' C_g_justify_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import strlen

' Catalina Import G_VAR
' end
