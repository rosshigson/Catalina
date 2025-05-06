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
' C_luaK__semerror_24 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41_67ea42ba_tonumeral_L000025 ' <symbol:tonumeral>
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
 if_z jmp #\C_sio41_67ea42ba_tonumeral_L000025_27 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sio41_67ea42ba_tonumeral_L000025_26 ' JUMPV addrg
C_sio41_67ea42ba_tonumeral_L000025_27
 rdlong r23, r3 ' reg <- INDIRI4 reg
 cmps r23,  #5 wz
 if_z jmp #\C_sio41_67ea42ba_tonumeral_L000025_35 ' EQI4
 cmps r23,  #6 wz
 if_z jmp #\C_sio41_67ea42ba_tonumeral_L000025_32 ' EQI4
 jmp #\@C_sio41_67ea42ba_tonumeral_L000025_29 ' JUMPV addrg
C_sio41_67ea42ba_tonumeral_L000025_32
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sio41_67ea42ba_tonumeral_L000025_33 ' EQU4
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
C_sio41_67ea42ba_tonumeral_L000025_33
 mov r0, #1 ' reg <- coni
 jmp #\@C_sio41_67ea42ba_tonumeral_L000025_26 ' JUMPV addrg
C_sio41_67ea42ba_tonumeral_L000025_35
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sio41_67ea42ba_tonumeral_L000025_36 ' EQU4
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
C_sio41_67ea42ba_tonumeral_L000025_36
 mov r0, #1 ' reg <- coni
 jmp #\@C_sio41_67ea42ba_tonumeral_L000025_26 ' JUMPV addrg
C_sio41_67ea42ba_tonumeral_L000025_29
 mov r0, #0 ' reg <- coni
C_sio41_67ea42ba_tonumeral_L000025_26
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42_67ea42ba_const2val_L000038 ' <symbol:const2val>
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
' C_sio42_67ea42ba_const2val_L000038_39 ' (symbol refcount = 0)
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
 if_z jmp #\C_luaK__exp2const_41 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_41
 rdlong r17, r21 ' reg <- INDIRI4 reg
 cmps r17,  #1 wcz
 if_b jmp #\C_luaK__exp2const_43 ' LTI4
 cmps r17,  #7 wcz
 if_a jmp #\C_luaK__exp2const_51 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__exp2const_52_L000054-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__exp2const_52_L000054 ' <symbol:52>
 long @C_luaK__exp2const_48
 long @C_luaK__exp2const_47
 long @C_luaK__exp2const_46
 long @C_luaK__exp2const_43
 long @C_luaK__exp2const_43
 long @C_luaK__exp2const_43
 long @C_luaK__exp2const_49

' Catalina Code

DAT ' code segment
C_luaK__exp2const_51
 cmps r17,  #11 wz
 if_z jmp #\C_luaK__exp2const_50 ' EQI4
 jmp #\@C_luaK__exp2const_43 ' JUMPV addrg
C_luaK__exp2const_46
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_47
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_48
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_49
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
 jmp #\@C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_50
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42_67ea42ba_const2val_L000038
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
 jmp #\@C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_43
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41_67ea42ba_tonumeral_L000025
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaK__exp2const_40
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sio45_67ea42ba_previousinstruction_L000056_invalidinstr_L000059 ' <symbol:invalidinstruction>
 long $ffffffff

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sio45_67ea42ba_previousinstruction_L000056 ' <symbol:previousinstruction>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_sio45_67ea42ba_previousinstruction_L000056_60 ' LEI4
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
 jmp #\@C_sio45_67ea42ba_previousinstruction_L000056_57 ' JUMPV addrg
C_sio45_67ea42ba_previousinstruction_L000056_60
 mov r0, ##@C_sio45_67ea42ba_previousinstruction_L000056_invalidinstr_L000059 ' reg <- addrg
C_sio45_67ea42ba_previousinstruction_L000056_57
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
 long @C_sio45_67ea42ba_previousinstruction_L000056 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #8 wz
 if_nz jmp #\C_luaK__nil_63 ' NEI4
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
 if_a jmp #\C_luaK__nil_68 ' GTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 cmps r21, r22 wcz
 if_be jmp #\C_luaK__nil_67 ' LEI4
C_luaK__nil_68
 cmps r21, r15 wcz
 if_a jmp #\C_luaK__nil_65 ' GTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 cmps r15, r22 wcz
 if_a jmp #\C_luaK__nil_65 ' GTI4
C_luaK__nil_67
 cmps r15, r21 wcz
 if_ae jmp #\C_luaK__nil_69 ' GEI4
 mov r21, r15 ' CVI, CVU or LOAD
C_luaK__nil_69
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_be jmp #\C_luaK__nil_71 ' LEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaK__nil_71
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
 jmp #\@C_luaK__nil_62 ' JUMPV addrg
C_luaK__nil_65
C_luaK__nil_63
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
C_luaK__nil_62
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio47_67ea42ba_getjump_L000073 ' <symbol:getjump>
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
 if_nz jmp #\C_sio47_67ea42ba_getjump_L000073_75 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_sio47_67ea42ba_getjump_L000073_74 ' JUMPV addrg
C_sio47_67ea42ba_getjump_L000073_75
 mov r22, r2
 adds r22, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_sio47_67ea42ba_getjump_L000073_74
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio48_67ea42ba_fixjump_L000077 ' <symbol:fixjump>
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
 if_a jmp #\C_sio48_67ea42ba_fixjump_L000077_81 ' GTI4
 mov r22, ##16777216 ' reg <- con
 cmps r17, r22 wcz
 if_be jmp #\C_sio48_67ea42ba_fixjump_L000077_79 ' LEI4
C_sio48_67ea42ba_fixjump_L000077_81
 mov r2, ##@C_sio48_67ea42ba_fixjump_L000077_82_L000083 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sio48_67ea42ba_fixjump_L000077_79
 rdlong r22, r15 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 mov r20, ##16777215 ' reg <- con
 adds r20, r17 ' ADDI/P (2)
 shl r20, #7 ' LSHU4 coni
 mov r18, ##$ffffff80 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r15 ' ASGNU4 reg reg
' C_sio48_67ea42ba_fixjump_L000077_78 ' (symbol refcount = 0)
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
 if_nz jmp #\C_luaK__concat_85 ' NEI4
 jmp #\@C_luaK__concat_84 ' JUMPV addrg
C_luaK__concat_85
 rdlong r22, r21 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_luaK__concat_87 ' NEI4
 wrlong r19, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__concat_88 ' JUMPV addrg
C_luaK__concat_87
 rdlong r17, r21 ' reg <- INDIRI4 reg
 jmp #\@C_luaK__concat_90 ' JUMPV addrg
C_luaK__concat_89
 mov r17, r15 ' CVI, CVU or LOAD
C_luaK__concat_90
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio47_67ea42ba_getjump_L000073
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_luaK__concat_89 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio48_67ea42ba_fixjump_L000077
 add SP, #8 ' CALL addrg
C_luaK__concat_88
C_luaK__concat_84
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
 long @C_sio4_67ea42ba_codesJ__L000023
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaK__jump_92 ' (symbol refcount = 0)
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
 if_z jmp #\C_luaK__ret_96 ' EQI4
 cmps r19,  #1 wz
 if_z jmp #\C_luaK__ret_97 ' EQI4
 jmp #\@C_luaK__ret_94 ' JUMPV addrg
C_luaK__ret_96
 mov r22, #71 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__ret_95 ' JUMPV addrg
C_luaK__ret_97
 mov r22, #72 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__ret_95 ' JUMPV addrg
C_luaK__ret_94
 mov r22, #70 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaK__ret_95
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
' C_luaK__ret_93 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4a_67ea42ba_condjump_L000098 ' <symbol:condjump>
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
' C_sio4a_67ea42ba_condjump_L000098_99 ' (symbol refcount = 0)
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
' C_luaK__getlabel_100 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sio4b_67ea42ba_getjumpcontrol_L000101 ' <symbol:getjumpcontrol>
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
 if_b jmp #\C_sio4b_67ea42ba_getjumpcontrol_L000101_103 ' LTI4
 mov r22, ##-4 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 mov r20, ##@C_luaP__opmodes ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_sio4b_67ea42ba_getjumpcontrol_L000101_103 ' EQI4
 mov r22, ##-4 ' reg <- con
 mov r0, r23 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #\@C_sio4b_67ea42ba_getjumpcontrol_L000101_102 ' JUMPV addrg
C_sio4b_67ea42ba_getjumpcontrol_L000101_103
 mov r0, r23 ' CVI, CVU or LOAD
C_sio4b_67ea42ba_getjumpcontrol_L000101_102
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sio4c_67ea42ba_patchtestreg_L000105 ' <symbol:patchtestreg>
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
 long @C_sio4b_67ea42ba_getjumpcontrol_L000101
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 rdlong r22, r17 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #67 wz
 if_z jmp #\C_sio4c_67ea42ba_patchtestreg_L000105_107 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sio4c_67ea42ba_patchtestreg_L000105_106 ' JUMPV addrg
C_sio4c_67ea42ba_patchtestreg_L000105_107
 cmps r19,  #255 wz
 if_z jmp #\C_sio4c_67ea42ba_patchtestreg_L000105_109 ' EQI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 cmps r19, r22 wz
 if_z jmp #\C_sio4c_67ea42ba_patchtestreg_L000105_109 ' EQI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffff807f ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 mov r18, ##32640 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
 jmp #\@C_sio4c_67ea42ba_patchtestreg_L000105_110 ' JUMPV addrg
C_sio4c_67ea42ba_patchtestreg_L000105_109
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
C_sio4c_67ea42ba_patchtestreg_L000105_110
 mov r0, #1 ' reg <- coni
C_sio4c_67ea42ba_patchtestreg_L000105_106
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio4d_67ea42ba_removevalues_L000111 ' <symbol:removevalues>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_sio4d_67ea42ba_removevalues_L000111_116 ' JUMPV addrg
C_sio4d_67ea42ba_removevalues_L000111_113
 mov r2, #255 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4c_67ea42ba_patchtestreg_L000105
 add SP, #8 ' CALL addrg
