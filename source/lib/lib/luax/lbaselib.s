' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s3fs_670edcd6_luaB__print_L000004 ' <symbol:luaB_print>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, #1 ' reg <- coni
 jmp #\@C_s3fs_670edcd6_luaB__print_L000004_9 ' JUMPV addrg
C_s3fs_670edcd6_luaB__print_L000004_6
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__tolstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wcz
 if_be jmp #\C_s3fs_670edcd6_luaB__print_L000004_10 ' LEI4
 mov r2, ##@C___stdout ' reg ARG ADDRG
 mov r22, #1 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, ##@C_s3fs_670edcd6_luaB__print_L000004_12_L000013 ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
C_s3fs_670edcd6_luaB__print_L000004_10
 mov r2, ##@C___stdout ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, #1 ' reg ARG coni
 mov r5, r17 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_s3fs_670edcd6_luaB__print_L000004_7 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s3fs_670edcd6_luaB__print_L000004_9
 cmps r21, r19 wcz
 if_be jmp #\C_s3fs_670edcd6_luaB__print_L000004_6 ' LEI4
 mov r2, ##@C___stdout ' reg ARG ADDRG
 mov r22, #1 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, ##@C_s3fs_670edcd6_luaB__print_L000004_14_L000015 ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 mov r2, ##@C___stdout ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_fflush ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_s3fs_670edcd6_luaB__print_L000004_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs3_670edcd6_luaB__warn_L000016 ' <symbol:luaB_warn>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, #2 ' reg <- coni
 jmp #\@C_s3fs3_670edcd6_luaB__warn_L000016_21 ' JUMPV addrg
C_s3fs3_670edcd6_luaB__warn_L000016_18
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
' C_s3fs3_670edcd6_luaB__warn_L000016_19 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s3fs3_670edcd6_luaB__warn_L000016_21
 cmps r21, r19 wcz
 if_be jmp #\C_s3fs3_670edcd6_luaB__warn_L000016_18 ' LEI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_s3fs3_670edcd6_luaB__warn_L000016_25 ' JUMPV addrg
C_s3fs3_670edcd6_luaB__warn_L000016_22
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_warning
 add SP, #8 ' CALL addrg
' C_s3fs3_670edcd6_luaB__warn_L000016_23 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s3fs3_670edcd6_luaB__warn_L000016_25
 cmps r21, r19 wcz
 if_b jmp #\C_s3fs3_670edcd6_luaB__warn_L000016_22 ' LTI4
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_warning
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_s3fs3_670edcd6_luaB__warn_L000016_17 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs4_670edcd6_b_str2int_L000026 ' <symbol:b_str2int>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, ##@C_s3fs4_670edcd6_b_str2int_L000026_28_L000029 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 adds r23, r0 ' ADDI/P (2)
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C_s3fs4_670edcd6_b_str2int_L000026_30 ' NEI4
 mov r22, #1 ' reg <- coni
 adds r23, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_s3fs4_670edcd6_b_str2int_L000026_31 ' JUMPV addrg
C_s3fs4_670edcd6_b_str2int_L000026_30
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #43 wz
 if_nz jmp #\C_s3fs4_670edcd6_b_str2int_L000026_32 ' NEI4
 adds r23, #1 ' ADDP4 coni
C_s3fs4_670edcd6_b_str2int_L000026_32
C_s3fs4_670edcd6_b_str2int_L000026_31
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s3fs4_670edcd6_b_str2int_L000026_34 ' NEI4
 mov r0, ##0 ' RET con
 jmp #\@C_s3fs4_670edcd6_b_str2int_L000026_27 ' JUMPV addrg
C_s3fs4_670edcd6_b_str2int_L000026_34
C_s3fs4_670edcd6_b_str2int_L000026_37
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_ae jmp #\C_s3fs4_670edcd6_b_str2int_L000026_41 ' GEU4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 mov r13, r22
 subs r13, #48 ' SUBI4 coni
 jmp #\@C_s3fs4_670edcd6_b_str2int_L000026_42 ' JUMPV addrg
C_s3fs4_670edcd6_b_str2int_L000026_41
 rdbyte r2, r23 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_toupper ' CALL addrg
 mov r22, r0
 subs r22, #65 ' SUBI4 coni
 mov r13, r22
 adds r13, #10 ' ADDI4 coni
C_s3fs4_670edcd6_b_str2int_L000026_42
 mov r15, r13 ' CVI, CVU or LOAD
 cmps r15, r21 wcz
 if_b jmp #\C_s3fs4_670edcd6_b_str2int_L000026_43 ' LTI4
 mov r0, ##0 ' RET con
 jmp #\@C_s3fs4_670edcd6_b_str2int_L000026_27 ' JUMPV addrg
C_s3fs4_670edcd6_b_str2int_L000026_43
 mov r22, r21 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r17, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r15 ' CVI, CVU or LOAD
 mov r17, r0 ' ADDU
 add r17, r22 ' ADDU (3)
 adds r23, #1 ' ADDP4 coni
