' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sb0o_67070718_str_len_L000004 ' <symbol:str_len>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sb0o_67070718_str_len_L000004_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o1_67070718_posrelatI__L000006 ' <symbol:posrelatI>
 calld PA,#PSHM
 long $400000 ' save registers
 cmps r3,  #0 wcz
 if_be jmp #\C_sb0o1_67070718_posrelatI__L000006_8 ' LEI4
 mov r0, r3 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1_67070718_posrelatI__L000006_7 ' JUMPV addrg
C_sb0o1_67070718_posrelatI__L000006_8
 cmps r3,  #0 wz
 if_nz jmp #\C_sb0o1_67070718_posrelatI__L000006_10 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o1_67070718_posrelatI__L000006_7 ' JUMPV addrg
C_sb0o1_67070718_posrelatI__L000006_10
 mov r22, r2 ' CVI, CVU or LOAD
 neg r22, r22 ' NEGI4
 cmps r3, r22 wcz
 if_ae jmp #\C_sb0o1_67070718_posrelatI__L000006_12 ' GEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o1_67070718_posrelatI__L000006_7 ' JUMPV addrg
C_sb0o1_67070718_posrelatI__L000006_12
 mov r22, r3 ' CVI, CVU or LOAD
 add r22, r2 ' ADDU (2)
 mov r0, r22
 add r0, #1 ' ADDU4 coni
C_sb0o1_67070718_posrelatI__L000006_7
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sb0o2_67070718_getendpos_L000014 ' <symbol:getendpos>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmps r15, r22 wcz
 if_be jmp #\C_sb0o2_67070718_getendpos_L000014_16 ' LEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2_67070718_getendpos_L000014_15 ' JUMPV addrg
C_sb0o2_67070718_getendpos_L000014_16
 cmps r15,  #0 wcz
 if_b jmp #\C_sb0o2_67070718_getendpos_L000014_18 ' LTI4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2_67070718_getendpos_L000014_15 ' JUMPV addrg
C_sb0o2_67070718_getendpos_L000014_18
 mov r22, r17 ' CVI, CVU or LOAD
 neg r22, r22 ' NEGI4
 cmps r15, r22 wcz
 if_ae jmp #\C_sb0o2_67070718_getendpos_L000014_20 ' GEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o2_67070718_getendpos_L000014_15 ' JUMPV addrg
C_sb0o2_67070718_getendpos_L000014_20
 mov r22, r15 ' CVI, CVU or LOAD
 add r22, r17 ' ADDU (2)
 mov r0, r22
 add r0, #1 ' ADDU4 coni
C_sb0o2_67070718_getendpos_L000014_15
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o3_67070718_str_sub_L000022 ' <symbol:str_sub>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1_67070718_posrelatI__L000006
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##-1 ' reg ARG con
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o2_67070718_getendpos_L000014
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_a jmp #\C_sb0o3_67070718_str_sub_L000022_24 ' GTU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, r21 ' SUBU (1)
 mov r2, r22
 add r2, #1 ' ADDU4 coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r21 ' ADDI/P (2)
 mov r20, ##-1 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o3_67070718_str_sub_L000022_25 ' JUMPV addrg
C_sb0o3_67070718_str_sub_L000022_24
 mov r2, ##@C_sb0o3_67070718_str_sub_L000022_26_L000027 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
C_sb0o3_67070718_str_sub_L000022_25
 mov r0, #1 ' reg <- coni
' C_sb0o3_67070718_str_sub_L000022_23 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o5_67070718_str_reverse_L000028 ' <symbol:str_reverse>
 calld PA,#NEWF
 sub SP, #276
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinitsize
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r21, #0 ' reg <- coni
 jmp #\@C_sb0o5_67070718_str_reverse_L000028_33 ' JUMPV addrg
C_sb0o5_67070718_str_reverse_L000028_30
 mov r22, r21 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, r21 ' SUBU (1)
 sub r20, #1 ' SUBU4 coni
 adds r20, r19 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0o5_67070718_str_reverse_L000028_31 ' (symbol refcount = 0)
 add r21, #1 ' ADDU4 coni
C_sb0o5_67070718_str_reverse_L000028_33
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_b jmp #\C_sb0o5_67070718_str_reverse_L000028_30 ' LTU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__pushresultsize
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sb0o5_67070718_str_reverse_L000028_29 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #276 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o6_67070718_str_lower_L000034 ' <symbol:str_lower>
 calld PA,#NEWF
 sub SP, #276
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinitsize
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r21, #0 ' reg <- coni
 jmp #\@C_sb0o6_67070718_str_lower_L000034_39 ' JUMPV addrg
C_sb0o6_67070718_str_lower_L000034_36
 mov r22, r21 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_tolower ' CALL addrg
 mov r20, r21 ' ADDI/P
 adds r20, r17 ' ADDI/P (3)
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
' C_sb0o6_67070718_str_lower_L000034_37 ' (symbol refcount = 0)
 add r21, #1 ' ADDU4 coni
C_sb0o6_67070718_str_lower_L000034_39
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_b jmp #\C_sb0o6_67070718_str_lower_L000034_36 ' LTU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__pushresultsize
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sb0o6_67070718_str_lower_L000034_35 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #276 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o7_67070718_str_upper_L000040 ' <symbol:str_upper>
 calld PA,#NEWF
 sub SP, #276
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinitsize
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r21, #0 ' reg <- coni
 jmp #\@C_sb0o7_67070718_str_upper_L000040_45 ' JUMPV addrg
C_sb0o7_67070718_str_upper_L000040_42
 mov r22, r21 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 mov r20, r21 ' ADDI/P
 adds r20, r17 ' ADDI/P (3)
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
' C_sb0o7_67070718_str_upper_L000040_43 ' (symbol refcount = 0)
 add r21, #1 ' ADDU4 coni
C_sb0o7_67070718_str_upper_L000040_45
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_b jmp #\C_sb0o7_67070718_str_upper_L000040_42 ' LTU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__pushresultsize
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sb0o7_67070718_str_upper_L000040_41 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #276 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o8_67070718_str_rep_L000046 ' <symbol:str_rep>
 calld PA,#NEWF
 sub SP, #292
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, ##@C_sb0o3_67070718_str_sub_L000022_26_L000027 ' reg ARG ADDRG
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 cmps r21,  #0 wcz
 if_a jmp #\C_sb0o8_67070718_str_rep_L000046_48 ' GTI4
 mov r2, ##@C_sb0o3_67070718_str_sub_L000022_26_L000027 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o8_67070718_str_rep_L000046_49 ' JUMPV addrg
C_sb0o8_67070718_str_rep_L000046_48
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, r22 ' ADDU (2)
 cmp r20, r22 wcz 
 if_b jmp #\C_sb0o8_67070718_str_rep_L000046_52 ' LTU4
 mov r22, ##$7fffffff ' reg <- con
 mov r18, r21 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r18 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r20, r0 wcz 
 if_be jmp #\C_sb0o8_67070718_str_rep_L000046_50 ' LEU4
C_sb0o8_67070718_str_rep_L000046_52
 mov r2, ##@C_sb0o8_67070718_str_rep_L000046_53_L000054 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o8_67070718_str_rep_L000046_47 ' JUMPV addrg
C_sb0o8_67070718_str_rep_L000046_50
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-296)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, FP
 sub r22, #-(-296) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, r0 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-292) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinitsize
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o8_67070718_str_rep_L000046_56 ' JUMPV addrg
C_sb0o8_67070718_str_rep_L000046_55
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r17, r22 ' ADDI/P (2)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o8_67070718_str_rep_L000046_58 ' EQU4
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 adds r17, r22 ' ADDI/P (2)
C_sb0o8_67070718_str_rep_L000046_58
C_sb0o8_67070718_str_rep_L000046_56
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, #1 ' reg <- coni
 mov r21, r22
 subs r21, #1 ' SUBI4 coni
 cmps r22, r20 wcz
 if_a jmp #\C_sb0o8_67070718_str_rep_L000046_55 ' GTI4
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-292) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__pushresultsize
 add SP, #4 ' CALL addrg
C_sb0o8_67070718_str_rep_L000046_49
 mov r0, #1 ' reg <- coni
C_sb0o8_67070718_str_rep_L000046_47
 calld PA,#POPM ' restore registers
 add SP, #292 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0oa_67070718_str_byte_L000060 ' <symbol:str_byte>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r11 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1_67070718_posrelatI__L000006
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o2_67070718_getendpos_L000014
 add SP, #12 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmp r19, r13 wcz 
 if_be jmp #\C_sb0oa_67070718_str_byte_L000060_62 ' LEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0oa_67070718_str_byte_L000060_61 ' JUMPV addrg
C_sb0oa_67070718_str_byte_L000060_62
 mov r22, r13 ' SUBU
 sub r22, r19 ' SUBU (3)
 mov r20, ##$7fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0oa_67070718_str_byte_L000060_64 ' LTU4
 mov r2, ##@C_sb0oa_67070718_str_byte_L000060_66_L000067 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0oa_67070718_str_byte_L000060_61 ' JUMPV addrg
C_sb0oa_67070718_str_byte_L000060_64
 mov r22, r13 ' SUBU
 sub r22, r19 ' SUBU (3)
 mov r17, r22
 adds r17, #1 ' ADDI4 coni
 mov r2, ##@C_sb0oa_67070718_str_byte_L000060_66_L000067 ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 mov r21, #0 ' reg <- coni
 jmp #\@C_sb0oa_67070718_str_byte_L000060_71 ' JUMPV addrg
C_sb0oa_67070718_str_byte_L000060_68
 mov r22, r21 ' CVI, CVU or LOAD
 add r22, r19 ' ADDU (2)
 sub r22, #1 ' SUBU4 coni
 adds r22, r15 ' ADDI/P (1)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
' C_sb0oa_67070718_str_byte_L000060_69 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sb0oa_67070718_str_byte_L000060_71
 cmps r21, r17 wcz
 if_b jmp #\C_sb0oa_67070718_str_byte_L000060_68 ' LTI4
 mov r0, r17 ' CVI, CVU or LOAD
C_sb0oa_67070718_str_byte_L000060_61
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0oc_67070718_str_char_L000072 ' <symbol:str_char>
 calld PA,#NEWF
 sub SP, #272
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinitsize
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r21, #1 ' reg <- coni
 jmp #\@C_sb0oc_67070718_str_char_L000072_77 ' JUMPV addrg
C_sb0oc_67070718_str_char_L000072_74
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #255 wcz 
 if_be jmp #\C_sb0oc_67070718_str_char_L000072_80 ' LEU4
 mov r2, ##@C_sb0oc_67070718_str_char_L000072_78_L000079 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0oc_67070718_str_char_L000072_80
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 adds r22, r17 ' ADDI/P (1)
 mov r20, r15 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0oc_67070718_str_char_L000072_75 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_sb0oc_67070718_str_char_L000072_77
 cmps r21, r19 wcz
 if_be jmp #\C_sb0oc_67070718_str_char_L000072_74 ' LEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__pushresultsize
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sb0oc_67070718_str_char_L000072_73 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #272 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0oe_67070718_writer_L000081 ' <symbol:writer>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r17 ' CVI, CVU or LOAD
 rdlong r22, r15 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0oe_67070718_writer_L000081_83 ' NEI4
 mov r22, #1 ' reg <- coni
 wrlong r22, r15 ' ASGNI4 reg reg
 mov r2, r15
 adds r2, #4 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
C_sb0oe_67070718_writer_L000081_83
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r15
 adds r4, #4 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_sb0oe_67070718_writer_L000081_82 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0of_67070718_str_dump_L000085 ' <symbol:str_dump>
 calld PA,#NEWF
 sub SP, #280
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-284)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-280)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-284)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-280) ' reg ARG ADDRLi
 mov r4, ##@C_sb0oe_67070718_writer_L000081 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_dump
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sb0of_67070718_str_dump_L000085_87 ' EQI4
 mov r2, ##@C_sb0of_67070718_str_dump_L000085_89_L000090 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0of_67070718_str_dump_L000085_86 ' JUMPV addrg
C_sb0of_67070718_str_dump_L000085_87
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sb0of_67070718_str_dump_L000085_86
 calld PA,#POPM ' restore registers
 add SP, #280 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0oh_67070718_tonum_L000092 ' <symbol:tonum>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #3 wz
 if_nz jmp #\C_sb0oh_67070718_tonum_L000092_94 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0oh_67070718_tonum_L000092_93 ' JUMPV addrg
C_sb0oh_67070718_tonum_L000092_94
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22 ' CVI, CVU or LOAD
 cmp r20,  #0 wz
 if_z jmp #\C_sb0oh_67070718_tonum_L000092_97 ' EQU4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_stringtonumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 cmp r22, r20 wz
 if_nz jmp #\C_sb0oh_67070718_tonum_L000092_97  ' NEU4
 mov r19, #1 ' reg <- coni
 jmp #\@C_sb0oh_67070718_tonum_L000092_98 ' JUMPV addrg
C_sb0oh_67070718_tonum_L000092_97
 mov r19, #0 ' reg <- coni
C_sb0oh_67070718_tonum_L000092_98
 mov r0, r19 ' CVI, CVU or LOAD
C_sb0oh_67070718_tonum_L000092_93
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0oi_67070718_trymt_L000099 ' <symbol:trymt>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #4 wz
 if_z jmp #\C_sb0oi_67070718_trymt_L000099_103 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0oi_67070718_trymt_L000099_101 ' NEI4
C_sb0oi_67070718_trymt_L000099_103
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #2 ' ADDP4 coni
 mov r5, ##@C_sb0oi_67070718_trymt_L000099_104_L000105 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaL__error
 add SP, #16 ' CALL addrg
C_sb0oi_67070718_trymt_L000099_101
 mov r2, #1 ' reg ARG coni
 mov r3, ##-3 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, #1 ' reg ARG coni
 mov r5, #2 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
' C_sb0oi_67070718_trymt_L000099_100 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0ok_67070718_arith_L000106 ' <symbol:arith>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0oh_67070718_tonum_L000092
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sb0ok_67070718_arith_L000106_108 ' EQI4
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0oh_67070718_tonum_L000092
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sb0ok_67070718_arith_L000106_108 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_arith
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0ok_67070718_arith_L000106_109 ' JUMPV addrg
C_sb0ok_67070718_arith_L000106_108
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0oi_67070718_trymt_L000099
 add SP, #4 ' CALL addrg
C_sb0ok_67070718_arith_L000106_109
 mov r0, #1 ' reg <- coni
' C_sb0ok_67070718_arith_L000106_107 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0ol_67070718_arith_add_L000110 ' <symbol:arith_add>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0ol_67070718_arith_add_L000110_112_L000113 ' reg ARG ADDRG
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0ok_67070718_arith_L000106
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0ol_67070718_arith_add_L000110_111 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0on_67070718_arith_sub_L000114 ' <symbol:arith_sub>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0on_67070718_arith_sub_L000114_116_L000117 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0ok_67070718_arith_L000106
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0on_67070718_arith_sub_L000114_115 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0op_67070718_arith_mul_L000118 ' <symbol:arith_mul>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0op_67070718_arith_mul_L000118_120_L000121 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0ok_67070718_arith_L000106
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0op_67070718_arith_mul_L000118_119 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0or_67070718_arith_mod_L000122 ' <symbol:arith_mod>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0or_67070718_arith_mod_L000122_124_L000125 ' reg ARG ADDRG
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0ok_67070718_arith_L000106
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0or_67070718_arith_mod_L000122_123 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0ot_67070718_arith_pow_L000126 ' <symbol:arith_pow>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0ot_67070718_arith_pow_L000126_128_L000129 ' reg ARG ADDRG
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0ok_67070718_arith_L000106
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0ot_67070718_arith_pow_L000126_127 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0ov_67070718_arith_div_L000130 ' <symbol:arith_div>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0ov_67070718_arith_div_L000130_132_L000133 ' reg ARG ADDRG
 mov r3, #5 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0ok_67070718_arith_L000106
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0ov_67070718_arith_div_L000130_131 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o11_67070718_arith_idiv_L000134 ' <symbol:arith_idiv>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0o11_67070718_arith_idiv_L000134_136_L000137 ' reg ARG ADDRG
 mov r3, #6 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0ok_67070718_arith_L000106
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0o11_67070718_arith_idiv_L000134_135 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o13_67070718_arith_unm_L000138 ' <symbol:arith_unm>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0o13_67070718_arith_unm_L000138_140_L000141 ' reg ARG ADDRG
 mov r3, #12 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0ok_67070718_arith_L000106
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0o13_67070718_arith_unm_L000138_139 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o15_67070718_stringmetamethods_L000142 ' <symbol:stringmetamethods>
 long @C_sb0ol_67070718_arith_add_L000110_112_L000113
 long @C_sb0ol_67070718_arith_add_L000110
 long @C_sb0on_67070718_arith_sub_L000114_116_L000117
 long @C_sb0on_67070718_arith_sub_L000114
 long @C_sb0op_67070718_arith_mul_L000118_120_L000121
 long @C_sb0op_67070718_arith_mul_L000118
 long @C_sb0or_67070718_arith_mod_L000122_124_L000125
 long @C_sb0or_67070718_arith_mod_L000122
 long @C_sb0ot_67070718_arith_pow_L000126_128_L000129
 long @C_sb0ot_67070718_arith_pow_L000126
 long @C_sb0ov_67070718_arith_div_L000130_132_L000133
 long @C_sb0ov_67070718_arith_div_L000130
 long @C_sb0o11_67070718_arith_idiv_L000134_136_L000137
 long @C_sb0o11_67070718_arith_idiv_L000134
 long @C_sb0o13_67070718_arith_unm_L000138_140_L000141
 long @C_sb0o13_67070718_arith_unm_L000138
 long @C_sb0o16_67070718_143_L000144
 long $0
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sb0o18_67070718_check_capture_L000147 ' <symbol:check_capture>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 subs r21, #49 ' SUBI4 coni
 cmps r21,  #0 wcz
 if_b jmp #\C_sb0o18_67070718_check_capture_L000147_152 ' LTI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r21, r22 wcz
 if_ae jmp #\C_sb0o18_67070718_check_capture_L000147_152 ' GEI4
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sb0o18_67070718_check_capture_L000147_149 ' NEI4
C_sb0o18_67070718_check_capture_L000147_152
 mov r2, r21
 adds r2, #1 ' ADDI4 coni
 mov r3, ##@C_sb0o18_67070718_check_capture_L000147_153_L000154 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o18_67070718_check_capture_L000147_148 ' JUMPV addrg
C_sb0o18_67070718_check_capture_L000147_149
 mov r0, r21 ' CVI, CVU or LOAD
C_sb0o18_67070718_check_capture_L000147_148
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o1a_67070718_capture_to_close_L000155 ' <symbol:capture_to_close>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdbyte r21, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r21, #1 ' SUBI4 coni
 jmp #\@C_sb0o1a_67070718_capture_to_close_L000155_160 ' JUMPV addrg
