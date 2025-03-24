' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaO__ceillog2_log_2_L000017 ' <symbol:log_2>
 byte 0
 byte 1
 byte 2
 byte 2
 byte 3
 byte 3
 byte 3
 byte 3
 byte 4
 byte 4
 byte 4
 byte 4
 byte 4
 byte 4
 byte 4
 byte 4
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 5
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 6
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 7
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8
 byte 8

' Catalina Export luaO_ceillog2

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaO__ceillog2 ' <symbol:luaO_ceillog2>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, #0 ' reg <- coni
 sub r2, #1 ' SUBU4 coni
 jmp #JMPA
 long @C_luaO__ceillog2_19 ' JUMPV addrg
C_luaO__ceillog2_18
 mov r22, #8 ' reg <- coni
 adds r23, #8 ' ADDI4 coni
 shr r2, r22 ' RSHU (1)
C_luaO__ceillog2_19
 cmp r2,  #256 wz,wc 
 jmp #BRAE
 long @C_luaO__ceillog2_18 ' GEU4
 jmp #LODL
 long @C_luaO__ceillog2_log_2_L000017
 mov r22, RI ' reg <- addrg
 adds r22, r2 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r23 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
' C_luaO__ceillog2_15 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sl9g1_67da3f21_intarith_L000021 ' <symbol:intarith>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21,  #0 wz,wc
 jmp #BR_B
 long @C_sl9g1_67da3f21_intarith_L000021_23 ' LTI4
 cmps r21,  #13 wz,wc
 jmp #BR_A
 long @C_sl9g1_67da3f21_intarith_L000021_23 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sl9g1_67da3f21_intarith_L000021_37_L000039
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sl9g1_67da3f21_intarith_L000021_37_L000039 ' <symbol:37>
 long @C_sl9g1_67da3f21_intarith_L000021_25
 long @C_sl9g1_67da3f21_intarith_L000021_26
 long @C_sl9g1_67da3f21_intarith_L000021_27
 long @C_sl9g1_67da3f21_intarith_L000021_28
 long @C_sl9g1_67da3f21_intarith_L000021_23
 long @C_sl9g1_67da3f21_intarith_L000021_23
 long @C_sl9g1_67da3f21_intarith_L000021_29
 long @C_sl9g1_67da3f21_intarith_L000021_30
 long @C_sl9g1_67da3f21_intarith_L000021_31
 long @C_sl9g1_67da3f21_intarith_L000021_32
 long @C_sl9g1_67da3f21_intarith_L000021_33
 long @C_sl9g1_67da3f21_intarith_L000021_34
 long @C_sl9g1_67da3f21_intarith_L000021_35
 long @C_sl9g1_67da3f21_intarith_L000021_36

' Catalina Code

DAT ' code segment
C_sl9g1_67da3f21_intarith_L000021_25
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_26
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_27
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_28
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__mod
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_29
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__idiv
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_30
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 and r22, r20 ' BANDI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_31
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 or r22, r20 ' BORI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_32
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 xor r22, r20 ' BXORI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_33
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__shiftl
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_34
 neg r2, r17 ' NEGI4
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__shiftl
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_35
 mov r22, #0 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_36
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 xor r22, r20 ' BXORI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g1_67da3f21_intarith_L000021_22 ' JUMPV addrg
C_sl9g1_67da3f21_intarith_L000021_23
 mov r0, #0 ' reg <- coni
C_sl9g1_67da3f21_intarith_L000021_22
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sl9g4_67da3f21_numarith_L000040 ' <symbol:numarith>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21,  #0 wz,wc
 jmp #BR_B
 long @C_sl9g4_67da3f21_numarith_L000040_42 ' LTI4
 cmps r21,  #12 wz,wc
 jmp #BR_A
 long @C_sl9g4_67da3f21_numarith_L000040_42 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sl9g4_67da3f21_numarith_L000040_59_L000061
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sl9g4_67da3f21_numarith_L000040_59_L000061 ' <symbol:59>
 long @C_sl9g4_67da3f21_numarith_L000040_44
 long @C_sl9g4_67da3f21_numarith_L000040_45
 long @C_sl9g4_67da3f21_numarith_L000040_46
 long @C_sl9g4_67da3f21_numarith_L000040_56
 long @C_sl9g4_67da3f21_numarith_L000040_48
 long @C_sl9g4_67da3f21_numarith_L000040_47
 long @C_sl9g4_67da3f21_numarith_L000040_54
 long @C_sl9g4_67da3f21_numarith_L000040_42
 long @C_sl9g4_67da3f21_numarith_L000040_42
 long @C_sl9g4_67da3f21_numarith_L000040_42
 long @C_sl9g4_67da3f21_numarith_L000040_42
 long @C_sl9g4_67da3f21_numarith_L000040_42
 long @C_sl9g4_67da3f21_numarith_L000040_55

' Catalina Code