' C_s3fs4_670edcd6_b_str2int_L000026_38 ' (symbol refcount = 0)
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s3fs4_670edcd6_b_str2int_L000026_37 ' NEI4
 mov r2, ##@C_s3fs4_670edcd6_b_str2int_L000026_28_L000029 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 adds r23, r0 ' ADDI/P (2)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_s3fs4_670edcd6_b_str2int_L000026_47 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' SUBU
 sub r15, r17 ' SUBU (3)
 jmp #\@C_s3fs4_670edcd6_b_str2int_L000026_48 ' JUMPV addrg
C_s3fs4_670edcd6_b_str2int_L000026_47
 mov r15, r17 ' CVI, CVU or LOAD
C_s3fs4_670edcd6_b_str2int_L000026_48
 mov r22, r15 ' CVI, CVU or LOAD
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
C_s3fs4_670edcd6_b_str2int_L000026_27
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs6_670edcd6_luaB__tonumber_L000049 ' <symbol:luaB_tonumber>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 if_a jmp #\C_s3fs6_670edcd6_luaB__tonumber_L000049_51 ' GTI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #3 wz
 if_nz jmp #\C_s3fs6_670edcd6_luaB__tonumber_L000049_53 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fs6_670edcd6_luaB__tonumber_L000049_50 ' JUMPV addrg
C_s3fs6_670edcd6_luaB__tonumber_L000049_53
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
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
 if_z jmp #\C_s3fs6_670edcd6_luaB__tonumber_L000049_55 ' EQU4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_stringtonumber
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 cmp r0, r20 wz
 if_nz jmp #\C_s3fs6_670edcd6_luaB__tonumber_L000049_55  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fs6_670edcd6_luaB__tonumber_L000049_50 ' JUMPV addrg
C_s3fs6_670edcd6_luaB__tonumber_L000049_55
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 jmp #\@C_s3fs6_670edcd6_luaB__tonumber_L000049_52 ' JUMPV addrg
C_s3fs6_670edcd6_luaB__tonumber_L000049_51
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #2 ' reg <- coni
 cmps r20, r22 wcz
 if_a jmp #\C_s3fs6_670edcd6_luaB__tonumber_L000049_60 ' GTI4
 cmps r22,  #36 wcz
 if_be jmp #\C_s3fs6_670edcd6_luaB__tonumber_L000049_59 ' LEI4
C_s3fs6_670edcd6_luaB__tonumber_L000049_60
 mov r2, ##@C_s3fs6_670edcd6_luaB__tonumber_L000049_57_L000058 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s3fs6_670edcd6_luaB__tonumber_L000049_59
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s3fs4_670edcd6_b_str2int_L000026
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 cmp r22, r20 wz
 if_nz jmp #\C_s3fs6_670edcd6_luaB__tonumber_L000049_61  ' NEU4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fs6_670edcd6_luaB__tonumber_L000049_50 ' JUMPV addrg
C_s3fs6_670edcd6_luaB__tonumber_L000049_61
C_s3fs6_670edcd6_luaB__tonumber_L000049_52
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s3fs6_670edcd6_luaB__tonumber_L000049_50
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs8_670edcd6_luaB__error_L000063 ' <symbol:luaB_error>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 if_nz jmp #\C_s3fs8_670edcd6_luaB__error_L000063_65 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_s3fs8_670edcd6_luaB__error_L000063_65 ' LEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__where
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_concat
 add SP, #4 ' CALL addrg
C_s3fs8_670edcd6_luaB__error_L000063_65
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_error ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s3fs8_670edcd6_luaB__error_L000063_64 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs9_670edcd6_luaB__getmetatable_L000067 ' <symbol:luaB_getmetatable>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s3fs9_670edcd6_luaB__getmetatable_L000067_69 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fs9_670edcd6_luaB__getmetatable_L000067_68 ' JUMPV addrg
C_s3fs9_670edcd6_luaB__getmetatable_L000067_69
 mov r2, ##@C_s3fs9_670edcd6_luaB__getmetatable_L000067_71_L000072 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s3fs9_670edcd6_luaB__getmetatable_L000067_68
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fsb_670edcd6_luaB__setmetatable_L000073 ' <symbol:luaB_setmetatable>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 cmps r21,  #0 wz
 if_z jmp #\C_s3fsb_670edcd6_luaB__setmetatable_L000073_77 ' EQI4
 cmps r21,  #5 wz
 if_z jmp #\C_s3fsb_670edcd6_luaB__setmetatable_L000073_77 ' EQI4
 mov r2, ##@C_s3fsb_670edcd6_luaB__setmetatable_L000073_75_L000076 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_s3fsb_670edcd6_luaB__setmetatable_L000073_77
 mov r2, ##@C_s3fs9_670edcd6_luaB__getmetatable_L000067_71_L000072 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s3fsb_670edcd6_luaB__setmetatable_L000073_78 ' EQI4
 mov r2, ##@C_s3fsb_670edcd6_luaB__setmetatable_L000073_80_L000081 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s3fsb_670edcd6_luaB__setmetatable_L000073_74 ' JUMPV addrg