C_sb0o1a_67070718_capture_to_close_L000155_157
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sb0o1a_67070718_capture_to_close_L000155_161 ' NEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1a_67070718_capture_to_close_L000155_156 ' JUMPV addrg
C_sb0o1a_67070718_capture_to_close_L000155_161
' C_sb0o1a_67070718_capture_to_close_L000155_158 ' (symbol refcount = 0)
 subs r21, #1 ' SUBI4 coni
C_sb0o1a_67070718_capture_to_close_L000155_160
 cmps r21,  #0 wcz
 if_ae jmp #\C_sb0o1a_67070718_capture_to_close_L000155_157 ' GEI4
 mov r2, ##@C_sb0o1a_67070718_capture_to_close_L000155_163_L000164 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sb0o1a_67070718_capture_to_close_L000155_156
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o1c_67070718_classend_L000165 ' <symbol:classend>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #37 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_sb0o1c_67070718_classend_L000165_170 ' EQI4
 cmps r19, r22 wcz
 if_b jmp #\C_sb0o1c_67070718_classend_L000165_167 ' LTI4
' C_sb0o1c_67070718_classend_L000165_187 ' (symbol refcount = 0)
 cmps r19,  #91 wz
 if_z jmp #\C_sb0o1c_67070718_classend_L000165_175 ' EQI4
 jmp #\@C_sb0o1c_67070718_classend_L000165_167 ' JUMPV addrg
C_sb0o1c_67070718_classend_L000165_170
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sb0o1c_67070718_classend_L000165_171  ' NEU4
 mov r2, ##@C_sb0o1c_67070718_classend_L000165_173_L000174 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sb0o1c_67070718_classend_L000165_171
 mov r0, r21
 adds r0, #1 ' ADDP4 coni
 jmp #\@C_sb0o1c_67070718_classend_L000165_166 ' JUMPV addrg
C_sb0o1c_67070718_classend_L000165_175
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #94 wz
 if_nz jmp #\C_sb0o1c_67070718_classend_L000165_176 ' NEI4
 adds r21, #1 ' ADDP4 coni
C_sb0o1c_67070718_classend_L000165_176
C_sb0o1c_67070718_classend_L000165_178
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sb0o1c_67070718_classend_L000165_181  ' NEU4
 mov r2, ##@C_sb0o1c_67070718_classend_L000165_183_L000184 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sb0o1c_67070718_classend_L000165_181
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #37 wz
 if_nz jmp #\C_sb0o1c_67070718_classend_L000165_185 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sb0o1c_67070718_classend_L000165_185 ' GEU4
 adds r21, #1 ' ADDP4 coni
C_sb0o1c_67070718_classend_L000165_185
' C_sb0o1c_67070718_classend_L000165_179 ' (symbol refcount = 0)
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #93 wz
 if_nz jmp #\C_sb0o1c_67070718_classend_L000165_178 ' NEI4
 mov r0, r21
 adds r0, #1 ' ADDP4 coni
 jmp #\@C_sb0o1c_67070718_classend_L000165_166 ' JUMPV addrg
C_sb0o1c_67070718_classend_L000165_167
 mov r0, r21 ' CVI, CVU or LOAD
C_sb0o1c_67070718_classend_L000165_166
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o1f_67070718_match_class_L000188 ' <symbol:match_class>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_tolower ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, #108 ' reg <- coni
 cmps r17, r22 wz
 if_z jmp #\C_sb0o1f_67070718_match_class_L000188_203 ' EQI4
 cmps r17, r22 wcz
 if_a jmp #\C_sb0o1f_67070718_match_class_L000188_227 ' GTI4
' C_sb0o1f_67070718_match_class_L000188_226 ' (symbol refcount = 0)
 cmps r17,  #97 wcz
 if_b jmp #\C_sb0o1f_67070718_match_class_L000188_190 ' LTI4
 cmps r17,  #103 wcz
 if_a jmp #\C_sb0o1f_67070718_match_class_L000188_190 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o1f_67070718_match_class_L000188_228_L000230-388 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o1f_67070718_match_class_L000188_228_L000230 ' <symbol:228>
 long @C_sb0o1f_67070718_match_class_L000188_193
 long @C_sb0o1f_67070718_match_class_L000188_190
 long @C_sb0o1f_67070718_match_class_L000188_195
 long @C_sb0o1f_67070718_match_class_L000188_197
 long @C_sb0o1f_67070718_match_class_L000188_190
 long @C_sb0o1f_67070718_match_class_L000188_190
 long @C_sb0o1f_67070718_match_class_L000188_201

' Catalina Code

DAT ' code segment
C_sb0o1f_67070718_match_class_L000188_227
 cmps r17,  #112 wcz
 if_b jmp #\C_sb0o1f_67070718_match_class_L000188_190 ' LTI4
 cmps r17,  #122 wcz
 if_a jmp #\C_sb0o1f_67070718_match_class_L000188_190 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o1f_67070718_match_class_L000188_232_L000234-448 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o1f_67070718_match_class_L000188_232_L000234 ' <symbol:232>
 long @C_sb0o1f_67070718_match_class_L000188_207
 long @C_sb0o1f_67070718_match_class_L000188_190
 long @C_sb0o1f_67070718_match_class_L000188_190
 long @C_sb0o1f_67070718_match_class_L000188_209
 long @C_sb0o1f_67070718_match_class_L000188_190
 long @C_sb0o1f_67070718_match_class_L000188_211
 long @C_sb0o1f_67070718_match_class_L000188_190
 long @C_sb0o1f_67070718_match_class_L000188_215
 long @C_sb0o1f_67070718_match_class_L000188_217
 long @C_sb0o1f_67070718_match_class_L000188_190
 long @C_sb0o1f_67070718_match_class_L000188_219

' Catalina Code

DAT ' code segment
C_sb0o1f_67070718_match_class_L000188_193
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #3 ' BANDI4 coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_195
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #32 ' BANDI4 coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_197
 mov r22, r23
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_ae jmp #\C_sb0o1f_67070718_match_class_L000188_199 ' GEU4
 mov r15, #1 ' reg <- coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_200 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_199
 mov r15, #0 ' reg <- coni
C_sb0o1f_67070718_match_class_L000188_200
 mov r19, r15 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_201
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #23 ' BANDI4 coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_203
 mov r22, r23
 subs r22, #97 ' SUBI4 coni
 cmp r22,  #26 wcz 
 if_ae jmp #\C_sb0o1f_67070718_match_class_L000188_205 ' GEU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_206 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_205
 mov r13, #0 ' reg <- coni
C_sb0o1f_67070718_match_class_L000188_206
 mov r19, r13 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_207
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #16 ' BANDI4 coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_209
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #8 ' BANDI4 coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_211
 mov r22, r23
 subs r22, #65 ' SUBI4 coni
 cmp r22,  #26 wcz 
 if_ae jmp #\C_sb0o1f_67070718_match_class_L000188_213 ' GEU4
 mov r11, #1 ' reg <- coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_214 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_213
 mov r11, #0 ' reg <- coni
C_sb0o1f_67070718_match_class_L000188_214
 mov r19, r11 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_215
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #7 ' BANDI4 coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_217
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r23 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #68 ' BANDI4 coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_219
 cmps r23,  #0 wz
 if_nz jmp #\C_sb0o1f_67070718_match_class_L000188_221 ' NEI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_222 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_221
 mov r9, #0 ' reg <- coni
C_sb0o1f_67070718_match_class_L000188_222
 mov r19, r9 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1f_67070718_match_class_L000188_191 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_190
 cmps r21, r23 wz
 if_nz jmp #\C_sb0o1f_67070718_match_class_L000188_224 ' NEI4
 mov r7, #1 ' reg <- coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_225 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_224
 mov r7, #0 ' reg <- coni
C_sb0o1f_67070718_match_class_L000188_225
 mov r0, r7 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1f_67070718_match_class_L000188_189 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_191
 mov r22, r21
 subs r22, #97 ' SUBI4 coni
 cmp r22,  #26 wcz 
 if_ae jmp #\C_sb0o1f_67070718_match_class_L000188_238 ' GEU4
 mov r15, r19 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1f_67070718_match_class_L000188_239 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_238
 cmps r19,  #0 wz
 if_nz jmp #\C_sb0o1f_67070718_match_class_L000188_240 ' NEI4
 mov r13, #1 ' reg <- coni
 jmp #\@C_sb0o1f_67070718_match_class_L000188_241 ' JUMPV addrg
C_sb0o1f_67070718_match_class_L000188_240
 mov r13, #0 ' reg <- coni
C_sb0o1f_67070718_match_class_L000188_241
 mov r15, r13 ' CVI, CVU or LOAD
C_sb0o1f_67070718_match_class_L000188_239
 mov r0, r15 ' CVI, CVU or LOAD
C_sb0o1f_67070718_match_class_L000188_189
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o1k_67070718_matchbracketclass_L000242 ' <symbol:matchbracketclass>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #1 ' reg <- coni
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #94 wz
 if_nz jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_247 ' NEI4
 mov r17, #0 ' reg <- coni
 adds r21, #1 ' ADDP4 coni
 jmp #\@C_sb0o1k_67070718_matchbracketclass_L000242_247 ' JUMPV addrg
C_sb0o1k_67070718_matchbracketclass_L000242_246
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #37 wz
 if_nz jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_249 ' NEI4
 adds r21, #1 ' ADDP4 coni
 rdbyte r2, r21 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1f_67070718_match_class_L000188
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_250 ' EQI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1k_67070718_matchbracketclass_L000242_243 ' JUMPV addrg
C_sb0o1k_67070718_matchbracketclass_L000242_249
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_253 ' NEI4
 mov r22, r21
 adds r22, #2 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_ae jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_253 ' GEU4
 adds r21, #2 ' ADDP4 coni
 mov r22, ##-2 ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r23 wcz
 if_a jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_254 ' GTI4
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r23, r22 wcz
 if_a jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_254 ' GTI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1k_67070718_matchbracketclass_L000242_243 ' JUMPV addrg
C_sb0o1k_67070718_matchbracketclass_L000242_253
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r23 wz
 if_nz jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_257 ' NEI4
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1k_67070718_matchbracketclass_L000242_243 ' JUMPV addrg
C_sb0o1k_67070718_matchbracketclass_L000242_257
C_sb0o1k_67070718_matchbracketclass_L000242_254
C_sb0o1k_67070718_matchbracketclass_L000242_250
C_sb0o1k_67070718_matchbracketclass_L000242_247
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_246 ' LTU4
 cmps r17,  #0 wz
 if_nz jmp #\C_sb0o1k_67070718_matchbracketclass_L000242_260 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_sb0o1k_67070718_matchbracketclass_L000242_261 ' JUMPV addrg
C_sb0o1k_67070718_matchbracketclass_L000242_260
 mov r15, #0 ' reg <- coni
C_sb0o1k_67070718_matchbracketclass_L000242_261
 mov r0, r15 ' CVI, CVU or LOAD
C_sb0o1k_67070718_matchbracketclass_L000242_243
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o1l_67070718_singlematch_L000262 ' <symbol:singlematch>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o1l_67070718_singlematch_L000262_264 ' LTU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o1l_67070718_singlematch_L000262_263 ' JUMPV addrg
C_sb0o1l_67070718_singlematch_L000262_264
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdbyte r15, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #46 ' reg <- coni
 cmps r15, r22 wz
 if_z jmp #\C_sb0o1l_67070718_singlematch_L000262_269 ' EQI4
 cmps r15, r22 wcz
 if_a jmp #\C_sb0o1l_67070718_singlematch_L000262_276 ' GTI4
' C_sb0o1l_67070718_singlematch_L000262_275 ' (symbol refcount = 0)
 cmps r15,  #37 wz
 if_z jmp #\C_sb0o1l_67070718_singlematch_L000262_270 ' EQI4
 jmp #\@C_sb0o1l_67070718_singlematch_L000262_266 ' JUMPV addrg
C_sb0o1l_67070718_singlematch_L000262_276
 cmps r15,  #91 wz
 if_z jmp #\C_sb0o1l_67070718_singlematch_L000262_271 ' EQI4
 jmp #\@C_sb0o1l_67070718_singlematch_L000262_266 ' JUMPV addrg
C_sb0o1l_67070718_singlematch_L000262_269
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o1l_67070718_singlematch_L000262_263 ' JUMPV addrg
C_sb0o1l_67070718_singlematch_L000262_270
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1f_67070718_match_class_L000188
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1l_67070718_singlematch_L000262_263 ' JUMPV addrg
C_sb0o1l_67070718_singlematch_L000262_271
 mov r22, ##-1 ' reg <- con
 mov r2, r17 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1k_67070718_matchbracketclass_L000242
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1l_67070718_singlematch_L000262_263 ' JUMPV addrg
C_sb0o1l_67070718_singlematch_L000262_266
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_sb0o1l_67070718_singlematch_L000262_273 ' NEI4
 mov r13, #1 ' reg <- coni
 jmp #\@C_sb0o1l_67070718_singlematch_L000262_274 ' JUMPV addrg
C_sb0o1l_67070718_singlematch_L000262_273
 mov r13, #0 ' reg <- coni
C_sb0o1l_67070718_singlematch_L000262_274
 mov r0, r13 ' CVI, CVU or LOAD
C_sb0o1l_67070718_singlematch_L000262_263
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o1m_67070718_matchbalance_L000277 ' <symbol:matchbalance>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, ##-1 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o1m_67070718_matchbalance_L000277_279 ' LTU4
 mov r2, ##@C_sb0o1m_67070718_matchbalance_L000277_281_L000282 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sb0o1m_67070718_matchbalance_L000277_279
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r20, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_z jmp #\C_sb0o1m_67070718_matchbalance_L000277_283 ' EQI4
 mov r0, ##0 ' RET con
 jmp #\@C_sb0o1m_67070718_matchbalance_L000277_278 ' JUMPV addrg
C_sb0o1m_67070718_matchbalance_L000277_283
 rdbyte r13, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 rdbyte r17, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r15, #1 ' reg <- coni
 jmp #\@C_sb0o1m_67070718_matchbalance_L000277_286 ' JUMPV addrg
C_sb0o1m_67070718_matchbalance_L000277_285
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r17 wz
 if_nz jmp #\C_sb0o1m_67070718_matchbalance_L000277_288 ' NEI4
 mov r22, r15
 subs r22, #1 ' SUBI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o1m_67070718_matchbalance_L000277_289 ' NEI4
 mov r0, r21
 adds r0, #1 ' ADDP4 coni
 jmp #\@C_sb0o1m_67070718_matchbalance_L000277_278 ' JUMPV addrg
C_sb0o1m_67070718_matchbalance_L000277_288
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r13 wz
 if_nz jmp #\C_sb0o1m_67070718_matchbalance_L000277_292 ' NEI4
 adds r15, #1 ' ADDI4 coni
C_sb0o1m_67070718_matchbalance_L000277_292
C_sb0o1m_67070718_matchbalance_L000277_289
C_sb0o1m_67070718_matchbalance_L000277_286
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o1m_67070718_matchbalance_L000277_285 ' LTU4
 mov r0, ##0 ' RET con
C_sb0o1m_67070718_matchbalance_L000277_278
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o1o_67070718_max_expand_L000294 ' <symbol:max_expand>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 jmp #\@C_sb0o1o_67070718_max_expand_L000294_297 ' JUMPV addrg
C_sb0o1o_67070718_max_expand_L000294_296
 adds r15, #1 ' ADDI4 coni
C_sb0o1o_67070718_max_expand_L000294_297
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15 ' ADDI/P
 adds r4, r21 ' ADDI/P (3)
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1l_67070718_singlematch_L000262
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o1o_67070718_max_expand_L000294_296 ' NEI4
 jmp #\@C_sb0o1o_67070718_max_expand_L000294_300 ' JUMPV addrg
C_sb0o1o_67070718_max_expand_L000294_299
 mov r2, r17
 adds r2, #1 ' ADDP4 coni
 mov r3, r15 ' ADDI/P
 adds r3, r21 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o17_67070718_match_L000146
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o1o_67070718_max_expand_L000294_302 ' EQU4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1o_67070718_max_expand_L000294_295 ' JUMPV addrg
C_sb0o1o_67070718_max_expand_L000294_302
 subs r15, #1 ' SUBI4 coni
C_sb0o1o_67070718_max_expand_L000294_300
 cmps r15,  #0 wcz
 if_ae jmp #\C_sb0o1o_67070718_max_expand_L000294_299 ' GEI4
 mov r0, ##0 ' RET con
C_sb0o1o_67070718_max_expand_L000294_295
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o1p_67070718_min_expand_L000304 ' <symbol:min_expand>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
C_sb0o1p_67070718_min_expand_L000304_306
 mov r2, r17
 adds r2, #1 ' ADDP4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o17_67070718_match_L000146
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o1p_67070718_min_expand_L000304_310 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_sb0o1p_67070718_min_expand_L000304_305 ' JUMPV addrg
C_sb0o1p_67070718_min_expand_L000304_310
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1l_67070718_singlematch_L000262
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sb0o1p_67070718_min_expand_L000304_312 ' EQI4
 adds r21, #1 ' ADDP4 coni
 jmp #\@C_sb0o1p_67070718_min_expand_L000304_306 ' JUMPV addrg
C_sb0o1p_67070718_min_expand_L000304_312
 mov r0, ##0 ' RET con
C_sb0o1p_67070718_min_expand_L000304_305
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o1q_67070718_start_capture_L000314 ' <symbol:start_capture>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdbyte r15, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r15,  #32 wcz
 if_b jmp #\C_sb0o1q_67070718_start_capture_L000314_316 ' LTI4
 mov r2, ##@C_sb0o1q_67070718_start_capture_L000314_318_L000319 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sb0o1q_67070718_start_capture_L000314_316
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r15
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o17_67070718_match_L000146
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sb0o1q_67070718_start_capture_L000314_320  ' NEU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o1q_67070718_start_capture_L000314_320
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_sb0o1q_67070718_start_capture_L000314_315 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o1s_67070718_end_capture_L000322 ' <symbol:end_capture>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o1a_67070718_capture_to_close_L000155 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 mov r18, r21 ' CVI, CVU or LOAD
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, r18
 sub RI, r22
 mov r22, RI ' SUBU (2)
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o17_67070718_match_L000146
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sb0o1s_67070718_end_capture_L000322_324  ' NEU4
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, ##-1 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
C_sb0o1s_67070718_end_capture_L000322_324
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_sb0o1s_67070718_end_capture_L000322_323 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o1t_67070718_match_capture_L000326 ' <symbol:match_capture>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o18_67070718_check_capture_L000147
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 cmp r22, r17 wcz 
 if_b jmp #\C_sb0o1t_67070718_match_capture_L000326_328 ' LTU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o1t_67070718_match_capture_L000326_328 ' NEI4
 mov r0, r17 ' ADDI/P
 adds r0, r21 ' ADDI/P (3)
 jmp #\@C_sb0o1t_67070718_match_capture_L000326_327 ' JUMPV addrg