DAT ' code segment
C_sl9g4_67da3f21_numarith_L000040_44
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_41 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_45
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_41 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_46
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_41 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_47
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_41 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_48
 jmp #LODI
 long @C_sl9g4_67da3f21_numarith_L000040_52_L000053
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_sl9g4_67da3f21_numarith_L000040_50 ' NEF4
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_51 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_50
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_sl9g4_67da3f21_numarith_L000040_51
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_41 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_54
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_floor ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_41 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_55
 mov r0, r19
 xor r0, Bit31 ' NEGF4
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_41 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_56
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__modf
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9g4_67da3f21_numarith_L000040_41 ' JUMPV addrg
C_sl9g4_67da3f21_numarith_L000040_42
 jmp #LODI
 long @C_sl9g4_67da3f21_numarith_L000040_57_L000058
 mov r0, RI ' reg <- INDIRF4 addrg
C_sl9g4_67da3f21_numarith_L000040_41
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaO_rawarith

 alignl ' align long
C_luaO__rawarith ' <symbol:luaO_rawarith>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r23,  #4 wz,wc
 jmp #BR_B
 long @C_luaO__rawarith_63 ' LTI4
 cmps r23,  #13 wz,wc
 jmp #BR_A
 long @C_luaO__rawarith_63 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaO__rawarith_105_L000107-16
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaO__rawarith_105_L000107 ' <symbol:105>
 long @C_luaO__rawarith_74
 long @C_luaO__rawarith_74
 long @C_luaO__rawarith_63
 long @C_luaO__rawarith_65
 long @C_luaO__rawarith_65
 long @C_luaO__rawarith_65
 long @C_luaO__rawarith_65
 long @C_luaO__rawarith_65
 long @C_luaO__rawarith_63
 long @C_luaO__rawarith_65

' Catalina Code

DAT ' code segment
C_luaO__rawarith_65
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_70 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_71 ' JUMPV addrg
C_luaO__rawarith_70
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
 mov r15, r22 ' CVI, CVU or LOAD
C_luaO__rawarith_71
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_66 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_72 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_73 ' JUMPV addrg
C_luaO__rawarith_72
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__tointegerns
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_luaO__rawarith_73
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_66 ' EQI4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9g1_67da3f21_intarith_L000021
 add SP, #12 ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_62 ' JUMPV addrg
C_luaO__rawarith_66
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_62 ' JUMPV addrg
C_luaO__rawarith_74
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaO__rawarith_81 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_82 ' JUMPV addrg
C_luaO__rawarith_81
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_83 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_84 ' JUMPV addrg
C_luaO__rawarith_83
 mov r13, #0 ' reg <- coni
C_luaO__rawarith_84
 mov r15, r13 ' CVI, CVU or LOAD
C_luaO__rawarith_82
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_75 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaO__rawarith_85 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_86 ' JUMPV addrg
C_luaO__rawarith_85
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_87 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_88 ' JUMPV addrg
C_luaO__rawarith_87
 mov r9, #0 ' reg <- coni
C_luaO__rawarith_88
 mov r11, r9 ' CVI, CVU or LOAD
C_luaO__rawarith_86
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_75 ' EQI4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9g4_67da3f21_numarith_L000040
 add SP, #12 ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_62 ' JUMPV addrg
C_luaO__rawarith_75
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_62 ' JUMPV addrg
C_luaO__rawarith_63
 mov r22, #3 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaO__rawarith_89 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaO__rawarith_89 ' NEI4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov RI, r21
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9g1_67da3f21_intarith_L000021
 add SP, #12 ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_62 ' JUMPV addrg
C_luaO__rawarith_89
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaO__rawarith_97 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_98 ' JUMPV addrg
C_luaO__rawarith_97
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_99 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_100 ' JUMPV addrg
C_luaO__rawarith_99
 mov r13, #0 ' reg <- coni
C_luaO__rawarith_100
 mov r15, r13 ' CVI, CVU or LOAD
C_luaO__rawarith_98
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_91 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaO__rawarith_101 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNF4 addrli reg
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_102 ' JUMPV addrg
C_luaO__rawarith_101
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_103 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_104 ' JUMPV addrg
C_luaO__rawarith_103
 mov r9, #0 ' reg <- coni
C_luaO__rawarith_104
 mov r11, r9 ' CVI, CVU or LOAD
C_luaO__rawarith_102
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_91 ' EQI4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9g4_67da3f21_numarith_L000040
 add SP, #12 ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_62 ' JUMPV addrg
C_luaO__rawarith_91
 mov r0, #0 ' reg <- coni
C_luaO__rawarith_62
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaO_arith

 alignl ' align long
C_luaO__arith ' <symbol:luaO_arith>
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
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaO__rawarith
 add SP, #16 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaO__arith_110 ' NEI4
 mov r2, r23
 adds r2, #6 ' ADDI4 coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
C_luaO__arith_110
' C_luaO__arith_109 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaO_hexavalue

 alignl ' align long
