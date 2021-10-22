' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export itoa

 long ' align long
C_itoa ' <symbol:itoa>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_s620_616ac8b8_itoa_buf_L000001+12-1
 mov r19, RI ' reg <- addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r23,  #0 wz,wc
 jmp #BRAE
 long @C_itoa_5 ' GEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #1 ' ADDI4 coni
 neg r22, r22 ' NEGI4
 mov r21, r22
 add r21, #1 ' ADDU4 coni
 jmp #JMPA
 long @C_itoa_6 ' JUMPV addrg
C_itoa_5
 mov r21, r23 ' CVI, CVU or LOAD
C_itoa_6
 mov r22, #0 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C_itoa_7
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, #10 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r20, r1
 add r20, #48 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #10 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r21, r0 ' CVI, CVU or LOAD
' C_itoa_8 ' (symbol refcount = 0)
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_itoa_7 ' NEU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_itoa_10 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, #45 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_itoa_10
 mov r0, r19 ' CVI, CVU or LOAD
' C_itoa_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 long ' align long
C_s6201_616ac8b8_N_anO_rI_nf_L000012 ' <symbol:NanOrInf>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r23, RI ' ASGNF4 addrli reg
 jmp #LODL
 long $7f800000
 mov r22, RI ' reg <- con
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 and r20, r22 ' BANDI/U (1)
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012_14 ' NEU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $7fffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012_16 ' NEU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012_18 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s6201_616ac8b8_N_anO_rI_nf_L000012_18
 jmp #LODL
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012_20_L000021
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
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012_13 ' JUMPV addrg
C_s6201_616ac8b8_N_anO_rI_nf_L000012_16
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 jmp #LODL
 long $80000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012_22 ' EQU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, #45 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s6201_616ac8b8_N_anO_rI_nf_L000012_22
 jmp #LODL
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012_24_L000025
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
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012_13 ' JUMPV addrg
C_s6201_616ac8b8_N_anO_rI_nf_L000012_14
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_s6201_616ac8b8_N_anO_rI_nf_L000012_13
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export t_float

 long ' align long
C_t_float ' <symbol:t_float>
 jmp #NEWF
 sub SP, #120
 jmp #PSHM
 long $eaa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #8 wz,wc
 jmp #BRBE
 long @C_t_float_27 ' LEI4
 mov r19, #8 ' reg <- coni
C_t_float_27
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s6201_616ac8b8_N_anO_rI_nf_L000012
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_t_float_29 ' EQU4
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_string
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_t_float_26 ' JUMPV addrg
C_t_float_29
 jmp #LODI
 long @C_t_float_33_L000034
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_t_float_31 ' GEF4
 xor r21, Bit31 ' NEGF4
 mov r22, #45 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-39)
 wrbyte r22, RI ' ASGNU1 addrli reg
 jmp #JMPA
 long @C_t_float_32 ' JUMPV addrg
C_t_float_31
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrbyte r22, RI ' ASGNU1 addrli reg
C_t_float_32
 jmp #LODI
 long @C_t_float_38_L000039
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRNZ
 long @C_t_float_36 ' NEF4
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_t_float_37 ' JUMPV addrg
C_t_float_36
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_log10 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r15, r0 ' CVI, CVU or LOAD
C_t_float_37
 cmps r15, r19 wz,wc
 jmp #BRBE
 long @C_t_float_40 ' LEI4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov r2, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_t_float_42_L000043
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
 long @C_t_float_42_L000043
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_B
 long @C_t_float_41 ' LTF4
 jmp #LODI
 long @C_t_float_42_L000043
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r21, r0 ' CVI, CVU or LOAD
 adds r15, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_t_float_41 ' JUMPV addrg
C_t_float_40
 neg r22, r19 ' NEGI4
 cmps r15, r22 wz,wc
 jmp #BRAE
 long @C_t_float_46 ' GEI4
 neg r0, r15 ' NEGI4
 jmp #FLIN ' CVIF4
 mov r2, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_t_float_42_L000043
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
 long @C_t_float_50_L000051
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_t_float_47 ' GEF4
 jmp #LODI
 long @C_t_float_42_L000043
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #FMUL ' MULF4
 mov r21, r0 ' CVI, CVU or LOAD
 subs r15, #1 ' SUBI4 coni
 jmp #JMPA
 long @C_t_float_47 ' JUMPV addrg
C_t_float_46
 mov r15, #0 ' reg <- coni
C_t_float_47
C_t_float_41
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
 long @C_t_float_42_L000043
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
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_itoa ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r0, r13 ' CVI, CVU or LOAD
 jmp #INFL ' CVFI4
 mov r2, r0 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_itoa ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-120) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_t_float_52_L000053
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_t_float_57 ' JUMPV addrg
C_t_float_54
 jmp #LODL
 long @C_t_float_58_L000059
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
' C_t_float_55 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_t_float_57
 cmps r17, r19 wz,wc
 jmp #BR_B
 long @C_t_float_54 ' LTI4
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_t_float_60 ' EQI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_itoa ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-80) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_t_float_62_L000063
 mov r2, RI ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-40) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcat
 add SP, #4 ' CALL addrg
C_t_float_60
 mov r2, FP
 sub r2, #-(-40) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_string
 add SP, #4 ' CALL addrg
C_t_float_26
 jmp #POPM ' restore registers
 add SP, #120 ' framesize
 jmp #RETF


' Catalina Import t_string

' Catalina Data

DAT ' uninitialized data segment

 long ' align long
C_s620_616ac8b8_itoa_buf_L000001 ' <symbol:itoa_buf>
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

 long ' align long
C_t_float_62_L000063 ' <symbol:62>
 byte 101
 byte 0

 long ' align long
C_t_float_58_L000059 ' <symbol:58>
 byte 48
 byte 0

 long ' align long
C_t_float_52_L000053 ' <symbol:52>
 byte 46
 byte 0

 long ' align long
C_t_float_50_L000051 ' <symbol:50>
 long $3f800000 ' float

 long ' align long
C_t_float_42_L000043 ' <symbol:42>
 long $41200000 ' float

 long ' align long
C_t_float_38_L000039 ' <symbol:38>
 long $0 ' float

 long ' align long
C_t_float_33_L000034 ' <symbol:33>
 long $0 ' float

 long ' align long
C_s6201_616ac8b8_N_anO_rI_nf_L000012_24_L000025 ' <symbol:24>
 byte 110
 byte 97
 byte 110
 byte 0

 long ' align long
C_s6201_616ac8b8_N_anO_rI_nf_L000012_20_L000021 ' <symbol:20>
 byte 105
 byte 110
 byte 102
 byte 0

' Catalina Code

DAT ' code segment
' end
