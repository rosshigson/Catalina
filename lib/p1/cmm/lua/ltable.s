' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sin0_696ddf71_dummynode__L000015 ' <symbol:dummynode_>
 long $0
 byte $10
 byte $0
 byte 0[2]
 long 0
 long $0

 alignl_label
C_sin01_696ddf71_absentkey_L000016 ' <symbol:absentkey>
 long $0
 byte $20
 byte 0[3]

' Catalina Code

DAT ' code segment

 alignl_label
C_sin02_696ddf71_hashint_L000017 ' <symbol:hashint>
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7fffffff ' reg <- con
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin02_696ddf71_hashint_L000017_19)<<S32 ' GTU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16A_SHL + RI<<D16A + (r18)<<S16A
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_SUBSI + (r18)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_OR + (r22)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sin02_696ddf71_hashint_L000017_18)<<S32 ' JUMPV addrg
 alignl_label
C_sin02_696ddf71_hashint_L000017_19
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16A_SHL + RI<<D16A + (r20)<<S16A
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (2)
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_label
C_sin02_696ddf71_hashint_L000017_18
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sin03_696ddf71_l_hashfloat_L000021 ' <symbol:l_hashfloat>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_frexp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sin03_696ddf71_l_hashfloat_L000021_23_L000024)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FMUL<<S16B ' MULF4
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODI + (@C_sin03_696ddf71_l_hashfloat_L000021_28_L000029)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_B + (@C_sin03_696ddf71_l_hashfloat_L000021_30)<<S32 ' LTF4
 alignl_p1
 long I32_LODI + (@C_sin03_696ddf71_l_hashfloat_L000021_23_L000024)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRAE + (@C_sin03_696ddf71_l_hashfloat_L000021_30)<<S32 ' GEF4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin03_696ddf71_l_hashfloat_L000021_25)<<S32 ' NEI4 reg coni
 alignl_label
C_sin03_696ddf71_l_hashfloat_L000021_30
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sin03_696ddf71_l_hashfloat_L000021_22)<<S32 ' JUMPV addrg
 alignl_label
C_sin03_696ddf71_l_hashfloat_L000021_25
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $7fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin03_696ddf71_l_hashfloat_L000021_32)<<S32 ' GTU4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r21)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_JMPA + (@C_sin03_696ddf71_l_hashfloat_L000021_33)<<S32 ' JUMPV addrg
 alignl_label
C_sin03_696ddf71_l_hashfloat_L000021_32
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16B_CPL + (r21)<<D16B ' BCOMU4
 alignl_label
C_sin03_696ddf71_l_hashfloat_L000021_33
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sin03_696ddf71_l_hashfloat_L000021_22
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034 ' <symbol:mainpositionTV>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r19)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r19)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sin06_696ddf71_mainpositionT_V__L000034_36)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin06_696ddf71_mainpositionT_V__L000034_47)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sin06_696ddf71_mainpositionT_V__L000034_48_L000050-4 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_48_L000050 ' <symbol:48>
 long @C_sin06_696ddf71_mainpositionT_V__L000034_43
 long @C_sin06_696ddf71_mainpositionT_V__L000034_45
 long @C_sin06_696ddf71_mainpositionT_V__L000034_39
 long @C_sin06_696ddf71_mainpositionT_V__L000034_41

' Catalina Code

DAT ' code segment
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_47
 word I16A_CMPSI + (r19)<<D16A + (17)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sin06_696ddf71_mainpositionT_V__L000034_36)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin06_696ddf71_mainpositionT_V__L000034_36)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sin06_696ddf71_mainpositionT_V__L000034_52_L000054-68 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_52_L000054 ' <symbol:52>
 long @C_sin06_696ddf71_mainpositionT_V__L000034_44
 long @C_sin06_696ddf71_mainpositionT_V__L000034_36
 long @C_sin06_696ddf71_mainpositionT_V__L000034_40
 long @C_sin06_696ddf71_mainpositionT_V__L000034_42
 long @C_sin06_696ddf71_mainpositionT_V__L000034_36
 long @C_sin06_696ddf71_mainpositionT_V__L000034_46

' Catalina Code

