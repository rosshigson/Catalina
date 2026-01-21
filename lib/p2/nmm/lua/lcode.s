' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export luaK_semerror

 alignl ' align long
C_luaK__semerror ' <symbol:luaK_semerror>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
' C_luaK__semerror_26 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n81_696de099_tonumeral_L000027 ' <symbol:tonumeral>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_s9n81_696de099_tonumeral_L000027_29 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9n81_696de099_tonumeral_L000027_28 ' JUMPV addrg
C_s9n81_696de099_tonumeral_L000027_29
 rdlong r23, r3 ' reg <- INDIRI4 reg
 cmps r23,  #5 wz
 if_z jmp #\C_s9n81_696de099_tonumeral_L000027_37 ' EQI4
 cmps r23,  #6 wz
 if_z jmp #\C_s9n81_696de099_tonumeral_L000027_34 ' EQI4
 jmp #\@C_s9n81_696de099_tonumeral_L000027_31 ' JUMPV addrg
C_s9n81_696de099_tonumeral_L000027_34
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s9n81_696de099_tonumeral_L000027_35 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s9n81_696de099_tonumeral_L000027_35
 mov r0, #1 ' reg <- coni
 jmp #\@C_s9n81_696de099_tonumeral_L000027_28 ' JUMPV addrg
C_s9n81_696de099_tonumeral_L000027_37
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s9n81_696de099_tonumeral_L000027_38 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s9n81_696de099_tonumeral_L000027_38
 mov r0, #1 ' reg <- coni
 jmp #\@C_s9n81_696de099_tonumeral_L000027_28 ' JUMPV addrg
C_s9n81_696de099_tonumeral_L000027_31
 mov r0, #0 ' reg <- coni
C_s9n81_696de099_tonumeral_L000027_28
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82_696de099_const2val_L000040 ' <symbol:const2val>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 mov r20, r3
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_s9n82_696de099_const2val_L000040_41 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaK_exp2const

 alignl ' align long
C_luaK__exp2const ' <symbol:luaK_exp2const>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_luaK__exp2const_43 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaK__exp2const_42 ' JUMPV addrg
C_luaK__exp2const_43
 rdlong r17, r21 ' reg <- INDIRI4 reg
 cmps r17,  #1 wcz
 if_b jmp #\C_luaK__exp2const_45 ' LTI4
 cmps r17,  #7 wcz
 if_a jmp #\C_luaK__exp2const_53 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__exp2const_54_L000056-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__exp2const_54_L000056 ' <symbol:54>
 long @C_luaK__exp2const_50
 long @C_luaK__exp2const_49
 long @C_luaK__exp2const_48
 long @C_luaK__exp2const_45
 long @C_luaK__exp2const_45
 long @C_luaK__exp2const_45
 long @C_luaK__exp2const_51

' Catalina Code

DAT ' code segment
C_luaK__exp2const_53
 cmps r17,  #11 wz
 if_z jmp #\C_luaK__exp2const_52 ' EQI4
 jmp #\@C_luaK__exp2const_45 ' JUMPV addrg
C_luaK__exp2const_48
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2const_42 ' JUMPV addrg
C_luaK__exp2const_49
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2const_42 ' JUMPV addrg
C_luaK__exp2const_50
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2const_42 ' JUMPV addrg
C_luaK__exp2const_51
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
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
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2const_42 ' JUMPV addrg
C_luaK__exp2const_52
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82_696de099_const2val_L000040
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
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
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2const_42 ' JUMPV addrg
C_luaK__exp2const_45
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81_696de099_tonumeral_L000027
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaK__exp2const_42
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9n85_696de099_previousinstruction_L000058_invalidinstr_L000061 ' <symbol:invalidinstruction>
 long $ffffffff

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s9n85_696de099_previousinstruction_L000058 ' <symbol:previousinstruction>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_s9n85_696de099_previousinstruction_L000058_62 ' LEI4
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 subs r22, #4 ' SUBI4 coni
 rdlong r20, r2 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #\@C_s9n85_696de099_previousinstruction_L000058_59 ' JUMPV addrg
C_s9n85_696de099_previousinstruction_L000058_62
 mov r0, ##@C_s9n85_696de099_previousinstruction_L000058_invalidinstr_L000061 ' reg <- addrg
C_s9n85_696de099_previousinstruction_L000058_59
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaK_nil

 alignl ' align long
C_luaK__nil ' <symbol:luaK_nil>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n85_696de099_previousinstruction_L000058 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #8 wz
 if_nz jmp #\C_luaK__nil_65 ' NEI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 adds r22, r15 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r15, r21 wcz
 if_a jmp #\C_luaK__nil_70 ' GTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 cmps r21, r22 wcz
 if_be jmp #\C_luaK__nil_69 ' LEI4
C_luaK__nil_70
 cmps r21, r15 wcz
 if_a jmp #\C_luaK__nil_67 ' GTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 cmps r15, r22 wcz
 if_a jmp #\C_luaK__nil_67 ' GTI4
C_luaK__nil_69
 cmps r15, r21 wcz
 if_ae jmp #\C_luaK__nil_71 ' GEI4
 mov r21, r15 ' CVI, CVU or LOAD
C_luaK__nil_71
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_luaK__nil_73 ' LEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaK__nil_73
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffff807f ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r21 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 mov r18, ##32640 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ff00ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r20, r21 ' SUBI/P (1)
 shl r20, #16 ' LSHU4 coni
 mov r18, ##$ff0000 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 jmp #\@C_luaK__nil_64 ' JUMPV addrg
C_luaK__nil_67
C_luaK__nil_65
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r19
 subs r4, #1 ' SUBI4 coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #8
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
C_luaK__nil_64
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n87_696de099_getjump_L000075 ' <symbol:getjump>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 rdlong r20, r3 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##16777215 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_s9n87_696de099_getjump_L000075_77 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_s9n87_696de099_getjump_L000075_76 ' JUMPV addrg
C_s9n87_696de099_getjump_L000075_77
 mov r22, r2
 adds r22, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_s9n87_696de099_getjump_L000075_76
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n88_696de099_fixjump_L000079 ' <symbol:fixjump>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #1 ' ADDI4 coni
 mov r17, r19 ' SUBI/P
 subs r17, r22 ' SUBI/P (3)
 mov r22, ##-16777215 ' reg <- con
 cmps r22, r17 wcz
 if_a jmp #\C_s9n88_696de099_fixjump_L000079_83 ' GTI4
 mov r22, ##16777216 ' reg <- con
 cmps r17, r22 wcz
 if_be jmp #\C_s9n88_696de099_fixjump_L000079_81 ' LEI4
C_s9n88_696de099_fixjump_L000079_83
 mov r2, ##@C_s9n88_696de099_fixjump_L000079_84_L000085 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_s9n88_696de099_fixjump_L000079_81
 rdlong r22, r15 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 mov r20, ##16777215 ' reg <- con
 adds r20, r17 ' ADDI/P (2)
 shl r20, #7 ' LSHU4 coni
 mov r18, ##$ffffff80 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r15 ' ASGNU4 reg reg
' C_s9n88_696de099_fixjump_L000079_80 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_concat

 alignl ' align long
C_luaK__concat ' <symbol:luaK_concat>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##-1 ' reg <- con
 cmps r19, r22 wz
 if_nz jmp #\C_luaK__concat_87 ' NEI4
 jmp #\@C_luaK__concat_86 ' JUMPV addrg
C_luaK__concat_87
 rdlong r22, r21 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_luaK__concat_89 ' NEI4
 wrlong r19, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__concat_90 ' JUMPV addrg
C_luaK__concat_89
 rdlong r17, r21 ' reg <- INDIRI4 reg
 jmp #\@C_luaK__concat_92 ' JUMPV addrg
C_luaK__concat_91
 mov r17, r15 ' CVI, CVU or LOAD
C_luaK__concat_92
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n87_696de099_getjump_L000075
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_luaK__concat_91 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n88_696de099_fixjump_L000079
 add SP, #8 ' CALL addrg
C_luaK__concat_90
C_luaK__concat_86
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_jump

 alignl ' align long
C_luaK__jump ' <symbol:luaK_jump>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, ##-1 ' reg ARG con
 mov r4, #56 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8_696de099_codesJ__L000025
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaK__jump_94 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_ret

 alignl ' align long
C_luaK__ret ' <symbol:luaK_ret>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 if_z jmp #\C_luaK__ret_98 ' EQI4
 cmps r19,  #1 wz
 if_z jmp #\C_luaK__ret_99 ' EQI4
 jmp #\@C_luaK__ret_96 ' JUMPV addrg
C_luaK__ret_98
 mov r22, #71 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__ret_97 ' JUMPV addrg
C_luaK__ret_99
 mov r22, #72 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__ret_97 ' JUMPV addrg
C_luaK__ret_96
 mov r22, #70 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaK__ret_97
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r19
 adds r4, #1 ' ADDI4 coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
' C_luaK__ret_95 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n8a_696de099_condjump_L000100 ' <symbol:condjump>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 12 ' stack ARG INDIR ADDRFi
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n8a_696de099_condjump_L000100_101 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_getlabel

 alignl ' align long
C_luaK__getlabel ' <symbol:luaK_getlabel>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_luaK__getlabel_102 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s9n8b_696de099_getjumpcontrol_L000103 ' <symbol:getjumpcontrol>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 rdlong r20, r3 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 cmps r2,  #1 wcz
 if_b jmp #\C_s9n8b_696de099_getjumpcontrol_L000103_105 ' LTI4
 mov r22, ##-4 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 mov r20, ##@C_luaP__opmodes ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s9n8b_696de099_getjumpcontrol_L000103_105 ' EQI4
 mov r22, ##-4 ' reg <- con
 mov r0, r23 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #\@C_s9n8b_696de099_getjumpcontrol_L000103_104 ' JUMPV addrg
C_s9n8b_696de099_getjumpcontrol_L000103_105
 mov r0, r23 ' CVI, CVU or LOAD
C_s9n8b_696de099_getjumpcontrol_L000103_104
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s9n8c_696de099_patchtestreg_L000107 ' <symbol:patchtestreg>
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
 long @C_s9n8b_696de099_getjumpcontrol_L000103
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #67 wz
 if_z jmp #\C_s9n8c_696de099_patchtestreg_L000107_109 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9n8c_696de099_patchtestreg_L000107_108 ' JUMPV addrg
C_s9n8c_696de099_patchtestreg_L000107_109
 cmps r19,  #255 wz
 if_z jmp #\C_s9n8c_696de099_patchtestreg_L000107_111 ' EQI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 cmps r19, r22 wz
 if_z jmp #\C_s9n8c_696de099_patchtestreg_L000107_111 ' EQI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffff807f ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 mov r18, ##32640 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 jmp #\@C_s9n8c_696de099_patchtestreg_L000107_112 ' JUMPV addrg
C_s9n8c_696de099_patchtestreg_L000107_111
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, #15 ' reg <- coni
 mov r18, r22
 shr r18, #16 ' RSHU4 coni
 and r18, #255 ' BANDU4 coni
 shl r18, #7 ' LSHU4 coni
 or r18, #66 ' BORU4 coni
 shr r22, r20 ' RSHU (1)
 and r22, #1 ' BANDU4 coni
 shl r22, #15 ' LSHU4 coni
 or r22, r18 ' BORI/U (2)
 wrlong r22, r17 ' ASGNU4 reg reg
C_s9n8c_696de099_patchtestreg_L000107_112
 mov r0, #1 ' reg <- coni
C_s9n8c_696de099_patchtestreg_L000107_108
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8d_696de099_removevalues_L000113 ' <symbol:removevalues>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_s9n8d_696de099_removevalues_L000113_118 ' JUMPV addrg
C_s9n8d_696de099_removevalues_L000113_115
 mov r2, #255 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8c_696de099_patchtestreg_L000107
 add SP, #8 ' CALL addrg
