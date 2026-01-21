' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sajo_696de09a_luai_makeseed_L000015 ' <symbol:luai_makeseed>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_time ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r21, #0 ' reg <- coni
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov r4, r21 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 add r22, #4 ' ADDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov r4, r21 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 add r22, #4 ' ADDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r22, ##@C_lua_newstate ' reg <- addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov r4, r21 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 add r22, #4 ' ADDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__hash
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sajo_696de09a_luai_makeseed_L000015_16 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Export luaE_setdebt

 alignl ' align long
C_luaE__setdebt ' <symbol:luaE_setdebt>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r23, r22 ' CVI, CVU or LOAD
 mov r22, ##2147483647 ' reg <- con
 subs r22, r23
 neg r22, r22 ' SUBI/P (2)
 cmps r2, r22 wcz
 if_ae jmp #\C_luaE__setdebt_18 ' GEI4
 mov r22, ##2147483647 ' reg <- con
 mov r2, r23 ' SUBI/P
 subs r2, r22 ' SUBI/P (3)
C_luaE__setdebt_18
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 mov r20, r23 ' SUBI/P
 subs r20, r2 ' SUBI/P (3)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 wrlong r2, r22 ' ASGNI4 reg reg
' C_luaE__setdebt_17 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_setcstacklimit

 alignl ' align long
C_lua_setcstacklimit ' <symbol:lua_setcstacklimit>
 mov r0, #200 ' reg <- coni
' C_lua_setcstacklimit_20 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export luaE_extendCI

 alignl ' align long
C_luaE__extendC_I_ ' <symbol:luaE_extendCI>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #36 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdword r20, r22 ' reg <- CVUI4 INDIRU2 reg
 adds r20, #1 ' ADDI4 coni
 wrword r20, r22 ' ASGNU2 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_luaE__extendC_I__21 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sajo1_696de09a_freeC_I__L000022 ' <symbol:freeCI>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_sajo1_696de09a_freeC_I__L000022_25 ' JUMPV addrg
C_sajo1_696de09a_freeC_I__L000022_24
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, #36 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdword r20, r22 ' reg <- CVUI4 INDIRU2 reg
 subs r20, #1 ' SUBI4 coni
 wrword r20, r22 ' ASGNU2 reg reg
C_sajo1_696de09a_freeC_I__L000022_25
 mov r21, r19 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sajo1_696de09a_freeC_I__L000022_24  ' NEU4
' C_sajo1_696de09a_freeC_I__L000022_23 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaE_shrinkCI

 alignl ' align long
C_luaE__shrinkC_I_ ' <symbol:luaE_shrinkCI>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaE__shrinkC_I__31  ' NEU4
 jmp #\@C_luaE__shrinkC_I__27 ' JUMPV addrg
C_luaE__shrinkC_I__30
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdword r20, r22 ' reg <- CVUI4 INDIRU2 reg
 subs r20, #1 ' SUBI4 coni
 wrword r20, r22 ' ASGNU2 reg reg
 mov r2, #36 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaE__shrinkC_I__33  ' NEU4
 jmp #\@C_luaE__shrinkC_I__32 ' JUMPV addrg
C_luaE__shrinkC_I__33
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r19, r17 ' CVI, CVU or LOAD
C_luaE__shrinkC_I__31
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaE__shrinkC_I__30  ' NEU4
C_luaE__shrinkC_I__32
C_luaE__shrinkC_I__27
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaE_checkcstack

 alignl ' align long
C_luaE__checkcstack ' <symbol:luaE_checkcstack>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #200 wz
 if_nz jmp #\C_luaE__checkcstack_36  ' NEU4
 mov r2, ##@C_luaE__checkcstack_38_L000039 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
 jmp #\@C_luaE__checkcstack_37 ' JUMPV addrg
C_luaE__checkcstack_36
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #220 wcz 
 if_b jmp #\C_luaE__checkcstack_40 ' LTU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaD__errerr ' CALL addrg
C_luaE__checkcstack_40
C_luaE__checkcstack_37
' C_luaE__checkcstack_35 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaE_incCstack

 alignl ' align long
