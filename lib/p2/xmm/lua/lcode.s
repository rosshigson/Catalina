' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export luaK_semerror

 alignl ' align long
C_luaK__semerror ' <symbol:luaK_semerror>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
' C_luaK__semerror_24 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1_6709f8b0_tonumeral_L000025 ' <symbol:tonumeral>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sejo1_6709f8b0_tonumeral_L000025_27 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sejo1_6709f8b0_tonumeral_L000025_26 ' JUMPV addrg
C_sejo1_6709f8b0_tonumeral_L000025_27
 mov RI, r3
 jmp #RLNG
 mov r23, BC ' reg <- INDIRI4 reg
 cmps r23,  #5 wz
 jmp #BR_Z
 long @C_sejo1_6709f8b0_tonumeral_L000025_35 ' EQI4
 cmps r23,  #6 wz
 jmp #BR_Z
 long @C_sejo1_6709f8b0_tonumeral_L000025_32 ' EQI4
 jmp #JMPA
 long @C_sejo1_6709f8b0_tonumeral_L000025_29 ' JUMPV addrg
C_sejo1_6709f8b0_tonumeral_L000025_32
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sejo1_6709f8b0_tonumeral_L000025_33 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sejo1_6709f8b0_tonumeral_L000025_33
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo1_6709f8b0_tonumeral_L000025_26 ' JUMPV addrg
C_sejo1_6709f8b0_tonumeral_L000025_35
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sejo1_6709f8b0_tonumeral_L000025_36 ' EQU4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r3
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRF4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sejo1_6709f8b0_tonumeral_L000025_36
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo1_6709f8b0_tonumeral_L000025_26 ' JUMPV addrg
C_sejo1_6709f8b0_tonumeral_L000025_29
 mov r0, #0 ' reg <- coni
C_sejo1_6709f8b0_tonumeral_L000025_26
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2_6709f8b0_const2val_L000038 ' <symbol:const2val>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #4 ' LSHI4 coni
 mov r20, r3
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_sejo2_6709f8b0_const2val_L000038_39 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaK_exp2const

 alignl ' align long
C_luaK__exp2const ' <symbol:luaK_exp2const>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaK__exp2const_41 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_41
 mov RI, r21
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 cmps r17,  #1 wz,wc
 jmp #BR_B
 long @C_luaK__exp2const_43 ' LTI4
 cmps r17,  #7 wz,wc
 jmp #BR_A
 long @C_luaK__exp2const_51 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaK__exp2const_52_L000054-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 jmp #BR_Z
 long @C_luaK__exp2const_50 ' EQI4
 jmp #JMPA
 long @C_luaK__exp2const_43 ' JUMPV addrg
C_luaK__exp2const_46
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_47
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_48
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_49
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_50
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2_6709f8b0_const2val_L000038
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaK__exp2const_40 ' JUMPV addrg
C_luaK__exp2const_43
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1_6709f8b0_tonumeral_L000025
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaK__exp2const_40
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sejo5_6709f8b0_previousinstruction_L000056_invalidinstr_L000059 ' <symbol:invalidinstruction>
 long $ffffffff

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sejo5_6709f8b0_previousinstruction_L000056 ' <symbol:previousinstruction>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_sejo5_6709f8b0_previousinstruction_L000056_60 ' LEI4
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 subs r22, #4 ' SUBI4 coni
 mov RI, r2
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_sejo5_6709f8b0_previousinstruction_L000056_57 ' JUMPV addrg
C_sejo5_6709f8b0_previousinstruction_L000056_60
 jmp #LODL
 long @C_sejo5_6709f8b0_previousinstruction_L000056_invalidinstr_L000059
 mov r0, RI ' reg <- addrg
C_sejo5_6709f8b0_previousinstruction_L000056_57
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaK_nil

 alignl ' align long
C_luaK__nil ' <symbol:luaK_nil>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
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
 jmp #CALA
 long @C_sejo5_6709f8b0_previousinstruction_L000056 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_luaK__nil_63 ' NEI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 adds r22, r15 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r15, r21 wz,wc
 jmp #BR_A
 long @C_luaK__nil_68 ' GTI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 cmps r21, r22 wz,wc
 jmp #BRBE
 long @C_luaK__nil_67 ' LEI4
C_luaK__nil_68
 cmps r21, r15 wz,wc
 jmp #BR_A
 long @C_luaK__nil_65 ' GTI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 cmps r15, r22 wz,wc
 jmp #BR_A
 long @C_luaK__nil_65 ' GTI4
C_luaK__nil_67
 cmps r15, r21 wz,wc
 jmp #BRAE
 long @C_luaK__nil_69 ' GEI4
 mov r21, r15 ' CVI, CVU or LOAD
C_luaK__nil_69
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_luaK__nil_71 ' LEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaK__nil_71
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff807f
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r21 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 jmp #LODL
 long 32640
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ff00ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 subs r20, r21 ' SUBI/P (1)
 shl r20, #16 ' LSHU4 coni
 jmp #LODL
 long $ff0000
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_luaK__nil_62 ' JUMPV addrg
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
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
C_luaK__nil_62
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo7_6709f8b0_getjump_L000073 ' <symbol:getjump>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long 16777215
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_sejo7_6709f8b0_getjump_L000073_75 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sejo7_6709f8b0_getjump_L000073_74 ' JUMPV addrg
C_sejo7_6709f8b0_getjump_L000073_75
 mov r22, r2
 adds r22, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
C_sejo7_6709f8b0_getjump_L000073_74
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo8_6709f8b0_fixjump_L000077 ' <symbol:fixjump>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #1 ' ADDI4 coni
 mov r17, r19 ' SUBI/P
 subs r17, r22 ' SUBI/P (3)
 jmp #LODL
 long -16777215
 mov r22, RI ' reg <- con
 cmps r22, r17 wz,wc
 jmp #BR_A
 long @C_sejo8_6709f8b0_fixjump_L000077_81 ' GTI4
 jmp #LODL
 long 16777216
 mov r22, RI ' reg <- con
 cmps r17, r22 wz,wc
 jmp #BRBE
 long @C_sejo8_6709f8b0_fixjump_L000077_79 ' LEI4
C_sejo8_6709f8b0_fixjump_L000077_81
 jmp #LODL
 long @C_sejo8_6709f8b0_fixjump_L000077_82_L000083
 mov r2, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_sejo8_6709f8b0_fixjump_L000077_79
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 jmp #LODL
 long 16777215
 mov r20, RI ' reg <- con
 adds r20, r17 ' ADDI/P (2)
 shl r20, #7 ' LSHU4 coni
 jmp #LODL
 long $ffffff80
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r15
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
' C_sejo8_6709f8b0_fixjump_L000077_78 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_concat

 alignl ' align long
C_luaK__concat ' <symbol:luaK_concat>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_luaK__concat_85 ' NEI4
 jmp #JMPA
 long @C_luaK__concat_84 ' JUMPV addrg
C_luaK__concat_85
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaK__concat_87 ' NEI4
 mov RI, r21
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__concat_88 ' JUMPV addrg
C_luaK__concat_87
 mov RI, r21
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaK__concat_90 ' JUMPV addrg
C_luaK__concat_89
 mov r17, r15 ' CVI, CVU or LOAD
C_luaK__concat_90
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo7_6709f8b0_getjump_L000073
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_luaK__concat_89 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo8_6709f8b0_fixjump_L000077
 add SP, #8 ' CALL addrg
C_luaK__concat_88
C_luaK__concat_84
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_jump

 alignl ' align long
C_luaK__jump ' <symbol:luaK_jump>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, #56 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo_6709f8b0_codesJ__L000023
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaK__jump_92 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_ret

 alignl ' align long
C_luaK__ret ' <symbol:luaK_ret>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_luaK__ret_96 ' EQI4
 cmps r19,  #1 wz
 jmp #BR_Z
 long @C_luaK__ret_97 ' EQI4
 jmp #JMPA
 long @C_luaK__ret_94 ' JUMPV addrg
C_luaK__ret_96
 mov r22, #71 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_luaK__ret_95 ' JUMPV addrg
C_luaK__ret_97
 mov r22, #72 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_luaK__ret_95 ' JUMPV addrg
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
 jmp #PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
' C_luaK__ret_93 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejoa_6709f8b0_condjump_L000098 ' <symbol:condjump>
 jmp #NEWF
 jmp #PSHM
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
 jmp #PSHF
 long 12 ' stack ARG INDIR ADDRFi
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejoa_6709f8b0_condjump_L000098_99 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_getlabel

 alignl ' align long
C_luaK__getlabel ' <symbol:luaK_getlabel>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_luaK__getlabel_100 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sejob_6709f8b0_getjumpcontrol_L000101 ' <symbol:getjumpcontrol>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 cmps r2,  #1 wz,wc
 jmp #BR_B
 long @C_sejob_6709f8b0_getjumpcontrol_L000101_103 ' LTI4
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 jmp #LODL
 long @C_luaP__opmodes
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sejob_6709f8b0_getjumpcontrol_L000101_103 ' EQI4
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 mov r0, r23 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #JMPA
 long @C_sejob_6709f8b0_getjumpcontrol_L000101_102 ' JUMPV addrg
C_sejob_6709f8b0_getjumpcontrol_L000101_103
 mov r0, r23 ' CVI, CVU or LOAD
C_sejob_6709f8b0_getjumpcontrol_L000101_102
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sejoc_6709f8b0_patchtestreg_L000105 ' <symbol:patchtestreg>
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
 long @C_sejob_6709f8b0_getjumpcontrol_L000101
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #67 wz
 jmp #BR_Z
 long @C_sejoc_6709f8b0_patchtestreg_L000105_107 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sejoc_6709f8b0_patchtestreg_L000105_106 ' JUMPV addrg
C_sejoc_6709f8b0_patchtestreg_L000105_107
 cmps r19,  #255 wz
 jmp #BR_Z
 long @C_sejoc_6709f8b0_patchtestreg_L000105_109 ' EQI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sejoc_6709f8b0_patchtestreg_L000105_109 ' EQI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff807f
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 jmp #LODL
 long 32640
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sejoc_6709f8b0_patchtestreg_L000105_110 ' JUMPV addrg
C_sejoc_6709f8b0_patchtestreg_L000105_109
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
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
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_sejoc_6709f8b0_patchtestreg_L000105_110
 mov r0, #1 ' reg <- coni
C_sejoc_6709f8b0_patchtestreg_L000105_106
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejod_6709f8b0_removevalues_L000111 ' <symbol:removevalues>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sejod_6709f8b0_removevalues_L000111_116 ' JUMPV addrg
C_sejod_6709f8b0_removevalues_L000111_113
 mov r2, #255 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejoc_6709f8b0_patchtestreg_L000105
 add SP, #8 ' CALL addrg
