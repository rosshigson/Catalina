' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ldexp

 alignl ' align long
C_ldexp ' <symbol:ldexp>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #1 ' reg <- coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_ldexp_2 ' EQI4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_ldexp_1 ' JUMPV addrg
C_ldexp_2
 mov r22, ##@C_ldexp_6_L000007
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_ldexp_4 ' NEF4
 mov r0, ##@C_ldexp_6_L000007
 rdlong r0, r0 ' reg <- INDIRF4 addrg
 jmp #\@C_ldexp_1 ' JUMPV addrg
C_ldexp_4
 mov r22, ##@C_ldexp_6_L000007
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_ldexp_8 ' GEF4
 xor r23, Bit31 ' NEGF4
 mov r19, ##-1 ' reg <- con
C_ldexp_8
 mov r22, ##@C_ldexp_12_L000013
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_ldexp_10 ' LEF4
 mov r22, #34 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r19 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 jmp #\@C_ldexp_1 ' JUMPV addrg
C_ldexp_10
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r21, r22 ' ADDI/P (1)
 cmps r21,  #0 wcz
 if_be jmp #\C_ldexp_14 ' LEI4
 cmps r21,  #128 wcz
 if_be jmp #\C_ldexp_19 ' LEI4
 mov r22, #34 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r19 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 jmp #\@C_ldexp_1 ' JUMPV addrg
C_ldexp_18
 mov r22, ##@C_ldexp_21_L000022
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
 subs r21, #30 ' SUBI4 coni
C_ldexp_19
 cmps r21,  #30 wcz
 if_a jmp #\C_ldexp_18 ' GTI4
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' LSHI/U
 shl r0, r21 ' LSHI/U (3)
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #\@C_ldexp_15 ' JUMPV addrg
C_ldexp_14
 mov r22, ##-149 ' reg <- con
 cmps r21, r22 wcz
 if_ae jmp #\C_ldexp_26 ' GEI4
 mov r0, ##@C_ldexp_6_L000007
 rdlong r0, r0 ' reg <- INDIRF4 addrg
 jmp #\@C_ldexp_1 ' JUMPV addrg
C_ldexp_25
 mov r22, ##@C_ldexp_21_L000022
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r23, r0 ' CVI, CVU or LOAD
 adds r21, #30 ' ADDI4 coni
C_ldexp_26
 mov r22, ##-30 ' reg <- con
 cmps r21, r22 wcz
 if_b jmp #\C_ldexp_25 ' LTI4
 mov r22, #1 ' reg <- coni
 neg r20, r21 ' NEGI4
 mov r0, r22 ' LSHI/U
 shl r0, r20 ' LSHI/U (3)
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FDIV ' DIVF4
 mov r23, r0 ' CVI, CVU or LOAD
C_ldexp_15
 mov r0, r19 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
C_ldexp_1
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import errno

' Catalina Import frexp

' Catalina Import __IsNan

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_ldexp_21_L000022 ' <symbol:21>
 long $4e800000 ' float

 alignl ' align long
C_ldexp_12_L000013 ' <symbol:12>
 long $7f7fffff ' float

 alignl ' align long
C_ldexp_6_L000007 ' <symbol:6>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