DAT ' code segment
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_39
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin02_696ddf71_hashint_L000017)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin06_696ddf71_mainpositionT_V__L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_40
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRF4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sin03_696ddf71_l_hashfloat_L000021)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r18)<<S16A
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_SUBSI + (r18)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sin06_696ddf71_mainpositionT_V__L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_41
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sin06_696ddf71_mainpositionT_V__L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_42
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaS__hashlongstr)<<S32 ' CALL addrg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' BANDI/U
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sin06_696ddf71_mainpositionT_V__L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_43
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sin06_696ddf71_mainpositionT_V__L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_44
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16A_SHL + RI<<D16A + (r20)<<S16A
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sin06_696ddf71_mainpositionT_V__L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_45
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16A_SHL + RI<<D16A + (r18)<<S16A
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_SUBSI + (r18)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_OR + (r22)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sin06_696ddf71_mainpositionT_V__L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_46
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16A_SHL + RI<<D16A + (r18)<<S16A
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_SUBSI + (r18)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_OR + (r22)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_sin06_696ddf71_mainpositionT_V__L000034_35)<<S32 ' JUMPV addrg
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_36
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16A_SHL + RI<<D16A + (r18)<<S16A
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_SUBSI + (r18)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_OR + (r22)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r1)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_label
C_sin06_696ddf71_mainpositionT_V__L000034_35
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0b_696ddf71_mainpositionfromnode_L000056 ' <symbol:mainpositionfromnode>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r1)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin06_696ddf71_mainpositionT_V__L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sin0b_696ddf71_mainpositionfromnode_L000056_57 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0c_696ddf71_equalkey_L000058 ' <symbol:equalkey>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faae00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0c_696ddf71_equalkey_L000058_60)<<S32 ' EQI4 reg reg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0c_696ddf71_equalkey_L000058_63)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r20)<<D16A + (11)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0c_696ddf71_equalkey_L000058_63)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0c_696ddf71_equalkey_L000058_60)<<S32 ' NEI4 reg coni
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_63
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_59)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_60
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r17)<<D16B ' zero extend
 word I16A_CMPSI + (r17)<<D16A + (17)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0c_696ddf71_equalkey_L000058_67)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (19)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0c_696ddf71_equalkey_L000058_72)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0c_696ddf71_equalkey_L000058_80)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin0c_696ddf71_equalkey_L000058_89)<<S32 ' GTI4 reg coni
' C_sin0c_696ddf71_equalkey_L000058_88 ' (symbol refcount = 0)
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sin0c_696ddf71_equalkey_L000058_64)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin0c_696ddf71_equalkey_L000058_64)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sin0c_696ddf71_equalkey_L000058_90_L000092 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sin0c_696ddf71_equalkey_L000058_90_L000092 ' <symbol:90>
 long @C_sin0c_696ddf71_equalkey_L000058_67
 long @C_sin0c_696ddf71_equalkey_L000058_67
 long @C_sin0c_696ddf71_equalkey_L000058_76
 long @C_sin0c_696ddf71_equalkey_L000058_68

' Catalina Code

DAT ' code segment
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_89
 alignl_p1
 long I32_MOVI + RI<<D32 + (84)<<S32
 word I16A_CMPS + (r17)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0c_696ddf71_equalkey_L000058_84)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_64)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_67
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_59)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_68
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0c_696ddf71_equalkey_L000058_70)<<S32 ' NEI4 reg reg
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_71)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_70
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_71
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_59)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_72
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRF4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRF4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BRNZ + (@C_sin0c_696ddf71_equalkey_L000058_74)<<S32 ' NEF4
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_75)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_74
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_75
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_59)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_76
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0c_696ddf71_equalkey_L000058_78)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_79)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_78
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_79
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_59)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_80
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0c_696ddf71_equalkey_L000058_82)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_83)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_82
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_83
 word I16A_MOV + (r0)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_59)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_84
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r3)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaS__eqlngstr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_59)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_64
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0c_696ddf71_equalkey_L000058_86)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r9)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0c_696ddf71_equalkey_L000058_87)<<S32 ' JUMPV addrg
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_86
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_87
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sin0c_696ddf71_equalkey_L000058_59
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_realasize

 alignl_label
C_luaH__realasize ' <symbol:luaH_realasize>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__realasize_96)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__realasize_94)<<S32 ' NEU4 reg coni
 alignl_label
C_luaH__realasize_96
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_JMPA + (@C_luaH__realasize_93)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__realasize_94
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r22)<<D16A + (2)<<S16A ' SHRU4 reg coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r22)<<D16A + (4)<<S16A ' SHRU4 reg coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_ADDI + (r23)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaH__realasize_93
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sin0f_696ddf71_ispow2realasize_L000097 ' <symbol:ispow2realasize>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0f_696ddf71_ispow2realasize_L000097_102)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0f_696ddf71_ispow2realasize_L000097_100)<<S32 ' NEU4 reg coni
 alignl_label
C_sin0f_696ddf71_ispow2realasize_L000097_102
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0f_696ddf71_ispow2realasize_L000097_101)<<S32 ' JUMPV addrg
 alignl_label
