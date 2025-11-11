' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_sjmg_690edb5e_itoa_L000001 ' <symbol:itoa>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (11)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_CMPSI + (r3)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sjmg_690edb5e_itoa_L000001_3)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r23)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sjmg_690edb5e_itoa_L000001_4)<<S32 ' JUMPV addrg
 alignl_label
C_sjmg_690edb5e_itoa_L000001_3
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sjmg_690edb5e_itoa_L000001_4
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r21)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sjmg_690edb5e_itoa_L000001_5
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(48)<<S32 ' reg <- conli
 word I16A_ADD + (r20)<<D16A + (r1)<<S16A ' ADDU (2)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sjmg_690edb5e_itoa_L000001_6 ' (symbol refcount = 0)
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sjmg_690edb5e_itoa_L000001_5)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sjmg_690edb5e_itoa_L000001_8)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(45)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sjmg_690edb5e_itoa_L000001_8
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_sjmg_690edb5e_itoa_L000001_2 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sjmg1_690edb5e_N_anO_rI_nf_L000010 ' <symbol:NanOrInf>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7f800000 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sjmg1_690edb5e_N_anO_rI_nf_L000010_12)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $7fffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sjmg1_690edb5e_N_anO_rI_nf_L000010_14)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $80000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sjmg1_690edb5e_N_anO_rI_nf_L000010_16)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(45)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sjmg1_690edb5e_N_anO_rI_nf_L000010_16
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sjmg1_690edb5e_N_anO_rI_nf_L000010_18_L000019 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (3)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sjmg1_690edb5e_N_anO_rI_nf_L000010_11)<<S32 ' JUMPV addrg
 alignl_label
C_sjmg1_690edb5e_N_anO_rI_nf_L000010_14
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $80000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sjmg1_690edb5e_N_anO_rI_nf_L000010_20)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(45)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sjmg1_690edb5e_N_anO_rI_nf_L000010_20
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sjmg1_690edb5e_N_anO_rI_nf_L000010_22_L000023 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (3)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sjmg1_690edb5e_N_anO_rI_nf_L000010_11)<<S32 ' JUMPV addrg
 alignl_label
C_sjmg1_690edb5e_N_anO_rI_nf_L000010_12
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_label
C_sjmg1_690edb5e_N_anO_rI_nf_L000010_11
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export t_float

 alignl_label
C_t_float ' <symbol:t_float>
 alignl_p1
 long I32_NEWF + 132<<S32
 alignl_p1
 long I32_PSHM + $eaa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPSI + (r19)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRBE + (@C_t_float_25)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r19)<<D16A + (8)<<S16A ' reg <- coni
 alignl_label
C_t_float_25
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sjmg1_690edb5e_N_anO_rI_nf_L000010)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_t_float_27)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_t_string)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_t_float_24)<<S32 ' JUMPV addrg
 alignl_label
C_t_float_27
 alignl_p1
 long I32_LODI + (@C_t_float_31_L000032)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_t_float_29)<<S32 ' GEF4
 word I16B_SIGN + (r21)<<D16B ' NEGF4
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(45)<<S32 ' reg <- conli
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-43)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_t_float_30)<<S32 ' JUMPV addrg
 alignl_label
C_t_float_29
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_label
C_t_float_30
 alignl_p1
 long I32_LODI + (@C_t_float_36_L000037)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_t_float_34)<<S32 ' NEF4
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_t_float_35)<<S32 ' JUMPV addrg
 alignl_label
C_t_float_34
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_log10)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_t_float_35
 word I16A_CMPS + (r15)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRBE + (@C_t_float_38)<<S32 ' LEI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_t_float_40_L000041)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_pow)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_t_float_40_L000041)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_t_float_39)<<S32 ' LTF4
 alignl_p1
 long I32_LODI + (@C_t_float_40_L000041)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FDIV<<S16B ' DIVF4
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_t_float_39)<<S32 ' JUMPV addrg
 alignl_label
C_t_float_38
 word I16A_NEG + (r22)<<D16A + (r19)<<S16A ' NEGI4
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_t_float_44)<<S32 ' GEI4 reg reg
 word I16A_NEG + (r0)<<D16A + (r15)<<S16A ' NEGI4
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_t_float_40_L000041)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_pow)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_t_float_48_L000049)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_t_float_45)<<S32 ' GEF4
 alignl_p1
 long I32_LODI + (@C_t_float_40_L000041)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBSI + (r15)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_t_float_45)<<S32 ' JUMPV addrg
 alignl_label
C_t_float_44
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_t_float_45
 alignl_label
C_t_float_39
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (1)
 word I16B_FLTP + FSUB<<S16B ' SUBF4
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + FLIN<<S16B ' CVIF4
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_t_float_40_L000041)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_pow)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sjmg_690edb5e_itoa_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sjmg_690edb5e_itoa_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_t_float_50_L000051 ' reg ARG ADDRG
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_t_float_55)<<S32 ' JUMPV addrg
 alignl_label
C_t_float_52
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_t_float_56_L000057 ' reg ARG ADDRG
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_t_float_53 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_t_float_55
 word I16A_CMPS + (r17)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C_t_float_52)<<S32 ' LTI4 reg reg
 word I16B_LODF + ((-124)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_t_float_58)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sjmg_690edb5e_itoa_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_t_float_60_L000061 ' reg ARG ADDRG
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strcat)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_t_float_58
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_t_string)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_t_float_24
 word I16B_POPM + 33<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import t_string

' Catalina Import strlen

' Catalina Import strcat

' Catalina Import strcpy

' Catalina Import pow

' Catalina Import log10

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_t_float_60_L000061 ' <symbol:60>
 byte 101
 byte 0

 alignl_label
C_t_float_56_L000057 ' <symbol:56>
 byte 48
 byte 0

 alignl_label
C_t_float_50_L000051 ' <symbol:50>
 byte 46
 byte 0

 alignl_label
C_t_float_48_L000049 ' <symbol:48>
 long $3f800000 ' float

 alignl_label
C_t_float_40_L000041 ' <symbol:40>
 long $41200000 ' float

 alignl_label
C_t_float_36_L000037 ' <symbol:36>
 long $0 ' float

 alignl_label
C_t_float_31_L000032 ' <symbol:31>
 long $0 ' float

 alignl_label
C_sjmg1_690edb5e_N_anO_rI_nf_L000010_22_L000023 ' <symbol:22>
 byte 110
 byte 97
 byte 110
 byte 0

 alignl_label
C_sjmg1_690edb5e_N_anO_rI_nf_L000010_18_L000019 ' <symbol:18>
 byte 105
 byte 110
 byte 102
 byte 0

' Catalina Code

DAT ' code segment
' end