' C_sio4d_67ea42ba_removevalues_L000111_114 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio47_67ea42ba_getjump_L000073
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_sio4d_67ea42ba_removevalues_L000111_116
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_sio4d_67ea42ba_removevalues_L000111_113 ' NEI4
' C_sio4d_67ea42ba_removevalues_L000111_112 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio4e_67ea42ba_patchlistaux_L000117 ' <symbol:patchlistaux>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #\@C_sio4e_67ea42ba_patchlistaux_L000117_120 ' JUMPV addrg
C_sio4e_67ea42ba_patchlistaux_L000117_119
 mov r2, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio47_67ea42ba_getjump_L000073
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
 long @C_sio4c_67ea42ba_patchtestreg_L000105
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio4e_67ea42ba_patchlistaux_L000117_122 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio48_67ea42ba_fixjump_L000077
 add SP, #8 ' CALL addrg
 jmp #\@C_sio4e_67ea42ba_patchlistaux_L000117_123 ' JUMPV addrg
C_sio4e_67ea42ba_patchlistaux_L000117_122
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio48_67ea42ba_fixjump_L000077
 add SP, #8 ' CALL addrg
C_sio4e_67ea42ba_patchlistaux_L000117_123
 mov r23, r15 ' CVI, CVU or LOAD
C_sio4e_67ea42ba_patchlistaux_L000117_120
 mov r22, ##-1 ' reg <- con
 cmps r23, r22 wz
 if_nz jmp #\C_sio4e_67ea42ba_patchlistaux_L000117_119 ' NEI4
' C_sio4e_67ea42ba_patchlistaux_L000117_118 ' (symbol refcount = 0)
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
 long @C_sio4e_67ea42ba_patchlistaux_L000117
 add SP, #16 ' CALL addrg
' C_luaK__patchlist_124 ' (symbol refcount = 0)
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
' C_luaK__patchtohere_125 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4f_67ea42ba_savelineinfo_L000126 ' <symbol:savelineinfo>
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
 if_ae jmp #\C_sio4f_67ea42ba_savelineinfo_L000126_130 ' GEI4
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
 if_b jmp #\C_sio4f_67ea42ba_savelineinfo_L000126_128 ' LTI4
C_sio4f_67ea42ba_savelineinfo_L000126_130
 mov r2, ##@C_sio4f_67ea42ba_savelineinfo_L000126_131_L000132 ' reg ARG ADDRG
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
C_sio4f_67ea42ba_savelineinfo_L000126_128
 mov r2, ##@C_sio4f_67ea42ba_savelineinfo_L000126_133_L000134 ' reg ARG ADDRG
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
' C_sio4f_67ea42ba_savelineinfo_L000126_127 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio4i_67ea42ba_removelastlineinfo_L000135 ' <symbol:removelastlineinfo>
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
 if_z jmp #\C_sio4i_67ea42ba_removelastlineinfo_L000135_137 ' EQI4
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
 jmp #\@C_sio4i_67ea42ba_removelastlineinfo_L000135_138 ' JUMPV addrg
C_sio4i_67ea42ba_removelastlineinfo_L000135_137
 mov r22, r2
 adds r22, #36 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #53 ' ADDP4 coni
 mov r20, #129 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sio4i_67ea42ba_removelastlineinfo_L000135_138
' C_sio4i_67ea42ba_removelastlineinfo_L000135_136 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4j_67ea42ba_removelastinstruction_L000139 ' <symbol:removelastinstruction>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio4i_67ea42ba_removelastlineinfo_L000135 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_sio4j_67ea42ba_removelastinstruction_L000139_140 ' (symbol refcount = 0)
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
 mov r2, ##@C_sio4f_67ea42ba_savelineinfo_L000126_133_L000134 ' reg ARG ADDRG
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
 long @C_sio4f_67ea42ba_savelineinfo_L000126
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22
 subs r0, #1 ' SUBI4 coni
' C_luaK__code_141 ' (symbol refcount = 0)
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
' C_luaK__codeA_B_C_k_142 ' (symbol refcount = 0)
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
' C_luaK__codeA_B_x_143 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_codeAsBx

 alignl ' align long
C_luaK__codeA_sB_x ' <symbol:luaK_codeAsBx>
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
' C_luaK__codeA_sB_x_144 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4_67ea42ba_codesJ__L000023 ' <symbol:codesJ>
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
' C_sio4_67ea42ba_codesJ__L000023_145 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4k_67ea42ba_codeextraarg_L000146 ' <symbol:codeextraarg>
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
' C_sio4k_67ea42ba_codeextraarg_L000146_147 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio4l_67ea42ba_luaK__codek_L000148 ' <symbol:luaK_codek>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##131071 ' reg <- con
 cmps r19, r22 wcz
 if_a jmp #\C_sio4l_67ea42ba_luaK__codek_L000148_150 ' GTI4
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
 jmp #\@C_sio4l_67ea42ba_luaK__codek_L000148_149 ' JUMPV addrg
C_sio4l_67ea42ba_luaK__codek_L000148_150
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
 long @C_sio4k_67ea42ba_codeextraarg_L000146
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
C_sio4l_67ea42ba_luaK__codek_L000148_149
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
 if_be jmp #\C_luaK__checkstack_153 ' LEI4
 cmps r19,  #255 wcz
 if_b jmp #\C_luaK__checkstack_155 ' LTI4
 mov r2, ##@C_luaK__checkstack_157_L000158 ' reg ARG ADDRG
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_luaK__checkstack_155
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaK__checkstack_153
' C_luaK__checkstack_152 ' (symbol refcount = 0)
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
' C_luaK__reserveregs_159 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio4n_67ea42ba_freereg_L000160 ' <symbol:freereg>
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
 if_b jmp #\C_sio4n_67ea42ba_freereg_L000160_162 ' LTI4
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sio4n_67ea42ba_freereg_L000160_162
' C_sio4n_67ea42ba_freereg_L000160_161 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio4o_67ea42ba_freeregs_L000164 ' <symbol:freeregs>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21, r19 wcz
 if_be jmp #\C_sio4o_67ea42ba_freeregs_L000164_166 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4n_67ea42ba_freereg_L000160
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4n_67ea42ba_freereg_L000160
 add SP, #4 ' CALL addrg
 jmp #\@C_sio4o_67ea42ba_freeregs_L000164_167 ' JUMPV addrg
C_sio4o_67ea42ba_freeregs_L000164_166
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4n_67ea42ba_freereg_L000160
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4n_67ea42ba_freereg_L000160
 add SP, #4 ' CALL addrg
C_sio4o_67ea42ba_freeregs_L000164_167
' C_sio4o_67ea42ba_freeregs_L000164_165 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio4p_67ea42ba_freeexp_L000168 ' <symbol:freeexp>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_sio4p_67ea42ba_freeexp_L000168_170 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4n_67ea42ba_freereg_L000160
 add SP, #4 ' CALL addrg
C_sio4p_67ea42ba_freeexp_L000168_170
' C_sio4p_67ea42ba_freeexp_L000168_169 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio4q_67ea42ba_freeexps_L000172 ' <symbol:freeexps>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_sio4q_67ea42ba_freeexps_L000172_175 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
 jmp #\@C_sio4q_67ea42ba_freeexps_L000172_176 ' JUMPV addrg
C_sio4q_67ea42ba_freeexps_L000172_175
 mov r17, ##-1 ' reg <- con
C_sio4q_67ea42ba_freeexps_L000172_176
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNI4 addrli reg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_sio4q_67ea42ba_freeexps_L000172_178 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRI4 reg
 jmp #\@C_sio4q_67ea42ba_freeexps_L000172_179 ' JUMPV addrg
C_sio4q_67ea42ba_freeexps_L000172_178
 mov r15, ##-1 ' reg <- con
C_sio4q_67ea42ba_freeexps_L000172_179
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
 long @C_sio4o_67ea42ba_freeregs_L000164
 add SP, #8 ' CALL addrg
' C_sio4q_67ea42ba_freeexps_L000172_173 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4r_67ea42ba_addk_L000180 ' <symbol:addk>
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
 if_nz jmp #\C_sio4r_67ea42ba_addk_L000180_182 ' NEI4
 rdlong r13, r9 ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r13, r22 wcz
 if_ae jmp #\C_sio4r_67ea42ba_addk_L000180_184 ' GEI4
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
 if_nz jmp #\C_sio4r_67ea42ba_addk_L000180_184 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##0 ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio4r_67ea42ba_addk_L000180_184 ' EQI4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #\@C_sio4r_67ea42ba_addk_L000180_181 ' JUMPV addrg
C_sio4r_67ea42ba_addk_L000180_184
C_sio4r_67ea42ba_addk_L000180_182
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
 mov r2, ##@C_sio4r_67ea42ba_addk_L000180_186_L000187 ' reg ARG ADDRG
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
 jmp #\@C_sio4r_67ea42ba_addk_L000180_189 ' JUMPV addrg
C_sio4r_67ea42ba_addk_L000180_188
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
C_sio4r_67ea42ba_addk_L000180_189
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r15, r22 wcz
 if_b jmp #\C_sio4r_67ea42ba_addk_L000180_188 ' LTI4
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
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_sio4r_67ea42ba_addk_L000180_192 ' EQI4
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_sio4r_67ea42ba_addk_L000180_192 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_sio4r_67ea42ba_addk_L000180_192 ' EQI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r11 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_sio4r_67ea42ba_addk_L000180_192 ' JUMPV addrg
C_sio4r_67ea42ba_addk_L000180_192
 mov r0, r13 ' CVI, CVU or LOAD
C_sio4r_67ea42ba_addk_L000180_181
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4t_67ea42ba_stringK__L000193 ' <symbol:stringK>
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
 long @C_sio4r_67ea42ba_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sio4t_67ea42ba_stringK__L000193_194 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4u_67ea42ba_luaK__intK__L000195 ' <symbol:luaK_intK>
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
 long @C_sio4r_67ea42ba_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sio4u_67ea42ba_luaK__intK__L000195_196 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio4v_67ea42ba_luaK__numberK__L000197 ' <symbol:luaK_numberK>
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
 if_nz jmp #\C_sio4v_67ea42ba_luaK__numberK__L000197_199 ' NEI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4r_67ea42ba_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sio4v_67ea42ba_luaK__numberK__L000197_198 ' JUMPV addrg
