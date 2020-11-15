' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export sqrt

 alignl ' align long
C_sqrt ' <symbol:sqrt>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sqrt_2 ' EQI4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_sqrt_1 ' JUMPV addrg
C_sqrt_2
 PRIMITIVE(#LODI)
 long @C_sqrt_6_L000007
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BR_A)
 long @C_sqrt_4 ' GTF4
 PRIMITIVE(#LODI)
 long @C_sqrt_6_L000007
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_sqrt_8 ' GEF4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
C_sqrt_8
 PRIMITIVE(#LODI)
 long @C_sqrt_6_L000007
 mov r0, RI ' reg <- INDIRF4 addrg
 PRIMITIVE(#JMPA)
 long @C_sqrt_1 ' JUMPV addrg
C_sqrt_4
 PRIMITIVE(#LODI)
 long @C_sqrt_12_L000013
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRBE)
 long @C_sqrt_10 ' LEF4
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_sqrt_1 ' JUMPV addrg
C_sqrt_10
 mov r2, FP
 sub r2, #-(-4) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_frexp
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sqrt_14 ' EQI4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODI)
 long @C_sqrt_16_L000017
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r21, r0 ' CVI, CVU or LOAD
C_sqrt_14
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #2 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r2, r0
 subs r2, #1 ' SUBI4 coni
 PRIMITIVE(#LODI)
 long @C_sqrt_18_L000019
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_ldexp
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #4 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
C_sqrt_20
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 PRIMITIVE(#LODI)
 long @C_sqrt_16_L000017
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
' C_sqrt_21 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_sqrt_20 ' GEI4
 mov r0, r21 ' CVI, CVU or LOAD
C_sqrt_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import errno

' Catalina Import ldexp

' Catalina Import frexp

' Catalina Import __IsNan

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sqrt_18_L000019 ' <symbol:18>
 long $3f800000 ' float

 alignl ' align long
C_sqrt_16_L000017 ' <symbol:16>
 long $40000000 ' float

 alignl ' align long
C_sqrt_12_L000013 ' <symbol:12>
 long $7f7fffff ' float

 alignl ' align long
C_sqrt_6_L000007 ' <symbol:6>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
