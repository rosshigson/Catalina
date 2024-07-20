' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
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
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_tan_5_L000006
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_tan_3 ' GEF4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_tan_4 ' JUMPV addrg
C_tan_3
 mov r19, #0 ' reg <- coni
C_tan_4
 mov r21, r19 ' CVI, CVU or LOAD
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_tan_11 ' EQI4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_tan_1 ' JUMPV addrg
C_tan_11
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_tan_13 ' EQI4
 xor r23, Bit31 ' NEGF4
C_tan_13
 jmp #LODI
 long @C_tan_15_L000016
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tan_17_L000018
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_tan_21_L000022
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_tan_19 ' LTF4
 jmp #LODI
 long @C_tan_5_L000006
 mov r0, RI ' reg <- INDIRF4 addrg
 jmp #JMPA
 long @C_tan_1 ' JUMPV addrg
C_tan_19
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 jmp #LODI
 long @C_tan_17_L000018
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_tan_5_L000006
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_tan_23 ' EQF4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_tan_23
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 jmp #LODI
 long @C_tan_25_L000026
 mov r18, RI ' reg <- INDIRF4 addrg
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_tan_27_L000028
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_tan_p_L000008+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tan_p_L000008+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tan_p_L000008+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_tan_q_L000010+4+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tan_q_L000010+4+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tan_q_L000010+4+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tan_q_L000010+4
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_tan_q_L000010
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_tan_45 ' EQI4
 xor r23, Bit31 ' NEGF4
C_tan_45
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_tan_48 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 xor r22, Bit31 ' NEGF4
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_tan_49 ' JUMPV addrg
C_tan_48
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r17, r0 ' CVI, CVU or LOAD
C_tan_49
 mov r0, r17 ' CVI, CVU or LOAD
C_tan_1
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import errno

' Catalina Import modf

' Catalina Import __IsNan

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