C_sio4v_67ea42ba_luaK__numberK__L000197_199
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
 mov r3, ##@C_sio4v_67ea42ba_luaK__numberK__L000197_201_L000202
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
 if_nz jmp #\C_sio4v_67ea42ba_luaK__numberK__L000197_204 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRF4 reg
 jmp #\@C_sio4v_67ea42ba_luaK__numberK__L000197_205 ' JUMPV addrg
C_sio4v_67ea42ba_luaK__numberK__L000197_204
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
C_sio4v_67ea42ba_luaK__numberK__L000197_205
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
 long @C_sio4r_67ea42ba_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sio4v_67ea42ba_luaK__numberK__L000197_198
 calld PA,#POPM ' restore registers
 add SP, #36 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio411_67ea42ba_boolF__L000206 ' <symbol:boolF>
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
 long @C_sio4r_67ea42ba_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sio411_67ea42ba_boolF__L000206_207 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio412_67ea42ba_boolT__L000209 ' <symbol:boolT>
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
 long @C_sio4r_67ea42ba_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sio412_67ea42ba_boolT__L000209_210 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio413_67ea42ba_nilK__L000212 ' <symbol:nilK>
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
 long @C_sio4r_67ea42ba_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sio413_67ea42ba_nilK__L000212_213 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio414_67ea42ba_fitsC__L000215 ' <symbol:fitsC>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 add r22, #127 ' ADDU4 coni
 cmp r22,  #255 wcz 
 if_a jmp #\C_sio414_67ea42ba_fitsC__L000215_218 ' GTU4
 mov r23, #1 ' reg <- coni
 jmp #\@C_sio414_67ea42ba_fitsC__L000215_219 ' JUMPV addrg
C_sio414_67ea42ba_fitsC__L000215_218
 mov r23, #0 ' reg <- coni
C_sio414_67ea42ba_fitsC__L000215_219
 mov r0, r23 ' CVI, CVU or LOAD
' C_sio414_67ea42ba_fitsC__L000215_216 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sio415_67ea42ba_fitsB_x_L000220 ' <symbol:fitsBx>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, ##-65535 ' reg <- con
 cmps r22, r2 wcz
 if_a jmp #\C_sio415_67ea42ba_fitsB_x_L000220_223 ' GTI4
 mov r22, ##65536 ' reg <- con
 cmps r2, r22 wcz
 if_a jmp #\C_sio415_67ea42ba_fitsB_x_L000220_223 ' GTI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_sio415_67ea42ba_fitsB_x_L000220_224 ' JUMPV addrg
C_sio415_67ea42ba_fitsB_x_L000220_223
 mov r23, #0 ' reg <- coni
C_sio415_67ea42ba_fitsB_x_L000220_224
 mov r0, r23 ' CVI, CVU or LOAD
' C_sio415_67ea42ba_fitsB_x_L000220_221 ' (symbol refcount = 0)
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
 long @C_sio415_67ea42ba_fitsB_x_L000220 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__int_226 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__codeA_sB_x
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__int_227 ' JUMPV addrg
C_luaK__int_226
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4u_67ea42ba_luaK__intK__L000195
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4l_67ea42ba_luaK__codek_L000148
 add SP, #8 ' CALL addrg
C_luaK__int_227
' C_luaK__int_225 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio416_67ea42ba_luaK__float_L000228 ' <symbol:luaK_float>
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
 if_z jmp #\C_sio416_67ea42ba_luaK__float_L000228_230 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio415_67ea42ba_fitsB_x_L000220 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio416_67ea42ba_luaK__float_L000228_230 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__codeA_sB_x
 add SP, #12 ' CALL addrg
 jmp #\@C_sio416_67ea42ba_luaK__float_L000228_231 ' JUMPV addrg
C_sio416_67ea42ba_luaK__float_L000228_230
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4v_67ea42ba_luaK__numberK__L000197
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4l_67ea42ba_luaK__codek_L000148
 add SP, #8 ' CALL addrg
C_sio416_67ea42ba_luaK__float_L000228_231
' C_sio416_67ea42ba_luaK__float_L000228_229 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio417_67ea42ba_const2exp_L000232 ' <symbol:const2exp>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r23, r22
 and r23, #63 ' BANDI4 coni
 cmps r23,  #0 wcz
 if_b jmp #\C_sio417_67ea42ba_const2exp_L000232_234 ' LTI4
 cmps r23,  #4 wcz
 if_a jmp #\C_sio417_67ea42ba_const2exp_L000232_243 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sio417_67ea42ba_const2exp_L000232_244_L000246 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sio417_67ea42ba_const2exp_L000232_244_L000246 ' <symbol:244>
 long @C_sio417_67ea42ba_const2exp_L000232_241
 long @C_sio417_67ea42ba_const2exp_L000232_239
 long @C_sio417_67ea42ba_const2exp_L000232_234
 long @C_sio417_67ea42ba_const2exp_L000232_237
 long @C_sio417_67ea42ba_const2exp_L000232_242

' Catalina Code

DAT ' code segment
C_sio417_67ea42ba_const2exp_L000232_243
 cmps r23,  #17 wz
 if_z jmp #\C_sio417_67ea42ba_const2exp_L000232_240 ' EQI4
 cmps r23,  #19 wz
 if_z jmp #\C_sio417_67ea42ba_const2exp_L000232_238 ' EQI4
 cmps r23,  #20 wz
 if_z jmp #\C_sio417_67ea42ba_const2exp_L000232_242 ' EQI4
 jmp #\@C_sio417_67ea42ba_const2exp_L000232_234 ' JUMPV addrg
C_sio417_67ea42ba_const2exp_L000232_237
 mov r22, #6 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r3 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_sio417_67ea42ba_const2exp_L000232_235 ' JUMPV addrg
C_sio417_67ea42ba_const2exp_L000232_238
 mov r22, #5 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r3 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 jmp #\@C_sio417_67ea42ba_const2exp_L000232_235 ' JUMPV addrg
C_sio417_67ea42ba_const2exp_L000232_239
 mov r22, #3 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 jmp #\@C_sio417_67ea42ba_const2exp_L000232_235 ' JUMPV addrg
C_sio417_67ea42ba_const2exp_L000232_240
 mov r22, #2 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 jmp #\@C_sio417_67ea42ba_const2exp_L000232_235 ' JUMPV addrg
C_sio417_67ea42ba_const2exp_L000232_241
 mov r22, #1 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 jmp #\@C_sio417_67ea42ba_const2exp_L000232_235 ' JUMPV addrg
C_sio417_67ea42ba_const2exp_L000232_242
 mov r22, #7 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r3 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_sio417_67ea42ba_const2exp_L000232_234
C_sio417_67ea42ba_const2exp_L000232_235
' C_sio417_67ea42ba_const2exp_L000232_233 ' (symbol refcount = 0)
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
 if_nz jmp #\C_luaK__setreturns_248 ' NEI4
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
 jmp #\@C_luaK__setreturns_249 ' JUMPV addrg
C_luaK__setreturns_248
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
C_luaK__setreturns_249
' C_luaK__setreturns_247 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41a_67ea42ba_str2K__L000250 ' <symbol:str2K>
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
 long @C_sio4t_67ea42ba_stringK__L000193
 add SP, #4 ' CALL addrg
 wrlong r0, r22 ' ASGNI4 reg reg
 mov r22, #4 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
' C_sio41a_67ea42ba_str2K__L000250_251 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaK_setoneret

 alignl ' align long
C_luaK__setoneret ' <symbol:luaK_setoneret>
 calld PA,#PSHM
 long $540000 ' save registers
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 if_nz jmp #\C_luaK__setoneret_253 ' NEI4
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
 jmp #\@C_luaK__setoneret_254 ' JUMPV addrg
C_luaK__setoneret_253
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #19 wz
 if_nz jmp #\C_luaK__setoneret_255 ' NEI4
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
C_luaK__setoneret_255
C_luaK__setoneret_254
' C_luaK__setoneret_252 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaK_dischargevars

 alignl ' align long
C_luaK__dischargevars ' <symbol:luaK_dischargevars>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r19, r21 ' reg <- INDIRI4 reg
 cmps r19,  #9 wcz
 if_b jmp #\C_luaK__dischargevars_259 ' LTI4
 cmps r19,  #19 wcz
 if_a jmp #\C_luaK__dischargevars_259 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__dischargevars_269_L000271-36 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__dischargevars_269_L000271 ' <symbol:269>
 long @C_luaK__dischargevars_262
 long @C_luaK__dischargevars_263
 long @C_luaK__dischargevars_261
 long @C_luaK__dischargevars_267
 long @C_luaK__dischargevars_264
 long @C_luaK__dischargevars_265
 long @C_luaK__dischargevars_266
 long @C_luaK__dischargevars_259
 long @C_luaK__dischargevars_259
 long @C_luaK__dischargevars_268
 long @C_luaK__dischargevars_268

' Catalina Code

DAT ' code segment
C_luaK__dischargevars_261
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42_67ea42ba_const2val_L000038
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio417_67ea42ba_const2exp_L000232
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_262
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_263
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
 jmp #\@C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_264
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
 jmp #\@C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_265
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4n_67ea42ba_freereg_L000160
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
 jmp #\@C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_266
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4n_67ea42ba_freereg_L000160
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
 jmp #\@C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_267
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
 long @C_sio4o_67ea42ba_freeregs_L000164
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
 jmp #\@C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_268
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__setoneret
 add SP, #4 ' CALL addrg