C_sin0f_696ddf71_ispow2realasize_L000097_100
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sin0f_696ddf71_ispow2realasize_L000097_101
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_sin0f_696ddf71_ispow2realasize_L000097_98 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sin0g_696ddf71_setlimittosize_L000103 ' <symbol:setlimittosize>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaH__realasize)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffff7f ' reg <- con
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
' C_sin0g_696ddf71_setlimittosize_L000103_104 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0h_696ddf71_getgeneric_L000105 ' <symbol:getgeneric>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin06_696ddf71_mainpositionT_V__L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sin0h_696ddf71_getgeneric_L000105_107
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0c_696ddf71_equalkey_L000058)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0h_696ddf71_getgeneric_L000105_111)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0h_696ddf71_getgeneric_L000105_106)<<S32 ' JUMPV addrg
 alignl_label
C_sin0h_696ddf71_getgeneric_L000105_111
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0h_696ddf71_getgeneric_L000105_113)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r0)<<D16B
 alignl_p1
 long @C_sin01_696ddf71_absentkey_L000016 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_sin0h_696ddf71_getgeneric_L000105_106)<<S32 ' JUMPV addrg
 alignl_label
C_sin0h_696ddf71_getgeneric_L000105_113
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r17)<<D16A + (r22)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_sin0h_696ddf71_getgeneric_L000105_107)<<S32 ' JUMPV addrg
 alignl_label
C_sin0h_696ddf71_getgeneric_L000105_106
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0i_696ddf71_arrayindex_L000115 ' <symbol:arrayindex>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $1fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sin0i_696ddf71_arrayindex_L000115_117)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0i_696ddf71_arrayindex_L000115_116)<<S32 ' JUMPV addrg
 alignl_label
C_sin0i_696ddf71_arrayindex_L000115_117
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_sin0i_696ddf71_arrayindex_L000115_116
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sin0j_696ddf71_findindex_L000119 ' <symbol:findindex>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0j_696ddf71_findindex_L000119_121)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sin0j_696ddf71_findindex_L000119_120)<<S32 ' JUMPV addrg
 alignl_label
C_sin0j_696ddf71_findindex_L000119_121
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0j_696ddf71_findindex_L000119_124)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sin0i_696ddf71_arrayindex_L000115)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0j_696ddf71_findindex_L000119_125)<<S32 ' JUMPV addrg
 alignl_label
C_sin0j_696ddf71_findindex_L000119_124
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sin0j_696ddf71_findindex_L000119_125
 word I16A_MOV + (r15)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sin0j_696ddf71_findindex_L000119_126)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin0j_696ddf71_findindex_L000119_120)<<S32 ' JUMPV addrg
 alignl_label
C_sin0j_696ddf71_findindex_L000119_126
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0h_696ddf71_getgeneric_L000105)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0j_696ddf71_findindex_L000119_128)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sin0j_696ddf71_findindex_L000119_130_L000131 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaG__runerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sin0j_696ddf71_findindex_L000119_128
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r0)<<D16A + (r17)<<S16A ' ADDU (3)
 alignl_label
C_sin0j_696ddf71_findindex_L000119_120
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_next

 alignl_label
C_luaH__next ' <symbol:luaH_next>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $feac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaH__realasize)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sin0j_696ddf71_findindex_L000119)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__next_136)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__next_133
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__next_137)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r13)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r13)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_luaH__next_132)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__next_137
' C_luaH__next_134 ' (symbol refcount = 0)
 word I16A_ADDI + (r17)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_luaH__next_136
 word I16A_CMP + (r17)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaH__next_133)<<S32 ' LTU4 reg reg
 word I16A_SUB + (r17)<<D16A + (r15)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C_luaH__next_142)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__next_139
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__next_143)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r11)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r10)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r10)<<S16A
 word I16A_ADDSI + (r1)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r11)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r10)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_luaH__next_132)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__next_143
' C_luaH__next_140 ' (symbol refcount = 0)
 word I16A_ADDI + (r17)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_luaH__next_142
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaH__next_139)<<S32 ' LTI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_luaH__next_132
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0l_696ddf71_freehash_L000145 ' <symbol:freehash>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0l_696ddf71_freehash_L000145_147)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r2)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sin0l_696ddf71_freehash_L000145_147
' C_sin0l_696ddf71_freehash_L000145_146 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0m_696ddf71_computesizes_L000149 ' <symbol:computesizes>
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0m_696ddf71_computesizes_L000149_154)<<S32 ' JUMPV addrg
 alignl_label
C_sin0m_696ddf71_computesizes_L000149_151
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r21)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sin0m_696ddf71_computesizes_L000149_155)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r15)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sin0m_696ddf71_computesizes_L000149_155
' C_sin0m_696ddf71_computesizes_L000149_152 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r23)<<D16A + (1)<<S16A ' SHLU4 reg coni
 alignl_label
