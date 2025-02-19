' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sh84_67b11158_strdup_L000005 ' <symbol:strdup>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22
 add r2, #1 ' ADDU4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_malloc ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sh84_67b11158_strdup_L000005_7 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
C_sh84_67b11158_strdup_L000005_7
 mov r0, r21 ' CVI, CVU or LOAD
' C_sh84_67b11158_strdup_L000005_6 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export _dispatch_Lua_bg

 alignl ' align long
C__dispatch_L_ua_bg ' <symbol:_dispatch_Lua_bg>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cogid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 shl r22, #2 ' LSHI4 coni
 mov r20, r0 ' CVI, CVU or LOAD
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #\@C__dispatch_L_ua_bg_11 ' JUMPV addrg
C__dispatch_L_ua_bg_10
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_13 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_15 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C__dispatch_L_ua_bg_17_L000018 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_15
C__dispatch_L_ua_bg_13
C__dispatch_L_ua_bg_11
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r13, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_10 ' EQI4
 mov r11, r13
 sar r11, #24 ' RSHI4 coni
 cmps r11,  #0 wcz
 if_be jmp #\C__dispatch_L_ua_bg_19 ' LEI4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C__dispatch_L_ua_bg_19
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C__dispatch_L_ua_bg_22 ' LTI4
 cmps r22,  #6 wcz
 if_a jmp #\C__dispatch_L_ua_bg_22 ' GTI4
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__dispatch_L_ua_bg_68_L000070 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__dispatch_L_ua_bg_68_L000070 ' <symbol:68>
 long @C__dispatch_L_ua_bg_23
 long @C__dispatch_L_ua_bg_32
 long @C__dispatch_L_ua_bg_37
 long @C__dispatch_L_ua_bg_42
 long @C__dispatch_L_ua_bg_47
 long @C__dispatch_L_ua_bg_52
 long @C__dispatch_L_ua_bg_57

' Catalina Code

DAT ' code segment
C__dispatch_L_ua_bg_23
 mov r22, ##16777215 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #1
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_24 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 subs r20, #20 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C__dispatch_L_ua_bg_26_L000027 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_24
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__dispatch_L_ua_bg_28 ' NEI4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C__dispatch_L_ua_bg_30_L000031 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_28
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__dispatch_L_ua_bg_22 ' JUMPV addrg
C__dispatch_L_ua_bg_32
 mov r22, ##16777215 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #1
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_33 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 subs r20, #20 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C__dispatch_L_ua_bg_26_L000027 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_33
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__dispatch_L_ua_bg_35 ' NEI4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C__dispatch_L_ua_bg_30_L000031 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_35
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__dispatch_L_ua_bg_22 ' JUMPV addrg
C__dispatch_L_ua_bg_37
 mov r22, ##16777215 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #2
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_38 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 subs r20, #20 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C__dispatch_L_ua_bg_26_L000027 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_38
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__dispatch_L_ua_bg_40 ' NEI4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C__dispatch_L_ua_bg_30_L000031 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_40
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__dispatch_L_ua_bg_22 ' JUMPV addrg
C__dispatch_L_ua_bg_42
 mov r22, ##16777215 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #2
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_43 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 subs r20, #20 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C__dispatch_L_ua_bg_26_L000027 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_43
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__dispatch_L_ua_bg_45 ' NEI4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C__dispatch_L_ua_bg_30_L000031 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_45
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__dispatch_L_ua_bg_22 ' JUMPV addrg
C__dispatch_L_ua_bg_47
 mov r22, ##16777215 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #2
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_48 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 subs r20, #20 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C__dispatch_L_ua_bg_26_L000027 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_48
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__dispatch_L_ua_bg_50 ' NEI4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C__dispatch_L_ua_bg_30_L000031 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_50
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__dispatch_L_ua_bg_22 ' JUMPV addrg
C__dispatch_L_ua_bg_52
 mov r22, ##16777215 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlightuserdata
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #1
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_53 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 subs r20, #20 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C__dispatch_L_ua_bg_26_L000027 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_53
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__dispatch_L_ua_bg_55 ' NEI4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C__dispatch_L_ua_bg_30_L000031 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__dispatch_L_ua_bg_55
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C__dispatch_L_ua_bg_22 ' JUMPV addrg
C__dispatch_L_ua_bg_57
 mov r22, ##16777215 ' reg <- con
 and r22, r13 ' BANDI/U (2)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRU4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #1
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_z jmp #\C__dispatch_L_ua_bg_58 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0
 subs r20, #20 ' SUBI4 coni
 adds r20, r21 ' ADDI/P (1)
 rdlong r2, r20 ' reg <- INDIRP4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C__dispatch_L_ua_bg_26_L000027 ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #8 ' CALL addrg
C__dispatch_L_ua_bg_58
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C__dispatch_L_ua_bg_60  ' NEU4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C__dispatch_L_ua_bg_62_L000063 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
 jmp #\@C__dispatch_L_ua_bg_61 ' JUMPV addrg
