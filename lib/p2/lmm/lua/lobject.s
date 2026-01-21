' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaO__ceillog2_log_2_L000019 ' <symbol:log_2>
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
 long @C_luaO__ceillog2_21 ' JUMPV addrg
C_luaO__ceillog2_20
 mov r22, #8 ' reg <- coni
 adds r23, #8 ' ADDI4 coni
 shr r2, r22 ' RSHU (1)
C_luaO__ceillog2_21
 cmp r2,  #256 wcz 
 jmp #BRAE
 long @C_luaO__ceillog2_20 ' GEU4
 jmp #LODL
 long @C_luaO__ceillog2_log_2_L000019
 mov r22, RI ' reg <- addrg
 adds r22, r2 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r23 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
' C_luaO__ceillog2_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_su641_696ddd96_intarith_L000023 ' <symbol:intarith>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21,  #0 wcz
 jmp #BR_B
 long @C_su641_696ddd96_intarith_L000023_25 ' LTI4
 cmps r21,  #13 wcz
 jmp #BR_A
 long @C_su641_696ddd96_intarith_L000023_25 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_su641_696ddd96_intarith_L000023_39_L000041
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_su641_696ddd96_intarith_L000023_39_L000041 ' <symbol:39>
 long @C_su641_696ddd96_intarith_L000023_27
 long @C_su641_696ddd96_intarith_L000023_28
 long @C_su641_696ddd96_intarith_L000023_29
 long @C_su641_696ddd96_intarith_L000023_30
 long @C_su641_696ddd96_intarith_L000023_25
 long @C_su641_696ddd96_intarith_L000023_25
 long @C_su641_696ddd96_intarith_L000023_31
 long @C_su641_696ddd96_intarith_L000023_32
 long @C_su641_696ddd96_intarith_L000023_33
 long @C_su641_696ddd96_intarith_L000023_34
 long @C_su641_696ddd96_intarith_L000023_35
 long @C_su641_696ddd96_intarith_L000023_36
 long @C_su641_696ddd96_intarith_L000023_37
 long @C_su641_696ddd96_intarith_L000023_38

' Catalina Code

DAT ' code segment
C_su641_696ddd96_intarith_L000023_27
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_28
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_29
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_30
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
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_31
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
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_32
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 and r22, r20 ' BANDI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_33
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 or r22, r20 ' BORI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_34
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 xor r22, r20 ' BXORI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_35
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__shiftl
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_36
 mov r22, #0 ' reg <- coni
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__shiftl
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_37
 mov r22, #0 ' reg <- coni
 mov r20, r19 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_38
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 xor r22, r20 ' BXORI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su641_696ddd96_intarith_L000023_24 ' JUMPV addrg
C_su641_696ddd96_intarith_L000023_25
 mov r0, #0 ' RET coni
C_su641_696ddd96_intarith_L000023_24
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_su644_696ddd96_numarith_L000042 ' <symbol:numarith>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21,  #0 wcz
 jmp #BR_B
 long @C_su644_696ddd96_numarith_L000042_44 ' LTI4
 cmps r21,  #12 wcz
 jmp #BR_A
 long @C_su644_696ddd96_numarith_L000042_44 ' GTI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_su644_696ddd96_numarith_L000042_61_L000063
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_su644_696ddd96_numarith_L000042_61_L000063 ' <symbol:61>
 long @C_su644_696ddd96_numarith_L000042_46
 long @C_su644_696ddd96_numarith_L000042_47
 long @C_su644_696ddd96_numarith_L000042_48
 long @C_su644_696ddd96_numarith_L000042_58
 long @C_su644_696ddd96_numarith_L000042_50
 long @C_su644_696ddd96_numarith_L000042_49
 long @C_su644_696ddd96_numarith_L000042_56
 long @C_su644_696ddd96_numarith_L000042_44
 long @C_su644_696ddd96_numarith_L000042_44
 long @C_su644_696ddd96_numarith_L000042_44
 long @C_su644_696ddd96_numarith_L000042_44
 long @C_su644_696ddd96_numarith_L000042_44
 long @C_su644_696ddd96_numarith_L000042_57

' Catalina Code

DAT ' code segment
C_su644_696ddd96_numarith_L000042_46
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #JMPA
 long @C_su644_696ddd96_numarith_L000042_43 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_47
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 jmp #JMPA
 long @C_su644_696ddd96_numarith_L000042_43 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_48
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #JMPA
 long @C_su644_696ddd96_numarith_L000042_43 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_49
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 jmp #JMPA
 long @C_su644_696ddd96_numarith_L000042_43 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_50
 jmp #LODI
 long @C_su644_696ddd96_numarith_L000042_54_L000055
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_su644_696ddd96_numarith_L000042_52 ' NEF4
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su644_696ddd96_numarith_L000042_53 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_52
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_su644_696ddd96_numarith_L000042_53
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su644_696ddd96_numarith_L000042_43 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_56
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_floor ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su644_696ddd96_numarith_L000042_43 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_57
 mov r0, r19
 xor r0, Bit31 ' NEGF4
 jmp #JMPA
 long @C_su644_696ddd96_numarith_L000042_43 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_58
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
 long @C_su644_696ddd96_numarith_L000042_43 ' JUMPV addrg