C_s3fsb_670edcd6_luaB__setmetatable_L000073_78
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s3fsb_670edcd6_luaB__setmetatable_L000073_74
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fse_670edcd6_luaB__rawequal_L000082 ' <symbol:luaB_rawequal>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawequal
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s3fse_670edcd6_luaB__rawequal_L000082_83 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fsf_670edcd6_luaB__rawlen_L000084 ' <symbol:luaB_rawlen>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #5 wz
 if_z jmp #\C_s3fsf_670edcd6_luaB__rawlen_L000084_88 ' EQI4
 cmps r21,  #4 wz
 if_z jmp #\C_s3fsf_670edcd6_luaB__rawlen_L000084_88 ' EQI4
 mov r2, ##@C_s3fsf_670edcd6_luaB__rawlen_L000084_86_L000087 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_s3fsf_670edcd6_luaB__rawlen_L000084_88
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawlen
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s3fsf_670edcd6_luaB__rawlen_L000084_85 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fsh_670edcd6_luaB__rawget_L000089 ' <symbol:luaB_rawget>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawget
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s3fsh_670edcd6_luaB__rawget_L000089_90 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fsi_670edcd6_luaB__rawset_L000091 ' <symbol:luaB_rawset>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawset
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s3fsi_670edcd6_luaB__rawset_L000091_92 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fsj_670edcd6_pushmode_L000093 ' <symbol:pushmode>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_s3fsj_670edcd6_pushmode_L000093_95 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_s3fsj_670edcd6_pushmode_L000093_96 ' JUMPV addrg
C_s3fsj_670edcd6_pushmode_L000093_95
 cmps r21,  #11 wz
 if_nz jmp #\C_s3fsj_670edcd6_pushmode_L000093_102 ' NEI4
 mov r19, ##@C_s3fsj_670edcd6_pushmode_L000093_97_L000098 ' reg <- addrg
 jmp #\@C_s3fsj_670edcd6_pushmode_L000093_103 ' JUMPV addrg
C_s3fsj_670edcd6_pushmode_L000093_102
 mov r19, ##@C_s3fsj_670edcd6_pushmode_L000093_99_L000100 ' reg <- addrg
C_s3fsj_670edcd6_pushmode_L000093_103
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
C_s3fsj_670edcd6_pushmode_L000093_96
 mov r0, #1 ' reg <- coni
' C_s3fsj_670edcd6_pushmode_L000093_94 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_opts_L000107 ' <symbol:opts>
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_108_L000109
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_110_L000111
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_112_L000113
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_114_L000115
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_116_L000117
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_118_L000119
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_120_L000121
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_122_L000123
 long @C_s3fsj_670edcd6_pushmode_L000093_99_L000100
 long @C_s3fsj_670edcd6_pushmode_L000093_97_L000098
 long $0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_optsnum_L000125 ' <symbol:optsnum>
 long 0
 long 1
 long 2
 long 3
 long 5
 long 6
 long 7
 long 9
 long 10
 long 11

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104 ' <symbol:luaB_collectgarbage>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_opts_L000107 ' reg ARG ADDRG
 mov r3, ##@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_112_L000113 ' reg ARG ADDRG
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkoption
 add SP, #12 ' CALL addrg
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_optsnum_L000125 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #3 wcz
 if_b jmp #\C_s3fsm_670edcd6_luaB__collectgarbage_L000104_126 ' LTI4
 cmps r22,  #11 wcz
 if_a jmp #\C_s3fsm_670edcd6_luaB__collectgarbage_L000104_126 ' GTI4
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_146_L000148-12 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_146_L000148 ' <symbol:146>
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_128
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_126
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_133
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_136
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_136
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_126
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_139
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_142
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104_143

' Catalina Code

DAT ' code segment
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_128
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_s3fsm_670edcd6_luaB__collectgarbage_L000104_129 ' NEI4
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_129
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov r22, ##@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_131_L000132
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_133
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_s3fsm_670edcd6_luaB__collectgarbage_L000104_134 ' NEI4
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_134
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_136
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_s3fsm_670edcd6_luaB__collectgarbage_L000104_137 ' NEI4
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_137
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_139
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_s3fsm_670edcd6_luaB__collectgarbage_L000104_140 ' NEI4
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_140
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_142
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s3fsj_670edcd6_pushmode_L000093
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_143
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_gc
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s3fsj_670edcd6_pushmode_L000093
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_126
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_s3fsm_670edcd6_luaB__collectgarbage_L000104_144 ' NEI4
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_144
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fsm_670edcd6_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_127
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_105
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs14_670edcd6_luaB__type_L000150 ' <symbol:luaB_type>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_s3fs14_670edcd6_luaB__type_L000150_154 ' NEI4
 mov r2, ##@C_s3fs14_670edcd6_luaB__type_L000150_152_L000153 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s3fs14_670edcd6_luaB__type_L000150_154
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s3fs14_670edcd6_luaB__type_L000150_151 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs16_670edcd6_luaB__next_L000155 ' <symbol:luaB_next>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s3fs16_670edcd6_luaB__next_L000155_157 ' EQI4
 mov r0, #2 ' reg <- coni
 jmp #\@C_s3fs16_670edcd6_luaB__next_L000155_156 ' JUMPV addrg