C_luaO__hexavalue ' <symbol:luaO_hexavalue>
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODL
 long @C_luai_ctype_+1
 mov r22, RI ' reg <- addrg
 adds r22, r2 ' ADDI/P (2)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaO__hexavalue_113 ' EQI4
 mov r0, r2
 subs r0, #48 ' SUBI4 coni
 jmp #JMPA
 long @C_luaO__hexavalue_112 ' JUMPV addrg
C_luaO__hexavalue_113
 mov r22, r2
 or r22, #32 ' BORI4 coni
 subs r22, #97 ' SUBI4 coni
 mov r0, r22
 adds r0, #10 ' ADDI4 coni
C_luaO__hexavalue_112
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sl9gb_67da3f21_isneg_L000116 ' <symbol:isneg>
 jmp #PSHM
 long $400000 ' save registers
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C_sl9gb_67da3f21_isneg_L000116_118 ' NEI4
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sl9gb_67da3f21_isneg_L000116_117 ' JUMPV addrg
C_sl9gb_67da3f21_isneg_L000116_118
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C_sl9gb_67da3f21_isneg_L000116_120 ' NEI4
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
C_sl9gb_67da3f21_isneg_L000116_120
 mov r0, #0 ' reg <- coni
C_sl9gb_67da3f21_isneg_L000116_117
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sl9gc_67da3f21_lua_strx2number_L000122 ' <symbol:lua_strx2number>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faaa00 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r3, RI ' spill reg
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_localeconv ' CALL addrg
 mov RI, r0
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 jmp #LODI
 long @C_sl9g4_67da3f21_numarith_L000040_57_L000058
 mov r13, RI ' reg <- INDIRF4 addrg
 mov r17, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r15, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_125 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_124
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
C_sl9gc_67da3f21_lua_strx2number_L000122_125
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_124 ' NEI4
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sl9gb_67da3f21_isneg_L000116 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20,  #48 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_130 ' NEI4
 adds r22, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_128 ' EQI4
 cmps r22,  #88 wz
 jmp #BR_Z
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_128 ' EQI4
C_sl9gc_67da3f21_lua_strx2number_L000122_130
 jmp #LODI
 long @C_sl9g4_67da3f21_numarith_L000040_57_L000058
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_123 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_128
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #2 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
C_sl9gc_67da3f21_lua_strx2number_L000122_131
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_135 ' NEI4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_137 ' EQI4
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_133 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_137
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_136 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_135
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_133 ' EQI4
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_142 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_142 ' NEI4
 adds r11, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_143 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_142
 mov r22, r17
 adds r22, #1 ' ADDI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #30 wz,wc
 jmp #BR_A
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_144 ' GTI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__hexavalue ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_146_L000147
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_145 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_144
 adds r15, #1 ' ADDI4 coni
C_sl9gc_67da3f21_lua_strx2number_L000122_145
C_sl9gc_67da3f21_lua_strx2number_L000122_143
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_140 ' EQI4
 subs r15, #1 ' SUBI4 coni
C_sl9gc_67da3f21_lua_strx2number_L000122_140
C_sl9gc_67da3f21_lua_strx2number_L000122_136
' C_sl9gc_67da3f21_lua_strx2number_L000122_132 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_131 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_133
 mov r22, r11 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_150 ' NEI4
 jmp #LODI
 long @C_sl9g4_67da3f21_numarith_L000040_57_L000058
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_123 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_150
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 shl r15, #2 ' LSHI4 coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #112 wz
 jmp #BR_Z
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_154 ' EQI4
 cmps r22,  #80 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_152 ' NEI4
C_sl9gc_67da3f21_lua_strx2number_L000122_154
 mov r9, #0 ' reg <- coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sl9gb_67da3f21_isneg_L000116 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_159 ' NEI4
 jmp #LODI
 long @C_sl9g4_67da3f21_numarith_L000040_57_L000058
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_123 ' JUMPV addrg
C_sl9gc_67da3f21_lua_strx2number_L000122_158
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r20, RI ' ASGNP4 addrfi reg
 mov r20, #10 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 adds r22, r0 ' ADDI/P (2)
 mov r9, r22
 subs r9, #48 ' SUBI4 coni
C_sl9gc_67da3f21_lua_strx2number_L000122_159
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_158 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_162 ' EQI4
 neg r9, r9 ' NEGI4
C_sl9gc_67da3f21_lua_strx2number_L000122_162
 adds r15, r9 ' ADDI/P (1)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
C_sl9gc_67da3f21_lua_strx2number_L000122_152
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sl9gc_67da3f21_lua_strx2number_L000122_164 ' EQI4
 xor r13, Bit31 ' NEGF4