C_sb0o1t_67070718_match_capture_L000326_328
 mov r0, ##0 ' RET con
C_sb0o1t_67070718_match_capture_L000326_327
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o17_67070718_match_L000146 ' <symbol:match>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r20
 subs r18, #1 ' SUBI4 coni
 wrlong r18, r22 ' ASGNI4 reg reg
 cmps r20,  #0 wz
 if_nz jmp #\C_sb0o17_67070718_match_L000146_331 ' NEI4
 mov r2, ##@C_sb0o17_67070718_match_L000146_333_L000334 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sb0o17_67070718_match_L000146_331
C_sb0o17_67070718_match_L000146_335
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_336 ' EQU4
 rdbyte r17, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r17,  #36 wcz
 if_b jmp #\C_sb0o17_67070718_match_L000146_338 ' LTI4
 cmps r17,  #41 wcz
 if_a jmp #\C_sb0o17_67070718_match_L000146_338 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o17_67070718_match_L000146_394_L000396-144 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o17_67070718_match_L000146_394_L000396 ' <symbol:394>
 long @C_sb0o17_67070718_match_L000146_345
 long @C_sb0o17_67070718_match_L000146_352
 long @C_sb0o17_67070718_match_L000146_338
 long @C_sb0o17_67070718_match_L000146_338
 long @C_sb0o17_67070718_match_L000146_341
 long @C_sb0o17_67070718_match_L000146_344

' Catalina Code

DAT ' code segment
C_sb0o17_67070718_match_L000146_341
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #41 wz
 if_nz jmp #\C_sb0o17_67070718_match_L000146_342 ' NEI4
 mov r2, ##-2 ' reg ARG con
 mov r3, r19
 adds r3, #2 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1q_67070718_start_capture_L000314
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_342
 mov r2, ##-1 ' reg ARG con
 mov r3, r19
 adds r3, #1 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1q_67070718_start_capture_L000314
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_344
 mov r2, r19
 adds r2, #1 ' ADDP4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1s_67070718_end_capture_L000322
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_345
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_346 ' EQU4
 jmp #\@C_sb0o17_67070718_match_L000146_348 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_346
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sb0o17_67070718_match_L000146_350  ' NEU4
 mov r15, r21 ' CVI, CVU or LOAD
 jmp #\@C_sb0o17_67070718_match_L000146_351 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_350
 mov r15, ##0 ' reg <- con
C_sb0o17_67070718_match_L000146_351
 mov r21, r15 ' CVI, CVU or LOAD
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_352
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 rdbyte r15, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #98 ' reg <- coni
 cmps r15, r22 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_356 ' EQI4
 cmps r15, r22 wcz
 if_a jmp #\C_sb0o17_67070718_match_L000146_373 ' GTI4
' C_sb0o17_67070718_match_L000146_372 ' (symbol refcount = 0)
 cmps r15,  #48 wcz
 if_b jmp #\C_sb0o17_67070718_match_L000146_348 ' LTI4
 cmps r15,  #57 wcz
 if_a jmp #\C_sb0o17_67070718_match_L000146_348 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o17_67070718_match_L000146_374_L000376-192 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o17_67070718_match_L000146_374_L000376 ' <symbol:374>
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369
 long @C_sb0o17_67070718_match_L000146_369

' Catalina Code

DAT ' code segment
C_sb0o17_67070718_match_L000146_373
 cmps r15,  #102 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_359 ' EQI4
 jmp #\@C_sb0o17_67070718_match_L000146_348 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_356
 mov r2, r19
 adds r2, #2 ' ADDP4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1m_67070718_matchbalance_L000277
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_339 ' EQU4
 adds r19, #4 ' ADDP4 coni
 jmp #\@C_sb0o17_67070718_match_L000146_335 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_359
 adds r19, #2 ' ADDP4 coni
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #91 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_360 ' EQI4
 mov r2, ##@C_sb0o17_67070718_match_L000146_362_L000363 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sb0o17_67070718_match_L000146_360
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1c_67070718_classend_L000165
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 rdlong r20, r23 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_sb0o17_67070718_match_L000146_365  ' NEU4
 mov r13, #0 ' reg <- coni
 jmp #\@C_sb0o17_67070718_match_L000146_366 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_365
 mov r22, ##-1 ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdbyte r13, r22 ' reg <- CVUI4 INDIRU1 reg
C_sb0o17_67070718_match_L000146_366
 mov r22, r13 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-1 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1k_67070718_matchbracketclass_L000242
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o17_67070718_match_L000146_367 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-1 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 rdbyte r4, r21 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1k_67070718_matchbracketclass_L000242
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_367 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_sb0o17_67070718_match_L000146_335 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_367
 mov r21, ##0 ' reg <- con
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_369
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1t_67070718_match_capture_L000326
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_339 ' EQU4
 adds r19, #2 ' ADDP4 coni
 jmp #\@C_sb0o17_67070718_match_L000146_335 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_338
C_sb0o17_67070718_match_L000146_348
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1c_67070718_classend_L000165
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1l_67070718_singlematch_L000262
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o17_67070718_match_L000146_378 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #42 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_383 ' EQI4
 cmps r22,  #63 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_383 ' EQI4
 cmps r22,  #45 wz
 if_nz jmp #\C_sb0o17_67070718_match_L000146_380 ' NEI4
C_sb0o17_67070718_match_L000146_383
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 jmp #\@C_sb0o17_67070718_match_L000146_335 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_380
 mov r21, ##0 ' reg <- con
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_378
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r15, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #42 ' reg <- coni
 cmps r15, r22 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_391 ' EQI4
 cmps r15,  #43 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_390 ' EQI4
 cmps r15,  #45 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_392 ' EQI4
 cmps r15, r22 wcz
 if_b jmp #\C_sb0o17_67070718_match_L000146_384 ' LTI4
' C_sb0o17_67070718_match_L000146_393 ' (symbol refcount = 0)
 cmps r15,  #63 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_387 ' EQI4
 jmp #\@C_sb0o17_67070718_match_L000146_384 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_387
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #1 ' ADDP4 coni
 mov r3, r21
 adds r3, #1 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o17_67070718_match_L000146
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o17_67070718_match_L000146_388 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRP4 reg
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_388
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 jmp #\@C_sb0o17_67070718_match_L000146_335 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_390
 adds r21, #1 ' ADDP4 coni
C_sb0o17_67070718_match_L000146_391
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1o_67070718_max_expand_L000294
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_392
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1p_67070718_min_expand_L000304
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o17_67070718_match_L000146_339 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_384
 adds r21, #1 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_sb0o17_67070718_match_L000146_335 ' JUMPV addrg
C_sb0o17_67070718_match_L000146_339
C_sb0o17_67070718_match_L000146_336
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_sb0o17_67070718_match_L000146_330 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o24_67070718_lmemfind_L000398 ' <symbol:lmemfind>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmp r17,  #0 wz
 if_nz jmp #\C_sb0o24_67070718_lmemfind_L000398_400  ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_sb0o24_67070718_lmemfind_L000398_399 ' JUMPV addrg
C_sb0o24_67070718_lmemfind_L000398_400
 cmp r17, r21 wcz 
 if_be jmp #\C_sb0o24_67070718_lmemfind_L000398_402 ' LEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sb0o24_67070718_lmemfind_L000398_399 ' JUMPV addrg
C_sb0o24_67070718_lmemfind_L000398_402
 sub r17, #1 ' SUBU4 coni
 sub r21, r17 ' SUBU (1)
 jmp #\@C_sb0o24_67070718_lmemfind_L000398_405 ' JUMPV addrg
C_sb0o24_67070718_lmemfind_L000398_404
 adds r15, #1 ' ADDP4 coni
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19
 adds r3, #1 ' ADDP4 coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o24_67070718_lmemfind_L000398_407 ' NEI4
 mov r22, ##-1 ' reg <- con
 mov r0, r15 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #\@C_sb0o24_67070718_lmemfind_L000398_399 ' JUMPV addrg
C_sb0o24_67070718_lmemfind_L000398_407
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 sub r21, r22 ' SUBU (1)
 mov r23, r15 ' CVI, CVU or LOAD
C_sb0o24_67070718_lmemfind_L000398_405
 cmp r21,  #0 wz
 if_z jmp #\C_sb0o24_67070718_lmemfind_L000398_409 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 rdbyte r3, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memchr
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sb0o24_67070718_lmemfind_L000398_404  ' NEU4
C_sb0o24_67070718_lmemfind_L000398_409
 mov r0, ##0 ' RET con
C_sb0o24_67070718_lmemfind_L000398_399
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o25_67070718_get_onecapture_L000410 ' <symbol:get_onecapture>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r23, r22 wcz
 if_b jmp #\C_sb0o25_67070718_get_onecapture_L000410_412 ' LTI4
 cmps r23,  #0 wz
 if_z jmp #\C_sb0o25_67070718_get_onecapture_L000410_414 ' EQI4
 mov r2, r23
 adds r2, #1 ' ADDI4 coni
 mov r3, ##@C_sb0o18_67070718_check_capture_L000147_153_L000154 ' reg ARG ADDRG
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
C_sb0o25_67070718_get_onecapture_L000410_414
 wrlong r21, r17 ' ASGNP4 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_sb0o25_67070718_get_onecapture_L000410_411 ' JUMPV addrg
C_sb0o25_67070718_get_onecapture_L000410_412
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #24 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sb0o25_67070718_get_onecapture_L000410_416 ' NEI4
 mov r2, ##@C_sb0o25_67070718_get_onecapture_L000410_418_L000419 ' reg ARG ADDRG
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o25_67070718_get_onecapture_L000410_417 ' JUMPV addrg
C_sb0o25_67070718_get_onecapture_L000410_416
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-2 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sb0o25_67070718_get_onecapture_L000410_420 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 shl r20, #3 ' LSHI4 coni
 mov r18, r22
 adds r18, #24 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r18, r22 ' reg <- INDIRP4 reg
 sub r20, r18 ' SUBU (1)
 mov r2, r20
 adds r2, #1 ' ADDI4 coni
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
C_sb0o25_67070718_get_onecapture_L000410_420
C_sb0o25_67070718_get_onecapture_L000410_417
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C_sb0o25_67070718_get_onecapture_L000410_411
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o27_67070718_push_onecapture_L000422 ' <symbol:push_onecapture>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o25_67070718_get_onecapture_L000410
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-2 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_sb0o27_67070718_push_onecapture_L000422_424 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
C_sb0o27_67070718_push_onecapture_L000422_424
' C_sb0o27_67070718_push_onecapture_L000422_423 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o28_67070718_push_captures_L000426 ' <symbol:push_captures>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o28_67070718_push_captures_L000426_429 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o28_67070718_push_captures_L000426_429 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_sb0o28_67070718_push_captures_L000426_430 ' JUMPV addrg
C_sb0o28_67070718_push_captures_L000426_429
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdbyte r13, r22 ' reg <- CVUI4 INDIRU1 reg
C_sb0o28_67070718_push_captures_L000426_430
 mov r15, r13 ' CVI, CVU or LOAD
 mov r2, ##@C_sb0o1q_67070718_start_capture_L000314_318_L000319 ' reg ARG ADDRG
 mov r3, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 mov r17, #0 ' reg <- coni
 jmp #\@C_sb0o28_67070718_push_captures_L000426_434 ' JUMPV addrg
C_sb0o28_67070718_push_captures_L000426_431
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o27_67070718_push_onecapture_L000422
 add SP, #12 ' CALL addrg
' C_sb0o28_67070718_push_captures_L000426_432 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_sb0o28_67070718_push_captures_L000426_434
 cmps r17, r15 wcz
 if_b jmp #\C_sb0o28_67070718_push_captures_L000426_431 ' LTI4
 mov r0, r15 ' CVI, CVU or LOAD
' C_sb0o28_67070718_push_captures_L000426_427 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o29_67070718_nospecials_L000435 ' <symbol:nospecials>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
C_sb0o29_67070718_nospecials_L000435_437
 mov r2, ##@C_sb0o29_67070718_nospecials_L000435_442_L000443 ' reg ARG ADDRG
 mov r3, r19 ' ADDI/P
 adds r3, r23 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strpbrk
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o29_67070718_nospecials_L000435_440 ' EQU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o29_67070718_nospecials_L000435_436 ' JUMPV addrg
C_sb0o29_67070718_nospecials_L000435_440
 mov r2, r19 ' ADDI/P
 adds r2, r23 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0
 add r22, #1 ' ADDU4 coni
 add r19, r22 ' ADDU (1)
' C_sb0o29_67070718_nospecials_L000435_438 ' (symbol refcount = 0)
 cmp r19, r21 wcz 
 if_be jmp #\C_sb0o29_67070718_nospecials_L000435_437 ' LEU4
 mov r0, #1 ' reg <- coni
C_sb0o29_67070718_nospecials_L000435_436
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o2b_67070718_prepstate_L000444 ' <symbol:prepstate>
 calld PA,#NEWF
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, #200 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r5, r22 ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r4 ' ADDI/P
 adds r20, r5 ' ADDI/P (3)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, r2 ' ADDI/P
 adds r20, r3 ' ADDI/P (3)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_sb0o2b_67070718_prepstate_L000444_445 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o2c_67070718_reprepstate_L000446 ' <symbol:reprepstate>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0o2c_67070718_reprepstate_L000446_447 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sb0o2d_67070718_str_find_aux_L000448 ' <symbol:str_find_aux>
 calld PA,#NEWF
 sub SP, #288
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1_67070718_posrelatI__L000006
 add SP, #4 ' CALL addrg
 mov r15, r0
 sub r15, #1 ' SUBU4 coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r15, r22 wcz 
 if_be jmp #\C_sb0o2d_67070718_str_find_aux_L000448_450 ' LEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o2d_67070718_str_find_aux_L000448_449 ' JUMPV addrg
C_sb0o2d_67070718_str_find_aux_L000448_450
 cmps r21,  #0 wz
 if_z jmp #\C_sb0o2d_67070718_str_find_aux_L000448_452 ' EQI4
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o2d_67070718_str_find_aux_L000448_454 ' NEI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o29_67070718_nospecials_L000435
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sb0o2d_67070718_str_find_aux_L000448_452 ' EQI4
C_sb0o2d_67070718_str_find_aux_L000448_454
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r4, r22 ' SUBU
 sub r4, r15 ' SUBU (3)
 mov r5, r15 ' ADDI/P
 adds r5, r17 ' ADDI/P (3)
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o24_67070718_lmemfind_L000398
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o2d_67070718_str_find_aux_L000448_453 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_sb0o2d_67070718_str_find_aux_L000448_449 ' JUMPV addrg
C_sb0o2d_67070718_str_find_aux_L000448_452
 mov r13, r15 ' ADDI/P
 adds r13, r17 ' ADDI/P (3)
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #94 wz
 if_nz jmp #\C_sb0o2d_67070718_str_find_aux_L000448_458 ' NEI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_sb0o2d_67070718_str_find_aux_L000448_459 ' JUMPV addrg
C_sb0o2d_67070718_str_find_aux_L000448_458
 mov r9, #0 ' reg <- coni
C_sb0o2d_67070718_str_find_aux_L000448_459
 mov r11, r9 ' CVI, CVU or LOAD
 cmps r11,  #0 wz
 if_z jmp #\C_sb0o2d_67070718_str_find_aux_L000448_460 ' EQI4
 adds r19, #1 ' ADDP4 coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sb0o2d_67070718_str_find_aux_L000448_460
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r17 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov RI, FP
 sub RI, #-(-292)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o2b_67070718_prepstate_L000444
 add SP, #20 ' CALL addrg
C_sb0o2d_67070718_str_find_aux_L000448_462
 mov r2, FP
 sub r2, #-(-292) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o2c_67070718_reprepstate_L000446 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-292) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o17_67070718_match_L000146
 add SP, #8 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o2d_67070718_str_find_aux_L000448_465 ' EQU4
 cmps r21,  #0 wz
 if_z jmp #\C_sb0o2d_67070718_str_find_aux_L000448_467 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r22, r7 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r22, ##0 ' reg <- con
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-292) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o28_67070718_push_captures_L000426
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 adds r0, #2 ' ADDI4 coni
 jmp #\@C_sb0o2d_67070718_str_find_aux_L000448_449 ' JUMPV addrg
C_sb0o2d_67070718_str_find_aux_L000448_467
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-292) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o28_67070718_push_captures_L000426
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2d_67070718_str_find_aux_L000448_449 ' JUMPV addrg
C_sb0o2d_67070718_str_find_aux_L000448_465
' C_sb0o2d_67070718_str_find_aux_L000448_463 ' (symbol refcount = 0)
 mov r22, r13 ' CVI, CVU or LOAD
 mov r13, r22
 adds r13, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-288) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sb0o2d_67070718_str_find_aux_L000448_470 ' GEU4
 cmps r11,  #0 wz
 if_z jmp #\C_sb0o2d_67070718_str_find_aux_L000448_462 ' EQI4
C_sb0o2d_67070718_str_find_aux_L000448_470
C_sb0o2d_67070718_str_find_aux_L000448_453
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sb0o2d_67070718_str_find_aux_L000448_449
 calld PA,#POPM ' restore registers
 add SP, #288 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o2e_67070718_str_find_L000471 ' <symbol:str_find>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o2d_67070718_str_find_aux_L000448
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0o2e_67070718_str_find_L000471_472 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o2f_67070718_str_match_L000473 ' <symbol:str_match>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o2d_67070718_str_find_aux_L000448
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sb0o2f_67070718_str_match_L000473_474 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o2g_67070718_gmatch_aux_L000475 ' <symbol:gmatch_aux>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##-1001003 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_touserdata
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
 rdlong r19, r21 ' reg <- INDIRP4 reg
 jmp #\@C_sb0o2g_67070718_gmatch_aux_L000475_480 ' JUMPV addrg
C_sb0o2g_67070718_gmatch_aux_L000475_477
 mov r2, r21
 adds r2, #12 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o2c_67070718_reprepstate_L000446 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #12 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o17_67070718_match_L000146
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o2g_67070718_gmatch_aux_L000475_481 ' EQU4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_z jmp #\C_sb0o2g_67070718_gmatch_aux_L000475_481 ' EQU4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 wrlong r17, r21 ' ASGNP4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #12 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o28_67070718_push_captures_L000426
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2g_67070718_gmatch_aux_L000475_476 ' JUMPV addrg
C_sb0o2g_67070718_gmatch_aux_L000475_481
' C_sb0o2g_67070718_gmatch_aux_L000475_478 ' (symbol refcount = 0)
 adds r19, #1 ' ADDP4 coni
