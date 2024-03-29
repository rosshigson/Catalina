' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export itoa

 alignl ' align long
C_itoa ' <symbol:itoa>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODL)
 long @C_sj30_619c560d_itoa_buf_L000001+12-1
 mov r19, RI ' reg <- addrg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 cmps r23,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_itoa_5 ' GEI4
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, r23
 adds r22, #1 ' ADDI4 coni
 neg r22, r22 ' NEGI4
 mov r21, r22
 add r21, #1 ' ADDU4 coni
 PRIMITIVE(#JMPA)
 long @C_itoa_6 ' JUMPV addrg
C_itoa_5
 mov r21, r23 ' CVI, CVU or LOAD
C_itoa_6
 mov r22, #0 ' reg <- coni
 wrbyte r22, r19 ' ASGNU1 reg reg
C_itoa_7
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, #10 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVU) ' DIVU
 mov r20, r1
 add r20, #48 ' ADDU4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #10 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVU) ' DIVU
 mov r21, r0 ' CVI, CVU or LOAD
' C_itoa_8 ' (symbol refcount = 0)
 cmp r21,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_itoa_7 ' NEU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_itoa_10 ' EQI4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_itoa_10
 mov r0, r19 ' CVI, CVU or LOAD
' C_itoa_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


 alignl ' align long
C_sj301_619c560d_N_anO_rI_nf_L000012 ' <symbol:NanOrInf>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 PRIMITIVE(#LODF)
 long -4
 wrlong r23, RI ' ASGNF4 addrl reg
 PRIMITIVE(#LODL)
 long $7f800000
 mov r22, RI ' reg <- con
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r20, r22 ' BANDI/U (1)
 cmp r20, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012_14 ' NEU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $7fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012_16 ' NEU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012_18 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sj301_619c560d_N_anO_rI_nf_L000012_18
 PRIMITIVE(#LODL)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012_20_L000021
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #3 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012_13 ' JUMPV addrg
C_sj301_619c560d_N_anO_rI_nf_L000012_16
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODL)
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012_22 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sj301_619c560d_N_anO_rI_nf_L000012_22
 PRIMITIVE(#LODL)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012_24_L000025
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #3 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012_13 ' JUMPV addrg
C_sj301_619c560d_N_anO_rI_nf_L000012_14
 PRIMITIVE(#LODL)
 long 0
 mov r0, RI ' reg <- con
C_sj301_619c560d_N_anO_rI_nf_L000012_13
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Export t_float

 alignl ' align long
C_t_float ' <symbol:t_float>
 PRIMITIVE(#NEWF)
 sub SP, #120
 PRIMITIVE(#PSHM)
 long $eaa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #8 wcz
 PRIMITIVE(#BRBE)
 long @C_t_float_27 ' LEI4
 mov r19, #8 ' reg <- coni
C_t_float_27
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_sj301_619c560d_N_anO_rI_nf_L000012
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_t_float_29 ' EQU4
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_t_string
 add SP, #4 ' CALL addrg
 PRIMITIVE(#JMPA)
 long @C_t_float_26 ' JUMPV addrg
C_t_float_29
 PRIMITIVE(#LODI)
 long @C_t_float_33_L000034
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_t_float_31 ' GEF4
 xor r21, Bit31 ' NEGF4
 mov r22, #45 ' reg <- coni
 PRIMITIVE(#LODF)
 long -40
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -39
 wrbyte r22, RI ' ASGNU1 addrl reg
 PRIMITIVE(#JMPA)
 long @C_t_float_32 ' JUMPV addrg
C_t_float_31
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -40
 wrbyte r22, RI ' ASGNU1 addrl reg
C_t_float_32
 PRIMITIVE(#LODI)
 long @C_t_float_38_L000039
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRNZ)
 long @C_t_float_36 ' NEF4
 mov r15, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_t_float_37 ' JUMPV addrg
C_t_float_36
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_log10 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#INFL) ' CVFI4
 mov r15, r0 ' CVI, CVU or LOAD
C_t_float_37
 cmps r15, r19 wcz
 PRIMITIVE(#BRBE)
 long @C_t_float_40 ' LEI4
 mov r0, r15 ' CVI, CVU or LOAD
 PRIMITIVE(#FLIN) ' CVIF4
 mov r2, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_t_float_42_L000043
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_t_float_42_L000043
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BR_B)
 long @C_t_float_41 ' LTF4
 PRIMITIVE(#LODI)
 long @C_t_float_42_L000043
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
 adds r15, #1 ' ADDI4 coni
 PRIMITIVE(#JMPA)
 long @C_t_float_41 ' JUMPV addrg
C_t_float_40
 neg r22, r19 ' NEGI4
 cmps r15, r22 wcz
 PRIMITIVE(#BRAE)
 long @C_t_float_46 ' GEI4
 neg r0, r15 ' NEGI4
 PRIMITIVE(#FLIN) ' CVIF4
 mov r2, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_t_float_42_L000043
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r21, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_t_float_50_L000051
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_t_float_47 ' GEF4
 PRIMITIVE(#LODI)
 long @C_t_float_42_L000043
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r21, r0 ' CVI, CVU or LOAD
 subs r15, #1 ' SUBI4 coni
 PRIMITIVE(#JMPA)
 long @C_t_float_47 ' JUMPV addrg
C_t_float_46
 mov r15, #0 ' reg <- coni
C_t_float_47
C_t_float_41
 mov r0, r21 ' CVI, CVU or LOAD
 PRIMITIVE(#INFL) ' CVFI4
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r17 ' CVI, CVU or LOAD
 PRIMITIVE(#FLIN) ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 PRIMITIVE(#FSUB) ' SUBF4
 mov r13, r0 ' CVI, CVU or LOAD
 mov r0, r19 ' CVI, CVU or LOAD
 PRIMITIVE(#FLIN) ' CVIF4
 mov r2, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_t_float_42_L000043
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r13 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FMUL) ' MULF4
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_itoa ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, r13 ' CVI, CVU or LOAD
 PRIMITIVE(#INFL) ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_itoa ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-120) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcat
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long @C_t_float_52_L000053
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcat
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_t_float_57 ' JUMPV addrg
C_t_float_54
 PRIMITIVE(#LODL)
 long @C_t_float_58_L000059
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcat
 add SP, #4 ' CALL addrg
' C_t_float_55 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_t_float_57
 cmps r17, r19 wcz
 PRIMITIVE(#BR_B)
 long @C_t_float_54 ' LTI4
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcat
 add SP, #4 ' CALL addrg
 cmps r15,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_t_float_60 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_itoa ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcpy
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long @C_t_float_62_L000063
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcat
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcat
 add SP, #4 ' CALL addrg
C_t_float_60
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_t_string
 add SP, #4 ' CALL addrg
C_t_float_26
 PRIMITIVE(#POPM) ' restore registers
 add SP, #120 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import t_string

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sj30_619c560d_itoa_buf_L000001 ' <symbol:itoa_buf>
 byte 0[12]

' Catalina Code

DAT ' code segment

' Catalina Import strlen

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strcat

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import strcpy

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pow

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import log10

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_t_float_62_L000063 ' <symbol:62>
 byte 101
 byte 0

 alignl ' align long
C_t_float_58_L000059 ' <symbol:58>
 byte 48
 byte 0

 alignl ' align long
C_t_float_52_L000053 ' <symbol:52>
 byte 46
 byte 0

 alignl ' align long
C_t_float_50_L000051 ' <symbol:50>
 long $3f800000 ' float

 alignl ' align long
C_t_float_42_L000043 ' <symbol:42>
 long $41200000 ' float

 alignl ' align long
C_t_float_38_L000039 ' <symbol:38>
 long $0 ' float

 alignl ' align long
C_t_float_33_L000034 ' <symbol:33>
 long $0 ' float

 alignl ' align long
C_sj301_619c560d_N_anO_rI_nf_L000012_24_L000025 ' <symbol:24>
 byte 110
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sj301_619c560d_N_anO_rI_nf_L000012_20_L000021 ' <symbol:20>
 byte 105
 byte 110
 byte 102
 byte 0

' Catalina Code

DAT ' code segment
' end