' C_sejod_6709f8b0_removevalues_L000111_114 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo7_6709f8b0_getjump_L000073
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_sejod_6709f8b0_removevalues_L000111_116
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_sejod_6709f8b0_removevalues_L000111_113 ' NEI4
' C_sejod_6709f8b0_removevalues_L000111_112 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejoe_6709f8b0_patchlistaux_L000117 ' <symbol:patchlistaux>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sejoe_6709f8b0_patchlistaux_L000117_120 ' JUMPV addrg
C_sejoe_6709f8b0_patchlistaux_L000117_119
 mov r2, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo7_6709f8b0_getjump_L000073
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejoc_6709f8b0_patchtestreg_L000105
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejoe_6709f8b0_patchlistaux_L000117_122 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo8_6709f8b0_fixjump_L000077
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sejoe_6709f8b0_patchlistaux_L000117_123 ' JUMPV addrg
C_sejoe_6709f8b0_patchlistaux_L000117_122
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo8_6709f8b0_fixjump_L000077
 add SP, #8 ' CALL addrg
C_sejoe_6709f8b0_patchlistaux_L000117_123
 mov r23, r15 ' CVI, CVU or LOAD
C_sejoe_6709f8b0_patchlistaux_L000117_120
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r23, r22 wz
 jmp #BRNZ
 long @C_sejoe_6709f8b0_patchlistaux_L000117_119 ' NEI4
' C_sejoe_6709f8b0_patchlistaux_L000117_118 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_patchlist

 alignl ' align long
C_luaK__patchlist ' <symbol:luaK_patchlist>
 jmp #NEWF
 jmp #PSHM
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
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejoe_6709f8b0_patchlistaux_L000117
 add SP, #16 ' CALL addrg
' C_luaK__patchlist_124 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_patchtohere

 alignl ' align long
C_luaK__patchtohere ' <symbol:luaK_patchtohere>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
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
 jmp #CALA
 long @C_luaK__patchlist
 add SP, #8 ' CALL addrg
' C_luaK__patchtohere_125 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejof_6709f8b0_savelineinfo_L000126 ' <symbol:savelineinfo>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r17, r19 ' SUBI/P
 subs r17, r22 ' SUBI/P (3)
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r15, r22
 subs r15, #1 ' SUBI4 coni
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_abs ' CALL addrg
 cmps r0,  #128 wz,wc
 jmp #BRAE
 long @C_sejof_6709f8b0_savelineinfo_L000126_130 ' GEI4
 mov r22, r23
 adds r22, #53 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov r18, r20 ' CVUI
 and r18, cviu_m1 ' zero extend
 adds r18, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r18
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #128 wz,wc
 jmp #BR_B
 long @C_sejof_6709f8b0_savelineinfo_L000126_128 ' LTI4
C_sejof_6709f8b0_savelineinfo_L000126_130
 jmp #LODL
 long @C_sejof_6709f8b0_savelineinfo_L000126_131_L000132
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 536870911
 mov r3, RI ' reg ARG con
 mov r22, #8 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21
 adds r5, #36 ' ADDP4 coni
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r20
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 jmp #LODL
 long -128
 mov r17, RI ' reg <- con
 mov r22, r23
 adds r22, #53 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sejof_6709f8b0_savelineinfo_L000126_128
 jmp #LODL
 long @C_sejof_6709f8b0_savelineinfo_L000126_133_L000134
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 2147483647
 mov r3, RI ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r21
 adds r5, #24 ' ADDP4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r15
 jmp #PSHL ' stack ARG
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r15 ' ADDI/P (2)
 mov r20, r17 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNI1 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
' C_sejof_6709f8b0_savelineinfo_L000126_127 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejoi_6709f8b0_removelastlineinfo_L000135 ' <symbol:removelastlineinfo>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $550000 ' save registers
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #64 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRI1 reg
 shl r22, #24
 sar r22, #24 ' sign extend
 jmp #LODL
 long -128
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sejoi_6709f8b0_removelastlineinfo_L000135_137 ' EQI4
 mov r22, r2
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 mov r16, FP
 sub r16, #-(-8) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRP4 regl
 adds r16, #64 ' ADDP4 coni
 mov RI, r16
 jmp #RLNG
 mov r16, BC ' reg <- INDIRP4 reg
 adds r18, r16 ' ADDI/P (1)
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRI1 reg
 shl r18, #24
 sar r18, #24 ' sign extend
 subs r20, r18 ' SUBI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #53 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sejoi_6709f8b0_removelastlineinfo_L000135_138 ' JUMPV addrg
C_sejoi_6709f8b0_removelastlineinfo_L000135_137
 mov r22, r2
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #53 ' ADDP4 coni
 mov r20, #129 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sejoi_6709f8b0_removelastlineinfo_L000135_138
' C_sejoi_6709f8b0_removelastlineinfo_L000135_136 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejoj_6709f8b0_removelastinstruction_L000139 ' <symbol:removelastinstruction>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejoi_6709f8b0_removelastlineinfo_L000135 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_sejoj_6709f8b0_removelastinstruction_L000139_140 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_code

 alignl ' align long
C_luaK__code ' <symbol:luaK_code>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_sejof_6709f8b0_savelineinfo_L000126_133_L000134
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 1073741823
 mov r3, RI ' reg ARG con
 mov r4, #4 ' reg ARG coni
 mov r5, r19
 adds r5, #20 ' ADDP4 coni
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r20
 adds r18, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r20
 shl r22, #2 ' LSHI4 coni
 mov r20, r19
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejof_6709f8b0_savelineinfo_L000126
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r0, r22
 subs r0, #1 ' SUBI4 coni
' C_luaK__code_141 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_codeABCk

 alignl ' align long
C_luaK__codeA_B_C_k ' <symbol:luaK_codeABCk>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
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
 jmp #CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaK__codeA_B_C_k_142 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_codeABx

 alignl ' align long
C_luaK__codeA_B_x ' <symbol:luaK_codeABx>
 jmp #NEWF
 jmp #PSHM
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
 jmp #CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaK__codeA_B_x_143 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_codeAsBx

 alignl ' align long
C_luaK__codeA_sB_x ' <symbol:luaK_codeAsBx>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long 65535
 mov r22, RI ' reg <- con
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
 rdlong r20, r20 ' reg <- INDIRU4 regl
 shl r20, #15 ' LSHU4 coni
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaK__codeA_sB_x_144 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo_6709f8b0_codesJ__L000023 ' <symbol:codesJ>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long 16777215
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 shl r20, #7 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r17 ' CVI, CVU or LOAD
 shl r20, #15 ' LSHU4 coni
 mov r2, r22 ' BORI/U
 or r2, r20 ' BORI/U (3)
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejo_6709f8b0_codesJ__L000023_145 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejok_6709f8b0_codeextraarg_L000146 ' <symbol:codeextraarg>
 jmp #NEWF
 jmp #PSHM
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
 jmp #CALA
 long @C_luaK__code
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejok_6709f8b0_codeextraarg_L000146_147 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejol_6709f8b0_luaK__codek_L000148 ' <symbol:luaK_codek>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long 131071
 mov r22, RI ' reg <- con
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_sejol_6709f8b0_luaK__codek_L000148_150 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__codeA_B_x
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sejol_6709f8b0_luaK__codek_L000148_149 ' JUMPV addrg
C_sejol_6709f8b0_luaK__codek_L000148_150
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #4 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__codeA_B_x
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejok_6709f8b0_codeextraarg_L000146
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
C_sejol_6709f8b0_luaK__codek_L000148_149
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_checkstack

 alignl ' align long
C_luaK__checkstack ' <symbol:luaK_checkstack>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22 ' ADDI/P
 adds r19, r21 ' ADDI/P (3)
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r19, r22 wz,wc
 jmp #BRBE
 long @C_luaK__checkstack_153 ' LEI4
 cmps r19,  #255 wz,wc
 jmp #BR_B
 long @C_luaK__checkstack_155 ' LTI4
 jmp #LODL
 long @C_luaK__checkstack_157_L000158
 mov r2, RI ' reg ARG ADDRG
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaX__syntaxerror
 add SP, #4 ' CALL addrg
C_luaK__checkstack_155
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaK__checkstack_153
' C_luaK__checkstack_152 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_reserveregs

 alignl ' align long
C_luaK__reserveregs ' <symbol:luaK_reserveregs>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__checkstack
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 adds r20, r21 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaK__reserveregs_159 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejon_6709f8b0_freereg_L000160 ' <symbol:freereg>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 cmps r21, r0 wz,wc
 jmp #BR_B
 long @C_sejon_6709f8b0_freereg_L000160_162 ' LTI4
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sejon_6709f8b0_freereg_L000160_162
' C_sejon_6709f8b0_freereg_L000160_161 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejoo_6709f8b0_freeregs_L000164 ' <symbol:freeregs>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21, r19 wz,wc
 jmp #BRBE
 long @C_sejoo_6709f8b0_freeregs_L000164_166 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejon_6709f8b0_freereg_L000160
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejon_6709f8b0_freereg_L000160
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sejoo_6709f8b0_freeregs_L000164_167 ' JUMPV addrg
C_sejoo_6709f8b0_freeregs_L000164_166
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejon_6709f8b0_freereg_L000160
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejon_6709f8b0_freereg_L000160
 add SP, #4 ' CALL addrg
C_sejoo_6709f8b0_freeregs_L000164_167
' C_sejoo_6709f8b0_freeregs_L000164_165 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejop_6709f8b0_freeexp_L000168 ' <symbol:freeexp>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_sejop_6709f8b0_freeexp_L000168_170 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejon_6709f8b0_freereg_L000160
 add SP, #4 ' CALL addrg
C_sejop_6709f8b0_freeexp_L000168_170
' C_sejop_6709f8b0_freeexp_L000168_169 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejoq_6709f8b0_freeexps_L000172 ' <symbol:freeexps>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_sejoq_6709f8b0_freeexps_L000172_175 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_sejoq_6709f8b0_freeexps_L000172_176 ' JUMPV addrg
C_sejoq_6709f8b0_freeexps_L000172_175
 jmp #LODL
 long -1
 mov r17, RI ' reg <- con
C_sejoq_6709f8b0_freeexps_L000172_176
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_sejoq_6709f8b0_freeexps_L000172_178 ' NEI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_sejoq_6709f8b0_freeexps_L000172_179 ' JUMPV addrg
C_sejoq_6709f8b0_freeexps_L000172_178
 jmp #LODL
 long -1
 mov r15, RI ' reg <- con
C_sejoq_6709f8b0_freeexps_L000172_179
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
 jmp #CALA
 long @C_sejoo_6709f8b0_freeregs_L000164
 add SP, #8 ' CALL addrg