C_sb0o2g_67070718_gmatch_aux_L000475_480
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_sb0o2g_67070718_gmatch_aux_L000475_477 ' LEU4
 mov r0, #0 ' reg <- coni
C_sb0o2g_67070718_gmatch_aux_L000475_476
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o2h_67070718_gmatch_L000483 ' <symbol:gmatch>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1_67070718_posrelatI__L000006
 add SP, #4 ' CALL addrg
 mov r19, r0
 sub r19, #1 ' SUBU4 coni
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, #292 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_newuserdatauv
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wcz 
 if_be jmp #\C_sb0o2h_67070718_gmatch_L000483_485 ' LEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r19, r22
 add r19, #1 ' ADDU4 coni
C_sb0o2h_67070718_gmatch_L000483_485
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r15 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r17 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o2b_67070718_prepstate_L000444
 add SP, #20 ' CALL addrg
 mov r22, r19 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #3 ' reg ARG coni
 mov r3, ##@C_sb0o2g_67070718_gmatch_aux_L000475 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sb0o2h_67070718_gmatch_L000483_484 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o2i_67070718_add_s_L000487 ' <symbol:add_s>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $ffa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRP4 reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #3 ' reg ARG coni
 mov r4, r11 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2i_67070718_add_s_L000487_490 ' JUMPV addrg
C_sb0o2i_67070718_add_s_L000487_489
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 adds r15, #1 ' ADDP4 coni
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #37 wz
 if_nz jmp #\C_sb0o2i_67070718_add_s_L000487_492 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o2i_67070718_add_s_L000487_494 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o2i_67070718_add_s_L000487_494
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 add r18, #1 ' ADDU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 rdbyte r20, r15 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sb0o2i_67070718_add_s_L000487_493 ' JUMPV addrg
C_sb0o2i_67070718_add_s_L000487_492
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wz
 if_nz jmp #\C_sb0o2i_67070718_add_s_L000487_495 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o2i_67070718_add_s_L000487_496 ' JUMPV addrg
C_sb0o2i_67070718_add_s_L000487_495
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_ae jmp #\C_sb0o2i_67070718_add_s_L000487_497 ' GEU4
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 mov r5, r22
 subs r5, #49 ' SUBI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o25_67070718_get_onecapture_L000410
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-2 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sb0o2i_67070718_add_s_L000487_499 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
 jmp #\@C_sb0o2i_67070718_add_s_L000487_498 ' JUMPV addrg
C_sb0o2i_67070718_add_s_L000487_499
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o2i_67070718_add_s_L000487_498 ' JUMPV addrg
C_sb0o2i_67070718_add_s_L000487_497
 mov r2, #37 ' reg ARG coni
 mov r3, ##@C_sb0o2i_67070718_add_s_L000487_501_L000502 ' reg ARG ADDRG
 mov r4, r11 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
C_sb0o2i_67070718_add_s_L000487_498
C_sb0o2i_67070718_add_s_L000487_496
C_sb0o2i_67070718_add_s_L000487_493
 mov r22, r15
 adds r22, #1 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 mov r16, r13 ' CVI, CVU or LOAD
 sub r18, r16 ' SUBU (1)
 sub r20, r18 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r13, r22 ' CVI, CVU or LOAD
C_sb0o2i_67070718_add_s_L000487_490
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #37 ' reg ARG coni
 mov r4, r13 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memchr
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sb0o2i_67070718_add_s_L000487_489  ' NEU4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
' C_sb0o2i_67070718_add_s_L000487_488 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o2k_67070718_add_value_L000503 ' <symbol:add_value>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 cmps r17,  #5 wz
 if_z jmp #\C_sb0o2k_67070718_add_value_L000503_508 ' EQI4
 cmps r17,  #6 wz
 if_z jmp #\C_sb0o2k_67070718_add_value_L000503_507 ' EQI4
 jmp #\@C_sb0o2k_67070718_add_value_L000503_505 ' JUMPV addrg
C_sb0o2k_67070718_add_value_L000503_507
 mov r2, #3 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o28_67070718_push_captures_L000426
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r4, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #\@C_sb0o2k_67070718_add_value_L000503_506 ' JUMPV addrg
C_sb0o2k_67070718_add_value_L000503_508
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #0 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o27_67070718_push_onecapture_L000422
 add SP, #12 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gettable
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o2k_67070718_add_value_L000503_506 ' JUMPV addrg
C_sb0o2k_67070718_add_value_L000503_505
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o2i_67070718_add_s_L000487
 add SP, #12 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o2k_67070718_add_value_L000503_504 ' JUMPV addrg
C_sb0o2k_67070718_add_value_L000503_506
 mov r2, ##-1 ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o2k_67070718_add_value_L000503_509 ' NEI4
 mov r2, ##-2 ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o2k_67070718_add_value_L000503_504 ' JUMPV addrg
C_sb0o2k_67070718_add_value_L000503_509
 mov r2, ##-1 ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o2k_67070718_add_value_L000503_511 ' NEI4
 mov r2, ##-1 ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_sb0o2k_67070718_add_value_L000503_513_L000514 ' reg ARG ADDRG
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2k_67070718_add_value_L000503_504 ' JUMPV addrg
C_sb0o2k_67070718_add_value_L000503_511
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sb0o2k_67070718_add_value_L000503_504
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o2m_67070718_str_gsub_L000515 ' <symbol:str_gsub>
 calld PA,#NEWF
 sub SP, ##568
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 adds r2, ##(-560)
' reg ARG ADDRL
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, FP
 adds r2, ##(-564)
' reg ARG ADDRL
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r17, ##0 ' reg <- con
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 mov r22, ##-560
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #94 wz
 if_nz jmp #\C_sb0o2m_67070718_str_gsub_L000515_518 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, ##-568
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #\@C_sb0o2m_67070718_str_gsub_L000515_519 ' JUMPV addrg
C_sb0o2m_67070718_str_gsub_L000515_518
 mov r22, #0 ' reg <- coni
 mov RI, ##-568
 adds RI, FP
 wrlong r22, RI ' ASGNI4 addrl reg
C_sb0o2m_67070718_str_gsub_L000515_519
 mov r22, ##-568
 adds r22, FP
 ' reg <- addrl
 rdlong r13, r22 ' reg <- INDIRI4 reg
 mov r19, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r22, #3 ' reg <- coni
 cmps r7, r22 wz
 if_z jmp #\C_sb0o2m_67070718_str_gsub_L000515_522 ' EQI4
 cmps r7,  #4 wz
 if_z jmp #\C_sb0o2m_67070718_str_gsub_L000515_522 ' EQI4
 cmps r7,  #6 wz
 if_z jmp #\C_sb0o2m_67070718_str_gsub_L000515_522 ' EQI4
 cmps r7,  #5 wz
 if_z jmp #\C_sb0o2m_67070718_str_gsub_L000515_522 ' EQI4
 mov r2, ##@C_sb0o2m_67070718_str_gsub_L000515_520_L000521 ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_sb0o2m_67070718_str_gsub_L000515_522
 mov r2, FP
 adds r2, ##(-556)
' reg ARG ADDRL
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 cmps r13,  #0 wz
 if_z jmp #\C_sb0o2m_67070718_str_gsub_L000515_523 ' EQI4
 adds r15, #1 ' ADDP4 coni
 mov r22, ##-564
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #1 ' SUBU4 coni
 mov RI, ##-564
 adds RI, FP
 wrlong r22, RI ' ASGNU4 addrl reg
C_sb0o2m_67070718_str_gsub_L000515_523
 mov RI, FP
 adds RI, ##(-564)
 rdlong r2, RI ' reg ARG INDIR ADDRL
 mov r3, r15 ' CVI, CVU or LOAD
 mov RI, FP
 adds RI, ##(-560)
 rdlong r4, RI ' reg ARG INDIR ADDRL
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov RI, FP
 sub RI, #-(-284)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o2b_67070718_prepstate_L000444
 add SP, #20 ' CALL addrg
 jmp #\@C_sb0o2m_67070718_str_gsub_L000515_526 ' JUMPV addrg
C_sb0o2m_67070718_str_gsub_L000515_525
 mov r2, FP
 sub r2, #-(-284) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o2c_67070718_reprepstate_L000446 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-284) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o17_67070718_match_L000146
 add SP, #8 ' CALL addrg
 mov RI, ##-572
 adds RI, FP
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o2m_67070718_str_gsub_L000515_528 ' EQU4
 mov r22, ##-572
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_sb0o2m_67070718_str_gsub_L000515_528 ' EQU4
 adds r19, #1 ' ADDI4 coni
 mov r2, r7 ' CVI, CVU or LOAD
 mov RI, FP
 adds RI, ##(-572)
 rdlong r3, RI ' reg ARG INDIR ADDRL
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, FP
 adds r5, ##(-556)
' reg ARG ADDRL
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-284)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o2k_67070718_add_value_L000503
 add SP, #16 ' CALL addrg
 or r11, r0 ' BORI/U (2)
 mov r22, ##-572
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2m_67070718_str_gsub_L000515_529 ' JUMPV addrg
C_sb0o2m_67070718_str_gsub_L000515_528
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-280) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_sb0o2m_67070718_str_gsub_L000515_527 ' GEU4
 mov r22, ##-548
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##-552
 adds r20, FP
 ' reg <- addrl
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o2m_67070718_str_gsub_L000515_536 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 adds r3, ##(-556)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o2m_67070718_str_gsub_L000515_536
 mov r22, ##-548
 adds r22, FP
 ' reg <- addrl
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, ##-548
 adds RI, FP
 wrlong r20, RI ' ASGNU4 addrl reg
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov r18, ##-556
 adds r18, FP
 ' reg <- addrl
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r22, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0o2m_67070718_str_gsub_L000515_531 ' (symbol refcount = 0)
C_sb0o2m_67070718_str_gsub_L000515_529
 cmps r13,  #0 wz
 if_z jmp #\C_sb0o2m_67070718_str_gsub_L000515_537 ' EQI4
 jmp #\@C_sb0o2m_67070718_str_gsub_L000515_527 ' JUMPV addrg
C_sb0o2m_67070718_str_gsub_L000515_537
C_sb0o2m_67070718_str_gsub_L000515_526
 cmps r19, r9 wcz
 if_b jmp #\C_sb0o2m_67070718_str_gsub_L000515_525 ' LTI4
C_sb0o2m_67070718_str_gsub_L000515_527
 cmps r11,  #0 wz
 if_nz jmp #\C_sb0o2m_67070718_str_gsub_L000515_539 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o2m_67070718_str_gsub_L000515_540 ' JUMPV addrg
C_sb0o2m_67070718_str_gsub_L000515_539
 mov r22, FP
 sub r22, #-(-280) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 adds r4, ##(-556)
' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r2, FP
 adds r2, ##(-556)
' reg ARG ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
C_sb0o2m_67070718_str_gsub_L000515_540
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
' C_sb0o2m_67070718_str_gsub_L000515_516 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, ##568 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o2o_67070718_adddigit_L000542 ' <symbol:adddigit>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_floor ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r0, r15 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #10 wcz
 if_ae jmp #\C_sb0o2o_67070718_adddigit_L000542_545 ' GEI4
 mov r13, r17
 adds r13, #48 ' ADDI4 coni
 jmp #\@C_sb0o2o_67070718_adddigit_L000542_546 ' JUMPV addrg
C_sb0o2o_67070718_adddigit_L000542_545
 mov r22, r17
 subs r22, #10 ' SUBI4 coni
 mov r13, r22
 adds r13, #97 ' ADDI4 coni
C_sb0o2o_67070718_adddigit_L000542_546
 mov r22, r21 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, r13 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
' C_sb0o2o_67070718_adddigit_L000542_543 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o2p_67070718_num2straux_L000547 ' <symbol:num2straux>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sb0o2p_67070718_num2straux_L000547_552 ' NEF4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_sb0o2p_67070718_num2straux_L000547_552 ' EQF4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0
 xor r22, Bit31 ' NEGF4
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sb0o2p_67070718_num2straux_L000547_549 ' NEF4
C_sb0o2p_67070718_num2straux_L000547_552
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_sb0o2p_67070718_num2straux_L000547_553_L000554 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2p_67070718_num2straux_L000547_548 ' JUMPV addrg
C_sb0o2p_67070718_num2straux_L000547_549
 mov r22, ##@C_sb0o2p_67070718_num2straux_L000547_557_L000558
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sb0o2p_67070718_num2straux_L000547_555 ' NEF4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_sb0o2p_67070718_num2straux_L000547_559_L000560 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2p_67070718_num2straux_L000547_548 ' JUMPV addrg
C_sb0o2p_67070718_num2straux_L000547_555
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
 mov r22, ##@C_sb0o2p_67070718_num2straux_L000547_557_L000558
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_sb0o2p_67070718_num2straux_L000547_561 ' GEF4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 xor r17, Bit31 ' NEGF4
C_sb0o2p_67070718_num2straux_L000547_561
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, #120 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##@C_sb0o2p_67070718_num2straux_L000547_563_L000564
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o2o_67070718_adddigit_L000542
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #4 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_sb0o2p_67070718_num2straux_L000547_557_L000558
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_sb0o2p_67070718_num2straux_L000547_565 ' LEF4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_localeconv ' CALL addrg
 adds r22, r23 ' ADDI/P (1)
 rdlong r20, r0 ' reg <- INDIRP4 reg
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o2p_67070718_num2straux_L000547_567
 mov r22, ##@C_sb0o2p_67070718_num2straux_L000547_563_L000564
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o2o_67070718_adddigit_L000542
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
' C_sb0o2p_67070718_num2straux_L000547_568 ' (symbol refcount = 0)
 mov r22, ##@C_sb0o2p_67070718_num2straux_L000547_557_L000558
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_a jmp #\C_sb0o2p_67070718_num2straux_L000547_567 ' GTF4
C_sb0o2p_67070718_num2straux_L000547_565
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##@C_sb0o2p_67070718_num2straux_L000547_570_L000571 ' reg ARG ADDRG
 mov r4, r15 ' ADDI/P
 adds r4, r23 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 adds r15, r22 ' ADDI/P (1)
 mov r0, r15 ' CVI, CVU or LOAD
C_sb0o2p_67070718_num2straux_L000547_548
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o2v_67070718_lua_number2strx_L000572 ' <symbol:lua_number2strx>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o2p_67070718_num2straux_L000547
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #65 wz
 if_nz jmp #\C_sb0o2v_67070718_lua_number2strx_L000572_574 ' NEI4
 mov r13, #0 ' reg <- coni
 jmp #\@C_sb0o2v_67070718_lua_number2strx_L000572_579 ' JUMPV addrg
C_sb0o2v_67070718_lua_number2strx_L000572_576
 mov r22, r13 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0o2v_67070718_lua_number2strx_L000572_577 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
C_sb0o2v_67070718_lua_number2strx_L000572_579
 cmps r13, r15 wcz
 if_b jmp #\C_sb0o2v_67070718_lua_number2strx_L000572_576 ' LTI4
 jmp #\@C_sb0o2v_67070718_lua_number2strx_L000572_575 ' JUMPV addrg
C_sb0o2v_67070718_lua_number2strx_L000572_574
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #97 wz
 if_z jmp #\C_sb0o2v_67070718_lua_number2strx_L000572_580 ' EQI4
 mov r2, ##@C_sb0o2v_67070718_lua_number2strx_L000572_582_L000583 ' reg ARG ADDRG
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o2v_67070718_lua_number2strx_L000572_573 ' JUMPV addrg
C_sb0o2v_67070718_lua_number2strx_L000572_580
C_sb0o2v_67070718_lua_number2strx_L000572_575
 mov r0, r15 ' CVI, CVU or LOAD
C_sb0o2v_67070718_lua_number2strx_L000572_573
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o31_67070718_addquoted_L000584 ' <symbol:addquoted>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o31_67070718_addquoted_L000584_586 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o31_67070718_addquoted_L000584_586
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 add r18, #1 ' ADDU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 mov r20, #34 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sb0o31_67070718_addquoted_L000584_588 ' JUMPV addrg
C_sb0o31_67070718_addquoted_L000584_587
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #34 wz
 if_z jmp #\C_sb0o31_67070718_addquoted_L000584_593 ' EQI4
 cmps r22,  #92 wz
 if_z jmp #\C_sb0o31_67070718_addquoted_L000584_593 ' EQI4
 cmps r22,  #10 wz
 if_nz jmp #\C_sb0o31_67070718_addquoted_L000584_590 ' NEI4
C_sb0o31_67070718_addquoted_L000584_593
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o31_67070718_addquoted_L000584_594 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o31_67070718_addquoted_L000584_594
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 add r18, #1 ' ADDU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 mov r20, #92 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o31_67070718_addquoted_L000584_595 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o31_67070718_addquoted_L000584_595
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 add r18, #1 ' ADDU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 rdbyte r20, r21 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sb0o31_67070718_addquoted_L000584_591 ' JUMPV addrg
C_sb0o31_67070718_addquoted_L000584_590
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sb0o31_67070718_addquoted_L000584_596 ' EQI4
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_sb0o31_67070718_addquoted_L000584_599 ' LTU4
 rdbyte r2, r21 ' reg <- CVUI4 INDIRU1 reg
 mov r3, ##@C_sb0o31_67070718_addquoted_L000584_601_L000602 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o31_67070718_addquoted_L000584_600 ' JUMPV addrg
C_sb0o31_67070718_addquoted_L000584_599
 rdbyte r2, r21 ' reg <- CVUI4 INDIRU1 reg
 mov r3, ##@C_sb0o31_67070718_addquoted_L000584_603_L000604 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
C_sb0o31_67070718_addquoted_L000584_600
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addstring
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o31_67070718_addquoted_L000584_597 ' JUMPV addrg
C_sb0o31_67070718_addquoted_L000584_596
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o31_67070718_addquoted_L000584_605 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o31_67070718_addquoted_L000584_605
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 add r18, #1 ' ADDU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 rdbyte r20, r21 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o31_67070718_addquoted_L000584_597
C_sb0o31_67070718_addquoted_L000584_591
 adds r21, #1 ' ADDP4 coni
C_sb0o31_67070718_addquoted_L000584_588
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 sub r19, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_sb0o31_67070718_addquoted_L000584_587  ' NEU4
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o31_67070718_addquoted_L000584_606 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o31_67070718_addquoted_L000584_606
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 add r18, #1 ' ADDU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 mov r20, #34 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0o31_67070718_addquoted_L000584_585 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o34_67070718_quotefloat_L000607 ' <symbol:quotefloat>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sb0o34_67070718_quotefloat_L000607_609 ' NEF4
 mov RI, ##@C_sb0o34_67070718_quotefloat_L000607_611_L000612
 mov BC, FP
 sub BC, #-(-8)
 wrlong RI, BC ' ASGNP4 addrli addrg
 jmp #\@C_sb0o34_67070718_quotefloat_L000607_610 ' JUMPV addrg
