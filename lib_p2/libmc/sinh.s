' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_p_L000004 ' <symbol:p>
 long $c8abc89b ' float
 long $c634ae16 ' float
 long $c323c20b ' float
 long $bf4a273e ' float

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_q_L000006 ' <symbol:q>
 long $ca00d674 ' float
 long $470d42b9 ' float
 long $c38ade1c ' float
 long $3f800000 ' float

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001 ' <symbol:sinh_cosh>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $fea800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_10_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_8 ' GEF4
 mov r15, #1 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_9 ' JUMPV addrg
C_sfmk_619c55dd_sinh_cosh_L000001_8
 mov r15, #0 ' reg <- coni
C_sfmk_619c55dd_sinh_cosh_L000001_9
 mov r17, r15 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_13 ' EQI4
 mov r13, r23
 xor r13, Bit31 ' NEGF4
 PRIMITIVE(#JMPA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_14 ' JUMPV addrg
C_sfmk_619c55dd_sinh_cosh_L000001_13
 mov r13, r23 ' CVI, CVU or LOAD
C_sfmk_619c55dd_sinh_cosh_L000001_14
 mov r19, r13 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_15 ' EQI4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_2 ' JUMPV addrg
C_sfmk_619c55dd_sinh_cosh_L000001_15
 cmps r21,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_17 ' NEI4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_19_L000020
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BR_A)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_17 ' GTF4
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r19, r0 ' CVI, CVU or LOAD
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_p_L000004+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_p_L000004+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_p_L000004+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_p_L000004
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODF)
 long -8
 wrlong r0, RI ' ASGNF4 addrl reg
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_q_L000006+4+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_q_L000006+4+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_q_L000006+4
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_q_L000006
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FADD) ' ADDF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 PRIMITIVE(#JMPA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_2 ' JUMPV addrg
C_sfmk_619c55dd_sinh_cosh_L000001_17
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_35_L000036
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BR_B)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_33 ' LTF4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_37_L000038
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FSUB) ' SUBF4
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_41_L000042
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_39 ' GEF4
 mov RI, FP
 sub RI, #-(-4)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_exp ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_43_L000044
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r23 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 mov r23, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_34 ' JUMPV addrg
C_sfmk_619c55dd_sinh_cosh_L000001_39
 mov r22, #34 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C___huge_val ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_34 ' JUMPV addrg
C_sfmk_619c55dd_sinh_cosh_L000001_33
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_exp ' CALL addrg
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
 cmps r21,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_48 ' EQI4
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_19_L000020
 mov r11, RI ' reg <- INDIRF4 addrg
 PRIMITIVE(#JMPA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_49 ' JUMPV addrg
C_sfmk_619c55dd_sinh_cosh_L000001_48
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_50_L000051
 mov r11, RI ' reg <- INDIRF4 addrg
C_sfmk_619c55dd_sinh_cosh_L000001_49
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_46_L000047
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRF4 reg
 mov r18, FP
 sub r18, #-(-4) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRF4 reg
 mov r0, r11 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 mov r23, r0 ' CVI, CVU or LOAD
C_sfmk_619c55dd_sinh_cosh_L000001_34
 cmps r17,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_53 ' EQI4
 mov r11, r23
 xor r11, Bit31 ' NEGF4
 PRIMITIVE(#JMPA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_54 ' JUMPV addrg
C_sfmk_619c55dd_sinh_cosh_L000001_53
 mov r11, r23 ' CVI, CVU or LOAD
C_sfmk_619c55dd_sinh_cosh_L000001_54
 mov r0, r11 ' CVI, CVU or LOAD
C_sfmk_619c55dd_sinh_cosh_L000001_2
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export sinh

 alignl ' align long
C_sinh ' <symbol:sinh>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sinh_55 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export cosh

 alignl ' align long
C_cosh ' <symbol:cosh>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_sfmk_619c55dd_sinh_cosh_L000001_10_L000011
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_cosh_57 ' GEF4
 xor r23, Bit31 ' NEGF4
C_cosh_57
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_sfmk_619c55dd_sinh_cosh_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_cosh_56 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import errno

' Catalina Import exp

' Catalina Import __IsNan

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_50_L000051 ' <symbol:50>
 long $bf800000 ' float

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_46_L000047 ' <symbol:46>
 long $3f000000 ' float

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_43_L000044 ' <symbol:43>
 long $385d8bf1 ' float

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_41_L000042 ' <symbol:41>
 long $42b17216 ' float

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_37_L000038 ' <symbol:37>
 long $3f317300 ' float

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_35_L000036 ' <symbol:35>
 long $42b17218 ' float

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_19_L000020 ' <symbol:19>
 long $3f800000 ' float

 alignl ' align long
C_sfmk_619c55dd_sinh_cosh_L000001_10_L000011 ' <symbol:10>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