C_su644_696ddd96_numarith_L000042_44
 jmp #LODI
 long @C_su644_696ddd96_numarith_L000042_59_L000060
 mov r0, RI ' reg <- INDIRF4 addrg
C_su644_696ddd96_numarith_L000042_43
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
 cmps r23,  #4 wcz
 jmp #BR_B
 long @C_luaO__rawarith_65 ' LTI4
 cmps r23,  #13 wcz
 jmp #BR_A
 long @C_luaO__rawarith_65 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaO__rawarith_107_L000109-16
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp #JMPI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaO__rawarith_107_L000109 ' <symbol:107>
 long @C_luaO__rawarith_76
 long @C_luaO__rawarith_76
 long @C_luaO__rawarith_65
 long @C_luaO__rawarith_67
 long @C_luaO__rawarith_67
 long @C_luaO__rawarith_67
 long @C_luaO__rawarith_67
 long @C_luaO__rawarith_67
 long @C_luaO__rawarith_65
 long @C_luaO__rawarith_67

' Catalina Code

DAT ' code segment
C_luaO__rawarith_67
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_72 ' NEI4
 rdlong r22, r21 ' reg <- INDIRI4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_73 ' JUMPV addrg
C_luaO__rawarith_72
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
C_luaO__rawarith_73
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_68 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_74 ' NEI4
 rdlong r22, r19 ' reg <- INDIRI4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_75 ' JUMPV addrg
C_luaO__rawarith_74
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
C_luaO__rawarith_75
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_68 ' EQI4
 jmp #LODF
 long -16
 wrlong r17, RI ' ASGNP4 addrl reg
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
 long @C_su641_696ddd96_intarith_L000023
 add SP, #12 ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaO__rawarith_64 ' JUMPV addrg
C_luaO__rawarith_68
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaO__rawarith_64 ' JUMPV addrg
C_luaO__rawarith_76
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaO__rawarith_83 ' NEI4
 rdlong r22, r21 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_84 ' JUMPV addrg
C_luaO__rawarith_83
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_85 ' NEI4
 rdlong r0, r21 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_86 ' JUMPV addrg
C_luaO__rawarith_85
 mov r13, #0 ' reg <- coni
C_luaO__rawarith_86
 mov r15, r13 ' CVI, CVU or LOAD
C_luaO__rawarith_84
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_77 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaO__rawarith_87 ' NEI4
 rdlong r22, r19 ' reg <- INDIRF4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_88 ' JUMPV addrg
C_luaO__rawarith_87
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_89 ' NEI4
 rdlong r0, r19 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_90 ' JUMPV addrg
C_luaO__rawarith_89
 mov r9, #0 ' reg <- coni
C_luaO__rawarith_90
 mov r11, r9 ' CVI, CVU or LOAD
C_luaO__rawarith_88
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_77 ' EQI4
 jmp #LODF
 long -16
 wrlong r17, RI ' ASGNP4 addrl reg
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
 long @C_su644_696ddd96_numarith_L000042
 add SP, #12 ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaO__rawarith_64 ' JUMPV addrg
C_luaO__rawarith_77
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaO__rawarith_64 ' JUMPV addrg
C_luaO__rawarith_65
 mov r22, #3 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaO__rawarith_91 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaO__rawarith_91 ' NEI4
 jmp #LODF
 long -16
 wrlong r17, RI ' ASGNP4 addrl reg
 rdlong r2, r19 ' reg <- INDIRI4 reg
 rdlong r3, r21 ' reg <- INDIRI4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_su641_696ddd96_intarith_L000023
 add SP, #12 ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaO__rawarith_64 ' JUMPV addrg
C_luaO__rawarith_91
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaO__rawarith_99 ' NEI4
 rdlong r22, r21 ' reg <- INDIRF4 reg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_100 ' JUMPV addrg
C_luaO__rawarith_99
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_101 ' NEI4
 rdlong r0, r21 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_102 ' JUMPV addrg
C_luaO__rawarith_101
 mov r13, #0 ' reg <- coni
C_luaO__rawarith_102
 mov r15, r13 ' CVI, CVU or LOAD
