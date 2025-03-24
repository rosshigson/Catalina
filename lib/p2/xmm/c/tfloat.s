' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_shh8_67da3f27_itoa_L000001 ' <symbol:itoa>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r21, r2
 adds r21, #11 ' ADDP4 coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r3,  #0 wz,wc
 jmp #BRAE
 long @C_shh8_67da3f27_itoa_L000001_3 ' GEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r3
 adds r22, #1 ' ADDI4 coni
 neg r22, r22 ' NEGI4
 mov r23, r22
 add r23, #1 ' ADDU4 coni
 jmp #JMPA
 long @C_shh8_67da3f27_itoa_L000001_4 ' JUMPV addrg
C_shh8_67da3f27_itoa_L000001_3
 mov r23, r3 ' CVI, CVU or LOAD
C_shh8_67da3f27_itoa_L000001_4
 mov r22, #0 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C_shh8_67da3f27_itoa_L000001_5
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, #10 ' reg <- coni
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r1
 add r20, #48 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #10 ' reg <- coni
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r23, r0 ' CVI, CVU or LOAD
' C_shh8_67da3f27_itoa_L000001_6 ' (symbol refcount = 0)
 cmp r23,  #0 wz
 jmp #BRNZ
 long @C_shh8_67da3f27_itoa_L000001_5 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_shh8_67da3f27_itoa_L000001_8 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, #45 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_shh8_67da3f27_itoa_L000001_8
 mov r0, r21 ' CVI, CVU or LOAD
' C_shh8_67da3f27_itoa_L000001_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_shh81_67da3f27_N_anO_rI_nf_L000010 ' <symbol:NanOrInf>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNF4 addrli reg
 jmp #LODL
 long $7f800000
 mov r22, RI ' reg <- con
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 and r20, r22 ' BANDI/U (1)
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010_12 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $7fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010_14 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010_16 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_shh81_67da3f27_N_anO_rI_nf_L000010_16
 jmp #LODL
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010_18_L000019
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #3 ' ADDP4 coni
 jmp #JMPA
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010_11 ' JUMPV addrg
C_shh81_67da3f27_N_anO_rI_nf_L000010_14
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010_20 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_shh81_67da3f27_N_anO_rI_nf_L000010_20
 jmp #LODL
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010_22_L000023
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, r21
 adds r0, #3 ' ADDP4 coni
 jmp #JMPA
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010_11 ' JUMPV addrg
C_shh81_67da3f27_N_anO_rI_nf_L000010_12
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_shh81_67da3f27_N_anO_rI_nf_L000010_11
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export t_float

 alignl ' align long
C_t_float ' <symbol:t_float>
 jmp #NEWF
 sub SP, #132
 jmp #PSHM
 long $eaa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #8 wz,wc
 jmp #BRBE
 long @C_t_float_25 ' LEI4
 mov r19, #8 ' reg <- coni
C_t_float_25
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_shh81_67da3f27_N_anO_rI_nf_L000010
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_t_float_27 ' EQU4
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_string
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_t_float_24 ' JUMPV addrg
C_t_float_27
 jmp #LODI
 long @C_t_float_31_L000032
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_t_float_29 ' GEF4
 xor r21, Bit31 ' NEGF4
 mov r22, #45 ' reg <- coni
 mov RI, FP
 sub RI, #-(-44)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-43)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #JMPA
 long @C_t_float_30 ' JUMPV addrg
C_t_float_29
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-44)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_t_float_30
 jmp #LODI
 long @C_t_float_36_L000037
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_t_float_34 ' NEF4
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_t_float_35 ' JUMPV addrg
C_t_float_34
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_log10 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r15, r0 ' CVI, CVU or LOAD
C_t_float_35
 cmps r15, r19 wz,wc
 jmp #BRBE
 long @C_t_float_38 ' LEI4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r2, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_t_float_40_L000041
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_t_float_40_L000041
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_t_float_39 ' LTF4
 jmp #LODI
 long @C_t_float_40_L000041
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
 adds r15, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_t_float_39 ' JUMPV addrg
C_t_float_38
 neg r22, r19 ' NEGI4
 cmps r15, r22 wz,wc
 jmp #BRAE
 long @C_t_float_44 ' GEI4
 neg r0, r15 ' NEGI4
 jmp #FLIN ' CVIF4
 mov r2, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_t_float_40_L000041
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_t_float_48_L000049
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_t_float_45 ' GEF4
 jmp #LODI
 long @C_t_float_40_L000041
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r21, r0 ' CVI, CVU or LOAD
 subs r15, #1 ' SUBI4 coni
 jmp #JMPA
 long @C_t_float_45 ' JUMPV addrg
C_t_float_44
 mov r15, #0 ' reg <- coni
C_t_float_45
C_t_float_39
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r21 ' setup r0/r1 (1)
 jmp #FSUB ' SUBF4
 mov r13, r0 ' CVI, CVU or LOAD
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r2, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_t_float_40_L000041
 mov r3, RI ' reg ARG INDIR ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_pow
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r13 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_shh8_67da3f27_itoa_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r3, r0 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_shh8_67da3f27_itoa_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-124) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_t_float_50_L000051
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-124) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_t_float_55 ' JUMPV addrg
C_t_float_52
 jmp #LODL
 long @C_t_float_56_L000057
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
' C_t_float_53 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_t_float_55
 cmps r17, r19 wz,wc
 jmp #BR_B
 long @C_t_float_52 ' LTI4
 mov r2, FP
 sub r2, #-(-124) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_t_float_58 ' EQI4
 mov r2, FP
 sub r2, #-(-136) ' reg ARG ADDRLi
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_shh8_67da3f27_itoa_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_t_float_60_L000061
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
C_t_float_58
 mov r2, FP
 sub r2, #-(-44) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_string
 add SP, #4 ' CALL addrg
C_t_float_24
 jmp #POPM ' restore registers
 add SP, #132 ' framesize
 jmp #RETF


' Catalina Import t_string

' Catalina Import strlen

' Catalina Import strcat

' Catalina Import strcpy

' Catalina Import pow

' Catalina Import log10

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_t_float_60_L000061 ' <symbol:60>
 byte 101
 byte 0

 alignl ' align long
C_t_float_56_L000057 ' <symbol:56>
 byte 48
 byte 0

 alignl ' align long
C_t_float_50_L000051 ' <symbol:50>
 byte 46
 byte 0

 alignl ' align long
C_t_float_48_L000049 ' <symbol:48>
 long $3f800000 ' float

 alignl ' align long
C_t_float_40_L000041 ' <symbol:40>
 long $41200000 ' float

 alignl ' align long
C_t_float_36_L000037 ' <symbol:36>
 long $0 ' float

 alignl ' align long
C_t_float_31_L000032 ' <symbol:31>
 long $0 ' float

 alignl ' align long
C_shh81_67da3f27_N_anO_rI_nf_L000010_22_L000023 ' <symbol:22>
 byte 110
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_shh81_67da3f27_N_anO_rI_nf_L000010_18_L000019 ' <symbol:18>
 byte 105
 byte 110
 byte 102
 byte 0

' Catalina Code

DAT ' code segment
' end