' C_sejoq_6709f8b0_freeexps_L000172_173 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejor_6709f8b0_addk_L000180 ' <symbol:addk>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r11, BC ' reg <- INDIRP4 reg
 mov RI, r23
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__get
 add SP, #4 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r22, r9
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sejor_6709f8b0_addk_L000180_182 ' NEI4
 mov RI, r9
 jmp #RLNG
 mov r13, BC ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r13, r22 wz,wc
 jmp #BRAE
 long @C_sejor_6709f8b0_addk_L000180_184 ' GEI4
 mov r22, r13
 shl r22, #3 ' LSHI4 coni
 mov r20, r17
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #63 ' BANDI4 coni
 mov r18, r19
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #63 ' BANDI4 coni
 cmps r20, r18 wz
 jmp #BRNZ
 long @C_sejor_6709f8b0_addk_L000180_184 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__equalobj
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejor_6709f8b0_addk_L000180_184 ' EQI4
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sejor_6709f8b0_addk_L000180_181 ' JUMPV addrg
C_sejor_6709f8b0_addk_L000180_184
C_sejor_6709f8b0_addk_L000180_182
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRI4 reg
 mov r7, FP
 sub r7, #-(-12) ' reg <- addrli
 mov RI, r7
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r9 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r11
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaH__finishset
 add SP, #16 ' CALL addrg
 jmp #LODL
 long @C_sejor_6709f8b0_addk_L000180_186_L000187
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long 33554431
 mov r3, RI ' reg ARG con
 mov r4, #8 ' reg ARG coni
 mov r5, r17
 adds r5, #16 ' ADDP4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r13
 jmp #PSHL ' stack ARG
 mov r22, r17
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #PSHL ' stack ARG
 mov RI, r11
 jmp #PSHL ' stack ARG
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaM__growaux_
 add SP, #24 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sejor_6709f8b0_addk_L000180_189 ' JUMPV addrg
C_sejor_6709f8b0_addk_L000180_188
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 shl r22, #3 ' LSHI4 coni
 mov r20, r17
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sejor_6709f8b0_addk_L000180_189
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_sejor_6709f8b0_addk_L000180_188 ' LTI4
 mov r22, r13
 shl r22, #3 ' LSHI4 coni
 mov r20, r17
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r7, r22 ' ADDI/P
 adds r7, r20 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r0, r7 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sejor_6709f8b0_addk_L000180_192 ' EQI4
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sejor_6709f8b0_addk_L000180_192 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sejor_6709f8b0_addk_L000180_192 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r11 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sejor_6709f8b0_addk_L000180_192 ' JUMPV addrg
C_sejor_6709f8b0_addk_L000180_192
 mov r0, r13 ' CVI, CVU or LOAD
C_sejor_6709f8b0_addk_L000180_181
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sejot_6709f8b0_stringK__L000193 ' <symbol:stringK>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 mov r17, r21 ' CVI, CVU or LOAD
 mov RI, r19
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejor_6709f8b0_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejot_6709f8b0_stringK__L000193_194 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejou_6709f8b0_luaK__intK__L000195 ' <symbol:luaK_intK>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 mov RI, r19
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejor_6709f8b0_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejou_6709f8b0_luaK__intK__L000195_196 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejov_6709f8b0_luaK__numberK__L000197 ' <symbol:luaK_numberK>
 jmp #NEWF
 sub SP, #36
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, FP
 sub r19, #-(-12) ' reg <- addrli
 mov RI, r19
 mov BC, r21
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sejov_6709f8b0_luaK__numberK__L000197_199 ' NEI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejor_6709f8b0_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sejov_6709f8b0_luaK__numberK__L000197_198 ' JUMPV addrg
C_sejov_6709f8b0_luaK__numberK__L000197_199
 mov r22, #24 ' reg <- coni
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 neg r22, r22 ' NEGI4
 mov r2, r22
 adds r2, #1 ' ADDI4 coni
 jmp #LODI
 long @C_sejov_6709f8b0_luaK__numberK__L000197_201_L000202
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sejov_6709f8b0_luaK__numberK__L000197_204 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRF4 regl
 jmp #JMPA
 long @C_sejov_6709f8b0_luaK__numberK__L000197_205 ' JUMPV addrg
C_sejov_6709f8b0_luaK__numberK__L000197_204
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r19, r0 ' CVI, CVU or LOAD
C_sejov_6709f8b0_luaK__numberK__L000197_205
 mov RI, FP
 sub RI, #-(-28)
 wrlong r19, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejor_6709f8b0_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sejov_6709f8b0_luaK__numberK__L000197_198
 jmp #POPM ' restore registers
 add SP, #36 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo11_6709f8b0_boolF__L000206 ' <symbol:boolF>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
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
 jmp #CALA
 long @C_sejor_6709f8b0_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejo11_6709f8b0_boolF__L000206_207 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo12_6709f8b0_boolT__L000209 ' <symbol:boolT>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
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
 jmp #CALA
 long @C_sejor_6709f8b0_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejo12_6709f8b0_boolT__L000209_210 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo13_6709f8b0_nilK__L000212 ' <symbol:nilK>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
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
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #69 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejor_6709f8b0_addk_L000180
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejo13_6709f8b0_nilK__L000212_213 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo14_6709f8b0_fitsC__L000215 ' <symbol:fitsC>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 add r22, #127 ' ADDU4 coni
 cmp r22,  #255 wz,wc 
 jmp #BR_A
 long @C_sejo14_6709f8b0_fitsC__L000215_218 ' GTU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo14_6709f8b0_fitsC__L000215_219 ' JUMPV addrg
C_sejo14_6709f8b0_fitsC__L000215_218
 mov r23, #0 ' reg <- coni
C_sejo14_6709f8b0_fitsC__L000215_219
 mov r0, r23 ' CVI, CVU or LOAD
' C_sejo14_6709f8b0_fitsC__L000215_216 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sejo15_6709f8b0_fitsB_x_L000220 ' <symbol:fitsBx>
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODL
 long -65535
 mov r22, RI ' reg <- con
 cmps r22, r2 wz,wc
 jmp #BR_A
 long @C_sejo15_6709f8b0_fitsB_x_L000220_223 ' GTI4
 jmp #LODL
 long 65536
 mov r22, RI ' reg <- con
 cmps r2, r22 wz,wc
 jmp #BR_A
 long @C_sejo15_6709f8b0_fitsB_x_L000220_223 ' GTI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo15_6709f8b0_fitsB_x_L000220_224 ' JUMPV addrg
C_sejo15_6709f8b0_fitsB_x_L000220_223
 mov r23, #0 ' reg <- coni
C_sejo15_6709f8b0_fitsB_x_L000220_224
 mov r0, r23 ' CVI, CVU or LOAD
' C_sejo15_6709f8b0_fitsB_x_L000220_221 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaK_int

 alignl ' align long
C_luaK__int ' <symbol:luaK_int>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo15_6709f8b0_fitsB_x_L000220 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__int_226 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__codeA_sB_x
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaK__int_227 ' JUMPV addrg
C_luaK__int_226
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejou_6709f8b0_luaK__intK__L000195
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejol_6709f8b0_luaK__codek_L000148
 add SP, #8 ' CALL addrg
C_luaK__int_227
' C_luaK__int_225 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo16_6709f8b0_luaK__float_L000228 ' <symbol:luaK_float>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sejo16_6709f8b0_luaK__float_L000228_230 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo15_6709f8b0_fitsB_x_L000220 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo16_6709f8b0_luaK__float_L000228_230 ' EQI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__codeA_sB_x
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_sejo16_6709f8b0_luaK__float_L000228_231 ' JUMPV addrg
C_sejo16_6709f8b0_luaK__float_L000228_230
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejov_6709f8b0_luaK__numberK__L000197
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejol_6709f8b0_luaK__codek_L000148
 add SP, #8 ' CALL addrg
C_sejo16_6709f8b0_luaK__float_L000228_231
' C_sejo16_6709f8b0_luaK__float_L000228_229 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo17_6709f8b0_const2exp_L000232 ' <symbol:const2exp>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r23, r22
 and r23, #63 ' BANDI4 coni
 cmps r23,  #0 wz,wc
 jmp #BR_B
 long @C_sejo17_6709f8b0_const2exp_L000232_234 ' LTI4
 cmps r23,  #4 wz,wc
 jmp #BR_A
 long @C_sejo17_6709f8b0_const2exp_L000232_243 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sejo17_6709f8b0_const2exp_L000232_244_L000246
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sejo17_6709f8b0_const2exp_L000232_244_L000246 ' <symbol:244>
 long @C_sejo17_6709f8b0_const2exp_L000232_241
 long @C_sejo17_6709f8b0_const2exp_L000232_239
 long @C_sejo17_6709f8b0_const2exp_L000232_234
 long @C_sejo17_6709f8b0_const2exp_L000232_237
 long @C_sejo17_6709f8b0_const2exp_L000232_242

' Catalina Code

DAT ' code segment
C_sejo17_6709f8b0_const2exp_L000232_243
 cmps r23,  #17 wz
 jmp #BR_Z
 long @C_sejo17_6709f8b0_const2exp_L000232_240 ' EQI4
 cmps r23,  #19 wz
 jmp #BR_Z
 long @C_sejo17_6709f8b0_const2exp_L000232_238 ' EQI4
 cmps r23,  #20 wz
 jmp #BR_Z
 long @C_sejo17_6709f8b0_const2exp_L000232_242 ' EQI4
 jmp #JMPA
 long @C_sejo17_6709f8b0_const2exp_L000232_234 ' JUMPV addrg
C_sejo17_6709f8b0_const2exp_L000232_237
 mov r22, #6 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sejo17_6709f8b0_const2exp_L000232_235 ' JUMPV addrg
C_sejo17_6709f8b0_const2exp_L000232_238
 mov r22, #5 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRF4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNF4 reg reg
 jmp #JMPA
 long @C_sejo17_6709f8b0_const2exp_L000232_235 ' JUMPV addrg
C_sejo17_6709f8b0_const2exp_L000232_239
 mov r22, #3 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sejo17_6709f8b0_const2exp_L000232_235 ' JUMPV addrg
C_sejo17_6709f8b0_const2exp_L000232_240
 mov r22, #2 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sejo17_6709f8b0_const2exp_L000232_235 ' JUMPV addrg
C_sejo17_6709f8b0_const2exp_L000232_241
 mov r22, #1 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sejo17_6709f8b0_const2exp_L000232_235 ' JUMPV addrg
C_sejo17_6709f8b0_const2exp_L000232_242
 mov r22, #7 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_sejo17_6709f8b0_const2exp_L000232_234
