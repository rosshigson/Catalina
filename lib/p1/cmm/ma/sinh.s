' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_p_L000004 ' <symbol:p>
 long $c8abc89b ' float
 long $c634ae16 ' float
 long $c323c20b ' float
 long $bf4a273e ' float

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_q_L000006 ' <symbol:q>
 long $ca00d674 ' float
 long $470d42b9 ' float
 long $c38ade1c ' float
 long $3f800000 ' float

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001 ' <symbol:sinh_cosh>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_10_L000011)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BRAE + (@C_sooo_67b1107f_sinh_cosh_L000001_8)<<S32 ' GEF4
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sooo_67b1107f_sinh_cosh_L000001_9)<<S32 ' JUMPV addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_8
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_9
 word I16A_MOV + (r17)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sooo_67b1107f_sinh_cosh_L000001_13)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r13)<<D16A + (r23)<<S16A
 word I16B_SIGN + (r13)<<D16B ' NEGF4
 alignl ' align long
 long I32_JMPA + (@C_sooo_67b1107f_sinh_cosh_L000001_14)<<S32 ' JUMPV addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_13
 word I16A_MOV + (r13)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_14
 word I16A_MOV + (r19)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C___I_sN_an)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sooo_67b1107f_sinh_cosh_L000001_15)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((33)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sooo_67b1107f_sinh_cosh_L000001_2)<<S32 ' JUMPV addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_15
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sooo_67b1107f_sinh_cosh_L000001_17)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_19_L000020)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BR_A + (@C_sooo_67b1107f_sinh_cosh_L000001_17)<<S32 ' GTF4
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_p_L000004+4+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_p_L000004+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_p_L000004+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_p_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_q_L000006+4+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_q_L000006+4+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_q_L000006+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_q_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 alignl ' align long
 long I32_JMPA + (@C_sooo_67b1107f_sinh_cosh_L000001_2)<<S32 ' JUMPV addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_17
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_35_L000036)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BR_B + (@C_sooo_67b1107f_sinh_cosh_L000001_33)<<S32 ' LTF4
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_37_L000038)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_41_L000042)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BRAE + (@C_sooo_67b1107f_sinh_cosh_L000001_39)<<S32 ' GEF4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_exp)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_43_L000044)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sooo_67b1107f_sinh_cosh_L000001_34)<<S32 ' JUMPV addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_39
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((34)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_CALA + (@C___huge_val)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sooo_67b1107f_sinh_cosh_L000001_34)<<S32 ' JUMPV addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_33
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_exp)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sooo_67b1107f_sinh_cosh_L000001_48)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_19_L000020)<<S32
 word I16A_MOV + (r11)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 alignl ' align long
 long I32_JMPA + (@C_sooo_67b1107f_sinh_cosh_L000001_49)<<S32 ' JUMPV addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_48
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_50_L000051)<<S32
 word I16A_MOV + (r11)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_49
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_46_L000047)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_34
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sooo_67b1107f_sinh_cosh_L000001_53)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r11)<<D16A + (r23)<<S16A
 word I16B_SIGN + (r11)<<D16B ' NEGF4
 alignl ' align long
 long I32_JMPA + (@C_sooo_67b1107f_sinh_cosh_L000001_54)<<S32 ' JUMPV addrg
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_53
 word I16A_MOV + (r11)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_54
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_2
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export sinh

 alignl ' align long
C_sinh ' <symbol:sinh>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sooo_67b1107f_sinh_cosh_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sinh_55 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export cosh

 alignl ' align long
C_cosh ' <symbol:cosh>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sooo_67b1107f_sinh_cosh_L000001_10_L000011)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl ' align long
 long I32_BRAE + (@C_cosh_57)<<S32 ' GEF4
 word I16B_SIGN + (r23)<<D16B ' NEGF4
 alignl ' align long
C_cosh_57
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sooo_67b1107f_sinh_cosh_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_cosh_56 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import errno

' Catalina Import exp

' Catalina Import __IsNan

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_50_L000051 ' <symbol:50>
 long $bf800000 ' float

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_46_L000047 ' <symbol:46>
 long $3f000000 ' float

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_43_L000044 ' <symbol:43>
 long $385d8bf1 ' float

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_41_L000042 ' <symbol:41>
 long $42b17216 ' float

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_37_L000038 ' <symbol:37>
 long $3f317300 ' float

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_35_L000036 ' <symbol:35>
 long $42b17218 ' float

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_19_L000020 ' <symbol:19>
 long $3f800000 ' float

 alignl ' align long
C_sooo_67b1107f_sinh_cosh_L000001_10_L000011 ' <symbol:10>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
