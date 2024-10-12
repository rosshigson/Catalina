' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export lua_ident

 alignl ' align long
C_lua_ident ' <symbol:lua_ident>
 byte 36
 byte 76
 byte 117
 byte 97
 byte 86
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 58
 byte 32
 byte 76
 byte 117
 byte 97
 byte 32
 byte 53
 byte 46
 byte 52
 byte 46
 byte 52
 byte 32
 byte 32
 byte 67
 byte 111
 byte 112
 byte 121
 byte 114
 byte 105
 byte 103
 byte 104
 byte 116
 byte 32
 byte 40
 byte 67
 byte 41
 byte 32
 byte 49
 byte 57
 byte 57
 byte 52
 byte 45
 byte 50
 byte 48
 byte 50
 byte 50
 byte 32
 byte 76
 byte 117
 byte 97
 byte 46
 byte 111
 byte 114
 byte 103
 byte 44
 byte 32
 byte 80
 byte 85
 byte 67
 byte 45
 byte 82
 byte 105
 byte 111
 byte 32
 byte 36
 byte 36
 byte 76
 byte 117
 byte 97
 byte 65
 byte 117
 byte 116
 byte 104
 byte 111
 byte 114
 byte 115
 byte 58
 byte 32
 byte 82
 byte 46
 byte 32
 byte 73
 byte 101
 byte 114
 byte 117
 byte 115
 byte 97
 byte 108
 byte 105
 byte 109
 byte 115
 byte 99
 byte 104
 byte 121
 byte 44
 byte 32
 byte 76
 byte 46
 byte 32
 byte 72
 byte 46
 byte 32
 byte 100
 byte 101
 byte 32
 byte 70
 byte 105
 byte 103
 byte 117
 byte 101
 byte 105
 byte 114
 byte 101
 byte 100
 byte 111
 byte 44
 byte 32
 byte 87
 byte 46
 byte 32
 byte 67
 byte 101
 byte 108
 byte 101
 byte 115
 byte 32
 byte 36
 byte 0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sb9s_6709f9bc_index2value_L000013 ' <symbol:index2value>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmps r2,  #0 wcz
 if_be jmp #\C_sb9s_6709f9bc_index2value_L000013_15 ' LEI4
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb9s_6709f9bc_index2value_L000013_17 ' LTU4
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #44 ' ADDP4 coni
 jmp #\@C_sb9s_6709f9bc_index2value_L000013_14 ' JUMPV addrg
C_sb9s_6709f9bc_index2value_L000013_17
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_sb9s_6709f9bc_index2value_L000013_14 ' JUMPV addrg
C_sb9s_6709f9bc_index2value_L000013_15
 mov r22, ##-1001000 ' reg <- con
 cmps r2, r22 wcz
 if_be jmp #\C_sb9s_6709f9bc_index2value_L000013_19 ' LEI4
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sb9s_6709f9bc_index2value_L000013_14 ' JUMPV addrg
C_sb9s_6709f9bc_index2value_L000013_19
 mov r22, ##-1001000 ' reg <- con
 cmps r2, r22 wz
 if_nz jmp #\C_sb9s_6709f9bc_index2value_L000013_21 ' NEI4
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #36 ' ADDP4 coni
 jmp #\@C_sb9s_6709f9bc_index2value_L000013_14 ' JUMPV addrg
C_sb9s_6709f9bc_index2value_L000013_21
 mov r22, ##-1001000 ' reg <- con
 subs r2, r22
 neg r2, r2 ' SUBI/P (2)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #102 wz
 if_nz jmp #\C_sb9s_6709f9bc_index2value_L000013_23 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r2, r22 wcz
 if_a jmp #\C_sb9s_6709f9bc_index2value_L000013_26 ' GTI4
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 jmp #\@C_sb9s_6709f9bc_index2value_L000013_27 ' JUMPV addrg
C_sb9s_6709f9bc_index2value_L000013_26
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r23, r22
 adds r23, #44 ' ADDP4 coni
C_sb9s_6709f9bc_index2value_L000013_27
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_sb9s_6709f9bc_index2value_L000013_14 ' JUMPV addrg
C_sb9s_6709f9bc_index2value_L000013_23
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #44 ' ADDP4 coni
C_sb9s_6709f9bc_index2value_L000013_14
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb9s1_6709f9bc_index2stack_L000028 ' <symbol:index2stack>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmps r2,  #0 wcz
 if_be jmp #\C_sb9s1_6709f9bc_index2stack_L000028_30 ' LEI4
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_sb9s1_6709f9bc_index2stack_L000028_29 ' JUMPV addrg
C_sb9s1_6709f9bc_index2stack_L000028_30
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_sb9s1_6709f9bc_index2stack_L000028_29
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_checkstack

 alignl ' align long
C_lua_checkstack ' <symbol:lua_checkstack>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r0, r21 wcz
 if_be jmp #\C_lua_checkstack_33 ' LEI4
 mov r19, #1 ' reg <- coni
 jmp #\@C_lua_checkstack_34 ' JUMPV addrg
C_lua_checkstack_33
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0
 adds r22, #5 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1000000 ' reg <- con
 subs r20, r21 ' SUBI/P (1)
 cmps r22, r20 wcz
 if_be jmp #\C_lua_checkstack_35 ' LEI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_lua_checkstack_36 ' JUMPV addrg
C_lua_checkstack_35
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_lua_checkstack_36
C_lua_checkstack_34
 cmps r19,  #0 wz
 if_z jmp #\C_lua_checkstack_37 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 shl r20, #3 ' LSHI4 coni
 mov r18, r23
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 cmp r22, r20 wcz 
 if_ae jmp #\C_lua_checkstack_37 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 shl r20, #3 ' LSHI4 coni
 mov r18, r23
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_checkstack_37
 mov r0, r19 ' CVI, CVU or LOAD
' C_lua_checkstack_32 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_xmove

 alignl ' align long
C_lua_xmove ' <symbol:lua_xmove>
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r22, r4 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_lua_xmove_40  ' NEU4
 jmp #\@C_lua_xmove_39 ' JUMPV addrg
C_lua_xmove_40
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r2
 shl r18, #3 ' LSHI4 coni
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r23, #0 ' reg <- coni
 jmp #\@C_lua_xmove_45 ' JUMPV addrg
C_lua_xmove_42
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 shl r22, #3 ' LSHI4 coni
 mov r20, r4
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r19, r22 ' ADDI/P
 adds r19, r20 ' ADDI/P (3)
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, r19 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_xmove_43 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_lua_xmove_45
 cmps r23, r2 wcz
 if_b jmp #\C_lua_xmove_42 ' LTI4
C_lua_xmove_39
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_atpanic

 alignl ' align long
C_lua_atpanic ' <symbol:lua_atpanic>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #140 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNP4 addrli reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #140 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_atpanic_46 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_version

 alignl ' align long
C_lua_version ' <symbol:lua_version>
 mov r0, ##@C_lua_version_48_L000049
 rdlong r0, r0 ' reg <- INDIRF4 addrg
' C_lua_version_47 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export lua_absindex

 alignl ' align long
C_lua_absindex ' <symbol:lua_absindex>
 calld PA,#PSHM
 long $d00000 ' save registers
 cmps r2,  #0 wcz
 if_a jmp #\C_lua_absindex_54 ' GTI4
 mov r22, ##-1001000 ' reg <- con
 cmps r2, r22 wcz
 if_a jmp #\C_lua_absindex_52 ' GTI4
C_lua_absindex_54
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #\@C_lua_absindex_53 ' JUMPV addrg
C_lua_absindex_52
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r3
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r23, r0 ' ADDI/P
 adds r23, r2 ' ADDI/P (3)
C_lua_absindex_53
 mov r0, r23 ' CVI, CVU or LOAD
' C_lua_absindex_50 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_gettop

 alignl ' align long
C_lua_gettop ' <symbol:lua_gettop>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
' C_lua_gettop_55 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_settop

 alignl ' align long
C_lua_settop ' <symbol:lua_settop>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmps r21,  #0 wcz
 if_b jmp #\C_lua_settop_57 ' LTI4
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_lua_settop_62 ' JUMPV addrg
C_lua_settop_59
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 mov r22, r20
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_lua_settop_60 ' (symbol refcount = 0)
 subs r19, #1 ' SUBI4 coni