C_sejo17_6709f8b0_const2exp_L000232_235
' C_sejo17_6709f8b0_const2exp_L000232_233 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaK_setreturns

 alignl ' align long
C_luaK__setreturns ' <symbol:luaK_setreturns>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BRNZ
 long @C_luaK__setreturns_248 ' NEI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHU4 coni
 jmp #LODL
 long $ff000000
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_luaK__setreturns_249 ' JUMPV addrg
C_luaK__setreturns_248
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHU4 coni
 jmp #LODL
 long $ff000000
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff807f
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #7 ' LSHU4 coni
 jmp #LODL
 long 32640
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
C_luaK__setreturns_249
' C_luaK__setreturns_247 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1a_6709f8b0_str2K__L000250 ' <symbol:str2K>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejot_6709f8b0_stringK__L000193
 add SP, #4 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #4 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
' C_sejo1a_6709f8b0_str2K__L000250_251 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_setoneret

 alignl ' align long
C_luaK__setoneret ' <symbol:luaK_setoneret>
 jmp #PSHM
 long $540000 ' save registers
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #18 wz
 jmp #BRNZ
 long @C_luaK__setoneret_253 ' NEI4
 mov r22, #8 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 mov RI, r3
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r18, #52 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 shr r20, #7 ' RSHU4 coni
 and r20, #255 ' BANDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__setoneret_254 ' JUMPV addrg
C_luaK__setoneret_253
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaK__setoneret_255 ' NEI4
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 jmp #LODL
 long $2000000
 mov r18, RI ' reg <- con
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_luaK__setoneret_255
C_luaK__setoneret_254
' C_luaK__setoneret_252 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaK_dischargevars

 alignl ' align long
C_luaK__dischargevars ' <symbol:luaK_dischargevars>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 cmps r19,  #9 wz,wc
 jmp #BR_B
 long @C_luaK__dischargevars_259 ' LTI4
 cmps r19,  #19 wz,wc
 jmp #BR_A
 long @C_luaK__dischargevars_259 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaK__dischargevars_269_L000271-36
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 jmp #CALA
 long @C_sejo2_6709f8b0_const2val_L000038
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo17_6709f8b0_const2exp_L000232
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_262
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_263
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #9
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_264
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r18, BC ' reg <- INDIRI2 reg
 mov r3, r18 ' CVII
 mov r3, r18 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r18, r21
 adds r18, #6 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 mov r4, r18 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #11
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_265
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejon_6709f8b0_freereg_L000160
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r18, BC ' reg <- INDIRI2 reg
 mov r3, r18 ' CVII
 mov r3, r18 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r18, r21
 adds r18, #6 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 mov r4, r18 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #13
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_266
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejon_6709f8b0_freereg_L000160
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r18, BC ' reg <- INDIRI2 reg
 mov r3, r18 ' CVII
 mov r3, r18 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r18, r21
 adds r18, #6 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 mov r4, r18 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #14
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_267
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 mov r2, r22 ' CVII
 mov r2, r22 ' CVII
 shl r2, #16
 sar r2, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejoo_6709f8b0_freeregs_L000164
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r18, BC ' reg <- INDIRI2 reg
 mov r3, r18 ' CVII
 mov r3, r18 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r18, r21
 adds r18, #6 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 mov r4, r18 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #12
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__dischargevars_259 ' JUMPV addrg
C_luaK__dischargevars_268
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__setoneret
 add SP, #4 ' CALL addrg
C_luaK__dischargevars_259
' C_luaK__dischargevars_257 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1d_6709f8b0_discharge2reg_L000273 ' <symbol:discharge2reg>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ff0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov RI, r21
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 cmps r17,  #1 wz,wc
 jmp #BR_B
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274 ' LTI4
 cmps r17,  #17 wz,wc
 jmp #BR_A
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_289_L000291-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sejo1d_6709f8b0_discharge2reg_L000273_289_L000291 ' <symbol:289>
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_278
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_280
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_279
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_282
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_283
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_284
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_281
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_286
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_274
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_285

' Catalina Code

DAT ' code segment
C_sejo1d_6709f8b0_discharge2reg_L000273_278
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__nil
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_276 ' JUMPV addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_279
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #5
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #JMPA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_276 ' JUMPV addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_280
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #7
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #JMPA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_276 ' JUMPV addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_281
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1a_6709f8b0_str2K__L000250
 add SP, #4 ' CALL addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_282
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejol_6709f8b0_luaK__codek_L000148
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_276 ' JUMPV addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_283
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRF4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo16_6709f8b0_luaK__float_L000228
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_276 ' JUMPV addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_284
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__int
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_276 ' JUMPV addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_285
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff807f
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r19 ' CVI, CVU or LOAD
 shl r18, #7 ' LSHU4 coni
 jmp #LODL
 long 32640
 mov r16, RI ' reg <- con
 and r18, r16 ' BANDI/U (1)
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_276 ' JUMPV addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_286
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sejo1d_6709f8b0_discharge2reg_L000273_276 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #0
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
C_sejo1d_6709f8b0_discharge2reg_L000273_276
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_sejo1d_6709f8b0_discharge2reg_L000273_274
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo1g_6709f8b0_discharge2anyreg_L000293 ' <symbol:discharge2anyreg>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 jmp #BR_Z
 long @C_sejo1g_6709f8b0_discharge2anyreg_L000293_295 ' EQI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273
 add SP, #8 ' CALL addrg
C_sejo1g_6709f8b0_discharge2anyreg_L000293_295
' C_sejo1g_6709f8b0_discharge2anyreg_L000293_294 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1h_6709f8b0_code_loadbool_L000297 ' <symbol:code_loadbool>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__getlabel ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r19
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sejo1h_6709f8b0_code_loadbool_L000297_298 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1i_6709f8b0_need_value_L000299 ' <symbol:need_value>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sejo1i_6709f8b0_need_value_L000299_304 ' JUMPV addrg
C_sejo1i_6709f8b0_need_value_L000299_301
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejob_6709f8b0_getjumpcontrol_L000101
 add SP, #4 ' CALL addrg
 mov RI, r0
 jmp #RLNG
 mov r19, BC ' reg <- INDIRU4 reg
 mov r22, r19
 and r22, #127 ' BANDU4 coni
 cmps r22,  #67 wz
 jmp #BR_Z
 long @C_sejo1i_6709f8b0_need_value_L000299_305 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo1i_6709f8b0_need_value_L000299_300 ' JUMPV addrg
C_sejo1i_6709f8b0_need_value_L000299_305
' C_sejo1i_6709f8b0_need_value_L000299_302 ' (symbol refcount = 0)
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo7_6709f8b0_getjump_L000073
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_sejo1i_6709f8b0_need_value_L000299_304
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_sejo1i_6709f8b0_need_value_L000299_301 ' NEI4
 mov r0, #0 ' reg <- coni
C_sejo1i_6709f8b0_need_value_L000299_300
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1j_6709f8b0_exp2reg_L000307 ' <symbol:exp2reg>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1d_6709f8b0_discharge2reg_L000273
 add SP, #8 ' CALL addrg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #16 wz
 jmp #BRNZ
 long @C_sejo1j_6709f8b0_exp2reg_L000307_309 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r21
 adds r3, #8 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
C_sejo1j_6709f8b0_exp2reg_L000307_309
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sejo1j_6709f8b0_exp2reg_L000307_311 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1i_6709f8b0_need_value_L000299
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sejo1j_6709f8b0_exp2reg_L000307_315 ' NEI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1i_6709f8b0_need_value_L000299
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo1j_6709f8b0_exp2reg_L000307_313 ' EQI4
C_sejo1j_6709f8b0_exp2reg_L000307_315
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #16 wz
 jmp #BRNZ
 long @C_sejo1j_6709f8b0_exp2reg_L000307_317 ' NEI4
 jmp #LODL
 long -1
 mov r17, RI ' reg <- con
 jmp #JMPA
 long @C_sejo1j_6709f8b0_exp2reg_L000307_318 ' JUMPV addrg
C_sejo1j_6709f8b0_exp2reg_L000307_317
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__jump ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_sejo1j_6709f8b0_exp2reg_L000307_318
 mov RI, FP
 sub RI, #-(-20)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1h_6709f8b0_code_loadbool_L000297
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #7 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1h_6709f8b0_code_loadbool_L000297
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
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
C_sejo1j_6709f8b0_exp2reg_L000307_313
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
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
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejoe_6709f8b0_patchlistaux_L000117
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
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejoe_6709f8b0_patchlistaux_L000117
 add SP, #16 ' CALL addrg
C_sejo1j_6709f8b0_exp2reg_L000307_311
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
' C_sejo1j_6709f8b0_exp2reg_L000307_308 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export luaK_exp2nextreg

 alignl ' align long
C_luaK__exp2nextreg ' <symbol:luaK_exp2nextreg>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1j_6709f8b0_exp2reg_L000307
 add SP, #8 ' CALL addrg
' C_luaK__exp2nextreg_319 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_exp2anyreg

 alignl ' align long
C_luaK__exp2anyreg ' <symbol:luaK_exp2anyreg>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_luaK__exp2anyreg_321 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaK__exp2anyreg_323 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaK__exp2anyreg_320 ' JUMPV addrg
C_luaK__exp2anyreg_323
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaY__nvarstack ' CALL addrg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r20, r0 wz,wc
 jmp #BR_B
 long @C_luaK__exp2anyreg_325 ' LTI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1j_6709f8b0_exp2reg_L000307
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_luaK__exp2anyreg_320 ' JUMPV addrg
C_luaK__exp2anyreg_325
C_luaK__exp2anyreg_321
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
C_luaK__exp2anyreg_320
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_exp2anyregup

 alignl ' align long
C_luaK__exp2anyregup ' <symbol:luaK_exp2anyregup>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_luaK__exp2anyregup_330 ' NEI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaK__exp2anyregup_328 ' EQI4
C_luaK__exp2anyregup_330
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__exp2anyregup_328
' C_luaK__exp2anyregup_327 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_exp2val

 alignl ' align long
C_luaK__exp2val ' <symbol:luaK_exp2val>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_luaK__exp2val_332 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaK__exp2val_333 ' JUMPV addrg
C_luaK__exp2val_332
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
C_luaK__exp2val_333
' C_luaK__exp2val_331 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1k_6709f8b0_luaK__exp2K__L000334 ' <symbol:luaK_exp2K>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_336 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 cmps r19,  #1 wz,wc
 jmp #BR_B
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_338 ' LTI4
 cmps r19,  #7 wz,wc
 jmp #BR_A
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_338 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_348_L000350-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sejo1k_6709f8b0_luaK__exp2K__L000334_348_L000350 ' <symbol:348>
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_343
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_341
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_342
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_347
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_345
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_344
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_346

