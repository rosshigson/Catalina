' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s9oo_67e4d989_checkfield_L000002 ' <symbol:checkfield>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 neg r2, r19 ' NEGI4
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rawget
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9oo_67e4d989_checkfield_L000002_5 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_s9oo_67e4d989_checkfield_L000002_6 ' JUMPV addrg
C_s9oo_67e4d989_checkfield_L000002_5
 mov r17, #0 ' reg <- coni
C_s9oo_67e4d989_checkfield_L000002_6
 mov r0, r17 ' CVI, CVU or LOAD
' C_s9oo_67e4d989_checkfield_L000002_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9oo1_67e4d989_checktab_L000007 ' <symbol:checktab>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #5 wz
 if_z jmp #\C_s9oo1_67e4d989_checktab_L000007_9 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_getmetatable
 add SP, #4 ' CALL addrg
 mov r20, #0 ' reg <- coni
 cmps r0, r20 wz
 if_z jmp #\C_s9oo1_67e4d989_checktab_L000007_11 ' EQI4
 mov r22, r19
 and r22, #1 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_s9oo1_67e4d989_checktab_L000007_19 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s9oo1_67e4d989_checktab_L000007_13_L000014 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo_67e4d989_checkfield_L000002
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9oo1_67e4d989_checktab_L000007_11 ' EQI4
C_s9oo1_67e4d989_checktab_L000007_19
 mov r22, r19
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s9oo1_67e4d989_checktab_L000007_20 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s9oo1_67e4d989_checktab_L000007_15_L000016 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo_67e4d989_checkfield_L000002
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9oo1_67e4d989_checktab_L000007_11 ' EQI4
C_s9oo1_67e4d989_checktab_L000007_20
 mov r22, r19
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s9oo1_67e4d989_checktab_L000007_21 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, ##@C_s9oo1_67e4d989_checktab_L000007_17_L000018 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo_67e4d989_checkfield_L000002
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9oo1_67e4d989_checktab_L000007_11 ' EQI4
C_s9oo1_67e4d989_checktab_L000007_21
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #\@C_s9oo1_67e4d989_checktab_L000007_12 ' JUMPV addrg
C_s9oo1_67e4d989_checktab_L000007_11
 mov r2, #5 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
C_s9oo1_67e4d989_checktab_L000007_12
C_s9oo1_67e4d989_checktab_L000007_9
' C_s9oo1_67e4d989_checktab_L000007_8 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9oo5_67e4d989_tinsert_L000022 ' <symbol:tinsert>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #7 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo1_67e4d989_checktab_L000007
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__len
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #2 wz
 if_z jmp #\C_s9oo5_67e4d989_tinsert_L000022_27 ' EQI4
 cmps r19,  #3 wz
 if_z jmp #\C_s9oo5_67e4d989_tinsert_L000022_28 ' EQI4
 jmp #\@C_s9oo5_67e4d989_tinsert_L000022_24 ' JUMPV addrg
C_s9oo5_67e4d989_tinsert_L000022_27
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNI4 addrli reg
 jmp #\@C_s9oo5_67e4d989_tinsert_L000022_25 ' JUMPV addrg
C_s9oo5_67e4d989_tinsert_L000022_28
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
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub r22, #1 ' SUBU4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_s9oo5_67e4d989_tinsert_L000022_31 ' LTU4
 mov r2, ##@C_s9oo5_67e4d989_tinsert_L000022_29_L000030 ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s9oo5_67e4d989_tinsert_L000022_31
 mov r17, r21 ' CVI, CVU or LOAD
 jmp #\@C_s9oo5_67e4d989_tinsert_L000022_35 ' JUMPV addrg
C_s9oo5_67e4d989_tinsert_L000022_32
 mov r22, #1 ' reg <- coni
 mov r2, r17
 subs r2, #1 ' SUBI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