C_luaE__incC_stack ' <symbol:luaE_incCstack>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #200 wcz 
 if_b jmp #\C_luaE__incC_stack_43 ' LTU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaE__checkcstack ' CALL addrg
C_luaE__incC_stack_43
' C_luaE__incC_stack_42 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sajo3_696de09a_stack_init_L000045 ' <symbol:stack_init>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, #360 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r19, #0 ' reg <- coni
C_sajo3_696de09a_stack_init_L000045_47
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sajo3_696de09a_stack_init_L000045_48 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #45 wcz
 if_b jmp #\C_sajo3_696de09a_stack_init_L000045_47 ' LTI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #320 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r17, r23
 adds r17, #52 ' ADDP4 coni
 mov r22, ##0 ' reg <- con
 mov r20, r17
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r17
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #34 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrword r20, r22 ' ASGNI2 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #160 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
' C_sajo3_696de09a_stack_init_L000045_46 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sajo4_696de09a_freestack_L000051 ' <symbol:freestack>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sajo4_696de09a_freestack_L000051_53  ' NEU4
 jmp #\@C_sajo4_696de09a_freestack_L000051_52 ' JUMPV addrg
C_sajo4_696de09a_freestack_L000051_53
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sajo1_696de09a_freeC_I__L000022 ' CALL addrg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r22 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #8 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0
 adds r20, #5 ' ADDI4 coni
 mov r2, r20
 shl r2, #3 ' LSHU4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
C_sajo4_696de09a_freestack_L000051_52
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sajo5_696de09a_init_registry_L000055 ' <symbol:init_registry>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__new ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r17, r21
 adds r17, #36 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #72 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #8 ' ADDP4 coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__new ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sajo5_696de09a_init_registry_L000055_56 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sajo6_696de09a_f_luaopen_L000057 ' <symbol:f_luaopen>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sajo3_696de09a_stack_init_L000045
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sajo5_696de09a_init_registry_L000055
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaS__init ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaT__init ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaX__init ' CALL addrg
 mov r22, r19
 adds r22, #62 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #48 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sajo6_696de09a_f_luaopen_L000057_58 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sajo7_696de09a_preinit_thread_L000059 ' <symbol:preinit_thread>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #28 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r3
 adds r22, #44 ' ADDP4 coni
 wrlong r3, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #96 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r3
 adds r22, #48 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #88 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #112 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #104 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #7 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #108 ' ADDP4 coni
 mov r20, r3
 adds r20, #104 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #32 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #6 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #92 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r3
 adds r22, #100 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_sajo7_696de09a_preinit_thread_L000059_60 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sajo8_696de09a_close_state_L000061 ' <symbol:close_state>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sajo8_696de09a_close_state_L000061_63 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__freeallobjects ' CALL addrg
 jmp #\@C_sajo8_696de09a_close_state_L000061_64 ' JUMPV addrg
C_sajo8_696de09a_close_state_L000061_63
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__closeprotected
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__freeallobjects ' CALL addrg
C_sajo8_696de09a_close_state_L000061_64
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r2, r20
 shl r2, #2 ' LSHU4 coni
 adds r22, #24 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sajo4_696de09a_freestack_L000051 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##840 ' reg ARG con
 mov r22, ##-4 ' reg <- con
 mov r4, r23 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #12 ' CALL indirect
' C_sajo8_696de09a_close_state_L000061_62 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_newthread

 alignl ' align long
C_lua_newthread ' <symbol:lua_newthread>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_newthread_66 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_newthread_66
 mov r2, #4 ' reg ARG coni
 mov r3, #120 ' reg ARG coni
 mov r4, #8 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__newobjdt
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #72 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sajo7_696de09a_preinit_thread_L000059
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #112 ' ADDP4 coni
 mov r20, r23
 adds r20, #112 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #104 ' ADDP4 coni
 mov r20, r23
 adds r20, #104 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #88 ' ADDP4 coni
 mov r20, r23
 adds r20, #88 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #108 ' ADDP4 coni
 mov r20, r21
 adds r20, #104 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, #4 ' reg ARG coni
 mov r22, ##-4 ' reg <- con
 mov r20, r19
 adds r20, #144 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r3, r20 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r4, r21 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sajo3_696de09a_stack_init_L000045
 add SP, #4 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_lua_newthread_65 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaE_freethread

 alignl ' align long