C_lua_settop_62
 cmps r19,  #0 wcz
 if_a jmp #\C_lua_settop_59 ' GTI4
 jmp #\@C_lua_settop_58 ' JUMPV addrg
C_lua_settop_57
 mov r19, r21
 adds r19, #1 ' ADDI4 coni
C_lua_settop_58
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 cmps r19,  #0 wcz
 if_ae jmp #\C_lua_settop_63 ' GEI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_lua_settop_63 ' LTU4
 mov r2, #0 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
C_lua_settop_63
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
' C_lua_settop_56 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_closeslot

 alignl ' align long
C_lua_closeslot ' <symbol:lua_closeslot>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s1_6709f9bc_index2stack_L000028
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s1_6709f9bc_index2stack_L000028
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_lua_closeslot_65 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb9s3_6709f9bc_reverse_L000066 ' <symbol:reverse>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f00000 ' save registers
 jmp #\@C_sb9s3_6709f9bc_reverse_L000066_71 ' JUMPV addrg
C_sb9s3_6709f9bc_reverse_L000066_68
 mov r23, FP
 sub r23, #-(-12) ' reg <- addrli
 mov r21, r3 ' CVI, CVU or LOAD
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r23, r3 ' CVI, CVU or LOAD
 mov r21, r2 ' CVI, CVU or LOAD
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r23, r2 ' CVI, CVU or LOAD
 mov r21, FP
 sub r21, #-(-12) ' reg <- addrli
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, r21 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sb9s3_6709f9bc_reverse_L000066_69 ' (symbol refcount = 0)
 adds r3, #8 ' ADDP4 coni
 mov r22, ##-8 ' reg <- con
 adds r2, r22 ' ADDI/P (1)
C_sb9s3_6709f9bc_reverse_L000066_71
 mov r22, r3 ' CVI, CVU or LOAD
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_sb9s3_6709f9bc_reverse_L000066_68 ' LTU4
' C_sb9s3_6709f9bc_reverse_L000066_67 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_rotate

 alignl ' align long
C_lua_rotate ' <symbol:lua_rotate>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s1_6709f9bc_index2stack_L000028
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 if_b jmp #\C_lua_rotate_74 ' LTI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r11, r15 ' SUBI/P
 subs r11, r22 ' SUBI/P (3)
 jmp #\@C_lua_rotate_75 ' JUMPV addrg
C_lua_rotate_74
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, r17
 neg r22, r22 ' SUBI/P (2)
 mov r20, ##-8 ' reg <- con
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
C_lua_rotate_75
 mov r13, r11 ' CVI, CVU or LOAD
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s3_6709f9bc_reverse_L000066
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13
 adds r3, #8 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s3_6709f9bc_reverse_L000066
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s3_6709f9bc_reverse_L000066
 add SP, #8 ' CALL addrg
' C_lua_rotate_72 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_copy

 alignl ' align long
C_lua_copy ' <symbol:lua_copy>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r13, r17 ' CVI, CVU or LOAD
 mov r0, r15 ' CVI, CVU or LOAD
 mov r1, r13 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##-1001000 ' reg <- con
 cmps r19, r22 wcz
 if_ae jmp #\C_lua_copy_77 ' GEI4
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_copy_80 ' EQI4
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_copy_80 ' EQI4
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_copy_80 ' EQI4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_copy_80 ' JUMPV addrg
C_lua_copy_80
C_lua_copy_77
' C_lua_copy_76 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_pushvalue

 alignl ' align long
C_lua_pushvalue ' <symbol:lua_pushvalue>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r19 ' CVI, CVU or LOAD
 mov r1, r17 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_pushvalue_81 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_type

 alignl ' align long
C_lua_type ' <symbol:lua_type>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_type_86 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_lua_type_84 ' EQU4
C_lua_type_86
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22
 and r17, #15 ' BANDI4 coni
 jmp #\@C_lua_type_85 ' JUMPV addrg
C_lua_type_84
 mov r17, ##-1 ' reg <- con
C_lua_type_85
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_type_82 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_typename

 alignl ' align long
C_lua_typename ' <symbol:lua_typename>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaT__typenames_+4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_typename_87 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_iscfunction

 alignl ' align long
C_lua_iscfunction ' <symbol:lua_iscfunction>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #22 wz
 if_z jmp #\C_lua_iscfunction_93 ' EQI4
 cmps r22,  #102 wz
 if_nz jmp #\C_lua_iscfunction_91 ' NEI4
C_lua_iscfunction_93
 mov r17, #1 ' reg <- coni
 jmp #\@C_lua_iscfunction_92 ' JUMPV addrg
C_lua_iscfunction_91
 mov r17, #0 ' reg <- coni
C_lua_iscfunction_92
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_iscfunction_89 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_isinteger

 alignl ' align long
C_lua_isinteger ' <symbol:lua_isinteger>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_lua_isinteger_96 ' NEI4
 mov r19, #1 ' reg <- coni
 jmp #\@C_lua_isinteger_97 ' JUMPV addrg
C_lua_isinteger_96
 mov r19, #0 ' reg <- coni
C_lua_isinteger_97
 mov r0, r19 ' CVI, CVU or LOAD
' C_lua_isinteger_94 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_isnumber

 alignl ' align long
C_lua_isnumber ' <symbol:lua_isnumber>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_lua_isnumber_100 ' NEI4
 rdlong r22, r19 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r17, #1 ' reg <- coni
 jmp #\@C_lua_isnumber_101 ' JUMPV addrg
C_lua_isnumber_100
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_lua_isnumber_101
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_isnumber_98 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_isstring

 alignl ' align long
C_lua_isstring ' <symbol:lua_isstring>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, #4 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_isstring_106 ' EQI4
 cmps r20,  #3 wz
 if_nz jmp #\C_lua_isstring_104 ' NEI4
C_lua_isstring_106
 mov r17, #1 ' reg <- coni
 jmp #\@C_lua_isstring_105 ' JUMPV addrg
C_lua_isstring_104
 mov r17, #0 ' reg <- coni
C_lua_isstring_105
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_isstring_102 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_isuserdata

 alignl ' align long
C_lua_isuserdata ' <symbol:lua_isuserdata>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #71 wz
 if_z jmp #\C_lua_isuserdata_111 ' EQI4
 cmps r22,  #2 wz
 if_nz jmp #\C_lua_isuserdata_109 ' NEI4
C_lua_isuserdata_111
 mov r17, #1 ' reg <- coni
 jmp #\@C_lua_isuserdata_110 ' JUMPV addrg
C_lua_isuserdata_109
 mov r17, #0 ' reg <- coni
C_lua_isuserdata_110
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_isuserdata_107 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_rawequal

 alignl ' align long
C_lua_rawequal ' <symbol:lua_rawequal>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_rawequal_116 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_lua_rawequal_114 ' EQU4
C_lua_rawequal_116
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_rawequal_117 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_lua_rawequal_114 ' EQU4
C_lua_rawequal_117
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, ##0 ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #\@C_lua_rawequal_115 ' JUMPV addrg
C_lua_rawequal_114
 mov r13, #0 ' reg <- coni
C_lua_rawequal_115
 mov r0, r13 ' CVI, CVU or LOAD
' C_lua_rawequal_112 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_arith

 alignl ' align long
C_lua_arith ' <symbol:lua_arith>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #12 wz
 if_z jmp #\C_lua_arith_119 ' EQI4
 cmps r21,  #13 wz
 if_z jmp #\C_lua_arith_119 ' EQI4
 jmp #\@C_lua_arith_120 ' JUMPV addrg
C_lua_arith_119
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_arith_120
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-16 ' reg <- con
 adds r20, r22 ' ADDI/P (2)
 mov r2, r20 ' CVI, CVU or LOAD
 mov r18, ##-8 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r18 ' ADDI/P (3)
 mov r4, r20 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaO__arith
 add SP, #16 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_arith_118 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_compare

 alignl ' align long
C_lua_compare ' <symbol:lua_compare>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_compare_124 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_lua_compare_122 ' EQU4
C_lua_compare_124
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_compare_125 ' NEI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_lua_compare_122 ' EQU4
C_lua_compare_125
 cmps r17,  #0 wz
 if_z jmp #\C_lua_compare_128 ' EQI4
 cmps r17,  #1 wz
 if_z jmp #\C_lua_compare_129 ' EQI4
 cmps r17,  #2 wz
 if_z jmp #\C_lua_compare_130 ' EQI4
 jmp #\@C_lua_compare_126 ' JUMPV addrg