' C_s9oo5_67e4d989_tinsert_L000022_33 ' (symbol refcount = 0)
 subs r17, #1 ' SUBI4 coni
C_s9oo5_67e4d989_tinsert_L000022_35
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r17, r22 wcz
 if_a jmp #\C_s9oo5_67e4d989_tinsert_L000022_32 ' GTI4
 jmp #\@C_s9oo5_67e4d989_tinsert_L000022_25 ' JUMPV addrg
C_s9oo5_67e4d989_tinsert_L000022_24
 mov r2, ##@C_s9oo5_67e4d989_tinsert_L000022_36_L000037 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s9oo5_67e4d989_tinsert_L000022_23 ' JUMPV addrg
C_s9oo5_67e4d989_tinsert_L000022_25
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_s9oo5_67e4d989_tinsert_L000022_23
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9oo8_67e4d989_tremove_L000038 ' <symbol:tremove>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #7 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo1_67e4d989_checktab_L000007
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__len
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21, r19 wz
 if_z jmp #\C_s9oo8_67e4d989_tremove_L000038_40 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_be jmp #\C_s9oo8_67e4d989_tremove_L000038_42 ' LEU4
 mov r2, ##@C_s9oo5_67e4d989_tinsert_L000022_29_L000030 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s9oo8_67e4d989_tremove_L000038_42
C_s9oo8_67e4d989_tremove_L000038_40
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 jmp #\@C_s9oo8_67e4d989_tremove_L000038_46 ' JUMPV addrg
C_s9oo8_67e4d989_tremove_L000038_43
 mov r22, #1 ' reg <- coni
 mov r2, r21
 adds r2, #1 ' ADDI4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
' C_s9oo8_67e4d989_tremove_L000038_44 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s9oo8_67e4d989_tremove_L000038_46
 cmps r21, r19 wcz
 if_b jmp #\C_s9oo8_67e4d989_tremove_L000038_43 ' LTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s9oo8_67e4d989_tremove_L000038_39 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9oo9_67e4d989_tmove_L000047 ' <symbol:tmove>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaaa00 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #5 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_be jmp #\C_s9oo9_67e4d989_tmove_L000047_50 ' LEI4
 mov r13, #5 ' reg <- coni
 jmp #\@C_s9oo9_67e4d989_tmove_L000047_51 ' JUMPV addrg
C_s9oo9_67e4d989_tmove_L000047_50
 mov r13, #1 ' reg <- coni
C_s9oo9_67e4d989_tmove_L000047_51
 mov r19, r13 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo1_67e4d989_checktab_L000007
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo1_67e4d989_checktab_L000007
 add SP, #8 ' CALL addrg
 cmps r15, r21 wcz
 if_b jmp #\C_s9oo9_67e4d989_tmove_L000047_52 ' LTI4
 cmps r21,  #0 wcz
 if_a jmp #\C_s9oo9_67e4d989_tmove_L000047_56 ' GTI4
 mov r22, ##2147483647 ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 cmps r15, r22 wcz
 if_b jmp #\C_s9oo9_67e4d989_tmove_L000047_56 ' LTI4
 mov r2, ##@C_s9oo9_67e4d989_tmove_L000047_54_L000055 ' reg ARG ADDRG
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s9oo9_67e4d989_tmove_L000047_56
 mov r22, r15 ' SUBI/P
 subs r22, r21 ' SUBI/P (3)
 mov r9, r22
 adds r9, #1 ' ADDI4 coni
 mov r22, ##2147483647 ' reg <- con
 subs r22, r9 ' SUBI/P (1)
 adds r22, #1 ' ADDI4 coni
 cmps r17, r22 wcz
 if_be jmp #\C_s9oo9_67e4d989_tmove_L000047_59 ' LEI4
 mov r2, ##@C_s9oo9_67e4d989_tmove_L000047_57_L000058 ' reg ARG ADDRG
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s9oo9_67e4d989_tmove_L000047_59
 cmps r17, r15 wcz
 if_a jmp #\C_s9oo9_67e4d989_tmove_L000047_63 ' GTI4
 cmps r17, r21 wcz
 if_be jmp #\C_s9oo9_67e4d989_tmove_L000047_63 ' LEI4
 mov r22, #1 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_s9oo9_67e4d989_tmove_L000047_60 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_compare
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9oo9_67e4d989_tmove_L000047_60 ' NEI4
C_s9oo9_67e4d989_tmove_L000047_63
 mov r11, #0 ' reg <- coni
 jmp #\@C_s9oo9_67e4d989_tmove_L000047_67 ' JUMPV addrg