C_luaE__freethread ' <symbol:luaE_freethread>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##-4 ' reg <- con
 mov r19, r21 ' ADDI/P
 adds r19, r22 ' ADDI/P (3)
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__closeupval
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sajo4_696de09a_freestack_L000051 ' CALL addrg
 mov r2, #120 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
' C_luaE__freethread_68 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaE_resetthread

 alignl ' align long
C_luaE__resetthread ' <symbol:luaE_resetthread>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r19 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #34 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrword r20, r22 ' ASGNU2 reg reg
 cmps r21,  #1 wz
 if_nz jmp #\C_luaE__resetthread_70 ' NEI4
 mov r21, #0 ' reg <- coni
C_luaE__resetthread_70
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__closeprotected
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz
 if_z jmp #\C_luaE__resetthread_72 ' EQI4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #8 ' ADDP4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__seterrorobj
 add SP, #8 ' CALL addrg
 jmp #\@C_luaE__resetthread_73 ' JUMPV addrg
C_luaE__resetthread_72
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaE__resetthread_73
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #160 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, #0 ' reg ARG coni
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r3, r0 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__reallocstack
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
' C_luaE__resetthread_69 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_closethread

 alignl ' align long
C_lua_closethread ' <symbol:lua_closethread>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_closethread_76 ' EQU4
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff ' reg <- con
 mov r19, r22 ' BANDI/U
 and r19, r20 ' BANDI/U (3)
 jmp #\@C_lua_closethread_77 ' JUMPV addrg
C_lua_closethread_76
 mov r19, #0 ' reg <- coni
C_lua_closethread_77
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 wrlong r19, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__resetthread
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_closethread_74 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_resetthread

 alignl ' align long
C_lua_resetthread ' <symbol:lua_resetthread>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_closethread
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_resetthread_78 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_newstate

 alignl ' align long
C_lua_newstate ' <symbol:lua_newstate>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##840 ' reg ARG con
 mov r3, #8 ' reg ARG coni
 mov r4, ##0 ' reg ARG con
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 mov RI, r23
 calld PA,#CALI
 add SP, #12 ' CALL indirect
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_lua_newstate_80  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_lua_newstate_79 ' JUMPV addrg
C_lua_newstate_80
 mov r15, r13
 adds r15, #4 ' ADDP4 coni
 mov r19, r13
 adds r19, #120 ' ADDP4 coni
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #8 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #56 ' ADDP4 coni
 mov r20, #8 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov r20, r19
 adds r20, #56 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sajo7_696de09a_preinit_thread_L000059
 add SP, #4 ' CALL addrg
 mov r22, r19
 adds r22, #68 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, ##0 ' reg <- con
 wrlong r22, r15 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #96 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$10000 ' reg <- con
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 wrlong r23, r19 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, ##712 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, ##716 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #144 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sajo_696de09a_luai_makeseed_L000015 ' CALL addrg
 mov r20, r19
 adds r20, #52 ' ADDP4 coni
 wrlong r0, r20 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #62 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #28 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r20, r19
 adds r20, #32 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #24 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #40 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #140 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #57 ' ADDP4 coni
 mov r20, #8 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #58 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #59 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #63 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##0 ' reg <- con
 mov r20, r19
 adds r20, #104 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #100 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #76 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, ##0 ' reg <- con
 mov r20, r19
 adds r20, #116 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #112 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #108 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #120 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, ##0 ' reg <- con
 mov r20, r19
 adds r20, #132 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #128 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #124 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #72 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, ##0 ' reg <- con
 mov r20, r19
 adds r20, #84 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #80 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, ##0 ' reg <- con
 mov r20, r19
 adds r20, #96 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #92 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r19
 adds r20, #88 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #136 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov r20, ##840 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r11, r19
 adds r11, #44 ' ADDP4 coni
 mov r22, #0 ' reg <- coni
 wrlong r22, r11 ' ASGNI4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #64 ' ADDP4 coni
 mov r20, #50 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #65 ' ADDP4 coni
 mov r20, #25 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #66 ' ADDP4 coni
 mov r20, #13 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #61 ' ADDP4 coni
 mov r20, #25 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #60 ' ADDP4 coni
 mov r20, #20 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r17, #0 ' reg <- coni