' C_s9n8d_696de099_removevalues_L000113_116 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n87_696de099_getjump_L000075
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s9n8d_696de099_removevalues_L000113_118
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_s9n8d_696de099_removevalues_L000113_115 ' NEI4
' C_s9n8d_696de099_removevalues_L000113_114 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8e_696de099_patchlistaux_L000119 ' <symbol:patchlistaux>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #\@C_s9n8e_696de099_patchlistaux_L000119_122 ' JUMPV addrg
C_s9n8e_696de099_patchlistaux_L000119_121
 mov r2, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n87_696de099_getjump_L000075
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8c_696de099_patchtestreg_L000107
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n8e_696de099_patchlistaux_L000119_124 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n88_696de099_fixjump_L000079
 add SP, #8 ' CALL addrg
 jmp #\@C_s9n8e_696de099_patchlistaux_L000119_125 ' JUMPV addrg
C_s9n8e_696de099_patchlistaux_L000119_124
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n88_696de099_fixjump_L000079
 add SP, #8 ' CALL addrg
C_s9n8e_696de099_patchlistaux_L000119_125
 mov r23, r15 ' CVI, CVU or LOAD
C_s9n8e_696de099_patchlistaux_L000119_122
 mov r22, ##-1 ' reg <- con
 cmps r23, r22 wz
 if_nz jmp #\C_s9n8e_696de099_patchlistaux_L000119_121 ' NEI4
' C_s9n8e_696de099_patchlistaux_L000119_120 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_patchlist

 alignl ' align long
C_luaK__patchlist ' <symbol:luaK_patchlist>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #255 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n8e_696de099_patchlistaux_L000119
 add SP, #16 ' CALL addrg
' C_luaK__patchlist_126 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_patchtohere

 alignl ' align long
C_luaK__patchtohere ' <symbol:luaK_patchtohere>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaK__getlabel ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__patchlist
 add SP, #8 ' CALL addrg
' C_luaK__patchtohere_127 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n8f_696de099_savelineinfo_L000128 ' <symbol:savelineinfo>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r17, r19 ' SUBI/P
 subs r17, r22 ' SUBI/P (3)
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r15, r22
 subs r15, #1 ' SUBI4 coni
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_abs ' CALL addrg
 cmps r0,  #128 wcz
 if_ae jmp #\C_s9n8f_696de099_savelineinfo_L000128_132 ' GEI4
 mov r22, r23
 adds r22, #53 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 mov r18, r20 ' CVUI
 and r18, cviu_m1 ' zero extend
 adds r18, #1 ' ADDI4 coni
 wrbyte r18, r22 ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #128 wcz
 if_b jmp #\C_s9n8f_696de099_savelineinfo_L000128_130 ' LTI4
C_s9n8f_696de099_savelineinfo_L000128_132
 mov r2, ##@C_s9n8f_696de099_savelineinfo_L000128_133_L000134 ' reg ARG ADDRG
 mov r3, ##536870911 ' reg ARG con
 mov r22, #8 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21
 adds r5, #36 ' ADDP4 coni
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov RI, r20
 wrlong RI, --PTRA ' stack ARG
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, r20
 wrlong RI, --PTRA ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 wrlong r15, r22 ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 wrlong r18, r22 ' ASGNI4 reg reg
 mov r22, r20
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r17, ##-128 ' reg <- con
 mov r22, r23
 adds r22, #53 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s9n8f_696de099_savelineinfo_L000128_130
 mov r2, ##@C_s9n8f_696de099_savelineinfo_L000128_135_L000136 ' reg ARG ADDRG
 mov r3, ##2147483647 ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r21
 adds r5, #24 ' ADDP4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 wrlong RI, --PTRA ' stack ARG
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov RI, r20
 wrlong RI, --PTRA ' stack ARG
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, r20
 wrlong RI, --PTRA ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r15 ' ADDI/P (2)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNI1 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
' C_s9n8f_696de099_savelineinfo_L000128_129 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8i_696de099_removelastlineinfo_L000137 ' <symbol:removelastlineinfo>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $550000 ' save registers
 rdlong r22, r2 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #64 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 mov r20, ##-128 ' reg <- con
 cmps r22, r20 wz
 if_z jmp #\C_s9n8i_696de099_removelastlineinfo_L000137_139 ' EQI4
 mov r22, r2
 adds r22, #24 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r16, FP
 sub r16, #-(-8) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r16, #64 ' ADDP4 coni
 rdlong r16, r16 ' reg <- INDIRP4 reg
 adds r18, r16 ' ADDI/P (1)
 rdbyte r18, r18 ' reg <- INDIRI1 reg
 shl r18, #24
 sar r18, #24 ' sign extend
 subs r20, r18 ' SUBI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #53 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s9n8i_696de099_removelastlineinfo_L000137_140 ' JUMPV addrg
C_s9n8i_696de099_removelastlineinfo_L000137_139
 mov r22, r2
 adds r22, #36 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #53 ' ADDP4 coni
 mov r20, #129 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s9n8i_696de099_removelastlineinfo_L000137_140
' C_s9n8i_696de099_removelastlineinfo_L000137_138 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n8j_696de099_removelastinstruction_L000141 ' <symbol:removelastinstruction>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n8i_696de099_removelastlineinfo_L000137 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_s9n8j_696de099_removelastinstruction_L000141_142 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_code

 alignl ' align long
C_luaK__code ' <symbol:luaK_code>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r19, r23 ' reg <- INDIRP4 reg
 mov r2, ##@C_s9n8f_696de099_savelineinfo_L000128_135_L000136 ' reg ARG ADDRG
 mov r3, ##1073741823 ' reg ARG con
 mov r4, #4 ' reg ARG coni
 mov r5, r19
 adds r5, #20 ' ADDP4 coni
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov RI, r20
 wrlong RI, --PTRA ' stack ARG
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov RI, r20
 wrlong RI, --PTRA ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 wrlong r18, r22 ' ASGNI4 reg reg
 mov r22, r20
 shl r22, #2 ' LSHI4 coni
 mov r20, r19
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 wrlong r21, r22 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8f_696de099_savelineinfo_L000128
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22
 subs r0, #1 ' SUBI4 coni
' C_luaK__code_143 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_codeABCk

 alignl ' align long
C_luaK__codeA_B_C_k ' <symbol:luaK_codeABCk>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r21 ' CVI, CVU or LOAD
 shl r20, #16 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r19 ' CVI, CVU or LOAD
 shl r20, #24 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r17 ' CVI, CVU or LOAD
 shl r20, #15 ' LSHU4 coni
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaK__codeA_B_C_k_144 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_codeABx

 alignl ' align long
C_luaK__codeA_B_x ' <symbol:luaK_codeABx>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r17
 shl r20, #15 ' LSHU4 coni
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaK__codeA_B_x_145 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8k_696de099_codeA_sB_x_L000146 ' <symbol:codeAsBx>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##65535 ' reg <- con
 adds r22, r17 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #15 ' LSHU4 coni
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n8k_696de099_codeA_sB_x_L000146_147 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n8_696de099_codesJ__L000025 ' <symbol:codesJ>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##16777215 ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shl r20, #7 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r17 ' CVI, CVU or LOAD
 shl r20, #15 ' LSHU4 coni
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n8_696de099_codesJ__L000025_148 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n8l_696de099_codeextraarg_L000149 ' <symbol:codeextraarg>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 shl r22, #7 ' LSHU4 coni
 mov r2, r22
 or r2, #82 ' BORU4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n8l_696de099_codeextraarg_L000149_150 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8m_696de099_luaK__codek_L000151 ' <symbol:luaK_codek>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##131071 ' reg <- con
 cmps r19, r22 wcz
 if_a jmp #\C_s9n8m_696de099_luaK__codek_L000151_153 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__codeA_B_x
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s9n8m_696de099_luaK__codek_L000151_152 ' JUMPV addrg
C_s9n8m_696de099_luaK__codek_L000151_153
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #4 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__codeA_B_x
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8l_696de099_codeextraarg_L000149
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_s9n8m_696de099_luaK__codek_L000151_152
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_checkstack

 alignl ' align long
C_luaK__checkstack ' <symbol:luaK_checkstack>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22 ' ADDI/P
 adds r19, r21 ' ADDI/P (3)
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19, r22 wcz
 if_be jmp #\C_luaK__checkstack_156 ' LEI4
 cmps r19,  #255 wcz
 if_b jmp #\C_luaK__checkstack_158 ' LTI4
 mov r2, ##@C_luaK__checkstack_160_L000161 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_luaK__checkstack_158
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaK__checkstack_156
' C_luaK__checkstack_155 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_reserveregs

 alignl ' align long
C_luaK__reserveregs ' <symbol:luaK_reserveregs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__checkstack
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 adds r20, r21 ' ADDI/P (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaK__reserveregs_162 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8o_696de099_freereg_L000163 ' <symbol:freereg>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaY__nvarstack ' CALL addrg
 cmps r21, r0 wcz
 if_b jmp #\C_s9n8o_696de099_freereg_L000163_165 ' LTI4
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s9n8o_696de099_freereg_L000163_165
' C_s9n8o_696de099_freereg_L000163_164 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8p_696de099_freeregs_L000167 ' <symbol:freeregs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21, r19 wcz
 if_be jmp #\C_s9n8p_696de099_freeregs_L000167_169 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8o_696de099_freereg_L000163
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8o_696de099_freereg_L000163
 add SP, #4 ' CALL addrg
 jmp #\@C_s9n8p_696de099_freeregs_L000167_170 ' JUMPV addrg
C_s9n8p_696de099_freeregs_L000167_169
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8o_696de099_freereg_L000163
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8o_696de099_freereg_L000163
 add SP, #4 ' CALL addrg
C_s9n8p_696de099_freeregs_L000167_170
' C_s9n8p_696de099_freeregs_L000167_168 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8q_696de099_freeexp_L000171 ' <symbol:freeexp>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_s9n8q_696de099_freeexp_L000171_173 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8o_696de099_freereg_L000163
 add SP, #4 ' CALL addrg
C_s9n8q_696de099_freeexp_L000171_173
' C_s9n8q_696de099_freeexp_L000171_172 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n8r_696de099_freeexps_L000175 ' <symbol:freeexps>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_s9n8r_696de099_freeexps_L000175_178 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
 jmp #\@C_s9n8r_696de099_freeexps_L000175_179 ' JUMPV addrg
C_s9n8r_696de099_freeexps_L000175_178
 mov r17, ##-1 ' reg <- con
C_s9n8r_696de099_freeexps_L000175_179
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNI4 addrli reg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_s9n8r_696de099_freeexps_L000175_181 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_s9n8r_696de099_freeexps_L000175_182 ' JUMPV addrg
C_s9n8r_696de099_freeexps_L000175_181
 mov r15, ##-1 ' reg <- con
C_s9n8r_696de099_freeexps_L000175_182
 mov RI, FP
 sub RI, #-(-12)
 wrlong r15, RI ' ASGNI4 addrli reg
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
 long @C_s9n8p_696de099_freeregs_L000167
 add SP, #8 ' CALL addrg
' C_s9n8r_696de099_freeexps_L000175_176 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n8s_696de099_addk_L000183 ' <symbol:addk>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRP4 reg
 rdlong r17, r23 ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r22, r9
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_s9n8s_696de099_addk_L000183_185 ' NEI4
 rdlong r13, r9 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r13, r22 wcz
 if_ae jmp #\C_s9n8s_696de099_addk_L000183_187 ' GEI4
 mov r22, r13
 shl r22, #3 ' LSHI4 coni
 mov r20, r17
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #63 ' BANDI4 coni
 mov r18, r19
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #63 ' BANDI4 coni
 cmps r20, r18 wz
 if_nz jmp #\C_s9n8s_696de099_addk_L000183_187 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##0 ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n8s_696de099_addk_L000183_187 ' EQI4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #\@C_s9n8s_696de099_addk_L000183_184 ' JUMPV addrg
