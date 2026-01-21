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
 byte 56
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
 byte 53
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
C_sico_696ddd94_index2value_L000015 ' <symbol:index2value>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 cmps r2,  #0 wcz
 jmp #BRBE
 long @C_sico_696ddd94_index2value_L000015_17 ' LEI4
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_sico_696ddd94_index2value_L000015_19' LTU4
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #44 ' ADDP4 coni
 jmp #JMPA
 long @C_sico_696ddd94_index2value_L000015_16 ' JUMPV addrg
C_sico_696ddd94_index2value_L000015_19
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sico_696ddd94_index2value_L000015_16 ' JUMPV addrg
C_sico_696ddd94_index2value_L000015_17
 jmp #LODL
 long -1001000
 mov r22, RI ' reg <- con
 cmps r2, r22 wcz
 jmp #BRBE
 long @C_sico_696ddd94_index2value_L000015_21 ' LEI4
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_sico_696ddd94_index2value_L000015_16 ' JUMPV addrg
C_sico_696ddd94_index2value_L000015_21
 jmp #LODL
 long -1001000
 mov r22, RI ' reg <- con
 cmps r2, r22 wz
 jmp #BRNZ
 long @C_sico_696ddd94_index2value_L000015_23 ' NEI4
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #36 ' ADDP4 coni
 jmp #JMPA
 long @C_sico_696ddd94_index2value_L000015_16 ' JUMPV addrg
C_sico_696ddd94_index2value_L000015_23
 jmp #LODL
 long -1001000
 mov r22, RI ' reg <- con
 subs r2, r22
 neg r2, r2 ' SUBI/P (2)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #102 wz
 jmp #BRNZ
 long @C_sico_696ddd94_index2value_L000015_25 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r2, r22 wcz
 jmp #BR_A
 long @C_sico_696ddd94_index2value_L000015_28 ' GTI4
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_sico_696ddd94_index2value_L000015_29 ' JUMPV addrg
C_sico_696ddd94_index2value_L000015_28
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r23, r22
 adds r23, #44 ' ADDP4 coni
C_sico_696ddd94_index2value_L000015_29
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sico_696ddd94_index2value_L000015_16 ' JUMPV addrg
C_sico_696ddd94_index2value_L000015_25
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #44 ' ADDP4 coni
C_sico_696ddd94_index2value_L000015_16
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sico1_696ddd94_index2stack_L000030 ' <symbol:index2stack>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 cmps r2,  #0 wcz
 jmp #BRBE
 long @C_sico1_696ddd94_index2stack_L000030_32 ' LEI4
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sico1_696ddd94_index2stack_L000030_31 ' JUMPV addrg
C_sico1_696ddd94_index2stack_L000030_32
 mov r22, r2
 shl r22, #3 ' LSHI4 coni
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_sico1_696ddd94_index2stack_L000030_31
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_checkstack

 alignl ' align long
C_lua_checkstack ' <symbol:lua_checkstack>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #DIVS ' DIVI
 cmps r0, r21 wcz
 jmp #BRBE
 long @C_lua_checkstack_35 ' LEI4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_checkstack_36 ' JUMPV addrg
C_lua_checkstack_35
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
C_lua_checkstack_36
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_lua_checkstack_37 ' EQI4
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
 jmp #BRAE
 long @C_lua_checkstack_37 ' GEU4
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
' C_lua_checkstack_34 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_xmove

 alignl ' align long
C_lua_xmove ' <symbol:lua_xmove>
 jmp #PSHM
 long $fc0000 ' save registers
 mov r22, r4 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_lua_xmove_40 ' NEU4
 jmp #JMPA
 long @C_lua_xmove_39 ' JUMPV addrg
C_lua_xmove_40
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r2
 shl r18, #3 ' LSHI4 coni
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_lua_xmove_45 ' JUMPV addrg
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
 jmp #CPYB
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
 jmp #BR_B
 long @C_lua_xmove_42 ' LTI4
C_lua_xmove_39
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_atpanic

 alignl ' align long
C_lua_atpanic ' <symbol:lua_atpanic>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #140 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r20, RI ' ASGNP4 addrl reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #140 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_atpanic_46 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_version

 alignl ' align long
C_lua_version ' <symbol:lua_version>
 jmp #LODI
 long @C_lua_version_48_L000049
 mov r0, RI ' reg <- INDIRF4 addrg
' C_lua_version_47 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export lua_absindex

 alignl ' align long
C_lua_absindex ' <symbol:lua_absindex>
 jmp #PSHM
 long $d00000 ' save registers
 cmps r2,  #0 wcz
 jmp #BR_A
 long @C_lua_absindex_54 ' GTI4
 jmp #LODL
 long -1001000
 mov r22, RI ' reg <- con
 cmps r2, r22 wcz
 jmp #BR_A
 long @C_lua_absindex_52 ' GTI4
C_lua_absindex_54
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_absindex_53 ' JUMPV addrg
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
 jmp #DIVS ' DIVI
 mov r23, r0 ' ADDI/P
 adds r23, r2 ' ADDI/P (3)
C_lua_absindex_53
 mov r0, r23 ' CVI, CVU or LOAD
' C_lua_absindex_50 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_gettop

 alignl ' align long
C_lua_gettop ' <symbol:lua_gettop>
 jmp #PSHM
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
 jmp #DIVS ' DIVI
' C_lua_gettop_55 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_settop

 alignl ' align long
C_lua_settop ' <symbol:lua_settop>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 cmps r21,  #0 wcz
 jmp #BR_B
 long @C_lua_settop_57 ' LTI4
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
 jmp #DIVS ' DIVI
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_settop_62 ' JUMPV addrg
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
 jmp #BR_A
 long @C_lua_settop_59 ' GTI4
 jmp #JMPA
 long @C_lua_settop_58 ' JUMPV addrg
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
 jmp #BRAE
 long @C_lua_settop_63 ' GEI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_lua_settop_63' LTU4
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_lua_settop_63
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
' C_lua_settop_56 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_closeslot

 alignl ' align long
C_lua_closeslot ' <symbol:lua_closeslot>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico1_696ddd94_index2stack_L000030
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_lua_closeslot_65 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sico3_696ddd94_reverse_L000066 ' <symbol:reverse>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 jmp #JMPA
 long @C_sico3_696ddd94_reverse_L000066_71 ' JUMPV addrg
C_sico3_696ddd94_reverse_L000066_68
 mov r23, FP
 sub r23, #-(-12) ' reg <- addrli
 mov r21, r3 ' CVI, CVU or LOAD
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
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
 jmp #CPYB
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
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sico3_696ddd94_reverse_L000066_69 ' (symbol refcount = 0)
 adds r3, #8 ' ADDP4 coni
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r2, r22 ' ADDI/P (1)
C_sico3_696ddd94_reverse_L000066_71
 mov r22, r3 ' CVI, CVU or LOAD
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_sico3_696ddd94_reverse_L000066_68' LTU4
' C_sico3_696ddd94_reverse_L000066_67 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_rotate

 alignl ' align long
C_lua_rotate ' <symbol:lua_rotate>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico1_696ddd94_index2stack_L000030
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 jmp #BR_B
 long @C_lua_rotate_74 ' LTI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r11, r15 ' SUBI/P
 subs r11, r22 ' SUBI/P (3)
 jmp #JMPA
 long @C_lua_rotate_75 ' JUMPV addrg