C_lua_newstate_82
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, r19
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_newstate_83 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #9 wcz
 if_b jmp #\C_lua_newstate_82 ' LTI4
 mov r2, ##0 ' reg ARG con
 mov r3, ##@C_sajo6_696de09a_f_luaopen_L000057 ' reg ARG ADDRG
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__rawrunprotected
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_lua_newstate_86 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sajo8_696de09a_close_state_L000061 ' CALL addrg
 mov r15, ##0 ' reg <- con
C_lua_newstate_86
 mov r0, r15 ' CVI, CVU or LOAD
C_lua_newstate_79
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_close

 alignl ' align long
C_lua_close ' <symbol:lua_close>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #144 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sajo8_696de09a_close_state_L000061 ' CALL addrg
' C_lua_close_88 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaE_warning

 alignl ' align long
C_luaE__warning ' <symbol:luaE_warning>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##712 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_luaE__warning_90 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##716 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 mov RI, r22
 calld PA,#CALI
 add SP, #8 ' CALL indirect
C_luaE__warning_90
' C_luaE__warning_89 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaE_warnerror

 alignl ' align long
C_luaE__warnerror ' <symbol:luaE_warnerror>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r19, r22 ' ADDI/P
 adds r19, r20 ' ADDI/P (3)
 mov r22, #4 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_luaE__warnerror_96 ' NEI4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #16 ' ADDP4 coni
 jmp #\@C_luaE__warnerror_97 ' JUMPV addrg
C_luaE__warnerror_96
 mov r17, ##@C_luaE__warnerror_93_L000094 ' reg <- addrg
C_luaE__warnerror_97
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_luaE__warnerror_98_L000099 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__warning
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__warning
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C_luaE__warnerror_100_L000101 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__warning
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__warning
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_luaE__warnerror_102_L000103 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__warning
 add SP, #8 ' CALL addrg
' C_luaE__warnerror_92 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import time

' Catalina Import luaH_resize

' Catalina Import luaH_new

' Catalina Import luaS_init

' Catalina Import luaS_hash

' Catalina Import luaX_init

' Catalina Import luaC_newobjdt

' Catalina Import luaC_step

' Catalina Import luaC_freeallobjects

' Catalina Import luaF_closeupval

' Catalina Import luaD_rawrunprotected

' Catalina Import luaD_reallocstack

' Catalina Import luaD_closeprotected

' Catalina Import luaD_seterrorobj

' Catalina Import luaD_errerr

' Catalina Import luaG_runerror

' Catalina Import luaM_malloc_

' Catalina Import luaM_free_

' Catalina Import luaT_init

' Catalina Import memcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaE__warnerror_102_L000103 ' <symbol:102>
 byte 41
 byte 0

 alignl ' align long
C_luaE__warnerror_100_L000101 ' <symbol:100>
 byte 32
 byte 40
 byte 0

 alignl ' align long
C_luaE__warnerror_98_L000099 ' <symbol:98>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 105
 byte 110
 byte 32
 byte 0

 alignl ' align long
C_luaE__warnerror_93_L000094 ' <symbol:93>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 111
 byte 98
 byte 106
 byte 101
 byte 99
 byte 116
 byte 32
 byte 105
 byte 115
 byte 32
 byte 110
 byte 111
 byte 116
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
C_luaE__checkcstack_38_L000039 ' <symbol:38>
 byte 67
 byte 32
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
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

' Catalina Code

DAT ' code segment
' end