C_lua_compare_128
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_compare_127 ' JUMPV addrg
C_lua_compare_129
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__lessthan
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_compare_127 ' JUMPV addrg
C_lua_compare_130
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__lessequal
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_lua_compare_126
C_lua_compare_127
C_lua_compare_122
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_compare_121 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_stringtonumber

 alignl ' align long
C_lua_stringtonumber ' <symbol:lua_stringtonumber>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__str2num
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 if_z jmp #\C_lua_stringtonumber_132 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_stringtonumber_132
 mov r0, r19 ' CVI, CVU or LOAD
' C_lua_stringtonumber_131 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_tonumberx

 alignl ' align long
C_lua_tonumberx ' <symbol:lua_tonumberx>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##@C_lua_tonumberx_135_L000136
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_lua_tonumberx_138 ' NEI4
 rdlong r22, r17 ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r15, #1 ' reg <- coni
 jmp #\@C_lua_tonumberx_139 ' JUMPV addrg
C_lua_tonumberx_138
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_lua_tonumberx_139
 mov RI, FP
 sub RI, #-(-12)
 wrlong r15, RI ' ASGNI4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_tonumberx_140 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r19 ' ASGNI4 reg reg
C_lua_tonumberx_140
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
' C_lua_tonumberx_134 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_tointegerx

 alignl ' align long
C_lua_tointegerx ' <symbol:lua_tointegerx>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_lua_tointegerx_144 ' NEI4
 rdlong r22, r17 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r15, #1 ' reg <- coni
 jmp #\@C_lua_tointegerx_145 ' JUMPV addrg
C_lua_tointegerx_144
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointeger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_lua_tointegerx_145
 mov RI, FP
 sub RI, #-(-12)
 wrlong r15, RI ' ASGNI4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_tointegerx_146 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r19 ' ASGNI4 reg reg
C_lua_tointegerx_146
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_tointegerx_142 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_toboolean

 alignl ' align long
C_lua_toboolean ' <symbol:lua_toboolean>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_lua_toboolean_150 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_lua_toboolean_150 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_lua_toboolean_151 ' JUMPV addrg
C_lua_toboolean_150
 mov r17, #0 ' reg <- coni
C_lua_toboolean_151
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_toboolean_148 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_tolstring

 alignl ' align long
C_lua_tolstring ' <symbol:lua_tolstring>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, #4 ' reg <- coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_tolstring_153 ' EQI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #3 wz
 if_z jmp #\C_lua_tolstring_155 ' EQI4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_tolstring_157 ' EQU4
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
C_lua_tolstring_157
 mov r0, ##0 ' RET con
 jmp #\@C_lua_tolstring_152 ' JUMPV addrg
C_lua_tolstring_155
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__tostring
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_tolstring_159 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_tolstring_159
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_lua_tolstring_153
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_tolstring_161 ' EQU4
 mov r22, #4 ' reg <- coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_lua_tolstring_164 ' NEI4
 rdlong r22, r17 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #\@C_lua_tolstring_165 ' JUMPV addrg
C_lua_tolstring_164
 rdlong r22, r17 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRU4 reg
C_lua_tolstring_165
 wrlong r15, r19 ' ASGNU4 reg reg
C_lua_tolstring_161
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
C_lua_tolstring_152
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_rawlen

 alignl ' align long
C_lua_rawlen ' <symbol:lua_rawlen>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 mov r22, #4 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_lua_rawlen_170 ' EQI4
 cmps r19,  #5 wz
 if_z jmp #\C_lua_rawlen_173 ' EQI4
 cmps r19,  #7 wz
 if_z jmp #\C_lua_rawlen_172 ' EQI4
 cmps r19, r22 wcz
 if_b jmp #\C_lua_rawlen_167 ' LTI4
' C_lua_rawlen_174 ' (symbol refcount = 0)
 cmps r19,  #20 wz
 if_z jmp #\C_lua_rawlen_171 ' EQI4
 jmp #\@C_lua_rawlen_167 ' JUMPV addrg
C_lua_rawlen_170
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_lua_rawlen_166 ' JUMPV addrg
C_lua_rawlen_171
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #\@C_lua_rawlen_166 ' JUMPV addrg
C_lua_rawlen_172
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #\@C_lua_rawlen_166 ' JUMPV addrg
C_lua_rawlen_173
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__getn ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_lua_rawlen_166 ' JUMPV addrg
C_lua_rawlen_167
 mov r0, #0 ' reg <- coni
C_lua_rawlen_166
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_tocfunction

 alignl ' align long
C_lua_tocfunction ' <symbol:lua_tocfunction>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #22 wz
 if_nz jmp #\C_lua_tocfunction_176 ' NEI4
 rdlong r0, r19 ' reg <- INDIRP4 reg
 jmp #\@C_lua_tocfunction_175 ' JUMPV addrg
C_lua_tocfunction_176
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #102 wz
 if_nz jmp #\C_lua_tocfunction_178 ' NEI4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_lua_tocfunction_175 ' JUMPV addrg
C_lua_tocfunction_178
 mov r0, ##0 ' RET con
C_lua_tocfunction_175
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sb9s5_6709f9bc_touserdata_L000180 ' <symbol:touserdata>
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22
 and r23, #15 ' BANDI4 coni
 mov r22, #2 ' reg <- coni
 cmps r23, r22 wz
 if_z jmp #\C_sb9s5_6709f9bc_touserdata_L000180_189 ' EQI4
 cmps r23, r22 wcz
 if_b jmp #\C_sb9s5_6709f9bc_touserdata_L000180_182 ' LTI4
' C_sb9s5_6709f9bc_touserdata_L000180_190 ' (symbol refcount = 0)
 cmps r23,  #7 wz
 if_z jmp #\C_sb9s5_6709f9bc_touserdata_L000180_185 ' EQI4
 jmp #\@C_sb9s5_6709f9bc_touserdata_L000180_182 ' JUMPV addrg
C_sb9s5_6709f9bc_touserdata_L000180_185
 rdlong r22, r2 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_sb9s5_6709f9bc_touserdata_L000180_187 ' NEI4
 mov r21, #16 ' reg <- coni
 jmp #\@C_sb9s5_6709f9bc_touserdata_L000180_188 ' JUMPV addrg
C_sb9s5_6709f9bc_touserdata_L000180_187
 rdlong r22, r2 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #3 ' LSHU4 coni
 mov r21, r22
 add r21, #20 ' ADDU4 coni
C_sb9s5_6709f9bc_touserdata_L000180_188
 rdlong r22, r2 ' reg <- INDIRP4 reg
 mov r0, r21 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #\@C_sb9s5_6709f9bc_touserdata_L000180_181 ' JUMPV addrg
C_sb9s5_6709f9bc_touserdata_L000180_189
 rdlong r0, r2 ' reg <- INDIRP4 reg
 jmp #\@C_sb9s5_6709f9bc_touserdata_L000180_181 ' JUMPV addrg
C_sb9s5_6709f9bc_touserdata_L000180_182
 mov r0, ##0 ' RET con
C_sb9s5_6709f9bc_touserdata_L000180_181
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_touserdata

 alignl ' align long
C_lua_touserdata ' <symbol:lua_touserdata>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb9s5_6709f9bc_touserdata_L000180 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_touserdata_191 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_tothread

 alignl ' align long
C_lua_tothread ' <symbol:lua_tothread>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #72 wz
 if_z jmp #\C_lua_tothread_194 ' EQI4
 mov r17, ##0 ' reg <- con
 jmp #\@C_lua_tothread_195 ' JUMPV addrg
C_lua_tothread_194
 rdlong r17, r19 ' reg <- INDIRP4 reg
C_lua_tothread_195
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_tothread_192 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_topointer

 alignl ' align long
C_lua_topointer ' <symbol:lua_topointer>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 mov r22, #7 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_lua_topointer_201 ' EQI4
 cmps r19, r22 wcz
 if_a jmp #\C_lua_topointer_205 ' GTI4
