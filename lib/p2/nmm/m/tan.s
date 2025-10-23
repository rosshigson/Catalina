' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_tan_p_L000008 ' <symbol:p>
 long $3f800000 ' float
 long $be0895af ' float
 long $3b607415 ' float
 long $b795d5b9 ' float

 alignl ' align long
C_tan_q_L000010 ' <symbol:q>
 long $3f800000 ' float
 long $beeef582 ' float
 long $3cd23cf5 ' float
 long $b9a37b25 ' float
 long $3505bba8 ' float

' Catalina Export tan

' Catalina Code

DAT ' code segment

 alignl ' align long
C_tan ' <symbol:tan>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_tan_5_L000006
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_tan_3 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #\@C_tan_4 ' JUMPV addrg
C_tan_3
 mov r19, #0 ' reg <- coni
C_tan_4
 mov r21, r19 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_isnan ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_tan_11 ' EQI4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_tan_1 ' JUMPV addrg
C_tan_11
 cmps r21,  #0 wz
 if_z jmp #\C_tan_13 ' EQI4
 xor r23, Bit31 ' NEGF4
C_tan_13
 mov r22, ##@C_tan_15_L000016
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r22, ##@C_tan_17_L000018
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_tan_21_L000022
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_b jmp #\C_tan_19 ' LTF4
 mov r0, ##@C_tan_5_L000006
 rdlong r0, r0 ' reg <- INDIRF4 addrg
 jmp #\@C_tan_1 ' JUMPV addrg
C_tan_19
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r22, ##@C_tan_17_L000018
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_tan_5_L000006
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_tan_23 ' EQF4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_tan_23
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, ##@C_tan_25_L000026
 rdlong r18, r18 ' reg <- INDIRF4 addrg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 calld PA,#FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_tan_27_L000028
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r20, ##@C_tan_p_L000008+4+4+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tan_p_L000008+4+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tan_p_L000008+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 calld PA,#FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_tan_q_L000010+4+4+4+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tan_q_L000010+4+4+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tan_q_L000010+4+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r20, ##@C_tan_q_L000010+4
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r22, ##@C_tan_q_L000010
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 cmps r21,  #0 wz
 if_z jmp #\C_tan_45 ' EQI4
 xor r23, Bit31 ' NEGF4
C_tan_45
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_tan_48 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 xor r22, Bit31 ' NEGF4
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_tan_49 ' JUMPV addrg
C_tan_48
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r17, r0 ' CVI, CVU or LOAD
C_tan_49
 mov r0, r17 ' CVI, CVU or LOAD
C_tan_1
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Import errno

' Catalina Import isnan

' Catalina Import modf

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_tan_27_L000028 ' <symbol:27>
 long $b695777a ' float

 alignl ' align long
C_tan_25_L000026 ' <symbol:25>
 long $3fc91000 ' float

 alignl ' align long
C_tan_21_L000022 ' <symbol:21>
 long $7f22f983 ' float

 alignl ' align long
C_tan_17_L000018 ' <symbol:17>
 long $3f000000 ' float

 alignl ' align long
C_tan_15_L000016 ' <symbol:15>
 long $3f22f983 ' float

 alignl ' align long
C_tan_5_L000006 ' <symbol:5>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