C_luaO__rawarith_100
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_93 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #19 wz
 jmp #BRNZ
 long @C_luaO__rawarith_103 ' NEI4
 rdlong r22, r19 ' reg <- INDIRF4 reg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNF4 addrl reg
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_104 ' JUMPV addrg
C_luaO__rawarith_103
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_luaO__rawarith_105 ' NEI4
 rdlong r0, r19 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaO__rawarith_106 ' JUMPV addrg
C_luaO__rawarith_105
 mov r9, #0 ' reg <- coni
C_luaO__rawarith_106
 mov r11, r9 ' CVI, CVU or LOAD
C_luaO__rawarith_104
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C_luaO__rawarith_93 ' EQI4
 jmp #LODF
 long -16
 wrlong r17, RI ' ASGNP4 addrl reg
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
 long @C_su644_696ddd96_numarith_L000042
 add SP, #12 ' CALL addrg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r0, r20 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_luaO__rawarith_64 ' JUMPV addrg
C_luaO__rawarith_93
 mov r0, #0 ' RET coni
C_luaO__rawarith_64
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
 long @C_luaO__arith_112 ' NEI4
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
C_luaO__arith_112
' C_luaO__arith_111 ' (symbol refcount = 0)
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
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaO__hexavalue_115 ' EQI4
 mov r0, r2
 subs r0, #48 ' SUBI4 coni
 jmp #JMPA
 long @C_luaO__hexavalue_114 ' JUMPV addrg
C_luaO__hexavalue_115
 mov r22, r2
 or r22, #32 ' BORI4 coni
 subs r22, #97 ' SUBI4 coni
 mov r0, r22
 adds r0, #10 ' ADDI4 coni
C_luaO__hexavalue_114
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_su64b_696ddd96_isneg_L000118 ' <symbol:isneg>
 jmp #PSHM
 long $400000 ' save registers
 rdlong r22, r2 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C_su64b_696ddd96_isneg_L000118_120 ' NEI4
 rdlong r22, r2 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 wrlong r22, r2 ' ASGNP4 reg reg
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_su64b_696ddd96_isneg_L000118_119 ' JUMPV addrg
C_su64b_696ddd96_isneg_L000118_120
 rdlong r22, r2 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C_su64b_696ddd96_isneg_L000118_122 ' NEI4
 rdlong r22, r2 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 wrlong r22, r2 ' ASGNP4 reg reg
C_su64b_696ddd96_isneg_L000118_122
 mov r0, #0 ' RET coni
C_su64b_696ddd96_isneg_L000118_119
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_su64c_696ddd96_lua_strx2number_L000124 ' <symbol:lua_strx2number>
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
 rdlong r22, r0 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 jmp #LODI
 long @C_su644_696ddd96_numarith_L000042_59_L000060
 mov r13, RI ' reg <- INDIRF4 addrg
 mov r17, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r15, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_127 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_126
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
C_su64c_696ddd96_lua_strx2number_L000124_127
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_126 ' NEI4
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_su64b_696ddd96_isneg_L000118 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20,  #48 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_132 ' NEI4
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_su64c_696ddd96_lua_strx2number_L000124_130 ' EQI4
 cmps r22,  #88 wz
 jmp #BR_Z
 long @C_su64c_696ddd96_lua_strx2number_L000124_130 ' EQI4
C_su64c_696ddd96_lua_strx2number_L000124_132
 jmp #LODI
 long @C_su644_696ddd96_numarith_L000042_59_L000060
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_125 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_130
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #2 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
C_su64c_696ddd96_lua_strx2number_L000124_133
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r21 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_137 ' NEI4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_su64c_696ddd96_lua_strx2number_L000124_139 ' EQI4
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_135 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_139
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_138 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_137
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_su64c_696ddd96_lua_strx2number_L000124_135 ' EQI4
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_144 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_144 ' NEI4
 adds r11, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_145 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_144
 mov r22, r17
 adds r22, #1 ' ADDI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #30 wcz
 jmp #BR_A
 long @C_su64c_696ddd96_lua_strx2number_L000124_146 ' GTI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaO__hexavalue ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_su64c_696ddd96_lua_strx2number_L000124_148_L000149
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_147 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_146
 adds r15, #1 ' ADDI4 coni
C_su64c_696ddd96_lua_strx2number_L000124_147
C_su64c_696ddd96_lua_strx2number_L000124_145
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_su64c_696ddd96_lua_strx2number_L000124_142 ' EQI4
 subs r15, #1 ' SUBI4 coni
C_su64c_696ddd96_lua_strx2number_L000124_142
C_su64c_696ddd96_lua_strx2number_L000124_138
' C_su64c_696ddd96_lua_strx2number_L000124_134 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_133 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_135
 mov r22, r11 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_152 ' NEI4
 jmp #LODI
 long @C_su644_696ddd96_numarith_L000042_59_L000060
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_125 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_152
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 shl r15, #2 ' LSHI4 coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #112 wz
 jmp #BR_Z
 long @C_su64c_696ddd96_lua_strx2number_L000124_156 ' EQI4
 cmps r22,  #80 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_154 ' NEI4