C_s9oo9_67e4d989_tmove_L000047_64
 mov r2, r21 ' ADDI/P
 adds r2, r11 ' ADDI/P (3)
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, r17 ' ADDI/P
 adds r2, r11 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
' C_s9oo9_67e4d989_tmove_L000047_65 ' (symbol refcount = 0)
 adds r11, #1 ' ADDI4 coni
C_s9oo9_67e4d989_tmove_L000047_67
 cmps r11, r9 wcz
 if_b jmp #\C_s9oo9_67e4d989_tmove_L000047_64 ' LTI4
 jmp #\@C_s9oo9_67e4d989_tmove_L000047_61 ' JUMPV addrg
C_s9oo9_67e4d989_tmove_L000047_60
 mov r11, r9
 subs r11, #1 ' SUBI4 coni
 jmp #\@C_s9oo9_67e4d989_tmove_L000047_71 ' JUMPV addrg
C_s9oo9_67e4d989_tmove_L000047_68
 mov r2, r21 ' ADDI/P
 adds r2, r11 ' ADDI/P (3)
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, r17 ' ADDI/P
 adds r2, r11 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
' C_s9oo9_67e4d989_tmove_L000047_69 ' (symbol refcount = 0)
 subs r11, #1 ' SUBI4 coni
C_s9oo9_67e4d989_tmove_L000047_71
 cmps r11,  #0 wcz
 if_ae jmp #\C_s9oo9_67e4d989_tmove_L000047_68 ' GEI4
C_s9oo9_67e4d989_tmove_L000047_61
C_s9oo9_67e4d989_tmove_L000047_52
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s9oo9_67e4d989_tmove_L000047_48 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9ooc_67e4d989_addfield_L000072 ' <symbol:addfield>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9ooc_67e4d989_addfield_L000072_74 ' NEI4
 mov r2, ##-1 ' reg ARG con
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
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C_s9ooc_67e4d989_addfield_L000072_76_L000077 ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #12 ' CALL addrg
C_s9ooc_67e4d989_addfield_L000072_74
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__addvalue ' CALL addrg
' C_s9ooc_67e4d989_addfield_L000072_73 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9ooe_67e4d989_tconcat_L000078 ' <symbol:tconcat>
 calld PA,#NEWF
 sub SP, #276
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo1_67e4d989_checktab_L000007
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__len
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-280) ' reg ARG ADDRLi
 mov r3, ##@C_s9ooe_67e4d989_tconcat_L000078_80_L000081 ' reg ARG ADDRG
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 jmp #\@C_s9ooe_67e4d989_tconcat_L000078_85 ' JUMPV addrg
C_s9ooe_67e4d989_tconcat_L000078_82
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ooc_67e4d989_addfield_L000072
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-280)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-276) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__addlstring
 add SP, #8 ' CALL addrg
' C_s9ooe_67e4d989_tconcat_L000078_83 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s9ooe_67e4d989_tconcat_L000078_85
 cmps r21, r19 wcz
 if_b jmp #\C_s9ooe_67e4d989_tconcat_L000078_82 ' LTI4
 cmps r21, r19 wz
 if_nz jmp #\C_s9ooe_67e4d989_tconcat_L000078_86 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-276) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ooc_67e4d989_addfield_L000072
 add SP, #8 ' CALL addrg