C_sb0o34_67070718_quotefloat_L000607_609
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0
 xor r22, Bit31 ' NEGF4
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sb0o34_67070718_quotefloat_L000607_613 ' NEF4
 mov RI, ##@C_sb0o34_67070718_quotefloat_L000607_615_L000616
 mov BC, FP
 sub BC, #-(-8)
 wrlong RI, BC ' ASGNP4 addrli addrg
 jmp #\@C_sb0o34_67070718_quotefloat_L000607_614 ' JUMPV addrg
C_sb0o34_67070718_quotefloat_L000607_613
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_sb0o34_67070718_quotefloat_L000607_617 ' EQF4
 mov RI, ##@C_sb0o34_67070718_quotefloat_L000607_619_L000620
 mov BC, FP
 sub BC, #-(-8)
 wrlong RI, BC ' ASGNP4 addrli addrg
 jmp #\@C_sb0o34_67070718_quotefloat_L000607_618 ' JUMPV addrg
C_sb0o34_67070718_quotefloat_L000607_617
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_sb0o34_67070718_quotefloat_L000607_621_L000622 ' reg ARG ADDRG
 mov r4, #120 ' reg ARG coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o2v_67070718_lua_number2strx_L000572
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #46 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memchr
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sb0o34_67070718_quotefloat_L000607_623  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_localeconv ' CALL addrg
 rdlong r22, r0 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-20)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memchr
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_sb0o34_67070718_quotefloat_L000607_625 ' EQU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o34_67070718_quotefloat_L000607_625
C_sb0o34_67070718_quotefloat_L000607_623
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_sb0o34_67070718_quotefloat_L000607_608 ' JUMPV addrg
C_sb0o34_67070718_quotefloat_L000607_618
C_sb0o34_67070718_quotefloat_L000607_614
C_sb0o34_67070718_quotefloat_L000607_610
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##@C_sb0o34_67070718_quotefloat_L000607_627_L000628 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sb0o34_67070718_quotefloat_L000607_608
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o3a_67070718_addliteral_L000629 ' <symbol:addliteral>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wcz
 if_b jmp #\C_sb0o3a_67070718_addliteral_L000629_631 ' LTI4
 cmps r17,  #4 wcz
 if_a jmp #\C_sb0o3a_67070718_addliteral_L000629_631 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o3a_67070718_addliteral_L000629_648_L000650 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o3a_67070718_addliteral_L000629_648_L000650 ' <symbol:648>
 long @C_sb0o3a_67070718_addliteral_L000629_645
 long @C_sb0o3a_67070718_addliteral_L000629_645
 long @C_sb0o3a_67070718_addliteral_L000629_631
 long @C_sb0o3a_67070718_addliteral_L000629_635
 long @C_sb0o3a_67070718_addliteral_L000629_634

' Catalina Code

DAT ' code segment
C_sb0o3a_67070718_addliteral_L000629_634
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o31_67070718_addquoted_L000584
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o3a_67070718_addliteral_L000629_632 ' JUMPV addrg
C_sb0o3a_67070718_addliteral_L000629_635
 mov r2, #120 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isinteger
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o3a_67070718_addliteral_L000629_636 ' NEI4
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tonumberx
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o34_67070718_quotefloat_L000607
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_sb0o3a_67070718_addliteral_L000629_637 ' JUMPV addrg
C_sb0o3a_67070718_addliteral_L000629_636
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-2147483648 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sb0o3a_67070718_addliteral_L000629_643 ' NEI4
 mov r15, ##@C_sb0o3a_67070718_addliteral_L000629_638_L000639 ' reg <- addrg
 jmp #\@C_sb0o3a_67070718_addliteral_L000629_644 ' JUMPV addrg
C_sb0o3a_67070718_addliteral_L000629_643
 mov r15, ##@C_sb0o3a_67070718_addliteral_L000629_640_L000641 ' reg <- addrg
C_sb0o3a_67070718_addliteral_L000629_644
 mov RI, FP
 sub RI, #-(-20)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
C_sb0o3a_67070718_addliteral_L000629_637
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_sb0o3a_67070718_addliteral_L000629_632 ' JUMPV addrg
C_sb0o3a_67070718_addliteral_L000629_645
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__tolstring
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
 jmp #\@C_sb0o3a_67070718_addliteral_L000629_632 ' JUMPV addrg
C_sb0o3a_67070718_addliteral_L000629_631
 mov r2, ##@C_sb0o3a_67070718_addliteral_L000629_646_L000647 ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o3a_67070718_addliteral_L000629_632
' C_sb0o3a_67070718_addliteral_L000629_630 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o3g_67070718_get2digits_L000651 ' <symbol:get2digits>
 calld PA,#PSHM
 long $400000 ' save registers
 rdbyte r22, r2 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_ae jmp #\C_sb0o3g_67070718_get2digits_L000651_653 ' GEU4
 adds r2, #1 ' ADDP4 coni
 rdbyte r22, r2 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_ae jmp #\C_sb0o3g_67070718_get2digits_L000651_655 ' GEU4
 adds r2, #1 ' ADDP4 coni
C_sb0o3g_67070718_get2digits_L000651_655
C_sb0o3g_67070718_get2digits_L000651_653
 mov r0, r2 ' CVI, CVU or LOAD
' C_sb0o3g_67070718_get2digits_L000651_652 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sb0o3h_67070718_checkformat_L000657 ' <symbol:checkformat>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r21
 adds r15, #1 ' ADDP4 coni
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 adds r15, r0 ' ADDI/P (2)
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wz
 if_z jmp #\C_sb0o3h_67070718_checkformat_L000657_659 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o3g_67070718_get2digits_L000651 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #46 wz
 if_nz jmp #\C_sb0o3h_67070718_checkformat_L000657_661 ' NEI4
 cmps r17,  #0 wz
 if_z jmp #\C_sb0o3h_67070718_checkformat_L000657_661 ' EQI4
 adds r15, #1 ' ADDP4 coni
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o3g_67070718_get2digits_L000651 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_sb0o3h_67070718_checkformat_L000657_661
C_sb0o3h_67070718_checkformat_L000657_659
 rdbyte r22, r15 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o3h_67070718_checkformat_L000657_663 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, ##@C_sb0o3h_67070718_checkformat_L000657_666_L000667 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
C_sb0o3h_67070718_checkformat_L000657_663
' C_sb0o3h_67070718_checkformat_L000657_658 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o3j_67070718_getformat_L000668 ' <symbol:getformat>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##@C_sb0o3j_67070718_getformat_L000668_670_L000671 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 add r17, #1 ' ADDU4 coni
 cmp r17,  #22 wcz 
 if_b jmp #\C_sb0o3j_67070718_getformat_L000668_672 ' LTU4
 mov r2, ##@C_sb0o3j_67070718_getformat_L000668_674_L000675 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sb0o3j_67070718_getformat_L000668_672
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov r20, #37 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #1 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r17 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov r20, ##-1 ' reg <- con
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_sb0o3j_67070718_getformat_L000668_669 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o3m_67070718_addlenmod_L000676 ' <symbol:addlenmod>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r19
 sub r22, #1 ' SUBU4 coni
 adds r22, r23 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r19 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r20, ##-1 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r22, r19 ' ADDU
 add r22, r17 ' ADDU (3)
 sub r22, #1 ' SUBU4 coni
 adds r22, r23 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19 ' ADDU
 add r22, r17 ' ADDU (3)
 adds r22, r23 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0o3m_67070718_addlenmod_L000676_677 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o3n_67070718_str_format_L000678 ' <symbol:str_format>
 calld PA,#NEWF
 sub SP, #324
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r17, #1 ' reg <- coni
 mov r2, FP
 sub r2, #-(-280) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-280) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r19, r22 ' ADDI/P
 adds r19, r21 ' ADDI/P (3)
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_681 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_680
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #37 wz
 if_z jmp #\C_sb0o3n_67070718_str_format_L000678_683 ' EQI4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-272) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o3n_67070718_str_format_L000678_688 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o3n_67070718_str_format_L000678_688
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov r18, FP
 sub r18, #-(-276) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r22, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_684 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_683
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #37 wz
 if_nz jmp #\C_sb0o3n_67070718_str_format_L000678_689 ' NEI4
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-272) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o3n_67070718_str_format_L000678_694 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o3n_67070718_str_format_L000678_694
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov r18, FP
 sub r18, #-(-276) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r22, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_690 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_689
 mov r13, #120 ' reg <- coni
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-320)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r11, #0 ' reg <- coni
 mov r22, r17
 adds r22, #1 ' ADDI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22, r15 wcz
 if_be jmp #\C_sb0o3n_67070718_str_format_L000678_695 ' LEI4
 mov r2, ##@C_sb0o3n_67070718_str_format_L000678_697_L000698 ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o3n_67070718_str_format_L000678_679 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_695
 mov r2, FP
 sub r2, #-(-316) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3j_67070718_getformat_L000668
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r9, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r9,  #69 wz
 if_z jmp #\C_sb0o3n_67070718_str_format_L000678_719 ' EQI4
 mov r22, #71 ' reg <- coni
 cmps r9, r22 wz
 if_z jmp #\C_sb0o3n_67070718_str_format_L000678_719 ' EQI4
 cmps r9, r22 wcz
 if_a jmp #\C_sb0o3n_67070718_str_format_L000678_743 ' GTI4
' C_sb0o3n_67070718_str_format_L000678_742 ' (symbol refcount = 0)
 cmps r9,  #65 wz
 if_z jmp #\C_sb0o3n_67070718_str_format_L000678_715 ' EQI4
 jmp #\@C_sb0o3n_67070718_str_format_L000678_699 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_743
 mov r22, #88 ' reg <- coni
 cmps r9, r22 wz
 if_z jmp #\C_sb0o3n_67070718_str_format_L000678_712 ' EQI4
 cmps r9, r22 wcz
 if_b jmp #\C_sb0o3n_67070718_str_format_L000678_699 ' LTI4
' C_sb0o3n_67070718_str_format_L000678_744 ' (symbol refcount = 0)
 cmps r9,  #97 wcz
 if_b jmp #\C_sb0o3n_67070718_str_format_L000678_699 ' LTI4
 cmps r9,  #120 wcz
 if_a jmp #\C_sb0o3n_67070718_str_format_L000678_699 ' GTI4
 mov r22, r9
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o3n_67070718_str_format_L000678_745_L000747-388 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_745_L000747 ' <symbol:745>
 long @C_sb0o3n_67070718_str_format_L000678_715
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_702
 long @C_sb0o3n_67070718_str_format_L000678_705
 long @C_sb0o3n_67070718_str_format_L000678_719
 long @C_sb0o3n_67070718_str_format_L000678_718
 long @C_sb0o3n_67070718_str_format_L000678_719
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_705
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_712
 long @C_sb0o3n_67070718_str_format_L000678_720
 long @C_sb0o3n_67070718_str_format_L000678_725
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_731
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_709
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_699
 long @C_sb0o3n_67070718_str_format_L000678_712

' Catalina Code

DAT ' code segment
C_sb0o3n_67070718_str_format_L000678_702
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_sb0o3n_67070718_str_format_L000678_703_L000704 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-316) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3h_67070718_checkformat_L000657
 add SP, #12 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-320)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_705
 mov RI, ##@C_sb0o3n_67070718_str_format_L000678_706_L000707
 mov BC, FP
 sub BC, #-(-284)
 wrlong RI, BC ' ASGNP4 addrli addrg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_708 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_709
 mov RI, ##@C_sb0o3n_67070718_str_format_L000678_710_L000711
 mov BC, FP
 sub BC, #-(-284)
 wrlong RI, BC ' ASGNP4 addrli addrg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_708 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_712
 mov RI, ##@C_sb0o3n_67070718_str_format_L000678_713_L000714
 mov BC, FP
 sub BC, #-(-284)
 wrlong RI, BC ' ASGNP4 addrli addrg
C_sb0o3n_67070718_str_format_L000678_708
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-324)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-284)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-316) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3h_67070718_checkformat_L000657
 add SP, #12 ' CALL addrg
 mov r2, ##@C_sb0o3_67070718_str_sub_L000022_26_L000027 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3m_67070718_addlenmod_L000676
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-324)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-320)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_715
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_sb0o3n_67070718_str_format_L000678_716_L000717 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-316) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3h_67070718_checkformat_L000657
 add SP, #12 ' CALL addrg
 mov r2, ##@C_sb0o3_67070718_str_sub_L000022_26_L000027 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3m_67070718_addlenmod_L000676
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov r4, r13 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-320)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o2v_67070718_lua_number2strx_L000572
 add SP, #16 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_718
 mov r13, #148 ' reg <- coni
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-320)
 wrlong r0, RI ' ASGNP4 addrli reg
C_sb0o3n_67070718_str_format_L000678_719
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-324)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_sb0o3n_67070718_str_format_L000678_716_L000717 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-316) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3h_67070718_checkformat_L000657
 add SP, #12 ' CALL addrg
 mov r2, ##@C_sb0o3_67070718_str_sub_L000022_26_L000027 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3m_67070718_addlenmod_L000676
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-324)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-320)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_720
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_topointer
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-324)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_sb0o3n_67070718_str_format_L000678_703_L000704 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-316) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3h_67070718_checkformat_L000657
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-324) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sb0o3n_67070718_str_format_L000678_721  ' NEU4
 mov RI, ##@C_sb0o3n_67070718_str_format_L000678_723_L000724
 mov BC, FP
 sub BC, #-(-324)
 wrlong RI, BC ' ASGNP4 addrli addrg
 mov r2, FP
 sub r2, #-(-316) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-316) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #115 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o3n_67070718_str_format_L000678_721
 mov RI, FP
 sub RI, #-(-324)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-320)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_725
 mov r22, FP
 sub r22, #-(-314) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sb0o3n_67070718_str_format_L000678_726 ' EQI4
 mov r2, ##@C_sb0o3n_67070718_str_format_L000678_729_L000730 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o3n_67070718_str_format_L000678_679 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_726
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3a_67070718_addliteral_L000629
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_731
 mov r2, FP
 sub r2, #-(-328) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-324)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-314) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o3n_67070718_str_format_L000678_732 ' NEI4
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_732
 mov RI, FP
 sub RI, #-(-324)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-328) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r20, r22 wz
 if_z jmp #\C_sb0o3n_67070718_str_format_L000678_737 ' EQU4
 mov r2, ##@C_sb0o3n_67070718_str_format_L000678_735_L000736 ' reg ARG ADDRG
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o3n_67070718_str_format_L000678_737
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_sb0o3n_67070718_str_format_L000678_703_L000704 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-316) ' reg ARG ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o3h_67070718_checkformat_L000657
 add SP, #12 ' CALL addrg
 mov r2, #46 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sb0o3n_67070718_str_format_L000678_738  ' NEU4
 mov r22, FP
 sub r22, #-(-328) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #100 wcz 
 if_b jmp #\C_sb0o3n_67070718_str_format_L000678_738 ' LTU4
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_738
 mov RI, FP
 sub RI, #-(-324)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-316) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-320)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o3n_67070718_str_format_L000678_700 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_699
 mov r2, FP
 sub r2, #-(-316) ' reg ARG ADDRLi
 mov r3, ##@C_sb0o3n_67070718_str_format_L000678_740_L000741 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o3n_67070718_str_format_L000678_679 ' JUMPV addrg
C_sb0o3n_67070718_str_format_L000678_700
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r11 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
C_sb0o3n_67070718_str_format_L000678_690
C_sb0o3n_67070718_str_format_L000678_684
C_sb0o3n_67070718_str_format_L000678_681
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o3n_67070718_str_format_L000678_680 ' LTU4
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sb0o3n_67070718_str_format_L000678_679
 calld PA,#POPM ' restore registers
 add SP, #324 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o44_67070718_nativeendian_L000751 ' <symbol:nativeendian>
 long 1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sb0o45_67070718_digit_L000752 ' <symbol:digit>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, #48 ' reg <- coni
 cmps r22, r2 wcz
 if_a jmp #\C_sb0o45_67070718_digit_L000752_755 ' GTI4
 cmps r2,  #57 wcz
 if_a jmp #\C_sb0o45_67070718_digit_L000752_755 ' GTI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_sb0o45_67070718_digit_L000752_756 ' JUMPV addrg
C_sb0o45_67070718_digit_L000752_755
 mov r23, #0 ' reg <- coni
C_sb0o45_67070718_digit_L000752_756
 mov r0, r23 ' CVI, CVU or LOAD
' C_sb0o45_67070718_digit_L000752_753 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sb0o46_67070718_getnum_L000757 ' <symbol:getnum>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o45_67070718_digit_L000752 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sb0o46_67070718_getnum_L000757_759 ' NEI4
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sb0o46_67070718_getnum_L000757_758 ' JUMPV addrg
C_sb0o46_67070718_getnum_L000757_759
 mov r19, #0 ' reg <- coni
C_sb0o46_67070718_getnum_L000757_761
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 wrlong r20, r23 ' ASGNP4 reg reg
 mov r20, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 mov r19, r0 ' ADDI/P
 adds r19, r22 ' ADDI/P (3)
' C_sb0o46_67070718_getnum_L000757_762 ' (symbol refcount = 0)
 rdlong r22, r23 ' reg <- INDIRP4 reg
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o45_67070718_digit_L000752 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sb0o46_67070718_getnum_L000757_764 ' EQI4
 mov r22, ##214748363 ' reg <- con
 cmps r19, r22 wcz
 if_be jmp #\C_sb0o46_67070718_getnum_L000757_761 ' LEI4
C_sb0o46_67070718_getnum_L000757_764
 mov r0, r19 ' CVI, CVU or LOAD
C_sb0o46_67070718_getnum_L000757_758
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o47_67070718_getnumlimit_L000765 ' <symbol:getnumlimit>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o46_67070718_getnum_L000757
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #16 wcz
 if_a jmp #\C_sb0o47_67070718_getnumlimit_L000765_769 ' GTI4
 cmps r17,  #0 wcz
 if_a jmp #\C_sb0o47_67070718_getnumlimit_L000765_767 ' GTI4
C_sb0o47_67070718_getnumlimit_L000765_769
 mov r2, #16 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, ##@C_sb0o47_67070718_getnumlimit_L000765_770_L000771 ' reg ARG ADDRG
 rdlong r5, r23 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sb0o47_67070718_getnumlimit_L000765_766 ' JUMPV addrg
C_sb0o47_67070718_getnumlimit_L000765_767
 mov r0, r17 ' CVI, CVU or LOAD