' C_lua_topointer_204 ' (symbol refcount = 0)
 cmps r19,  #2 wz
 if_z jmp #\C_lua_topointer_201 ' EQI4
 jmp #\@C_lua_topointer_197 ' JUMPV addrg
C_lua_topointer_205
 cmps r19,  #22 wz
 if_z jmp #\C_lua_topointer_200 ' EQI4
 jmp #\@C_lua_topointer_197 ' JUMPV addrg
C_lua_topointer_200
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_lua_topointer_196 ' JUMPV addrg
C_lua_topointer_201
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sb9s5_6709f9bc_touserdata_L000180 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_lua_topointer_196 ' JUMPV addrg
C_lua_topointer_197
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_lua_topointer_202 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_lua_topointer_196 ' JUMPV addrg
C_lua_topointer_202
 mov r0, ##0 ' RET con
C_lua_topointer_196
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_pushnil

 alignl ' align long
C_lua_pushnil ' <symbol:lua_pushnil>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_pushnil_206 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_pushnumber

 alignl ' align long
C_lua_pushnumber ' <symbol:lua_pushnumber>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 wrlong r2, r23 ' ASGNF4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_pushnumber_207 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_pushinteger

 alignl ' align long
C_lua_pushinteger ' <symbol:lua_pushinteger>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 wrlong r2, r23 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_pushinteger_208 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_pushlstring

 alignl ' align long
C_lua_pushlstring ' <symbol:lua_pushlstring>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 if_nz jmp #\C_lua_pushlstring_213  ' NEU4
 mov r2, ##@C_lua_pushlstring_210_L000211 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #\@C_lua_pushlstring_214 ' JUMPV addrg
C_lua_pushlstring_213
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_lua_pushlstring_214
 mov r17, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r11, r17 ' CVI, CVU or LOAD
 wrlong r11, r13 ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_pushlstring_215 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushlstring_215
 mov r0, r17
 adds r0, #16 ' ADDP4 coni
' C_lua_pushlstring_209 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_pushstring

 alignl ' align long
C_lua_pushstring ' <symbol:lua_pushstring>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_lua_pushstring_218  ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_lua_pushstring_219 ' JUMPV addrg
C_lua_pushstring_218
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r21, r22
 adds r21, #16 ' ADDP4 coni
C_lua_pushstring_219
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_pushstring_220 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushstring_220
 mov r0, r21 ' CVI, CVU or LOAD
' C_lua_pushstring_217 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export lua_pushvfstring

 alignl ' align long
C_lua_pushvfstring ' <symbol:lua_pushvfstring>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushvfstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_pushvfstring_223 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushvfstring_223
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_pushvfstring_222 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_pushfstring

 alignl ' align long
C_lua_pushfstring ' <symbol:lua_pushfstring>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushvfstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_pushfstring_227 ' LEI4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushfstring_227
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_pushfstring_225 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_pushcclosure

 alignl ' align long
C_lua_pushcclosure ' <symbol:lua_pushcclosure>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 if_nz jmp #\C_lua_pushcclosure_230 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #22 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_lua_pushcclosure_231 ' JUMPV addrg
C_lua_pushcclosure_230
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__newC_closure
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r19
 shl r18, #3 ' LSHI4 coni
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_lua_pushcclosure_233 ' JUMPV addrg
C_lua_pushcclosure_232
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r17
 adds r20, #16 ' ADDP4 coni
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r0, r15 ' CVI, CVU or LOAD
 mov r1, r13 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_pushcclosure_233
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 subs r19, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_pushcclosure_232 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #102 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_pushcclosure_235 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushcclosure_235
C_lua_pushcclosure_231
' C_lua_pushcclosure_229 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_pushboolean

 alignl ' align long
C_lua_pushboolean ' <symbol:lua_pushboolean>
 calld PA,#PSHM
 long $500000 ' save registers
 cmps r2,  #0 wz
 if_z jmp #\C_lua_pushboolean_238 ' EQI4
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_lua_pushboolean_239 ' JUMPV addrg
C_lua_pushboolean_238
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_pushboolean_239
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_pushboolean_237 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_pushlightuserdata

 alignl ' align long
C_lua_pushlightuserdata ' <symbol:lua_pushlightuserdata>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 wrlong r2, r23 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_pushlightuserdata_240 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_pushthread

 alignl ' align long
C_lua_pushthread ' <symbol:lua_pushthread>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #72 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #144 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_lua_pushthread_243  ' NEU4
 mov r23, #1 ' reg <- coni
 jmp #\@C_lua_pushthread_244 ' JUMPV addrg
C_lua_pushthread_243
 mov r23, #0 ' reg <- coni
C_lua_pushthread_244
 mov r0, r23 ' CVI, CVU or LOAD
' C_lua_pushthread_241 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb9s7_6709f9bc_auxgetstr_L000245 ' <symbol:auxgetstr>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_sb9s7_6709f9bc_auxgetstr_L000245_251 ' EQI4
 mov r17, ##0 ' reg <- con
 mov r15, #0 ' reg <- coni
 jmp #\@C_sb9s7_6709f9bc_auxgetstr_L000245_252 ' JUMPV addrg
C_sb9s7_6709f9bc_auxgetstr_L000245_251
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getstr
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sb9s7_6709f9bc_auxgetstr_L000245_253 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #\@C_sb9s7_6709f9bc_auxgetstr_L000245_254 ' JUMPV addrg
C_sb9s7_6709f9bc_auxgetstr_L000245_253
 mov r13, #0 ' reg <- coni
C_sb9s7_6709f9bc_auxgetstr_L000245_254
 mov r15, r13 ' CVI, CVU or LOAD
C_sb9s7_6709f9bc_auxgetstr_L000245_252
 cmps r15,  #0 wz
 if_z jmp #\C_sb9s7_6709f9bc_auxgetstr_L000245_247 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_sb9s7_6709f9bc_auxgetstr_L000245_248 ' JUMPV addrg
C_sb9s7_6709f9bc_auxgetstr_L000245_247
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
C_sb9s7_6709f9bc_auxgetstr_L000245_248
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_sb9s7_6709f9bc_auxgetstr_L000245_246 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export lua_getglobal

 alignl ' align long
C_lua_getglobal ' <symbol:lua_getglobal>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s7_6709f9bc_auxgetstr_L000245
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_getglobal_255 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_gettable

 alignl ' align long
C_lua_gettable ' <symbol:lua_gettable>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_lua_gettable_261 ' EQI4
 mov r19, ##0 ' reg <- con
 mov r15, #0 ' reg <- coni
 jmp #\@C_lua_gettable_262 ' JUMPV addrg
C_lua_gettable_261
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_lua_gettable_263 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #\@C_lua_gettable_264 ' JUMPV addrg
C_lua_gettable_263
 mov r13, #0 ' reg <- coni
C_lua_gettable_264
 mov r15, r13 ' CVI, CVU or LOAD
C_lua_gettable_262
 cmps r15,  #0 wz
 if_z jmp #\C_lua_gettable_257 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_lua_gettable_258 ' JUMPV addrg
C_lua_gettable_257
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r17 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
C_lua_gettable_258
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_lua_gettable_256 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_getfield

 alignl ' align long
C_lua_getfield ' <symbol:lua_getfield>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s7_6709f9bc_auxgetstr_L000245
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_getfield_265 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_geti

 alignl ' align long
C_lua_geti ' <symbol:lua_geti>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_lua_geti_272 ' EQI4
 mov r15, ##0 ' reg <- con
 mov r13, #0 ' reg <- coni
 jmp #\@C_lua_geti_273 ' JUMPV addrg
C_lua_geti_272
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_lua_geti_276 ' GEU4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r9, r22 ' ADDI/P
 adds r9, r20 ' ADDI/P (3)
 jmp #\@C_lua_geti_277 ' JUMPV addrg
C_lua_geti_276
 mov r2, r19 ' CVI, CVU or LOAD
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_lua_geti_277
 mov r15, r9 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_lua_geti_274 ' EQI4
 mov r11, #1 ' reg <- coni
 jmp #\@C_lua_geti_275 ' JUMPV addrg
C_lua_geti_274
 mov r11, #0 ' reg <- coni
C_lua_geti_275
 mov r13, r11 ' CVI, CVU or LOAD