C_s9ooe_67e4d989_tconcat_L000078_86
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaL__pushresult ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s9ooe_67e4d989_tconcat_L000078_79 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #276 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9oog_67e4d989_tpack_L000088 ' <symbol:tpack>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r21, r19 ' CVI, CVU or LOAD
 jmp #\@C_s9oog_67e4d989_tpack_L000088_93 ' JUMPV addrg
C_s9oog_67e4d989_tpack_L000088_90
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
' C_s9oog_67e4d989_tpack_L000088_91 ' (symbol refcount = 0)
 subs r21, #1 ' SUBI4 coni
C_s9oog_67e4d989_tpack_L000088_93
 cmps r21,  #1 wcz
 if_ae jmp #\C_s9oog_67e4d989_tpack_L000088_90 ' GEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, ##@C_s9oog_67e4d989_tpack_L000088_94_L000095 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_s9oog_67e4d989_tpack_L000088_89 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9ooi_67e4d989_tunpack_L000096 ' <symbol:tunpack>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_a jmp #\C_s9ooi_67e4d989_tunpack_L000096_99 ' GTI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__len
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #\@C_s9ooi_67e4d989_tunpack_L000096_100 ' JUMPV addrg
C_s9ooi_67e4d989_tunpack_L000096_99
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_s9ooi_67e4d989_tunpack_L000096_100
 mov r19, r15 ' CVI, CVU or LOAD
 cmps r21, r19 wcz
 if_be jmp #\C_s9ooi_67e4d989_tunpack_L000096_101 ' LEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9ooi_67e4d989_tunpack_L000096_97 ' JUMPV addrg
C_s9ooi_67e4d989_tunpack_L000096_101
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 mov r17, r22 ' SUBU
 sub r17, r20 ' SUBU (3)
 mov r22, ##$7fffffff ' reg <- con
 cmp r17, r22 wcz 
 if_ae jmp #\C_s9ooi_67e4d989_tunpack_L000096_105 ' GEU4
 mov r22, r17
 add r22, #1 ' ADDU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_checkstack
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9ooi_67e4d989_tunpack_L000096_111 ' NEI4
C_s9ooi_67e4d989_tunpack_L000096_105
 mov r2, ##@C_s9ooi_67e4d989_tunpack_L000096_106_L000107 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s9ooi_67e4d989_tunpack_L000096_97 ' JUMPV addrg
C_s9ooi_67e4d989_tunpack_L000096_108
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
' C_s9ooi_67e4d989_tunpack_L000096_109 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_s9ooi_67e4d989_tunpack_L000096_111
 cmps r21, r19 wcz
 if_b jmp #\C_s9ooi_67e4d989_tunpack_L000096_108 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
C_s9ooi_67e4d989_tunpack_L000096_97
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9ook_67e4d989_l_randomizeP_ivot_L000112 ' <symbol:l_randomizePivot>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $f00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_clock ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_time ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r21, #0 ' reg <- coni
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r23, #0 ' reg <- coni
 jmp #\@C_s9ook_67e4d989_l_randomizeP_ivot_L000112_118 ' JUMPV addrg
C_s9ook_67e4d989_l_randomizeP_ivot_L000112_115
 mov r22, r23
 shl r22, #2 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r21, r22 ' ADDU (1)
' C_s9ook_67e4d989_l_randomizeP_ivot_L000112_116 ' (symbol refcount = 0)
 add r23, #1 ' ADDU4 coni
C_s9ook_67e4d989_l_randomizeP_ivot_L000112_118
 cmp r23,  #2 wcz 
 if_b jmp #\C_s9ook_67e4d989_l_randomizeP_ivot_L000112_115 ' LTU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_s9ook_67e4d989_l_randomizeP_ivot_L000112_113 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9ool_67e4d989_set2_L000119 ' <symbol:set2>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_seti
 add SP, #8 ' CALL addrg