C_lua_rotate_74
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, r17
 neg r22, r22 ' SUBI/P (2)
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
C_lua_rotate_75
 mov r13, r11 ' CVI, CVU or LOAD
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico3_696ddd94_reverse_L000066
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13
 adds r3, #8 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico3_696ddd94_reverse_L000066
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico3_696ddd94_reverse_L000066
 add SP, #8 ' CALL addrg
' C_lua_rotate_72 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_copy

 alignl ' align long
C_lua_copy ' <symbol:lua_copy>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r13, r17 ' CVI, CVU or LOAD
 mov r0, r15 ' CVI, CVU or LOAD
 mov r1, r13 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #LODL
 long -1001000
 mov r22, RI ' reg <- con
 cmps r19, r22 wcz
 jmp #BRAE
 long @C_lua_copy_77 ' GEI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_copy_80 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_copy_80 ' EQI4
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_copy_80 ' EQI4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_copy_80 ' JUMPV addrg
 jmp #JMPA
 long @C_lua_copy_80 ' JUMPV addrg
C_lua_copy_80
C_lua_copy_77
' C_lua_copy_76 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_pushvalue

 alignl ' align long
C_lua_pushvalue ' <symbol:lua_pushvalue>
 jmp #NEWF
 jmp #PSHM
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
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r19 ' CVI, CVU or LOAD
 mov r1, r17 ' CVI, CVU or LOAD
 jmp #CPYB
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
' C_lua_pushvalue_83 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_type

 alignl ' align long
C_lua_type ' <symbol:lua_type>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_type_88 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_type_86 ' EQU4
C_lua_type_88
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22
 and r17, #15 ' BANDI4 coni
 jmp #JMPA
 long @C_lua_type_87 ' JUMPV addrg
C_lua_type_86
 jmp #LODL
 long -1
 mov r17, RI ' reg <- con
C_lua_type_87
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_type_84 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_typename

 alignl ' align long
C_lua_typename ' <symbol:lua_typename>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaT__typenames_+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_typename_89 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_iscfunction

 alignl ' align long
C_lua_iscfunction ' <symbol:lua_iscfunction>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #22 wz
 jmp #BR_Z
 long @C_lua_iscfunction_95 ' EQI4
 cmps r22,  #102 wz
 jmp #BRNZ
 long @C_lua_iscfunction_93 ' NEI4
C_lua_iscfunction_95
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_iscfunction_94 ' JUMPV addrg
C_lua_iscfunction_93
 mov r17, #0 ' reg <- coni
C_lua_iscfunction_94
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_iscfunction_91 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_isinteger

 alignl ' align long
C_lua_isinteger ' <symbol:lua_isinteger>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_lua_isinteger_98 ' NEI4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_isinteger_99 ' JUMPV addrg
C_lua_isinteger_98
 mov r19, #0 ' reg <- coni
C_lua_isinteger_99
 mov r0, r19 ' CVI, CVU or LOAD
' C_lua_isinteger_96 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_isnumber

 alignl ' align long
C_lua_isnumber ' <symbol:lua_isnumber>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_lua_isnumber_102 ' NEI4
 rdlong r22, r19 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_isnumber_103 ' JUMPV addrg
C_lua_isnumber_102
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_lua_isnumber_103
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_isnumber_100 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_isstring

 alignl ' align long
C_lua_isstring ' <symbol:lua_isstring>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, #4 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_isstring_108 ' EQI4
 cmps r20,  #3 wz
 jmp #BRNZ
 long @C_lua_isstring_106 ' NEI4
C_lua_isstring_108
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_isstring_107 ' JUMPV addrg
C_lua_isstring_106
 mov r17, #0 ' reg <- coni
C_lua_isstring_107
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_isstring_104 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_isuserdata

 alignl ' align long
C_lua_isuserdata ' <symbol:lua_isuserdata>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #71 wz
 jmp #BR_Z
 long @C_lua_isuserdata_113 ' EQI4
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_lua_isuserdata_111 ' NEI4
C_lua_isuserdata_113
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_isuserdata_112 ' JUMPV addrg
C_lua_isuserdata_111
 mov r17, #0 ' reg <- coni
C_lua_isuserdata_112
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_isuserdata_109 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_rawequal

 alignl ' align long
C_lua_rawequal ' <symbol:lua_rawequal>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_rawequal_118 ' NEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_rawequal_116 ' EQU4
C_lua_rawequal_118
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_rawequal_119 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_rawequal_116 ' EQU4
C_lua_rawequal_119
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_rawequal_117 ' JUMPV addrg
C_lua_rawequal_116
 mov r13, #0 ' reg <- coni
C_lua_rawequal_117
 mov r0, r13 ' CVI, CVU or LOAD
' C_lua_rawequal_114 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_arith

 alignl ' align long
C_lua_arith ' <symbol:lua_arith>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #12 wz
 jmp #BR_Z
 long @C_lua_arith_121 ' EQI4
 cmps r21,  #13 wz
 jmp #BR_Z
 long @C_lua_arith_121 ' EQI4
 jmp #JMPA
 long @C_lua_arith_122 ' JUMPV addrg
C_lua_arith_121
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
C_lua_arith_122
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 adds r20, r22 ' ADDI/P (2)
 mov r2, r20 ' CVI, CVU or LOAD
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r18 ' ADDI/P (3)
 mov r4, r20 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaO__arith
 add SP, #16 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_arith_120 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_compare

 alignl ' align long
C_lua_compare ' <symbol:lua_compare>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_compare_126 ' NEI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_compare_124 ' EQU4
C_lua_compare_126
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_compare_127 ' NEI4
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #44 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_compare_124 ' EQU4
C_lua_compare_127
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_lua_compare_130 ' EQI4
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C_lua_compare_131 ' EQI4
 cmps r17,  #2 wz
 jmp #BR_Z
 long @C_lua_compare_132 ' EQI4
 jmp #JMPA
 long @C_lua_compare_128 ' JUMPV addrg
C_lua_compare_130
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_compare_129 ' JUMPV addrg
C_lua_compare_131
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__lessthan
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_compare_129 ' JUMPV addrg
C_lua_compare_132
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__lessequal
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
C_lua_compare_128
C_lua_compare_129
C_lua_compare_124
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_compare_123 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_stringtonumber

 alignl ' align long
C_lua_stringtonumber ' <symbol:lua_stringtonumber>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__str2num
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmp r19,  #0 wz
 jmp #BR_Z
 long @C_lua_stringtonumber_134 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_stringtonumber_134
 mov r0, r19 ' CVI, CVU or LOAD
' C_lua_stringtonumber_133 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_tonumberx

 alignl ' align long
C_lua_tonumberx ' <symbol:lua_tonumberx>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_lua_tonumberx_137_L000138
 mov r22, RI ' reg <- INDIRF4 addrg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_lua_tonumberx_140 ' NEI4
 rdlong r22, r17 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_tonumberx_141 ' JUMPV addrg
C_lua_tonumberx_140
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tonumber_
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_lua_tonumberx_141
 jmp #LODF
 long -12
 wrlong r15, RI ' ASGNI4 addrl reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_tonumberx_142 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r19 ' ASGNI4 reg reg
C_lua_tonumberx_142
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
' C_lua_tonumberx_136 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_tointegerx

 alignl ' align long
C_lua_tointegerx ' <symbol:lua_tointegerx>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_lua_tointegerx_146 ' NEI4
 rdlong r22, r17 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_tointegerx_147 ' JUMPV addrg