C_s9n8s_696de099_addk_L000183_187
C_s9n8s_696de099_addk_L000183_185
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRI4 reg
 mov r7, FP
 sub r7, #-(-12) ' reg <- addrli
 wrlong r13, r7 ' ASGNI4 reg reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r9 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r11
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
 mov r2, ##@C_s9n8s_696de099_addk_L000183_189_L000190 ' reg ARG ADDRG
 mov r3, ##33554431 ' reg ARG con
 mov r4, #8 ' reg ARG coni
 mov r5, r17
 adds r5, #16 ' ADDP4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r13
 wrlong RI, --PTRA ' stack ARG
 mov r22, r17
 adds r22, #48 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov RI, r20
 wrlong RI, --PTRA ' stack ARG
 mov RI, r11
 wrlong RI, --PTRA ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 jmp #\@C_s9n8s_696de099_addk_L000183_192 ' JUMPV addrg
C_s9n8s_696de099_addk_L000183_191
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, r17
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s9n8s_696de099_addk_L000183_192
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r15, r22 wcz
 if_b jmp #\C_s9n8s_696de099_addk_L000183_191 ' LTI4
 mov r22, r13
 shl r22, #3 ' LSHI4 coni
 mov r20, r17
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r7, r22 ' ADDI/P
 adds r7, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r0, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s9n8s_696de099_addk_L000183_195 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s9n8s_696de099_addk_L000183_195 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s9n8s_696de099_addk_L000183_195 ' EQI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r11 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_s9n8s_696de099_addk_L000183_195 ' JUMPV addrg
 jmp #\@C_s9n8s_696de099_addk_L000183_195 ' JUMPV addrg
C_s9n8s_696de099_addk_L000183_195
 mov r0, r13 ' CVI, CVU or LOAD
C_s9n8s_696de099_addk_L000183_184
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n8u_696de099_stringK__L000198 ' <symbol:stringK>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 mov r17, r21 ' CVI, CVU or LOAD
 wrlong r17, r19 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8s_696de099_addk_L000183
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n8u_696de099_stringK__L000198_199 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n8v_696de099_luaK__intK__L000200 ' <symbol:luaK_intK>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 wrlong r21, r19 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8s_696de099_addk_L000183
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n8v_696de099_luaK__intK__L000200_201 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n810_696de099_luaK__numberK__L000202 ' <symbol:luaK_numberK>
 calld PA,#NEWF
 sub SP, #36
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 wrlong r21, r19 ' ASGNF4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9n810_696de099_luaK__numberK__L000202_204 ' NEI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8s_696de099_addk_L000183
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s9n810_696de099_luaK__numberK__L000202_203 ' JUMPV addrg
C_s9n810_696de099_luaK__numberK__L000202_204
 mov r22, #24 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 mov r3, ##@C_s9n810_696de099_luaK__numberK__L000202_206_L000207
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s9n810_696de099_luaK__numberK__L000202_209 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRF4 reg
 jmp #\@C_s9n810_696de099_luaK__numberK__L000202_210 ' JUMPV addrg
C_s9n810_696de099_luaK__numberK__L000202_209
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 mov r19, r0 ' CVI, CVU or LOAD
C_s9n810_696de099_luaK__numberK__L000202_210
 mov RI, FP
 sub RI, #-(-28)
 wrlong r19, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8s_696de099_addk_L000183
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s9n810_696de099_luaK__numberK__L000202_203
 calld PA,#POPM ' restore registers
 add SP, #36 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n812_696de099_boolF__L000211 ' <symbol:boolF>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8s_696de099_addk_L000183
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n812_696de099_boolF__L000211_212 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n813_696de099_boolT__L000214 ' <symbol:boolT>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #17 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8s_696de099_addk_L000183
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n813_696de099_boolT__L000214_215 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n814_696de099_nilK__L000217 ' <symbol:nilK>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r21, FP
 sub r21, #-(-12) ' reg <- addrli
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8s_696de099_addk_L000183
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n814_696de099_nilK__L000217_218 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n815_696de099_fitsC__L000220 ' <symbol:fitsC>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 add r22, #127 ' ADDU4 coni
 cmp r22,  #255 wcz 
 if_a jmp #\C_s9n815_696de099_fitsC__L000220_223 ' GTU4
 mov r23, #1 ' reg <- coni
 jmp #\@C_s9n815_696de099_fitsC__L000220_224 ' JUMPV addrg
C_s9n815_696de099_fitsC__L000220_223
 mov r23, #0 ' reg <- coni
C_s9n815_696de099_fitsC__L000220_224
 mov r0, r23 ' CVI, CVU or LOAD
' C_s9n815_696de099_fitsC__L000220_221 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s9n816_696de099_fitsB_x_L000225 ' <symbol:fitsBx>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, ##-65535 ' reg <- con
 cmps r22, r2 wcz
 if_a jmp #\C_s9n816_696de099_fitsB_x_L000225_228 ' GTI4
 mov r22, ##65536 ' reg <- con
 cmps r2, r22 wcz
 if_a jmp #\C_s9n816_696de099_fitsB_x_L000225_228 ' GTI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_s9n816_696de099_fitsB_x_L000225_229 ' JUMPV addrg
C_s9n816_696de099_fitsB_x_L000225_228
 mov r23, #0 ' reg <- coni
C_s9n816_696de099_fitsB_x_L000225_229
 mov r0, r23 ' CVI, CVU or LOAD
' C_s9n816_696de099_fitsB_x_L000225_226 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaK_int

 alignl ' align long
C_luaK__int ' <symbol:luaK_int>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n816_696de099_fitsB_x_L000225 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__int_231 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8k_696de099_codeA_sB_x_L000146
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__int_232 ' JUMPV addrg
C_luaK__int_231
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8v_696de099_luaK__intK__L000200
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8m_696de099_luaK__codek_L000151
 add SP, #8 ' CALL addrg
C_luaK__int_232
' C_luaK__int_230 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n817_696de099_luaK__float_L000233 ' <symbol:luaK_float>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9n817_696de099_luaK__float_L000233_235 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n816_696de099_fitsB_x_L000225 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n817_696de099_luaK__float_L000233_235 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8k_696de099_codeA_sB_x_L000146
 add SP, #12 ' CALL addrg
 jmp #\@C_s9n817_696de099_luaK__float_L000233_236 ' JUMPV addrg
C_s9n817_696de099_luaK__float_L000233_235
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n810_696de099_luaK__numberK__L000202
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8m_696de099_luaK__codek_L000151
 add SP, #8 ' CALL addrg
C_s9n817_696de099_luaK__float_L000233_236
' C_s9n817_696de099_luaK__float_L000233_234 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n818_696de099_const2exp_L000237 ' <symbol:const2exp>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22
 and r23, #63 ' BANDI4 coni
 cmps r23,  #0 wcz
 if_b jmp #\C_s9n818_696de099_const2exp_L000237_239 ' LTI4
 cmps r23,  #4 wcz
 if_a jmp #\C_s9n818_696de099_const2exp_L000237_248 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9n818_696de099_const2exp_L000237_249_L000251 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9n818_696de099_const2exp_L000237_249_L000251 ' <symbol:249>
 long @C_s9n818_696de099_const2exp_L000237_246
 long @C_s9n818_696de099_const2exp_L000237_244
 long @C_s9n818_696de099_const2exp_L000237_239
 long @C_s9n818_696de099_const2exp_L000237_242
 long @C_s9n818_696de099_const2exp_L000237_247

' Catalina Code

DAT ' code segment
C_s9n818_696de099_const2exp_L000237_248
 cmps r23,  #17 wz
 if_z jmp #\C_s9n818_696de099_const2exp_L000237_245 ' EQI4
 cmps r23,  #19 wz
 if_z jmp #\C_s9n818_696de099_const2exp_L000237_243 ' EQI4
 cmps r23,  #20 wz
 if_z jmp #\C_s9n818_696de099_const2exp_L000237_247 ' EQI4
 jmp #\@C_s9n818_696de099_const2exp_L000237_239 ' JUMPV addrg
C_s9n818_696de099_const2exp_L000237_242
 mov r22, #6 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r3 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_s9n818_696de099_const2exp_L000237_240 ' JUMPV addrg
C_s9n818_696de099_const2exp_L000237_243
 mov r22, #5 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r3 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 jmp #\@C_s9n818_696de099_const2exp_L000237_240 ' JUMPV addrg
C_s9n818_696de099_const2exp_L000237_244
 mov r22, #3 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 jmp #\@C_s9n818_696de099_const2exp_L000237_240 ' JUMPV addrg
C_s9n818_696de099_const2exp_L000237_245
 mov r22, #2 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 jmp #\@C_s9n818_696de099_const2exp_L000237_240 ' JUMPV addrg
C_s9n818_696de099_const2exp_L000237_246
 mov r22, #1 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 jmp #\@C_s9n818_696de099_const2exp_L000237_240 ' JUMPV addrg
C_s9n818_696de099_const2exp_L000237_247
 mov r22, #7 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r3 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_s9n818_696de099_const2exp_L000237_239
C_s9n818_696de099_const2exp_L000237_240
' C_s9n818_696de099_const2exp_L000237_238 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaK_setreturns

 alignl ' align long
C_luaK__setreturns ' <symbol:luaK_setreturns>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 if_nz jmp #\C_luaK__setreturns_253 ' NEI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHU4 coni
 mov r18, ##$ff000000 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 jmp #\@C_luaK__setreturns_254 ' JUMPV addrg
C_luaK__setreturns_253
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHU4 coni
 mov r18, ##$ff000000 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffff807f ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #7 ' LSHU4 coni
 mov r18, ##32640 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
C_luaK__setreturns_254
' C_luaK__setreturns_252 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n81b_696de099_str2K__L000255 ' <symbol:str2K>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8u_696de099_stringK__L000198
 add SP, #4 ' CALL addrg
 wrlong r0, r22 ' ASGNI4 reg reg
 mov r22, #4 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
' C_s9n81b_696de099_str2K__L000255_256 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_setoneret

 alignl ' align long
C_luaK__setoneret ' <symbol:luaK_setoneret>
 calld PA,#PSHM
 long $540000 ' save registers
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 if_nz jmp #\C_luaK__setoneret_258 ' NEI4
 mov r22, #8 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 rdlong r18, r3 ' reg <- INDIRP4 reg
 adds r18, #52 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRU4 reg
 shr r20, #7 ' RSHU4 coni
 and r20, #255 ' BANDU4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_luaK__setoneret_259 ' JUMPV addrg
C_luaK__setoneret_258
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaK__setoneret_260 ' NEI4
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 rdlong r20, r3 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$ffffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, ##$2000000 ' reg <- con
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, #17 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
C_luaK__setoneret_260
C_luaK__setoneret_259
' C_luaK__setoneret_257 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaK_dischargevars

 alignl ' align long
C_luaK__dischargevars ' <symbol:luaK_dischargevars>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r19, r21 ' reg <- INDIRI4 reg
 cmps r19,  #9 wcz
 if_b jmp #\C_luaK__dischargevars_264 ' LTI4
 cmps r19,  #19 wcz
 if_a jmp #\C_luaK__dischargevars_264 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__dischargevars_274_L000276-36 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__dischargevars_274_L000276 ' <symbol:274>
 long @C_luaK__dischargevars_267
 long @C_luaK__dischargevars_268
 long @C_luaK__dischargevars_266
 long @C_luaK__dischargevars_272
 long @C_luaK__dischargevars_269
 long @C_luaK__dischargevars_270
 long @C_luaK__dischargevars_271
 long @C_luaK__dischargevars_264
 long @C_luaK__dischargevars_264
 long @C_luaK__dischargevars_273
 long @C_luaK__dischargevars_273