C_sl9gc_67da3f21_lua_strx2number_L000122_164
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sl9gc_67da3f21_lua_strx2number_L000122_123
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sl9ge_67da3f21_l_str2dloc_L000166 ' <symbol:l_str2dloc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #120 wz
 jmp #BRNZ
 long @C_sl9ge_67da3f21_l_str2dloc_L000166_169 ' NEI4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gc_67da3f21_lua_strx2number_L000122
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sl9ge_67da3f21_l_str2dloc_L000166_170 ' JUMPV addrg
C_sl9ge_67da3f21_l_str2dloc_L000166_169
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strtod
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_sl9ge_67da3f21_l_str2dloc_L000166_170
 mov RI, r21
 mov BC, r17
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sl9ge_67da3f21_l_str2dloc_L000166_174 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sl9ge_67da3f21_l_str2dloc_L000166_167 ' JUMPV addrg
C_sl9ge_67da3f21_l_str2dloc_L000166_173
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_sl9ge_67da3f21_l_str2dloc_L000166_174
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9ge_67da3f21_l_str2dloc_L000166_173 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9ge_67da3f21_l_str2dloc_L000166_178 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRP4 regl
 jmp #JMPA
 long @C_sl9ge_67da3f21_l_str2dloc_L000166_179 ' JUMPV addrg
C_sl9ge_67da3f21_l_str2dloc_L000166_178
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
C_sl9ge_67da3f21_l_str2dloc_L000166_179
 mov r0, r15 ' CVI, CVU or LOAD
C_sl9ge_67da3f21_l_str2dloc_L000166_167
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sl9gf_67da3f21_l_str2d_L000180 ' <symbol:l_str2d>
 jmp #NEWF
 sub SP, #208
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_sl9gf_67da3f21_l_str2d_L000180_182_L000183
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strpbrk
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sl9gf_67da3f21_l_str2d_L000180_185 ' EQU4
 mov RI, r15
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r13, r22
 or r13, #32 ' BORI4 coni
 jmp #JMPA
 long @C_sl9gf_67da3f21_l_str2d_L000180_186 ' JUMPV addrg
C_sl9gf_67da3f21_l_str2d_L000180_185
 mov r13, #0 ' reg <- coni
C_sl9gf_67da3f21_l_str2d_L000180_186
 mov r17, r13 ' CVI, CVU or LOAD
 cmps r17,  #110 wz
 jmp #BRNZ
 long @C_sl9gf_67da3f21_l_str2d_L000180_187 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sl9gf_67da3f21_l_str2d_L000180_181 ' JUMPV addrg
C_sl9gf_67da3f21_l_str2d_L000180_187
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9ge_67da3f21_l_str2dloc_L000166
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gf_67da3f21_l_str2d_L000180_189 ' NEU4
 mov r2, #46 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sl9gf_67da3f21_l_str2d_L000180_193 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #200 wz,wc 
 jmp #BRBE
 long @C_sl9gf_67da3f21_l_str2d_L000180_191 ' LEU4
C_sl9gf_67da3f21_l_str2d_L000180_193
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sl9gf_67da3f21_l_str2d_L000180_181 ' JUMPV addrg
C_sl9gf_67da3f21_l_str2d_L000180_191
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-212) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_localeconv ' CALL addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov r18, r23 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, FP
 sub r18, #-(-212) ' reg <- addrli
 adds r20, r18 ' ADDI/P (1)
 mov RI, r0
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-212) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9ge_67da3f21_l_str2dloc_L000166
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sl9gf_67da3f21_l_str2d_L000180_194 ' EQU4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-212) ' reg <- addrli
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' ADDI/P
 adds r19, r23 ' ADDI/P (3)
C_sl9gf_67da3f21_l_str2d_L000180_194
C_sl9gf_67da3f21_l_str2d_L000180_189
 mov r0, r19 ' CVI, CVU or LOAD
C_sl9gf_67da3f21_l_str2d_L000180_181
 jmp #POPM ' restore registers
 add SP, #208 ' framesize
 jmp #RETF


 alignl ' align long
C_sl9gh_67da3f21_l_str2int_L000196 ' <symbol:l_str2int>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov RI, FP
 add RI, #8
 wrlong r3, RI ' spill reg
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_sl9gh_67da3f21_l_str2int_L000196_199 ' JUMPV addrg
C_sl9gh_67da3f21_l_str2int_L000196_198
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
C_sl9gh_67da3f21_l_str2int_L000196_199
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gh_67da3f21_l_str2int_L000196_198 ' NEI4
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sl9gb_67da3f21_isneg_L000116 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20,  #48 wz
 jmp #BRNZ
 long @C_sl9gh_67da3f21_l_str2int_L000196_213 ' NEI4
 adds r22, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_sl9gh_67da3f21_l_str2int_L000196_204 ' EQI4
 cmps r22,  #88 wz
 jmp #BRNZ
 long @C_sl9gh_67da3f21_l_str2int_L000196_213 ' NEI4
C_sl9gh_67da3f21_l_str2int_L000196_204
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #2 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
 jmp #JMPA
 long @C_sl9gh_67da3f21_l_str2int_L000196_208 ' JUMPV addrg