C_lua_tointegerx_146
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointeger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_lua_tointegerx_147
 jmp #LODF
 long -12
 wrlong r15, RI ' ASGNI4 addrl reg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_tointegerx_148 ' EQU4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r19 ' ASGNI4 reg reg
C_lua_tointegerx_148
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_tointegerx_144 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_toboolean

 alignl ' align long
C_lua_toboolean ' <symbol:lua_toboolean>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_lua_toboolean_152 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_toboolean_152 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_toboolean_153 ' JUMPV addrg
C_lua_toboolean_152
 mov r17, #0 ' reg <- coni
C_lua_toboolean_153
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_toboolean_150 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_tolstring

 alignl ' align long
C_lua_tolstring ' <symbol:lua_tolstring>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, #4 ' reg <- coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_tolstring_155 ' EQI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #3 wz
 jmp #BR_Z
 long @C_lua_tolstring_157 ' EQI4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_tolstring_159 ' EQU4
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
C_lua_tolstring_159
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_lua_tolstring_154 ' JUMPV addrg
C_lua_tolstring_157
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__tostring
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_lua_tolstring_161 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_tolstring_161
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_lua_tolstring_155
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_tolstring_163 ' EQU4
 rdlong r22, r17 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #255 wz
 jmp #BR_Z
 long @C_lua_tolstring_166 ' EQI4
 rdlong r22, r17 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_tolstring_167 ' JUMPV addrg
C_lua_tolstring_166
 rdlong r22, r17 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRU4 reg
C_lua_tolstring_167
 wrlong r15, r19 ' ASGNU4 reg reg
C_lua_tolstring_163
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
C_lua_tolstring_154
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_rawlen

 alignl ' align long
C_lua_rawlen ' <symbol:lua_rawlen>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 mov r22, #4 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_lua_rawlen_172 ' EQI4
 cmps r19,  #5 wz
 jmp #BR_Z
 long @C_lua_rawlen_175 ' EQI4
 cmps r19,  #7 wz
 jmp #BR_Z
 long @C_lua_rawlen_174 ' EQI4
 cmps r19, r22 wcz
 jmp #BR_B
 long @C_lua_rawlen_169 ' LTI4
' C_lua_rawlen_176 ' (symbol refcount = 0)
 cmps r19,  #20 wz
 jmp #BR_Z
 long @C_lua_rawlen_173 ' EQI4
 jmp #JMPA
 long @C_lua_rawlen_169 ' JUMPV addrg
C_lua_rawlen_172
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_rawlen_168 ' JUMPV addrg
C_lua_rawlen_173
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #JMPA
 long @C_lua_rawlen_168 ' JUMPV addrg
C_lua_rawlen_174
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRU4 reg
 jmp #JMPA
 long @C_lua_rawlen_168 ' JUMPV addrg
C_lua_rawlen_175
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__getn ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_rawlen_168 ' JUMPV addrg
C_lua_rawlen_169
 mov r0, #0 ' RET coni
C_lua_rawlen_168
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_tocfunction

 alignl ' align long
C_lua_tocfunction ' <symbol:lua_tocfunction>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #22 wz
 jmp #BRNZ
 long @C_lua_tocfunction_178 ' NEI4
 rdlong r0, r19 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_lua_tocfunction_177 ' JUMPV addrg
C_lua_tocfunction_178
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #102 wz
 jmp #BRNZ
 long @C_lua_tocfunction_180 ' NEI4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_lua_tocfunction_177 ' JUMPV addrg
C_lua_tocfunction_180
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_lua_tocfunction_177
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sico5_696ddd94_touserdata_L000182 ' <symbol:touserdata>
 jmp #PSHM
 long $e00000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r23, r22
 and r23, #15 ' BANDI4 coni
 mov r22, #2 ' reg <- coni
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_sico5_696ddd94_touserdata_L000182_191 ' EQI4
 cmps r23, r22 wcz
 jmp #BR_B
 long @C_sico5_696ddd94_touserdata_L000182_184 ' LTI4
' C_sico5_696ddd94_touserdata_L000182_192 ' (symbol refcount = 0)
 cmps r23,  #7 wz
 jmp #BR_Z
 long @C_sico5_696ddd94_touserdata_L000182_187 ' EQI4
 jmp #JMPA
 long @C_sico5_696ddd94_touserdata_L000182_184 ' JUMPV addrg
C_sico5_696ddd94_touserdata_L000182_187
 rdlong r22, r2 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sico5_696ddd94_touserdata_L000182_189 ' NEI4
 mov r21, #16 ' reg <- coni
 jmp #JMPA
 long @C_sico5_696ddd94_touserdata_L000182_190 ' JUMPV addrg
C_sico5_696ddd94_touserdata_L000182_189
 rdlong r22, r2 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 shl r22, #3 ' LSHU4 coni
 mov r21, r22
 add r21, #20 ' ADDU4 coni
C_sico5_696ddd94_touserdata_L000182_190
 rdlong r22, r2 ' reg <- INDIRP4 reg
 mov r0, r21 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #JMPA
 long @C_sico5_696ddd94_touserdata_L000182_183 ' JUMPV addrg
C_sico5_696ddd94_touserdata_L000182_191
 rdlong r0, r2 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sico5_696ddd94_touserdata_L000182_183 ' JUMPV addrg
C_sico5_696ddd94_touserdata_L000182_184
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sico5_696ddd94_touserdata_L000182_183
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_touserdata

 alignl ' align long
C_lua_touserdata ' <symbol:lua_touserdata>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sico5_696ddd94_touserdata_L000182 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_touserdata_193 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_tothread

 alignl ' align long
C_lua_tothread ' <symbol:lua_tothread>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #72 wz
 jmp #BR_Z
 long @C_lua_tothread_196 ' EQI4
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 jmp #JMPA
 long @C_lua_tothread_197 ' JUMPV addrg
C_lua_tothread_196
 rdlong r17, r19 ' reg <- INDIRP4 reg
C_lua_tothread_197
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_tothread_194 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_topointer

 alignl ' align long
C_lua_topointer ' <symbol:lua_topointer>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 and r19, #63 ' BANDI4 coni
 mov r22, #7 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_lua_topointer_203 ' EQI4
 cmps r19, r22 wcz
 jmp #BR_A
 long @C_lua_topointer_207 ' GTI4
' C_lua_topointer_206 ' (symbol refcount = 0)
 cmps r19,  #2 wz
 jmp #BR_Z
 long @C_lua_topointer_203 ' EQI4
 jmp #JMPA
 long @C_lua_topointer_199 ' JUMPV addrg
C_lua_topointer_207
 cmps r19,  #22 wz
 jmp #BR_Z
 long @C_lua_topointer_202 ' EQI4
 jmp #JMPA
 long @C_lua_topointer_199 ' JUMPV addrg
C_lua_topointer_202
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_topointer_198 ' JUMPV addrg
C_lua_topointer_203
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sico5_696ddd94_touserdata_L000182 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_topointer_198 ' JUMPV addrg
C_lua_topointer_199
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_topointer_204 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_lua_topointer_198 ' JUMPV addrg
C_lua_topointer_204
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_lua_topointer_198
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_pushnil

 alignl ' align long
C_lua_pushnil ' <symbol:lua_pushnil>
 jmp #PSHM
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
' C_lua_pushnil_208 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_pushnumber

 alignl ' align long
C_lua_pushnumber ' <symbol:lua_pushnumber>
 jmp #PSHM
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
' C_lua_pushnumber_209 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_pushinteger

 alignl ' align long