C_luaK__dischargevars_259
' C_luaK__dischargevars_257 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41d_67ea42ba_discharge2reg_L000273 ' <symbol:discharge2reg>
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
 if_b jmp #\C_sio41d_67ea42ba_discharge2reg_L000273_274 ' LTI4
 cmps r17,  #17 wcz
 if_a jmp #\C_sio41d_67ea42ba_discharge2reg_L000273_274 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sio41d_67ea42ba_discharge2reg_L000273_289_L000291-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sio41d_67ea42ba_discharge2reg_L000273_289_L000291 ' <symbol:289>
 long @C_sio41d_67ea42ba_discharge2reg_L000273_278
 long @C_sio41d_67ea42ba_discharge2reg_L000273_280
 long @C_sio41d_67ea42ba_discharge2reg_L000273_279
 long @C_sio41d_67ea42ba_discharge2reg_L000273_282
 long @C_sio41d_67ea42ba_discharge2reg_L000273_283
 long @C_sio41d_67ea42ba_discharge2reg_L000273_284
 long @C_sio41d_67ea42ba_discharge2reg_L000273_281
 long @C_sio41d_67ea42ba_discharge2reg_L000273_286
 long @C_sio41d_67ea42ba_discharge2reg_L000273_274
 long @C_sio41d_67ea42ba_discharge2reg_L000273_274
 long @C_sio41d_67ea42ba_discharge2reg_L000273_274
 long @C_sio41d_67ea42ba_discharge2reg_L000273_274
 long @C_sio41d_67ea42ba_discharge2reg_L000273_274
 long @C_sio41d_67ea42ba_discharge2reg_L000273_274
 long @C_sio41d_67ea42ba_discharge2reg_L000273_274
 long @C_sio41d_67ea42ba_discharge2reg_L000273_274
 long @C_sio41d_67ea42ba_discharge2reg_L000273_285

' Catalina Code

DAT ' code segment
C_sio41d_67ea42ba_discharge2reg_L000273_278
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__nil
 add SP, #8 ' CALL addrg
 jmp #\@C_sio41d_67ea42ba_discharge2reg_L000273_276 ' JUMPV addrg
C_sio41d_67ea42ba_discharge2reg_L000273_279
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
 jmp #\@C_sio41d_67ea42ba_discharge2reg_L000273_276 ' JUMPV addrg
C_sio41d_67ea42ba_discharge2reg_L000273_280
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
 jmp #\@C_sio41d_67ea42ba_discharge2reg_L000273_276 ' JUMPV addrg
C_sio41d_67ea42ba_discharge2reg_L000273_281
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41a_67ea42ba_str2K__L000250
 add SP, #4 ' CALL addrg
C_sio41d_67ea42ba_discharge2reg_L000273_282
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4l_67ea42ba_luaK__codek_L000148
 add SP, #8 ' CALL addrg
 jmp #\@C_sio41d_67ea42ba_discharge2reg_L000273_276 ' JUMPV addrg
C_sio41d_67ea42ba_discharge2reg_L000273_283
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio416_67ea42ba_luaK__float_L000228
 add SP, #8 ' CALL addrg
 jmp #\@C_sio41d_67ea42ba_discharge2reg_L000273_276 ' JUMPV addrg
C_sio41d_67ea42ba_discharge2reg_L000273_284
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
 jmp #\@C_sio41d_67ea42ba_discharge2reg_L000273_276 ' JUMPV addrg
C_sio41d_67ea42ba_discharge2reg_L000273_285
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
 jmp #\@C_sio41d_67ea42ba_discharge2reg_L000273_276 ' JUMPV addrg
C_sio41d_67ea42ba_discharge2reg_L000273_286
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wz
 if_z jmp #\C_sio41d_67ea42ba_discharge2reg_L000273_276 ' EQI4
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
C_sio41d_67ea42ba_discharge2reg_L000273_276
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
C_sio41d_67ea42ba_discharge2reg_L000273_274
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio41g_67ea42ba_discharge2anyreg_L000293 ' <symbol:discharge2anyreg>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 if_z jmp #\C_sio41g_67ea42ba_discharge2anyreg_L000293_295 ' EQI4
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
 long @C_sio41d_67ea42ba_discharge2reg_L000273
 add SP, #8 ' CALL addrg
C_sio41g_67ea42ba_discharge2anyreg_L000293_295
' C_sio41g_67ea42ba_discharge2anyreg_L000293_294 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41h_67ea42ba_code_loadbool_L000297 ' <symbol:code_loadbool>
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
' C_sio41h_67ea42ba_code_loadbool_L000297_298 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41i_67ea42ba_need_value_L000299 ' <symbol:need_value>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_sio41i_67ea42ba_need_value_L000299_304 ' JUMPV addrg
C_sio41i_67ea42ba_need_value_L000299_301
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4b_67ea42ba_getjumpcontrol_L000101
 add SP, #4 ' CALL addrg
 rdlong r19, r0 ' reg <- INDIRU4 reg
 mov r22, r19
 and r22, #127 ' BANDU4 coni
 cmps r22,  #67 wz
 if_z jmp #\C_sio41i_67ea42ba_need_value_L000299_305 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_sio41i_67ea42ba_need_value_L000299_300 ' JUMPV addrg
C_sio41i_67ea42ba_need_value_L000299_305
' C_sio41i_67ea42ba_need_value_L000299_302 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio47_67ea42ba_getjump_L000073
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_sio41i_67ea42ba_need_value_L000299_304
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_sio41i_67ea42ba_need_value_L000299_301 ' NEI4
 mov r0, #0 ' reg <- coni
C_sio41i_67ea42ba_need_value_L000299_300
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41j_67ea42ba_exp2reg_L000307 ' <symbol:exp2reg>
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
 long @C_sio41d_67ea42ba_discharge2reg_L000273
 add SP, #8 ' CALL addrg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #16 wz
 if_nz jmp #\C_sio41j_67ea42ba_exp2reg_L000307_309 ' NEI4
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
C_sio41j_67ea42ba_exp2reg_L000307_309
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_sio41j_67ea42ba_exp2reg_L000307_311 ' EQI4
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
 long @C_sio41i_67ea42ba_need_value_L000299
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sio41j_67ea42ba_exp2reg_L000307_315 ' NEI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41i_67ea42ba_need_value_L000299
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio41j_67ea42ba_exp2reg_L000307_313 ' EQI4
C_sio41j_67ea42ba_exp2reg_L000307_315
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #16 wz
 if_nz jmp #\C_sio41j_67ea42ba_exp2reg_L000307_317 ' NEI4
 mov r17, ##-1 ' reg <- con
 jmp #\@C_sio41j_67ea42ba_exp2reg_L000307_318 ' JUMPV addrg
C_sio41j_67ea42ba_exp2reg_L000307_317
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_sio41j_67ea42ba_exp2reg_L000307_318
 mov RI, FP
 sub RI, #-(-20)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41h_67ea42ba_code_loadbool_L000297
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
 long @C_sio41h_67ea42ba_code_loadbool_L000297
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
C_sio41j_67ea42ba_exp2reg_L000307_313
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
 long @C_sio4e_67ea42ba_patchlistaux_L000117
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
 long @C_sio4e_67ea42ba_patchlistaux_L000117
 add SP, #16 ' CALL addrg
C_sio41j_67ea42ba_exp2reg_L000307_311
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
' C_sio41j_67ea42ba_exp2reg_L000307_308 ' (symbol refcount = 0)
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
 long @C_sio4p_67ea42ba_freeexp_L000168
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
 long @C_sio41j_67ea42ba_exp2reg_L000307
 add SP, #8 ' CALL addrg
' C_luaK__exp2nextreg_319 ' (symbol refcount = 0)
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
 if_nz jmp #\C_luaK__exp2anyreg_321 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_luaK__exp2anyreg_323 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaK__exp2anyreg_320 ' JUMPV addrg
C_luaK__exp2anyreg_323
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r0 wcz
 if_b jmp #\C_luaK__exp2anyreg_325 ' LTI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41j_67ea42ba_exp2reg_L000307
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_luaK__exp2anyreg_320 ' JUMPV addrg
C_luaK__exp2anyreg_325
C_luaK__exp2anyreg_321
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
C_luaK__exp2anyreg_320
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
 if_nz jmp #\C_luaK__exp2anyregup_330 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_luaK__exp2anyregup_328 ' EQI4
C_luaK__exp2anyregup_330
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__exp2anyregup_328
' C_luaK__exp2anyregup_327 ' (symbol refcount = 0)
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
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_z jmp #\C_luaK__exp2val_332 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__exp2val_333 ' JUMPV addrg
C_luaK__exp2val_332
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
C_luaK__exp2val_333
' C_luaK__exp2val_331 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41k_67ea42ba_luaK__exp2K__L000334 ' <symbol:luaK_exp2K>
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
 if_nz jmp #\C_sio41k_67ea42ba_luaK__exp2K__L000334_336 ' NEI4
 rdlong r19, r21 ' reg <- INDIRI4 reg
 cmps r19,  #1 wcz
 if_b jmp #\C_sio41k_67ea42ba_luaK__exp2K__L000334_338 ' LTI4
 cmps r19,  #7 wcz
 if_a jmp #\C_sio41k_67ea42ba_luaK__exp2K__L000334_338 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sio41k_67ea42ba_luaK__exp2K__L000334_348_L000350-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sio41k_67ea42ba_luaK__exp2K__L000334_348_L000350 ' <symbol:348>
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334_343
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334_341
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334_342
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334_347
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334_345
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334_344
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334_346

' Catalina Code

DAT ' code segment
C_sio41k_67ea42ba_luaK__exp2K__L000334_341
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio412_67ea42ba_boolT__L000209 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_342
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio411_67ea42ba_boolF__L000206 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_343
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio413_67ea42ba_nilK__L000212 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_344
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4u_67ea42ba_luaK__intK__L000195
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_345
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4v_67ea42ba_luaK__numberK__L000197
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_346
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4t_67ea42ba_stringK__L000193
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_347
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_338
 mov r0, #0 ' reg <- coni
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_335 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_339
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #255 wcz
 if_a jmp #\C_sio41k_67ea42ba_luaK__exp2K__L000334_352 ' GTI4
 mov r22, #4 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sio41k_67ea42ba_luaK__exp2K__L000334_335 ' JUMPV addrg
C_sio41k_67ea42ba_luaK__exp2K__L000334_352
C_sio41k_67ea42ba_luaK__exp2K__L000334_336
 mov r0, #0 ' reg <- coni
C_sio41k_67ea42ba_luaK__exp2K__L000334_335
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_exp2RK

 alignl ' align long