C_su64c_696ddd96_lua_strx2number_L000124_156
 mov r9, #0 ' reg <- coni
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_su64b_696ddd96_isneg_L000118 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_161 ' NEI4
 jmp #LODI
 long @C_su644_696ddd96_numarith_L000042_59_L000060
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_su64c_696ddd96_lua_strx2number_L000124_125 ' JUMPV addrg
C_su64c_696ddd96_lua_strx2number_L000124_160
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r20, RI ' ASGNP4 addrl reg
 mov r20, #10 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 adds r22, r0 ' ADDI/P (2)
 mov r9, r22
 subs r9, #48 ' SUBI4 coni
C_su64c_696ddd96_lua_strx2number_L000124_161
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64c_696ddd96_lua_strx2number_L000124_160 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_su64c_696ddd96_lua_strx2number_L000124_164 ' EQI4
 neg r9, r9 ' NEGI4
C_su64c_696ddd96_lua_strx2number_L000124_164
 adds r15, r9 ' ADDI/P (1)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
C_su64c_696ddd96_lua_strx2number_L000124_154
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_su64c_696ddd96_lua_strx2number_L000124_166 ' EQI4
 xor r13, Bit31 ' NEGF4
C_su64c_696ddd96_lua_strx2number_L000124_166
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_su64c_696ddd96_lua_strx2number_L000124_125
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_su64e_696ddd96_l_str2dloc_L000168 ' <symbol:l_str2dloc>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #120 wz
 jmp #BRNZ
 long @C_su64e_696ddd96_l_str2dloc_L000168_171 ' NEI4
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64c_696ddd96_lua_strx2number_L000124
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_su64e_696ddd96_l_str2dloc_L000168_172 ' JUMPV addrg
C_su64e_696ddd96_l_str2dloc_L000168_171
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
C_su64e_696ddd96_l_str2dloc_L000168_172
 wrlong r17, r21 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_su64e_696ddd96_l_str2dloc_L000168_176 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_su64e_696ddd96_l_str2dloc_L000168_169 ' JUMPV addrg
C_su64e_696ddd96_l_str2dloc_L000168_175
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
C_su64e_696ddd96_l_str2dloc_L000168_176
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64e_696ddd96_l_str2dloc_L000168_175 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64e_696ddd96_l_str2dloc_L000168_180 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_su64e_696ddd96_l_str2dloc_L000168_181 ' JUMPV addrg
C_su64e_696ddd96_l_str2dloc_L000168_180
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
C_su64e_696ddd96_l_str2dloc_L000168_181
 mov r0, r15 ' CVI, CVU or LOAD
C_su64e_696ddd96_l_str2dloc_L000168_169
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_su64f_696ddd96_l_str2d_L000182 ' <symbol:l_str2d>
 jmp #NEWF
 sub SP, #208
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_su64f_696ddd96_l_str2d_L000182_184_L000185
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
 long @C_su64f_696ddd96_l_str2d_L000182_187 ' EQU4
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r13, r22
 or r13, #32 ' BORI4 coni
 jmp #JMPA
 long @C_su64f_696ddd96_l_str2d_L000182_188 ' JUMPV addrg
C_su64f_696ddd96_l_str2d_L000182_187
 mov r13, #0 ' reg <- coni
C_su64f_696ddd96_l_str2d_L000182_188
 mov r17, r13 ' CVI, CVU or LOAD
 cmps r17,  #110 wz
 jmp #BRNZ
 long @C_su64f_696ddd96_l_str2d_L000182_189 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_su64f_696ddd96_l_str2d_L000182_183 ' JUMPV addrg
C_su64f_696ddd96_l_str2d_L000182_189
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64e_696ddd96_l_str2dloc_L000168
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_su64f_696ddd96_l_str2d_L000182_191 ' NEU4
 mov r2, #46 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_su64f_696ddd96_l_str2d_L000182_195 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #200 wcz 
 jmp #BRBE
 long @C_su64f_696ddd96_l_str2d_L000182_193 ' LEU4
C_su64f_696ddd96_l_str2d_L000182_195
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_su64f_696ddd96_l_str2d_L000182_183 ' JUMPV addrg
C_su64f_696ddd96_l_str2d_L000182_193
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
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r18, r23 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, FP
 sub r18, #-(-212) ' reg <- addrli
 adds r20, r18 ' ADDI/P (1)
 rdlong r22, r0 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-212) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64e_696ddd96_l_str2dloc_L000168
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_su64f_696ddd96_l_str2d_L000182_196 ' EQU4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-212) ' reg <- addrli
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' ADDI/P
 adds r19, r23 ' ADDI/P (3)