C_lua_pushinteger ' <symbol:lua_pushinteger>
 jmp #PSHM
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
' C_lua_pushinteger_210 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_pushlstring

 alignl ' align long
C_lua_pushlstring ' <symbol:lua_pushlstring>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #0 wz
 jmp #BRNZ
 long @C_lua_pushlstring_215 ' NEU4
 jmp #LODL
 long @C_lua_pushlstring_212_L000213
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_pushlstring_216 ' JUMPV addrg
C_lua_pushlstring_215
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_lua_pushlstring_216
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
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
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
 jmp #BRBE
 long @C_lua_pushlstring_217 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushlstring_217
 mov r0, r17
 adds r0, #16 ' ADDP4 coni
' C_lua_pushlstring_211 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_pushstring

 alignl ' align long
C_lua_pushstring ' <symbol:lua_pushstring>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_lua_pushstring_220 ' NEU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_lua_pushstring_221 ' JUMPV addrg
C_lua_pushstring_220
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
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
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r21, r22
 adds r21, #16 ' ADDP4 coni
C_lua_pushstring_221
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
 jmp #BRBE
 long @C_lua_pushstring_222 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushstring_222
 mov r0, r21 ' CVI, CVU or LOAD
' C_lua_pushstring_219 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export lua_pushvfstring

 alignl ' align long
C_lua_pushvfstring ' <symbol:lua_pushvfstring>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushvfstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_lua_pushvfstring_225 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushvfstring_225
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_pushvfstring_224 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_pushfstring

 alignl ' align long
C_lua_pushfstring ' <symbol:lua_pushfstring>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
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
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #CALA
 long @C_luaO__pushvfstring
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_lua_pushfstring_229 ' LEI4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushfstring_229
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_pushfstring_227 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_pushcclosure

 alignl ' align long
C_lua_pushcclosure ' <symbol:lua_pushcclosure>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_lua_pushcclosure_232 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #JMPA
 long @C_lua_pushcclosure_233 ' JUMPV addrg
C_lua_pushcclosure_232
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #JMPA
 long @C_lua_pushcclosure_235 ' JUMPV addrg
C_lua_pushcclosure_234
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
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_pushcclosure_235
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 subs r19, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_pushcclosure_234 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -12
 wrlong r17, RI ' ASGNP4 addrl reg
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
 jmp #BRBE
 long @C_lua_pushcclosure_237 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_pushcclosure_237
C_lua_pushcclosure_233
' C_lua_pushcclosure_231 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_pushboolean

 alignl ' align long
C_lua_pushboolean ' <symbol:lua_pushboolean>
 jmp #PSHM
 long $500000 ' save registers
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_lua_pushboolean_240 ' EQI4
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_lua_pushboolean_241 ' JUMPV addrg
C_lua_pushboolean_240
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_pushboolean_241
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_pushboolean_239 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_pushlightuserdata

 alignl ' align long
C_lua_pushlightuserdata ' <symbol:lua_pushlightuserdata>
 jmp #PSHM
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
' C_lua_pushlightuserdata_242 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_pushthread

 alignl ' align long
C_lua_pushthread ' <symbol:lua_pushthread>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r2, RI ' ASGNP4 addrl reg
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
 jmp #BRNZ
 long @C_lua_pushthread_245 ' NEU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_pushthread_246 ' JUMPV addrg
C_lua_pushthread_245
 mov r23, #0 ' reg <- coni
C_lua_pushthread_246
 mov r0, r23 ' CVI, CVU or LOAD
' C_lua_pushthread_243 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sico7_696ddd94_auxgetstr_L000247 ' <symbol:auxgetstr>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_sico7_696ddd94_auxgetstr_L000247_253 ' EQI4
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_sico7_696ddd94_auxgetstr_L000247_254 ' JUMPV addrg
C_sico7_696ddd94_auxgetstr_L000247_253
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getstr
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sico7_696ddd94_auxgetstr_L000247_255 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_sico7_696ddd94_auxgetstr_L000247_256 ' JUMPV addrg
C_sico7_696ddd94_auxgetstr_L000247_255
 mov r13, #0 ' reg <- coni
C_sico7_696ddd94_auxgetstr_L000247_256
 mov r15, r13 ' CVI, CVU or LOAD
C_sico7_696ddd94_auxgetstr_L000247_254
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_sico7_696ddd94_auxgetstr_L000247_249 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -16
 wrlong r17, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_sico7_696ddd94_auxgetstr_L000247_250 ' JUMPV addrg
C_sico7_696ddd94_auxgetstr_L000247_249
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
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
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
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
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
C_sico7_696ddd94_auxgetstr_L000247_250
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_sico7_696ddd94_auxgetstr_L000247_248 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export lua_getglobal

 alignl ' align long
C_lua_getglobal ' <symbol:lua_getglobal>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico7_696ddd94_auxgetstr_L000247
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_getglobal_257 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_gettable

 alignl ' align long
C_lua_gettable ' <symbol:lua_gettable>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_lua_gettable_263 ' EQI4
 jmp #LODL
 long 0
 mov r19, RI ' reg <- con
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_lua_gettable_264 ' JUMPV addrg
C_lua_gettable_263
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gettable_265 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_gettable_266 ' JUMPV addrg
C_lua_gettable_265
 mov r13, #0 ' reg <- coni
C_lua_gettable_266
 mov r15, r13 ' CVI, CVU or LOAD
C_lua_gettable_264
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_lua_gettable_259 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -12
 wrlong r19, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_lua_gettable_260 ' JUMPV addrg
C_lua_gettable_259
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r17 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
C_lua_gettable_260
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_lua_gettable_258 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_getfield

 alignl ' align long
C_lua_getfield ' <symbol:lua_getfield>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico7_696ddd94_auxgetstr_L000247
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_getfield_267 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_geti

 alignl ' align long
C_lua_geti ' <symbol:lua_geti>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_lua_geti_274 ' EQI4
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_lua_geti_275 ' JUMPV addrg
C_lua_geti_274
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BRAE
 long @C_lua_geti_278 ' GEU4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r9, r22 ' ADDI/P
 adds r9, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_lua_geti_279 ' JUMPV addrg
C_lua_geti_278
 mov r2, r19 ' CVI, CVU or LOAD
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_lua_geti_279
 mov r15, r9 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_geti_276 ' EQI4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_geti_277 ' JUMPV addrg
C_lua_geti_276
 mov r11, #0 ' reg <- coni
C_lua_geti_277
 mov r13, r11 ' CVI, CVU or LOAD
C_lua_geti_275
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C_lua_geti_269 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -12
 wrlong r15, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #JMPA
 long @C_lua_geti_270 ' JUMPV addrg
C_lua_geti_269
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishget
 add SP, #16 ' CALL addrg
C_lua_geti_270
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_lua_geti_268 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sico8_696ddd94_finishrawget_L000280 ' <symbol:finishrawget>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sico8_696ddd94_finishrawget_L000280_282 ' NEI4
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sico8_696ddd94_finishrawget_L000280_283 ' JUMPV addrg
C_sico8_696ddd94_finishrawget_L000280_282
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODF
 long -12
 wrlong r2, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
C_sico8_696ddd94_finishrawget_L000280_283
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r3
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 and r0, #15 ' BANDI4 coni
' C_sico8_696ddd94_finishrawget_L000280_281 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sico9_696ddd94_gettable_L000284 ' <symbol:gettable>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_sico9_696ddd94_gettable_L000284_285 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_rawget

 alignl ' align long