C_luaK__exp2R_K_ ' <symbol:luaK_exp2RK>
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
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__exp2R_K__355 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_luaK__exp2R_K__354 ' JUMPV addrg
C_luaK__exp2R_K__355
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_luaK__exp2R_K__354
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41n_67ea42ba_codeA_B_R_K__L000357 ' <symbol:codeABRK>
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
 long @C_luaK__exp2R_K_
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
' C_sio41n_67ea42ba_codeA_B_R_K__L000357_358 ' (symbol refcount = 0)
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
 if_b jmp #\C_luaK__storevar_360 ' LTI4
 cmps r17,  #15 wcz
 if_a jmp #\C_luaK__storevar_360 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__storevar_369_L000371-36 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__storevar_369_L000371 ' <symbol:369>
 long @C_luaK__storevar_363
 long @C_luaK__storevar_364
 long @C_luaK__storevar_360
 long @C_luaK__storevar_368
 long @C_luaK__storevar_365
 long @C_luaK__storevar_366
 long @C_luaK__storevar_367

' Catalina Code

DAT ' code segment
C_luaK__storevar_363
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4p_67ea42ba_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41j_67ea42ba_exp2reg_L000307
 add SP, #8 ' CALL addrg
 jmp #\@C_luaK__storevar_359 ' JUMPV addrg
C_luaK__storevar_364
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
 jmp #\@C_luaK__storevar_361 ' JUMPV addrg
C_luaK__storevar_365
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
 long @C_sio41n_67ea42ba_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__storevar_361 ' JUMPV addrg
C_luaK__storevar_366
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
 long @C_sio41n_67ea42ba_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__storevar_361 ' JUMPV addrg
C_luaK__storevar_367
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
 long @C_sio41n_67ea42ba_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__storevar_361 ' JUMPV addrg
C_luaK__storevar_368
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
 long @C_sio41n_67ea42ba_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
C_luaK__storevar_360
C_luaK__storevar_361
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4p_67ea42ba_freeexp_L000168
 add SP, #4 ' CALL addrg
C_luaK__storevar_359
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
 long @C_sio4p_67ea42ba_freeexp_L000168
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
 long @C_sio41n_67ea42ba_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4p_67ea42ba_freeexp_L000168
 add SP, #4 ' CALL addrg
' C_luaK__self_373 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio41q_67ea42ba_negatecondition_L000374 ' <symbol:negatecondition>
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
 long @C_sio4b_67ea42ba_getjumpcontrol_L000101
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
' C_sio41q_67ea42ba_negatecondition_L000374_375 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio41r_67ea42ba_jumponcond_L000376 ' <symbol:jumponcond>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #17 wz
 if_nz jmp #\C_sio41r_67ea42ba_jumponcond_L000376_378 ' NEI4
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
 if_nz jmp #\C_sio41r_67ea42ba_jumponcond_L000376_380 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio4j_67ea42ba_removelastinstruction_L000139 ' CALL addrg
 cmps r19,  #0 wz
 if_nz jmp #\C_sio41r_67ea42ba_jumponcond_L000376_383 ' NEI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_sio41r_67ea42ba_jumponcond_L000376_384 ' JUMPV addrg
C_sio41r_67ea42ba_jumponcond_L000376_383
 mov r17, #0 ' reg <- coni
C_sio41r_67ea42ba_jumponcond_L000376_384
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
 long @C_sio4a_67ea42ba_condjump_L000098
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_sio41r_67ea42ba_jumponcond_L000376_377 ' JUMPV addrg
C_sio41r_67ea42ba_jumponcond_L000376_380
C_sio41r_67ea42ba_jumponcond_L000376_378
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41g_67ea42ba_discharge2anyreg_L000293
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4p_67ea42ba_freeexp_L000168
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
 long @C_sio4a_67ea42ba_condjump_L000098
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sio41r_67ea42ba_jumponcond_L000376_377
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
 if_b jmp #\C_luaK__goiftrue_386 ' LTI4
 cmps r19,  #7 wcz
 if_a jmp #\C_luaK__goiftrue_391 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__goiftrue_392_L000394-8 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__goiftrue_392_L000394 ' <symbol:392>
 long @C_luaK__goiftrue_390
 long @C_luaK__goiftrue_386
 long @C_luaK__goiftrue_390
 long @C_luaK__goiftrue_390
 long @C_luaK__goiftrue_390
 long @C_luaK__goiftrue_390

' Catalina Code

DAT ' code segment
C_luaK__goiftrue_391
 cmps r19,  #16 wz
 if_z jmp #\C_luaK__goiftrue_389 ' EQI4
 jmp #\@C_luaK__goiftrue_386 ' JUMPV addrg
C_luaK__goiftrue_389
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41q_67ea42ba_negatecondition_L000374
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__goiftrue_387 ' JUMPV addrg
C_luaK__goiftrue_390
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__goiftrue_387 ' JUMPV addrg
C_luaK__goiftrue_386
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41r_67ea42ba_jumponcond_L000376
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_luaK__goiftrue_387
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
' C_luaK__goiftrue_385 ' (symbol refcount = 0)
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
 if_z jmp #\C_luaK__goiffalse_401 ' EQI4
 cmps r19,  #3 wz
 if_z jmp #\C_luaK__goiffalse_401 ' EQI4
 cmps r19, r22 wcz
 if_b jmp #\C_luaK__goiffalse_397 ' LTI4
' C_luaK__goiffalse_402 ' (symbol refcount = 0)
 cmps r19,  #16 wz
 if_z jmp #\C_luaK__goiffalse_400 ' EQI4
 jmp #\@C_luaK__goiffalse_397 ' JUMPV addrg
C_luaK__goiffalse_400
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__goiffalse_398 ' JUMPV addrg
C_luaK__goiffalse_401
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_luaK__goiffalse_398 ' JUMPV addrg
C_luaK__goiffalse_397
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41r_67ea42ba_jumponcond_L000376
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_luaK__goiffalse_398
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
' C_luaK__goiffalse_396 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio41u_67ea42ba_codenot_L000403 ' <symbol:codenot>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r19, r21 ' reg <- INDIRI4 reg
 cmps r19,  #1 wcz
 if_b jmp #\C_sio41u_67ea42ba_codenot_L000403_405 ' LTI4
 cmps r19,  #17 wcz
 if_a jmp #\C_sio41u_67ea42ba_codenot_L000403_405 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sio41u_67ea42ba_codenot_L000403_412_L000414-4 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sio41u_67ea42ba_codenot_L000403_412_L000414 ' <symbol:412>
 long @C_sio41u_67ea42ba_codenot_L000403_408
 long @C_sio41u_67ea42ba_codenot_L000403_409
 long @C_sio41u_67ea42ba_codenot_L000403_408
 long @C_sio41u_67ea42ba_codenot_L000403_409
 long @C_sio41u_67ea42ba_codenot_L000403_409
 long @C_sio41u_67ea42ba_codenot_L000403_409
 long @C_sio41u_67ea42ba_codenot_L000403_409
 long @C_sio41u_67ea42ba_codenot_L000403_411
 long @C_sio41u_67ea42ba_codenot_L000403_405
 long @C_sio41u_67ea42ba_codenot_L000403_405
 long @C_sio41u_67ea42ba_codenot_L000403_405
 long @C_sio41u_67ea42ba_codenot_L000403_405
 long @C_sio41u_67ea42ba_codenot_L000403_405
 long @C_sio41u_67ea42ba_codenot_L000403_405
 long @C_sio41u_67ea42ba_codenot_L000403_405
 long @C_sio41u_67ea42ba_codenot_L000403_410
 long @C_sio41u_67ea42ba_codenot_L000403_411

' Catalina Code

DAT ' code segment
C_sio41u_67ea42ba_codenot_L000403_408
 mov r22, #2 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_sio41u_67ea42ba_codenot_L000403_406 ' JUMPV addrg
C_sio41u_67ea42ba_codenot_L000403_409
 mov r22, #3 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_sio41u_67ea42ba_codenot_L000403_406 ' JUMPV addrg
C_sio41u_67ea42ba_codenot_L000403_410
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41q_67ea42ba_negatecondition_L000374
 add SP, #4 ' CALL addrg
 jmp #\@C_sio41u_67ea42ba_codenot_L000403_406 ' JUMPV addrg
C_sio41u_67ea42ba_codenot_L000403_411
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41g_67ea42ba_discharge2anyreg_L000293
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4p_67ea42ba_freeexp_L000168
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
C_sio41u_67ea42ba_codenot_L000403_405
C_sio41u_67ea42ba_codenot_L000403_406
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
 long @C_sio4d_67ea42ba_removevalues_L000111
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4d_67ea42ba_removevalues_L000111
 add SP, #4 ' CALL addrg
' C_sio41u_67ea42ba_codenot_L000403_404 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio421_67ea42ba_isK_str_L000416 ' <symbol:isKstr>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, #4 ' reg <- coni
 rdlong r20, r2 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 if_nz jmp #\C_sio421_67ea42ba_isK_str_L000416_419 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_sio421_67ea42ba_isK_str_L000416_419 ' NEI4
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #255 wcz
 if_a jmp #\C_sio421_67ea42ba_isK_str_L000416_419 ' GTI4
 shl r22, #3 ' LSHI4 coni
 rdlong r20, r3 ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #68 wz
 if_nz jmp #\C_sio421_67ea42ba_isK_str_L000416_419 ' NEI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_sio421_67ea42ba_isK_str_L000416_420 ' JUMPV addrg
C_sio421_67ea42ba_isK_str_L000416_419
 mov r23, #0 ' reg <- coni
C_sio421_67ea42ba_isK_str_L000416_420
 mov r0, r23 ' CVI, CVU or LOAD
' C_sio421_67ea42ba_isK_str_L000416_417 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaK_isKint

 alignl ' align long
C_luaK__isK_int ' <symbol:luaK_isKint>
 calld PA,#PSHM
 long $d00000 ' save registers
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 if_nz jmp #\C_luaK__isK_int_423 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_luaK__isK_int_423 ' NEI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_luaK__isK_int_424 ' JUMPV addrg
C_luaK__isK_int_423
 mov r23, #0 ' reg <- coni
C_luaK__isK_int_424
 mov r0, r23 ' CVI, CVU or LOAD
' C_luaK__isK_int_421 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sio422_67ea42ba_isC_int_L000425 ' <symbol:isCint>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaK__isK_int ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio422_67ea42ba_isC_int_L000425_428 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmp r22,  #255 wcz 
 if_a jmp #\C_sio422_67ea42ba_isC_int_L000425_428 ' GTU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_sio422_67ea42ba_isC_int_L000425_429 ' JUMPV addrg
C_sio422_67ea42ba_isC_int_L000425_428
 mov r21, #0 ' reg <- coni