C_su64f_696ddd96_l_str2d_L000182_196
C_su64f_696ddd96_l_str2d_L000182_191
 mov r0, r19 ' CVI, CVU or LOAD
C_su64f_696ddd96_l_str2d_L000182_183
 jmp #POPM ' restore registers
 add SP, #208 ' framesize
 jmp #RETF


 alignl ' align long
C_su64h_696ddd96_l_str2int_L000198 ' <symbol:l_str2int>
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
 long @C_su64h_696ddd96_l_str2int_L000198_201 ' JUMPV addrg
C_su64h_696ddd96_l_str2int_L000198_200
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
C_su64h_696ddd96_l_str2int_L000198_201
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64h_696ddd96_l_str2int_L000198_200 ' NEI4
 mov r2, FP
 add r2, #8 ' reg ARG ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_su64b_696ddd96_isneg_L000118 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20,  #48 wz
 jmp #BRNZ
 long @C_su64h_696ddd96_l_str2int_L000198_215 ' NEI4
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_su64h_696ddd96_l_str2int_L000198_206 ' EQI4
 cmps r22,  #88 wz
 jmp #BRNZ
 long @C_su64h_696ddd96_l_str2int_L000198_215 ' NEI4
C_su64h_696ddd96_l_str2int_L000198_206
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #2 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_su64h_696ddd96_l_str2int_L000198_210 ' JUMPV addrg
C_su64h_696ddd96_l_str2int_L000198_207
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
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
' C_su64h_696ddd96_l_str2int_L000198_208 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
C_su64h_696ddd96_l_str2int_L000198_210
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64h_696ddd96_l_str2int_L000198_207 ' NEI4
 jmp #JMPA
 long @C_su64h_696ddd96_l_str2int_L000198_221 ' JUMPV addrg
C_su64h_696ddd96_l_str2int_L000198_212
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r15, r22
 subs r15, #48 ' SUBI4 coni
 jmp #LODL
 long $ccccccc
 mov r22, RI ' reg <- con
 cmp r21, r22 wcz 
 jmp #BR_B
 long @C_su64h_696ddd96_l_str2int_L000198_217' LTU4
 cmp r21, r22 wcz 
 jmp #BR_A
 long @C_su64h_696ddd96_l_str2int_L000198_219 ' GTU4
 mov r22, r17
 adds r22, #7 ' ADDI4 coni
 cmps r15, r22 wcz
 jmp #BRBE
 long @C_su64h_696ddd96_l_str2int_L000198_217 ' LEI4
C_su64h_696ddd96_l_str2int_L000198_219
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_su64h_696ddd96_l_str2int_L000198_199 ' JUMPV addrg
C_su64h_696ddd96_l_str2int_L000198_217
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r21, r0 ' ADDU
 add r21, r22 ' ADDU (3)
 mov r19, #0 ' reg <- coni
' C_su64h_696ddd96_l_str2int_L000198_213 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
C_su64h_696ddd96_l_str2int_L000198_215
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64h_696ddd96_l_str2int_L000198_212 ' NEI4
 jmp #JMPA
 long @C_su64h_696ddd96_l_str2int_L000198_221 ' JUMPV addrg
C_su64h_696ddd96_l_str2int_L000198_220
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
C_su64h_696ddd96_l_str2int_L000198_221
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luai_ctype_+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64h_696ddd96_l_str2int_L000198_220 ' NEI4
 mov r22, #0 ' reg <- coni
 cmps r19, r22 wz
 jmp #BRNZ
 long @C_su64h_696ddd96_l_str2int_L000198_226 ' NEI4
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_su64h_696ddd96_l_str2int_L000198_224 ' EQI4
C_su64h_696ddd96_l_str2int_L000198_226
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_su64h_696ddd96_l_str2int_L000198_199 ' JUMPV addrg
C_su64h_696ddd96_l_str2int_L000198_224
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_su64h_696ddd96_l_str2int_L000198_228 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' SUBU
 sub r15, r21 ' SUBU (3)
 jmp #JMPA
 long @C_su64h_696ddd96_l_str2int_L000198_229 ' JUMPV addrg
C_su64h_696ddd96_l_str2int_L000198_228
 mov r15, r21 ' CVI, CVU or LOAD
C_su64h_696ddd96_l_str2int_L000198_229
 mov r22, r15 ' CVI, CVU or LOAD
 wrlong r22, r23 ' ASGNI4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r0, r22 ' reg <- INDIRP4 reg
C_su64h_696ddd96_l_str2int_L000198_199
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
 long @C_su64h_696ddd96_l_str2int_L000198
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaO__str2num_231 ' EQU4
 jmp #LODF
 long -20
 wrlong r21, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaO__str2num_232 ' JUMPV addrg