' Catalina Code

DAT ' code segment
C_sejo1k_6709f8b0_luaK__exp2K__L000334_341
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo12_6709f8b0_boolT__L000209 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_342
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo11_6709f8b0_boolF__L000206 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_343
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo13_6709f8b0_nilK__L000212 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_344
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejou_6709f8b0_luaK__intK__L000195
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_345
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRF4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejov_6709f8b0_luaK__numberK__L000197
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_346
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejot_6709f8b0_stringK__L000193
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_347
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_339 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_338
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_335 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_339
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #255 wz,wc
 jmp #BR_A
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_352 ' GTI4
 mov r22, #4 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334_335 ' JUMPV addrg
C_sejo1k_6709f8b0_luaK__exp2K__L000334_352
C_sejo1k_6709f8b0_luaK__exp2K__L000334_336
 mov r0, #0 ' reg <- coni
C_sejo1k_6709f8b0_luaK__exp2K__L000334_335
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_exp2RK

 alignl ' align long
C_luaK__exp2R_K_ ' <symbol:luaK_exp2RK>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__exp2R_K__355 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaK__exp2R_K__354 ' JUMPV addrg
C_luaK__exp2R_K__355
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_luaK__exp2R_K__354
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1n_6709f8b0_codeA_B_R_K__L000357 ' <symbol:codeABRK>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #CALA
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
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
' C_sejo1n_6709f8b0_codeA_B_R_K__L000357_358 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_storevar

 alignl ' align long
C_luaK__storevar ' <symbol:luaK_storevar>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
 cmps r17,  #9 wz,wc
 jmp #BR_B
 long @C_luaK__storevar_360 ' LTI4
 cmps r17,  #15 wz,wc
 jmp #BR_A
 long @C_luaK__storevar_360 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaK__storevar_369_L000371-36
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1j_6709f8b0_exp2reg_L000307
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaK__storevar_359 ' JUMPV addrg
C_luaK__storevar_364
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #10
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #JMPA
 long @C_luaK__storevar_361 ' JUMPV addrg
C_luaK__storevar_365
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, #15 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo1n_6709f8b0_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaK__storevar_361 ' JUMPV addrg
C_luaK__storevar_366
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, #17 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo1n_6709f8b0_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaK__storevar_361 ' JUMPV addrg
C_luaK__storevar_367
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, #18 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo1n_6709f8b0_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaK__storevar_361 ' JUMPV addrg
C_luaK__storevar_368
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 mov r3, r22 ' CVII
 mov r3, r22 ' CVII
 shl r3, #16
 sar r3, #16 ' sign extend
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r4, r22 ' CVUI
 and r4, cviu_m1 ' zero extend
 mov r5, #16 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo1n_6709f8b0_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
C_luaK__storevar_360
C_luaK__storevar_361
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
C_luaK__storevar_359
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_self

 alignl ' align long
C_luaK__self ' <symbol:luaK_self>
 jmp #NEWF
 sub SP, #4
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
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #8 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__reserveregs
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, #20 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo1n_6709f8b0_codeA_B_R_K__L000357
 add SP, #16 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
' C_luaK__self_373 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo1q_6709f8b0_negatecondition_L000374 ' <symbol:negatecondition>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejob_6709f8b0_getjumpcontrol_L000101
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, #15 ' reg <- coni
 jmp #LODL
 long $ffff7fff
 mov r18, RI ' reg <- con
 and r18, r22 ' BANDI/U (2)
 shr r22, r20 ' RSHU (1)
 and r22, #1 ' BANDU4 coni
 xor r22, #1 ' BXORI4 coni
 shl r22, #15 ' LSHU4 coni
 jmp #LODL
 long $8000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 or r22, r18 ' BORI/U (2)
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
' C_sejo1q_6709f8b0_negatecondition_L000374_375 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo1r_6709f8b0_jumponcond_L000376 ' <symbol:jumponcond>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #17 wz
 jmp #BRNZ
 long @C_sejo1r_6709f8b0_jumponcond_L000376_378 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 and r22, #127 ' BANDU4 coni
 cmps r22,  #51 wz
 jmp #BRNZ
 long @C_sejo1r_6709f8b0_jumponcond_L000376_380 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejoj_6709f8b0_removelastinstruction_L000139 ' CALL addrg
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_sejo1r_6709f8b0_jumponcond_L000376_383 ' NEI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo1r_6709f8b0_jumponcond_L000376_384 ' JUMPV addrg
C_sejo1r_6709f8b0_jumponcond_L000376_383
 mov r17, #0 ' reg <- coni
C_sejo1r_6709f8b0_jumponcond_L000376_384
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #66
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejoa_6709f8b0_condjump_L000098
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sejo1r_6709f8b0_jumponcond_L000376_377 ' JUMPV addrg
C_sejo1r_6709f8b0_jumponcond_L000376_380
C_sejo1r_6709f8b0_jumponcond_L000376_378
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1g_6709f8b0_discharge2anyreg_L000293
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, #255 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #67
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejoa_6709f8b0_condjump_L000098
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sejo1r_6709f8b0_jumponcond_L000376_377
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_goiftrue

 alignl ' align long
C_luaK__goiftrue ' <symbol:luaK_goiftrue>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov RI, r21
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r22, #2 ' reg <- coni
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_luaK__goiftrue_386 ' LTI4
 cmps r19,  #7 wz,wc
 jmp #BR_A
 long @C_luaK__goiftrue_391 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaK__goiftrue_392_L000394-8
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 jmp #BR_Z
 long @C_luaK__goiftrue_389 ' EQI4
 jmp #JMPA
 long @C_luaK__goiftrue_386 ' JUMPV addrg
C_luaK__goiftrue_389
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1q_6709f8b0_negatecondition_L000374
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_luaK__goiftrue_387 ' JUMPV addrg
C_luaK__goiftrue_390
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_luaK__goiftrue_387 ' JUMPV addrg
C_luaK__goiftrue_386
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1r_6709f8b0_jumponcond_L000376
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
 jmp #CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_luaK__goiftrue_385 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_goiffalse

 alignl ' align long
C_luaK__goiffalse ' <symbol:luaK_goiffalse>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov RI, r21
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 mov r22, #1 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_luaK__goiffalse_401 ' EQI4
 cmps r19,  #3 wz
 jmp #BR_Z
 long @C_luaK__goiffalse_401 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_luaK__goiffalse_397 ' LTI4
' C_luaK__goiffalse_402 ' (symbol refcount = 0)
 cmps r19,  #16 wz
 jmp #BR_Z
 long @C_luaK__goiffalse_400 ' EQI4
 jmp #JMPA
 long @C_luaK__goiffalse_397 ' JUMPV addrg
C_luaK__goiffalse_400
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_luaK__goiffalse_398 ' JUMPV addrg
C_luaK__goiffalse_401
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_luaK__goiffalse_398 ' JUMPV addrg
C_luaK__goiffalse_397
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1r_6709f8b0_jumponcond_L000376
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
 jmp #CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__patchtohere
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_luaK__goiffalse_396 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo1u_6709f8b0_codenot_L000403 ' <symbol:codenot>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 cmps r19,  #1 wz,wc
 jmp #BR_B
 long @C_sejo1u_6709f8b0_codenot_L000403_405 ' LTI4
 cmps r19,  #17 wz,wc
 jmp #BR_A
 long @C_sejo1u_6709f8b0_codenot_L000403_405 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sejo1u_6709f8b0_codenot_L000403_412_L000414-4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sejo1u_6709f8b0_codenot_L000403_412_L000414 ' <symbol:412>
 long @C_sejo1u_6709f8b0_codenot_L000403_408
 long @C_sejo1u_6709f8b0_codenot_L000403_409
 long @C_sejo1u_6709f8b0_codenot_L000403_408
 long @C_sejo1u_6709f8b0_codenot_L000403_409
 long @C_sejo1u_6709f8b0_codenot_L000403_409
 long @C_sejo1u_6709f8b0_codenot_L000403_409
 long @C_sejo1u_6709f8b0_codenot_L000403_409
 long @C_sejo1u_6709f8b0_codenot_L000403_411
 long @C_sejo1u_6709f8b0_codenot_L000403_405
 long @C_sejo1u_6709f8b0_codenot_L000403_405
 long @C_sejo1u_6709f8b0_codenot_L000403_405
 long @C_sejo1u_6709f8b0_codenot_L000403_405
 long @C_sejo1u_6709f8b0_codenot_L000403_405
 long @C_sejo1u_6709f8b0_codenot_L000403_405
 long @C_sejo1u_6709f8b0_codenot_L000403_405
 long @C_sejo1u_6709f8b0_codenot_L000403_410
 long @C_sejo1u_6709f8b0_codenot_L000403_411

' Catalina Code

DAT ' code segment
C_sejo1u_6709f8b0_codenot_L000403_408
 mov r22, #2 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sejo1u_6709f8b0_codenot_L000403_406 ' JUMPV addrg
C_sejo1u_6709f8b0_codenot_L000403_409
 mov r22, #3 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sejo1u_6709f8b0_codenot_L000403_406 ' JUMPV addrg
C_sejo1u_6709f8b0_codenot_L000403_410
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1q_6709f8b0_negatecondition_L000374
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sejo1u_6709f8b0_codenot_L000403_406 ' JUMPV addrg
C_sejo1u_6709f8b0_codenot_L000403_411
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1g_6709f8b0_discharge2anyreg_L000293
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r4, BC ' reg <- INDIRI4 reg
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #51
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_sejo1u_6709f8b0_codenot_L000403_405
C_sejo1u_6709f8b0_codenot_L000403_406
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejod_6709f8b0_removevalues_L000111
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejod_6709f8b0_removevalues_L000111
 add SP, #4 ' CALL addrg
' C_sejo1u_6709f8b0_codenot_L000403_404 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo21_6709f8b0_isK_str_L000416 ' <symbol:isKstr>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, #4 ' reg <- coni
 mov RI, r2
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sejo21_6709f8b0_isK_str_L000416_419 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_sejo21_6709f8b0_isK_str_L000416_419 ' NEI4
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #255 wz,wc
 jmp #BR_A
 long @C_sejo21_6709f8b0_isK_str_L000416_419 ' GTI4
 shl r22, #3 ' LSHI4 coni
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #68 wz
 jmp #BRNZ
 long @C_sejo21_6709f8b0_isK_str_L000416_419 ' NEI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo21_6709f8b0_isK_str_L000416_420 ' JUMPV addrg
C_sejo21_6709f8b0_isK_str_L000416_419
 mov r23, #0 ' reg <- coni
C_sejo21_6709f8b0_isK_str_L000416_420
 mov r0, r23 ' CVI, CVU or LOAD