C_lua_geti_273
 cmps r13,  #0 wz
 if_z jmp #\C_lua_geti_267 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_lua_geti_268 ' JUMPV addrg
C_lua_geti_267
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, r17 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
C_lua_geti_268
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_lua_geti_266 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb9s8_6709f9bc_finishrawget_L000278 ' <symbol:finishrawget>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_sb9s8_6709f9bc_finishrawget_L000278_280 ' NEI4
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sb9s8_6709f9bc_finishrawget_L000278_281 ' JUMPV addrg
C_sb9s8_6709f9bc_finishrawget_L000278_280
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sb9s8_6709f9bc_finishrawget_L000278_281
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_sb9s8_6709f9bc_finishrawget_L000278_279 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb9s9_6709f9bc_gettable_L000282 ' <symbol:gettable>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_sb9s9_6709f9bc_gettable_L000282_283 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_rawget

 alignl ' align long
C_lua_rawget ' <symbol:lua_rawget>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s9_6709f9bc_gettable_L000282
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s8_6709f9bc_finishrawget_L000278
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_rawget_284 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_rawgeti

 alignl ' align long
C_lua_rawgeti ' <symbol:lua_rawgeti>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s9_6709f9bc_gettable_L000282
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s8_6709f9bc_finishrawget_L000278
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_rawgeti_285 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_rawgetp

 alignl ' align long
C_lua_rawgetp ' <symbol:lua_rawgetp>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s9_6709f9bc_gettable_L000282
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r17, FP
 sub r17, #-(-16) ' reg <- addrli
 wrlong r19, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s8_6709f9bc_finishrawget_L000278
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_rawgetp_286 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export lua_createtable

 alignl ' align long
C_lua_createtable ' <symbol:lua_createtable>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__new ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 cmps r21, r22 wcz
 if_a jmp #\C_lua_createtable_290 ' GTI4
 cmps r19, r22 wcz
 if_be jmp #\C_lua_createtable_288 ' LEI4
C_lua_createtable_290
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
C_lua_createtable_288
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_createtable_291 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_createtable_291
' C_lua_createtable_287 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_getmetatable

 alignl ' align long
C_lua_getmetatable ' <symbol:lua_getmetatable>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #15 ' BANDI4 coni
 cmps r19,  #5 wz
 if_z jmp #\C_lua_getmetatable_297 ' EQI4
 cmps r19,  #7 wz
 if_z jmp #\C_lua_getmetatable_298 ' EQI4
 jmp #\@C_lua_getmetatable_294 ' JUMPV addrg
C_lua_getmetatable_297
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_lua_getmetatable_295 ' JUMPV addrg
C_lua_getmetatable_298
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_lua_getmetatable_295 ' JUMPV addrg
C_lua_getmetatable_294
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
C_lua_getmetatable_295
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_lua_getmetatable_299 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_getmetatable_299
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_getmetatable_293 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Export lua_getiuservalue

 alignl ' align long
C_lua_getiuservalue ' <symbol:lua_getiuservalue>
 calld PA,#NEWF
 sub SP, #16
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
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 cmps r19,  #0 wcz
 if_be jmp #\C_lua_getiuservalue_304 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r19, r22 wcz
 if_be jmp #\C_lua_getiuservalue_302 ' LEI4
C_lua_getiuservalue_304
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_getiuservalue_303 ' JUMPV addrg
C_lua_getiuservalue_302
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_getiuservalue_303
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_getiuservalue_301 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb9sa_6709f9bc_auxsetstr_L000305 ' <symbol:auxsetstr>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_sb9sa_6709f9bc_auxsetstr_L000305_311 ' EQI4
 mov r17, ##0 ' reg <- con
 mov r15, #0 ' reg <- coni
 jmp #\@C_sb9sa_6709f9bc_auxsetstr_L000305_312 ' JUMPV addrg
C_sb9sa_6709f9bc_auxsetstr_L000305_311
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getstr
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sb9sa_6709f9bc_auxsetstr_L000305_313 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #\@C_sb9sa_6709f9bc_auxsetstr_L000305_314 ' JUMPV addrg
C_sb9sa_6709f9bc_auxsetstr_L000305_313
 mov r13, #0 ' reg <- coni
C_sb9sa_6709f9bc_auxsetstr_L000305_314
 mov r15, r13 ' CVI, CVU or LOAD
C_sb9sa_6709f9bc_auxsetstr_L000305_312
 cmps r15,  #0 wz
 if_z jmp #\C_sb9sa_6709f9bc_auxsetstr_L000305_307 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, ##-4 ' reg <- con
 adds r18, r22 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_sb9sa_6709f9bc_auxsetstr_L000305_316 ' EQI4
 rdlong r18, r21 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_sb9sa_6709f9bc_auxsetstr_L000305_316 ' EQI4
 mov r18, ##-8 ' reg <- con
 adds r22, r18 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_sb9sa_6709f9bc_auxsetstr_L000305_316 ' EQI4
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_sb9sa_6709f9bc_auxsetstr_L000305_316 ' JUMPV addrg
C_sb9sa_6709f9bc_auxsetstr_L000305_316
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_sb9sa_6709f9bc_auxsetstr_L000305_308 ' JUMPV addrg
C_sb9sa_6709f9bc_auxsetstr_L000305_307
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-16 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r20, ##-8 ' reg <- con
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-16 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_sb9sa_6709f9bc_auxsetstr_L000305_308
' C_sb9sa_6709f9bc_auxsetstr_L000305_306 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export lua_setglobal

 alignl ' align long
C_lua_setglobal ' <symbol:lua_setglobal>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9sa_6709f9bc_auxsetstr_L000305
 add SP, #8 ' CALL addrg
' C_lua_setglobal_317 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_settable

 alignl ' align long
C_lua_settable ' <symbol:lua_settable>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_lua_settable_323 ' EQI4
 mov r17, ##0 ' reg <- con
 mov r15, #0 ' reg <- coni
 jmp #\@C_lua_settable_324 ' JUMPV addrg
C_lua_settable_323
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-16 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 rdlong r3, r19 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_lua_settable_325 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #\@C_lua_settable_326 ' JUMPV addrg
C_lua_settable_325
 mov r13, #0 ' reg <- coni
C_lua_settable_326
 mov r15, r13 ' CVI, CVU or LOAD
C_lua_settable_324
 cmps r15,  #0 wz
 if_z jmp #\C_lua_settable_319 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, ##-4 ' reg <- con
 adds r18, r22 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_settable_328 ' EQI4
 rdlong r18, r19 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_settable_328 ' EQI4
 mov r18, ##-8 ' reg <- con
 adds r22, r18 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_lua_settable_328 ' EQI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_settable_328 ' JUMPV addrg
C_lua_settable_328
 jmp #\@C_lua_settable_320 ' JUMPV addrg
C_lua_settable_319
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r20, ##-16 ' reg <- con
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
C_lua_settable_320
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-16 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_settable_318 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_setfield

 alignl ' align long
C_lua_setfield ' <symbol:lua_setfield>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9sa_6709f9bc_auxsetstr_L000305
 add SP, #8 ' CALL addrg
' C_lua_setfield_329 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_seti

 alignl ' align long
C_lua_seti ' <symbol:lua_seti>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $feaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_z jmp #\C_lua_seti_336 ' EQI4
 mov r15, ##0 ' reg <- con
 mov r13, #0 ' reg <- coni
 jmp #\@C_lua_seti_337 ' JUMPV addrg
C_lua_seti_336
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 if_ae jmp #\C_lua_seti_340 ' GEU4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r9, r22 ' ADDI/P
 adds r9, r20 ' ADDI/P (3)
 jmp #\@C_lua_seti_341 ' JUMPV addrg
C_lua_seti_340
 mov r2, r19 ' CVI, CVU or LOAD
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_lua_seti_341
 mov r15, r9 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_lua_seti_338 ' EQI4
 mov r11, #1 ' reg <- coni
 jmp #\@C_lua_seti_339 ' JUMPV addrg
C_lua_seti_338
 mov r11, #0 ' reg <- coni
C_lua_seti_339
 mov r13, r11 ' CVI, CVU or LOAD