C_s3fs16_670edcd6_luaB__next_L000155_157
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
C_s3fs16_670edcd6_luaB__next_L000155_156
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs17_670edcd6_pairscont_L000159 ' <symbol:pairscont>
 mov r0, #3 ' reg <- coni
' C_s3fs17_670edcd6_pairscont_L000159_160 ' (symbol refcount = 0)
 calld PA,#RETN


 alignl ' align long
C_s3fs18_670edcd6_luaB__pairs_L000161 ' <symbol:luaB_pairs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s3fs18_670edcd6_luaB__pairs_L000161_165_L000166 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s3fs18_670edcd6_luaB__pairs_L000161_163 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_s3fs16_670edcd6_luaB__next_L000155 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #\@C_s3fs18_670edcd6_luaB__pairs_L000161_164 ' JUMPV addrg
C_s3fs18_670edcd6_luaB__pairs_L000161_163
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s3fs17_670edcd6_pairscont_L000159 ' reg ARG ADDRG
 mov r3, #0 ' reg ARG coni
 mov r4, #3 ' reg ARG coni
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
C_s3fs18_670edcd6_luaB__pairs_L000161_164
 mov r0, #3 ' reg <- coni
' C_s3fs18_670edcd6_luaB__pairs_L000161_162 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs1a_670edcd6_ipairsaux_L000167 ' <symbol:ipairsaux>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_nz jmp #\C_s3fs1a_670edcd6_ipairsaux_L000167_170 ' NEI4
 mov r19, #1 ' reg <- coni
 jmp #\@C_s3fs1a_670edcd6_ipairsaux_L000167_171 ' JUMPV addrg
C_s3fs1a_670edcd6_ipairsaux_L000167_170
 mov r19, #2 ' reg <- coni
C_s3fs1a_670edcd6_ipairsaux_L000167_171
 mov r0, r19 ' CVI, CVU or LOAD
' C_s3fs1a_670edcd6_ipairsaux_L000167_168 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs1b_670edcd6_luaB__ipairs_L000172 ' <symbol:luaB_ipairs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_s3fs1a_670edcd6_ipairsaux_L000167 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #3 ' reg <- coni
' C_s3fs1b_670edcd6_luaB__ipairs_L000172_173 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs1c_670edcd6_load_aux_L000174 ' <symbol:load_aux>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 if_nz jmp #\C_s3fs1c_670edcd6_load_aux_L000174_176 ' NEI4
 cmps r19,  #0 wz
 if_z jmp #\C_s3fs1c_670edcd6_load_aux_L000174_178 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setupvalue
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s3fs1c_670edcd6_load_aux_L000174_180  ' NEU4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s3fs1c_670edcd6_load_aux_L000174_180
C_s3fs1c_670edcd6_load_aux_L000174_178
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fs1c_670edcd6_load_aux_L000174_175 ' JUMPV addrg
C_s3fs1c_670edcd6_load_aux_L000174_176
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
C_s3fs1c_670edcd6_load_aux_L000174_175
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs1d_670edcd6_luaB__loadfile_L000182 ' <symbol:luaB_loadfile>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, ##0 ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r3, ##0 ' reg ARG con
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_s3fs1d_670edcd6_luaB__loadfile_L000182_185 ' EQI4
 mov r21, #3 ' reg <- coni
 jmp #\@C_s3fs1d_670edcd6_luaB__loadfile_L000182_186 ' JUMPV addrg
C_s3fs1d_670edcd6_luaB__loadfile_L000182_185
 mov r21, #0 ' reg <- coni
C_s3fs1d_670edcd6_luaB__loadfile_L000182_186
 mov RI, FP
 sub RI, #-(-16)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__loadfilex
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s3fs1c_670edcd6_load_aux_L000174
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s3fs1d_670edcd6_luaB__loadfile_L000182_183 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs1e_670edcd6_generic_reader_L000187 ' <symbol:generic_reader>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, ##@C_s3fs1e_670edcd6_generic_reader_L000187_189_L000190 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s3fs1e_670edcd6_generic_reader_L000187_191 ' NEI4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
 mov r0, ##0 ' RET con
 jmp #\@C_s3fs1e_670edcd6_generic_reader_L000187_188 ' JUMPV addrg