C_sio422_67ea42ba_isC_int_L000425_429
 mov r0, r21 ' CVI, CVU or LOAD
' C_sio422_67ea42ba_isC_int_L000425_426 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio423_67ea42ba_isS_C_int_L000430 ' <symbol:isSCint>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaK__isK_int ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio423_67ea42ba_isS_C_int_L000430_433 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio414_67ea42ba_fitsC__L000215 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sio423_67ea42ba_isS_C_int_L000430_433 ' EQI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_sio423_67ea42ba_isS_C_int_L000430_434 ' JUMPV addrg
C_sio423_67ea42ba_isS_C_int_L000430_433
 mov r21, #0 ' reg <- coni
C_sio423_67ea42ba_isS_C_int_L000430_434
 mov r0, r21 ' CVI, CVU or LOAD
' C_sio423_67ea42ba_isS_C_int_L000430_431 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio424_67ea42ba_isS_C_number_L000435 ' <symbol:isSCnumber>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 if_nz jmp #\C_sio424_67ea42ba_isS_C_number_L000435_437 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_sio424_67ea42ba_isS_C_number_L000435_438 ' JUMPV addrg
C_sio424_67ea42ba_isS_C_number_L000435_437
 rdlong r22, r23 ' reg <- INDIRI4 reg
 cmps r22,  #5 wz
 if_nz jmp #\C_sio424_67ea42ba_isS_C_number_L000435_439 ' NEI4
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
 if_z jmp #\C_sio424_67ea42ba_isS_C_number_L000435_439 ' EQI4
 mov r22, #1 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 jmp #\@C_sio424_67ea42ba_isS_C_number_L000435_440 ' JUMPV addrg
C_sio424_67ea42ba_isS_C_number_L000435_439
 mov r0, #0 ' reg <- coni
 jmp #\@C_sio424_67ea42ba_isS_C_number_L000435_436 ' JUMPV addrg
C_sio424_67ea42ba_isS_C_number_L000435_440
C_sio424_67ea42ba_isS_C_number_L000435_438
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 if_nz jmp #\C_sio424_67ea42ba_isS_C_number_L000435_441 ' NEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio414_67ea42ba_fitsC__L000215 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio424_67ea42ba_isS_C_number_L000435_441 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #127 ' ADDI4 coni
 wrlong r22, r21 ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #\@C_sio424_67ea42ba_isS_C_number_L000435_436 ' JUMPV addrg
C_sio424_67ea42ba_isS_C_number_L000435_441
 mov r0, #0 ' reg <- coni
C_sio424_67ea42ba_isS_C_number_L000435_436
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_indexed

 alignl ' align long
C_luaK__indexed ' <symbol:luaK_indexed>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #7 wz
 if_nz jmp #\C_luaK__indexed_444 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41a_67ea42ba_str2K__L000250
 add SP, #4 ' CALL addrg
C_luaK__indexed_444
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_luaK__indexed_446 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio421_67ea42ba_isK_str_L000416
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaK__indexed_446 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__indexed_446
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 if_nz jmp #\C_luaK__indexed_448 ' NEI4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
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
 jmp #\@C_luaK__indexed_449 ' JUMPV addrg
C_luaK__indexed_448
 rdlong r22, r21 ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 if_nz jmp #\C_luaK__indexed_451 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r17, r22 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_luaK__indexed_452 ' JUMPV addrg
C_luaK__indexed_451
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRI4 reg
C_luaK__indexed_452
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio421_67ea42ba_isK_str_L000416
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__indexed_453 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrword r20, r22 ' ASGNI2 reg reg
 mov r22, #15 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__indexed_454 ' JUMPV addrg
C_luaK__indexed_453
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio422_67ea42ba_isC_int_L000425 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__indexed_455 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrword r20, r22 ' ASGNI2 reg reg
 mov r22, #14 ' reg <- coni
 wrlong r22, r21 ' ASGNI4 reg reg
 jmp #\@C_luaK__indexed_456 ' JUMPV addrg
C_luaK__indexed_455
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
C_luaK__indexed_456
C_luaK__indexed_454
C_luaK__indexed_449
' C_luaK__indexed_443 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sio425_67ea42ba_validop_L000457 ' <symbol:validop>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r23,  #3 wcz
 if_b jmp #\C_sio425_67ea42ba_validop_L000457_459 ' LTI4
 cmps r23,  #13 wcz
 if_a jmp #\C_sio425_67ea42ba_validop_L000457_459 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_sio425_67ea42ba_validop_L000457_474_L000476-12 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sio425_67ea42ba_validop_L000457_474_L000476 ' <symbol:474>
 long @C_sio425_67ea42ba_validop_L000457_465
 long @C_sio425_67ea42ba_validop_L000457_459
 long @C_sio425_67ea42ba_validop_L000457_465
 long @C_sio425_67ea42ba_validop_L000457_465
 long @C_sio425_67ea42ba_validop_L000457_461
 long @C_sio425_67ea42ba_validop_L000457_461
 long @C_sio425_67ea42ba_validop_L000457_461
 long @C_sio425_67ea42ba_validop_L000457_461
 long @C_sio425_67ea42ba_validop_L000457_461
 long @C_sio425_67ea42ba_validop_L000457_459
 long @C_sio425_67ea42ba_validop_L000457_461

' Catalina Code

DAT ' code segment
C_sio425_67ea42ba_validop_L000457_461
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
 if_z jmp #\C_sio425_67ea42ba_validop_L000457_463 ' EQI4
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
 if_z jmp #\C_sio425_67ea42ba_validop_L000457_463 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_sio425_67ea42ba_validop_L000457_464 ' JUMPV addrg
C_sio425_67ea42ba_validop_L000457_463
 mov r17, #0 ' reg <- coni
C_sio425_67ea42ba_validop_L000457_464
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sio425_67ea42ba_validop_L000457_458 ' JUMPV addrg
C_sio425_67ea42ba_validop_L000457_465
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 if_nz jmp #\C_sio425_67ea42ba_validop_L000457_470 ' NEI4
 rdlong r0, r19 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_sio425_67ea42ba_validop_L000457_471 ' JUMPV addrg
C_sio425_67ea42ba_validop_L000457_470
 rdlong r15, r19 ' reg <- INDIRF4 reg
C_sio425_67ea42ba_validop_L000457_471
 mov r22, ##@C_sio425_67ea42ba_validop_L000457_472_L000473
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_sio425_67ea42ba_validop_L000457_468 ' EQF4
 mov r17, #1 ' reg <- coni
 jmp #\@C_sio425_67ea42ba_validop_L000457_469 ' JUMPV addrg
C_sio425_67ea42ba_validop_L000457_468
 mov r17, #0 ' reg <- coni
C_sio425_67ea42ba_validop_L000457_469
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #\@C_sio425_67ea42ba_validop_L000457_458 ' JUMPV addrg
C_sio425_67ea42ba_validop_L000457_459
 mov r0, #1 ' reg <- coni
C_sio425_67ea42ba_validop_L000457_458
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio429_67ea42ba_constfolding_L000478 ' <symbol:constfolding>
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
 long @C_sio41_67ea42ba_tonumeral_L000025
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sio429_67ea42ba_constfolding_L000478_483 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41_67ea42ba_tonumeral_L000025
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sio429_67ea42ba_constfolding_L000478_483 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio425_67ea42ba_validop_L000457
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sio429_67ea42ba_constfolding_L000478_480 ' NEI4
C_sio429_67ea42ba_constfolding_L000478_483
 mov r0, #0 ' reg <- coni
 jmp #\@C_sio429_67ea42ba_constfolding_L000478_479 ' JUMPV addrg
C_sio429_67ea42ba_constfolding_L000478_480
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
 if_nz jmp #\C_sio429_67ea42ba_constfolding_L000478_484 ' NEI4
 mov r22, #6 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #\@C_sio429_67ea42ba_constfolding_L000478_485 ' JUMPV addrg
C_sio429_67ea42ba_constfolding_L000478_484
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRF4 reg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sio429_67ea42ba_constfolding_L000478_489 ' NEF4
 mov r22, ##@C_sio425_67ea42ba_validop_L000457_472_L000473
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_sio429_67ea42ba_constfolding_L000478_487 ' NEF4
C_sio429_67ea42ba_constfolding_L000478_489
 mov r0, #0 ' reg <- coni
 jmp #\@C_sio429_67ea42ba_constfolding_L000478_479 ' JUMPV addrg
C_sio429_67ea42ba_constfolding_L000478_487
 mov r22, #5 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 wrlong r15, r22 ' ASGNF4 reg reg
C_sio429_67ea42ba_constfolding_L000478_485
 mov r0, #1 ' reg <- coni
C_sio429_67ea42ba_constfolding_L000478_479
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42a_67ea42ba_codeunexpval_L000490 ' <symbol:codeunexpval>
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
 long @C_sio4p_67ea42ba_freeexp_L000168
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
' C_sio42a_67ea42ba_codeunexpval_L000490_491 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42b_67ea42ba_finishbinexpval_L000492 ' <symbol:finishbinexpval>
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
 long @C_sio4q_67ea42ba_freeexps_L000172
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
' C_sio42b_67ea42ba_finishbinexpval_L000492_493 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42c_67ea42ba_codebinexpval_L000494 ' <symbol:codebinexpval>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $ea0000 ' save registers
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
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r23
 subs r22, #34 ' SUBI4 coni
 mov r2, r22
 adds r2, #6 ' ADDI4 coni
 mov r3, #46 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, #0 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov RI, r19
 wrlong RI, --PTRA ' stack ARG
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sio42b_67ea42ba_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
' C_sio42c_67ea42ba_codebinexpval_L000494_495 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42d_67ea42ba_codebini_L000496 ' <symbol:codebini>
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
 long @C_sio42b_67ea42ba_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
' C_sio42d_67ea42ba_codebini_L000496_497 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42e_67ea42ba_finishbinexpneg_L000498 ' <symbol:finishbinexpneg>
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
 long @C_luaK__isK_int ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sio42e_67ea42ba_finishbinexpneg_L000498_500 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sio42e_67ea42ba_finishbinexpneg_L000498_499 ' JUMPV addrg