C_sb0o47_67070718_getnumlimit_L000765_766
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o49_67070718_initheader_L000772 ' <symbol:initheader>
 calld PA,#PSHM
 long $500000 ' save registers
 wrlong r3, r2 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov r20, ##@C_sb0o44_67070718_nativeendian_L000751 ' reg <- addrg
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_sb0o49_67070718_initheader_L000772_773 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sb0o4a_67070718_getoption_L000774 ' <symbol:getoption>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 wrlong r20, r21 ' ASGNP4 reg reg
 rdbyte r17, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r22, #84 ' reg <- coni
 cmps r17, r22 wz
 if_z jmp #\C_sb0o4a_67070718_getoption_L000774_787 ' EQI4
 cmps r17, r22 wcz
 if_a jmp #\C_sb0o4a_67070718_getoption_L000774_810 ' GTI4
' C_sb0o4a_67070718_getoption_L000774_809 ' (symbol refcount = 0)
 cmps r17,  #60 wcz
 if_b jmp #\C_sb0o4a_67070718_getoption_L000774_811 ' LTI4
 cmps r17,  #66 wcz
 if_a jmp #\C_sb0o4a_67070718_getoption_L000774_812 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o4a_67070718_getoption_L000774_813_L000815-240 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o4a_67070718_getoption_L000774_813_L000815 ' <symbol:813>
 long @C_sb0o4a_67070718_getoption_L000774_803
 long @C_sb0o4a_67070718_getoption_L000774_805
 long @C_sb0o4a_67070718_getoption_L000774_804
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_780

' Catalina Code

DAT ' code segment
C_sb0o4a_67070718_getoption_L000774_811
 cmps r17,  #32 wz
 if_z jmp #\C_sb0o4a_67070718_getoption_L000774_778 ' EQI4
 cmps r17,  #33 wz
 if_z jmp #\C_sb0o4a_67070718_getoption_L000774_806 ' EQI4
 jmp #\@C_sb0o4a_67070718_getoption_L000774_777 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_812
 cmps r17,  #72 wcz
 if_b jmp #\C_sb0o4a_67070718_getoption_L000774_777 ' LTI4
 cmps r17,  #76 wcz
 if_a jmp #\C_sb0o4a_67070718_getoption_L000774_777 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o4a_67070718_getoption_L000774_817_L000819-288 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o4a_67070718_getoption_L000774_817_L000819 ' <symbol:817>
 long @C_sb0o4a_67070718_getoption_L000774_782
 long @C_sb0o4a_67070718_getoption_L000774_792
 long @C_sb0o4a_67070718_getoption_L000774_786
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_784

' Catalina Code

DAT ' code segment
C_sb0o4a_67070718_getoption_L000774_810
 cmps r17,  #98 wcz
 if_b jmp #\C_sb0o4a_67070718_getoption_L000774_821 ' LTI4
 cmps r17,  #115 wcz
 if_a jmp #\C_sb0o4a_67070718_getoption_L000774_822 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o4a_67070718_getoption_L000774_823_L000825-392 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o4a_67070718_getoption_L000774_823_L000825 ' <symbol:823>
 long @C_sb0o4a_67070718_getoption_L000774_779
 long @C_sb0o4a_67070718_getoption_L000774_794
 long @C_sb0o4a_67070718_getoption_L000774_790
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_788
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_781
 long @C_sb0o4a_67070718_getoption_L000774_791
 long @C_sb0o4a_67070718_getoption_L000774_785
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_783
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_789
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_777
 long @C_sb0o4a_67070718_getoption_L000774_793

' Catalina Code

DAT ' code segment
C_sb0o4a_67070718_getoption_L000774_821
 cmps r17,  #88 wz
 if_z jmp #\C_sb0o4a_67070718_getoption_L000774_801 ' EQI4
 jmp #\@C_sb0o4a_67070718_getoption_L000774_777 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_822
 cmps r17,  #120 wz
 if_z jmp #\C_sb0o4a_67070718_getoption_L000774_800 ' EQI4
 cmps r17,  #122 wz
 if_z jmp #\C_sb0o4a_67070718_getoption_L000774_799 ' EQI4
 jmp #\@C_sb0o4a_67070718_getoption_L000774_777 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_779
 mov r22, #1 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_780
 mov r22, #1 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_781
 mov r22, #2 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_782
 mov r22, #2 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_783
 mov r22, #4 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_784
 mov r22, #4 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_785
 mov r22, #4 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_786
 mov r22, #4 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_787
 mov r22, #4 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_788
 mov r22, #4 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #2 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_789
 mov r22, #4 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #3 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_790
 mov r22, #4 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #4 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_791
 mov r2, #4 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o47_67070718_getnumlimit_L000765
 add SP, #8 ' CALL addrg
 wrlong r0, r19 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_792
 mov r2, #4 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o47_67070718_getnumlimit_L000765
 add SP, #8 ' CALL addrg
 wrlong r0, r19 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_793
 mov r2, #4 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o47_67070718_getnumlimit_L000765
 add SP, #8 ' CALL addrg
 wrlong r0, r19 ' ASGNI4 reg reg
 mov r0, #6 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_794
 mov r2, ##-1 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o46_67070718_getnum_L000757
 add SP, #4 ' CALL addrg
 wrlong r0, r19 ' ASGNI4 reg reg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_sb0o4a_67070718_getoption_L000774_795 ' NEI4
 mov r2, ##@C_sb0o4a_67070718_getoption_L000774_797_L000798 ' reg ARG ADDRG
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_sb0o4a_67070718_getoption_L000774_795
 mov r0, #5 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_799
 mov r0, #7 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_800
 mov r22, #1 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, #8 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_801
 mov r0, #9 ' reg <- coni
 jmp #\@C_sb0o4a_67070718_getoption_L000774_775 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_803
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_sb0o4a_67070718_getoption_L000774_778 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_804
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_sb0o4a_67070718_getoption_L000774_778 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_805
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, ##@C_sb0o44_67070718_nativeendian_L000751 ' reg <- addrg
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_sb0o4a_67070718_getoption_L000774_778 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_806
 mov r22, #4 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o47_67070718_getnumlimit_L000765
 add SP, #8 ' CALL addrg
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 jmp #\@C_sb0o4a_67070718_getoption_L000774_778 ' JUMPV addrg
C_sb0o4a_67070718_getoption_L000774_777
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, ##@C_sb0o4a_67070718_getoption_L000774_807_L000808 ' reg ARG ADDRG
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
C_sb0o4a_67070718_getoption_L000774_778
 mov r0, #10 ' reg <- coni
C_sb0o4a_67070718_getoption_L000774_775
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o4j_67070718_getdetails_L000827 ' <symbol:getdetails>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o4a_67070718_getoption_L000774
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r19 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r15,  #9 wz
 if_nz jmp #\C_sb0o4j_67070718_getdetails_L000827_829 ' NEI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sb0o4j_67070718_getdetails_L000827_834 ' EQI4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o4a_67070718_getoption_L000774
 add SP, #8 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_sb0o4j_67070718_getdetails_L000827_834 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o4j_67070718_getdetails_L000827_831 ' NEI4
C_sb0o4j_67070718_getdetails_L000827_834
 mov r2, ##@C_sb0o4j_67070718_getdetails_L000827_835_L000836 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4j_67070718_getdetails_L000827_831
C_sb0o4j_67070718_getdetails_L000827_829
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wcz
 if_be jmp #\C_sb0o4j_67070718_getdetails_L000827_839 ' LEI4
 cmps r15,  #5 wz
 if_nz jmp #\C_sb0o4j_67070718_getdetails_L000827_837 ' NEI4
C_sb0o4j_67070718_getdetails_L000827_839
 mov r22, #0 ' reg <- coni
 wrlong r22, r17 ' ASGNI4 reg reg
 jmp #\@C_sb0o4j_67070718_getdetails_L000827_838 ' JUMPV addrg
C_sb0o4j_67070718_getdetails_L000827_837
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_sb0o4j_67070718_getdetails_L000827_840 ' LEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sb0o4j_67070718_getdetails_L000827_840
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C_sb0o4j_67070718_getdetails_L000827_842 ' EQI4
 mov r2, ##@C_sb0o4j_67070718_getdetails_L000827_844_L000845 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4j_67070718_getdetails_L000827_842
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #1 ' SUBI4 coni
 mov r18, r20 ' CVI, CVU or LOAD
 and r18, r23 ' BANDI/U (2)
 subs r22, r18 ' SUBI/P (1)
 and r22, r20 ' BANDI/U (1)
 wrlong r22, r17 ' ASGNI4 reg reg
C_sb0o4j_67070718_getdetails_L000827_838
 mov r0, r15 ' CVI, CVU or LOAD
' C_sb0o4j_67070718_getdetails_L000827_828 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o4m_67070718_packint_L000846 ' <symbol:packint>
 calld PA,#NEWF
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz
 if_z jmp #\C_sb0o4m_67070718_packint_L000846_849 ' EQI4
 mov r11, #0 ' reg <- coni
 jmp #\@C_sb0o4m_67070718_packint_L000846_850 ' JUMPV addrg
C_sb0o4m_67070718_packint_L000846_849
 mov r11, r19
 subs r11, #1 ' SUBI4 coni
C_sb0o4m_67070718_packint_L000846_850
 mov r22, r11 ' ADDI/P
 adds r22, r13 ' ADDI/P (3)
 mov r20, r23
 and r20, #255 ' BANDU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r15, #1 ' reg <- coni
 jmp #\@C_sb0o4m_67070718_packint_L000846_854 ' JUMPV addrg
C_sb0o4m_67070718_packint_L000846_851
 shr r23, #8 ' RSHU4 coni
 cmps r21,  #0 wz
 if_z jmp #\C_sb0o4m_67070718_packint_L000846_856 ' EQI4
 mov r9, r15 ' CVI, CVU or LOAD
 jmp #\@C_sb0o4m_67070718_packint_L000846_857 ' JUMPV addrg
C_sb0o4m_67070718_packint_L000846_856
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r9, r22 ' SUBI/P
 subs r9, r15 ' SUBI/P (3)
C_sb0o4m_67070718_packint_L000846_857
 mov r22, r9 ' ADDI/P
 adds r22, r13 ' ADDI/P (3)
 mov r20, r23
 and r20, #255 ' BANDU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0o4m_67070718_packint_L000846_852 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_sb0o4m_67070718_packint_L000846_854
 cmps r15, r19 wcz
 if_b jmp #\C_sb0o4m_67070718_packint_L000846_851 ' LTI4
 cmps r17,  #0 wz
 if_z jmp #\C_sb0o4m_67070718_packint_L000846_858 ' EQI4
 cmps r19,  #4 wcz
 if_be jmp #\C_sb0o4m_67070718_packint_L000846_858 ' LEI4
 mov r15, #4 ' reg <- coni
 jmp #\@C_sb0o4m_67070718_packint_L000846_863 ' JUMPV addrg
C_sb0o4m_67070718_packint_L000846_860
 cmps r21,  #0 wz
 if_z jmp #\C_sb0o4m_67070718_packint_L000846_865 ' EQI4
 mov r9, r15 ' CVI, CVU or LOAD
 jmp #\@C_sb0o4m_67070718_packint_L000846_866 ' JUMPV addrg
C_sb0o4m_67070718_packint_L000846_865
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r9, r22 ' SUBI/P
 subs r9, r15 ' SUBI/P (3)
C_sb0o4m_67070718_packint_L000846_866
 mov r22, r9 ' ADDI/P
 adds r22, r13 ' ADDI/P (3)
 mov r20, #255 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb0o4m_67070718_packint_L000846_861 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_sb0o4m_67070718_packint_L000846_863
 cmps r15, r19 wcz
 if_b jmp #\C_sb0o4m_67070718_packint_L000846_860 ' LTI4
C_sb0o4m_67070718_packint_L000846_858
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r19 ' CVI, CVU or LOAD
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
' C_sb0o4m_67070718_packint_L000846_847 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o4n_67070718_copywithendian_L000867 ' <symbol:copywithendian>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##@C_sb0o44_67070718_nativeendian_L000751 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r17, r22 wz
 if_nz jmp #\C_sb0o4n_67070718_copywithendian_L000867_869 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o4n_67070718_copywithendian_L000867_870 ' JUMPV addrg
C_sb0o4n_67070718_copywithendian_L000867_869
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 adds r23, r22 ' ADDI/P (2)
 jmp #\@C_sb0o4n_67070718_copywithendian_L000867_872 ' JUMPV addrg
C_sb0o4n_67070718_copywithendian_L000867_871
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o4n_67070718_copywithendian_L000867_872
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 subs r19, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o4n_67070718_copywithendian_L000867_871 ' NEI4
C_sb0o4n_67070718_copywithendian_L000867_870
' C_sb0o4n_67070718_copywithendian_L000867_868 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb0o4o_67070718_str_pack_L000874 ' <symbol:str_pack>
 calld PA,#NEWF
 sub SP, #304
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-280)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r21, #1 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r2, FP
 sub r2, #-(-292) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o49_67070718_initheader_L000772
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_877 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_876
 mov r2, FP
 sub r2, #-(-296) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-300) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-280) ' reg ARG ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-292)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o4j_67070718_getdetails_L000827
 add SP, #16 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-296) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-300) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 add r19, r22 ' ADDU (1)
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_880 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_879
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-272) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_885 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_885
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-276) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o4o_67070718_str_pack_L000874_880
 mov r22, FP
 sub r22, #-(-296) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 subs r20, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-296)
 wrlong r20, RI ' ASGNI4 addrli reg
 cmps r22,  #0 wcz
 if_a jmp #\C_sb0o4o_67070718_str_pack_L000874_879 ' GTI4
 adds r21, #1 ' ADDI4 coni
 mov r15, r17 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_886 ' LTI4
 cmps r15,  #10 wcz
 if_a jmp #\C_sb0o4o_67070718_str_pack_L000874_886 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o4o_67070718_str_pack_L000874_944_L000946 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o4o_67070718_str_pack_L000874_944_L000946 ' <symbol:944>
 long @C_sb0o4o_67070718_str_pack_L000874_889
 long @C_sb0o4o_67070718_str_pack_L000874_900
 long @C_sb0o4o_67070718_str_pack_L000874_907
 long @C_sb0o4o_67070718_str_pack_L000874_910
 long @C_sb0o4o_67070718_str_pack_L000874_913
 long @C_sb0o4o_67070718_str_pack_L000874_916
 long @C_sb0o4o_67070718_str_pack_L000874_927
 long @C_sb0o4o_67070718_str_pack_L000874_932
 long @C_sb0o4o_67070718_str_pack_L000874_938
 long @C_sb0o4o_67070718_str_pack_L000874_943
 long @C_sb0o4o_67070718_str_pack_L000874_943

' Catalina Code

DAT ' code segment
C_sb0o4o_67070718_str_pack_L000874_889
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-300) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #4 wcz
 if_ae jmp #\C_sb0o4o_67070718_str_pack_L000874_890 ' GEI4
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-300) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 subs r20, #1 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-304)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-304) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r20, r22 ' NEGI4
 cmps r20, r13 wcz
 if_a jmp #\C_sb0o4o_67070718_str_pack_L000874_895 ' GTI4
 cmps r13, r22 wcz
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_894 ' LTI4
C_sb0o4o_67070718_str_pack_L000874_895
 mov r2, ##@C_sb0o4o_67070718_str_pack_L000874_892_L000893 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_894
C_sb0o4o_67070718_str_pack_L000874_890
 cmps r13,  #0 wcz
 if_ae jmp #\C_sb0o4o_67070718_str_pack_L000874_898 ' GEI4
 mov r11, #1 ' reg <- coni
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_899 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_898
 mov r11, #0 ' reg <- coni
C_sb0o4o_67070718_str_pack_L000874_899
 mov r2, r11 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-300)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-288)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r13 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-276)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o4m_67070718_packint_L000846
 add SP, #16 ' CALL addrg
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_887 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_900
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-304)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-300) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #4 wcz
 if_ae jmp #\C_sb0o4o_67070718_str_pack_L000874_901 ' GEI4
 mov r22, FP
 sub r22, #-(-304) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #1 ' reg <- coni
 mov r18, FP
 sub r18, #-(-300) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 shl r18, #3 ' LSHI4 coni
 shl r20, r18 ' LSHI/U (1)
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_905 ' LTU4
 mov r2, ##@C_sb0o4o_67070718_str_pack_L000874_903_L000904 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_905
C_sb0o4o_67070718_str_pack_L000874_901
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-300)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-288)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-304) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-276)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o4m_67070718_packint_L000846
 add SP, #16 ' CALL addrg
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_887 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_907
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-304)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-308)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-288)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #4 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-304) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-308)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o4n_67070718_copywithendian_L000867
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-300) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_887 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_910
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-304)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-308)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-288)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #4 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-304) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-308)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o4n_67070718_copywithendian_L000867
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-300) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_887 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_913
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checknumber
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-304)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-308)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-288)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #4 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-304) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-308)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o4n_67070718_copywithendian_L000867
 add SP, #12 ' CALL addrg
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-300) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_887 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_916
 mov r2, FP
 sub r2, #-(-304) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-308)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-304) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-300) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_sb0o4o_67070718_str_pack_L000874_919 ' LEU4
 mov r2, ##@C_sb0o4o_67070718_str_pack_L000874_917_L000918 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_919
 mov RI, FP
 sub RI, #-(-304)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-308)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-276) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_921 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_920
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-272) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_926 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_926
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-276) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o4o_67070718_str_pack_L000874_921
 mov r22, FP
 sub r22, #-(-304) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-304)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-300) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_920 ' LTU4
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_887 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_927
 mov r2, FP
 sub r2, #-(-304) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-308)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-300) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #4 wcz
 if_ae jmp #\C_sb0o4o_67070718_str_pack_L000874_930 ' GEI4
 mov r20, FP
 sub r20, #-(-304) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, #1 ' reg <- coni
 shl r22, #3 ' LSHI4 coni
 mov RI, r18
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 cmp r20, r22 wcz 
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_930 ' LTU4
 mov r2, ##@C_sb0o4o_67070718_str_pack_L000874_928_L000929 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_930
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-300)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-288)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-304)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-276)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o4m_67070718_packint_L000846
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-304)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-308)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, FP
 sub r4, #-(-276) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-304) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r19, r22 ' ADDU (1)
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_887 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_932
 mov r2, FP
 sub r2, #-(-304) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r13 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-304) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wz
 if_z jmp #\C_sb0o4o_67070718_str_pack_L000874_933 ' EQU4
 mov r2, ##@C_sb0o3n_67070718_str_format_L000678_735_L000736 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_933
 mov RI, FP
 sub RI, #-(-304)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-276) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-272) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_937 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_937
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-276) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-304) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 add r19, r22 ' ADDU (1)
 jmp #\@C_sb0o4o_67070718_str_pack_L000874_887 ' JUMPV addrg