C_luaO__str2num_231
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64f_696ddd96_l_str2d_L000182
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaO__str2num_233 ' EQU4
 jmp #LODF
 long -20
 wrlong r21, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 wrlong r20, r22 ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaO__str2num_234 ' JUMPV addrg
C_luaO__str2num_233
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_luaO__str2num_230 ' JUMPV addrg
C_luaO__str2num_234
C_luaO__str2num_232
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 adds r22, #1 ' ADDI4 coni
 mov r0, r22 ' CVI, CVU or LOAD
C_luaO__str2num_230
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export luaO_utf8esc

 alignl ' align long
C_luaO__utf8esc ' <symbol:luaO_utf8esc>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, #1 ' reg <- coni
 cmp r2,  #128 wcz 
 jmp #BRAE
 long @C_luaO__utf8esc_236 ' GEU4
 mov r22, r3
 adds r22, #7 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaO__utf8esc_237 ' JUMPV addrg
C_luaO__utf8esc_236
 mov r21, #63 ' reg <- coni
C_luaO__utf8esc_238
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
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r2, #6 ' RSHU4 coni
 shr r21, #1 ' RSHU4 coni
' C_luaO__utf8esc_239 ' (symbol refcount = 0)
 cmp r2, r21 wcz 
 jmp #BR_A
 long @C_luaO__utf8esc_238 ' GTU4
 mov r22, #8 ' reg <- coni
 subs r22, r23 ' SUBI/P (1)
 adds r22, r3 ' ADDI/P (1)
 mov r20, r21
 xor r20, all_1s ' BCOMU4
 shl r20, #1 ' LSHU4 coni
 or r20, r2 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaO__utf8esc_237
 mov r0, r23 ' CVI, CVU or LOAD
' C_luaO__utf8esc_235 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_su64i_696ddd96_tostringbuff_L000241 ' <symbol:tostringbuff>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_su64i_696ddd96_tostringbuff_L000241_243 ' NEI4
 rdlong r2, r23 ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_su64i_696ddd96_tostringbuff_L000241_245_L000246
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_su64i_696ddd96_tostringbuff_L000241_244 ' JUMPV addrg
C_su64i_696ddd96_tostringbuff_L000241_243
 rdlong r2, r23 ' reg <- INDIRF4 reg
 jmp #LODL
 long @C_su64i_696ddd96_tostringbuff_L000241_247_L000248
 mov r3, RI ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #LODL
 long @C_su64i_696ddd96_tostringbuff_L000241_251_L000252
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64i_696ddd96_tostringbuff_L000241_249 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r20, RI ' ASGNI4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_localeconv ' CALL addrg
 adds r22, r21 ' ADDI/P (1)
 rdlong r20, r0 ' reg <- INDIRP4 reg
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r20, RI ' ASGNI4 addrl reg
 adds r22, r21 ' ADDI/P (1)
 mov r20, #48 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_su64i_696ddd96_tostringbuff_L000241_249
C_su64i_696ddd96_tostringbuff_L000241_244
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_su64i_696ddd96_tostringbuff_L000241_242 ' (symbol refcount = 0)
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
 long @C_su64i_696ddd96_tostringbuff_L000241
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -52
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-52) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
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
 wrlong r17, r19 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaO__tostring_253 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #48 ' framesize
 jmp #RETF


 alignl ' align long
C_su64m_696ddd96_pushstr_L000254 ' <symbol:pushstr>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r17, r23 ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 wrlong r13, r15 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_su64m_696ddd96_pushstr_L000254_256 ' NEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_su64m_696ddd96_pushstr_L000254_257 ' JUMPV addrg
C_su64m_696ddd96_pushstr_L000254_256
 mov r2, #2 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__concat
 add SP, #4 ' CALL addrg
C_su64m_696ddd96_pushstr_L000254_257
' C_su64m_696ddd96_pushstr_L000254_255 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_su64n_696ddd96_clearbuff_L000258 ' <symbol:clearbuff>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #12 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64m_696ddd96_pushstr_L000254
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_su64n_696ddd96_clearbuff_L000258_259 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_su64o_696ddd96_getbuff_L000260 ' <symbol:getbuff>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #199 ' reg <- coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r22, r20 ' SUBI/P (1)
 cmps r21, r22 wcz
 jmp #BRBE
 long @C_su64o_696ddd96_getbuff_L000260_262 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_su64n_696ddd96_clearbuff_L000258 ' CALL addrg