C__dispatch_L_ua_bg_60
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C__dispatch_L_ua_bg_64 ' LTU4
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r11 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #20 ' SUBI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, ##@C__dispatch_L_ua_bg_66_L000067 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
 jmp #\@C__dispatch_L_ua_bg_65 ' JUMPV addrg
C__dispatch_L_ua_bg_64
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22
 add r2, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C__dispatch_L_ua_bg_65
C__dispatch_L_ua_bg_61
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C__dispatch_L_ua_bg_22
 mov r22, #0 ' reg <- coni
 wrlong r22, r17 ' ASGNU4 reg reg
' C__dispatch_L_ua_bg_9 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


' Catalina Export _load_Lua_service_list

 alignl ' align long
C__load_L_ua_service_list ' <symbol:_load_Lua_service_list>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r2, ##@C__load_L_ua_service_list_72_L000073 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getglobal
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_nz jmp #\C__load_L_ua_service_list_74 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C__load_L_ua_service_list_77 ' JUMPV addrg
C__load_L_ua_service_list_76
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C__load_L_ua_service_list_79 ' EQI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C__load_L_ua_service_list_79 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sh84_67b11158_strdup_L000005 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #8 ' ADDP4 coni
 mov r20, #6 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, ##0 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 adds r17, #1 ' ADDI4 coni
 jmp #\@C__load_L_ua_service_list_80 ' JUMPV addrg
C__load_L_ua_service_list_79
 mov r2, r17
 adds r2, #1 ' ADDI4 coni
 mov r3, ##@C__load_L_ua_service_list_81_L000082 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_t_printf
 add SP, #4 ' CALL addrg
C__load_L_ua_service_list_80
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C__load_L_ua_service_list_77
 cmps r17, r19 wcz
 if_ae jmp #\C__load_L_ua_service_list_83 ' GEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C__load_L_ua_service_list_76 ' NEI4
C__load_L_ua_service_list_83
 jmp #\@C__load_L_ua_service_list_75 ' JUMPV addrg
C__load_L_ua_service_list_74
 mov r2, ##@C__load_L_ua_service_list_84_L000085 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_t_printf ' CALL addrg
C__load_L_ua_service_list_75
 mov r2, ##@C__load_L_ua_service_list_86_L000087 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sh84_67b11158_strdup_L000005 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r0 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #4 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
' C__load_L_ua_service_list_71 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import t_printf

' Catalina Import _cogid

' Catalina Import lua_next

' Catalina Import lua_pcallk

' Catalina Import lua_getglobal

' Catalina Import lua_pushlightuserdata

' Catalina Import lua_pushlstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnumber

' Catalina Import lua_pushnil

' Catalina Import lua_tolstring

' Catalina Import lua_tointegerx

' Catalina Import lua_tonumberx

' Catalina Import lua_type

' Catalina Import lua_isinteger

' Catalina Import lua_isstring

' Catalina Import lua_settop

' Catalina Import _registry

' Catalina Import malloc

' Catalina Import strlen

' Catalina Import strcpy

' Catalina Import memcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__load_L_ua_service_list_86_L000087 ' <symbol:86>
 byte 0

 alignl ' align long
C__load_L_ua_service_list_84_L000085 ' <symbol:84>
 byte 115
 byte 101
 byte 114
 byte 118
 byte 105
 byte 99
 byte 101
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 102
 byte 111
 byte 117
 byte 110
 byte 100
 byte 10
 byte 0

 alignl ' align long
C__load_L_ua_service_list_81_L000082 ' <symbol:81>
 byte 115
 byte 101
 byte 114
 byte 118
 byte 105
 byte 99
 byte 101
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 101
 byte 110
 byte 116
 byte 114
 byte 121
 byte 32
 byte 37
 byte 100
 byte 32
 byte 105
 byte 115
 byte 32
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 10
 byte 0

 alignl ' align long
C__load_L_ua_service_list_72_L000073 ' <symbol:72>
 byte 115
 byte 101
 byte 114
 byte 118
 byte 105
 byte 99
 byte 101
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_66_L000067 ' <symbol:66>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 101
 byte 100
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 32
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_62_L000063 ' <symbol:62>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 115
 byte 104
 byte 111
 byte 117
 byte 108
 byte 100
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 32
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_30_L000031 ' <symbol:30>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 115
 byte 104
 byte 111
 byte 117
 byte 108
 byte 100
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 32
 byte 97
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_26_L000027 ' <symbol:26>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 114
 byte 117
 byte 110
 byte 110
 byte 105
 byte 110
 byte 103
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 10
 byte 0

 alignl ' align long
C__dispatch_L_ua_bg_17_L000018 ' <symbol:17>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 114
 byte 117
 byte 110
 byte 110
 byte 105
 byte 110
 byte 103
 byte 32
 byte 98
 byte 103
 byte 32
 byte 116
 byte 97
 byte 115
 byte 107
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 10
 byte 0

' Catalina Code

DAT ' code segment
' end