C_lua_seti_337
 cmps r13,  #0 wz
 if_z jmp #\C_lua_seti_331 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, ##-4 ' reg <- con
 adds r18, r22 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_seti_343 ' EQI4
 rdlong r18, r17 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_seti_343 ' EQI4
 mov r18, ##-8 ' reg <- con
 adds r22, r18 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_lua_seti_343 ' EQI4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_seti_343 ' JUMPV addrg
C_lua_seti_343
 jmp #\@C_lua_seti_332 ' JUMPV addrg
C_lua_seti_331
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, r17 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
C_lua_seti_332
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_seti_330 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb9sb_6709f9bc_aux_rawset_L000344 ' <symbol:aux_rawset>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s9_6709f9bc_gettable_L000282
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__set
 add SP, #12 ' CALL addrg
 mov r22, r15
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffffc0 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, ##-4 ' reg <- con
 adds r18, r22 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_sb9sb_6709f9bc_aux_rawset_L000344_347 ' EQI4
 mov r18, r15
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_sb9sb_6709f9bc_aux_rawset_L000344_347 ' EQI4
 mov r18, ##-8 ' reg <- con
 adds r22, r18 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_sb9sb_6709f9bc_aux_rawset_L000344_347 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_sb9sb_6709f9bc_aux_rawset_L000344_347 ' JUMPV addrg
C_sb9sb_6709f9bc_aux_rawset_L000344_347
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r17
 shl r18, #3 ' LSHI4 coni
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_sb9sb_6709f9bc_aux_rawset_L000344_345 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_rawset

 alignl ' align long
C_lua_rawset ' <symbol:lua_rawset>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-16 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9sb_6709f9bc_aux_rawset_L000344
 add SP, #12 ' CALL addrg
' C_lua_rawset_348 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_rawsetp

 alignl ' align long
C_lua_rawsetp ' <symbol:lua_rawsetp>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, FP
 sub r17, #-(-12) ' reg <- addrli
 wrlong r19, r17 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9sb_6709f9bc_aux_rawset_L000344
 add SP, #12 ' CALL addrg
' C_lua_rawsetp_349 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_rawseti

 alignl ' align long
C_lua_rawseti ' <symbol:lua_rawseti>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s9_6709f9bc_gettable_L000282
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__setint
 add SP, #12 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, ##-4 ' reg <- con
 adds r18, r22 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_rawseti_352 ' EQI4
 mov r18, r17
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_rawseti_352 ' EQI4
 mov r18, ##-8 ' reg <- con
 adds r22, r18 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_lua_rawseti_352 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_rawseti_352 ' JUMPV addrg
C_lua_rawseti_352
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_rawseti_350 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_setmetatable

 alignl ' align long
C_lua_setmetatable ' <symbol:lua_setmetatable>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_setmetatable_354 ' NEI4
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_lua_setmetatable_355 ' JUMPV addrg
C_lua_setmetatable_354
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
C_lua_setmetatable_355
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 and r19, #15 ' BANDI4 coni
 cmps r19,  #5 wz
 if_z jmp #\C_lua_setmetatable_359 ' EQI4
 cmps r19,  #7 wz
 if_z jmp #\C_lua_setmetatable_364 ' EQI4
 jmp #\@C_lua_setmetatable_356 ' JUMPV addrg
C_lua_setmetatable_359
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_lua_setmetatable_357 ' EQU4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_setmetatable_363 ' EQI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_setmetatable_363 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_setmetatable_363 ' JUMPV addrg
C_lua_setmetatable_363
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__checkfinalizer
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_setmetatable_357 ' JUMPV addrg
C_lua_setmetatable_364
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_lua_setmetatable_357 ' EQU4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_setmetatable_368 ' EQI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_setmetatable_368 ' EQI4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_setmetatable_368 ' JUMPV addrg
C_lua_setmetatable_368
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__checkfinalizer
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_setmetatable_357 ' JUMPV addrg
C_lua_setmetatable_356
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_setmetatable_357
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, #1 ' reg <- coni
' C_lua_setmetatable_353 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_setiuservalue

 alignl ' align long
C_lua_setiuservalue ' <symbol:lua_setiuservalue>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #6 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_lua_setiuservalue_370 ' LTU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_setiuservalue_371 ' JUMPV addrg
C_lua_setiuservalue_370
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, ##-4 ' reg <- con
 adds r18, r22 ' ADDI/P (2)
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_setiuservalue_373 ' EQI4
 rdlong r18, r17 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_setiuservalue_373 ' EQI4
 mov r18, ##-8 ' reg <- con
 adds r22, r18 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_lua_setiuservalue_373 ' EQI4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_setiuservalue_373 ' JUMPV addrg
C_lua_setiuservalue_373
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_setiuservalue_371
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_setiuservalue_369 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export lua_callk

 alignl ' align long
C_lua_callk ' <symbol:lua_callk>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23
 shl r20, #3 ' LSHI4 coni
 adds r20, #8 ' ADDI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_callk_375 ' EQU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff0000 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_nz jmp #\C_lua_callk_375  ' NEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_callk_376 ' JUMPV addrg
C_lua_callk_375
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
C_lua_callk_376
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wcz
 if_a jmp #\C_lua_callk_377 ' GTI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_ae jmp #\C_lua_callk_377 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
C_lua_callk_377
' C_lua_callk_374 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb9sc_6709f9bc_f_call_L000379 ' <symbol:f_call>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 rdlong r3, r19 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
' C_sb9sc_6709f9bc_f_call_L000379_380 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_pcallk

 alignl ' align long
C_lua_pcallk ' <symbol:lua_pcallk>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 if_nz jmp #\C_lua_pcallk_382 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_pcallk_383 ' JUMPV addrg
C_lua_pcallk_382
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s1_6709f9bc_index2stack_L000028
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_pcallk_383
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #3 ' LSHI4 coni
 adds r20, #8 ' ADDI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_pcallk_386 ' EQU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffff0000 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 if_z jmp #\C_lua_pcallk_384 ' EQU4
C_lua_pcallk_386
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r22
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 sub r20, r18 ' SUBU (1)
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, ##@C_sb9sc_6709f9bc_f_call_L000379 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaD__pcall
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_pcallk_385 ' JUMPV addrg
C_lua_pcallk_384
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #20 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #24 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, FP
 add r18, #8 ' reg <- addrfi
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #92 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #92 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 rdword r20, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r18, ##-2 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, FP
 add r18, #8 ' reg <- addrfi
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 or r20, r18 ' BORI/U (1)
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 rdword r20, r22 ' reg <- CVUI4 INDIRU2 reg
 or r20, #16 ' BORI4 coni
 wrword r20, r22 ' ASGNU2 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 rdword r20, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r18, ##-17 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #92 ' ADDP4 coni
 mov r20, r15
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_pcallk_385
 mov r22, ##-1 ' reg <- con
 cmps r23, r22 wcz
 if_a jmp #\C_lua_pcallk_388 ' GTI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r20, r22 wcz 
 if_ae jmp #\C_lua_pcallk_388 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
C_lua_pcallk_388
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_pcallk_381 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Export lua_load

 alignl ' align long
C_lua_load ' <symbol:lua_load>
 calld PA,#NEWF
 sub SP, #36
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_lua_load_391  ' NEU4
 mov r19, ##@C_lua_load_393_L000394 ' reg <- addrg
C_lua_load_391
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaZ__init
 add SP, #12 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__protectedparser
 add SP, #12 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_nz jmp #\C_lua_load_395 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wcz
 if_b jmp #\C_lua_load_397 ' LTI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-40) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_load_400 ' EQI4
 mov r18, FP
 sub r18, #-(-28) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #16 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_load_400 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_lua_load_400 ' EQI4
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_load_400 ' JUMPV addrg
C_lua_load_400
C_lua_load_397
C_lua_load_395
 mov r0, r15 ' CVI, CVU or LOAD
' C_lua_load_390 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #36 ' framesize
 calld PA,#RETF


' Catalina Export lua_dump

 alignl ' align long
C_lua_dump ' <symbol:lua_dump>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #70 wz
 if_nz jmp #\C_lua_dump_402 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaU__dump
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_dump_403 ' JUMPV addrg
C_lua_dump_402
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_dump_403
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_dump_401 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_status

 alignl ' align long
C_lua_status ' <symbol:lua_status>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #6 ' ADDP4 coni
 rdbyte r0, r22 ' reg <- CVUI4 INDIRU1 reg
