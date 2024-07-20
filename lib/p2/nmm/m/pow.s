' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pow

 alignl ' align long
C_pow ' <symbol:pow>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C_pow_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_pow_2 ' NEF4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_pow_1 ' JUMPV addrg
C_pow_2
 mov r22, ##@C_pow_8_L000009
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_pow_6 ' NEF4
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_a jmp #\C_pow_6 ' GTF4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##@C_pow_8_L000009
 rdlong r0, r0 ' reg <- INDIRF4 addrg
 jmp #\@C_pow_1 ' JUMPV addrg
C_pow_6
 mov r22, ##@C_pow_8_L000009
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_pow_10 ' NEF4
 mov r0, ##@C_pow_4_L000005
 rdlong r0, r0 ' reg <- INDIRF4 addrg
 jmp #\@C_pow_1 ' JUMPV addrg
C_pow_10
 mov r22, ##@C_pow_8_L000009
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_pow_12 ' GEF4
 xor r21, Bit31 ' NEGF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_pow_13 ' JUMPV addrg
C_pow_12
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_pow_13
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_pow_8_L000009
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_pow_14 ' EQF4
 mov r22, ##@C_pow_8_L000009
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_pow_16 ' GEF4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, ##@C_pow_8_L000009
 rdlong r0, r0 ' reg <- INDIRF4 addrg
 jmp #\@C_pow_1 ' JUMPV addrg
C_pow_16
C_pow_14
 mov r13, #0 ' reg <- coni
 mov r22, ##@C_pow_8_L000009
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_pow_18 ' GEF4
 xor r23, Bit31 ' NEGF4
 mov r13, #1 ' reg <- coni
C_pow_18
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_pow_22_L000023
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_pow_20 ' LEF4
 cmps r13,  #0 wz
 if_z jmp #\C_pow_24 ' EQI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_pow_26_L000027
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_pow_8_L000009
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_pow_24 ' NEF4
 mov r13, #0 ' reg <- coni
C_pow_24
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_log ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_pow_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_pow_28 ' LEF4
 mov r22, ##@C_pow_30_L000031
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 calld PA,#FCMP
 if_be jmp #\C_pow_28 ' LEF4
 mov r22, #34 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_pow_1 ' JUMPV addrg
C_pow_28
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_pow_32 ' EQI4
 xor r21, Bit31 ' NEGF4
C_pow_32
 cmps r13,  #0 wz
 if_z jmp #\C_pow_34 ' EQI4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_exp ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 jmp #\@C_pow_1 ' JUMPV addrg
C_pow_34
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_exp ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_pow_1 ' JUMPV addrg
C_pow_20
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_pow_8_L000009
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_pow_36 ' EQF4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_log ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_exp ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_pow_37 ' JUMPV addrg
C_pow_36
 mov r17, ##@C_pow_4_L000005
 rdlong r17, r17 ' reg <- INDIRF4 addrg
C_pow_37
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_pow_41_L000042
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_b jmp #\C_pow_39 ' LTF4
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 calld PA,#INFL ' CVFI4
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, ##$80000000 ' reg <- con
 mov r11, r20 ' ADDU
 add r11, r18 ' ADDU (3)
 jmp #\@C_pow_40 ' JUMPV addrg
C_pow_39
 mov r0, r22 ' CVI, CVU or LOAD
 calld PA,#INFL ' CVFI4
 mov r11, r0 ' CVI, CVU or LOAD
C_pow_40
 mov r19, r11 ' CVI, CVU or LOAD
 mov r22, r19
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_pow_43  ' NEU4
 mov r13, #0 ' reg <- coni
C_pow_43
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
C_pow_45
 mov r22, r19
 and r22, #1 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_pow_49 ' EQU4
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r15, r22 ' ADDI/P (1)
C_pow_49
 shr r19, #1 ' RSHU4 coni
 cmp r19,  #0 wz
 if_nz jmp #\C_pow_51  ' NEU4
 jmp #\@C_pow_47 ' JUMPV addrg
C_pow_51
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #1 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, ##@C_pow_55_L000056
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_pow_45 ' GEF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_pow_45 ' JUMPV addrg
C_pow_47
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_pow_57 ' EQI4
 mov r22, ##@C_pow_4_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r17, r0 ' CVI, CVU or LOAD
 neg r15, r15 ' NEGI4
C_pow_57
 cmps r13,  #0 wz
 if_z jmp #\C_pow_59 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 jmp #\@C_pow_1 ' JUMPV addrg
C_pow_59
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_pow_1
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Import errno

' Catalina Import modf

' Catalina Import ldexp

' Catalina Import frexp

' Catalina Import log

' Catalina Import exp

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_pow_55_L000056 ' <symbol:55>
 long $3f000000 ' float

 alignl ' align long
C_pow_41_L000042 ' <symbol:41>
 long $4f000000 ' float

 alignl ' align long
C_pow_30_L000031 ' <symbol:30>
 long $7f7fffff ' float

 alignl ' align long
C_pow_26_L000027 ' <symbol:26>
 long $40000000 ' float

 alignl ' align long
C_pow_22_L000023 ' <symbol:22>
 long $4f800000 ' float

 alignl ' align long
C_pow_8_L000009 ' <symbol:8>
 long $0 ' float

 alignl ' align long
C_pow_4_L000005 ' <symbol:4>
 long $3f800000 ' float

' Catalina Code

DAT ' code segment
' end