C_sin0m_696ddf71_computesizes_L000149_154
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0m_696ddf71_computesizes_L000149_157)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r20)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin0m_696ddf71_computesizes_L000149_151)<<S32 ' GTU4 reg reg
 alignl_label
C_sin0m_696ddf71_computesizes_L000149_157
 word I16A_WRLONG + (r17)<<D16A + (r2)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_sin0m_696ddf71_computesizes_L000149_150 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sin0n_696ddf71_countint_L000158 ' <symbol:countint>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sin0i_696ddf71_arrayindex_L000115)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0n_696ddf71_countint_L000158_160)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaO__ceillog2)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r20)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sin0n_696ddf71_countint_L000158_159)<<S32 ' JUMPV addrg
 alignl_label
C_sin0n_696ddf71_countint_L000158_160
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_sin0n_696ddf71_countint_L000158_159
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0o_696ddf71_numusearray_L000162 ' <symbol:numusearray>
 alignl_p1
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0o_696ddf71_numusearray_L000162_167)<<S32 ' JUMPV addrg
 alignl_label
C_sin0o_696ddf71_numusearray_L000162_164
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r13)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sin0o_696ddf71_numusearray_L000162_175)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r13)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r23)<<D16A + (r13)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sin0o_696ddf71_numusearray_L000162_175)<<S32 ' LEU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sin0o_696ddf71_numusearray_L000162_166)<<S32 ' JUMPV addrg
 alignl_label
C_sin0o_696ddf71_numusearray_L000162_172
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0o_696ddf71_numusearray_L000162_176)<<S32 ' EQI4 reg coni
 word I16A_ADDI + (r11)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_sin0o_696ddf71_numusearray_L000162_176
' C_sin0o_696ddf71_numusearray_L000162_173 ' (symbol refcount = 0)
 word I16A_ADDI + (r23)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_sin0o_696ddf71_numusearray_L000162_175
 word I16A_CMP + (r23)<<D16A + (r13)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sin0o_696ddf71_numusearray_L000162_172)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r20)<<D16A + (r11)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_ADD + (r15)<<D16A + (r11)<<S16A ' ADDU (1)
' C_sin0o_696ddf71_numusearray_L000162_165 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r19)<<D16A + (1)<<S16A ' SHLU4 reg coni
 alignl_label
C_sin0o_696ddf71_numusearray_L000162_167
 word I16A_CMPSI + (r21)<<D16A + (31)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sin0o_696ddf71_numusearray_L000162_164)<<S32 ' LEI4 reg coni
 alignl_label
C_sin0o_696ddf71_numusearray_L000162_166
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_sin0o_696ddf71_numusearray_L000162_163 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sin0p_696ddf71_numusehash_L000178 ' <symbol:numusehash>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' LSHI/U
 word I16A_SHL + (r17)<<D16A + (r20)<<S16A ' LSHI/U (3)
 alignl_p1
 long I32_JMPA + (@C_sin0p_696ddf71_numusehash_L000178_181)<<S32 ' JUMPV addrg
 alignl_label
C_sin0p_696ddf71_numusehash_L000178_180
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0p_696ddf71_numusehash_L000178_183)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0p_696ddf71_numusehash_L000178_185)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0n_696ddf71_countint_L000158)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDS + (r13)<<D16A + (r0)<<S16A ' ADDI/P (1)
 alignl_label
C_sin0p_696ddf71_numusehash_L000178_185
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sin0p_696ddf71_numusehash_L000178_183
 alignl_label
C_sin0p_696ddf71_numusehash_L000178_181
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0p_696ddf71_numusehash_L000178_180)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_sin0p_696ddf71_numusehash_L000178_179 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0q_696ddf71_setnodevector_L000187 ' <symbol:setnodevector>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0q_696ddf71_setnodevector_L000187_189)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sin0_696ddf71_dummynode__L000015 ' reg <- addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sin0q_696ddf71_setnodevector_L000187_190)<<S32 ' JUMPV addrg
 alignl_label
C_sin0q_696ddf71_setnodevector_L000187_189
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaO__ceillog2)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (30)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin0q_696ddf71_setnodevector_L000187_193)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r22)<<D16A + (r15)<<S16A ' LSHI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $fffffff ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sin0q_696ddf71_setnodevector_L000187_191)<<S32 ' LEU4 reg reg
 alignl_label
C_sin0q_696ddf71_setnodevector_L000187_193
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sin0q_696ddf71_setnodevector_L000187_194_L000195 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaG__runerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sin0q_696ddf71_setnodevector_L000187_191
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_SHL + (r22)<<D16A + (r15)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r3)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__malloc_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0q_696ddf71_setnodevector_L000187_199)<<S32 ' JUMPV addrg
 alignl_label