' Catalina Code

DAT ' code segment
C_luaK__dischargevars_266
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82_696de099_const2val_L000040
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n818_696de099_const2exp_L000237
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__dischargevars_264 ' JUMPV addrg
C_luaK__dischargevars_267
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__dischargevars_264 ' JUMPV addrg
C_luaK__dischargevars_268
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r4, r20 ' reg <- INDIRI4 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #9
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__dischargevars_264 ' JUMPV addrg
C_luaK__dischargevars_269
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdword r18, r20 ' reg <- INDIRI2 reg
 mov r3, r18 ' CVII
 mov r3, r18 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r18, r21
 adds r18, #6 ' ADDP4 coni
 rdbyte r4, r18 ' reg <- CVUI4 INDIRU1 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #11
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__dischargevars_264 ' JUMPV addrg
C_luaK__dischargevars_270
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8o_696de099_freereg_L000163
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdword r18, r20 ' reg <- INDIRI2 reg
 mov r3, r18 ' CVII
 mov r3, r18 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r18, r21
 adds r18, #6 ' ADDP4 coni
 rdbyte r4, r18 ' reg <- CVUI4 INDIRU1 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #13
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__dischargevars_264 ' JUMPV addrg
C_luaK__dischargevars_271
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8o_696de099_freereg_L000163
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdword r18, r20 ' reg <- INDIRI2 reg
 mov r3, r18 ' CVII
 mov r3, r18 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r18, r21
 adds r18, #6 ' ADDP4 coni
 rdbyte r4, r18 ' reg <- CVUI4 INDIRU1 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #14
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__dischargevars_264 ' JUMPV addrg
C_luaK__dischargevars_272
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 mov r2, r22 ' CVII
 mov r2, r22 ' CVII
 shl r2, #16
 sar r2, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r3, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8p_696de099_freeregs_L000167
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdword r18, r20 ' reg <- INDIRI2 reg
 mov r3, r18 ' CVII
 mov r3, r18 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r18, r21
 adds r18, #6 ' ADDP4 coni
 rdbyte r4, r18 ' reg <- CVUI4 INDIRU1 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #12
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__dischargevars_264 ' JUMPV addrg
C_luaK__dischargevars_273
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__setoneret
 add SP, #4 ' CALL addrg
C_luaK__dischargevars_264
' C_luaK__dischargevars_262 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n81e_696de099_discharge2reg_L000278 ' <symbol:discharge2reg>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ff0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 rdlong r17, r21 ' reg <- INDIRI4 reg
 cmps r17,  #1 wcz
 if_b jmp #\C_s9n81e_696de099_discharge2reg_L000278_279 ' LTI4
 cmps r17,  #17 wcz
 if_a jmp #\C_s9n81e_696de099_discharge2reg_L000278_279 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9n81e_696de099_discharge2reg_L000278_294_L000296-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9n81e_696de099_discharge2reg_L000278_294_L000296 ' <symbol:294>
 long @C_s9n81e_696de099_discharge2reg_L000278_283
 long @C_s9n81e_696de099_discharge2reg_L000278_285
 long @C_s9n81e_696de099_discharge2reg_L000278_284
 long @C_s9n81e_696de099_discharge2reg_L000278_287
 long @C_s9n81e_696de099_discharge2reg_L000278_288
 long @C_s9n81e_696de099_discharge2reg_L000278_289
 long @C_s9n81e_696de099_discharge2reg_L000278_286
 long @C_s9n81e_696de099_discharge2reg_L000278_291
 long @C_s9n81e_696de099_discharge2reg_L000278_279
 long @C_s9n81e_696de099_discharge2reg_L000278_279
 long @C_s9n81e_696de099_discharge2reg_L000278_279
 long @C_s9n81e_696de099_discharge2reg_L000278_279
 long @C_s9n81e_696de099_discharge2reg_L000278_279
 long @C_s9n81e_696de099_discharge2reg_L000278_279
 long @C_s9n81e_696de099_discharge2reg_L000278_279
 long @C_s9n81e_696de099_discharge2reg_L000278_279
 long @C_s9n81e_696de099_discharge2reg_L000278_290

' Catalina Code

DAT ' code segment
C_s9n81e_696de099_discharge2reg_L000278_283
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__nil
 add SP, #8 ' CALL addrg
 jmp #\@C_s9n81e_696de099_discharge2reg_L000278_281 ' JUMPV addrg
C_s9n81e_696de099_discharge2reg_L000278_284
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #5
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #\@C_s9n81e_696de099_discharge2reg_L000278_281 ' JUMPV addrg
C_s9n81e_696de099_discharge2reg_L000278_285
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #7
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #\@C_s9n81e_696de099_discharge2reg_L000278_281 ' JUMPV addrg
C_s9n81e_696de099_discharge2reg_L000278_286
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81b_696de099_str2K__L000255
 add SP, #4 ' CALL addrg
C_s9n81e_696de099_discharge2reg_L000278_287
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8m_696de099_luaK__codek_L000151
 add SP, #8 ' CALL addrg
 jmp #\@C_s9n81e_696de099_discharge2reg_L000278_281 ' JUMPV addrg
C_s9n81e_696de099_discharge2reg_L000278_288
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n817_696de099_luaK__float_L000233
 add SP, #8 ' CALL addrg
 jmp #\@C_s9n81e_696de099_discharge2reg_L000278_281 ' JUMPV addrg
C_s9n81e_696de099_discharge2reg_L000278_289
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__int
 add SP, #8 ' CALL addrg
 jmp #\@C_s9n81e_696de099_discharge2reg_L000278_281 ' JUMPV addrg
C_s9n81e_696de099_discharge2reg_L000278_290
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$ffff807f ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r19 ' CVI, CVU or LOAD
 shl r18, #7 ' LSHU4 coni
 mov r16, ##32640 ' reg <- con
 and r18, r16 ' BANDI/U (1)
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_s9n81e_696de099_discharge2reg_L000278_281 ' JUMPV addrg
C_s9n81e_696de099_discharge2reg_L000278_291
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wz
 if_z jmp #\C_s9n81e_696de099_discharge2reg_L000278_281 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
C_s9n81e_696de099_discharge2reg_L000278_281
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_s9n81e_696de099_discharge2reg_L000278_279
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n81h_696de099_discharge2anyreg_L000298 ' <symbol:discharge2anyreg>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_z jmp #\C_s9n81h_696de099_discharge2anyreg_L000298_300 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81e_696de099_discharge2reg_L000278
 add SP, #8 ' CALL addrg
C_s9n81h_696de099_discharge2anyreg_L000298_300
' C_s9n81h_696de099_discharge2anyreg_L000298_299 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n81i_696de099_code_loadbool_L000302 ' <symbol:code_loadbool>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaK__getlabel ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r19
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s9n81i_696de099_code_loadbool_L000302_303 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n81j_696de099_need_value_L000304 ' <symbol:need_value>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_s9n81j_696de099_need_value_L000304_309 ' JUMPV addrg
C_s9n81j_696de099_need_value_L000304_306
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8b_696de099_getjumpcontrol_L000103
 add SP, #4 ' CALL addrg
 rdlong r19, r0 ' reg <- INDIRU4 reg
 mov r22, r19
 and r22, #127 ' BANDU4 coni
 cmps r22,  #67 wz
 if_z jmp #\C_s9n81j_696de099_need_value_L000304_310 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_s9n81j_696de099_need_value_L000304_305 ' JUMPV addrg
C_s9n81j_696de099_need_value_L000304_310
' C_s9n81j_696de099_need_value_L000304_307 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n87_696de099_getjump_L000075
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s9n81j_696de099_need_value_L000304_309
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_s9n81j_696de099_need_value_L000304_306 ' NEI4
 mov r0, #0 ' reg <- coni
C_s9n81j_696de099_need_value_L000304_305
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n81k_696de099_exp2reg_L000312 ' <symbol:exp2reg>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81e_696de099_discharge2reg_L000278
 add SP, #8 ' CALL addrg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #16 wz
 if_nz jmp #\C_s9n81k_696de099_exp2reg_L000312_314 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r21
 adds r3, #8 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
C_s9n81k_696de099_exp2reg_L000312_314
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_s9n81k_696de099_exp2reg_L000312_316 ' EQI4
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81j_696de099_need_value_L000304
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9n81k_696de099_exp2reg_L000312_320 ' NEI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81j_696de099_need_value_L000304
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n81k_696de099_exp2reg_L000312_318 ' EQI4
C_s9n81k_696de099_exp2reg_L000312_320
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #16 wz
 if_nz jmp #\C_s9n81k_696de099_exp2reg_L000312_322 ' NEI4
 mov r17, ##-1 ' reg <- con
 jmp #\@C_s9n81k_696de099_exp2reg_L000312_323 ' JUMPV addrg
C_s9n81k_696de099_exp2reg_L000312_322
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s9n81k_696de099_exp2reg_L000312_323
 mov RI, FP
 sub RI, #-(-20)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81i_696de099_code_loadbool_L000302
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #7 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81i_696de099_code_loadbool_L000302
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
C_s9n81k_696de099_exp2reg_L000312_318
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaK__getlabel ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n8e_696de099_patchlistaux_L000119
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n8e_696de099_patchlistaux_L000119
 add SP, #16 ' CALL addrg
C_s9n81k_696de099_exp2reg_L000312_316
 mov r22, ##-1 ' reg <- con
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
' C_s9n81k_696de099_exp2reg_L000312_313 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Export luaK_exp2nextreg

 alignl ' align long
C_luaK__exp2nextreg ' <symbol:luaK_exp2nextreg>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81k_696de099_exp2reg_L000312
 add SP, #8 ' CALL addrg
' C_luaK__exp2nextreg_324 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_exp2anyreg

 alignl ' align long
C_luaK__exp2anyreg ' <symbol:luaK_exp2anyreg>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_luaK__exp2anyreg_326 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_luaK__exp2anyreg_328 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaK__exp2anyreg_325 ' JUMPV addrg
C_luaK__exp2anyreg_328
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r0 wcz
 if_b jmp #\C_luaK__exp2anyreg_330 ' LTI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81k_696de099_exp2reg_L000312
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaK__exp2anyreg_325 ' JUMPV addrg
C_luaK__exp2anyreg_330
C_luaK__exp2anyreg_326
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_luaK__exp2anyreg_325
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_exp2anyregup

 alignl ' align long
C_luaK__exp2anyregup ' <symbol:luaK_exp2anyregup>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_luaK__exp2anyregup_335 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_luaK__exp2anyregup_333 ' EQI4
C_luaK__exp2anyregup_335
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__exp2anyregup_333
' C_luaK__exp2anyregup_332 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_exp2val

 alignl ' align long
C_luaK__exp2val ' <symbol:luaK_exp2val>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #16 wz
 if_z jmp #\C_luaK__exp2val_339 ' EQI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_luaK__exp2val_337 ' EQI4
