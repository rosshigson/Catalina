' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_p_L000009 ' <symbol:p>
 long $c1daf2ad ' float
 long $4264d53a ' float
 long $c21ec165 ' float
 long $412270bb ' float
 long $bf325dee ' float

 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_q_L000011 ' <symbol:q>
 long $c3243602 ' float
 long $43d09279 ' float
 long $c3beee78 ' float
 long $4316f3e5 ' float
 long $c1be9743 ' float
 long $3f800000 ' float

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001 ' <symbol:asin_acos>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $eaa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_6_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BRAE + (@C_sqas_67b110cc_asin_acos_L000001_4)<<S32 ' GEF4
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sqas_67b110cc_asin_acos_L000001_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_4
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_5
 word I16A_MOV + (r17)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C___I_sN_an)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sqas_67b110cc_asin_acos_L000001_12)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((33)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sqas_67b110cc_asin_acos_L000001_2)<<S32 ' JUMPV addrg
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_12
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sqas_67b110cc_asin_acos_L000001_14)<<S32 ' EQI4 reg coni
 word I16B_SIGN + (r23)<<D16B ' NEGF4
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_14
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_18_L000019)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BRBE + (@C_sqas_67b110cc_asin_acos_L000001_16)<<S32 ' LEF4
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_22_L000023)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BRBE + (@C_sqas_67b110cc_asin_acos_L000001_20)<<S32 ' LEF4
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((33)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_6_L000007)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 alignl ' align long
 long I32_JMPA + (@C_sqas_67b110cc_asin_acos_L000001_2)<<S32 ' JUMPV addrg
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_20
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_18_L000019)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sqrt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16B_SIGN + (r23)<<D16B ' NEGF4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sqas_67b110cc_asin_acos_L000001_17)<<S32 ' JUMPV addrg
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_16
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_17
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_p_L000009+4+4+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_p_L000009+4+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_p_L000009+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_p_L000009+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_p_L000009)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_q_L000011+4+4+4+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_q_L000011+4+4+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_q_L000011+4+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_q_L000011+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_q_L000011+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_q_L000011)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sqas_67b110cc_asin_acos_L000001_49)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sqas_67b110cc_asin_acos_L000001_51)<<S32 ' NEI4 reg coni
 word I16B_SIGN + (r23)<<D16B ' NEGF4
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_51
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_49
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sqas_67b110cc_asin_acos_L000001_57)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sqas_67b110cc_asin_acos_L000001_58)<<S32 ' JUMPV addrg
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_57
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_58
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sqas_67b110cc_asin_acos_L000001_59)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sqas_67b110cc_asin_acos_L000001_60)<<S32 ' JUMPV addrg
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_59
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_60
 word I16A_CMPS + (r13)<<D16A + (r11)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sqas_67b110cc_asin_acos_L000001_53)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_61_L000062)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sqas_67b110cc_asin_acos_L000001_54)<<S32 ' JUMPV addrg
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_53
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sqas_67b110cc_asin_acos_L000001_63)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sqas_67b110cc_asin_acos_L000001_63)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sqas_67b110cc_asin_acos_L000001_63)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sqas_67b110cc_asin_acos_L000001_65_L000066)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_63
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_54
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sqas_67b110cc_asin_acos_L000001_67)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sqas_67b110cc_asin_acos_L000001_67)<<S32 ' EQI4 reg coni
 word I16B_SIGN + (r23)<<D16B ' NEGF4
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_67
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_2
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export asin

 alignl ' align long
C_asin ' <symbol:asin>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sqas_67b110cc_asin_acos_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_asin_69 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export acos

 alignl ' align long
C_acos ' <symbol:acos>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sqas_67b110cc_asin_acos_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_acos_70 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import errno

' Catalina Import sqrt

' Catalina Import __IsNan

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_65_L000066 ' <symbol:65>
 long $3fc90fdb ' float

 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_61_L000062 ' <symbol:61>
 long $3f490fdb ' float

 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_22_L000023 ' <symbol:22>
 long $3f800000 ' float

 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_18_L000019 ' <symbol:18>
 long $3f000000 ' float

 alignl ' align long
C_sqas_67b110cc_asin_acos_L000001_6_L000007 ' <symbol:6>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