' C_s9ool_67e4d989_set2_L000119_120 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9oom_67e4d989_sort_comp_L000121 ' <symbol:sort_comp>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9oom_67e4d989_sort_comp_L000121_123 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_compare
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s9oom_67e4d989_sort_comp_L000121_122 ' JUMPV addrg
C_s9oom_67e4d989_sort_comp_L000121_123
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r21
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, r19
 subs r2, #2 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
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
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s9oom_67e4d989_sort_comp_L000121_122
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9oon_67e4d989_partition_L000125 ' <symbol:partition>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r21 ' CVI, CVU or LOAD
 mov r15, r19
 sub r15, #1 ' SUBU4 coni
 jmp #\@C_s9oon_67e4d989_partition_L000125_132 ' JUMPV addrg
C_s9oon_67e4d989_partition_L000125_131
 mov r22, r19
 sub r22, #1 ' SUBU4 coni
 cmp r17, r22 wz
 if_nz jmp #\C_s9oon_67e4d989_partition_L000125_134  ' NEU4
 mov r2, ##@C_s9oon_67e4d989_partition_L000125_136_L000137 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_s9oon_67e4d989_partition_L000125_134
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s9oon_67e4d989_partition_L000125_132
 mov r22, r17
 add r22, #1 ' ADDU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oom_67e4d989_sort_comp_L000121
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9oon_67e4d989_partition_L000125_131 ' NEI4
 jmp #\@C_s9oon_67e4d989_partition_L000125_139 ' JUMPV addrg
C_s9oon_67e4d989_partition_L000125_138
 cmp r15, r17 wcz 
 if_ae jmp #\C_s9oon_67e4d989_partition_L000125_141 ' GEU4
 mov r2, ##@C_s9oon_67e4d989_partition_L000125_136_L000137 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_s9oon_67e4d989_partition_L000125_141
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s9oon_67e4d989_partition_L000125_139
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-3 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oom_67e4d989_sort_comp_L000121
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9oon_67e4d989_partition_L000125_138 ' NEI4
 cmp r15, r17 wcz 
 if_ae jmp #\C_s9oon_67e4d989_partition_L000125_143 ' GEU4
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19
 sub r3, #1 ' SUBU4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ool_67e4d989_set2_L000119
 add SP, #8 ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_s9oon_67e4d989_partition_L000125_126 ' JUMPV addrg
C_s9oon_67e4d989_partition_L000125_143
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ool_67e4d989_set2_L000119
 add SP, #8 ' CALL addrg
 jmp #\@C_s9oon_67e4d989_partition_L000125_132 ' JUMPV addrg
C_s9oon_67e4d989_partition_L000125_126
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9oop_67e4d989_chooseP_ivot_L000145 ' <symbol:choosePivot>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, r3 ' SUBU
 sub r22, r4 ' SUBU (3)
 mov r23, r22
 shr r23, #2 ' RSHU4 coni
 mov r22, r23
 shl r22, #1 ' LSHU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r2, r22 ' MODU4
 getqy r1
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r4 ' ADDU
 add r22, r23 ' ADDU (3)
 add r22, r1 ' ADDU (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_s9oop_67e4d989_chooseP_ivot_L000145_146 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9ooq_67e4d989_auxsort_L000147 ' <symbol:auxsort>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #\@C_s9ooq_67e4d989_auxsort_L000147_150 ' JUMPV addrg
C_s9ooq_67e4d989_auxsort_L000147_149
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oom_67e4d989_sort_comp_L000121
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9ooq_67e4d989_auxsort_L000147_152 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ool_67e4d989_set2_L000119
 add SP, #8 ' CALL addrg
 jmp #\@C_s9ooq_67e4d989_auxsort_L000147_153 ' JUMPV addrg