' C_sejo21_6709f8b0_isK_str_L000416_417 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaK_isKint

 alignl ' align long
C_luaK__isK_int ' <symbol:luaK_isKint>
 jmp #PSHM
 long $d00000 ' save registers
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_luaK__isK_int_423 ' NEI4
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaK__isK_int_423 ' NEI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaK__isK_int_424 ' JUMPV addrg
C_luaK__isK_int_423
 mov r23, #0 ' reg <- coni
C_luaK__isK_int_424
 mov r0, r23 ' CVI, CVU or LOAD
' C_luaK__isK_int_421 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sejo22_6709f8b0_isC_int_L000425 ' <symbol:isCint>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__isK_int ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo22_6709f8b0_isC_int_L000425_428 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmp r22,  #255 wz,wc 
 jmp #BR_A
 long @C_sejo22_6709f8b0_isC_int_L000425_428 ' GTU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo22_6709f8b0_isC_int_L000425_429 ' JUMPV addrg
C_sejo22_6709f8b0_isC_int_L000425_428
 mov r21, #0 ' reg <- coni
C_sejo22_6709f8b0_isC_int_L000425_429
 mov r0, r21 ' CVI, CVU or LOAD
' C_sejo22_6709f8b0_isC_int_L000425_426 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo23_6709f8b0_isS_C_int_L000430 ' <symbol:isSCint>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__isK_int ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo23_6709f8b0_isS_C_int_L000430_433 ' EQI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo14_6709f8b0_fitsC__L000215 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sejo23_6709f8b0_isS_C_int_L000430_433 ' EQI4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo23_6709f8b0_isS_C_int_L000430_434 ' JUMPV addrg
C_sejo23_6709f8b0_isS_C_int_L000430_433
 mov r21, #0 ' reg <- coni
C_sejo23_6709f8b0_isS_C_int_L000430_434
 mov r0, r21 ' CVI, CVU or LOAD
' C_sejo23_6709f8b0_isS_C_int_L000430_431 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo24_6709f8b0_isS_C_number_L000435 ' <symbol:isSCnumber>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_sejo24_6709f8b0_isS_C_number_L000435_437 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo24_6709f8b0_isS_C_number_L000435_438 ' JUMPV addrg
C_sejo24_6709f8b0_isS_C_number_L000435_437
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #5 wz
 jmp #BRNZ
 long @C_sejo24_6709f8b0_isS_C_number_L000435_439 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRF4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__flttointeger
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo24_6709f8b0_isS_C_number_L000435_439 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sejo24_6709f8b0_isS_C_number_L000435_440 ' JUMPV addrg
C_sejo24_6709f8b0_isS_C_number_L000435_439
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sejo24_6709f8b0_isS_C_number_L000435_436 ' JUMPV addrg
C_sejo24_6709f8b0_isS_C_number_L000435_440
C_sejo24_6709f8b0_isS_C_number_L000435_438
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_sejo24_6709f8b0_isS_C_number_L000435_441 ' NEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo14_6709f8b0_fitsC__L000215 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo24_6709f8b0_isS_C_number_L000435_441 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #127 ' ADDI4 coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo24_6709f8b0_isS_C_number_L000435_436 ' JUMPV addrg
C_sejo24_6709f8b0_isS_C_number_L000435_441
 mov r0, #0 ' reg <- coni
C_sejo24_6709f8b0_isS_C_number_L000435_436
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_indexed

 alignl ' align long
C_luaK__indexed ' <symbol:luaK_indexed>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #7 wz
 jmp #BRNZ
 long @C_luaK__indexed_444 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1a_6709f8b0_str2K__L000250
 add SP, #4 ' CALL addrg
C_luaK__indexed_444
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_luaK__indexed_446 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo21_6709f8b0_isK_str_L000416
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaK__indexed_446 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__indexed_446
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_luaK__indexed_448 ' NEI4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
 mov r22, #13 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__indexed_449 ' JUMPV addrg
C_luaK__indexed_448
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_luaK__indexed_451 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_luaK__indexed_452 ' JUMPV addrg
C_luaK__indexed_451
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
C_luaK__indexed_452
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo21_6709f8b0_isK_str_L000416
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__indexed_453 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
 mov r22, #15 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__indexed_454 ' JUMPV addrg
C_luaK__indexed_453
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo22_6709f8b0_isC_int_L000425 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__indexed_455 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
 mov r22, #14 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_luaK__indexed_456 ' JUMPV addrg
C_luaK__indexed_455
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WWRD ' ASGNI2 reg reg
 mov r22, #12 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_luaK__indexed_456
C_luaK__indexed_454
C_luaK__indexed_449
' C_luaK__indexed_443 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sejo25_6709f8b0_validop_L000457 ' <symbol:validop>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r23,  #3 wz,wc
 jmp #BR_B
 long @C_sejo25_6709f8b0_validop_L000457_459 ' LTI4
 cmps r23,  #13 wz,wc
 jmp #BR_A
 long @C_sejo25_6709f8b0_validop_L000457_459 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sejo25_6709f8b0_validop_L000457_474_L000476-12
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sejo25_6709f8b0_validop_L000457_474_L000476 ' <symbol:474>
 long @C_sejo25_6709f8b0_validop_L000457_465
 long @C_sejo25_6709f8b0_validop_L000457_459
 long @C_sejo25_6709f8b0_validop_L000457_465
 long @C_sejo25_6709f8b0_validop_L000457_465
 long @C_sejo25_6709f8b0_validop_L000457_461
 long @C_sejo25_6709f8b0_validop_L000457_461
 long @C_sejo25_6709f8b0_validop_L000457_461
 long @C_sejo25_6709f8b0_validop_L000457_461
 long @C_sejo25_6709f8b0_validop_L000457_461
 long @C_sejo25_6709f8b0_validop_L000457_459
 long @C_sejo25_6709f8b0_validop_L000457_461

' Catalina Code

DAT ' code segment
C_sejo25_6709f8b0_validop_L000457_461
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sejo25_6709f8b0_validop_L000457_463 ' EQI4
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sejo25_6709f8b0_validop_L000457_463 ' EQI4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo25_6709f8b0_validop_L000457_464 ' JUMPV addrg
C_sejo25_6709f8b0_validop_L000457_463
 mov r17, #0 ' reg <- coni
C_sejo25_6709f8b0_validop_L000457_464
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sejo25_6709f8b0_validop_L000457_458 ' JUMPV addrg
C_sejo25_6709f8b0_validop_L000457_465
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sejo25_6709f8b0_validop_L000457_470 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sejo25_6709f8b0_validop_L000457_471 ' JUMPV addrg
C_sejo25_6709f8b0_validop_L000457_470
 mov RI, r19
 jmp #RLNG
 mov r15, BC ' reg <- INDIRF4 reg
C_sejo25_6709f8b0_validop_L000457_471
 jmp #LODI
 long @C_sejo25_6709f8b0_validop_L000457_472_L000473
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_sejo25_6709f8b0_validop_L000457_468 ' EQF4
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo25_6709f8b0_validop_L000457_469 ' JUMPV addrg
C_sejo25_6709f8b0_validop_L000457_468
 mov r17, #0 ' reg <- coni
C_sejo25_6709f8b0_validop_L000457_469
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sejo25_6709f8b0_validop_L000457_458 ' JUMPV addrg
C_sejo25_6709f8b0_validop_L000457_459
 mov r0, #1 ' reg <- coni
C_sejo25_6709f8b0_validop_L000457_458
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo29_6709f8b0_constfolding_L000478 ' <symbol:constfolding>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
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
 jmp #CALA
 long @C_sejo1_6709f8b0_tonumeral_L000025
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sejo29_6709f8b0_constfolding_L000478_483 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1_6709f8b0_tonumeral_L000025
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sejo29_6709f8b0_constfolding_L000478_483 ' EQI4
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo25_6709f8b0_validop_L000457
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sejo29_6709f8b0_constfolding_L000478_480 ' NEI4
C_sejo29_6709f8b0_constfolding_L000478_483
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sejo29_6709f8b0_constfolding_L000478_479 ' JUMPV addrg
C_sejo29_6709f8b0_constfolding_L000478_480
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaO__rawarith
 add SP, #16 ' CALL addrg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sejo29_6709f8b0_constfolding_L000478_484 ' NEI4
 mov r22, #6 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sejo29_6709f8b0_constfolding_L000478_485 ' JUMPV addrg
C_sejo29_6709f8b0_constfolding_L000478_484
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRF4 regl
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_sejo29_6709f8b0_constfolding_L000478_489 ' NEF4
 jmp #LODI
 long @C_sejo25_6709f8b0_validop_L000457_472_L000473
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_sejo29_6709f8b0_constfolding_L000478_487 ' NEF4
C_sejo29_6709f8b0_constfolding_L000478_489
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sejo29_6709f8b0_constfolding_L000478_479 ' JUMPV addrg
C_sejo29_6709f8b0_constfolding_L000478_487
 mov r22, #5 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r15
 jmp #WLNG ' ASGNF4 reg reg
C_sejo29_6709f8b0_constfolding_L000478_485
 mov r0, #1 ' reg <- coni
C_sejo29_6709f8b0_constfolding_L000478_479
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2a_6709f8b0_codeunexpval_L000490 ' <symbol:codeunexpval>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
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
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #17 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
' C_sejo2a_6709f8b0_codeunexpval_L000490_491 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2b_6709f8b0_finishbinexpval_L000492 ' <symbol:finishbinexpval>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #CALA
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
 jmp #PSHF
 long 20 ' stack ARG INDIR ADDRFi
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
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
 jmp #CALA
 long @C_sejoq_6709f8b0_freeexps_L000172
 add SP, #8 ' CALL addrg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, #17 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
