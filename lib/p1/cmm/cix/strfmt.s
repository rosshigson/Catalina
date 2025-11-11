' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_soj4_690eda11_str_cvt_L000001 ' <symbol:str_cvt>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $ffa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_MOVI + RI<<D32 + (79)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_soj4_690eda11_str_cvt_L000001_3)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((78)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_3
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r13)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_7_L000008)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_soj4_690eda11_str_cvt_L000001_5)<<S32 ' GEF4
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16B_SIGN + (r22)<<D16B ' NEGF4
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_5
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_modf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r11)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_7_L000008)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_Z + (@C_soj4_690eda11_str_cvt_L000001_9)<<S32 ' EQF4
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r11)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_soj4_690eda11_str_cvt_L000001_12)<<S32 ' JUMPV addrg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_11
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_14_L000015)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_modf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_14_L000015)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_16_L000017)<<S32
 word I16A_MOV + (r16)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_FLTP + INFL<<S16B ' CVFI4
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_soj4_690eda11_str_cvt_L000001_12
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_7_L000008)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_soj4_690eda11_str_cvt_L000001_11)<<S32 ' NEF4
 alignl_p1
 long I32_JMPA + (@C_soj4_690eda11_str_cvt_L000001_19)<<S32 ' JUMPV addrg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_18
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_19
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_soj4_690eda11_str_cvt_L000001_18)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_soj4_690eda11_str_cvt_L000001_10)<<S32 ' JUMPV addrg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_9
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_7_L000008)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRBE + (@C_soj4_690eda11_str_cvt_L000001_21)<<S32 ' LEF4
 alignl_p1
 long I32_JMPA + (@C_soj4_690eda11_str_cvt_L000001_24)<<S32 ' JUMPV addrg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_23
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_SUBSI + (r15)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_soj4_690eda11_str_cvt_L000001_24
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_14_L000015)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_26_L000027)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_soj4_690eda11_str_cvt_L000001_23)<<S32 ' LTF4
 alignl_label
C_soj4_690eda11_str_cvt_L000001_21
 alignl_label
C_soj4_690eda11_str_cvt_L000001_10
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_soj4_690eda11_str_cvt_L000001_28)<<S32 ' NEI4 reg coni
 word I16A_ADDS + (r11)<<D16A + (r15)<<S16A ' ADDI/P (2)
 alignl_label
C_soj4_690eda11_str_cvt_L000001_28
 word I16A_WRLONG + (r15)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_soj4_690eda11_str_cvt_L000001_33)<<S32 ' GEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r17)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_soj4_690eda11_str_cvt_L000001_2)<<S32 ' JUMPV addrg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_32
 alignl_p1
 long I32_LODI + (@C_soj4_690eda11_str_cvt_L000001_14_L000015)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_modf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16B_FLTP + INFL<<S16B ' CVFI4
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_33
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r13)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_soj4_690eda11_str_cvt_L000001_35)<<S32 ' GTU4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_CMP + (r13)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_soj4_690eda11_str_cvt_L000001_32)<<S32 ' LTU4 reg reg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_35
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_soj4_690eda11_str_cvt_L000001_36)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((79)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_soj4_690eda11_str_cvt_L000001_2)<<S32 ' JUMPV addrg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_36
 word I16A_MOV + (r13)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r11)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r22)<<D16A + (r11)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_soj4_690eda11_str_cvt_L000001_39)<<S32 ' JUMPV addrg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_38
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r22)<<D16A + (r11)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_soj4_690eda11_str_cvt_L000001_41)<<S32 ' LEU4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_soj4_690eda11_str_cvt_L000001_42)<<S32 ' JUMPV addrg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_41
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(49)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r22)<<D16A + (r11)<<S16A ' ASGNU1 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_soj4_690eda11_str_cvt_L000001_43)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_soj4_690eda11_str_cvt_L000001_45)<<S32 ' LEU4 reg reg
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r22)<<D16A + (r13)<<S16A ' ASGNU1 reg reg
 alignl_label
C_soj4_690eda11_str_cvt_L000001_45
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C_soj4_690eda11_str_cvt_L000001_43
 alignl_label
C_soj4_690eda11_str_cvt_L000001_42
 alignl_label
C_soj4_690eda11_str_cvt_L000001_39
 word I16A_RDBYTE + (r22)<<D16A + (r11)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_A + (@C_soj4_690eda11_str_cvt_L000001_38)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r13)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_soj4_690eda11_str_cvt_L000001_2
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _ecvt

 alignl_label
C__ecvt ' <symbol:_ecvt>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_soj4_690eda11_str_cvt_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C__ecvt_47 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _fcvt

 alignl_label
C__fcvt ' <symbol:_fcvt>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 alignl_p1
 long I32_PSHF + ((8)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF
 word I16A_MOVI + BC<<D16A + 24<<S16A ' arg size, rpsize = 0, spsize = 24
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_soj4_690eda11_str_cvt_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 20<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C__fcvt_48 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import modf

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_soj4_690eda11_str_cvt_L000001_26_L000027 ' <symbol:26>
 long $3f800000 ' float

 alignl_label
C_soj4_690eda11_str_cvt_L000001_16_L000017 ' <symbol:16>
 long $3cf5c28f ' float

 alignl_label
C_soj4_690eda11_str_cvt_L000001_14_L000015 ' <symbol:14>
 long $41200000 ' float

 alignl_label
C_soj4_690eda11_str_cvt_L000001_7_L000008 ' <symbol:7>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
