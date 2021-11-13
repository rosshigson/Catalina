' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_seuc_6188be5a_asin_acos_L000001_p_L000009 ' <symbol:p>
 long $c1daf2ad ' float
 long $4264d53a ' float
 long $c21ec165 ' float
 long $412270bb ' float
 long $bf325dee ' float

 alignl ' align long
C_seuc_6188be5a_asin_acos_L000001_q_L000011 ' <symbol:q>
 long $c3243602 ' float
 long $43d09279 ' float
 long $c3beee78 ' float
 long $4316f3e5 ' float
 long $c1be9743 ' float
 long $3f800000 ' float

' Catalina Code

DAT ' code segment

 alignl ' align long
C_seuc_6188be5a_asin_acos_L000001 ' <symbol:asin_acos>
 PRIMITIVE(#NEWF)
 sub SP, #12
 PRIMITIVE(#PSHM)
 long $eaa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_6_L000007
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_seuc_6188be5a_asin_acos_L000001_4 ' GEF4
 mov r15, #1 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_seuc_6188be5a_asin_acos_L000001_5 ' JUMPV addrg
C_seuc_6188be5a_asin_acos_L000001_4
 mov r15, #0 ' reg <- coni
C_seuc_6188be5a_asin_acos_L000001_5
 mov r17, r15 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_seuc_6188be5a_asin_acos_L000001_12 ' EQI4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_seuc_6188be5a_asin_acos_L000001_2 ' JUMPV addrg
C_seuc_6188be5a_asin_acos_L000001_12
 cmps r17,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_seuc_6188be5a_asin_acos_L000001_14 ' EQI4
 xor r23, Bit31 ' NEGF4
C_seuc_6188be5a_asin_acos_L000001_14
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_18_L000019
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRBE)
 long @C_seuc_6188be5a_asin_acos_L000001_16 ' LEF4
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_22_L000023
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRBE)
 long @C_seuc_6188be5a_asin_acos_L000001_20 ' LEF4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_6_L000007
 mov r0, RI ' reg <- INDIRF4 addrg
 PRIMITIVE(#JMPA)
 long @C_seuc_6188be5a_asin_acos_L000001_2 ' JUMPV addrg
C_seuc_6188be5a_asin_acos_L000001_20
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_18_L000019
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FSUB) ' SUBF4
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_sqrt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r23, r22
 xor r23, Bit31 ' NEGF4
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_seuc_6188be5a_asin_acos_L000001_17 ' JUMPV addrg
C_seuc_6188be5a_asin_acos_L000001_16
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r19, r0 ' CVI, CVU or LOAD
C_seuc_6188be5a_asin_acos_L000001_17
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODF)
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_p_L000009+4+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_p_L000009+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_p_L000009+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_p_L000009+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_p_L000009
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODF)
 long -12
 wrlong r0, RI ' ASGNF4 addrl reg
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_q_L000011+4+4+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_q_L000011+4+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_q_L000011+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_q_L000011+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_q_L000011+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_q_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_seuc_6188be5a_asin_acos_L000001_49 ' EQI4
 cmps r17,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_seuc_6188be5a_asin_acos_L000001_51 ' NEI4
 xor r23, Bit31 ' NEGF4
C_seuc_6188be5a_asin_acos_L000001_51
C_seuc_6188be5a_asin_acos_L000001_49
 cmps r21,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_seuc_6188be5a_asin_acos_L000001_57 ' NEI4
 mov r13, #1 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_seuc_6188be5a_asin_acos_L000001_58 ' JUMPV addrg
C_seuc_6188be5a_asin_acos_L000001_57
 mov r13, #0 ' reg <- coni
C_seuc_6188be5a_asin_acos_L000001_58
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 PRIMITIVE(#BRNZ)
 long @C_seuc_6188be5a_asin_acos_L000001_59 ' NEI4
 mov r11, #1 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_seuc_6188be5a_asin_acos_L000001_60 ' JUMPV addrg
C_seuc_6188be5a_asin_acos_L000001_59
 mov r11, #0 ' reg <- coni
C_seuc_6188be5a_asin_acos_L000001_60
 cmps r13, r11 wz
 PRIMITIVE(#BRNZ)
 long @C_seuc_6188be5a_asin_acos_L000001_53 ' NEI4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_61_L000062
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_seuc_6188be5a_asin_acos_L000001_54 ' JUMPV addrg
C_seuc_6188be5a_asin_acos_L000001_53
 mov r22, #0 ' reg <- coni
 cmps r21, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_seuc_6188be5a_asin_acos_L000001_63 ' EQI4
 cmps r17, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_seuc_6188be5a_asin_acos_L000001_63 ' EQI4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #1 wz
 PRIMITIVE(#BRNZ)
 long @C_seuc_6188be5a_asin_acos_L000001_63 ' NEI4
 PRIMITIVE(#LODI)
 long @C_seuc_6188be5a_asin_acos_L000001_65_L000066
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
C_seuc_6188be5a_asin_acos_L000001_63
C_seuc_6188be5a_asin_acos_L000001_54
 mov r22, #0 ' reg <- coni
 cmps r21, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_seuc_6188be5a_asin_acos_L000001_67 ' NEI4
 cmps r17, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_seuc_6188be5a_asin_acos_L000001_67 ' EQI4
 xor r23, Bit31 ' NEGF4
C_seuc_6188be5a_asin_acos_L000001_67
 mov r0, r23 ' CVI, CVU or LOAD
C_seuc_6188be5a_asin_acos_L000001_2
 PRIMITIVE(#POPM) ' restore registers
 add SP, #12 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export asin

 alignl ' align long
C_asin ' <symbol:asin>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_seuc_6188be5a_asin_acos_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_asin_69 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export acos

 alignl ' align long
C_acos ' <symbol:acos>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_seuc_6188be5a_asin_acos_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_acos_70 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import errno

' Catalina Import sqrt

' Catalina Import __IsNan

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_seuc_6188be5a_asin_acos_L000001_65_L000066 ' <symbol:65>
 long $3fc90fdb ' float

 alignl ' align long
C_seuc_6188be5a_asin_acos_L000001_61_L000062 ' <symbol:61>
 long $3f490fdb ' float

 alignl ' align long
C_seuc_6188be5a_asin_acos_L000001_22_L000023 ' <symbol:22>
 long $3f800000 ' float

 alignl ' align long
C_seuc_6188be5a_asin_acos_L000001_18_L000019 ' <symbol:18>
 long $3f000000 ' float

 alignl ' align long
C_seuc_6188be5a_asin_acos_L000001_6_L000007 ' <symbol:6>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