C_lua_rawget ' <symbol:lua_rawget>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico9_696ddd94_gettable_L000284
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico8_696ddd94_finishrawget_L000280
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_rawget_286 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_rawgeti

 alignl ' align long
C_lua_rawgeti ' <symbol:lua_rawgeti>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico9_696ddd94_gettable_L000284
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico8_696ddd94_finishrawget_L000280
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_rawgeti_287 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_rawgetp

 alignl ' align long
C_lua_rawgetp ' <symbol:lua_rawgetp>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico9_696ddd94_gettable_L000284
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
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
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico8_696ddd94_finishrawget_L000280
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_lua_rawgetp_288 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export lua_createtable

 alignl ' align long
C_lua_createtable ' <symbol:lua_createtable>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__new ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #BR_A
 long @C_lua_createtable_292 ' GTI4
 cmps r19, r22 wcz
 jmp #BRBE
 long @C_lua_createtable_290 ' LEI4
C_lua_createtable_292
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__resize
 add SP, #12 ' CALL addrg
C_lua_createtable_290
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_lua_createtable_293 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_createtable_293
' C_lua_createtable_289 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_getmetatable

 alignl ' align long
C_lua_getmetatable ' <symbol:lua_getmetatable>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 and r19, #15 ' BANDI4 coni
 cmps r19,  #5 wz
 jmp #BR_Z
 long @C_lua_getmetatable_299 ' EQI4
 cmps r19,  #7 wz
 jmp #BR_Z
 long @C_lua_getmetatable_300 ' EQI4
 jmp #JMPA
 long @C_lua_getmetatable_296 ' JUMPV addrg
C_lua_getmetatable_299
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_lua_getmetatable_297 ' JUMPV addrg
C_lua_getmetatable_300
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_lua_getmetatable_297 ' JUMPV addrg
C_lua_getmetatable_296
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
C_lua_getmetatable_297
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_getmetatable_301 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_lua_getmetatable_301
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_getmetatable_295 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Export lua_getiuservalue

 alignl ' align long
C_lua_getiuservalue ' <symbol:lua_getiuservalue>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 cmps r19,  #0 wcz
 jmp #BRBE
 long @C_lua_getiuservalue_306 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r19, r22 wcz
 jmp #BRBE
 long @C_lua_getiuservalue_304 ' LEI4
C_lua_getiuservalue_306
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_getiuservalue_305 ' JUMPV addrg
C_lua_getiuservalue_304
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_lua_getiuservalue_305
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_getiuservalue_303 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sicoa_696ddd94_auxsetstr_L000307 ' <symbol:auxsetstr>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_sicoa_696ddd94_auxsetstr_L000307_313 ' EQI4
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_sicoa_696ddd94_auxsetstr_L000307_314 ' JUMPV addrg
C_sicoa_696ddd94_auxsetstr_L000307_313
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 rdlong r3, r21 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getstr
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sicoa_696ddd94_auxsetstr_L000307_315 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_sicoa_696ddd94_auxsetstr_L000307_316 ' JUMPV addrg
C_sicoa_696ddd94_auxsetstr_L000307_315
 mov r13, #0 ' reg <- coni
C_sicoa_696ddd94_auxsetstr_L000307_316
 mov r15, r13 ' CVI, CVU or LOAD
C_sicoa_696ddd94_auxsetstr_L000307_314
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_sicoa_696ddd94_auxsetstr_L000307_309 ' EQI4
 jmp #LODF
 long -12
 wrlong r17, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sicoa_696ddd94_auxsetstr_L000307_318 ' EQI4
 mov r22, #0 ' reg <- coni
 rdlong r20, r21 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sicoa_696ddd94_auxsetstr_L000307_318 ' EQI4
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sicoa_696ddd94_auxsetstr_L000307_318 ' EQI4
 rdlong r2, r21 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sicoa_696ddd94_auxsetstr_L000307_318 ' JUMPV addrg
 jmp #JMPA
 long @C_sicoa_696ddd94_auxsetstr_L000307_318 ' JUMPV addrg
C_sicoa_696ddd94_auxsetstr_L000307_318
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sicoa_696ddd94_auxsetstr_L000307_310 ' JUMPV addrg
C_sicoa_696ddd94_auxsetstr_L000307_309
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
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
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
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
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_sicoa_696ddd94_auxsetstr_L000307_310
' C_sicoa_696ddd94_auxsetstr_L000307_308 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export lua_setglobal

 alignl ' align long
C_lua_setglobal ' <symbol:lua_setglobal>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sicoa_696ddd94_auxsetstr_L000307
 add SP, #8 ' CALL addrg
' C_lua_setglobal_321 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_settable

 alignl ' align long
C_lua_settable ' <symbol:lua_settable>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_lua_settable_327 ' EQI4
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_lua_settable_328 ' JUMPV addrg
C_lua_settable_327
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 rdlong r3, r19 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_settable_329 ' EQI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_settable_330 ' JUMPV addrg
C_lua_settable_329
 mov r13, #0 ' reg <- coni
C_lua_settable_330
 mov r15, r13 ' CVI, CVU or LOAD
C_lua_settable_328
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_lua_settable_323 ' EQI4
 jmp #LODF
 long -8
 wrlong r17, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_settable_332 ' EQI4
 mov r22, #0 ' reg <- coni
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_settable_332 ' EQI4
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_settable_332 ' EQI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_settable_332 ' JUMPV addrg
 jmp #JMPA
 long @C_lua_settable_332 ' JUMPV addrg
C_lua_settable_332
 jmp #JMPA
 long @C_lua_settable_324 ' JUMPV addrg
C_lua_settable_323
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
C_lua_settable_324
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_settable_322 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_setfield

 alignl ' align long
C_lua_setfield ' <symbol:lua_setfield>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sicoa_696ddd94_auxsetstr_L000307
 add SP, #8 ' CALL addrg
' C_lua_setfield_335 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_seti

 alignl ' align long
C_lua_seti ' <symbol:lua_seti>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BR_Z
 long @C_lua_seti_342 ' EQI4
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_lua_seti_343 ' JUMPV addrg
C_lua_seti_342
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmp r22, r20 wcz 
 jmp #BRAE
 long @C_lua_seti_346 ' GEU4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r9, r22 ' ADDI/P
 adds r9, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_lua_seti_347 ' JUMPV addrg
C_lua_seti_346
 mov r2, r19 ' CVI, CVU or LOAD
 rdlong r3, r17 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getint
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r9, r22 ' CVI, CVU or LOAD
C_lua_seti_347
 mov r15, r9 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_seti_344 ' EQI4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_seti_345 ' JUMPV addrg
C_lua_seti_344
 mov r11, #0 ' reg <- coni
C_lua_seti_345
 mov r13, r11 ' CVI, CVU or LOAD
C_lua_seti_343
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C_lua_seti_337 ' EQI4
 jmp #LODF
 long -8
 wrlong r15, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_seti_349 ' EQI4
 mov r22, #0 ' reg <- coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_seti_349 ' EQI4
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_seti_349 ' EQI4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_seti_349 ' JUMPV addrg
 jmp #JMPA
 long @C_lua_seti_349 ' JUMPV addrg
C_lua_seti_349
 jmp #JMPA
 long @C_lua_seti_338 ' JUMPV addrg
C_lua_seti_337
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
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
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, r17 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaV__finishset
 add SP, #16 ' CALL addrg