' C_sejo2b_6709f8b0_finishbinexpval_L000492_493 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2c_6709f8b0_codebinexpval_L000494 ' <symbol:codebinexpval>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #CALA
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
 jmp #PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov RI, r19
 jmp #PSHL ' stack ARG
 mov RI, r21
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2b_6709f8b0_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
' C_sejo2c_6709f8b0_codebinexpval_L000494_495 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2d_6709f8b0_codebini_L000496 ' <symbol:codebini>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, #127 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #47 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long -8 ' stack ARG INDIR ADDRLi
 jmp #PSHF
 long 12 ' stack ARG INDIR ADDRFi
 mov RI, r23
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 16 ' stack ARG INDIR ADDRFi
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2b_6709f8b0_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
' C_sejo2d_6709f8b0_codebini_L000496_497 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2e_6709f8b0_finishbinexpneg_L000498 ' <symbol:finishbinexpneg>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ff0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaK__isK_int ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sejo2e_6709f8b0_finishbinexpneg_L000498_500 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sejo2e_6709f8b0_finishbinexpneg_L000498_499 ' JUMPV addrg
C_sejo2e_6709f8b0_finishbinexpneg_L000498_500
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo14_6709f8b0_fitsC__L000215 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2e_6709f8b0_finishbinexpneg_L000498_504 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 neg r2, r22 ' NEGI4
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo14_6709f8b0_fitsC__L000215 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sejo2e_6709f8b0_finishbinexpneg_L000498_502 ' NEI4
C_sejo2e_6709f8b0_finishbinexpneg_L000498_504
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sejo2e_6709f8b0_finishbinexpneg_L000498_499 ' JUMPV addrg
C_sejo2e_6709f8b0_finishbinexpneg_L000498_502
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #47 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, #0 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 neg r22, r22 ' NEGI4
 adds r22, #127 ' ADDI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 12 ' stack ARG INDIR ADDRFi
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2b_6709f8b0_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 shl r20, #2 ' LSHI4 coni
 subs r20, #4 ' SUBI4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ff00ffff
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 adds r18, #127 ' ADDI4 coni
 shl r18, #16 ' LSHU4 coni
 jmp #LODL
 long $ff0000
 mov r16, RI ' reg <- con
 and r18, r16 ' BANDI/U (1)
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, #1 ' reg <- coni
C_sejo2e_6709f8b0_finishbinexpneg_L000498_499
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2f_6709f8b0_swapexps_L000505 ' <symbol:swapexps>
 jmp #NEWF
 sub SP, #16
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r3 ' CVI, CVU or LOAD
 jmp #CPYB
 long 16 ' ASGNB
 mov r0, r3 ' CVI, CVU or LOAD
 mov r1, r2 ' CVI, CVU or LOAD
 jmp #CPYB
 long 16 ' ASGNB
 mov r0, r2 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-20) ' reg <- addrli
 jmp #CPYB
 long 16 ' ASGNB
' C_sejo2f_6709f8b0_swapexps_L000505_506 ' (symbol refcount = 0)
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2g_6709f8b0_codearith_L000507 ' <symbol:codearith>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #6 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1_6709f8b0_tonumeral_L000025
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sejo2g_6709f8b0_codearith_L000507_509 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1k_6709f8b0_luaK__exp2K__L000334
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2g_6709f8b0_codearith_L000507_509 ' EQI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
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
 jmp #PSHF
 long -12 ' stack ARG INDIR ADDRLi
 jmp #PSHF
 long -16 ' stack ARG INDIR ADDRLi
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2b_6709f8b0_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
 jmp #JMPA
 long @C_sejo2g_6709f8b0_codearith_L000507_510 ' JUMPV addrg
C_sejo2g_6709f8b0_codearith_L000507_509
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #34 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sejo2g_6709f8b0_codearith_L000507_511 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2f_6709f8b0_swapexps_L000505
 add SP, #4 ' CALL addrg
C_sejo2g_6709f8b0_codearith_L000507_511
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2c_6709f8b0_codebinexpval_L000494
 add SP, #16 ' CALL addrg
C_sejo2g_6709f8b0_codearith_L000507_510
' C_sejo2g_6709f8b0_codearith_L000507_508 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2h_6709f8b0_codecommutative_L000513 ' <symbol:codecommutative>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1_6709f8b0_tonumeral_L000025
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2h_6709f8b0_codecommutative_L000513_515 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2f_6709f8b0_swapexps_L000505
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_sejo2h_6709f8b0_codecommutative_L000513_515
 cmps r23,  #0 wz
 jmp #BRNZ
 long @C_sejo2h_6709f8b0_codecommutative_L000513_517 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo23_6709f8b0_isS_C_int_L000430 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2h_6709f8b0_codecommutative_L000513_517 ' EQI4
 mov r2, #6 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, #21
 jmp #PSHL ' stack ARG coni
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2d_6709f8b0_codebini_L000496
 add SP, #24 ' CALL addrg
 jmp #JMPA
 long @C_sejo2h_6709f8b0_codecommutative_L000513_518 ' JUMPV addrg
C_sejo2h_6709f8b0_codecommutative_L000513_517
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2g_6709f8b0_codearith_L000507
 add SP, #20 ' CALL addrg
C_sejo2h_6709f8b0_codecommutative_L000513_518
' C_sejo2h_6709f8b0_codecommutative_L000513_514 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2i_6709f8b0_codebitwise_L000519 ' <symbol:codebitwise>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_sejo2i_6709f8b0_codebitwise_L000519_521 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2R_K_
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2i_6709f8b0_codebitwise_L000519_521 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2f_6709f8b0_swapexps_L000505
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo2i_6709f8b0_codebitwise_L000519_522 ' JUMPV addrg
C_sejo2i_6709f8b0_codebitwise_L000519_521
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_sejo2i_6709f8b0_codebitwise_L000519_525 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2R_K_
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_sejo2i_6709f8b0_codebitwise_L000519_523 ' NEI4
C_sejo2i_6709f8b0_codebitwise_L000519_525
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
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2c_6709f8b0_codebinexpval_L000494
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_sejo2i_6709f8b0_codebitwise_L000519_520 ' JUMPV addrg
C_sejo2i_6709f8b0_codebitwise_L000519_523
C_sejo2i_6709f8b0_codebitwise_L000519_522
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
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
 jmp #PSHF
 long -16 ' stack ARG INDIR ADDRLi
 jmp #PSHF
 long -12 ' stack ARG INDIR ADDRLi
 mov RI, r19
 jmp #PSHL ' stack ARG
 mov RI, r21
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #36 ' arg size, rpsize = 0, spsize = 36
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2b_6709f8b0_finishbinexpval_L000492
 add SP, #32 ' CALL addrg
C_sejo2i_6709f8b0_codebitwise_L000519_520
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2j_6709f8b0_codeorder_L000526 ' <symbol:codeorder>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
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
 jmp #CALA
 long @C_sejo24_6709f8b0_isS_C_number_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2j_6709f8b0_codeorder_L000526_528 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 subs r22, #58 ' SUBI4 coni
 mov r21, r22
 adds r21, #62 ' ADDI4 coni
 jmp #JMPA
 long @C_sejo2j_6709f8b0_codeorder_L000526_529 ' JUMPV addrg
C_sejo2j_6709f8b0_codeorder_L000526_528
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo24_6709f8b0_isS_C_number_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2j_6709f8b0_codeorder_L000526_530 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r21,  #58 wz
 jmp #BRNZ
 long @C_sejo2j_6709f8b0_codeorder_L000526_533 ' NEI4
 mov r15, #64 ' reg <- coni
 jmp #JMPA
 long @C_sejo2j_6709f8b0_codeorder_L000526_534 ' JUMPV addrg
C_sejo2j_6709f8b0_codeorder_L000526_533
 mov r15, #65 ' reg <- coni
C_sejo2j_6709f8b0_codeorder_L000526_534
 mov r21, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sejo2j_6709f8b0_codeorder_L000526_531 ' JUMPV addrg
C_sejo2j_6709f8b0_codeorder_L000526_530
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
C_sejo2j_6709f8b0_codeorder_L000526_531
C_sejo2j_6709f8b0_codeorder_L000526_529
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejoq_6709f8b0_freeexps_L000172
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
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejoa_6709f8b0_condjump_L000098
 add SP, #20 ' CALL addrg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #16 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
' C_sejo2j_6709f8b0_codeorder_L000526_527 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2k_6709f8b0_codeeq_L000535 ' <symbol:codeeq>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #8 wz
 jmp #BR_Z
 long @C_sejo2k_6709f8b0_codeeq_L000535_537 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2f_6709f8b0_swapexps_L000505
 add SP, #4 ' CALL addrg
C_sejo2k_6709f8b0_codeeq_L000535_537
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #CALA
 long @C_sejo24_6709f8b0_isS_C_number_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2k_6709f8b0_codeeq_L000535_539 ' EQI4
 mov r22, #61 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo2k_6709f8b0_codeeq_L000535_540 ' JUMPV addrg
C_sejo2k_6709f8b0_codeeq_L000535_539
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2R_K_
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sejo2k_6709f8b0_codeeq_L000535_541 ' EQI4
 mov r22, #60 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sejo2k_6709f8b0_codeeq_L000535_542 ' JUMPV addrg
C_sejo2k_6709f8b0_codeeq_L000535_541
 mov r22, #57 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
C_sejo2k_6709f8b0_codeeq_L000535_542
C_sejo2k_6709f8b0_codeeq_L000535_540
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejoq_6709f8b0_freeexps_L000172
 add SP, #8 ' CALL addrg
 cmps r21,  #13 wz
 jmp #BRNZ
 long @C_sejo2k_6709f8b0_codeeq_L000535_544 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_sejo2k_6709f8b0_codeeq_L000535_545 ' JUMPV addrg
C_sejo2k_6709f8b0_codeeq_L000535_544
 mov r15, #0 ' reg <- coni
C_sejo2k_6709f8b0_codeeq_L000535_545
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
 jmp #PSHF
 long -20 ' stack ARG INDIR ADDRLi
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejoa_6709f8b0_condjump_L000098
 add SP, #20 ' CALL addrg
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #16 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
' C_sejo2k_6709f8b0_codeeq_L000535_536 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


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
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov r15, r21 ' CVI, CVU or LOAD
 cmps r15,  #0 wz,wc
 jmp #BR_B
 long @C_luaK__prefix_549 ' LTI4
 cmps r15,  #3 wz,wc
 jmp #BR_A
 long @C_luaK__prefix_549 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaK__prefix_557_L000559
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 jmp #LODL
 long @C_luaK__prefix_ef_L000548
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #12 ' ADDI4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo29_6709f8b0_constfolding_L000478
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__prefix_553 ' EQI4
 jmp #JMPA
 long @C_luaK__prefix_550 ' JUMPV addrg
C_luaK__prefix_553
C_luaK__prefix_555
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #49 ' ADDI4 coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2a_6709f8b0_codeunexpval_L000490
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaK__prefix_550 ' JUMPV addrg
C_luaK__prefix_556
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1u_6709f8b0_codenot_L000403
 add SP, #4 ' CALL addrg
C_luaK__prefix_549
C_luaK__prefix_550
' C_luaK__prefix_546 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_infix

 alignl ' align long
C_luaK__infix ' <symbol:luaK_infix>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 mov r17, r21 ' CVI, CVU or LOAD
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_luaK__infix_561 ' LTI4
 cmps r17,  #20 wz,wc
 jmp #BR_A
 long @C_luaK__infix_561 ' GTI4
 mov r22, r17
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaK__infix_576_L000578
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 jmp #CALA
 long @C_luaK__goiftrue
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_565
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__goiffalse
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_566
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2nextreg
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_567
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1_6709f8b0_tonumeral_L000025
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaK__infix_562 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_570
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo1_6709f8b0_tonumeral_L000025
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaK__infix_562 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2R_K_
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaK__infix_562 ' JUMPV addrg
C_luaK__infix_573
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo24_6709f8b0_isS_C_number_L000435
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaK__infix_562 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__exp2anyreg
 add SP, #4 ' CALL addrg