C_luaK__exp2val_339
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__exp2val_338 ' JUMPV addrg
C_luaK__exp2val_337
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
C_luaK__exp2val_338
' C_luaK__exp2val_336 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n81l_696de099_luaK__exp2K__L000340 ' <symbol:luaK_exp2K>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_s9n81l_696de099_luaK__exp2K__L000340_342 ' NEI4
 rdlong r19, r21 ' reg <- INDIRI4 reg
 cmps r19,  #1 wcz
 if_b jmp #\C_s9n81l_696de099_luaK__exp2K__L000340_344 ' LTI4
 cmps r19,  #7 wcz
 if_a jmp #\C_s9n81l_696de099_luaK__exp2K__L000340_344 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9n81l_696de099_luaK__exp2K__L000340_354_L000356-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9n81l_696de099_luaK__exp2K__L000340_354_L000356 ' <symbol:354>
 long @C_s9n81l_696de099_luaK__exp2K__L000340_349
 long @C_s9n81l_696de099_luaK__exp2K__L000340_347
 long @C_s9n81l_696de099_luaK__exp2K__L000340_348
 long @C_s9n81l_696de099_luaK__exp2K__L000340_353
 long @C_s9n81l_696de099_luaK__exp2K__L000340_351
 long @C_s9n81l_696de099_luaK__exp2K__L000340_350
 long @C_s9n81l_696de099_luaK__exp2K__L000340_352

' Catalina Code

DAT ' code segment
C_s9n81l_696de099_luaK__exp2K__L000340_347
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n813_696de099_boolT__L000214 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_345 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_348
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n812_696de099_boolF__L000211 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_345 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_349
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n814_696de099_nilK__L000217 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_345 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_350
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8v_696de099_luaK__intK__L000200
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_345 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_351
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n810_696de099_luaK__numberK__L000202
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_345 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_352
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8u_696de099_stringK__L000198
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_345 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_353
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_345 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_344
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_341 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_345
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #255 wcz
 if_a jmp #\C_s9n81l_696de099_luaK__exp2K__L000340_358 ' GTI4
 mov r22, #4 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s9n81l_696de099_luaK__exp2K__L000340_341 ' JUMPV addrg
C_s9n81l_696de099_luaK__exp2K__L000340_358
C_s9n81l_696de099_luaK__exp2K__L000340_342
 mov r0, #0 ' reg <- coni
C_s9n81l_696de099_luaK__exp2K__L000340_341
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n81o_696de099_exp2R_K__L000360 ' <symbol:exp2RK>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81l_696de099_luaK__exp2K__L000340
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n81o_696de099_exp2R_K__L000360_362 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_s9n81o_696de099_exp2R_K__L000360_361 ' JUMPV addrg
C_s9n81o_696de099_exp2R_K__L000360_362
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_s9n81o_696de099_exp2R_K__L000360_361
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n81p_696de099_codeA_B_R_K__L000364 ' <symbol:codeABRK>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81o_696de099_exp2R_K__L000360
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
' C_s9n81p_696de099_codeA_B_R_K__L000364_365 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_storevar

 alignl ' align long
C_luaK__storevar ' <symbol:luaK_storevar>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r17, r21 ' reg <- INDIRI4 reg
 cmps r17,  #9 wcz
 if_b jmp #\C_luaK__storevar_367 ' LTI4
 cmps r17,  #15 wcz
 if_a jmp #\C_luaK__storevar_367 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__storevar_376_L000378-36 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__storevar_376_L000378 ' <symbol:376>
 long @C_luaK__storevar_370
 long @C_luaK__storevar_371
 long @C_luaK__storevar_367
 long @C_luaK__storevar_375
 long @C_luaK__storevar_372
 long @C_luaK__storevar_373
 long @C_luaK__storevar_374

' Catalina Code

DAT ' code segment
C_luaK__storevar_370
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81k_696de099_exp2reg_L000312
 add SP, #8 ' CALL addrg
 jmp #\@C_luaK__storevar_366 ' JUMPV addrg
C_luaK__storevar_371
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #10
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #\@C_luaK__storevar_368 ' JUMPV addrg
C_luaK__storevar_372
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r5, #15 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n81p_696de099_codeA_B_R_K__L000364
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__storevar_368 ' JUMPV addrg
C_luaK__storevar_373
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r5, #17 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n81p_696de099_codeA_B_R_K__L000364
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__storevar_368 ' JUMPV addrg
C_luaK__storevar_374
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r5, #18 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n81p_696de099_codeA_B_R_K__L000364
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__storevar_368 ' JUMPV addrg
C_luaK__storevar_375
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdword r22, r22 ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r4, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r5, #16 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n81p_696de099_codeA_B_R_K__L000364
 add SP, #16 ' CALL addrg
C_luaK__storevar_367
C_luaK__storevar_368
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
C_luaK__storevar_366
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_self

 alignl ' align long
C_luaK__self ' <symbol:luaK_self>
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
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov r5, #20 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n81p_696de099_codeA_B_R_K__L000364
 add SP, #16 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
' C_luaK__self_380 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n81s_696de099_negatecondition_L000381 ' <symbol:negatecondition>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8b_696de099_getjumpcontrol_L000103
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 rdlong r22, r19 ' reg <- INDIRU4 reg
 mov r20, #15 ' reg <- coni
 mov r18, ##$ffff7fff ' reg <- con
 and r18, r22 ' BANDI/U (2)
 shr r22, r20 ' RSHU (1)
 and r22, #1 ' BANDU4 coni
 xor r22, #1 ' BXORI4 coni
 shl r22, #15 ' LSHU4 coni
 mov r20, ##$8000 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 or r22, r18 ' BORI/U (2)
 wrlong r22, r19 ' ASGNU4 reg reg
' C_s9n81s_696de099_negatecondition_L000381_382 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n81t_696de099_jumponcond_L000383 ' <symbol:jumponcond>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #17 wz
 if_nz jmp #\C_s9n81t_696de099_jumponcond_L000383_385 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #51 wz
 if_nz jmp #\C_s9n81t_696de099_jumponcond_L000383_387 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n8j_696de099_removelastinstruction_L000141 ' CALL addrg
 cmps r19,  #0 wz
 if_nz jmp #\C_s9n81t_696de099_jumponcond_L000383_390 ' NEI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_s9n81t_696de099_jumponcond_L000383_391 ' JUMPV addrg
C_s9n81t_696de099_jumponcond_L000383_390
 mov r17, #0 ' reg <- coni
C_s9n81t_696de099_jumponcond_L000383_391
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #66
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n8a_696de099_condjump_L000100
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s9n81t_696de099_jumponcond_L000383_384 ' JUMPV addrg
C_s9n81t_696de099_jumponcond_L000383_387
C_s9n81t_696de099_jumponcond_L000383_385
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81h_696de099_discharge2anyreg_L000298
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRI4 reg
 mov r5, #255 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #67
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n8a_696de099_condjump_L000100
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_s9n81t_696de099_jumponcond_L000383_384
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_goiftrue

 alignl ' align long
C_luaK__goiftrue ' <symbol:luaK_goiftrue>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 rdlong r19, r21 ' reg <- INDIRI4 reg
 mov r22, #2 ' reg <- coni
 cmps r19, r22 wcz
 if_b jmp #\C_luaK__goiftrue_393 ' LTI4
 cmps r19,  #7 wcz
 if_a jmp #\C_luaK__goiftrue_398 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__goiftrue_399_L000401-8 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__goiftrue_399_L000401 ' <symbol:399>
 long @C_luaK__goiftrue_397
 long @C_luaK__goiftrue_393
 long @C_luaK__goiftrue_397
 long @C_luaK__goiftrue_397
 long @C_luaK__goiftrue_397
 long @C_luaK__goiftrue_397

' Catalina Code

DAT ' code segment
C_luaK__goiftrue_398
 cmps r19,  #16 wz
 if_z jmp #\C_luaK__goiftrue_396 ' EQI4
 jmp #\@C_luaK__goiftrue_393 ' JUMPV addrg
C_luaK__goiftrue_396
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81s_696de099_negatecondition_L000381
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__goiftrue_394 ' JUMPV addrg
C_luaK__goiftrue_397
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__goiftrue_394 ' JUMPV addrg
C_luaK__goiftrue_393
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81t_696de099_jumponcond_L000383
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_luaK__goiftrue_394
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21
 adds r3, #12 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, ##-1 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
' C_luaK__goiftrue_392 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_goiffalse

 alignl ' align long
C_luaK__goiffalse ' <symbol:luaK_goiffalse>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 rdlong r19, r21 ' reg <- INDIRI4 reg
 mov r22, #1 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_luaK__goiffalse_408 ' EQI4
 cmps r19,  #3 wz
 if_z jmp #\C_luaK__goiffalse_408 ' EQI4
 cmps r19, r22 wcz
 if_b jmp #\C_luaK__goiffalse_404 ' LTI4
' C_luaK__goiffalse_409 ' (symbol refcount = 0)
 cmps r19,  #16 wz
 if_z jmp #\C_luaK__goiffalse_407 ' EQI4
 jmp #\@C_luaK__goiffalse_404 ' JUMPV addrg
C_luaK__goiffalse_407
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__goiffalse_405 ' JUMPV addrg
C_luaK__goiffalse_408
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__goiffalse_405 ' JUMPV addrg
C_luaK__goiffalse_404
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81t_696de099_jumponcond_L000383
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_luaK__goiffalse_405
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21
 adds r3, #8 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, ##-1 ' reg <- con
 wrlong r20, r22 ' ASGNI4 reg reg
' C_luaK__goiffalse_403 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n820_696de099_codenot_L000410 ' <symbol:codenot>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r19, r21 ' reg <- INDIRI4 reg
 cmps r19,  #1 wcz
 if_b jmp #\C_s9n820_696de099_codenot_L000410_412 ' LTI4
 cmps r19,  #17 wcz
 if_a jmp #\C_s9n820_696de099_codenot_L000410_412 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9n820_696de099_codenot_L000410_419_L000421-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9n820_696de099_codenot_L000410_419_L000421 ' <symbol:419>
 long @C_s9n820_696de099_codenot_L000410_415
 long @C_s9n820_696de099_codenot_L000410_416
 long @C_s9n820_696de099_codenot_L000410_415
 long @C_s9n820_696de099_codenot_L000410_416
 long @C_s9n820_696de099_codenot_L000410_416
 long @C_s9n820_696de099_codenot_L000410_416
 long @C_s9n820_696de099_codenot_L000410_416
 long @C_s9n820_696de099_codenot_L000410_418
 long @C_s9n820_696de099_codenot_L000410_412
 long @C_s9n820_696de099_codenot_L000410_412
 long @C_s9n820_696de099_codenot_L000410_412
 long @C_s9n820_696de099_codenot_L000410_412
 long @C_s9n820_696de099_codenot_L000410_412
 long @C_s9n820_696de099_codenot_L000410_412
 long @C_s9n820_696de099_codenot_L000410_412
 long @C_s9n820_696de099_codenot_L000410_417
 long @C_s9n820_696de099_codenot_L000410_418

' Catalina Code

DAT ' code segment
C_s9n820_696de099_codenot_L000410_415
 mov r22, #2 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_s9n820_696de099_codenot_L000410_413 ' JUMPV addrg
C_s9n820_696de099_codenot_L000410_416
 mov r22, #3 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_s9n820_696de099_codenot_L000410_413 ' JUMPV addrg
C_s9n820_696de099_codenot_L000410_417
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81s_696de099_negatecondition_L000381
 add SP, #4 ' CALL addrg
 jmp #\@C_s9n820_696de099_codenot_L000410_413 ' JUMPV addrg
C_s9n820_696de099_codenot_L000410_418
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81h_696de099_discharge2anyreg_L000298
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r4, r20 ' reg <- INDIRI4 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #51
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_s9n820_696de099_codenot_L000410_412
C_s9n820_696de099_codenot_L000410_413
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8d_696de099_removevalues_L000113
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8d_696de099_removevalues_L000113
 add SP, #4 ' CALL addrg