' C_lua_status_404 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_gc

 alignl ' align long
C_lua_gc ' <symbol:lua_gc>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $f40000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_lua_gc_406 ' EQI4
 mov r0, ##-1 ' RET con
 jmp #\@C_lua_gc_405 ' JUMPV addrg
C_lua_gc_406
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_b jmp #\C_lua_gc_409 ' LTI4
 cmps r22,  #11 wcz
 if_a jmp #\C_lua_gc_409 ' GTI4
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_lua_gc_449_L000451 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_lua_gc_449_L000451 ' <symbol:449>
 long @C_lua_gc_411
 long @C_lua_gc_412
 long @C_lua_gc_413
 long @C_lua_gc_414
 long @C_lua_gc_415
 long @C_lua_gc_416
 long @C_lua_gc_423
 long @C_lua_gc_424
 long @C_lua_gc_409
 long @C_lua_gc_425
 long @C_lua_gc_429
 long @C_lua_gc_438

' Catalina Code

DAT ' code segment
C_lua_gc_411
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_412
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_413
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__fullgc
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_414
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 shr r22, #10 ' RSHU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_415
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##1023 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_416
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-24)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_gc_417 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
 jmp #\@C_lua_gc_418 ' JUMPV addrg
C_lua_gc_417
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #10 ' LSHI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_gc_419 ' LEI4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_gc_419
C_lua_gc_418
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_gc_410 ' LEI4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_lua_gc_410 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_423
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #2 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNI4 addrli reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_424
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #65 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #2 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNI4 addrli reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_425
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_gc_427 ' NEI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_lua_gc_428 ' JUMPV addrg
C_lua_gc_427
 mov r21, #0 ' reg <- coni
C_lua_gc_428
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNI4 addrli reg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_429
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_lua_gc_433 ' EQI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_lua_gc_431 ' EQU4
C_lua_gc_433
 mov r21, #10 ' reg <- coni
 jmp #\@C_lua_gc_432 ' JUMPV addrg
C_lua_gc_431
 mov r21, #11 ' reg <- coni
C_lua_gc_432
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_lua_gc_434 ' EQI4
 mov r22, r23
 adds r22, #60 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_434
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_lua_gc_436 ' EQI4
 mov r22, r23
 adds r22, #61 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_436
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__changemode
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_438
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r20, ##-4 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_lua_gc_442 ' EQI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_lua_gc_440 ' EQU4
C_lua_gc_442
 mov r21, #10 ' reg <- coni
 jmp #\@C_lua_gc_441 ' JUMPV addrg
C_lua_gc_440
 mov r21, #11 ' reg <- coni
C_lua_gc_441
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_lua_gc_443 ' EQI4
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_443
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_lua_gc_445 ' EQI4
 mov r22, r23
 adds r22, #65 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_445
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_lua_gc_447 ' EQI4
 mov r22, r23
 adds r22, #66 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_447
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__changemode
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_gc_410 ' JUMPV addrg
C_lua_gc_409
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_lua_gc_410
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_lua_gc_405
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Export lua_error

 alignl ' align long
C_lua_error ' <symbol:lua_error>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #68 wz
 if_nz jmp #\C_lua_error_453 ' NEI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #148 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_lua_error_453  ' NEU4
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_error_454 ' JUMPV addrg
C_lua_error_453
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaG__errormsg ' CALL addrg
C_lua_error_454
 mov r0, #0 ' reg <- coni
' C_lua_error_452 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_next

 alignl ' align long
C_lua_next ' <symbol:lua_next>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s9_6709f9bc_gettable_L000282
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-8 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__next
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 if_z jmp #\C_lua_next_456 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #\@C_lua_next_457 ' JUMPV addrg
C_lua_next_456
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_next_457
 mov r0, r19 ' CVI, CVU or LOAD
' C_lua_next_455 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_toclose

 alignl ' align long
C_lua_toclose ' <symbol:lua_toclose>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s1_6709f9bc_index2stack_L000028
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__newtbcupval
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wcz
 if_b jmp #\C_lua_toclose_459 ' LTI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 neg r20, r20 ' NEGI4
 subs r20, #3 ' SUBI4 coni
 wrword r20, r22 ' ASGNI2 reg reg
C_lua_toclose_459
' C_lua_toclose_458 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_concat

 alignl ' align long
C_lua_concat ' <symbol:lua_concat>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #0 wcz
 if_be jmp #\C_lua_concat_462 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__concat
 add SP, #4 ' CALL addrg
 jmp #\@C_lua_concat_463 ' JUMPV addrg
C_lua_concat_462
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C_lua_pushlstring_210_L000211 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_concat_463
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_concat_464 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_concat_464
' C_lua_concat_461 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_len

 alignl ' align long
C_lua_len ' <symbol:lua_len>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__objlen
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_len_466 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_getallocf

 alignl ' align long
C_lua_getallocf ' <symbol:lua_getallocf>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_getallocf_468 ' EQU4
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r2 ' ASGNP4 reg reg
C_lua_getallocf_468
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_getallocf_467 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_setallocf

 alignl ' align long
C_lua_setallocf ' <symbol:lua_setallocf>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r4
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r3, r22 ' ASGNP4 reg reg
' C_lua_setallocf_470 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_setwarnf

 alignl ' align long
C_lua_setwarnf ' <symbol:lua_setwarnf>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r4
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##716 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##712 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 wrlong r3, r22 ' ASGNP4 reg reg
' C_lua_setwarnf_471 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export lua_warning

 alignl ' align long
C_lua_warning ' <symbol:lua_warning>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__warning
 add SP, #8 ' CALL addrg
' C_lua_warning_472 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export lua_newuserdatauv

 alignl ' align long
C_lua_newuserdatauv ' <symbol:lua_newuserdatauv>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__newudata
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r15 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #71 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_lua_newuserdatauv_474 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaC__step ' CALL addrg
C_lua_newuserdatauv_474
 mov r22, r17
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_lua_newuserdatauv_477 ' NEI4
 mov r15, #16 ' reg <- coni
 jmp #\@C_lua_newuserdatauv_478 ' JUMPV addrg
C_lua_newuserdatauv_477
 mov r22, r17
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #3 ' LSHU4 coni
 mov r15, r22
 add r15, #20 ' ADDU4 coni
C_lua_newuserdatauv_478
 mov r0, r15 ' ADDI/P
 adds r0, r17 ' ADDI/P (3)
' C_lua_newuserdatauv_473 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sb9sg_6709f9bc_aux_upvalue_L000479 ' <symbol:aux_upvalue>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r22, r5
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22
 and r23, #63 ' BANDI4 coni
 mov r22, #6 ' reg <- coni
 cmps r23, r22 wz
 if_z jmp #\C_sb9sg_6709f9bc_aux_upvalue_L000479_489 ' EQI4
 cmps r23, r22 wcz
 if_b jmp #\C_sb9sg_6709f9bc_aux_upvalue_L000479_481 ' LTI4
' C_sb9sg_6709f9bc_aux_upvalue_L000479_499 ' (symbol refcount = 0)
 cmps r23,  #38 wz
 if_z jmp #\C_sb9sg_6709f9bc_aux_upvalue_L000479_484 ' EQI4
 jmp #\@C_sb9sg_6709f9bc_aux_upvalue_L000479_481 ' JUMPV addrg
C_sb9sg_6709f9bc_aux_upvalue_L000479_484
 rdlong r22, r5 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r4 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #6 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb9sg_6709f9bc_aux_upvalue_L000479_485 ' LTU4
 mov r0, ##0 ' RET con
 jmp #\@C_sb9sg_6709f9bc_aux_upvalue_L000479_480 ' JUMPV addrg
C_sb9sg_6709f9bc_aux_upvalue_L000479_485
 mov r22, r4
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r22, r3 ' ASGNP4 reg reg
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb9sg_6709f9bc_aux_upvalue_L000479_487 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r2 ' ASGNP4 reg reg
C_sb9sg_6709f9bc_aux_upvalue_L000479_487
 mov r0, ##@C_lua_pushlstring_210_L000211 ' reg <- addrg
 jmp #\@C_sb9sg_6709f9bc_aux_upvalue_L000479_480 ' JUMPV addrg