C_sl9gh_67da3f21_l_str2int_L000196_205
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__hexavalue ' CALL addrg
 mov r20, r21
 shl r20, #4 ' LSHU4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r20 ' ADDU
 add r21, r22 ' ADDU (3)
 mov r19, #0 ' reg <- coni
' C_sl9gh_67da3f21_l_str2int_L000196_206 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
C_sl9gh_67da3f21_l_str2int_L000196_208
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gh_67da3f21_l_str2int_L000196_205 ' NEI4
 jmp #JMPA
 long @C_sl9gh_67da3f21_l_str2int_L000196_219 ' JUMPV addrg
C_sl9gh_67da3f21_l_str2int_L000196_210
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r15, r22
 subs r15, #48 ' SUBI4 coni
 jmp #LODL
 long $ccccccc
 mov r22, RI ' reg <- con
 cmp r21, r22 wz,wc 
 jmp #BR_B
 long @C_sl9gh_67da3f21_l_str2int_L000196_215' LTU4
 cmp r21, r22 wz,wc 
 jmp #BR_A
 long @C_sl9gh_67da3f21_l_str2int_L000196_217 ' GTU4
 mov r22, r17
 adds r22, #7 ' ADDI4 coni
 cmps r15, r22 wz,wc
 jmp #BRBE
 long @C_sl9gh_67da3f21_l_str2int_L000196_215 ' LEI4
C_sl9gh_67da3f21_l_str2int_L000196_217
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sl9gh_67da3f21_l_str2int_L000196_197 ' JUMPV addrg
C_sl9gh_67da3f21_l_str2int_L000196_215
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r21, r0 ' ADDU
 add r21, r22 ' ADDU (3)
 mov r19, #0 ' reg <- coni
' C_sl9gh_67da3f21_l_str2int_L000196_211 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
C_sl9gh_67da3f21_l_str2int_L000196_213
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gh_67da3f21_l_str2int_L000196_210 ' NEI4
 jmp #JMPA
 long @C_sl9gh_67da3f21_l_str2int_L000196_219 ' JUMPV addrg
C_sl9gh_67da3f21_l_str2int_L000196_218
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
C_sl9gh_67da3f21_l_str2int_L000196_219
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gh_67da3f21_l_str2int_L000196_218 ' NEI4
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_sl9gh_67da3f21_l_str2int_L000196_224 ' NEI4
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sl9gh_67da3f21_l_str2int_L000196_222 ' EQI4
C_sl9gh_67da3f21_l_str2int_L000196_224
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sl9gh_67da3f21_l_str2int_L000196_197 ' JUMPV addrg
C_sl9gh_67da3f21_l_str2int_L000196_222
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sl9gh_67da3f21_l_str2int_L000196_226 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' SUBU
 sub r15, r21 ' SUBU (3)
 jmp #JMPA
 long @C_sl9gh_67da3f21_l_str2int_L000196_227 ' JUMPV addrg
C_sl9gh_67da3f21_l_str2int_L000196_226
 mov r15, r21 ' CVI, CVU or LOAD
C_sl9gh_67da3f21_l_str2int_L000196_227
 mov r22, r15 ' CVI, CVU or LOAD
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r0, r22 ' reg <- INDIRP4 regl
C_sl9gh_67da3f21_l_str2int_L000196_197
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaO_str2num

 alignl ' align long
C_luaO__str2num ' <symbol:luaO_str2num>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gh_67da3f21_l_str2int_L000196
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaO__str2num_229 ' EQU4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaO__str2num_230 ' JUMPV addrg
C_luaO__str2num_229
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gf_67da3f21_l_str2d_L000180
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaO__str2num_231 ' EQU4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaO__str2num_232 ' JUMPV addrg
C_luaO__str2num_231
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaO__str2num_228 ' JUMPV addrg
C_luaO__str2num_232
C_luaO__str2num_230
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r23 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 adds r22, #1 ' ADDI4 coni
 mov r0, r22 ' CVI, CVU or LOAD
C_luaO__str2num_228
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export luaO_utf8esc

 alignl ' align long
C_luaO__utf8esc ' <symbol:luaO_utf8esc>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, #1 ' reg <- coni
 cmp r2,  #128 wz,wc 
 jmp #BRAE
 long @C_luaO__utf8esc_234 ' GEU4
 mov r22, r3
 adds r22, #7 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaO__utf8esc_235 ' JUMPV addrg
C_luaO__utf8esc_234
 mov r21, #63 ' reg <- coni
C_luaO__utf8esc_236
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDI4 coni
 mov r20, #8 ' reg <- coni
 subs r22, r20
 neg r22, r22 ' SUBI/P (2)
 adds r22, r3 ' ADDI/P (1)
 mov r20, r2
 and r20, #63 ' BANDU4 coni
 or r20, #128 ' BORU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 shr r2, #6 ' RSHU4 coni
 shr r21, #1 ' RSHU4 coni