' C_s9n820_696de099_codenot_L000410_411 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n823_696de099_isK_str_L000423 ' <symbol:isKstr>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, #4 ' reg <- coni
 rdlong r20, r2 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_nz jmp #\C_s9n823_696de099_isK_str_L000423_426 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_s9n823_696de099_isK_str_L000423_426 ' NEI4
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #255 wcz
 if_a jmp #\C_s9n823_696de099_isK_str_L000423_426 ' GTI4
 shl r22, #3 ' LSHI4 coni
 rdlong r20, r3 ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #68 wz
 if_nz jmp #\C_s9n823_696de099_isK_str_L000423_426 ' NEI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_s9n823_696de099_isK_str_L000423_427 ' JUMPV addrg
C_s9n823_696de099_isK_str_L000423_426
 mov r23, #0 ' reg <- coni
C_s9n823_696de099_isK_str_L000423_427
 mov r0, r23 ' CVI, CVU or LOAD
' C_s9n823_696de099_isK_str_L000423_424 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s9n824_696de099_isK_int_L000428 ' <symbol:isKint>
 calld PA,#PSHM
 long $d00000 ' save registers
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 if_nz jmp #\C_s9n824_696de099_isK_int_L000428_431 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_s9n824_696de099_isK_int_L000428_431 ' NEI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_s9n824_696de099_isK_int_L000428_432 ' JUMPV addrg
C_s9n824_696de099_isK_int_L000428_431
 mov r23, #0 ' reg <- coni
C_s9n824_696de099_isK_int_L000428_432
 mov r0, r23 ' CVI, CVU or LOAD
' C_s9n824_696de099_isK_int_L000428_429 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s9n825_696de099_isC_int_L000433 ' <symbol:isCint>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n824_696de099_isK_int_L000428 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n825_696de099_isC_int_L000433_436 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmp r22,  #255 wcz 
 if_a jmp #\C_s9n825_696de099_isC_int_L000433_436 ' GTU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_s9n825_696de099_isC_int_L000433_437 ' JUMPV addrg
C_s9n825_696de099_isC_int_L000433_436
 mov r21, #0 ' reg <- coni
C_s9n825_696de099_isC_int_L000433_437
 mov r0, r21 ' CVI, CVU or LOAD
' C_s9n825_696de099_isC_int_L000433_434 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n826_696de099_isS_C_int_L000438 ' <symbol:isSCint>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n824_696de099_isK_int_L000428 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n826_696de099_isS_C_int_L000438_441 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n815_696de099_fitsC__L000220 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9n826_696de099_isS_C_int_L000438_441 ' EQI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_s9n826_696de099_isS_C_int_L000438_442 ' JUMPV addrg
C_s9n826_696de099_isS_C_int_L000438_441
 mov r21, #0 ' reg <- coni
C_s9n826_696de099_isS_C_int_L000438_442
 mov r0, r21 ' CVI, CVU or LOAD
' C_s9n826_696de099_isS_C_int_L000438_439 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n827_696de099_isS_C_number_L000443 ' <symbol:isSCnumber>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 if_nz jmp #\C_s9n827_696de099_isS_C_number_L000443_445 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n827_696de099_isS_C_number_L000443_446 ' JUMPV addrg
C_s9n827_696de099_isS_C_number_L000443_445
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #5 wz
 if_nz jmp #\C_s9n827_696de099_isS_C_number_L000443_447 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRF4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n827_696de099_isS_C_number_L000443_447 ' EQI4
 mov r22, #1 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #\@C_s9n827_696de099_isS_C_number_L000443_448 ' JUMPV addrg
C_s9n827_696de099_isS_C_number_L000443_447
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9n827_696de099_isS_C_number_L000443_444 ' JUMPV addrg
C_s9n827_696de099_isS_C_number_L000443_448
C_s9n827_696de099_isS_C_number_L000443_446
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_s9n827_696de099_isS_C_number_L000443_449 ' NEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n815_696de099_fitsC__L000220 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n827_696de099_isS_C_number_L000443_449 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #127 ' ADDI4 coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_s9n827_696de099_isS_C_number_L000443_444 ' JUMPV addrg
C_s9n827_696de099_isS_C_number_L000443_449
 mov r0, #0 ' reg <- coni
C_s9n827_696de099_isS_C_number_L000443_444
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_indexed

 alignl ' align long
C_luaK__indexed ' <symbol:luaK_indexed>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #7 wz
 if_nz jmp #\C_luaK__indexed_452 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81b_696de099_str2K__L000255
 add SP, #4 ' CALL addrg
C_luaK__indexed_452
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_luaK__indexed_454 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n823_696de099_isK_str_L000423
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaK__indexed_454 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__indexed_454
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_luaK__indexed_456 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrword r20, r22 ' ASGNI2 reg reg
 mov r22, #13 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__indexed_457 ' JUMPV addrg
C_luaK__indexed_456
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 if_nz jmp #\C_luaK__indexed_459 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r17, r22 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_luaK__indexed_460 ' JUMPV addrg
C_luaK__indexed_459
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
C_luaK__indexed_460
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n823_696de099_isK_str_L000423
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__indexed_461 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrword r20, r22 ' ASGNI2 reg reg
 mov r22, #15 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__indexed_462 ' JUMPV addrg
C_luaK__indexed_461
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n825_696de099_isC_int_L000433 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__indexed_463 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrword r20, r22 ' ASGNI2 reg reg
 mov r22, #14 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__indexed_464 ' JUMPV addrg
C_luaK__indexed_463
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrword r22, r20 ' ASGNI2 reg reg
 mov r22, #12 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_luaK__indexed_464
C_luaK__indexed_462
C_luaK__indexed_457
' C_luaK__indexed_451 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n828_696de099_validop_L000465 ' <symbol:validop>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r23,  #3 wcz
 if_b jmp #\C_s9n828_696de099_validop_L000465_467 ' LTI4
 cmps r23,  #13 wcz
 if_a jmp #\C_s9n828_696de099_validop_L000465_467 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s9n828_696de099_validop_L000465_482_L000484-12 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9n828_696de099_validop_L000465_482_L000484 ' <symbol:482>
 long @C_s9n828_696de099_validop_L000465_473
 long @C_s9n828_696de099_validop_L000465_467
 long @C_s9n828_696de099_validop_L000465_473
 long @C_s9n828_696de099_validop_L000465_473
 long @C_s9n828_696de099_validop_L000465_469
 long @C_s9n828_696de099_validop_L000465_469
 long @C_s9n828_696de099_validop_L000465_469
 long @C_s9n828_696de099_validop_L000465_469
 long @C_s9n828_696de099_validop_L000465_469
 long @C_s9n828_696de099_validop_L000465_467
 long @C_s9n828_696de099_validop_L000465_469

' Catalina Code

DAT ' code segment
C_s9n828_696de099_validop_L000465_469
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 if_z jmp #\C_s9n828_696de099_validop_L000465_471 ' EQI4
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9n828_696de099_validop_L000465_471 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_s9n828_696de099_validop_L000465_472 ' JUMPV addrg
C_s9n828_696de099_validop_L000465_471
 mov r17, #0 ' reg <- coni
C_s9n828_696de099_validop_L000465_472
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_s9n828_696de099_validop_L000465_466 ' JUMPV addrg
C_s9n828_696de099_validop_L000465_473
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_s9n828_696de099_validop_L000465_478 ' NEI4
 rdlong r0, r19 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_s9n828_696de099_validop_L000465_479 ' JUMPV addrg
C_s9n828_696de099_validop_L000465_478
 rdlong r15, r19 ' reg <- INDIRF4 reg
C_s9n828_696de099_validop_L000465_479
 mov r22, ##@C_s9n828_696de099_validop_L000465_480_L000481
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_s9n828_696de099_validop_L000465_476 ' EQF4
 mov r17, #1 ' reg <- coni
 jmp #\@C_s9n828_696de099_validop_L000465_477 ' JUMPV addrg
C_s9n828_696de099_validop_L000465_476
 mov r17, #0 ' reg <- coni
C_s9n828_696de099_validop_L000465_477
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_s9n828_696de099_validop_L000465_466 ' JUMPV addrg
C_s9n828_696de099_validop_L000465_467
 mov r0, #1 ' reg <- coni
C_s9n828_696de099_validop_L000465_466
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82c_696de099_constfolding_L000486 ' <symbol:constfolding>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81_696de099_tonumeral_L000027
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9n82c_696de099_constfolding_L000486_491 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81_696de099_tonumeral_L000027
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9n82c_696de099_constfolding_L000486_491 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n828_696de099_validop_L000465
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9n82c_696de099_constfolding_L000486_488 ' NEI4
C_s9n82c_696de099_constfolding_L000486_491
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9n82c_696de099_constfolding_L000486_487 ' JUMPV addrg
C_s9n82c_696de099_constfolding_L000486_488
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaO__rawarith
 add SP, #16 ' CALL addrg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_s9n82c_696de099_constfolding_L000486_492 ' NEI4
 mov r22, #6 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_s9n82c_696de099_constfolding_L000486_493 ' JUMPV addrg
C_s9n82c_696de099_constfolding_L000486_492
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRF4 reg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_s9n82c_696de099_constfolding_L000486_497 ' NEF4
 mov r22, ##@C_s9n828_696de099_validop_L000465_480_L000481
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_s9n82c_696de099_constfolding_L000486_495 ' NEF4
C_s9n82c_696de099_constfolding_L000486_497
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9n82c_696de099_constfolding_L000486_487 ' JUMPV addrg
C_s9n82c_696de099_constfolding_L000486_495
 mov r22, #5 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 wrlong r15, r22 ' ASGNF4 reg reg
C_s9n82c_696de099_constfolding_L000486_493
 mov r0, #1 ' reg <- coni
C_s9n82c_696de099_constfolding_L000486_487
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82d_696de099_binopr2op_L000498 ' <symbol:binopr2op>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r4 ' SUBI/P
 subs r22, r3 ' SUBI/P (3)
 mov r0, r22 ' ADDI/P
 adds r0, r2 ' ADDI/P (3)
' C_s9n82d_696de099_binopr2op_L000498_499 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s9n82e_696de099_unopr2op_L000500 ' <symbol:unopr2op>
 mov r0, r2
 adds r0, #49 ' ADDI4 coni
' C_s9n82e_696de099_unopr2op_L000500_501 ' (symbol refcount = 0)
 calld PA,#RETN


 alignl ' align long
C_s9n82f_696de099_binopr2T_M__L000502 ' <symbol:binopr2TM>
 mov r0, r2
 adds r0, #6 ' ADDI4 coni
' C_s9n82f_696de099_binopr2T_M__L000502_503 ' (symbol refcount = 0)
 calld PA,#RETN


 alignl ' align long
C_s9n82g_696de099_codeunexpval_L000504 ' <symbol:codeunexpval>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
' C_s9n82g_696de099_codeunexpval_L000504_505 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82h_696de099_finishbinexpval_L000506 ' <symbol:finishbinexpval>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #24
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 20 ' stack ARG INDIR ADDRFi
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 add RI, #16
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #12
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8r_696de099_freeexps_L000175
 add SP, #8 ' CALL addrg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #17 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #24
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, r15 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r19
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
' C_s9n82h_696de099_finishbinexpval_L000506_507 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82i_696de099_codebinexpval_L000508 ' <symbol:codebinexpval>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, #34 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82d_696de099_binopr2op_L000498
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n82f_696de099_binopr2T_M__L000502 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #46 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, #0 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -12 ' stack ARG INDIR ADDRLi
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r19
 wrlong RI, --PTRA ' stack ARG
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82h_696de099_finishbinexpval_L000506
 add SP, #32 ' CALL addrg
' C_s9n82i_696de099_codebinexpval_L000508_509 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82j_696de099_codebini_L000510 ' <symbol:codebini>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #127 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #47 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 calld PA,#PSHF
 long 12 ' stack ARG INDIR ADDRFi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 16 ' stack ARG INDIR ADDRFi
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82h_696de099_finishbinexpval_L000506
 add SP, #32 ' CALL addrg
