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
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_log_6 ' EQI4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_log_1 ' JUMPV addrg
C_log_6
 jmp #LODI
 long @C_log_10_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_log_8 ' GEF4
 mov r22, #33 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 jmp #JMPA
 long @C_log_1 ' JUMPV addrg
C_log_8
 jmp #LODI
 long @C_log_10_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_log_12 ' NEF4
 mov r22, #34 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 jmp #JMPA
 long @C_log_1 ' JUMPV addrg
C_log_12
 jmp #LODI
 long @C_log_16_L000017
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_A
 long @C_log_14 ' GTF4
 jmp #JMPA
 long @C_log_15 ' JUMPV addrg
C_log_14
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_log_1 ' JUMPV addrg
C_log_15
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_log_20_L000021
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRBE
 long @C_log_18 ' LEF4
 jmp #LODI
 long @C_log_22_L000023
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #JMPA
 long @C_log_19 ' JUMPV addrg
C_log_18
 jmp #LODI
 long @C_log_22_L000023
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FSUB ' SUBF4
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_log_19
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r19, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODF
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_log_a_L000003+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_log_a_L000003+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_log_a_L000003
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 jmp #LODF
 long -24
 wrlong r0, RI ' ASGNF4 addrl reg
 jmp #LODI
 long @C_log_b_L000005+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_log_b_L000005+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_log_b_L000005+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 jmp #LODI
 long @C_log_b_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FADD ' ADDF4
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FDIV ' DIVF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #FLIN ' CVIF4
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_log_33_L000034
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_log_35_L000036
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
C_log_1
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


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