C_s9ooq_67e4d989_auxsort_L000147_152
 mov r2, ##-3 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s9ooq_67e4d989_auxsort_L000147_153
 mov r22, r19 ' SUBU
 sub r22, r21 ' SUBU (3)
 cmp r22,  #1 wz
 if_nz jmp #\C_s9ooq_67e4d989_auxsort_L000147_154  ' NEU4
 jmp #\@C_s9ooq_67e4d989_auxsort_L000147_148 ' JUMPV addrg
C_s9ooq_67e4d989_auxsort_L000147_154
 mov r22, r19 ' SUBU
 sub r22, r21 ' SUBU (3)
 cmp r22,  #100 wcz 
 if_b jmp #\C_s9ooq_67e4d989_auxsort_L000147_158 ' LTU4
 cmp r17,  #0 wz
 if_nz jmp #\C_s9ooq_67e4d989_auxsort_L000147_156  ' NEU4
C_s9ooq_67e4d989_auxsort_L000147_158
 mov r22, r21 ' ADDU
 add r22, r19 ' ADDU (3)
 mov r15, r22
 shr r15, #1 ' RSHU4 coni
 jmp #\@C_s9ooq_67e4d989_auxsort_L000147_157 ' JUMPV addrg
C_s9ooq_67e4d989_auxsort_L000147_156
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oop_67e4d989_chooseP_ivot_L000145
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_s9ooq_67e4d989_auxsort_L000147_157
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, ##-2 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oom_67e4d989_sort_comp_L000121
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9ooq_67e4d989_auxsort_L000147_159 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ool_67e4d989_set2_L000119
 add SP, #8 ' CALL addrg
 jmp #\@C_s9ooq_67e4d989_auxsort_L000147_160 ' JUMPV addrg
C_s9ooq_67e4d989_auxsort_L000147_159
 mov r2, ##-2 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, ##-2 ' reg ARG con
 mov r3, ##-1 ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oom_67e4d989_sort_comp_L000121
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9ooq_67e4d989_auxsort_L000147_161 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ool_67e4d989_set2_L000119
 add SP, #8 ' CALL addrg
 jmp #\@C_s9ooq_67e4d989_auxsort_L000147_162 ' JUMPV addrg
C_s9ooq_67e4d989_auxsort_L000147_161
 mov r2, ##-3 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_s9ooq_67e4d989_auxsort_L000147_162
C_s9ooq_67e4d989_auxsort_L000147_160
 mov r22, r19 ' SUBU
 sub r22, r21 ' SUBU (3)
 cmp r22,  #2 wz
 if_nz jmp #\C_s9ooq_67e4d989_auxsort_L000147_163  ' NEU4
 jmp #\@C_s9ooq_67e4d989_auxsort_L000147_148 ' JUMPV addrg
C_s9ooq_67e4d989_auxsort_L000147_163
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, ##-1 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r22, r19
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r2, r19
 sub r2, #1 ' SUBU4 coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ool_67e4d989_set2_L000119
 add SP, #8 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oon_67e4d989_partition_L000125
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' SUBU
 sub r22, r21 ' SUBU (3)
 mov r20, r19 ' SUBU
 sub r20, r15 ' SUBU (3)
 cmp r22, r20 wcz 
 if_ae jmp #\C_s9ooq_67e4d989_auxsort_L000147_165 ' GEU4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r15
 sub r3, #1 ' SUBU4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ooq_67e4d989_auxsort_L000147
 add SP, #12 ' CALL addrg
 mov r13, r15 ' SUBU
 sub r13, r21 ' SUBU (3)
 mov r21, r15
 add r21, #1 ' ADDU4 coni
 jmp #\@C_s9ooq_67e4d989_auxsort_L000147_166 ' JUMPV addrg
C_s9ooq_67e4d989_auxsort_L000147_165
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15
 add r4, #1 ' ADDU4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ooq_67e4d989_auxsort_L000147
 add SP, #12 ' CALL addrg
 mov r13, r19 ' SUBU
 sub r13, r15 ' SUBU (3)
 mov r19, r15
 sub r19, #1 ' SUBU4 coni