C_sb9sg_6709f9bc_aux_upvalue_L000479_489
 rdlong r22, r5 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r4 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_sb9sg_6709f9bc_aux_upvalue_L000479_490 ' LTU4
 mov r0, ##0 ' RET con
 jmp #\@C_sb9sg_6709f9bc_aux_upvalue_L000479_480 ' JUMPV addrg
C_sb9sg_6709f9bc_aux_upvalue_L000479_490
 mov r22, r4
 shl r22, #2 ' LSHI4 coni
 subs r22, #4 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r3 ' ASGNP4 reg reg
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb9sg_6709f9bc_aux_upvalue_L000479_492 ' EQU4
 mov r22, r4
 shl r22, #2 ' LSHI4 coni
 subs r22, #4 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r2 ' ASGNP4 reg reg
C_sb9sg_6709f9bc_aux_upvalue_L000479_492
 mov r22, r4
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #60 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_sb9sg_6709f9bc_aux_upvalue_L000479_497  ' NEU4
 mov r21, ##@C_sb9sg_6709f9bc_aux_upvalue_L000479_494_L000495 ' reg <- addrg
 jmp #\@C_sb9sg_6709f9bc_aux_upvalue_L000479_498 ' JUMPV addrg
C_sb9sg_6709f9bc_aux_upvalue_L000479_497
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r21, r22
 adds r21, #16 ' ADDP4 coni
C_sb9sg_6709f9bc_aux_upvalue_L000479_498
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C_sb9sg_6709f9bc_aux_upvalue_L000479_480 ' JUMPV addrg
C_sb9sg_6709f9bc_aux_upvalue_L000479_481
 mov r0, ##0 ' RET con
C_sb9sg_6709f9bc_aux_upvalue_L000479_480
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export lua_getupvalue

 alignl ' align long
C_lua_getupvalue ' <symbol:lua_getupvalue>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9sg_6709f9bc_aux_upvalue_L000479
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_getupvalue_501 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_getupvalue_501
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_getupvalue_500 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export lua_setupvalue

 alignl ' align long
C_lua_setupvalue ' <symbol:lua_setupvalue>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9sg_6709f9bc_aux_upvalue_L000479
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_lua_setupvalue_504 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_setupvalue_507 ' EQI4
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #5 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #32 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_lua_setupvalue_507 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_lua_setupvalue_507 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_setupvalue_507 ' JUMPV addrg
C_lua_setupvalue_507
C_lua_setupvalue_504
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_setupvalue_503 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb9si_6709f9bc_getupvalref_L000508_nullup_L000511 ' <symbol:nullup>
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sb9si_6709f9bc_getupvalref_L000508 ' <symbol:getupvalref>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sb9si_6709f9bc_getupvalref_L000508_512 ' EQU4
 wrlong r15, r17 ' ASGNP4 reg reg
C_sb9si_6709f9bc_getupvalref_L000508_512
 mov r22, #1 ' reg <- coni
 cmps r22, r19 wcz
 if_a jmp #\C_sb9si_6709f9bc_getupvalref_L000508_514 ' GTI4
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wcz
 if_a jmp #\C_sb9si_6709f9bc_getupvalref_L000508_514 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 subs r22, #4 ' SUBI4 coni
 mov r20, r15
 adds r20, #16 ' ADDP4 coni
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_sb9si_6709f9bc_getupvalref_L000508_509 ' JUMPV addrg
C_sb9si_6709f9bc_getupvalref_L000508_514
 mov r0, ##@C_sb9si_6709f9bc_getupvalref_L000508_nullup_L000511 ' reg <- addrg
C_sb9si_6709f9bc_getupvalref_L000508_509
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export lua_upvalueid

 alignl ' align long
C_lua_upvalueid ' <symbol:lua_upvalueid>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9s_6709f9bc_index2value_L000013
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r17, r22
 and r17, #63 ' BANDI4 coni
 mov r22, #22 ' reg <- coni
 cmps r17, r22 wz
 if_z jmp #\C_lua_upvalueid_524 ' EQI4
 cmps r17, r22 wcz
 if_a jmp #\C_lua_upvalueid_526 ' GTI4
' C_lua_upvalueid_525 ' (symbol refcount = 0)
 cmps r17,  #6 wz
 if_z jmp #\C_lua_upvalueid_520 ' EQI4
 jmp #\@C_lua_upvalueid_517 ' JUMPV addrg
C_lua_upvalueid_526
 cmps r17,  #38 wz
 if_z jmp #\C_lua_upvalueid_521 ' EQI4
 jmp #\@C_lua_upvalueid_517 ' JUMPV addrg
C_lua_upvalueid_520
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9si_6709f9bc_getupvalref_L000508
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #\@C_lua_upvalueid_516 ' JUMPV addrg
C_lua_upvalueid_521
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 cmps r22, r19 wcz
 if_a jmp #\C_lua_upvalueid_522 ' GTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19, r22 wcz
 if_a jmp #\C_lua_upvalueid_522 ' GTI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_lua_upvalueid_516 ' JUMPV addrg
C_lua_upvalueid_522
C_lua_upvalueid_524
 mov r0, ##0 ' RET con
 jmp #\@C_lua_upvalueid_516 ' JUMPV addrg
C_lua_upvalueid_517
 mov r0, ##0 ' RET con
C_lua_upvalueid_516
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export lua_upvaluejoin

 alignl ' align long
C_lua_upvaluejoin ' <symbol:lua_upvaluejoin>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9si_6709f9bc_getupvalref_L000508
 add SP, #12 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, ##0 ' reg ARG con
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sb9si_6709f9bc_getupvalref_L000508
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r15 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_upvaluejoin_529 ' EQI4
 rdlong r20, r15 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_lua_upvaluejoin_529 ' EQI4
 rdlong r2, r15 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_lua_upvaluejoin_529 ' JUMPV addrg
C_lua_upvaluejoin_529
' C_lua_upvaluejoin_527 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import luaV_objlen

' Catalina Import luaV_concat

' Catalina Import luaV_finishset

' Catalina Import luaV_finishget

' Catalina Import luaV_tointeger

' Catalina Import luaV_tonumber_

' Catalina Import luaV_lessequal

' Catalina Import luaV_lessthan

' Catalina Import luaV_equalobj

' Catalina Import luaU_dump

' Catalina Import luaH_getn

' Catalina Import luaH_next

' Catalina Import luaH_resize

' Catalina Import luaH_new

' Catalina Import luaH_set

' Catalina Import luaH_get

' Catalina Import luaH_getstr

' Catalina Import luaH_setint

' Catalina Import luaH_getint

' Catalina Import luaS_new

' Catalina Import luaS_newlstr

' Catalina Import luaS_newudata

' Catalina Import luaC_changemode

' Catalina Import luaC_checkfinalizer

' Catalina Import luaC_barrierback_

' Catalina Import luaC_barrier_

' Catalina Import luaC_fullgc

' Catalina Import luaC_step

' Catalina Import luaF_close

' Catalina Import luaF_newtbcupval

' Catalina Import luaF_newCclosure

' Catalina Import luaD_throw

' Catalina Import luaD_growstack

' Catalina Import luaD_pcall

' Catalina Import luaD_callnoyield

' Catalina Import luaD_call

' Catalina Import luaD_protectedparser

' Catalina Import luaG_errormsg

' Catalina Import luaE_warning

' Catalina Import luaE_setdebt

' Catalina Import luaZ_init

' Catalina Import luaT_typenames_

' Catalina Import luaO_pushvfstring

' Catalina Import luaO_tostring

' Catalina Import luaO_str2num

' Catalina Import luaO_arith

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sb9sg_6709f9bc_aux_upvalue_L000479_494_L000495 ' <symbol:494>
 byte 40
 byte 110
 byte 111
 byte 32
 byte 110
 byte 97
 byte 109
 byte 101
 byte 41
 byte 0

 alignl ' align long
C_lua_load_393_L000394 ' <symbol:393>
 byte 63
 byte 0

 alignl ' align long
C_lua_pushlstring_210_L000211 ' <symbol:210>
 byte 0

 alignl ' align long
C_lua_tonumberx_135_L000136 ' <symbol:135>
 long $0 ' float

 alignl ' align long
C_lua_version_48_L000049 ' <symbol:48>
 long $43fc0000 ' float

' Catalina Code

DAT ' code segment
' end