C_sin0q_696ddf71_setnodevector_L000187_196
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_sin0q_696ddf71_setnodevector_L000187_197 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sin0q_696ddf71_setnodevector_L000187_199
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r17)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sin0q_696ddf71_setnodevector_L000187_196)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r20)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_sin0q_696ddf71_setnodevector_L000187_190
' C_sin0q_696ddf71_setnodevector_L000187_188 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0s_696ddf71_reinsert_L000200 ' <symbol:reinsert>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' LSHI/U
 word I16A_SHL + (r15)<<D16A + (r20)<<S16A ' LSHI/U (3)
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sin0s_696ddf71_reinsert_L000200_205)<<S32 ' JUMPV addrg
 alignl_label
C_sin0s_696ddf71_reinsert_L000200_202
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r13)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0s_696ddf71_reinsert_L000200_206)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r11)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r10)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r10)<<S16A
 word I16A_ADDSI + (r1)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaH__set)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_label
C_sin0s_696ddf71_reinsert_L000200_206
' C_sin0s_696ddf71_reinsert_L000200_203 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sin0s_696ddf71_reinsert_L000200_205
 word I16A_CMPS + (r17)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sin0s_696ddf71_reinsert_L000200_202)<<S32 ' LTI4 reg reg
' C_sin0s_696ddf71_reinsert_L000200_201 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0t_696ddf71_exchangehashpart_L000208 ' <symbol:exchangehashpart>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
' C_sin0t_696ddf71_exchangehashpart_L000208_209 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_resize

 alignl_label
C_luaH__resize ' <symbol:luaH_resize>
 alignl_p1
 long I32_NEWF + 32<<S32
 alignl_p1
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sin0g_696ddf71_setlimittosize_L000103)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0q_696ddf71_setnodevector_L000187)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMP + (r19)<<D16A + (r13)<<S16A
 alignl_p1
 long I32_BRAE + (@C_luaH__resize_211)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0t_696ddf71_exchangehashpart_L000208)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__resize_216)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__resize_213
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__resize_217)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaH__setint)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_label
C_luaH__resize_217
' C_luaH__resize_214 ' (symbol refcount = 0)
 word I16A_ADDI + (r15)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_luaH__resize_216
 word I16A_CMP + (r15)<<D16A + (r13)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaH__resize_213)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r13)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0t_696ddf71_exchangehashpart_L000208)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaH__resize_211
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r2)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A
 word I16A_SHLI + (r3)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaM__realloc_)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__resize_219)<<S32 ' NEU4 reg coni
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__resize_219)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0l_696ddf71_freehash_L000145)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaD__throw)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaH__resize_219
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0t_696ddf71_exchangehashpart_L000208)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r11)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r15)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__resize_224)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__resize_221
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_luaH__resize_222 ' (symbol refcount = 0)
 word I16A_ADDI + (r15)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_luaH__resize_224
 word I16A_CMP + (r15)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaH__resize_221)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0s_696ddf71_reinsert_L000200)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0l_696ddf71_freehash_L000145)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_luaH__resize_210 ' (symbol refcount = 0)
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_resizearray

 alignl_label
C_luaH__resizearray ' <symbol:luaH_resizearray>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__resizearray_227)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_luaH__resizearray_228)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__resizearray_227
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' LSHI/U
 word I16A_SHL + (r17)<<D16A + (r20)<<S16A ' LSHI/U (3)
 alignl_label
C_luaH__resizearray_228
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaH__resize)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
' C_luaH__resizearray_225 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0u_696ddf71_rehash_L000229 ' <symbol:rehash>
 alignl_p1
 long I32_NEWF + 136<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sin0u_696ddf71_rehash_L000229_231
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-132)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_sin0u_696ddf71_rehash_L000229_232 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r17)<<D16A + (31)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sin0u_696ddf71_rehash_L000229_231)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sin0g_696ddf71_setlimittosize_L000103)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODF + ((-132)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0o_696ddf71_numusearray_L000162)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-136)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-136)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl_p1
 long I32_LODF + ((-132)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0p_696ddf71_numusehash_L000178)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_ADDS + (r15)<<D16A + (r0)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0u_696ddf71_rehash_L000229_235)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODF + ((-132)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_RDLONG + (r3)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0n_696ddf71_countint_L000158)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-136)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16B_LODF + ((-136)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_sin0u_696ddf71_rehash_L000229_235
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_LODF + ((-136)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl_p1
 long I32_LODF + ((-132)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0m_696ddf71_computesizes_L000149)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-140)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-136)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' SUBU
 word I16A_SUB + (r2)<<D16A + (r20)<<S16A ' SUBU (3)
 alignl_p1
 long I32_LODF + ((-140)&$FFFFFF)<<S32
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaH__resize)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
' C_sin0u_696ddf71_rehash_L000229_230 ' (symbol refcount = 0)
 word I16B_POPM + 34<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_new

 alignl_label