C_s9ooq_67e4d989_auxsort_L000147_166
 mov r22, r19 ' SUBU
 sub r22, r21 ' SUBU (3)
 shr r22, #7 ' RSHU4 coni
 cmp r22, r13 wcz 
 if_be jmp #\C_s9ooq_67e4d989_auxsort_L000147_167 ' LEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_s9ook_67e4d989_l_randomizeP_ivot_L000112 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_s9ooq_67e4d989_auxsort_L000147_167
C_s9ooq_67e4d989_auxsort_L000147_150
 cmp r21, r19 wcz 
 if_b jmp #\C_s9ooq_67e4d989_auxsort_L000147_149 ' LTU4
C_s9ooq_67e4d989_auxsort_L000147_148
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9oor_67e4d989_sort_L000169 ' <symbol:sort>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #7 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9oo1_67e4d989_checktab_L000007
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__len
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wcz
 if_be jmp #\C_s9oor_67e4d989_sort_L000169_171 ' LEI4
 mov r22, ##2147483647 ' reg <- con
 cmps r21, r22 wcz
 if_b jmp #\C_s9oor_67e4d989_sort_L000169_175 ' LTI4
 mov r2, ##@C_s9oor_67e4d989_sort_L000169_173_L000174 ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_s9oor_67e4d989_sort_L000169_175
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wcz
 if_be jmp #\C_s9oor_67e4d989_sort_L000169_176 ' LEI4
 mov r2, #6 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
C_s9oor_67e4d989_sort_L000169_176
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9ooq_67e4d989_auxsort_L000147
 add SP, #12 ' CALL addrg
C_s9oor_67e4d989_sort_L000169_171
 mov r0, #0 ' reg <- coni
' C_s9oor_67e4d989_sort_L000169_170 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9oot_67e4d989_tab_funcs_L000178 ' <symbol:tab_funcs>
 long @C_s9oou_67e4d989_179_L000180
 long @C_s9ooe_67e4d989_tconcat_L000078
 long @C_s9oov_67e4d989_181_L000182
 long @C_s9oo5_67e4d989_tinsert_L000022
 long @C_s9oo10_67e4d989_183_L000184
 long @C_s9oog_67e4d989_tpack_L000088
 long @C_s9oo11_67e4d989_185_L000186
 long @C_s9ooi_67e4d989_tunpack_L000096
 long @C_s9oo12_67e4d989_187_L000188
 long @C_s9oo8_67e4d989_tremove_L000038
 long @C_s9oo13_67e4d989_189_L000190
 long @C_s9oo9_67e4d989_tmove_L000047
 long @C_s9oo14_67e4d989_191_L000192
 long @C_s9oor_67e4d989_sort_L000169
 long $0
 long $0

' Catalina Export luaopen_table

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_table ' <symbol:luaopen_table>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 mov r3, ##@C_luaopen_table_194_L000195
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #7 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_s9oot_67e4d989_tab_funcs_L000178 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_luaopen_table_193 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import time

' Catalina Import clock

' Catalina Import luaL_pushresult

' Catalina Import luaL_addvalue

' Catalina Import luaL_addlstring

' Catalina Import luaL_buffinit

' Catalina Import luaL_setfuncs

' Catalina Import luaL_len

' Catalina Import luaL_error

' Catalina Import luaL_checktype

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_argerror

' Catalina Import luaL_checkversion_

' Catalina Import lua_callk

' Catalina Import lua_seti

' Catalina Import lua_setfield

' Catalina Import lua_getmetatable

' Catalina Import lua_createtable

' Catalina Import lua_rawget

' Catalina Import lua_geti

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnil

' Catalina Import lua_compare

' Catalina Import lua_toboolean

' Catalina Import lua_typename

' Catalina Import lua_type

' Catalina Import lua_isstring

' Catalina Import lua_checkstack

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import memcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_table_194_L000195 ' <symbol:194>
 long $43fc0000 ' float

 alignl ' align long