' C_luaO__utf8esc_237 ' (symbol refcount = 0)
 cmp r2, r21 wz,wc 
 jmp #BR_A
 long @C_luaO__utf8esc_236 ' GTU4
 mov r22, #8 ' reg <- coni
 subs r22, r23 ' SUBI/P (1)
 adds r22, r3 ' ADDI/P (1)
 mov r20, r21
 xor r20, all_1s ' BCOMU4
 shl r20, #1 ' LSHU4 coni
 or r20, r2 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaO__utf8esc_235
 mov r0, r23 ' CVI, CVU or LOAD
' C_luaO__utf8esc_233 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sl9gi_67da3f21_tostringbuff_L000239 ' <symbol:tostringbuff>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sl9gi_67da3f21_tostringbuff_L000239_241 ' NEI4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_sl9gi_67da3f21_tostringbuff_L000239_243_L000244
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sl9gi_67da3f21_tostringbuff_L000239_242 ' JUMPV addrg
C_sl9gi_67da3f21_tostringbuff_L000239_241
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRF4 reg
 jmp #LODL
 long @C_sl9gi_67da3f21_tostringbuff_L000239_245_L000246
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #LODL
 long @C_sl9gi_67da3f21_tostringbuff_L000239_249_L000250
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sl9gi_67da3f21_tostringbuff_L000239_247 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_localeconv ' CALL addrg
 adds r22, r21 ' ADDI/P (1)
 mov RI, r0
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r20, RI ' ASGNI4 addrli reg
 adds r22, r21 ' ADDI/P (1)
 mov r20, #48 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sl9gi_67da3f21_tostringbuff_L000239_247
C_sl9gi_67da3f21_tostringbuff_L000239_242
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_sl9gi_67da3f21_tostringbuff_L000239_240 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaO_tostring

 alignl ' align long
C_luaO__tostring ' <symbol:luaO_tostring>
 jmp #NEWF
 sub SP, #48
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-48) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gi_67da3f21_tostringbuff_L000239
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-52)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-48) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
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
' C_luaO__tostring_251 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #48 ' framesize
 jmp #RETF


 alignl ' align long
C_sl9gm_67da3f21_pushstr_L000252 ' <symbol:pushstr>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov RI, r15
 mov BC, r13
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__concat
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_sl9gm_67da3f21_pushstr_L000252_253 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sl9gn_67da3f21_clearbuff_L000254 ' <symbol:clearbuff>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #12 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gm_67da3f21_pushstr_L000252
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_sl9gn_67da3f21_clearbuff_L000254_255 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sl9go_67da3f21_getbuff_L000256 ' <symbol:getbuff>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #200 ' reg <- coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r22, r20 ' SUBI/P (1)
 cmps r21, r22 wz,wc
 jmp #BRBE
 long @C_sl9go_67da3f21_getbuff_L000256_258 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sl9gn_67da3f21_clearbuff_L000254 ' CALL addrg
C_sl9go_67da3f21_getbuff_L000256_258
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_sl9go_67da3f21_getbuff_L000256_257 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sl9gp_67da3f21_addstr2buff_L000260 ' <symbol:addstr2buff>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #200 wz,wc 
 jmp #BR_A
 long @C_sl9gp_67da3f21_addstr2buff_L000260_262 ' GTU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9go_67da3f21_getbuff_L000256
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r19 ' CVI, CVU or LOAD
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_sl9gp_67da3f21_addstr2buff_L000260_263 ' JUMPV addrg
C_sl9gp_67da3f21_addstr2buff_L000260_262
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sl9gn_67da3f21_clearbuff_L000254 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gm_67da3f21_pushstr_L000252
 add SP, #8 ' CALL addrg
C_sl9gp_67da3f21_addstr2buff_L000260_263
' C_sl9gp_67da3f21_addstr2buff_L000260_261 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sl9gq_67da3f21_addnum2buff_L000264 ' <symbol:addnum2buff>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #44 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9go_67da3f21_getbuff_L000256
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gi_67da3f21_tostringbuff_L000239
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_sl9gq_67da3f21_addnum2buff_L000264_265 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaO_pushvfstring

 alignl ' align long
C_luaO__pushvfstring ' <symbol:luaO_pushvfstring>
 jmp #NEWF
 sub SP, #224
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-208)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-212)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-216)
 wrlong r23, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_luaO__pushvfstring_270 ' JUMPV addrg
C_luaO__pushvfstring_269
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gp_67da3f21_addstr2buff_L000260
 add SP, #8 ' CALL addrg
 mov r22, r17
 adds r22, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 mov r22, #85 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_288 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_A
 long @C_luaO__pushvfstring_296 ' GTI4
' C_luaO__pushvfstring_295 ' (symbol refcount = 0)
 mov r22, #37 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_290 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_luaO__pushvfstring_272 ' LTI4