C_luaK__infix_561
C_luaK__infix_562
' C_luaK__infix_560 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2q_6709f8b0_codeconcat_L000579 ' <symbol:codeconcat>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo5_6709f8b0_previousinstruction_L000056 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 cmps r22,  #53 wz
 jmp #BRNZ
 long @C_sejo2q_6709f8b0_codeconcat_L000579_581 ' NEI4
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff807f
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 shl r20, #7 ' LSHU4 coni
 jmp #LODL
 long 32640
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r15
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ff00ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 adds r20, #1 ' ADDI4 coni
 shl r20, #16 ' LSHU4 coni
 jmp #LODL
 long $ff0000
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r15
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sejo2q_6709f8b0_codeconcat_L000579_582 ' JUMPV addrg
C_sejo2q_6709f8b0_codeconcat_L000579_581
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRI4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #53
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejop_6709f8b0_freeexp_L000168
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__fixline
 add SP, #4 ' CALL addrg
C_sejo2q_6709f8b0_codeconcat_L000579_582
' C_sejo2q_6709f8b0_codeconcat_L000579_580 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_posfix

 alignl ' align long
C_luaK__posfix ' <symbol:luaK_posfix>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
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
 jmp #CALA
 long @C_luaK__dischargevars
 add SP, #4 ' CALL addrg
 cmps r23,  #11 wz,wc
 jmp #BR_A
 long @C_luaK__posfix_584 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo29_6709f8b0_constfolding_L000478
 add SP, #12 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__posfix_584 ' EQI4
 jmp #JMPA
 long @C_luaK__posfix_583 ' JUMPV addrg
C_luaK__posfix_584
 mov r15, r23 ' CVI, CVU or LOAD
 cmps r15,  #0 wz,wc
 jmp #BR_B
 long @C_luaK__posfix_586 ' LTI4
 cmps r15,  #20 wz,wc
 jmp #BR_A
 long @C_luaK__posfix_586 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaK__posfix_609_L000611
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r19
 adds r3, #12 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 16 ' ASGNB
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_590
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r19
 adds r3, #8 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaK__concat
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 16 ' ASGNB
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_591
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
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
 jmp #CALA
 long @C_sejo2q_6709f8b0_codeconcat_L000579
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_592
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2h_6709f8b0_codecommutative_L000513
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_593
 mov r2, #7 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #21 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2e_6709f8b0_finishbinexpneg_L000498
 add SP, #20 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__posfix_594 ' EQI4
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_594
C_luaK__posfix_596
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2g_6709f8b0_codearith_L000507
 add SP, #20 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_597
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2i_6709f8b0_codebitwise_L000519
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_598
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo23_6709f8b0_isS_C_int_L000430 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__posfix_599 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2f_6709f8b0_swapexps_L000505
 add SP, #4 ' CALL addrg
 mov r2, #16 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, #33
 jmp #PSHL ' stack ARG coni
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2d_6709f8b0_codebini_L000496
 add SP, #24 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_599
 mov r2, #16 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #32 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2e_6709f8b0_finishbinexpneg_L000498
 add SP, #20 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__posfix_601 ' EQI4
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_601
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, #44 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2c_6709f8b0_codebinexpval_L000494
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_603
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejo23_6709f8b0_isS_C_int_L000430 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaK__posfix_604 ' EQI4
 mov r2, #17 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, #0 ' reg ARG coni
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov RI, #32
 jmp #PSHL ' stack ARG coni
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #28 ' arg size, rpsize = 0, spsize = 28
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2d_6709f8b0_codebini_L000496
 add SP, #24 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_604
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, #45 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sejo2c_6709f8b0_codebinexpval_L000494
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
C_luaK__posfix_606
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2k_6709f8b0_codeeq_L000535
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
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
 jmp #CALA
 long @C_sejo2j_6709f8b0_codeorder_L000526
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_luaK__posfix_587 ' JUMPV addrg
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
 jmp #CALA
 long @C_sejo2f_6709f8b0_swapexps_L000505
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
 jmp #CALA
 long @C_sejo2j_6709f8b0_codeorder_L000526
 add SP, #12 ' CALL addrg
C_luaK__posfix_586
C_luaK__posfix_587
C_luaK__posfix_583
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaK_fixline

 alignl ' align long
C_luaK__fixline ' <symbol:luaK_fixline>
 jmp #NEWF
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sejoi_6709f8b0_removelastlineinfo_L000135 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejof_6709f8b0_savelineinfo_L000126
 add SP, #8 ' CALL addrg
' C_luaK__fixline_612 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaK_settablesize

 alignl ' align long
C_luaK__settablesize ' <symbol:luaK_settablesize>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_luaK__settablesize_615 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__ceillog2 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_luaK__settablesize_616 ' JUMPV addrg
C_luaK__settablesize_615
 mov r11, #0 ' reg <- coni
C_luaK__settablesize_616
 mov RI, FP
 sub RI, #-(-8)
 wrlong r11, RI ' ASGNI4 addrli reg
 mov r22, #256 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, #256 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-12)
 wrlong r1, RI ' ASGNI4 addrli reg
 cmps r13,  #0 wz,wc
 jmp #BRBE
 long @C_luaK__settablesize_618 ' LEI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaK__settablesize_619 ' JUMPV addrg
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
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #16 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #24 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #15 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov RI, r15
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 shl r20, #7 ' LSHU4 coni
 or r20, #82 ' BORU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_luaK__settablesize_613 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaK_setlist

 alignl ' align long
C_luaK__setlist ' <symbol:luaK_setlist>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r17, r22 wz
 jmp #BRNZ
 long @C_luaK__setlist_621 ' NEI4
 mov r17, #0 ' reg <- coni
C_luaK__setlist_621
 cmps r19,  #255 wz,wc
 jmp #BR_A
 long @C_luaK__setlist_623 ' GTI4
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #78
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 jmp #JMPA
 long @C_luaK__setlist_624 ' JUMPV addrg
C_luaK__setlist_623
 mov r22, #256 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, #256 ' reg <- coni
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r19, r1 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #78
 jmp #PSHL ' stack ARG coni
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaK__codeA_B_C_k
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejok_6709f8b0_codeextraarg_L000146
 add SP, #4 ' CALL addrg
C_luaK__setlist_624
 mov r22, r23
 adds r22, #52 ' ADDP4 coni
 mov r20, r21
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaK__setlist_620 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sejo2t_6709f8b0_finaltarget_L000625 ' <symbol:finaltarget>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, #0 ' reg <- coni
C_sejo2t_6709f8b0_finaltarget_L000625_627
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 adds r22, r3 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRU4 reg
 mov r22, r21
 and r22, #127 ' BANDU4 coni
 cmps r22,  #56 wz
 jmp #BR_Z
 long @C_sejo2t_6709f8b0_finaltarget_L000625_631 ' EQI4
 jmp #JMPA
 long @C_sejo2t_6709f8b0_finaltarget_L000625_629 ' JUMPV addrg
C_sejo2t_6709f8b0_finaltarget_L000625_631
 mov r22, r21
 shr r22, #7 ' RSHU4 coni
 jmp #LODL
 long $1ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long 16777215
 mov r20, RI ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 adds r22, #1 ' ADDI4 coni
 adds r2, r22 ' ADDI/P (1)
' C_sejo2t_6709f8b0_finaltarget_L000625_628 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #100 wz,wc
 jmp #BR_B
 long @C_sejo2t_6709f8b0_finaltarget_L000625_627 ' LTI4
C_sejo2t_6709f8b0_finaltarget_L000625_629
 mov r0, r2 ' CVI, CVU or LOAD
' C_sejo2t_6709f8b0_finaltarget_L000625_626 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaK_finish

 alignl ' align long
C_luaK__finish ' <symbol:luaK_finish>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaK__finish_637 ' JUMPV addrg
C_luaK__finish_634
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r19
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 and r22, #127 ' BANDU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, #56 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_luaK__finish_649 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_luaK__finish_639 ' LTI4
' C_luaK__finish_650 ' (symbol refcount = 0)
 cmps r15,  #69 wz,wc
 jmp #BR_B
 long @C_luaK__finish_639 ' LTI4
 cmps r15,  #72 wz,wc
 jmp #BR_A
 long @C_luaK__finish_639 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaK__finish_651_L000653-276
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

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
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaK__finish_642 ' NEI4
 mov r20, r19
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaK__finish_642 ' NEI4
 jmp #JMPA
 long @C_luaK__finish_639 ' JUMPV addrg
C_luaK__finish_642
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff80
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 or r22, #70 ' BORU4 coni
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_luaK__finish_644
 mov r22, r23
 adds r22, #54 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaK__finish_645 ' EQI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff7fff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 jmp #LODL
 long $8000
 mov r20, RI ' reg <- con
 or r22, r20 ' BORI/U (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_luaK__finish_645
 mov r22, r19
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaK__finish_639 ' EQI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r20, r19
 adds r20, #6 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 adds r20, #1 ' ADDI4 coni
 shl r20, #24 ' LSHU4 coni
 jmp #LODL
 long $ff000000
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r22, r20 ' BORI/U (1)
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_luaK__finish_639 ' JUMPV addrg
C_luaK__finish_649
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sejo2t_6709f8b0_finaltarget_L000625
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
 jmp #CALA
 long @C_sejo8_6709f8b0_fixjump_L000077
 add SP, #8 ' CALL addrg
C_luaK__finish_639
' C_luaK__finish_635 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_luaK__finish_637
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r21, r22 wz,wc
 jmp #BR_B
 long @C_luaK__finish_634 ' LTI4
' C_luaK__finish_633 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


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
C_sejo25_6709f8b0_validop_L000457_472_L000473 ' <symbol:472>
 long $0 ' float

 alignl ' align long
C_sejov_6709f8b0_luaK__numberK__L000197_201_L000202 ' <symbol:201>
 long $3f800000 ' float

 alignl ' align long
C_sejor_6709f8b0_addk_L000180_186_L000187 ' <symbol:186>
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
C_sejof_6709f8b0_savelineinfo_L000126_133_L000134 ' <symbol:133>
 byte 111
 byte 112
 byte 99
 byte 111
 byte 100
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sejof_6709f8b0_savelineinfo_L000126_131_L000132 ' <symbol:131>
 byte 108
 byte 105
 byte 110
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sejo8_6709f8b0_fixjump_L000077_82_L000083 ' <symbol:82>
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