C_lua_seti_338
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_seti_336 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sicob_696ddd94_aux_rawset_L000352 ' <symbol:aux_rawset>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico9_696ddd94_gettable_L000284
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__set
 add SP, #12 ' CALL addrg
 mov r22, r15
 adds r22, #6 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffc0
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sicob_696ddd94_aux_rawset_L000352_355 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, r15
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sicob_696ddd94_aux_rawset_L000352_355 ' EQI4
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sicob_696ddd94_aux_rawset_L000352_355 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sicob_696ddd94_aux_rawset_L000352_355 ' JUMPV addrg
 jmp #JMPA
 long @C_sicob_696ddd94_aux_rawset_L000352_355 ' JUMPV addrg
C_sicob_696ddd94_aux_rawset_L000352_355
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r17
 shl r18, #3 ' LSHI4 coni
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_sicob_696ddd94_aux_rawset_L000352_353 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_rawset

 alignl ' align long
C_lua_rawset ' <symbol:lua_rawset>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sicob_696ddd94_aux_rawset_L000352
 add SP, #12 ' CALL addrg
' C_lua_rawset_358 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_rawsetp

 alignl ' align long
C_lua_rawsetp ' <symbol:lua_rawsetp>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
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
 jmp #CALA
 long @C_sicob_696ddd94_aux_rawset_L000352
 add SP, #12 ' CALL addrg
' C_lua_rawsetp_359 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_rawseti

 alignl ' align long
C_lua_rawseti ' <symbol:lua_rawseti>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico9_696ddd94_gettable_L000284
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__setint
 add SP, #12 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_rawseti_362 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_rawseti_362 ' EQI4
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_rawseti_362 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_rawseti_362 ' JUMPV addrg
 jmp #JMPA
 long @C_lua_rawseti_362 ' JUMPV addrg
C_lua_rawseti_362
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_rawseti_360 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_setmetatable

 alignl ' align long
C_lua_setmetatable ' <symbol:lua_setmetatable>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_setmetatable_366 ' NEI4
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_lua_setmetatable_367 ' JUMPV addrg
C_lua_setmetatable_366
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
C_lua_setmetatable_367
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 and r19, #15 ' BANDI4 coni
 cmps r19,  #5 wz
 jmp #BR_Z
 long @C_lua_setmetatable_371 ' EQI4
 cmps r19,  #7 wz
 jmp #BR_Z
 long @C_lua_setmetatable_376 ' EQI4
 jmp #JMPA
 long @C_lua_setmetatable_368 ' JUMPV addrg
C_lua_setmetatable_371
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
 jmp #BR_Z
 long @C_lua_setmetatable_369 ' EQU4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_setmetatable_375 ' EQI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_setmetatable_375 ' EQI4
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
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_setmetatable_375 ' JUMPV addrg
C_lua_setmetatable_375
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
 jmp #CALA
 long @C_luaC__checkfinalizer
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_setmetatable_369 ' JUMPV addrg
C_lua_setmetatable_376
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
 jmp #BR_Z
 long @C_lua_setmetatable_369 ' EQU4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_setmetatable_380 ' EQI4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_setmetatable_380 ' EQI4
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
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_setmetatable_380 ' JUMPV addrg
C_lua_setmetatable_380
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
 jmp #CALA
 long @C_luaC__checkfinalizer
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_setmetatable_369 ' JUMPV addrg
C_lua_setmetatable_368
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
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
C_lua_setmetatable_369
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, #1 ' RET coni
' C_lua_setmetatable_365 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_setiuservalue

 alignl ' align long
C_lua_setiuservalue ' <symbol:lua_setiuservalue>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #6 ' ADDP4 coni
 rdword r20, r20 ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_lua_setiuservalue_382' LTU4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_setiuservalue_383 ' JUMPV addrg
C_lua_setiuservalue_382
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_setiuservalue_385 ' EQI4
 mov r22, #0 ' reg <- coni
 rdlong r20, r17 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_setiuservalue_385 ' EQI4
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_setiuservalue_385 ' EQI4
 rdlong r2, r17 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrierback_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_setiuservalue_385 ' JUMPV addrg
 jmp #JMPA
 long @C_lua_setiuservalue_385 ' JUMPV addrg
C_lua_setiuservalue_385
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_lua_setiuservalue_383
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_setiuservalue_381 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export lua_callk

 alignl ' align long
C_lua_callk ' <symbol:lua_callk>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_callk_389 ' EQU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff0000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_lua_callk_389 ' NEU4
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
 jmp #CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_callk_390 ' JUMPV addrg
C_lua_callk_389
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
C_lua_callk_390
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wcz
 jmp #BR_A
 long @C_lua_callk_391 ' GTI4
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
 jmp #BRAE
 long @C_lua_callk_391 ' GEU4
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
C_lua_callk_391
' C_lua_callk_388 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sicoc_696ddd94_f_call_L000393 ' <symbol:f_call>
 jmp #NEWF
 jmp #PSHM
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
 jmp #CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
' C_sicoc_696ddd94_f_call_L000393_394 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_pcallk

 alignl ' align long
C_lua_pcallk ' <symbol:lua_pcallk>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_lua_pcallk_396 ' NEI4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_pcallk_397 ' JUMPV addrg
C_lua_pcallk_396
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico1_696ddd94_index2stack_L000030
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_lua_pcallk_397
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
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_pcallk_400 ' EQU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff0000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_pcallk_398 ' EQU4
C_lua_pcallk_400
 jmp #LODF
 long -8
 wrlong r23, RI ' ASGNI4 addrl reg
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
 jmp #LODL
 long @C_sicoc_696ddd94_f_call_L000393
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaD__pcall
 add SP, #16 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_pcallk_399 ' JUMPV addrg
C_lua_pcallk_398
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
 rdword r20, r22 ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long -2
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, FP
 add r18, #8 ' reg <- addrfi
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 rdword r20, r22 ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
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
 jmp #CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 rdword r20, r22 ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long -17
 mov r18, RI ' reg <- con
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
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
C_lua_pcallk_399
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r23, r22 wcz
 jmp #BR_A
 long @C_lua_pcallk_402 ' GTI4
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
 jmp #BRAE
 long @C_lua_pcallk_402 ' GEU4
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
C_lua_pcallk_402
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_pcallk_395 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Export lua_load

 alignl ' align long
C_lua_load ' <symbol:lua_load>
 jmp #NEWF
 sub SP, #36
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_lua_load_405 ' NEU4
 jmp #LODL
 long @C_lua_load_407_L000408
 mov r19, RI ' reg <- addrg
C_lua_load_405
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-24) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #CALA
 long @C_luaD__protectedparser
 add SP, #12 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_lua_load_409 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wcz
 jmp #BR_B
 long @C_lua_load_411 ' LTI4
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
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -40
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_load_414 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_load_414 ' EQI4
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_load_414 ' EQI4
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
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_load_414 ' JUMPV addrg
 jmp #JMPA
 long @C_lua_load_414 ' JUMPV addrg
C_lua_load_414
C_lua_load_411
C_lua_load_409
 mov r0, r15 ' CVI, CVU or LOAD
' C_lua_load_404 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #36 ' framesize
 jmp #RETF


' Catalina Export lua_dump

 alignl ' align long
C_lua_dump ' <symbol:lua_dump>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #70 wz
 jmp #BRNZ
 long @C_lua_dump_418 ' NEI4
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
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaU__dump
 add SP, #16 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_dump_419 ' JUMPV addrg