' C_luaO__pushvfstring_297 ' (symbol refcount = 0)
 cmps r15,  #73 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_282 ' EQI4
 jmp #JMPA
 long @C_luaO__pushvfstring_272 ' JUMPV addrg
C_luaO__pushvfstring_296
 mov r22, #99 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_280 ' EQI4
 cmps r15,  #100 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_281 ' EQI4
 cmps r15,  #102 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_283 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_luaO__pushvfstring_272 ' LTI4
' C_luaO__pushvfstring_298 ' (symbol refcount = 0)
 cmps r15,  #112 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_284 ' EQI4
 cmps r15,  #115 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_275 ' EQI4
 jmp #JMPA
 long @C_luaO__pushvfstring_272 ' JUMPV addrg
C_luaO__pushvfstring_275
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaO__pushvfstring_276 ' NEU4
 jmp #LODL
 long @C_luaO__pushvfstring_278_L000279
 mov r13, RI ' reg <- addrg
C_luaO__pushvfstring_276
 mov r2, r13 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gp_67da3f21_addstr2buff_L000260
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_273 ' JUMPV addrg
C_luaO__pushvfstring_280
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-220)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gp_67da3f21_addstr2buff_L000260
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_273 ' JUMPV addrg
C_luaO__pushvfstring_281
 mov r13, FP
 sub r13, #-(-224) ' reg <- addrli
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r13
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gq_67da3f21_addnum2buff_L000264
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_273 ' JUMPV addrg
C_luaO__pushvfstring_282
 mov r13, FP
 sub r13, #-(-224) ' reg <- addrli
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, r13
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gq_67da3f21_addnum2buff_L000264
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_273 ' JUMPV addrg
C_luaO__pushvfstring_283
 mov r13, FP
 sub r13, #-(-224) ' reg <- addrli
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRF4 reg
 mov RI, r13
 mov BC, r22
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gq_67da3f21_addnum2buff_L000264
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_273 ' JUMPV addrg
C_luaO__pushvfstring_284
 mov r13, #20 ' reg <- coni
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9go_67da3f21_getbuff_L000256
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-220)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-224)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-224)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_luaO__pushvfstring_285_L000286
 mov r3, RI ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-220)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-228)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-208) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 sub r20, #-(-228) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-208)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_luaO__pushvfstring_273 ' JUMPV addrg
C_luaO__pushvfstring_288
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-224) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__utf8esc
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-216) ' reg <- addrli
 mov r3, r22 ' SUBI/P
 subs r3, r13 ' SUBI/P (3)
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gp_67da3f21_addstr2buff_L000260
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_273 ' JUMPV addrg
C_luaO__pushvfstring_290
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_luaO__pushvfstring_291_L000292
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gp_67da3f21_addstr2buff_L000260
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_273 ' JUMPV addrg
C_luaO__pushvfstring_272
 mov r22, r17
 adds r22, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luaO__pushvfstring_293_L000294
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #8 ' CALL addrg
C_luaO__pushvfstring_273
 mov r21, r17
 adds r21, #2 ' ADDP4 coni
C_luaO__pushvfstring_270
 mov r2, #37 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaO__pushvfstring_269 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sl9gp_67da3f21_addstr2buff_L000260
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-216) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sl9gn_67da3f21_clearbuff_L000254 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
' C_luaO__pushvfstring_266 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #224 ' framesize
 jmp #RETF


' Catalina Export luaO_pushfstring

 alignl ' align long
C_luaO__pushfstring ' <symbol:luaO_pushfstring>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22 , RI ' ASGNP4 addrli reg
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
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
' C_luaO__pushfstring_299 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaO_chunkid

 alignl ' align long
C_luaO__chunkid ' <symbol:luaO_chunkid>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #60 ' reg <- coni
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #61 wz
 jmp #BRNZ
 long @C_luaO__chunkid_302 ' NEI4
 cmp r19, r17 wz,wc 
 jmp #BR_A
 long @C_luaO__chunkid_304 ' GTU4
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21
 adds r3, #1 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__chunkid_303 ' JUMPV addrg
C_luaO__chunkid_304
 mov r22, #1 ' reg <- coni
 mov r20, r17
 sub r20, #1 ' SUBU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21
 adds r3, #1 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r17
 sub r22, #1 ' SUBU4 coni
 adds r23, r22 ' ADDI/P (2)
 mov r22, #0 ' reg <- coni
 mov RI, r23
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaO__chunkid_303 ' JUMPV addrg
C_luaO__chunkid_302
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #64 wz
 jmp #BRNZ
 long @C_luaO__chunkid_306 ' NEI4
 cmp r19, r17 wz,wc 
 jmp #BR_A
 long @C_luaO__chunkid_308 ' GTU4
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21
 adds r3, #1 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__chunkid_307 ' JUMPV addrg