C_s3fs1e_670edcd6_generic_reader_L000187_191
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s3fs1e_670edcd6_generic_reader_L000187_193 ' NEI4
 mov r2, ##@C_s3fs1e_670edcd6_generic_reader_L000187_195_L000196 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_s3fs1e_670edcd6_generic_reader_L000187_193
 mov r2, #5 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #5 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s3fs1e_670edcd6_generic_reader_L000187_188
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs1h_670edcd6_luaB__load_L000197 ' <symbol:luaB_load>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, ##@C_s3fs1h_670edcd6_luaB__load_L000197_199_L000200 ' reg ARG ADDRG
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_s3fs1h_670edcd6_luaB__load_L000197_202 ' EQI4
 mov r19, #4 ' reg <- coni
 jmp #\@C_s3fs1h_670edcd6_luaB__load_L000197_203 ' JUMPV addrg
C_s3fs1h_670edcd6_luaB__load_L000197_202
 mov r19, #0 ' reg <- coni
C_s3fs1h_670edcd6_luaB__load_L000197_203
 mov RI, FP
 sub RI, #-(-16)
 wrlong r19, RI ' ASGNI4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s3fs1h_670edcd6_luaB__load_L000197_204 ' EQU4
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaL__loadbufferx
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s3fs1h_670edcd6_luaB__load_L000197_205 ' JUMPV addrg
C_s3fs1h_670edcd6_luaB__load_L000197_204
 mov r2, ##0 ' reg ARG con
 mov r3, ##@C_s3fs1h_670edcd6_luaB__load_L000197_206_L000207 ' reg ARG ADDRG
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #5 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, ##0 ' reg ARG con
 mov r5, ##@C_s3fs1e_670edcd6_generic_reader_L000187 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_load
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_s3fs1h_670edcd6_luaB__load_L000197_205
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s3fs1c_670edcd6_load_aux_L000174
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s3fs1h_670edcd6_luaB__load_L000197_198 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs1k_670edcd6_dofilecont_L000208 ' <symbol:dofilecont>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 subs r0, #1 ' SUBI4 coni
' C_s3fs1k_670edcd6_dofilecont_L000208_209 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs1l_670edcd6_luaB__dofile_L000210 ' <symbol:luaB_dofile>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, ##0 ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__loadfilex
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s3fs1l_670edcd6_luaB__dofile_L000210_212 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_error ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s3fs1l_670edcd6_luaB__dofile_L000210_211 ' JUMPV addrg
C_s3fs1l_670edcd6_luaB__dofile_L000210_212
 mov r2, ##@C_s3fs1k_670edcd6_dofilecont_L000208 ' reg ARG ADDRG
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##-1 ' reg ARG con
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s3fs1k_670edcd6_dofilecont_L000208
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s3fs1l_670edcd6_luaB__dofile_L000210_211
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs1m_670edcd6_luaB__assert_L000214 ' <symbol:luaB_assert>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s3fs1m_670edcd6_luaB__assert_L000214_216 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s3fs1m_670edcd6_luaB__assert_L000214_215 ' JUMPV addrg
C_s3fs1m_670edcd6_luaB__assert_L000214_216
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s3fs1m_670edcd6_luaB__assert_L000214_218_L000219 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s3fs8_670edcd6_luaB__error_L000063 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s3fs1m_670edcd6_luaB__assert_L000214_215
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs1o_670edcd6_luaB__select_L000220 ' <symbol:luaB_select>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #4 wz
 if_nz jmp #\C_s3fs1o_670edcd6_luaB__select_L000220_222 ' NEI4
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 rdbyte r22, r0 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #35 wz
 if_nz jmp #\C_s3fs1o_670edcd6_luaB__select_L000220_222 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s3fs1o_670edcd6_luaB__select_L000220_221 ' JUMPV addrg
C_s3fs1o_670edcd6_luaB__select_L000220_222
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_ae jmp #\C_s3fs1o_670edcd6_luaB__select_L000220_224 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r21, r22 ' ADDI/P (2)
 jmp #\@C_s3fs1o_670edcd6_luaB__select_L000220_225 ' JUMPV addrg
C_s3fs1o_670edcd6_luaB__select_L000220_224
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 if_be jmp #\C_s3fs1o_670edcd6_luaB__select_L000220_226 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRI4 reg
C_s3fs1o_670edcd6_luaB__select_L000220_226
C_s3fs1o_670edcd6_luaB__select_L000220_225
 mov r22, #1 ' reg <- coni
 cmps r22, r21 wcz
 if_be jmp #\C_s3fs1o_670edcd6_luaB__select_L000220_230 ' LEI4
 mov r2, ##@C_s3fs1o_670edcd6_luaB__select_L000220_228_L000229 ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s3fs1o_670edcd6_luaB__select_L000220_230
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r21 ' SUBI/P (3)
C_s3fs1o_670edcd6_luaB__select_L000220_221
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs1q_670edcd6_finishpcall_L000231 ' <symbol:finishpcall>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 if_z jmp #\C_s3fs1q_670edcd6_finishpcall_L000231_233 ' EQI4
 cmps r21,  #1 wz
 if_z jmp #\C_s3fs1q_670edcd6_finishpcall_L000231_233 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #\@C_s3fs1q_670edcd6_finishpcall_L000231_232 ' JUMPV addrg