' C_s9n82j_696de099_codebini_L000510_511 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82k_696de099_codebinK__L000512 ' <symbol:codebinK>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n82f_696de099_binopr2T_M__L000502 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, #22 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82d_696de099_binopr2op_L000498
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #48 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -12 ' stack ARG INDIR ADDRLi
 calld PA,#PSHF
 long -16 ' stack ARG INDIR ADDRLi
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82h_696de099_finishbinexpval_L000506
 add SP, #32 ' CALL addrg
' C_s9n82k_696de099_codebinK__L000512_513 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82l_696de099_finishbinexpneg_L000514 ' <symbol:finishbinexpneg>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ff0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n824_696de099_isK_int_L000428 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9n82l_696de099_finishbinexpneg_L000514_516 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9n82l_696de099_finishbinexpneg_L000514_515 ' JUMPV addrg
C_s9n82l_696de099_finishbinexpneg_L000514_516
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n815_696de099_fitsC__L000220 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82l_696de099_finishbinexpneg_L000514_520 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r2, r22 ' NEGI4
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n815_696de099_fitsC__L000220 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_s9n82l_696de099_finishbinexpneg_L000514_518 ' NEI4
C_s9n82l_696de099_finishbinexpneg_L000514_520
 mov r0, #0 ' reg <- coni
 jmp #\@C_s9n82l_696de099_finishbinexpneg_L000514_515 ' JUMPV addrg
C_s9n82l_696de099_finishbinexpneg_L000514_518
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #47 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r22, r22 ' NEGI4
 adds r22, #127 ' ADDI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 12 ' stack ARG INDIR ADDRFi
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82h_696de099_finishbinexpval_L000506
 add SP, #32 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 subs r20, #4 ' SUBI4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, ##$ff00ffff ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r18, #127 ' ADDI4 coni
 shl r18, #16 ' LSHU4 coni
 mov r16, ##$ff0000 ' reg <- con
 and r18, r16 ' BANDI/U (1)
 or r20, r18 ' BORI/U (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r0, #1 ' reg <- coni
C_s9n82l_696de099_finishbinexpneg_L000514_515
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82m_696de099_swapexps_L000521 ' <symbol:swapexps>
 calld PA,#NEWF
 sub SP, #16
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r3 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 16 ' ASGNB
 mov r0, r3 ' CVI, CVU or LOAD
 mov r1, r2 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 16 ' ASGNB
 mov r0, r2 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 calld PA,#CPYB
 long 16 ' ASGNB
' C_s9n82m_696de099_swapexps_L000521_522 ' (symbol refcount = 0)
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82n_696de099_codebinN_oK__L000523 ' <symbol:codebinNoK>
 calld PA,#NEWF
 calld PA,#PSHM
 long $aa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 if_z jmp #\C_s9n82n_696de099_codebinN_oK__L000523_525 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82m_696de099_swapexps_L000521
 add SP, #4 ' CALL addrg
C_s9n82n_696de099_codebinN_oK__L000523_525
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #12
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82i_696de099_codebinexpval_L000508
 add SP, #16 ' CALL addrg
' C_s9n82n_696de099_codebinN_oK__L000523_524 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n82o_696de099_codearith_L000527 ' <symbol:codearith>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81_696de099_tonumeral_L000027
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_s9n82o_696de099_codearith_L000527_529 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81l_696de099_luaK__exp2K__L000340
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82o_696de099_codearith_L000527_529 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 12 ' stack ARG INDIR ADDRFi
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82k_696de099_codebinK__L000512
 add SP, #20 ' CALL addrg
 jmp #\@C_s9n82o_696de099_codearith_L000527_530 ' JUMPV addrg
C_s9n82o_696de099_codearith_L000527_529
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 12 ' stack ARG INDIR ADDRFi
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82n_696de099_codebinN_oK__L000523
 add SP, #20 ' CALL addrg
C_s9n82o_696de099_codearith_L000527_530
' C_s9n82o_696de099_codearith_L000527_528 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s9n82p_696de099_codecommutative_L000531 ' <symbol:codecommutative>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81_696de099_tonumeral_L000027
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82p_696de099_codecommutative_L000531_533 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82m_696de099_swapexps_L000521
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s9n82p_696de099_codecommutative_L000531_533
 cmps r23,  #0 wz
 if_nz jmp #\C_s9n82p_696de099_codecommutative_L000531_535 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n826_696de099_isS_C_int_L000438 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82p_696de099_codecommutative_L000531_535 ' EQI4
 mov r2, #6 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, #21
 wrlong RI, --PTRA ' stack ARG coni
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82j_696de099_codebini_L000510
 add SP, #24 ' CALL addrg
 jmp #\@C_s9n82p_696de099_codecommutative_L000531_536 ' JUMPV addrg
C_s9n82p_696de099_codecommutative_L000531_535
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82o_696de099_codearith_L000527
 add SP, #20 ' CALL addrg
C_s9n82p_696de099_codecommutative_L000531_536
' C_s9n82p_696de099_codecommutative_L000531_532 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82q_696de099_codebitwise_L000537 ' <symbol:codebitwise>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 if_nz jmp #\C_s9n82q_696de099_codebitwise_L000537_539 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82m_696de099_swapexps_L000521
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s9n82q_696de099_codebitwise_L000537_539
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 if_nz jmp #\C_s9n82q_696de099_codebitwise_L000537_541 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81l_696de099_luaK__exp2K__L000340
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82q_696de099_codebitwise_L000537_541 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82k_696de099_codebinK__L000512
 add SP, #20 ' CALL addrg
 jmp #\@C_s9n82q_696de099_codebitwise_L000537_542 ' JUMPV addrg
C_s9n82q_696de099_codebitwise_L000537_541
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82n_696de099_codebinN_oK__L000523
 add SP, #20 ' CALL addrg
C_s9n82q_696de099_codebitwise_L000537_542
' C_s9n82q_696de099_codebitwise_L000537_538 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82r_696de099_codeorder_L000543 ' <symbol:codeorder>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n827_696de099_isS_C_number_L000443
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82r_696de099_codeorder_L000543_545 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, #62 ' reg ARG coni
 mov r3, #14 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82d_696de099_binopr2op_L000498
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n82r_696de099_codeorder_L000543_546 ' JUMPV addrg
C_s9n82r_696de099_codeorder_L000543_545
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n827_696de099_isS_C_number_L000443
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82r_696de099_codeorder_L000543_547 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, #64 ' reg ARG coni
 mov r3, #14 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82d_696de099_binopr2op_L000498
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n82r_696de099_codeorder_L000543_548 ' JUMPV addrg
C_s9n82r_696de099_codeorder_L000543_547
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #58 ' reg ARG coni
 mov r3, #14 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82d_696de099_binopr2op_L000498
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNI4 addrli reg
C_s9n82r_696de099_codeorder_L000543_548
C_s9n82r_696de099_codeorder_L000543_546
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8r_696de099_freeexps_L000175
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -24 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n8a_696de099_condjump_L000100
 add SP, #20 ' CALL addrg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #16 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
' C_s9n82r_696de099_codeorder_L000543_544 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n82s_696de099_codeeq_L000549 ' <symbol:codeeq>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_z jmp #\C_s9n82s_696de099_codeeq_L000549_551 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82m_696de099_swapexps_L000521
 add SP, #4 ' CALL addrg
C_s9n82s_696de099_codeeq_L000549_551
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n827_696de099_isS_C_number_L000443
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82s_696de099_codeeq_L000549_553 ' EQI4
 mov r22, #61 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n82s_696de099_codeeq_L000549_554 ' JUMPV addrg
C_s9n82s_696de099_codeeq_L000549_553
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81o_696de099_exp2R_K__L000360
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s9n82s_696de099_codeeq_L000549_555 ' EQI4
 mov r22, #60 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_s9n82s_696de099_codeeq_L000549_556 ' JUMPV addrg
C_s9n82s_696de099_codeeq_L000549_555
 mov r22, #57 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
C_s9n82s_696de099_codeeq_L000549_556
C_s9n82s_696de099_codeeq_L000549_554
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8r_696de099_freeexps_L000175
 add SP, #8 ' CALL addrg
 cmps r21,  #13 wz
 if_nz jmp #\C_s9n82s_696de099_codeeq_L000549_558 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_s9n82s_696de099_codeeq_L000549_559 ' JUMPV addrg
C_s9n82s_696de099_codeeq_L000549_558
 mov r15, #0 ' reg <- coni
C_s9n82s_696de099_codeeq_L000549_559
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -20 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n8a_696de099_condjump_L000100
 add SP, #20 ' CALL addrg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #16 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
' C_s9n82s_696de099_codeeq_L000549_550 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__prefix_ef_L000562 ' <symbol:ef>
 long 6
 long 0
 long -1
 long -1

' Catalina Export luaK_prefix

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaK__prefix ' <symbol:luaK_prefix>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov r15, r21 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_luaK__prefix_563 ' LTI4
 cmps r15,  #3 wcz
 if_a jmp #\C_luaK__prefix_563 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__prefix_571_L000573 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__prefix_571_L000573 ' <symbol:571>
 long @C_luaK__prefix_566
 long @C_luaK__prefix_566
 long @C_luaK__prefix_570
 long @C_luaK__prefix_569

' Catalina Code

DAT ' code segment
C_luaK__prefix_566
 mov r2, ##@C_luaK__prefix_ef_L000562 ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #12 ' ADDI4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82c_696de099_constfolding_L000486
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__prefix_567 ' EQI4
 jmp #\@C_luaK__prefix_564 ' JUMPV addrg
C_luaK__prefix_567
C_luaK__prefix_569
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n82e_696de099_unopr2op_L000500 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82g_696de099_codeunexpval_L000504
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__prefix_564 ' JUMPV addrg
C_luaK__prefix_570
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n820_696de099_codenot_L000410
 add SP, #4 ' CALL addrg
C_luaK__prefix_563
C_luaK__prefix_564
' C_luaK__prefix_560 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_infix

 alignl ' align long
C_luaK__infix ' <symbol:luaK_infix>
 calld PA,#NEWF
 sub SP, #8
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
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov r17, r21 ' CVI, CVU or LOAD
 cmps r17,  #0 wcz
 if_b jmp #\C_luaK__infix_575 ' LTI4
 cmps r17,  #20 wcz
 if_a jmp #\C_luaK__infix_575 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__infix_590_L000592 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__infix_590_L000592 ' <symbol:590>
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_581
 long @C_luaK__infix_580
 long @C_luaK__infix_584
 long @C_luaK__infix_587
 long @C_luaK__infix_587
 long @C_luaK__infix_584
 long @C_luaK__infix_587
 long @C_luaK__infix_587
 long @C_luaK__infix_578
 long @C_luaK__infix_579

' Catalina Code

DAT ' code segment
C_luaK__infix_578
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__goiftrue
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_576 ' JUMPV addrg
C_luaK__infix_579
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__goiffalse
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_576 ' JUMPV addrg
C_luaK__infix_580
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_576 ' JUMPV addrg
C_luaK__infix_581
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81_696de099_tonumeral_L000027
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaK__infix_576 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_576 ' JUMPV addrg
C_luaK__infix_584
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81_696de099_tonumeral_L000027
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaK__infix_576 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n81o_696de099_exp2R_K__L000360
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_576 ' JUMPV addrg
C_luaK__infix_587
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n827_696de099_isS_C_number_L000443
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaK__infix_576 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__infix_575
C_luaK__infix_576
' C_luaK__infix_574 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n832_696de099_codeconcat_L000593 ' <symbol:codeconcat>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n85_696de099_previousinstruction_L000058 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r15 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #53 wz
 if_nz jmp #\C_s9n832_696de099_codeconcat_L000593_595 ' NEI4
 rdlong r22, r15 ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
 rdlong r22, r15 ' reg <- INDIRU4 reg
 mov r20, ##$ffff807f ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #7 ' LSHU4 coni
 mov r18, ##32640 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r15 ' ASGNU4 reg reg
 rdlong r22, r15 ' reg <- INDIRU4 reg
 mov r20, ##$ff00ffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 shl r20, #16 ' LSHU4 coni
 mov r18, ##$ff0000 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r15 ' ASGNU4 reg reg
 jmp #\@C_s9n832_696de099_codeconcat_L000593_596 ' JUMPV addrg