C_s9oo14_67e4d989_191_L000192 ' <symbol:191>
 byte 115
 byte 111
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s9oo13_67e4d989_189_L000190 ' <symbol:189>
 byte 109
 byte 111
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s9oo12_67e4d989_187_L000188 ' <symbol:187>
 byte 114
 byte 101
 byte 109
 byte 111
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s9oo11_67e4d989_185_L000186 ' <symbol:185>
 byte 117
 byte 110
 byte 112
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s9oo10_67e4d989_183_L000184 ' <symbol:183>
 byte 112
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s9oov_67e4d989_181_L000182 ' <symbol:181>
 byte 105
 byte 110
 byte 115
 byte 101
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_s9oou_67e4d989_179_L000180 ' <symbol:179>
 byte 99
 byte 111
 byte 110
 byte 99
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_s9oor_67e4d989_sort_L000169_173_L000174 ' <symbol:173>
 byte 97
 byte 114
 byte 114
 byte 97
 byte 121
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 98
 byte 105
 byte 103
 byte 0

 alignl ' align long
C_s9oon_67e4d989_partition_L000125_136_L000137 ' <symbol:136>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 111
 byte 114
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
 byte 102
 byte 111
 byte 114
 byte 32
 byte 115
 byte 111
 byte 114
 byte 116
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s9ooi_67e4d989_tunpack_L000096_106_L000107 ' <symbol:106>
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
 byte 32
 byte 116
 byte 111
 byte 32
 byte 117
 byte 110
 byte 112
 byte 97
 byte 99
 byte 107
 byte 0

 alignl ' align long
C_s9oog_67e4d989_tpack_L000088_94_L000095 ' <symbol:94>
 byte 110
 byte 0

 alignl ' align long
C_s9ooe_67e4d989_tconcat_L000078_80_L000081 ' <symbol:80>
 byte 0

 alignl ' align long
C_s9ooc_67e4d989_addfield_L000072_76_L000077 ' <symbol:76>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 32
 byte 97
 byte 116
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 37
 byte 73
 byte 32
 byte 105
 byte 110
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 39
 byte 99
 byte 111
 byte 110
 byte 99
 byte 97
 byte 116
 byte 39
 byte 0

 alignl ' align long
C_s9oo9_67e4d989_tmove_L000047_57_L000058 ' <symbol:57>
 byte 100
 byte 101
 byte 115
 byte 116
 byte 105
 byte 110
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 119
 byte 114
 byte 97
 byte 112
 byte 32
 byte 97
 byte 114
 byte 111
 byte 117
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_s9oo9_67e4d989_tmove_L000047_54_L000055 ' <symbol:54>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 101
 byte 108
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 115
 byte 32
 byte 116
 byte 111
 byte 32
 byte 109
 byte 111
 byte 118
 byte 101
 byte 0

 alignl ' align long
C_s9oo5_67e4d989_tinsert_L000022_36_L000037 ' <symbol:36>
 byte 119
 byte 114
 byte 111
 byte 110
 byte 103
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 32
 byte 111
 byte 102
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
 byte 105
 byte 110
 byte 115
 byte 101
 byte 114
 byte 116
 byte 39
 byte 0

 alignl ' align long
C_s9oo5_67e4d989_tinsert_L000022_29_L000030 ' <symbol:29>
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
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 115
 byte 0

 alignl ' align long
C_s9oo1_67e4d989_checktab_L000007_17_L000018 ' <symbol:17>
 byte 95
 byte 95
 byte 108
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_s9oo1_67e4d989_checktab_L000007_15_L000016 ' <symbol:15>
 byte 95
 byte 95
 byte 110
 byte 101
 byte 119
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_s9oo1_67e4d989_checktab_L000007_13_L000014 ' <symbol:13>
 byte 95
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

' Catalina Code

DAT ' code segment
' end