C_luaH__new ' <symbol:luaH_new>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaC__newobj)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r21)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(63)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0q_696ddf71_setnodevector_L000187)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_luaH__new_237 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_free

 alignl_label
C_luaH__free ' <symbol:luaH_free>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0l_696ddf71_freehash_L000145)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaH__realasize)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r2)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_luaH__free_238 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin0v_696ddf71_getfreepos_L000239 ' <symbol:getfreepos>
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin0v_696ddf71_getfreepos_L000239_241)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sin0v_696ddf71_getfreepos_L000239_244)<<S32 ' JUMPV addrg
 alignl_label
C_sin0v_696ddf71_getfreepos_L000239_243
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r18)<<D16A + (-(-16)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin0v_696ddf71_getfreepos_L000239_246)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_sin0v_696ddf71_getfreepos_L000239_240)<<S32 ' JUMPV addrg
 alignl_label
C_sin0v_696ddf71_getfreepos_L000239_246
 alignl_label
C_sin0v_696ddf71_getfreepos_L000239_244
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin0v_696ddf71_getfreepos_L000239_243)<<S32 ' GTU4 reg reg
 alignl_label
C_sin0v_696ddf71_getfreepos_L000239_241
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_label
C_sin0v_696ddf71_getfreepos_L000239_240
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248 ' <symbol:luaH_newkey>
 alignl_p1
 long I32_NEWF + 20<<S32
 alignl_p1
 long I32_PSHM + $ffa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin010_696ddf71_luaH__newkey_L000248_250)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sin010_696ddf71_luaH__newkey_L000248_252_L000253 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaG__runerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sin010_696ddf71_luaH__newkey_L000248_251)<<S32 ' JUMPV addrg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_250
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (19)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin010_696ddf71_luaH__newkey_L000248_254)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRF4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaV__flttointeger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin010_696ddf71_luaH__newkey_L000248_256)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_JMPA + (@C_sin010_696ddf71_luaH__newkey_L000248_257)<<S32 ' JUMPV addrg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_256
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FCMP<<S16B
 alignl_p1
 long I32_BR_Z + (@C_sin010_696ddf71_luaH__newkey_L000248_258)<<S32 ' EQF4
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sin010_696ddf71_luaH__newkey_L000248_260_L000261 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaG__runerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_258
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_257
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_254
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_251
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin010_696ddf71_luaH__newkey_L000248_262)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sin010_696ddf71_luaH__newkey_L000248_249)<<S32 ' JUMPV addrg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_262
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin06_696ddf71_mainpositionT_V__L000034)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin010_696ddf71_luaH__newkey_L000248_266)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin010_696ddf71_luaH__newkey_L000248_264)<<S32 ' NEU4 reg coni
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_266
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sin0v_696ddf71_getfreepos_L000239)<<S32 ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin010_696ddf71_luaH__newkey_L000248_267)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0u_696ddf71_rehash_L000229)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaH__set)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sin010_696ddf71_luaH__newkey_L000248_249)<<S32 ' JUMPV addrg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_267
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin0b_696ddf71_mainpositionfromnode_L000056)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin010_696ddf71_luaH__newkey_L000248_269)<<S32 ' EQU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sin010_696ddf71_luaH__newkey_L000248_272)<<S32 ' JUMPV addrg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_271
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r13)<<D16A + (r22)<<S16A ' ADDI/P (2)
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_272
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin010_696ddf71_luaH__newkey_L000248_271)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOVI + (r18)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 16<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin010_696ddf71_luaH__newkey_L000248_274)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r16)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r18)<<D16A + (r16)<<S16A ' SUBU (1)
 word I16A_MOVI + (r16)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_274
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_sin010_696ddf71_luaH__newkey_L000248_270)<<S32 ' JUMPV addrg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_269
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin010_696ddf71_luaH__newkey_L000248_276)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r20)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r15)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r18)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOVI + (r18)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_276
' C_sin010_696ddf71_luaH__newkey_L000248_277 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOVI + (r18)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r15)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_270
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_264
 word I16A_MOV + (r13)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin010_696ddf71_luaH__newkey_L000248_279)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin010_696ddf71_luaH__newkey_L000248_279)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sin010_696ddf71_luaH__newkey_L000248_279)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__barrierback_)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sin010_696ddf71_luaH__newkey_L000248_279)<<S32 ' JUMPV addrg
 alignl_p1
 long I32_JMPA + (@C_sin010_696ddf71_luaH__newkey_L000248_279)<<S32 ' JUMPV addrg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_279
 word I16A_MOV + (r13)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_249
 word I16B_POPM + 5<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_getint

 alignl_label