C_sb0o4o_67070718_str_pack_L000874_938
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-272) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o4o_67070718_str_pack_L000874_942 ' LTU4
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__prepbuffsize
 add SP, #4 ' CALL addrg
C_sb0o4o_67070718_str_pack_L000874_942
 mov r22, FP
 sub r22, #-(-268) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r22
 add r20, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r20, RI ' ASGNU4 addrli reg
 mov r20, FP
 sub r20, #-(-276) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb0o4o_67070718_str_pack_L000874_943
 subs r21, #1 ' SUBI4 coni
C_sb0o4o_67070718_str_pack_L000874_886
C_sb0o4o_67070718_str_pack_L000874_887
C_sb0o4o_67070718_str_pack_L000874_877
 mov r22, FP
 sub r22, #-(-280) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o4o_67070718_str_pack_L000874_876 ' NEI4
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sb0o4o_67070718_str_pack_L000874_875 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #304 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o4v_67070718_str_packsize_L000947 ' <symbol:str_packsize>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r21, #0 ' reg <- coni
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o49_67070718_initheader_L000772
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o4v_67070718_str_packsize_L000947_950 ' JUMPV addrg
C_sb0o4v_67070718_str_packsize_L000947_949
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-20)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o4j_67070718_getdetails_L000827
 add SP, #16 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #6 wz
 if_z jmp #\C_sb0o4v_67070718_str_packsize_L000947_955 ' EQI4
 cmps r19,  #7 wz
 if_nz jmp #\C_sb0o4v_67070718_str_packsize_L000947_954 ' NEI4
C_sb0o4v_67070718_str_packsize_L000947_955
 mov r2, ##@C_sb0o4v_67070718_str_packsize_L000947_952_L000953 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4v_67070718_str_packsize_L000947_954
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##$7fffffff ' reg <- con
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 cmp r21, r22 wcz 
 if_be jmp #\C_sb0o4v_67070718_str_packsize_L000947_958 ' LEU4
 mov r2, ##@C_sb0o4v_67070718_str_packsize_L000947_956_L000957 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o4v_67070718_str_packsize_L000947_958
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 add r21, r22 ' ADDU (1)
C_sb0o4v_67070718_str_packsize_L000947_950
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o4v_67070718_str_packsize_L000947_949 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_sb0o4v_67070718_str_packsize_L000947_948 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o52_67070718_unpackint_L000959 ' <symbol:unpackint>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, #0 ' reg <- coni
 cmps r19,  #4 wcz
 if_a jmp #\C_sb0o52_67070718_unpackint_L000959_962 ' GTI4
 mov r11, r19 ' CVI, CVU or LOAD
 jmp #\@C_sb0o52_67070718_unpackint_L000959_963 ' JUMPV addrg
C_sb0o52_67070718_unpackint_L000959_962
 mov r11, #4 ' reg <- coni
C_sb0o52_67070718_unpackint_L000959_963
 mov RI, FP
 sub RI, #-(-8)
 wrlong r11, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r15, r22
 subs r15, #1 ' SUBI4 coni
 jmp #\@C_sb0o52_67070718_unpackint_L000959_967 ' JUMPV addrg
C_sb0o52_67070718_unpackint_L000959_964
 shl r13, #8 ' LSHU4 coni
 cmps r21,  #0 wz
 if_z jmp #\C_sb0o52_67070718_unpackint_L000959_969 ' EQI4
 mov r9, r15 ' CVI, CVU or LOAD
 jmp #\@C_sb0o52_67070718_unpackint_L000959_970 ' JUMPV addrg
C_sb0o52_67070718_unpackint_L000959_969
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 mov r9, r22 ' SUBI/P
 subs r9, r15 ' SUBI/P (3)
C_sb0o52_67070718_unpackint_L000959_970
 mov r22, r9 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 or r13, r22 ' BORI/U (1)
' C_sb0o52_67070718_unpackint_L000959_965 ' (symbol refcount = 0)
 subs r15, #1 ' SUBI4 coni
C_sb0o52_67070718_unpackint_L000959_967
 cmps r15,  #0 wcz
 if_ae jmp #\C_sb0o52_67070718_unpackint_L000959_964 ' GEI4
 cmps r19,  #4 wcz
 if_ae jmp #\C_sb0o52_67070718_unpackint_L000959_971 ' GEI4
 cmps r17,  #0 wz
 if_z jmp #\C_sb0o52_67070718_unpackint_L000959_972 ' EQI4
 mov r22, #1 ' reg <- coni
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 subs r20, #1 ' SUBI4 coni
 shl r22, r20 ' LSHI/U (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r13 ' BXORI/U
 xor r20, r22 ' BXORI/U (3)
 mov r13, r20 ' SUBU
 sub r13, r22 ' SUBU (3)
 jmp #\@C_sb0o52_67070718_unpackint_L000959_972 ' JUMPV addrg
C_sb0o52_67070718_unpackint_L000959_971
 cmps r19,  #4 wcz
 if_be jmp #\C_sb0o52_67070718_unpackint_L000959_975 ' LEI4
 mov r22, #0 ' reg <- coni
 cmps r17, r22 wz
 if_z jmp #\C_sb0o52_67070718_unpackint_L000959_980 ' EQI4
 mov r20, r13 ' CVI, CVU or LOAD
 cmps r20, r22 wcz
 if_b jmp #\C_sb0o52_67070718_unpackint_L000959_978 ' LTI4
C_sb0o52_67070718_unpackint_L000959_980
 mov r7, #0 ' reg <- coni
 jmp #\@C_sb0o52_67070718_unpackint_L000959_979 ' JUMPV addrg
C_sb0o52_67070718_unpackint_L000959_978
 mov r7, #255 ' reg <- coni
C_sb0o52_67070718_unpackint_L000959_979
 mov r9, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_sb0o52_67070718_unpackint_L000959_984 ' JUMPV addrg
C_sb0o52_67070718_unpackint_L000959_981
 cmps r21,  #0 wz
 if_z jmp #\C_sb0o52_67070718_unpackint_L000959_988 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r15, RI ' ASGNI4 addrli reg
 jmp #\@C_sb0o52_67070718_unpackint_L000959_989 ' JUMPV addrg
C_sb0o52_67070718_unpackint_L000959_988
 mov r22, r19
 subs r22, #1 ' SUBI4 coni
 subs r22, r15 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sb0o52_67070718_unpackint_L000959_989
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, r23 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r9 wz
 if_z jmp #\C_sb0o52_67070718_unpackint_L000959_985 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_sb0o52_67070718_unpackint_L000959_990_L000991 ' reg ARG ADDRG
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #8 ' CALL addrg
C_sb0o52_67070718_unpackint_L000959_985
' C_sb0o52_67070718_unpackint_L000959_982 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_sb0o52_67070718_unpackint_L000959_984
 cmps r15, r19 wcz
 if_b jmp #\C_sb0o52_67070718_unpackint_L000959_981 ' LTI4
C_sb0o52_67070718_unpackint_L000959_975
C_sb0o52_67070718_unpackint_L000959_972
 mov r0, r13 ' CVI, CVU or LOAD
' C_sb0o52_67070718_unpackint_L000959_960 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb0o54_67070718_str_unpack_L000992 ' <symbol:str_unpack>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o1_67070718_posrelatI__L000006
 add SP, #4 ' CALL addrg
 mov r21, r0
 sub r21, #1 ' SUBU4 coni
 mov r19, #0 ' reg <- coni
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r21, r22 wcz 
 if_be jmp #\C_sb0o54_67070718_str_unpack_L000992_996 ' LEU4
 mov r2, ##@C_sb0o54_67070718_str_unpack_L000992_994_L000995 ' reg ARG ADDRG
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o54_67070718_str_unpack_L000992_996
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o49_67070718_initheader_L000772
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_998 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_997
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-20)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o4j_67070718_getdetails_L000827
 add SP, #16 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 add r22, r20 ' ADDU (1)
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r20, r21 ' SUBU (1)
 cmp r22, r20 wcz 
 if_be jmp #\C_sb0o54_67070718_str_unpack_L000992_1002 ' LEU4
 mov r2, ##@C_sb0o54_67070718_str_unpack_L000992_1000_L001001 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o54_67070718_str_unpack_L000992_1002
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 add r21, r22 ' ADDU (1)
 mov r2, ##@C_sb0o54_67070718_str_unpack_L000992_1003_L001004 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 adds r19, #1 ' ADDI4 coni
 mov r13, r15 ' CVI, CVU or LOAD
 cmps r13,  #0 wcz
 if_b jmp #\C_sb0o54_67070718_str_unpack_L000992_1005 ' LTI4
 cmps r13,  #10 wcz
 if_a jmp #\C_sb0o54_67070718_str_unpack_L000992_1005 ' GTI4
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sb0o54_67070718_str_unpack_L000992_1028_L001030 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o54_67070718_str_unpack_L000992_1028_L001030 ' <symbol:1028>
 long @C_sb0o54_67070718_str_unpack_L000992_1008
 long @C_sb0o54_67070718_str_unpack_L000992_1008
 long @C_sb0o54_67070718_str_unpack_L000992_1013
 long @C_sb0o54_67070718_str_unpack_L000992_1015
 long @C_sb0o54_67070718_str_unpack_L000992_1017
 long @C_sb0o54_67070718_str_unpack_L000992_1019
 long @C_sb0o54_67070718_str_unpack_L000992_1020
 long @C_sb0o54_67070718_str_unpack_L000992_1023
 long @C_sb0o54_67070718_str_unpack_L000992_1027
 long @C_sb0o54_67070718_str_unpack_L000992_1027
 long @C_sb0o54_67070718_str_unpack_L000992_1027

' Catalina Code

DAT ' code segment
C_sb0o54_67070718_str_unpack_L000992_1008
 cmps r15,  #0 wz
 if_nz jmp #\C_sb0o54_67070718_str_unpack_L000992_1011 ' NEI4
 mov r11, #1 ' reg <- coni
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_1012 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_1011
 mov r11, #0 ' reg <- coni
C_sb0o54_67070718_str_unpack_L000992_1012
 mov r2, r11 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r21 ' ADDI/P
 adds r5, r17 ' ADDI/P (3)
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o52_67070718_unpackint_L000959
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-36)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_1006 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_1013
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #4 ' reg ARG coni
 mov r4, r21 ' ADDI/P
 adds r4, r17 ' ADDI/P (3)
 mov r5, FP
 sub r5, #-(-36) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o4n_67070718_copywithendian_L000867
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_1006 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_1015
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #4 ' reg ARG coni
 mov r4, r21 ' ADDI/P
 adds r4, r17 ' ADDI/P (3)
 mov r5, FP
 sub r5, #-(-36) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o4n_67070718_copywithendian_L000867
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_1006 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_1017
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #4 ' reg ARG coni
 mov r4, r21 ' ADDI/P
 adds r4, r17 ' ADDI/P (3)
 mov r5, FP
 sub r5, #-(-36) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb0o4n_67070718_copywithendian_L000867
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_1006 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_1019
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' ADDI/P
 adds r3, r17 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_1006 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_1020
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-28)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r21 ' ADDI/P
 adds r5, r17 ' ADDI/P (3)
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sb0o52_67070718_unpackint_L000959
 add SP, #16 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, r21 ' SUBU (1)
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 cmp r11, r22 wcz 
 if_be jmp #\C_sb0o54_67070718_str_unpack_L000992_1022 ' LEU4
 mov r2, ##@C_sb0o54_67070718_str_unpack_L000992_1000_L001001 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o54_67070718_str_unpack_L000992_1022
 mov r2, r11 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21 ' ADDI/P
 adds r20, r17 ' ADDI/P (3)
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 add r21, r11 ' ADDU (1)
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_1006 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_1023
 mov r2, r21 ' ADDI/P
 adds r2, r17 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' ADDU
 add r22, r11 ' ADDU (3)
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb0o54_67070718_str_unpack_L000992_1026 ' LTU4
 mov r2, ##@C_sb0o54_67070718_str_unpack_L000992_1024_L001025 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_sb0o54_67070718_str_unpack_L000992_1026
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r21 ' ADDI/P
 adds r3, r17 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 mov r22, r11
 add r22, #1 ' ADDU4 coni
 add r21, r22 ' ADDU (1)
 jmp #\@C_sb0o54_67070718_str_unpack_L000992_1006 ' JUMPV addrg
C_sb0o54_67070718_str_unpack_L000992_1027
 subs r19, #1 ' SUBI4 coni
C_sb0o54_67070718_str_unpack_L000992_1005
C_sb0o54_67070718_str_unpack_L000992_1006
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 add r21, r22 ' ADDU (1)
C_sb0o54_67070718_str_unpack_L000992_998
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sb0o54_67070718_str_unpack_L000992_997 ' NEI4
 mov r22, r21
 add r22, #1 ' ADDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, r19
 adds r0, #1 ' ADDI4 coni
' C_sb0o54_67070718_str_unpack_L000992_993 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb0o5b_67070718_strlib_L001031 ' <symbol:strlib>
 long @C_sb0o5c_67070718_1032_L001033
 long @C_sb0oa_67070718_str_byte_L000060
 long @C_sb0o5d_67070718_1034_L001035
 long @C_sb0oc_67070718_str_char_L000072
 long @C_sb0o5e_67070718_1036_L001037
 long @C_sb0of_67070718_str_dump_L000085
 long @C_sb0o5f_67070718_1038_L001039
 long @C_sb0o2e_67070718_str_find_L000471
 long @C_sb0o5g_67070718_1040_L001041
 long @C_sb0o3n_67070718_str_format_L000678
 long @C_sb0o5h_67070718_1042_L001043
 long @C_sb0o2h_67070718_gmatch_L000483
 long @C_sb0o5i_67070718_1044_L001045
 long @C_sb0o2m_67070718_str_gsub_L000515
 long @C_sb0o5j_67070718_1046_L001047
 long @C_sb0o_67070718_str_len_L000004
 long @C_sb0o5k_67070718_1048_L001049
 long @C_sb0o6_67070718_str_lower_L000034
 long @C_sb0o5l_67070718_1050_L001051
 long @C_sb0o2f_67070718_str_match_L000473
 long @C_sb0o5m_67070718_1052_L001053
 long @C_sb0o8_67070718_str_rep_L000046
 long @C_sb0o5n_67070718_1054_L001055
 long @C_sb0o5_67070718_str_reverse_L000028
 long @C_sb0o5o_67070718_1056_L001057
 long @C_sb0o3_67070718_str_sub_L000022
 long @C_sb0o5p_67070718_1058_L001059
 long @C_sb0o7_67070718_str_upper_L000040
 long @C_sb0o5q_67070718_1060_L001061
 long @C_sb0o4o_67070718_str_pack_L000874
 long @C_sb0o5r_67070718_1062_L001063
 long @C_sb0o4v_67070718_str_packsize_L000947
 long @C_sb0o5s_67070718_1064_L001065
 long @C_sb0o54_67070718_str_unpack_L000992
 long $0
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sb0o5t_67070718_createmetatable_L001066 ' <symbol:createmetatable>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #9 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_sb0o15_67070718_stringmetamethods_L000142 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, ##@C_sb0o3_67070718_str_sub_L000022_26_L000027 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, ##@C_sb0o16_67070718_143_L000144 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_sb0o5t_67070718_createmetatable_L001066_1067 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaopen_string

 alignl ' align long
C_luaopen_string ' <symbol:luaopen_string>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_string_1069_L001070
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #17 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_sb0o5b_67070718_strlib_L001031 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb0o5t_67070718_createmetatable_L001066 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_string_1068 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import luaL_buffinitsize

' Catalina Import luaL_pushresultsize

' Catalina Import luaL_pushresult

' Catalina Import luaL_addvalue

' Catalina Import luaL_addstring

' Catalina Import luaL_addlstring

' Catalina Import luaL_prepbuffsize

' Catalina Import luaL_buffinit

' Catalina Import luaL_setfuncs

' Catalina Import luaL_error

' Catalina Import luaL_checktype

' Catalina Import luaL_checkstack

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_checknumber

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_typeerror

' Catalina Import luaL_argerror

' Catalina Import luaL_tolstring

' Catalina Import luaL_getmetafield

' Catalina Import luaL_checkversion_

' Catalina Import lua_stringtonumber

' Catalina Import lua_dump

' Catalina Import lua_callk

' Catalina Import lua_setmetatable

' Catalina Import lua_setfield

' Catalina Import lua_newuserdatauv

' Catalina Import lua_createtable

' Catalina Import lua_gettable

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushstring

' Catalina Import lua_pushlstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnumber

' Catalina Import lua_pushnil

' Catalina Import lua_arith

' Catalina Import lua_topointer

' Catalina Import lua_touserdata

' Catalina Import lua_tolstring

' Catalina Import lua_toboolean

' Catalina Import lua_tointegerx

' Catalina Import lua_tonumberx

' Catalina Import lua_typename

' Catalina Import lua_type

' Catalina Import lua_isinteger

' Catalina Import lua_isstring

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import strlen

' Catalina Import strspn

' Catalina Import strpbrk

' Catalina Import strchr

' Catalina Import memchr

' Catalina Import memcmp

' Catalina Import strcpy

' Catalina Import memcpy

' Catalina Import sprintf

' Catalina Import frexp

' Catalina Import floor

' Catalina Import __huge_val

' Catalina Import localeconv

' Catalina Import toupper

' Catalina Import tolower

' Catalina Import __ctype

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_string_1069_L001070 ' <symbol:1069>
 long $43fc0000 ' float

 alignl ' align long
C_sb0o5s_67070718_1064_L001065 ' <symbol:1064>
 byte 117
 byte 110
 byte 112
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_sb0o5r_67070718_1062_L001063 ' <symbol:1062>
 byte 112
 byte 97
 byte 99
 byte 107
 byte 115
 byte 105
 byte 122
 byte 101
 byte 0

 alignl ' align long
C_sb0o5q_67070718_1060_L001061 ' <symbol:1060>
 byte 112
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_sb0o5p_67070718_1058_L001059 ' <symbol:1058>
 byte 117
 byte 112
 byte 112
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sb0o5o_67070718_1056_L001057 ' <symbol:1056>
 byte 115
 byte 117
 byte 98
 byte 0

 alignl ' align long
C_sb0o5n_67070718_1054_L001055 ' <symbol:1054>
 byte 114
 byte 101
 byte 118
 byte 101
 byte 114
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_sb0o5m_67070718_1052_L001053 ' <symbol:1052>
 byte 114
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_sb0o5l_67070718_1050_L001051 ' <symbol:1050>
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_sb0o5k_67070718_1048_L001049 ' <symbol:1048>
 byte 108
 byte 111
 byte 119
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sb0o5j_67070718_1046_L001047 ' <symbol:1046>
 byte 108
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_sb0o5i_67070718_1044_L001045 ' <symbol:1044>
 byte 103
 byte 115
 byte 117
 byte 98
 byte 0

 alignl ' align long