C_lua_dump_418
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_lua_dump_419
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_lua_dump_417 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_status

 alignl ' align long
C_lua_status ' <symbol:lua_status>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_lua_status_420 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_gc

 alignl ' align long
C_lua_gc ' <symbol:lua_gc>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
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
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gc_422 ' EQI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_lua_gc_421 ' JUMPV addrg
C_lua_gc_422
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BR_B
 long @C_lua_gc_425 ' LTI4
 cmps r22,  #11 wcz
 jmp #BR_A
 long @C_lua_gc_425 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_lua_gc_465_L000467
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_lua_gc_465_L000467 ' <symbol:465>
 long @C_lua_gc_427
 long @C_lua_gc_428
 long @C_lua_gc_429
 long @C_lua_gc_430
 long @C_lua_gc_431
 long @C_lua_gc_432
 long @C_lua_gc_439
 long @C_lua_gc_440
 long @C_lua_gc_425
 long @C_lua_gc_441
 long @C_lua_gc_445
 long @C_lua_gc_454

' Catalina Code

DAT ' code segment
C_lua_gc_427
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_428
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_429
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__fullgc
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_430
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 shr r22, #10 ' RSHU4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_431
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 1023
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_432
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 jmp #LODF
 long -24
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_gc_433 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
 jmp #JMPA
 long @C_lua_gc_434 ' JUMPV addrg
C_lua_gc_433
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #10 ' LSHI4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #BRBE
 long @C_lua_gc_435 ' LEI4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_gc_435
C_lua_gc_434
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
 jmp #BRBE
 long @C_lua_gc_426 ' LEI4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_lua_gc_426 ' NEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_439
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #2 ' LSHI4 coni
 jmp #LODF
 long -8
 wrlong r20, RI ' ASGNI4 addrl reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_440
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #65 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #2 ' LSHI4 coni
 jmp #LODF
 long -8
 wrlong r20, RI ' ASGNI4 addrl reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_441
 mov r22, r23
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_gc_443 ' NEI4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_gc_444 ' JUMPV addrg
C_lua_gc_443
 mov r21, #0 ' reg <- coni
C_lua_gc_444
 jmp #LODF
 long -8
 wrlong r21, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_445
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_lua_gc_449 ' EQI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gc_447 ' EQU4
C_lua_gc_449
 mov r21, #10 ' reg <- coni
 jmp #JMPA
 long @C_lua_gc_448 ' JUMPV addrg
C_lua_gc_447
 mov r21, #11 ' reg <- coni
C_lua_gc_448
 jmp #LODF
 long -8
 wrlong r21, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gc_450 ' EQI4
 mov r22, r23
 adds r22, #60 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_450
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gc_452 ' EQI4
 mov r22, r23
 adds r22, #61 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_452
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__changemode
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_454
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_lua_gc_458 ' EQI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gc_456 ' EQU4
C_lua_gc_458
 mov r21, #10 ' reg <- coni
 jmp #JMPA
 long @C_lua_gc_457 ' JUMPV addrg
C_lua_gc_456
 mov r21, #11 ' reg <- coni
C_lua_gc_457
 jmp #LODF
 long -8
 wrlong r21, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gc_459 ' EQI4
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_459
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gc_461 ' EQI4
 mov r22, r23
 adds r22, #65 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_461
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_gc_463 ' EQI4
 mov r22, r23
 adds r22, #66 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_lua_gc_463
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__changemode
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_gc_426 ' JUMPV addrg
C_lua_gc_425
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_lua_gc_426
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_lua_gc_421
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Export lua_error

 alignl ' align long
C_lua_error ' <symbol:lua_error>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #68 wz
 jmp #BRNZ
 long @C_lua_error_469 ' NEI4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #148 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_lua_error_469 ' NEU4
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_error_470 ' JUMPV addrg
C_lua_error_469
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaG__errormsg ' CALL addrg
C_lua_error_470
 mov r0, #0 ' RET coni
' C_lua_error_468 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_next

 alignl ' align long
C_lua_next ' <symbol:lua_next>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico9_696ddd94_gettable_L000284
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__next
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_lua_next_472 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_lua_next_473 ' JUMPV addrg
C_lua_next_472
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_next_473
 mov r0, r19 ' CVI, CVU or LOAD
' C_lua_next_471 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_toclose

 alignl ' align long
C_lua_toclose ' <symbol:lua_toclose>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico1_696ddd94_index2stack_L000030
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 shl r22, #16
 sar r22, #16 ' sign extend
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__newtbcupval
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wcz
 jmp #BR_B
 long @C_lua_toclose_475 ' LTI4
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
C_lua_toclose_475
' C_lua_toclose_474 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_concat

 alignl ' align long
C_lua_concat ' <symbol:lua_concat>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #0 wcz
 jmp #BRBE
 long @C_lua_concat_478 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__concat
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_concat_479 ' JUMPV addrg
C_lua_concat_478
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_lua_pushlstring_212_L000213
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
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
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_lua_concat_479
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_lua_concat_480 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_concat_480
' C_lua_concat_477 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_len

 alignl ' align long
C_lua_len ' <symbol:lua_len>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__objlen
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
' C_lua_len_482 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_getallocf

 alignl ' align long
C_lua_getallocf ' <symbol:lua_getallocf>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_getallocf_484 ' EQU4
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r2 ' ASGNP4 reg reg
C_lua_getallocf_484
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_lua_getallocf_483 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_setallocf

 alignl ' align long
C_lua_setallocf ' <symbol:lua_setallocf>
 jmp #PSHM
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
' C_lua_setallocf_486 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_setwarnf

 alignl ' align long
C_lua_setwarnf ' <symbol:lua_setwarnf>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r4
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long 716
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long 712
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 wrlong r3, r22 ' ASGNP4 reg reg
' C_lua_setwarnf_487 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_warning

 alignl ' align long
C_lua_warning ' <symbol:lua_warning>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__warning
 add SP, #8 ' CALL addrg
' C_lua_warning_488 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_newuserdatauv

 alignl ' align long
C_lua_newuserdatauv ' <symbol:lua_newuserdatauv>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newudata
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r17, RI ' ASGNP4 addrl reg
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
 jmp #BRBE
 long @C_lua_newuserdatauv_490 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_lua_newuserdatauv_490
 mov r22, r17
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_newuserdatauv_493 ' NEI4
 mov r15, #16 ' reg <- coni
 jmp #JMPA
 long @C_lua_newuserdatauv_494 ' JUMPV addrg
C_lua_newuserdatauv_493
 mov r22, r17
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 shl r22, #3 ' LSHU4 coni
 mov r15, r22
 add r15, #20 ' ADDU4 coni
C_lua_newuserdatauv_494
 mov r0, r15 ' ADDI/P
 adds r0, r17 ' ADDI/P (3)
' C_lua_newuserdatauv_489 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sicog_696ddd94_aux_upvalue_L000495 ' <symbol:aux_upvalue>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f00000 ' save registers
 mov r22, r5
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r23, r22
 and r23, #63 ' BANDI4 coni
 mov r22, #6 ' reg <- coni
 cmps r23, r22 wz
 jmp #BR_Z
 long @C_sicog_696ddd94_aux_upvalue_L000495_505 ' EQI4
 cmps r23, r22 wcz
 jmp #BR_B
 long @C_sicog_696ddd94_aux_upvalue_L000495_497 ' LTI4