C_luaH__getint ' <symbol:luaH_getint>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRAE + (@C_luaH__getint_283)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_SUBSI + (r22)<<D16A + (8)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_luaH__getint_282)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getint_283
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getint_285)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_CPL + (r20)<<D16B ' BCOMU4
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMP + (r22)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRAE + (@C_luaH__getint_285)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_SUBSI + (r22)<<D16A + (8)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_luaH__getint_282)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getint_285
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin02_696ddf71_hashint_L000017)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaH__getint_287
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getint_291)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getint_291)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__getint_282)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getint_291
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getint_293)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaH__getint_289)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getint_293
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r17)<<D16A + (r22)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_luaH__getint_287)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getint_289
 word I16B_LODL + (r0)<<D16B
 alignl_p1
 long @C_sin01_696ddf71_absentkey_L000016 ' reg <- addrg
 alignl_label
C_luaH__getint_282
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_getshortstr

 alignl_label
C_luaH__getshortstr ' <symbol:luaH_getshortstr>
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_label
C_luaH__getshortstr_296
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (68)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getshortstr_300)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getshortstr_300)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__getshortstr_295)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getshortstr_300
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getshortstr_302)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r0)<<D16B
 alignl_p1
 long @C_sin01_696ddf71_absentkey_L000016 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_luaH__getshortstr_295)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getshortstr_302
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_luaH__getshortstr_296)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getshortstr_295
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaH_getstr

 alignl_label
C_luaH__getstr ' <symbol:luaH_getstr>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getstr_305)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getshortstr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__getstr_304)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getstr_305
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0h_696ddf71_getgeneric_L000105)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaH__getstr_304
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_get

 alignl_label
C_luaH__get ' <symbol:luaH_get>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r19)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__get_313)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__get_312)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__get_311)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaH__get_308)<<S32 ' LTI4 reg coni
' C_luaH__get_317 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (19)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__get_314)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaH__get_308)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__get_311
 word I16A_RDLONG + (r2)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getshortstr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__get_307)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__get_312
 word I16A_RDLONG + (r2)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getint)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__get_307)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__get_313
 word I16B_LODL + (r0)<<D16B
 alignl_p1
 long @C_sin01_696ddf71_absentkey_L000016 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_luaH__get_307)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__get_314
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_RDLONG + (r4)<<D16A + (r21)<<S16A ' reg <- INDIRF4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaV__flttointeger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__get_315)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getint)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__get_307)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__get_315
 alignl_label
C_luaH__get_308
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin0h_696ddf71_getgeneric_L000105)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaH__get_307
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_finishset

 alignl_label
C_luaH__finishset ' <symbol:luaH_finishset>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__finishset_319)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sin010_696ddf71_luaH__newkey_L000248)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaH__finishset_320)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__finishset_319
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r1)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_luaH__finishset_320
' C_luaH__finishset_318 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_set

 alignl_label
C_luaH__set ' <symbol:luaH_set>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__get)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaH__finishset)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
' C_luaH__set_321 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaH_setint

 alignl_label
C_luaH__setint ' <symbol:luaH_setint>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getint)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__setint_323)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_sin010_696ddf71_luaH__newkey_L000248)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaH__setint_324)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__setint_323
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r1)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_luaH__setint_324
' C_luaH__setint_322 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin013_696ddf71_hash_search_L000325 ' <symbol:hash_search>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin013_696ddf71_hash_search_L000325_327)<<S32 ' NEU4 reg coni
 word I16A_ADDI + (r21)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_sin013_696ddf71_hash_search_L000325_327
 alignl_label
C_sin013_696ddf71_hash_search_L000325_329
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $3fffffff ' reg <- con
 word I16A_CMP + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin013_696ddf71_hash_search_L000325_332)<<S32 ' GTU4 reg reg
 word I16A_SHLI + (r21)<<D16A + (1)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sin013_696ddf71_hash_search_L000325_333)<<S32 ' JUMPV addrg
 alignl_label
C_sin013_696ddf71_hash_search_L000325_332
 word I16B_LODL + (r21)<<D16B
 alignl_p1
 long $7fffffff ' reg <- con
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getint)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin013_696ddf71_hash_search_L000325_334)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sin013_696ddf71_hash_search_L000325_337)<<S32 ' JUMPV addrg
 alignl_label
C_sin013_696ddf71_hash_search_L000325_334
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin013_696ddf71_hash_search_L000325_326)<<S32 ' JUMPV addrg
 alignl_label
C_sin013_696ddf71_hash_search_L000325_333
' C_sin013_696ddf71_hash_search_L000325_330 ' (symbol refcount = 0)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getint)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin013_696ddf71_hash_search_L000325_329)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sin013_696ddf71_hash_search_L000325_337)<<S32 ' JUMPV addrg
 alignl_label