C_su64o_696ddd96_getbuff_L000260_262
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_su64o_696ddd96_getbuff_L000260_261 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_su64p_696ddd96_addstr2buff_L000264 ' <symbol:addstr2buff>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #199 wcz 
 jmp #BR_A
 long @C_su64p_696ddd96_addstr2buff_L000264_266 ' GTU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64o_696ddd96_getbuff_L000260
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
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
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, r19 ' CVI, CVU or LOAD
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #JMPA
 long @C_su64p_696ddd96_addstr2buff_L000264_267 ' JUMPV addrg
C_su64p_696ddd96_addstr2buff_L000264_266
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_su64n_696ddd96_clearbuff_L000258 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64m_696ddd96_pushstr_L000254
 add SP, #8 ' CALL addrg
C_su64p_696ddd96_addstr2buff_L000264_267
' C_su64p_696ddd96_addstr2buff_L000264_265 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_su64q_696ddd96_addnum2buff_L000268 ' <symbol:addnum2buff>
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
 long @C_su64o_696ddd96_getbuff_L000260
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64i_696ddd96_tostringbuff_L000241
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNI4 reg reg
' C_su64q_696ddd96_addnum2buff_L000268_269 ' (symbol refcount = 0)
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
 jmp #LODF
 long -208
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -212
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -216
 wrlong r23, RI ' ASGNP4 addrl reg
 jmp #JMPA
 long @C_luaO__pushvfstring_274 ' JUMPV addrg
C_luaO__pushvfstring_273
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
 long @C_su64p_696ddd96_addstr2buff_L000264
 add SP, #8 ' CALL addrg
 mov r22, r17
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 mov r22, #85 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_292 ' EQI4
 cmps r15, r22 wcz
 jmp #BR_A
 long @C_luaO__pushvfstring_300 ' GTI4
' C_luaO__pushvfstring_299 ' (symbol refcount = 0)
 mov r22, #37 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_294 ' EQI4
 cmps r15, r22 wcz
 jmp #BR_B
 long @C_luaO__pushvfstring_276 ' LTI4
' C_luaO__pushvfstring_301 ' (symbol refcount = 0)
 cmps r15,  #73 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_286 ' EQI4
 jmp #JMPA
 long @C_luaO__pushvfstring_276 ' JUMPV addrg
C_luaO__pushvfstring_300
 mov r22, #99 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_284 ' EQI4
 cmps r15,  #100 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_285 ' EQI4
 cmps r15,  #102 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_287 ' EQI4
 cmps r15, r22 wcz
 jmp #BR_B
 long @C_luaO__pushvfstring_276 ' LTI4
' C_luaO__pushvfstring_302 ' (symbol refcount = 0)
 cmps r15,  #112 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_288 ' EQI4
 cmps r15,  #115 wz
 jmp #BR_Z
 long @C_luaO__pushvfstring_279 ' EQI4
 jmp #JMPA
 long @C_luaO__pushvfstring_276 ' JUMPV addrg
C_luaO__pushvfstring_279
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r22, r13 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaO__pushvfstring_280 ' NEU4
 jmp #LODL
 long @C_luaO__pushvfstring_282_L000283
 mov r13, RI ' reg <- addrg
C_luaO__pushvfstring_280
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
 long @C_su64p_696ddd96_addstr2buff_L000264
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_277 ' JUMPV addrg
C_luaO__pushvfstring_284
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -220
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r2, #1 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-220) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64p_696ddd96_addstr2buff_L000264
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_277 ' JUMPV addrg
C_luaO__pushvfstring_285
 mov r13, FP
 sub r13, #-(-224) ' reg <- addrli
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r13 ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64q_696ddd96_addnum2buff_L000268
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_277 ' JUMPV addrg
C_luaO__pushvfstring_286
 mov r13, FP
 sub r13, #-(-224) ' reg <- addrli
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r13 ' ASGNI4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64q_696ddd96_addnum2buff_L000268
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_277 ' JUMPV addrg
C_luaO__pushvfstring_287
 mov r13, FP
 sub r13, #-(-224) ' reg <- addrli
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRF4 reg
 wrlong r22, r13 ' ASGNF4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-224) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64q_696ddd96_addnum2buff_L000268
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_277 ' JUMPV addrg
C_luaO__pushvfstring_288
 mov r13, #20 ' reg <- coni
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-216) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64o_696ddd96_getbuff_L000260
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -220
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -224
 wrlong r22, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-224)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long @C_luaO__pushvfstring_289_L000290
 mov r3, RI ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-220)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sprintf
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -228
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-208) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-228) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -208
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_luaO__pushvfstring_277 ' JUMPV addrg
C_luaO__pushvfstring_292
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
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
 long @C_su64p_696ddd96_addstr2buff_L000264
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_277 ' JUMPV addrg
C_luaO__pushvfstring_294
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C_luaO__pushvfstring_295_L000296
 mov r3, RI ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-216) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_su64p_696ddd96_addstr2buff_L000264
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaO__pushvfstring_277 ' JUMPV addrg
C_luaO__pushvfstring_276
 mov r22, r17
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 jmp #LODL
 long @C_luaO__pushvfstring_297_L000298
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #8 ' CALL addrg
C_luaO__pushvfstring_277
 mov r21, r17
 adds r21, #2 ' ADDP4 coni