' C_sicog_696ddd94_aux_upvalue_L000495_515 ' (symbol refcount = 0)
 cmps r23,  #38 wz
 jmp #BR_Z
 long @C_sicog_696ddd94_aux_upvalue_L000495_500 ' EQI4
 jmp #JMPA
 long @C_sicog_696ddd94_aux_upvalue_L000495_497 ' JUMPV addrg
C_sicog_696ddd94_aux_upvalue_L000495_500
 rdlong r22, r5 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r4 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #6 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_sicog_696ddd94_aux_upvalue_L000495_501' LTU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sicog_696ddd94_aux_upvalue_L000495_496 ' JUMPV addrg
C_sicog_696ddd94_aux_upvalue_L000495_501
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
 jmp #BR_Z
 long @C_sicog_696ddd94_aux_upvalue_L000495_503 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r2 ' ASGNP4 reg reg
C_sicog_696ddd94_aux_upvalue_L000495_503
 jmp #LODL
 long @C_lua_pushlstring_212_L000213
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C_sicog_696ddd94_aux_upvalue_L000495_496 ' JUMPV addrg
C_sicog_696ddd94_aux_upvalue_L000495_505
 rdlong r22, r5 ' reg <- INDIRP4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r4 ' CVI, CVU or LOAD
 sub r22, #1 ' SUBU4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C_sicog_696ddd94_aux_upvalue_L000495_506' LTU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sicog_696ddd94_aux_upvalue_L000495_496 ' JUMPV addrg
C_sicog_696ddd94_aux_upvalue_L000495_506
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
 jmp #BR_Z
 long @C_sicog_696ddd94_aux_upvalue_L000495_508 ' EQU4
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
C_sicog_696ddd94_aux_upvalue_L000495_508
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
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sicog_696ddd94_aux_upvalue_L000495_513 ' NEU4
 jmp #LODL
 long @C_sicog_696ddd94_aux_upvalue_L000495_510_L000511
 mov r21, RI ' reg <- addrg
 jmp #JMPA
 long @C_sicog_696ddd94_aux_upvalue_L000495_514 ' JUMPV addrg
C_sicog_696ddd94_aux_upvalue_L000495_513
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r21, r22
 adds r21, #16 ' ADDP4 coni
C_sicog_696ddd94_aux_upvalue_L000495_514
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sicog_696ddd94_aux_upvalue_L000495_496 ' JUMPV addrg
C_sicog_696ddd94_aux_upvalue_L000495_497
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sicog_696ddd94_aux_upvalue_L000495_496
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export lua_getupvalue

 alignl ' align long
C_lua_getupvalue ' <symbol:lua_getupvalue>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sicog_696ddd94_aux_upvalue_L000495
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_getupvalue_517 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
C_lua_getupvalue_517
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_getupvalue_516 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export lua_setupvalue

 alignl ' align long
C_lua_setupvalue ' <symbol:lua_setupvalue>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNP4 addrl reg
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
 jmp #CALA
 long @C_sicog_696ddd94_aux_upvalue_L000495
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_setupvalue_520 ' EQU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -24
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 jmp #CPYB
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
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_lua_setupvalue_523 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_setupvalue_523 ' EQI4
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_setupvalue_523 ' EQI4
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
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_setupvalue_523 ' JUMPV addrg
 jmp #JMPA
 long @C_lua_setupvalue_523 ' JUMPV addrg
C_lua_setupvalue_523
C_lua_setupvalue_520
 mov r0, r17 ' CVI, CVU or LOAD
' C_lua_setupvalue_519 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sicoi_696ddd94_getupvalref_L000526_nullup_L000529 ' <symbol:nullup>
 long $0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sicoi_696ddd94_getupvalref_L000526 ' <symbol:getupvalref>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sicoi_696ddd94_getupvalref_L000526_530 ' EQU4
 wrlong r15, r17 ' ASGNP4 reg reg
C_sicoi_696ddd94_getupvalref_L000526_530
 mov r22, #1 ' reg <- coni
 cmps r22, r19 wcz
 jmp #BR_A
 long @C_sicoi_696ddd94_getupvalref_L000526_532 ' GTI4
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wcz
 jmp #BR_A
 long @C_sicoi_696ddd94_getupvalref_L000526_532 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 subs r22, #4 ' SUBI4 coni
 mov r20, r15
 adds r20, #16 ' ADDP4 coni
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_sicoi_696ddd94_getupvalref_L000526_527 ' JUMPV addrg
C_sicoi_696ddd94_getupvalref_L000526_532
 jmp #LODL
 long @C_sicoi_696ddd94_getupvalref_L000526_nullup_L000529
 mov r0, RI ' reg <- addrg
C_sicoi_696ddd94_getupvalref_L000526_527
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export lua_upvalueid

 alignl ' align long
C_lua_upvalueid ' <symbol:lua_upvalueid>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sico_696ddd94_index2value_L000015
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22
 and r17, #63 ' BANDI4 coni
 mov r22, #22 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_lua_upvalueid_542 ' EQI4
 cmps r17, r22 wcz
 jmp #BR_A
 long @C_lua_upvalueid_544 ' GTI4
' C_lua_upvalueid_543 ' (symbol refcount = 0)
 cmps r17,  #6 wz
 jmp #BR_Z
 long @C_lua_upvalueid_538 ' EQI4
 jmp #JMPA
 long @C_lua_upvalueid_535 ' JUMPV addrg
C_lua_upvalueid_544
 cmps r17,  #38 wz
 jmp #BR_Z
 long @C_lua_upvalueid_539 ' EQI4
 jmp #JMPA
 long @C_lua_upvalueid_535 ' JUMPV addrg
C_lua_upvalueid_538
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sicoi_696ddd94_getupvalref_L000526
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 rdlong r0, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_lua_upvalueid_534 ' JUMPV addrg
C_lua_upvalueid_539
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #1 ' reg <- coni
 cmps r22, r19 wcz
 jmp #BR_A
 long @C_lua_upvalueid_540 ' GTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r19, r22 wcz
 jmp #BR_A
 long @C_lua_upvalueid_540 ' GTI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 subs r22, #8 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #16 ' ADDP4 coni
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_lua_upvalueid_534 ' JUMPV addrg
C_lua_upvalueid_540
C_lua_upvalueid_542
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_lua_upvalueid_534 ' JUMPV addrg
C_lua_upvalueid_535
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_lua_upvalueid_534
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export lua_upvaluejoin

 alignl ' align long
C_lua_upvaluejoin ' <symbol:lua_upvaluejoin>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
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
 jmp #CALA
 long @C_sicoi_696ddd94_getupvalref_L000526
 add SP, #12 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sicoi_696ddd94_getupvalref_L000526
 add SP, #12 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
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
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_upvaluejoin_547 ' EQI4
 rdlong r20, r15 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_lua_upvaluejoin_547 ' EQI4
 rdlong r2, r15 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_lua_upvaluejoin_547 ' JUMPV addrg
C_lua_upvaluejoin_547
' C_lua_upvaluejoin_545 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


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
C_sicog_696ddd94_aux_upvalue_L000495_510_L000511 ' <symbol:510>
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
C_lua_load_407_L000408 ' <symbol:407>
 byte 63
 byte 0

 alignl ' align long
C_lua_pushlstring_212_L000213 ' <symbol:212>
 byte 0

 alignl ' align long
C_lua_tonumberx_137_L000138 ' <symbol:137>
 long $0 ' float

 alignl ' align long
C_lua_version_48_L000049 ' <symbol:48>
 long $43fc0000 ' float

' Catalina Code

DAT ' code segment
' end