C_sb0o5h_67070718_1042_L001043 ' <symbol:1042>
 byte 103
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_sb0o5g_67070718_1040_L001041 ' <symbol:1040>
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_sb0o5f_67070718_1038_L001039 ' <symbol:1038>
 byte 102
 byte 105
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_sb0o5e_67070718_1036_L001037 ' <symbol:1036>
 byte 100
 byte 117
 byte 109
 byte 112
 byte 0

 alignl ' align long
C_sb0o5d_67070718_1034_L001035 ' <symbol:1034>
 byte 99
 byte 104
 byte 97
 byte 114
 byte 0

 alignl ' align long
C_sb0o5c_67070718_1032_L001033 ' <symbol:1032>
 byte 98
 byte 121
 byte 116
 byte 101
 byte 0

 alignl ' align long
C_sb0o54_67070718_str_unpack_L000992_1024_L001025 ' <symbol:1024>
 byte 117
 byte 110
 byte 102
 byte 105
 byte 110
 byte 105
 byte 115
 byte 104
 byte 101
 byte 100
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 39
 byte 122
 byte 39
 byte 0

 alignl ' align long
C_sb0o54_67070718_str_unpack_L000992_1003_L001004 ' <symbol:1003>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 108
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_sb0o54_67070718_str_unpack_L000992_1000_L001001 ' <symbol:1000>
 byte 100
 byte 97
 byte 116
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 115
 byte 104
 byte 111
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_sb0o54_67070718_str_unpack_L000992_994_L000995 ' <symbol:994>
 byte 105
 byte 110
 byte 105
 byte 116
 byte 105
 byte 97
 byte 108
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_sb0o52_67070718_unpackint_L000959_990_L000991 ' <symbol:990>
 byte 37
 byte 100
 byte 45
 byte 98
 byte 121
 byte 116
 byte 101
 byte 32
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 32
 byte 100
 byte 111
 byte 101
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 102
 byte 105
 byte 116
 byte 32
 byte 105
 byte 110
 byte 116
 byte 111
 byte 32
 byte 76
 byte 117
 byte 97
 byte 32
 byte 73
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sb0o4v_67070718_str_packsize_L000947_956_L000957 ' <symbol:956>
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 108
 byte 116
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 97
 byte 114
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sb0o4v_67070718_str_packsize_L000947_952_L000953 ' <symbol:952>
 byte 118
 byte 97
 byte 114
 byte 105
 byte 97
 byte 98
 byte 108
 byte 101
 byte 45
 byte 108
 byte 101
 byte 110
 byte 103
 byte 116
 byte 104
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_sb0o4o_67070718_str_pack_L000874_928_L000929 ' <symbol:928>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 108
 byte 101
 byte 110
 byte 103
 byte 116
 byte 104
 byte 32
 byte 100
 byte 111
 byte 101
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 102
 byte 105
 byte 116
 byte 32
 byte 105
 byte 110
 byte 32
 byte 103
 byte 105
 byte 118
 byte 101
 byte 110
 byte 32
 byte 115
 byte 105
 byte 122
 byte 101
 byte 0

 alignl ' align long
C_sb0o4o_67070718_str_pack_L000874_917_L000918 ' <symbol:917>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 101
 byte 114
 byte 32
 byte 116
 byte 104
 byte 97
 byte 110
 byte 32
 byte 103
 byte 105
 byte 118
 byte 101
 byte 110
 byte 32
 byte 115
 byte 105
 byte 122
 byte 101
 byte 0

 alignl ' align long
C_sb0o4o_67070718_str_pack_L000874_903_L000904 ' <symbol:903>
 byte 117
 byte 110
 byte 115
 byte 105
 byte 103
 byte 110
 byte 101
 byte 100
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_sb0o4o_67070718_str_pack_L000874_892_L000893 ' <symbol:892>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_sb0o4j_67070718_getdetails_L000827_844_L000845 ' <symbol:844>
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 97
 byte 115
 byte 107
 byte 115
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 97
 byte 108
 byte 105
 byte 103
 byte 110
 byte 109
 byte 101
 byte 110
 byte 116
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 112
 byte 111
 byte 119
 byte 101
 byte 114
 byte 32
 byte 111
 byte 102
 byte 32
 byte 50
 byte 0

 alignl ' align long
C_sb0o4j_67070718_getdetails_L000827_835_L000836 ' <symbol:835>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 110
 byte 101
 byte 120
 byte 116
 byte 32
 byte 111
 byte 112
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 111
 byte 112
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 88
 byte 39
 byte 0

 alignl ' align long
C_sb0o4a_67070718_getoption_L000774_807_L000808 ' <symbol:807>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 111
 byte 112
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 99
 byte 39
 byte 0

 alignl ' align long
C_sb0o4a_67070718_getoption_L000774_797_L000798 ' <symbol:797>
 byte 109
 byte 105
 byte 115
 byte 115
 byte 105
 byte 110
 byte 103
 byte 32
 byte 115
 byte 105
 byte 122
 byte 101
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 111
 byte 112
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 99
 byte 39
 byte 0

 alignl ' align long
C_sb0o47_67070718_getnumlimit_L000765_770_L000771 ' <symbol:770>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 114
 byte 97
 byte 108
 byte 32
 byte 115
 byte 105
 byte 122
 byte 101
 byte 32
 byte 40
 byte 37
 byte 100
 byte 41
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 108
 byte 105
 byte 109
 byte 105
 byte 116
 byte 115
 byte 32
 byte 91
 byte 49
 byte 44
 byte 37
 byte 100
 byte 93
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_740_L000741 ' <symbol:740>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 99
 byte 111
 byte 110
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 116
 byte 111
 byte 32
 byte 39
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 39
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_735_L000736 ' <symbol:735>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 99
 byte 111
 byte 110
 byte 116
 byte 97
 byte 105
 byte 110
 byte 115
 byte 32
 byte 122
 byte 101
 byte 114
 byte 111
 byte 115
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_729_L000730 ' <symbol:729>
 byte 115
 byte 112
 byte 101
 byte 99
 byte 105
 byte 102
 byte 105
 byte 101
 byte 114
 byte 32
 byte 39
 byte 37
 byte 37
 byte 113
 byte 39
 byte 32
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 104
 byte 97
 byte 118
 byte 101
 byte 32
 byte 109
 byte 111
 byte 100
 byte 105
 byte 102
 byte 105
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_723_L000724 ' <symbol:723>
 byte 40
 byte 110
 byte 117
 byte 108
 byte 108
 byte 41
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_716_L000717 ' <symbol:716>
 byte 45
 byte 43
 byte 35
 byte 48
 byte 32
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_713_L000714 ' <symbol:713>
 byte 45
 byte 35
 byte 48
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_710_L000711 ' <symbol:710>
 byte 45
 byte 48
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_706_L000707 ' <symbol:706>
 byte 45
 byte 43
 byte 48
 byte 32
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_703_L000704 ' <symbol:703>
 byte 45
 byte 0

 alignl ' align long
C_sb0o3n_67070718_str_format_L000678_697_L000698 ' <symbol:697>
 byte 110
 byte 111
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_sb0o3j_67070718_getformat_L000668_674_L000675 ' <symbol:674>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 40
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 41
 byte 0

 alignl ' align long
C_sb0o3j_67070718_getformat_L000668_670_L000671 ' <symbol:670>
 byte 45
 byte 43
 byte 35
 byte 48
 byte 32
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 46
 byte 0

 alignl ' align long
C_sb0o3h_67070718_checkformat_L000657_666_L000667 ' <symbol:666>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 99
 byte 111
 byte 110
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 32
 byte 115
 byte 112
 byte 101
 byte 99
 byte 105
 byte 102
 byte 105
 byte 99
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 58
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_sb0o3a_67070718_addliteral_L000629_646_L000647 ' <symbol:646>
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 104
 byte 97
 byte 115
 byte 32
 byte 110
 byte 111
 byte 32
 byte 108
 byte 105
 byte 116
 byte 101
 byte 114
 byte 97
 byte 108
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 0

 alignl ' align long
C_sb0o3a_67070718_addliteral_L000629_640_L000641 ' <symbol:640>
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sb0o3a_67070718_addliteral_L000629_638_L000639 ' <symbol:638>
 byte 48
 byte 120
 byte 37
 byte 120
 byte 0

 alignl ' align long
C_sb0o34_67070718_quotefloat_L000607_627_L000628 ' <symbol:627>
 byte 37
 byte 115
 byte 0

 alignl ' align long
C_sb0o34_67070718_quotefloat_L000607_621_L000622 ' <symbol:621>
 byte 37
 byte 97
 byte 0

 alignl ' align long
C_sb0o34_67070718_quotefloat_L000607_619_L000620 ' <symbol:619>
 byte 40
 byte 48
 byte 47
 byte 48
 byte 41
 byte 0

 alignl ' align long
C_sb0o34_67070718_quotefloat_L000607_615_L000616 ' <symbol:615>
 byte 45
 byte 49
 byte 101
 byte 57
 byte 57
 byte 57
 byte 57
 byte 0

 alignl ' align long
C_sb0o34_67070718_quotefloat_L000607_611_L000612 ' <symbol:611>
 byte 49
 byte 101
 byte 57
 byte 57
 byte 57
 byte 57
 byte 0

 alignl ' align long
C_sb0o31_67070718_addquoted_L000584_603_L000604 ' <symbol:603>
 byte 92
 byte 37
 byte 48
 byte 51
 byte 100
 byte 0

 alignl ' align long
C_sb0o31_67070718_addquoted_L000584_601_L000602 ' <symbol:601>
 byte 92
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sb0o2v_67070718_lua_number2strx_L000572_582_L000583 ' <symbol:582>
 byte 109
 byte 111
 byte 100
 byte 105
 byte 102
 byte 105
 byte 101
 byte 114
 byte 115
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 39
 byte 37
 byte 37
 byte 97
 byte 39
 byte 47
 byte 39
 byte 37
 byte 37
 byte 65
 byte 39
 byte 32
 byte 110
 byte 111
 byte 116
 byte 32
 byte 105
 byte 109
 byte 112
 byte 108
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sb0o2p_67070718_num2straux_L000547_570_L000571 ' <symbol:570>
 byte 112
 byte 37
 byte 43
 byte 100
 byte 0

 alignl ' align long
C_sb0o2p_67070718_num2straux_L000547_563_L000564 ' <symbol:563>
 long $41800000 ' float

 alignl ' align long
C_sb0o2p_67070718_num2straux_L000547_559_L000560 ' <symbol:559>
 byte 37
 byte 46
 byte 55
 byte 103
 byte 120
 byte 48
 byte 112
 byte 43
 byte 48
 byte 0

 alignl ' align long
C_sb0o2p_67070718_num2straux_L000547_557_L000558 ' <symbol:557>
 long $0 ' float

 alignl ' align long
C_sb0o2p_67070718_num2straux_L000547_553_L000554 ' <symbol:553>
 byte 37
 byte 46
 byte 55
 byte 103
 byte 0

 alignl ' align long
C_sb0o2m_67070718_str_gsub_L000515_520_L000521 ' <symbol:520>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 47
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 47
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sb0o2k_67070718_add_value_L000503_513_L000514 ' <symbol:513>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 114
 byte 101
 byte 112
 byte 108
 byte 97
 byte 99
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 40
 byte 97
 byte 32
 byte 37
 byte 115
 byte 41
 byte 0

 alignl ' align long
C_sb0o2i_67070718_add_s_L000487_501_L000502 ' <symbol:501>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 117
 byte 115
 byte 101
 byte 32
 byte 111
 byte 102
 byte 32
 byte 39
 byte 37
 byte 99
 byte 39
 byte 32
 byte 105
 byte 110
 byte 32
 byte 114
 byte 101
 byte 112
 byte 108
 byte 97
 byte 99
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_sb0o29_67070718_nospecials_L000435_442_L000443 ' <symbol:442>
 byte 94
 byte 36
 byte 42
 byte 43
 byte 63
 byte 46
 byte 40
 byte 91
 byte 37
 byte 45
 byte 0

 alignl ' align long
C_sb0o25_67070718_get_onecapture_L000410_418_L000419 ' <symbol:418>
 byte 117
 byte 110
 byte 102
 byte 105
 byte 110
 byte 105
 byte 115
 byte 104
 byte 101
 byte 100
 byte 32
 byte 99
 byte 97
 byte 112
 byte 116
 byte 117
 byte 114
 byte 101
 byte 0

 alignl ' align long
C_sb0o17_67070718_match_L000146_362_L000363 ' <symbol:362>
 byte 109
 byte 105
 byte 115
 byte 115
 byte 105
 byte 110
 byte 103
 byte 32
 byte 39
 byte 91
 byte 39
 byte 32
 byte 97
 byte 102
 byte 116
 byte 101
 byte 114
 byte 32
 byte 39
 byte 37
 byte 37
 byte 102
 byte 39
 byte 32
 byte 105
 byte 110
 byte 32
 byte 112
 byte 97
 byte 116
 byte 116
 byte 101
 byte 114
 byte 110
 byte 0

 alignl ' align long
C_sb0o17_67070718_match_L000146_333_L000334 ' <symbol:333>
 byte 112
 byte 97
 byte 116
 byte 116
 byte 101
 byte 114
 byte 110
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 99
 byte 111
 byte 109
 byte 112
 byte 108
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_sb0o1q_67070718_start_capture_L000314_318_L000319 ' <symbol:318>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 99
 byte 97
 byte 112
 byte 116
 byte 117
 byte 114
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sb0o1m_67070718_matchbalance_L000277_281_L000282 ' <symbol:281>
 byte 109
 byte 97
 byte 108
 byte 102
 byte 111
 byte 114
 byte 109
 byte 101
 byte 100
 byte 32
 byte 112
 byte 97
 byte 116
 byte 116
 byte 101
 byte 114
 byte 110
 byte 32
 byte 40
 byte 109
 byte 105
 byte 115
 byte 115
 byte 105
 byte 110
 byte 103
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
 byte 116
 byte 115
 byte 32
 byte 116
 byte 111
 byte 32
 byte 39
 byte 37
 byte 37
 byte 98
 byte 39
 byte 41
 byte 0

 alignl ' align long
C_sb0o1c_67070718_classend_L000165_183_L000184 ' <symbol:183>
 byte 109
 byte 97
 byte 108
 byte 102
 byte 111
 byte 114
 byte 109
 byte 101
 byte 100
 byte 32
 byte 112
 byte 97
 byte 116
 byte 116
 byte 101
 byte 114
 byte 110
 byte 32
 byte 40
 byte 109
 byte 105
 byte 115
 byte 115
 byte 105
 byte 110
 byte 103
 byte 32
 byte 39
 byte 93
 byte 39
 byte 41
 byte 0

 alignl ' align long
C_sb0o1c_67070718_classend_L000165_173_L000174 ' <symbol:173>
 byte 109
 byte 97
 byte 108
 byte 102
 byte 111
 byte 114
 byte 109
 byte 101
 byte 100
 byte 32
 byte 112
 byte 97
 byte 116
 byte 116
 byte 101
 byte 114
 byte 110
 byte 32
 byte 40
 byte 101
 byte 110
 byte 100
 byte 115
 byte 32
 byte 119
 byte 105
 byte 116
 byte 104
 byte 32
 byte 39
 byte 37
 byte 37
 byte 39
 byte 41
 byte 0

 alignl ' align long
C_sb0o1a_67070718_capture_to_close_L000155_163_L000164 ' <symbol:163>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 112
 byte 97
 byte 116
 byte 116
 byte 101
 byte 114
 byte 110
 byte 32
 byte 99
 byte 97
 byte 112
 byte 116
 byte 117
 byte 114
 byte 101
 byte 0

 alignl ' align long
C_sb0o18_67070718_check_capture_L000147_153_L000154 ' <symbol:153>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 99
 byte 97
 byte 112
 byte 116
 byte 117
 byte 114
 byte 101
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 37
 byte 37
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sb0o16_67070718_143_L000144 ' <symbol:143>
 byte 95
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_sb0o13_67070718_arith_unm_L000138_140_L000141 ' <symbol:140>
 byte 95
 byte 95
 byte 117
 byte 110
 byte 109
 byte 0

 alignl ' align long
C_sb0o11_67070718_arith_idiv_L000134_136_L000137 ' <symbol:136>
 byte 95
 byte 95
 byte 105
 byte 100
 byte 105
 byte 118
 byte 0

 alignl ' align long
C_sb0ov_67070718_arith_div_L000130_132_L000133 ' <symbol:132>
 byte 95
 byte 95
 byte 100
 byte 105
 byte 118
 byte 0

 alignl ' align long
C_sb0ot_67070718_arith_pow_L000126_128_L000129 ' <symbol:128>
 byte 95
 byte 95
 byte 112
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_sb0or_67070718_arith_mod_L000122_124_L000125 ' <symbol:124>
 byte 95
 byte 95
 byte 109
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_sb0op_67070718_arith_mul_L000118_120_L000121 ' <symbol:120>
 byte 95
 byte 95
 byte 109
 byte 117
 byte 108
 byte 0

 alignl ' align long
C_sb0on_67070718_arith_sub_L000114_116_L000117 ' <symbol:116>
 byte 95
 byte 95
 byte 115
 byte 117
 byte 98
 byte 0

 alignl ' align long
C_sb0ol_67070718_arith_add_L000110_112_L000113 ' <symbol:112>
 byte 95
 byte 95
 byte 97
 byte 100
 byte 100
 byte 0

 alignl ' align long
C_sb0oi_67070718_trymt_L000099_104_L000105 ' <symbol:104>
 byte 97
 byte 116
 byte 116
 byte 101
 byte 109
 byte 112
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 37
 byte 115
 byte 32
 byte 97
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 119
 byte 105
 byte 116
 byte 104
 byte 32
 byte 97
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 0

 alignl ' align long
C_sb0of_67070718_str_dump_L000085_89_L000090 ' <symbol:89>
 byte 117
 byte 110
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 116
 byte 111
 byte 32
 byte 100
 byte 117
 byte 109
 byte 112
 byte 32
 byte 103
 byte 105
 byte 118
 byte 101
 byte 110
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sb0oc_67070718_str_char_L000072_78_L000079 ' <symbol:78>
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 114
 byte 97
 byte 110
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sb0oa_67070718_str_byte_L000060_66_L000067 ' <symbol:66>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 115
 byte 108
 byte 105
 byte 99
 byte 101
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_sb0o8_67070718_str_rep_L000046_53_L000054 ' <symbol:53>
 byte 114
 byte 101
 byte 115
 byte 117
 byte 108
 byte 116
 byte 105
 byte 110
 byte 103
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 97
 byte 114
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sb0o3_67070718_str_sub_L000022_26_L000027 ' <symbol:26>
 byte 0

' Catalina Code

DAT ' code segment
' end