C_s3fs1q_670edcd6_finishpcall_L000231_233
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' SUBI/P
 subs r0, r19 ' SUBI/P (3)
C_s3fs1q_670edcd6_finishpcall_L000231_232
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s3fs1r_670edcd6_luaB__pcall_L000235 ' <symbol:luaB_pcall>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r2, ##@C_s3fs1q_670edcd6_finishpcall_L000231 ' reg ARG ADDRG
 mov r20, #0 ' reg <- coni
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r20 ' CVI, CVU or LOAD
 mov r5, ##-1 ' reg ARG con
 mov r22, r0
 subs r22, #2 ' SUBI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s3fs1q_670edcd6_finishpcall_L000231
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s3fs1r_670edcd6_luaB__pcall_L000235_236 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs1s_670edcd6_luaB__xpcall_L000237 ' <symbol:luaB_xpcall>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
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
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, ##@C_s3fs1q_670edcd6_finishpcall_L000231 ' reg ARG ADDRG
 mov r22, #2 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, ##-1 ' reg ARG con
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #2 ' SUBI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s3fs1q_670edcd6_finishpcall_L000231
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s3fs1s_670edcd6_luaB__xpcall_L000237_238 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s3fs1t_670edcd6_luaB__tostring_L000239 ' <symbol:luaB_tostring>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__tolstring
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s3fs1t_670edcd6_luaB__tostring_L000239_240 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s3fs1u_670edcd6_base_funcs_L000241 ' <symbol:base_funcs>
 long @C_s3fs1v_670edcd6_242_L000243
 long @C_s3fs1m_670edcd6_luaB__assert_L000214
 long @C_s3fs20_670edcd6_244_L000245
 long @C_s3fsm_670edcd6_luaB__collectgarbage_L000104
 long @C_s3fs21_670edcd6_246_L000247
 long @C_s3fs1l_670edcd6_luaB__dofile_L000210
 long @C_s3fs22_670edcd6_248_L000249
 long @C_s3fs8_670edcd6_luaB__error_L000063
 long @C_s3fs23_670edcd6_250_L000251
 long @C_s3fs9_670edcd6_luaB__getmetatable_L000067
 long @C_s3fs24_670edcd6_252_L000253
 long @C_s3fs1b_670edcd6_luaB__ipairs_L000172
 long @C_s3fs25_670edcd6_254_L000255
 long @C_s3fs1d_670edcd6_luaB__loadfile_L000182
 long @C_s3fs26_670edcd6_256_L000257
 long @C_s3fs1h_670edcd6_luaB__load_L000197
 long @C_s3fs27_670edcd6_258_L000259
 long @C_s3fs16_670edcd6_luaB__next_L000155
 long @C_s3fs28_670edcd6_260_L000261
 long @C_s3fs18_670edcd6_luaB__pairs_L000161
 long @C_s3fs29_670edcd6_262_L000263
 long @C_s3fs1r_670edcd6_luaB__pcall_L000235
 long @C_s3fs2a_670edcd6_264_L000265
 long @C_s3fs_670edcd6_luaB__print_L000004
 long @C_s3fs2b_670edcd6_266_L000267
 long @C_s3fs3_670edcd6_luaB__warn_L000016
 long @C_s3fs2c_670edcd6_268_L000269
 long @C_s3fse_670edcd6_luaB__rawequal_L000082
 long @C_s3fs2d_670edcd6_270_L000271
 long @C_s3fsf_670edcd6_luaB__rawlen_L000084
 long @C_s3fs2e_670edcd6_272_L000273
 long @C_s3fsh_670edcd6_luaB__rawget_L000089
 long @C_s3fs2f_670edcd6_274_L000275
 long @C_s3fsi_670edcd6_luaB__rawset_L000091
 long @C_s3fs2g_670edcd6_276_L000277
 long @C_s3fs1o_670edcd6_luaB__select_L000220
 long @C_s3fs2h_670edcd6_278_L000279
 long @C_s3fsb_670edcd6_luaB__setmetatable_L000073
 long @C_s3fs2i_670edcd6_280_L000281
 long @C_s3fs6_670edcd6_luaB__tonumber_L000049
 long @C_s3fs2j_670edcd6_282_L000283
 long @C_s3fs1t_670edcd6_luaB__tostring_L000239
 long @C_s3fs2k_670edcd6_284_L000285
 long @C_s3fs14_670edcd6_luaB__type_L000150
 long @C_s3fs2l_670edcd6_286_L000287
 long @C_s3fs1s_670edcd6_luaB__xpcall_L000237
 long @C_s3fs2m_670edcd6_288_L000289
 long $0
 long @C_s3fs2n_670edcd6_290_L000291
 long $0
 long $0
 long $0

