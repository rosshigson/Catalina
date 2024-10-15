' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_log_a_L000003 ' <symbol:a>
 long $c2803ff9 ' float
 long $41831251 ' float
 long $bf4a20ae ' float

 alignl ' align long
C_log_b_L000005 ' <symbol:b>
 long $c4405ff5 ' float
 long $439c0420 ' float
 long $c20eac02 ' float
 long $3f800000 ' float

' Catalina Export log

' Catalina Code

DAT ' code segment

 alignl ' align long
C_log ' <symbol:log>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_log_6 ' EQI4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_log_1 ' JUMPV addrg
C_log_6
 mov r22, ##@C_log_10_L000011
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_log_8 ' GEF4
 mov r22, #33 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 jmp #\@C_log_1 ' JUMPV addrg
C_log_8
 mov r22, ##@C_log_10_L000011
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_nz jmp #\C_log_12 ' NEF4
 mov r22, #34 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 jmp #\@C_log_1 ' JUMPV addrg
C_log_12
 mov r22, ##@C_log_16_L000017
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_a jmp #\C_log_14 ' GTF4
 jmp #\@C_log_15 ' JUMPV addrg
C_log_14
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_log_1 ' JUMPV addrg
C_log_15
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_log_20_L000021
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_be jmp #\C_log_18 ' LEF4
 mov r22, ##@C_log_22_L000023
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNF4 addrli reg
 jmp #\@C_log_19 ' JUMPV addrg
C_log_18
 mov r22, ##@C_log_22_L000023
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_log_19
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FDIV ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r19, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, ##@C_log_a_L000003+4+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r22, ##@C_log_a_L000003+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r22, ##@C_log_a_L000003
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, ##@C_log_b_L000005+4+4+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r22, ##@C_log_b_L000005+4+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r22, ##@C_log_b_L000005+4
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r22, ##@C_log_b_L000005
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FDIV ' DIVF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 calld PA,#FLIN ' CVIF4
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_log_33_L000034
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, ##@C_log_35_L000036
 rdlong r22, r22 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 calld PA,#FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
C_log_1
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Import errno

' Catalina Import frexp

' Catalina Import __IsNan

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_log_35_L000036 ' <symbol:35>
 long $3f318000 ' float

 alignl ' align long
C_log_33_L000034 ' <symbol:33>
 long $b95e8083 ' float

 alignl ' align long
C_log_22_L000023 ' <symbol:22>
 long $3f000000 ' float

 alignl ' align long
C_log_20_L000021 ' <symbol:20>
 long $3f3504f3 ' float

 alignl ' align long
C_log_16_L000017 ' <symbol:16>
 long $7f7fffff ' float

 alignl ' align long
C_log_10_L000011 ' <symbol:10>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