C_sio42e_67ea42ba_finishbinexpneg_L000498_500
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
 long @C_sio414_67ea42ba_fitsC__L000215 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42e_67ea42ba_finishbinexpneg_L000498_504 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 neg r2, r22 ' NEGI4
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio414_67ea42ba_fitsC__L000215 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sio42e_67ea42ba_finishbinexpneg_L000498_502 ' NEI4
C_sio42e_67ea42ba_finishbinexpneg_L000498_504
 mov r0, #0 ' reg <- coni
 jmp #\@C_sio42e_67ea42ba_finishbinexpneg_L000498_499 ' JUMPV addrg
C_sio42e_67ea42ba_finishbinexpneg_L000498_502
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
 long @C_sio42b_67ea42ba_finishbinexpval_L000492
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
C_sio42e_67ea42ba_finishbinexpneg_L000498_499
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42f_67ea42ba_swapexps_L000505 ' <symbol:swapexps>
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
' C_sio42f_67ea42ba_swapexps_L000505_506 ' (symbol refcount = 0)
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42g_67ea42ba_codearith_L000507 ' <symbol:codearith>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #6 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41_67ea42ba_tonumeral_L000025
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 if_z jmp #\C_sio42g_67ea42ba_codearith_L000507_509 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41k_67ea42ba_luaK__exp2K__L000334
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42g_67ea42ba_codearith_L000507_509 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #22 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
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
 long @C_sio42b_67ea42ba_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
 jmp #\@C_sio42g_67ea42ba_codearith_L000507_510 ' JUMPV addrg
C_sio42g_67ea42ba_codearith_L000507_509
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #34 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r19,  #0 wz
 if_z jmp #\C_sio42g_67ea42ba_codearith_L000507_511 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42f_67ea42ba_swapexps_L000505
 add SP, #4 ' CALL addrg
C_sio42g_67ea42ba_codearith_L000507_511
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sio42c_67ea42ba_codebinexpval_L000494
 add SP, #16 ' CALL addrg
C_sio42g_67ea42ba_codearith_L000507_510
' C_sio42g_67ea42ba_codearith_L000507_508 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42h_67ea42ba_codecommutative_L000513 ' <symbol:codecommutative>
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
 long @C_sio41_67ea42ba_tonumeral_L000025
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42h_67ea42ba_codecommutative_L000513_515 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42f_67ea42ba_swapexps_L000505
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sio42h_67ea42ba_codecommutative_L000513_515
 cmps r23,  #0 wz
 if_nz jmp #\C_sio42h_67ea42ba_codecommutative_L000513_517 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio423_67ea42ba_isS_C_int_L000430 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42h_67ea42ba_codecommutative_L000513_517 ' EQI4
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
 long @C_sio42d_67ea42ba_codebini_L000496
 add SP, #24 ' CALL addrg
 jmp #\@C_sio42h_67ea42ba_codecommutative_L000513_518 ' JUMPV addrg
C_sio42h_67ea42ba_codecommutative_L000513_517
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
 long @C_sio42g_67ea42ba_codearith_L000507
 add SP, #20 ' CALL addrg
C_sio42h_67ea42ba_codecommutative_L000513_518
' C_sio42h_67ea42ba_codecommutative_L000513_514 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42i_67ea42ba_codebitwise_L000519 ' <symbol:codebitwise>
 calld PA,#NEWF
 sub SP, #12
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
 if_nz jmp #\C_sio42i_67ea42ba_codebitwise_L000519_521 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2R_K_
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42i_67ea42ba_codebitwise_L000519_521 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42f_67ea42ba_swapexps_L000505
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_sio42i_67ea42ba_codebitwise_L000519_522 ' JUMPV addrg
C_sio42i_67ea42ba_codebitwise_L000519_521
 rdlong r22, r19 ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 if_nz jmp #\C_sio42i_67ea42ba_codebitwise_L000519_525 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2R_K_
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sio42i_67ea42ba_codebitwise_L000519_523 ' NEI4
C_sio42i_67ea42ba_codebitwise_L000519_525
 mov r22, r23
 adds r22, #34 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sio42c_67ea42ba_codebinexpval_L000494
 add SP, #16 ' CALL addrg
 jmp #\@C_sio42i_67ea42ba_codebitwise_L000519_520 ' JUMPV addrg
C_sio42i_67ea42ba_codebitwise_L000519_523
C_sio42i_67ea42ba_codebitwise_L000519_522
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #22 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r23
 adds r2, #6 ' ADDI4 coni
 mov r3, #48 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long -16 ' stack ARG INDIR ADDRLi
 calld PA,#PSHF
 long -12 ' stack ARG INDIR ADDRLi
 mov RI, r19
 wrlong RI, --PTRA ' stack ARG
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sio42b_67ea42ba_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
C_sio42i_67ea42ba_codebitwise_L000519_520
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42j_67ea42ba_codeorder_L000526 ' <symbol:codeorder>
 calld PA,#NEWF
 sub SP, #16
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
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio424_67ea42ba_isS_C_number_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42j_67ea42ba_codeorder_L000526_528 ' EQI4
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
 mov r22, r21
 subs r22, #58 ' SUBI4 coni
 mov r21, r22
 adds r21, #62 ' ADDI4 coni
 jmp #\@C_sio42j_67ea42ba_codeorder_L000526_529 ' JUMPV addrg
C_sio42j_67ea42ba_codeorder_L000526_528
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio424_67ea42ba_isS_C_number_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42j_67ea42ba_codeorder_L000526_530 ' EQI4
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
 cmps r21,  #58 wz
 if_nz jmp #\C_sio42j_67ea42ba_codeorder_L000526_533 ' NEI4
 mov r15, #64 ' reg <- coni
 jmp #\@C_sio42j_67ea42ba_codeorder_L000526_534 ' JUMPV addrg
C_sio42j_67ea42ba_codeorder_L000526_533
 mov r15, #65 ' reg <- coni
C_sio42j_67ea42ba_codeorder_L000526_534
 mov r21, r15 ' CVI, CVU or LOAD
 jmp #\@C_sio42j_67ea42ba_codeorder_L000526_531 ' JUMPV addrg
C_sio42j_67ea42ba_codeorder_L000526_530
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
C_sio42j_67ea42ba_codeorder_L000526_531
C_sio42j_67ea42ba_codeorder_L000526_529
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4q_67ea42ba_freeexps_L000172
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
 mov RI, r21
 wrlong RI, --PTRA ' stack ARG
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sio4a_67ea42ba_condjump_L000098
 add SP, #20 ' CALL addrg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #16 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
' C_sio42j_67ea42ba_codeorder_L000526_527 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42k_67ea42ba_codeeq_L000535 ' <symbol:codeeq>
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
 if_z jmp #\C_sio42k_67ea42ba_codeeq_L000535_537 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42f_67ea42ba_swapexps_L000505
 add SP, #4 ' CALL addrg
C_sio42k_67ea42ba_codeeq_L000535_537
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
 long @C_sio424_67ea42ba_isS_C_number_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42k_67ea42ba_codeeq_L000535_539 ' EQI4
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
 jmp #\@C_sio42k_67ea42ba_codeeq_L000535_540 ' JUMPV addrg
C_sio42k_67ea42ba_codeeq_L000535_539
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2R_K_
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_sio42k_67ea42ba_codeeq_L000535_541 ' EQI4
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
 jmp #\@C_sio42k_67ea42ba_codeeq_L000535_542 ' JUMPV addrg
C_sio42k_67ea42ba_codeeq_L000535_541
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
C_sio42k_67ea42ba_codeeq_L000535_542
C_sio42k_67ea42ba_codeeq_L000535_540
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4q_67ea42ba_freeexps_L000172
 add SP, #8 ' CALL addrg
 cmps r21,  #13 wz
 if_nz jmp #\C_sio42k_67ea42ba_codeeq_L000535_544 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_sio42k_67ea42ba_codeeq_L000535_545 ' JUMPV addrg
C_sio42k_67ea42ba_codeeq_L000535_544
 mov r15, #0 ' reg <- coni
C_sio42k_67ea42ba_codeeq_L000535_545
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
 long @C_sio4a_67ea42ba_condjump_L000098
 add SP, #20 ' CALL addrg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, #16 ' reg <- coni
 wrlong r22, r19 ' ASGNI4 reg reg
' C_sio42k_67ea42ba_codeeq_L000535_536 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__prefix_ef_L000548 ' <symbol:ef>
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
 if_b jmp #\C_luaK__prefix_549 ' LTI4
 cmps r15,  #3 wcz
 if_a jmp #\C_luaK__prefix_549 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__prefix_557_L000559 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__prefix_557_L000559 ' <symbol:557>
 long @C_luaK__prefix_552
 long @C_luaK__prefix_552
 long @C_luaK__prefix_556
 long @C_luaK__prefix_555

' Catalina Code

DAT ' code segment
C_luaK__prefix_552
 mov r2, ##@C_luaK__prefix_ef_L000548 ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #12 ' ADDI4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio429_67ea42ba_constfolding_L000478
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__prefix_553 ' EQI4
 jmp #\@C_luaK__prefix_550 ' JUMPV addrg
C_luaK__prefix_553
C_luaK__prefix_555
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #49 ' ADDI4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42a_67ea42ba_codeunexpval_L000490
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__prefix_550 ' JUMPV addrg
C_luaK__prefix_556
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41u_67ea42ba_codenot_L000403
 add SP, #4 ' CALL addrg
C_luaK__prefix_549
C_luaK__prefix_550
' C_luaK__prefix_546 ' (symbol refcount = 0)
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
 if_b jmp #\C_luaK__infix_561 ' LTI4
 cmps r17,  #20 wcz
 if_a jmp #\C_luaK__infix_561 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__infix_576_L000578 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__infix_576_L000578 ' <symbol:576>
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_567
 long @C_luaK__infix_566
 long @C_luaK__infix_570
 long @C_luaK__infix_573
 long @C_luaK__infix_573
 long @C_luaK__infix_570
 long @C_luaK__infix_573
 long @C_luaK__infix_573
 long @C_luaK__infix_564
 long @C_luaK__infix_565

' Catalina Code