C_s9n832_696de099_codeconcat_L000593_595
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #53
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8q_696de099_freeexp_L000171
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
C_s9n832_696de099_codeconcat_L000593_596
' C_s9n832_696de099_codeconcat_L000593_594 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_posfix

 alignl ' align long
C_luaK__posfix ' <symbol:luaK_posfix>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
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
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 cmps r23,  #11 wcz
 if_a jmp #\C_luaK__posfix_598 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82c_696de099_constfolding_L000486
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_598 ' EQI4
 jmp #\@C_luaK__posfix_597 ' JUMPV addrg
C_luaK__posfix_598
 mov r15, r23 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_luaK__posfix_600 ' LTI4
 cmps r15,  #20 wcz
 if_a jmp #\C_luaK__posfix_600 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__posfix_623_L000625 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__posfix_623_L000625 ' <symbol:623>
 long @C_luaK__posfix_606
 long @C_luaK__posfix_607
 long @C_luaK__posfix_606
 long @C_luaK__posfix_610
 long @C_luaK__posfix_610
 long @C_luaK__posfix_610
 long @C_luaK__posfix_610
 long @C_luaK__posfix_611
 long @C_luaK__posfix_611
 long @C_luaK__posfix_611
 long @C_luaK__posfix_612
 long @C_luaK__posfix_617
 long @C_luaK__posfix_605
 long @C_luaK__posfix_620
 long @C_luaK__posfix_622
 long @C_luaK__posfix_622
 long @C_luaK__posfix_620
 long @C_luaK__posfix_621
 long @C_luaK__posfix_621
 long @C_luaK__posfix_603
 long @C_luaK__posfix_604

' Catalina Code

DAT ' code segment
C_luaK__posfix_603
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r19
 adds r3, #12 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, r19 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 16 ' ASGNB
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_604
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r19
 adds r3, #8 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, r19 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 16 ' ASGNB
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_605
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n832_696de099_codeconcat_L000593
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_606
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82p_696de099_codecommutative_L000531
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_607
 mov r2, #7 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #21 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82l_696de099_finishbinexpneg_L000514
 add SP, #20 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_608 ' EQI4
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_608
C_luaK__posfix_610
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82o_696de099_codearith_L000527
 add SP, #20 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_611
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82q_696de099_codebitwise_L000537
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_612
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n826_696de099_isS_C_int_L000438 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_613 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82m_696de099_swapexps_L000521
 add SP, #4 ' CALL addrg
 mov r2, #16 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, #33
 wrlong RI, --PTRA ' stack ARG coni
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82j_696de099_codebini_L000510
 add SP, #24 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_613
 mov r2, #16 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #32 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82l_696de099_finishbinexpneg_L000514
 add SP, #20 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_615 ' EQI4
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_615
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82i_696de099_codebinexpval_L000508
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_617
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n826_696de099_isS_C_int_L000438 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_618 ' EQI4
 mov r2, #17 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #0 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, #32
 wrlong RI, --PTRA ' stack ARG coni
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82j_696de099_codebini_L000510
 add SP, #24 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_618
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s9n82i_696de099_codebinexpval_L000508
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_620
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82s_696de099_codeeq_L000549
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__posfix_601 ' JUMPV addrg
C_luaK__posfix_621
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82m_696de099_swapexps_L000521
 add SP, #4 ' CALL addrg
 mov r22, r23
 subs r22, #17 ' SUBI4 coni
 mov r23, r22
 adds r23, #14 ' ADDI4 coni
C_luaK__posfix_622
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n82r_696de099_codeorder_L000543
 add SP, #12 ' CALL addrg
C_luaK__posfix_600
C_luaK__posfix_601
C_luaK__posfix_597
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_fixline

 alignl ' align long
C_luaK__fixline ' <symbol:luaK_fixline>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s9n8i_696de099_removelastlineinfo_L000137 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8f_696de099_savelineinfo_L000128
 add SP, #8 ' CALL addrg
' C_luaK__fixline_626 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_settablesize

 alignl ' align long
C_luaK__settablesize ' <symbol:luaK_settablesize>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 cmps r17,  #0 wz
 if_z jmp #\C_luaK__settablesize_629 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDI4 coni
 jmp #\@C_luaK__settablesize_630 ' JUMPV addrg
C_luaK__settablesize_629
 mov r11, #0 ' reg <- coni
C_luaK__settablesize_630
 mov RI, FP
 sub RI, #-(-8)
 wrlong r11, RI ' ASGNI4 addrli reg
 mov r22, #256 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, #256 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-12)
 wrlong r1, RI ' ASGNI4 addrli reg
 cmps r13,  #0 wcz
 if_be jmp #\C_luaK__settablesize_632 ' LEI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_luaK__settablesize_633 ' JUMPV addrg
C_luaK__settablesize_632
 mov r9, #0 ' reg <- coni
C_luaK__settablesize_633
 mov RI, FP
 sub RI, #-(-16)
 wrlong r9, RI ' ASGNI4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 shl r22, #7 ' LSHU4 coni
 or r22, #19 ' BORU4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #16 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #24 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 shl r20, #15 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 wrlong r22, r15 ' ASGNU4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 or r20, #82 ' BORU4 coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_luaK__settablesize_627 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export luaK_setlist

 alignl ' align long
C_luaK__setlist ' <symbol:luaK_setlist>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_nz jmp #\C_luaK__setlist_635 ' NEI4
 mov r17, #0 ' reg <- coni
C_luaK__setlist_635
 cmps r19,  #255 wcz
 if_a jmp #\C_luaK__setlist_637 ' GTI4
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #78
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #\@C_luaK__setlist_638 ' JUMPV addrg
C_luaK__setlist_637
 mov r22, #256 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #256 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r19, r1 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #78
 wrlong RI, --PTRA ' stack ARG coni
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n8l_696de099_codeextraarg_L000149
 add SP, #4 ' CALL addrg
C_luaK__setlist_638
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, r21
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaK__setlist_634 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s9n835_696de099_finaltarget_L000639 ' <symbol:finaltarget>
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, #0 ' reg <- coni
C_s9n835_696de099_finaltarget_L000639_641
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 adds r22, r3 ' ADDI/P (1)
 rdlong r21, r22 ' reg <- INDIRU4 reg
 mov r22, r21
 and r22, #127 ' BANDU4 coni
 cmps r22,  #56 wz
 if_z jmp #\C_s9n835_696de099_finaltarget_L000639_645 ' EQI4
 jmp #\@C_s9n835_696de099_finaltarget_L000639_643 ' JUMPV addrg
C_s9n835_696de099_finaltarget_L000639_645
 mov r22, r21
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##16777215 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #1 ' ADDI4 coni
 adds r2, r22 ' ADDI/P (1)
' C_s9n835_696de099_finaltarget_L000639_642 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #100 wcz
 if_b jmp #\C_s9n835_696de099_finaltarget_L000639_641 ' LTI4
C_s9n835_696de099_finaltarget_L000639_643
 mov r0, r2 ' CVI, CVU or LOAD
' C_s9n835_696de099_finaltarget_L000639_640 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaK_finish

 alignl ' align long
C_luaK__finish ' <symbol:luaK_finish>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 rdlong r19, r23 ' reg <- INDIRP4 reg
 mov r21, #0 ' reg <- coni
 jmp #\@C_luaK__finish_651 ' JUMPV addrg
C_luaK__finish_648
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r19
 adds r20, #52 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 rdlong r22, r17 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, #56 ' reg <- coni
 cmps r15, r22 wz
 if_z jmp #\C_luaK__finish_663 ' EQI4
 cmps r15, r22 wcz
 if_b jmp #\C_luaK__finish_653 ' LTI4
' C_luaK__finish_664 ' (symbol refcount = 0)
 cmps r15,  #69 wcz
 if_b jmp #\C_luaK__finish_653 ' LTI4
 cmps r15,  #72 wcz
 if_a jmp #\C_luaK__finish_653 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__finish_665_L000667-276 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__finish_665_L000667 ' <symbol:665>
 long @C_luaK__finish_658
 long @C_luaK__finish_658
 long @C_luaK__finish_655
 long @C_luaK__finish_655

' Catalina Code

DAT ' code segment
C_luaK__finish_655
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #54 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaK__finish_656 ' NEI4
 mov r20, r19
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaK__finish_656 ' NEI4
 jmp #\@C_luaK__finish_653 ' JUMPV addrg
C_luaK__finish_656
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff80 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 or r22, #70 ' BORU4 coni
 wrlong r22, r17 ' ASGNU4 reg reg
C_luaK__finish_658
 mov r22, r23
 adds r22, #54 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaK__finish_659 ' EQI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffff7fff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##$8000 ' reg <- con
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
C_luaK__finish_659
 mov r22, r19
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaK__finish_653 ' EQI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19
 adds r20, #6 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHU4 coni
 mov r18, ##$ff000000 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 jmp #\@C_luaK__finish_653 ' JUMPV addrg
C_luaK__finish_663
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n835_696de099_finaltarget_L000639
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s9n88_696de099_fixjump_L000079
 add SP, #8 ' CALL addrg
C_luaK__finish_653
' C_luaK__finish_649 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_luaK__finish_651
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 if_b jmp #\C_luaK__finish_648 ' LTI4
' C_luaK__finish_647 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import luaV_flttointeger

' Catalina Import luaV_tointegerns

' Catalina Import luaV_equalobj

' Catalina Import luaH_finishset

' Catalina Import luaH_get

' Catalina Import luaC_barrier_

' Catalina Import luaY_nvarstack

' Catalina Import luaP_opmodes

' Catalina Import luaX_syntaxerror

' Catalina Import luaM_growaux_

' Catalina Import luaO_rawarith

' Catalina Import luaO_ceillog2

' Catalina Import abs

' Catalina Import ldexp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s9n828_696de099_validop_L000465_480_L000481 ' <symbol:480>
 long $0 ' float

 alignl ' align long
C_s9n810_696de099_luaK__numberK__L000202_206_L000207 ' <symbol:206>
 long $3f800000 ' float

 alignl ' align long
C_s9n8s_696de099_addk_L000183_189_L000190 ' <symbol:189>
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 97
 byte 110
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_luaK__checkstack_160_L000161 ' <symbol:160>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 111
 byte 114
 byte 32
 byte 101
 byte 120
 byte 112
 byte 114
 byte 101
 byte 115
 byte 115
 byte 105
 byte 111
 byte 110
 byte 32
 byte 110
 byte 101
 byte 101
 byte 100
 byte 115
 byte 32
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
 byte 103
 byte 105
 byte 115
 byte 116
 byte 101
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_s9n8f_696de099_savelineinfo_L000128_135_L000136 ' <symbol:135>
 byte 111
 byte 112
 byte 99
 byte 111
 byte 100
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_s9n8f_696de099_savelineinfo_L000128_133_L000134 ' <symbol:133>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_s9n88_696de099_fixjump_L000079_84_L000085 ' <symbol:84>
 byte 99
 byte 111
 byte 110
 byte 116
 byte 114
 byte 111
 byte 108
 byte 32
 byte 115
 byte 116
 byte 114
 byte 117
 byte 99
 byte 116
 byte 117
 byte 114
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

' Catalina Code

DAT ' code segment
' end