' Catalina Export luaopen_base

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_base ' <symbol:luaopen_base>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, ##-1001000 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_s3fs1u_670edcd6_base_funcs_L000241 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s3fs2m_670edcd6_288_L000289 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r2, ##@C_luaopen_base_293_L000294 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s3fs2n_670edcd6_290_L000291 ' reg ARG ADDRG
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_base_292 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import luaL_setfuncs

' Catalina Import luaL_loadbufferx

' Catalina Import luaL_loadfilex

' Catalina Import luaL_checkoption

' Catalina Import luaL_error

' Catalina Import luaL_where

' Catalina Import luaL_checkany

' Catalina Import luaL_checktype

' Catalina Import luaL_checkstack

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_typeerror

' Catalina Import luaL_argerror

' Catalina Import luaL_tolstring

' Catalina Import luaL_getmetafield

' Catalina Import lua_setupvalue

' Catalina Import lua_stringtonumber

' Catalina Import lua_concat

' Catalina Import lua_next

' Catalina Import lua_error

' Catalina Import lua_gc

' Catalina Import lua_warning

' Catalina Import lua_load

' Catalina Import lua_pcallk

' Catalina Import lua_callk

' Catalina Import lua_setmetatable

' Catalina Import lua_rawset

' Catalina Import lua_setfield

' Catalina Import lua_getmetatable

' Catalina Import lua_rawgeti

' Catalina Import lua_rawget

' Catalina Import lua_geti

' Catalina Import lua_pushboolean

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnumber

' Catalina Import lua_pushnil

' Catalina Import lua_rawequal

' Catalina Import lua_rawlen

' Catalina Import lua_tolstring

' Catalina Import lua_toboolean

' Catalina Import lua_typename

' Catalina Import lua_type

' Catalina Import lua_isstring

' Catalina Import lua_copy

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import strspn

' Catalina Import fwrite

' Catalina Import fflush

' Catalina Import __stdout

' Catalina Import toupper

' Catalina Import __ctype

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_base_293_L000294 ' <symbol:293>
 byte 76
 byte 117
 byte 97
 byte 32
 byte 53
 byte 46
 byte 52
 byte 0

 alignl ' align long
C_s3fs2n_670edcd6_290_L000291 ' <symbol:290>
 byte 95
 byte 86
 byte 69
 byte 82
 byte 83
 byte 73
 byte 79
 byte 78
 byte 0

 alignl ' align long
C_s3fs2m_670edcd6_288_L000289 ' <symbol:288>
 byte 95
 byte 71
 byte 0

 alignl ' align long
C_s3fs2l_670edcd6_286_L000287 ' <symbol:286>
 byte 120
 byte 112
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_s3fs2k_670edcd6_284_L000285 ' <symbol:284>
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_s3fs2j_670edcd6_282_L000283 ' <symbol:282>
 byte 116
 byte 111
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s3fs2i_670edcd6_280_L000281 ' <symbol:280>
 byte 116
 byte 111
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s3fs2h_670edcd6_278_L000279 ' <symbol:278>
 byte 115
 byte 101
 byte 116
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s3fs2g_670edcd6_276_L000277 ' <symbol:276>
 byte 115
 byte 101
 byte 108
 byte 101
 byte 99
 byte 116
 byte 0

 alignl ' align long
C_s3fs2f_670edcd6_274_L000275 ' <symbol:274>
 byte 114
 byte 97
 byte 119
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_s3fs2e_670edcd6_272_L000273 ' <symbol:272>
 byte 114
 byte 97
 byte 119
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_s3fs2d_670edcd6_270_L000271 ' <symbol:270>
 byte 114
 byte 97
 byte 119
 byte 108
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_s3fs2c_670edcd6_268_L000269 ' <symbol:268>
 byte 114
 byte 97
 byte 119
 byte 101
 byte 113
 byte 117
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_s3fs2b_670edcd6_266_L000267 ' <symbol:266>
 byte 119
 byte 97
 byte 114
 byte 110
 byte 0

 alignl ' align long
C_s3fs2a_670edcd6_264_L000265 ' <symbol:264>
 byte 112
 byte 114
 byte 105
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_s3fs29_670edcd6_262_L000263 ' <symbol:262>
 byte 112
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_s3fs28_670edcd6_260_L000261 ' <symbol:260>
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_s3fs27_670edcd6_258_L000259 ' <symbol:258>
 byte 110
 byte 101
 byte 120
 byte 116
 byte 0

 alignl ' align long
