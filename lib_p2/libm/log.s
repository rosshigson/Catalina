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
 PRIMITIVE(#NEWF)
 sub SP, #20
 PRIMITIVE(#PSHM)
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_log_6 ' EQI4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_log_1 ' JUMPV addrg
C_log_6
 PRIMITIVE(#LODI)
 long @C_log_10_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_log_8 ' GEF4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 PRIMITIVE(#JMPA)
 long @C_log_1 ' JUMPV addrg
C_log_8
 PRIMITIVE(#LODI)
 long @C_log_10_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRNZ)
 long @C_log_12 ' NEF4
 mov r22, #34 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 PRIMITIVE(#JMPA)
 long @C_log_1 ' JUMPV addrg
C_log_12
 PRIMITIVE(#LODI)
 long @C_log_16_L000017
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BR_A)
 long @C_log_14 ' GTF4
 PRIMITIVE(#JMPA)
 long @C_log_15 ' JUMPV addrg
C_log_14
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_log_1 ' JUMPV addrg
C_log_15
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_log_20_L000021
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRBE)
 long @C_log_18 ' LEF4
 PRIMITIVE(#LODI)
 long @C_log_22_L000023
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FSUB) ' SUBF4
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FSUB) ' SUBF4
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 PRIMITIVE(#LODF)
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_log_19 ' JUMPV addrg
C_log_18
 PRIMITIVE(#LODI)
 long @C_log_22_L000023
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FSUB) ' SUBF4
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 PRIMITIVE(#LODF)
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_log_19
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r19, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODF)
 long -16
 wrlong r0, RI ' ASGNF4 addrl reg
 PRIMITIVE(#LODI)
 long @C_log_a_L000003+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_log_a_L000003+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_log_a_L000003
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 PRIMITIVE(#LODF)
 long -20
 wrlong r0, RI ' ASGNF4 addrl reg
 PRIMITIVE(#LODI)
 long @C_log_b_L000005+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_log_b_L000005+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_log_b_L000005+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_log_b_L000005
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#FLIN) ' CVIF4
 mov r21, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_log_33_L000034
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_log_35_L000036
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
C_log_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #20 ' framesize
 PRIMITIVE(#RETF)


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