C_sin013_696ddf71_hash_search_L000325_336
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r21)<<S16A ' ADDU (3)
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r17)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getint)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin013_696ddf71_hash_search_L000325_339)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin013_696ddf71_hash_search_L000325_340)<<S32 ' JUMPV addrg
 alignl_label
C_sin013_696ddf71_hash_search_L000325_339
 word I16A_MOV + (r19)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sin013_696ddf71_hash_search_L000325_340
 alignl_label
C_sin013_696ddf71_hash_search_L000325_337
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r19)<<S16A ' SUBU (3)
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin013_696ddf71_hash_search_L000325_336)<<S32 ' GTU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sin013_696ddf71_hash_search_L000325_326
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sin014_696ddf71_binsearch_L000341 ' <symbol:binsearch>
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl_p1
 long I32_JMPA + (@C_sin014_696ddf71_binsearch_L000341_344)<<S32 ' JUMPV addrg
 alignl_label
C_sin014_696ddf71_binsearch_L000341_343
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' ADDU
 word I16A_ADD + (r22)<<D16A + (r2)<<S16A ' ADDU (3)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r23)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r4)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sin014_696ddf71_binsearch_L000341_346)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sin014_696ddf71_binsearch_L000341_347)<<S32 ' JUMPV addrg
 alignl_label
C_sin014_696ddf71_binsearch_L000341_346
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sin014_696ddf71_binsearch_L000341_347
 alignl_label
C_sin014_696ddf71_binsearch_L000341_344
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r3)<<S16A ' SUBU (3)
 word I16A_CMPI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sin014_696ddf71_binsearch_L000341_343)<<S32 ' GTU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
' C_sin014_696ddf71_binsearch_L000341_342 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaH_getn

 alignl_label
C_luaH__getn ' <symbol:luaH_getn>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getn_349)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getn_349)<<S32 ' NEI4 reg coni
 word I16A_CMPI + (r21)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BR_B + (@C_luaH__getn_351)<<S32 ' LTU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r22)<<D16A + (2)<<S16A ' SUBU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getn_351)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sin0f_696ddf71_ispow2realasize_L000097)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getn_353)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getn_353)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_luaH__getn_353
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r0)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_luaH__getn_348)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getn_351
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin014_696ddf71_binsearch_L000341)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sin0f_696ddf71_ispow2realasize_L000097)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getn_355)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaH__realasize)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_luaH__getn_355)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_luaH__getn_355
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_JMPA + (@C_luaH__getn_348)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getn_349
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getn_357)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r20)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getn_357)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getn_359)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__getn_348)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getn_359
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaH__realasize)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getn_361)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sin014_696ddf71_binsearch_L000341)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_JMPA + (@C_luaH__getn_348)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getn_361
 alignl_label
C_luaH__getn_357
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaH__getn_365)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__getint)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaH__getn_363)<<S32 ' NEI4 reg coni
 alignl_label
C_luaH__getn_365
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_luaH__getn_348)<<S32 ' JUMPV addrg
 alignl_label
C_luaH__getn_363
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sin013_696ddf71_hash_search_L000325)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaH__getn_348
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import luaV_flttointeger

' Catalina Import luaS_eqlngstr

' Catalina Import luaS_hashlongstr

' Catalina Import luaC_barrierback_

' Catalina Import luaC_newobj

' Catalina Import luaD_throw

' Catalina Import luaG_runerror

' Catalina Import luaM_malloc_

' Catalina Import luaM_free_

' Catalina Import luaM_realloc_

' Catalina Import luaO_ceillog2

' Catalina Import frexp

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_260_L000261 ' <symbol:260>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 105
 byte 115
 byte 32
 byte 78
 byte 97
 byte 78
 byte 0

 alignl_label
C_sin010_696ddf71_luaH__newkey_L000248_252_L000253 ' <symbol:252>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 32
 byte 105
 byte 115
 byte 32
 byte 110
 byte 105
 byte 108
 byte 0

 alignl_label
C_sin0q_696ddf71_setnodevector_L000187_194_L000195 ' <symbol:194>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl_label
C_sin0j_696ddf71_findindex_L000119_130_L000131 ' <symbol:130>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 107
 byte 101
 byte 121
 byte 32
 byte 116
 byte 111
 byte 32
 byte 39
 byte 110
 byte 101
 byte 120
 byte 116
 byte 39
 byte 0

 alignl_label
C_sin03_696ddf71_l_hashfloat_L000021_28_L000029 ' <symbol:28>
 long $cf000000 ' float

 alignl_label
C_sin03_696ddf71_l_hashfloat_L000021_23_L000024 ' <symbol:23>
 long $4f000000 ' float

' Catalina Code

DAT ' code segment
' end