C_luaO__chunkid_308
 mov r2, #3 ' reg ARG coni
 jmp #LODL
 long @C_luaO__chunkid_310_L000311
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r23, #3 ' ADDP4 coni
 sub r17, #3 ' SUBU4 coni
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 adds r22, r19 ' ADDI/P (2)
 mov r3, r22 ' SUBI/P
 subs r3, r17 ' SUBI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__chunkid_307 ' JUMPV addrg
C_luaO__chunkid_306
 mov r2, #10 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #9 ' reg ARG coni
 jmp #LODL
 long @C_luaO__chunkid_312_L000313
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r23, #9 ' ADDP4 coni
 sub r17, #15 ' SUBU4 coni
 cmp r19, r17 wz,wc 
 jmp #BRAE
 long @C_luaO__chunkid_316 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaO__chunkid_316 ' NEU4
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r23, r19 ' ADDI/P (2)
 jmp #JMPA
 long @C_luaO__chunkid_317 ' JUMPV addrg
C_luaO__chunkid_316
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaO__chunkid_318 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
C_luaO__chunkid_318
 cmp r19, r17 wz,wc 
 jmp #BRBE
 long @C_luaO__chunkid_320 ' LEU4
 mov r19, r17 ' CVI, CVU or LOAD
C_luaO__chunkid_320
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r23, r19 ' ADDI/P (2)
 mov r2, #3 ' reg ARG coni
 jmp #LODL
 long @C_luaO__chunkid_310_L000311
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r23, #3 ' ADDP4 coni
C_luaO__chunkid_317
 mov r2, #3 ' reg ARG coni
 jmp #LODL
 long @C_luaO__chunkid_322_L000323
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_luaO__chunkid_307
C_luaO__chunkid_303
' C_luaO__chunkid_301 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import luaV_shiftl

' Catalina Import luaV_modf

' Catalina Import luaV_mod

' Catalina Import luaV_idiv

' Catalina Import luaV_concat

' Catalina Import luaV_tointegerns

' Catalina Import luaS_newlstr

' Catalina Import luaG_runerror

' Catalina Import luaT_trybinTM

' Catalina Import luai_ctype_

' Catalina Import strlen

' Catalina Import strspn

' Catalina Import strpbrk

' Catalina Import strchr

' Catalina Import strcpy

' Catalina Import memcpy

' Catalina Import strtod

' Catalina Import sprintf

' Catalina Import ldexp

' Catalina Import pow

' Catalina Import floor

' Catalina Import localeconv

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaO__chunkid_322_L000323 ' <symbol:322>
 byte 34
 byte 93
 byte 0

 alignl ' align long
C_luaO__chunkid_314_L000315 ' <symbol:314>
 byte 91
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 34
 byte 46
 byte 46
 byte 46
 byte 34
 byte 93
 byte 0

 alignl ' align long
C_luaO__chunkid_312_L000313 ' <symbol:312>
 byte 91
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 34
 byte 0

 alignl ' align long
C_luaO__chunkid_310_L000311 ' <symbol:310>
 byte 46
 byte 46
 byte 46
 byte 0

 alignl ' align long
C_luaO__pushvfstring_293_L000294 ' <symbol:293>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
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
 byte 37
 byte 37
 byte 99
 byte 39
 byte 32
 byte 116
 byte 111
 byte 32
 byte 39
 byte 108
 byte 117
 byte 97
 byte 95
 byte 112
 byte 117
 byte 115
 byte 104
 byte 102
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 39
 byte 0

 alignl ' align long
C_luaO__pushvfstring_291_L000292 ' <symbol:291>
 byte 37
 byte 0

 alignl ' align long
C_luaO__pushvfstring_285_L000286 ' <symbol:285>
 byte 37
 byte 112
 byte 0

 alignl ' align long
C_luaO__pushvfstring_278_L000279 ' <symbol:278>
 byte 40
 byte 110
 byte 117
 byte 108
 byte 108
 byte 41
 byte 0

 alignl ' align long
C_sl9gi_67da3f21_tostringbuff_L000239_249_L000250 ' <symbol:249>
 byte 45
 byte 48
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 0

 alignl ' align long
C_sl9gi_67da3f21_tostringbuff_L000239_245_L000246 ' <symbol:245>
 byte 37
 byte 46
 byte 55
 byte 103
 byte 0

 alignl ' align long
C_sl9gi_67da3f21_tostringbuff_L000239_243_L000244 ' <symbol:243>
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_sl9gf_67da3f21_l_str2d_L000180_182_L000183 ' <symbol:182>
 byte 46
 byte 120
 byte 88
 byte 110
 byte 78
 byte 0

 alignl ' align long
C_sl9gc_67da3f21_lua_strx2number_L000122_146_L000147 ' <symbol:146>
 long $41800000 ' float

 alignl ' align long
C_sl9g4_67da3f21_numarith_L000040_57_L000058 ' <symbol:57>
 long $0 ' float

 alignl ' align long
C_sl9g4_67da3f21_numarith_L000040_52_L000053 ' <symbol:52>
 long $40000000 ' float

' Catalina Code

DAT ' code segment
' end