DAT ' code segment
C_luaK__infix_564
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__goiftrue
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_565
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__goiffalse
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_566
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_567
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41_67ea42ba_tonumeral_L000025
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaK__infix_562 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_570
 mov r2, ##0 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio41_67ea42ba_tonumeral_L000025
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaK__infix_562 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2R_K_
 add SP, #4 ' CALL addrg
 jmp #\@C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_573
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio424_67ea42ba_isS_C_number_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_luaK__infix_562 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__infix_561
C_luaK__infix_562
' C_luaK__infix_560 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42q_67ea42ba_codeconcat_L000579 ' <symbol:codeconcat>
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
 long @C_sio45_67ea42ba_previousinstruction_L000056 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 rdlong r22, r15 ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #53 wz
 if_nz jmp #\C_sio42q_67ea42ba_codeconcat_L000579_581 ' NEI4
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
 long @C_sio4p_67ea42ba_freeexp_L000168
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
 jmp #\@C_sio42q_67ea42ba_codeconcat_L000579_582 ' JUMPV addrg
C_sio42q_67ea42ba_codeconcat_L000579_581
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
 long @C_sio4p_67ea42ba_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
C_sio42q_67ea42ba_codeconcat_L000579_582
' C_sio42q_67ea42ba_codeconcat_L000579_580 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaK_posfix

 alignl ' align long
C_luaK__posfix ' <symbol:luaK_posfix>
 calld PA,#NEWF
 sub SP, #4
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
 if_a jmp #\C_luaK__posfix_584 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio429_67ea42ba_constfolding_L000478
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_584 ' EQI4
 jmp #\@C_luaK__posfix_583 ' JUMPV addrg
C_luaK__posfix_584
 mov r15, r23 ' CVI, CVU or LOAD
 cmps r15,  #0 wcz
 if_b jmp #\C_luaK__posfix_586 ' LTI4
 cmps r15,  #20 wcz
 if_a jmp #\C_luaK__posfix_586 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__posfix_609_L000611 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__posfix_609_L000611 ' <symbol:609>
 long @C_luaK__posfix_592
 long @C_luaK__posfix_593
 long @C_luaK__posfix_592
 long @C_luaK__posfix_596
 long @C_luaK__posfix_596
 long @C_luaK__posfix_596
 long @C_luaK__posfix_596
 long @C_luaK__posfix_597
 long @C_luaK__posfix_597
 long @C_luaK__posfix_597
 long @C_luaK__posfix_598
 long @C_luaK__posfix_603
 long @C_luaK__posfix_591
 long @C_luaK__posfix_606
 long @C_luaK__posfix_607
 long @C_luaK__posfix_607
 long @C_luaK__posfix_606
 long @C_luaK__posfix_608
 long @C_luaK__posfix_608
 long @C_luaK__posfix_589
 long @C_luaK__posfix_590

' Catalina Code

DAT ' code segment
C_luaK__posfix_589
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
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_590
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
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_591
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
 long @C_sio42q_67ea42ba_codeconcat_L000579
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_592
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
 long @C_sio42h_67ea42ba_codecommutative_L000513
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_593
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
 long @C_sio42e_67ea42ba_finishbinexpneg_L000498
 add SP, #20 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_594 ' EQI4
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_594
C_luaK__posfix_596
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
 long @C_sio42g_67ea42ba_codearith_L000507
 add SP, #20 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_597
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
 long @C_sio42i_67ea42ba_codebitwise_L000519
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_598
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio423_67ea42ba_isS_C_int_L000430 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_599 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42f_67ea42ba_swapexps_L000505
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
 long @C_sio42d_67ea42ba_codebini_L000496
 add SP, #24 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_599
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
 long @C_sio42e_67ea42ba_finishbinexpneg_L000498
 add SP, #20 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_601 ' EQI4
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_601
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, #44 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sio42c_67ea42ba_codebinexpval_L000494
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_603
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sio423_67ea42ba_isS_C_int_L000430 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_luaK__posfix_604 ' EQI4
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
 long @C_sio42d_67ea42ba_codebini_L000496
 add SP, #24 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_604
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, #45 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 calld PA,#PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_sio42c_67ea42ba_codebinexpval_L000494
 add SP, #16 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_606
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42k_67ea42ba_codeeq_L000535
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_607
 mov r22, r23
 subs r22, #13 ' SUBI4 coni
 adds r22, #57 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42j_67ea42ba_codeorder_L000526
 add SP, #12 ' CALL addrg
 jmp #\@C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_608
 mov r22, r23
 subs r22, #16 ' SUBI4 coni
 adds r22, #57 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42f_67ea42ba_swapexps_L000505
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42j_67ea42ba_codeorder_L000526
 add SP, #12 ' CALL addrg
C_luaK__posfix_586
C_luaK__posfix_587
C_luaK__posfix_583
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
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
 long @C_sio4i_67ea42ba_removelastlineinfo_L000135 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio4f_67ea42ba_savelineinfo_L000126
 add SP, #8 ' CALL addrg
' C_luaK__fixline_612 ' (symbol refcount = 0)
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
 if_z jmp #\C_luaK__settablesize_615 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDI4 coni
 jmp #\@C_luaK__settablesize_616 ' JUMPV addrg
C_luaK__settablesize_615
 mov r11, #0 ' reg <- coni
C_luaK__settablesize_616
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
 if_be jmp #\C_luaK__settablesize_618 ' LEI4
 mov r9, #1 ' reg <- coni
 jmp #\@C_luaK__settablesize_619 ' JUMPV addrg
C_luaK__settablesize_618
 mov r9, #0 ' reg <- coni
C_luaK__settablesize_619
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
' C_luaK__settablesize_613 ' (symbol refcount = 0)
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
 if_nz jmp #\C_luaK__setlist_621 ' NEI4
 mov r17, #0 ' reg <- coni
C_luaK__setlist_621
 cmps r19,  #255 wcz
 if_a jmp #\C_luaK__setlist_623 ' GTI4
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
 jmp #\@C_luaK__setlist_624 ' JUMPV addrg
C_luaK__setlist_623
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
 long @C_sio4k_67ea42ba_codeextraarg_L000146
 add SP, #4 ' CALL addrg
C_luaK__setlist_624
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, r21
 adds r20, #1 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaK__setlist_620 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sio42t_67ea42ba_finaltarget_L000625 ' <symbol:finaltarget>
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, #0 ' reg <- coni
C_sio42t_67ea42ba_finaltarget_L000625_627
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 adds r22, r3 ' ADDI/P (1)
 rdlong r21, r22 ' reg <- INDIRU4 reg
 mov r22, r21
 and r22, #127 ' BANDU4 coni
 cmps r22,  #56 wz
 if_z jmp #\C_sio42t_67ea42ba_finaltarget_L000625_631 ' EQI4
 jmp #\@C_sio42t_67ea42ba_finaltarget_L000625_629 ' JUMPV addrg
C_sio42t_67ea42ba_finaltarget_L000625_631
 mov r22, r21
 shr r22, #7 ' RSHU4 coni
 mov r20, ##$1ffffff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##16777215 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #1 ' ADDI4 coni
 adds r2, r22 ' ADDI/P (1)
' C_sio42t_67ea42ba_finaltarget_L000625_628 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #100 wcz
 if_b jmp #\C_sio42t_67ea42ba_finaltarget_L000625_627 ' LTI4
C_sio42t_67ea42ba_finaltarget_L000625_629
 mov r0, r2 ' CVI, CVU or LOAD
' C_sio42t_67ea42ba_finaltarget_L000625_626 ' (symbol refcount = 0)
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
 jmp #\@C_luaK__finish_637 ' JUMPV addrg
C_luaK__finish_634
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
 if_z jmp #\C_luaK__finish_649 ' EQI4
 cmps r15, r22 wcz
 if_b jmp #\C_luaK__finish_639 ' LTI4
' C_luaK__finish_650 ' (symbol refcount = 0)
 cmps r15,  #69 wcz
 if_b jmp #\C_luaK__finish_639 ' LTI4
 cmps r15,  #72 wcz
 if_a jmp #\C_luaK__finish_639 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_luaK__finish_651_L000653-276 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaK__finish_651_L000653 ' <symbol:651>
 long @C_luaK__finish_644
 long @C_luaK__finish_644
 long @C_luaK__finish_641
 long @C_luaK__finish_641

' Catalina Code

DAT ' code segment
C_luaK__finish_641
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #54 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaK__finish_642 ' NEI4
 mov r20, r19
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_luaK__finish_642 ' NEI4
 jmp #\@C_luaK__finish_639 ' JUMPV addrg
C_luaK__finish_642
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff80 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 or r22, #70 ' BORU4 coni
 wrlong r22, r17 ' ASGNU4 reg reg
C_luaK__finish_644
 mov r22, r23
 adds r22, #54 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaK__finish_645 ' EQI4
 rdlong r22, r17 ' reg <- INDIRU4 reg
 mov r20, ##$ffff7fff ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, ##$8000 ' reg <- con
 or r22, r20 ' BORI/U (1)
 wrlong r22, r17 ' ASGNU4 reg reg
C_luaK__finish_645
 mov r22, r19
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaK__finish_639 ' EQI4
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
 jmp #\@C_luaK__finish_639 ' JUMPV addrg
C_luaK__finish_649
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sio42t_67ea42ba_finaltarget_L000625
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
 long @C_sio48_67ea42ba_fixjump_L000077
 add SP, #8 ' CALL addrg
C_luaK__finish_639
' C_luaK__finish_635 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_luaK__finish_637
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 if_b jmp #\C_luaK__finish_634 ' LTI4
' C_luaK__finish_633 ' (symbol refcount = 0)
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
C_sio425_67ea42ba_validop_L000457_472_L000473 ' <symbol:472>
 long $0 ' float

 alignl ' align long
C_sio4v_67ea42ba_luaK__numberK__L000197_201_L000202 ' <symbol:201>
 long $3f800000 ' float

 alignl ' align long
C_sio4r_67ea42ba_addk_L000180_186_L000187 ' <symbol:186>
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
C_luaK__checkstack_157_L000158 ' <symbol:157>
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
C_sio4f_67ea42ba_savelineinfo_L000126_133_L000134 ' <symbol:133>
 byte 111
 byte 112
 byte 99
 byte 111
 byte 100
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sio4f_67ea42ba_savelineinfo_L000126_131_L000132 ' <symbol:131>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sio48_67ea42ba_fixjump_L000077_82_L000083 ' <symbol:82>
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