C_luaO__pushvfstring_274
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
 long @C_luaO__pushvfstring_273 ' NEU4
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
 long @C_su64p_696ddd96_addstr2buff_L000264
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-216) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_su64n_696ddd96_clearbuff_L000258 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
' C_luaO__pushvfstring_270 ' (symbol refcount = 0)
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
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
' C_luaO__pushfstring_303 ' (symbol refcount = 0)
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
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #61 wz
 jmp #BRNZ
 long @C_luaO__chunkid_306 ' NEI4
 cmp r19, r17 wcz 
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
 wrbyte r22, r23 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaO__chunkid_307 ' JUMPV addrg
C_luaO__chunkid_306
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #64 wz
 jmp #BRNZ
 long @C_luaO__chunkid_310 ' NEI4
 cmp r19, r17 wcz 
 jmp #BR_A
 long @C_luaO__chunkid_312 ' GTU4
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
 long @C_luaO__chunkid_311 ' JUMPV addrg
C_luaO__chunkid_312
 mov r2, #3 ' reg ARG coni
 jmp #LODL
 long @C_luaO__chunkid_314_L000315
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
 long @C_luaO__chunkid_311 ' JUMPV addrg
C_luaO__chunkid_310
 mov r2, #10 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r2, #9 ' reg ARG coni
 jmp #LODL
 long @C_luaO__chunkid_316_L000317
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r23, #9 ' ADDP4 coni
 sub r17, #15 ' SUBU4 coni
 cmp r19, r17 wcz 
 jmp #BRAE
 long @C_luaO__chunkid_320 ' GEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaO__chunkid_320 ' NEU4
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
 long @C_luaO__chunkid_321 ' JUMPV addrg
C_luaO__chunkid_320
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaO__chunkid_322 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
C_luaO__chunkid_322
 cmp r19, r17 wcz 
 jmp #BRBE
 long @C_luaO__chunkid_324 ' LEU4
 mov r19, r17 ' CVI, CVU or LOAD
C_luaO__chunkid_324
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
 long @C_luaO__chunkid_314_L000315
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 adds r23, #3 ' ADDP4 coni
C_luaO__chunkid_321
 mov r2, #3 ' reg ARG coni
 jmp #LODL
 long @C_luaO__chunkid_326_L000327
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
C_luaO__chunkid_311
C_luaO__chunkid_307
' C_luaO__chunkid_305 ' (symbol refcount = 0)
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
C_luaO__chunkid_326_L000327 ' <symbol:326>
 byte 34
 byte 93
 byte 0

 alignl ' align long
C_luaO__chunkid_318_L000319 ' <symbol:318>
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
C_luaO__chunkid_316_L000317 ' <symbol:316>
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
C_luaO__chunkid_314_L000315 ' <symbol:314>
 byte 46
 byte 46
 byte 46
 byte 0

 alignl ' align long
C_luaO__pushvfstring_297_L000298 ' <symbol:297>
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
C_luaO__pushvfstring_295_L000296 ' <symbol:295>
 byte 37
 byte 0

 alignl ' align long
C_luaO__pushvfstring_289_L000290 ' <symbol:289>
 byte 37
 byte 112
 byte 0

 alignl ' align long
C_luaO__pushvfstring_282_L000283 ' <symbol:282>
 byte 40
 byte 110
 byte 117
 byte 108
 byte 108
 byte 41
 byte 0

 alignl ' align long
C_su64i_696ddd96_tostringbuff_L000241_251_L000252 ' <symbol:251>
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
C_su64i_696ddd96_tostringbuff_L000241_247_L000248 ' <symbol:247>
 byte 37
 byte 46
 byte 55
 byte 103
 byte 0

 alignl ' align long
C_su64i_696ddd96_tostringbuff_L000241_245_L000246 ' <symbol:245>
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_su64f_696ddd96_l_str2d_L000182_184_L000185 ' <symbol:184>
 byte 46
 byte 120
 byte 88
 byte 110
 byte 78
 byte 0

 alignl ' align long
C_su64c_696ddd96_lua_strx2number_L000124_148_L000149 ' <symbol:148>
 long $41800000 ' float

 alignl ' align long
C_su644_696ddd96_numarith_L000042_59_L000060 ' <symbol:59>
 long $0 ' float

 alignl ' align long
C_su644_696ddd96_numarith_L000042_54_L000055 ' <symbol:54>
 long $40000000 ' float

' Catalina Code

DAT ' code segment
' end