C_s3fs26_670edcd6_256_L000257 ' <symbol:256>
 byte 108
 byte 111
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_s3fs25_670edcd6_254_L000255 ' <symbol:254>
 byte 108
 byte 111
 byte 97
 byte 100
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s3fs24_670edcd6_252_L000253 ' <symbol:252>
 byte 105
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_s3fs23_670edcd6_250_L000251 ' <symbol:250>
 byte 103
 byte 101
 byte 116
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s3fs22_670edcd6_248_L000249 ' <symbol:248>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_s3fs21_670edcd6_246_L000247 ' <symbol:246>
 byte 100
 byte 111
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s3fs20_670edcd6_244_L000245 ' <symbol:244>
 byte 99
 byte 111
 byte 108
 byte 108
 byte 101
 byte 99
 byte 116
 byte 103
 byte 97
 byte 114
 byte 98
 byte 97
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_s3fs1v_670edcd6_242_L000243 ' <symbol:242>
 byte 97
 byte 115
 byte 115
 byte 101
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s3fs1o_670edcd6_luaB__select_L000220_228_L000229 ' <symbol:228>
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
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
C_s3fs1m_670edcd6_luaB__assert_L000214_218_L000219 ' <symbol:218>
 byte 97
 byte 115
 byte 115
 byte 101
 byte 114
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 102
 byte 97
 byte 105
 byte 108
 byte 101
 byte 100
 byte 33
 byte 0

 alignl ' align long
C_s3fs1h_670edcd6_luaB__load_L000197_206_L000207 ' <symbol:206>
 byte 61
 byte 40
 byte 108
 byte 111
 byte 97
 byte 100
 byte 41
 byte 0

 alignl ' align long
C_s3fs1h_670edcd6_luaB__load_L000197_199_L000200 ' <symbol:199>
 byte 98
 byte 116
 byte 0

 alignl ' align long
C_s3fs1e_670edcd6_generic_reader_L000187_195_L000196 ' <symbol:195>
 byte 114
 byte 101
 byte 97
 byte 100
 byte 101
 byte 114
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
 byte 109
 byte 117
 byte 115
 byte 116
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
C_s3fs1e_670edcd6_generic_reader_L000187_189_L000190 ' <symbol:189>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 110
 byte 101
 byte 115
 byte 116
 byte 101
 byte 100
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 115
 byte 0

 alignl ' align long
C_s3fs18_670edcd6_luaB__pairs_L000161_165_L000166 ' <symbol:165>
 byte 95
 byte 95
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_s3fs14_670edcd6_luaB__type_L000150_152_L000153 ' <symbol:152>
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 101
 byte 120
 byte 112
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_131_L000132 ' <symbol:131>
 long $44800000 ' float

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_122_L000123 ' <symbol:122>
 byte 105
 byte 115
 byte 114
 byte 117
 byte 110
 byte 110
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_120_L000121 ' <symbol:120>
 byte 115
 byte 101
 byte 116
 byte 115
 byte 116
 byte 101
 byte 112
 byte 109
 byte 117
 byte 108
 byte 0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_118_L000119 ' <symbol:118>
 byte 115
 byte 101
 byte 116
 byte 112
 byte 97
 byte 117
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_116_L000117 ' <symbol:116>
 byte 115
 byte 116
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_114_L000115 ' <symbol:114>
 byte 99
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_112_L000113 ' <symbol:112>
 byte 99
 byte 111
 byte 108
 byte 108
 byte 101
 byte 99
 byte 116
 byte 0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_110_L000111 ' <symbol:110>
 byte 114
 byte 101
 byte 115
 byte 116
 byte 97
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s3fsm_670edcd6_luaB__collectgarbage_L000104_108_L000109 ' <symbol:108>
 byte 115
 byte 116
 byte 111
 byte 112
 byte 0

 alignl ' align long
C_s3fsj_670edcd6_pushmode_L000093_99_L000100 ' <symbol:99>
 byte 103
 byte 101
 byte 110
 byte 101
 byte 114
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_s3fsj_670edcd6_pushmode_L000093_97_L000098 ' <symbol:97>
 byte 105
 byte 110
 byte 99
 byte 114
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_s3fsf_670edcd6_luaB__rawlen_L000084_86_L000087 ' <symbol:86>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 111
 byte 114
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s3fsb_670edcd6_luaB__setmetatable_L000073_80_L000081 ' <symbol:80>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 99
 byte 104
 byte 97
 byte 110
 byte 103
 byte 101
 byte 32
 byte 97
 byte 32
 byte 112
 byte 114
 byte 111
 byte 116
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 32
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s3fsb_670edcd6_luaB__setmetatable_L000073_75_L000076 ' <symbol:75>
 byte 110
 byte 105
 byte 108
 byte 32
 byte 111
 byte 114
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s3fs9_670edcd6_luaB__getmetatable_L000067_71_L000072 ' <symbol:71>
 byte 95
 byte 95
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_s3fs6_670edcd6_luaB__tonumber_L000049_57_L000058 ' <symbol:57>
 byte 98
 byte 97
 byte 115
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
C_s3fs4_670edcd6_b_str2int_L000026_28_L000029 ' <symbol:28>
 byte 32
 byte 12
 byte 10
 byte 13
 byte 9
 byte 11
 byte 0

 alignl ' align long
C_s3fs_670edcd6_luaB__print_L000004_14_L000015 ' <symbol:14>
 byte 10
 byte 0

 alignl ' align long
C_s3fs_670edcd6_luaB__print_L000004_12_L000013 ' <symbol:12>
 byte 9
 byte 0

' Catalina Code

DAT ' code segment
' end
