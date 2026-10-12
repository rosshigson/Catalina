' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export jsll_mul

 alignl_label
C_jsll_mul ' <symbol:jsll_mul>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fd0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r2)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r3)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_mul32)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r16)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_RDLONG + (r18)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r16)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r16)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r16)<<D16A + (r16)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r18)<<D16A + (r0)<<S16A ' ADDU (1)
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_jsll_mul_2 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export jsll_mul32

 alignl_label
C_jsll_mul32 ' <symbol:jsll_mul32>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A
 word I16A_SHRI + (r21)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $ffff ' reg <- con
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' BANDI/U
 word I16A_AND + (r19)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A
 word I16A_SHRI + (r17)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r15)<<D16A + (r2)<<S16A ' BANDI/U
 word I16A_AND + (r15)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r23)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_ADD + (r23)<<D16A + (r11)<<S16A ' ADDU (1)
 word I16A_CMP + (r23)<<D16A + (r11)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_mul32_4)<<S32 ' GEU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $10000 ' reg <- con
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_jsll_mul32_4
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $ffff ' reg <- con
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' BANDI/U
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_SHLI + (r20)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_AND + (r22)<<D16A + (r13)<<S16A ' BANDI/U (2)
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (2)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r18)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_jsll_mul32_3 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_seqk_6ac84e3e_norm_udivmod32_L000006 ' <symbol:norm_udivmod32>
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A
 word I16A_SHRI + (r17)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $ffff ' reg <- con
 word I16A_MOV + (r11)<<D16A + (r2)<<S16A ' BANDI/U
 word I16A_AND + (r11)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r23)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_SHRI + (r20)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r23)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_CMP + (r23)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_seqk_6ac84e3e_norm_udivmod32_L000006_8)<<S32 ' GEU4 reg reg
 word I16A_SUBI + (r15)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r23)<<D16A + (r2)<<S16A ' ADDU (1)
 word I16A_CMP + (r23)<<D16A + (r2)<<S16A
 alignl_p1
 long I32_BR_B + (@C_seqk_6ac84e3e_norm_udivmod32_L000006_10)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r23)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_seqk_6ac84e3e_norm_udivmod32_L000006_10)<<S32 ' GEU4 reg reg
 word I16A_SUBI + (r15)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r23)<<D16A + (r2)<<S16A ' ADDU (1)
 alignl_label
C_seqk_6ac84e3e_norm_udivmod32_L000006_10
 alignl_label
C_seqk_6ac84e3e_norm_udivmod32_L000006_8
 word I16A_SUB + (r23)<<D16A + (r21)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r19)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffff ' reg <- con
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r19)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_CMP + (r19)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_seqk_6ac84e3e_norm_udivmod32_L000006_12)<<S32 ' GEU4 reg reg
 word I16A_SUBI + (r13)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r19)<<D16A + (r2)<<S16A ' ADDU (1)
 word I16A_CMP + (r19)<<D16A + (r2)<<S16A
 alignl_p1
 long I32_BR_B + (@C_seqk_6ac84e3e_norm_udivmod32_L000006_14)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r19)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_seqk_6ac84e3e_norm_udivmod32_L000006_14)<<S32 ' GEU4 reg reg
 word I16A_SUBI + (r13)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_ADD + (r19)<<D16A + (r2)<<S16A ' ADDU (1)
 alignl_label
C_seqk_6ac84e3e_norm_udivmod32_L000006_14
 alignl_label
C_seqk_6ac84e3e_norm_udivmod32_L000006_12
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (16)<<S16A ' SHLU4 reg coni
 word I16A_OR + (r22)<<D16A + (r13)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r5)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r21)<<S16A ' SUBU (3)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNU4 reg reg
' C_seqk_6ac84e3e_norm_udivmod32_L000006_7 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016 ' <symbol:CountLeadingZeros>
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 alignl_p1
 long I32_MOVI + (r21)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHRI + (r22)<<D16A + (16)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_18)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (16)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_18
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHRI + (r22)<<D16A + (8)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_20)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (8)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_20
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHRI + (r22)<<D16A + (4)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_22)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (4)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_22
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHRI + (r22)<<D16A + (2)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_24)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (2)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_24
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHRI + (r22)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_26)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_26
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_28)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_28
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016_17 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export jsll_udivmod

 alignl_label
C_jsll_udivmod ' <symbol:jsll_udivmod>
 alignl_p1
 long I32_NEWF + 40<<S32
 alignl_p1
 long I32_PSHM + $ffa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udivmod_31)<<S32 ' NEU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_jsll_udivmod_33)<<S32 ' LEU4 reg reg
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_udivmod_35)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r18)<<D16A + (r22)<<S16A ' LSHI/U (1)
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r16)<<D16A + (r22)<<S16A ' SUBI/P (1)
 word I16B_TRN1 + (r16)<<D16B ' zero extend
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHR + RI<<D16A + (r16)<<S16A
 word I16A_MOV + (r16)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_OR + (r18)<<D16A + (r16)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_jsll_udivmod_35
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_seqk_6ac84e3e_norm_udivmod32_L000006)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_34)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_33
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udivmod_37)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_WRLONG + (r0)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 alignl_label
C_jsll_udivmod_37
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udivmod_39)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_40)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_39
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + RI<<D16A + (r20)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' RSHU
 word I16A_SHR + (r18)<<D16A + (r20)<<S16A ' RSHU (3)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_MOV + RI<<D16A + (r16)<<S16A
 word I16A_SHR + RI<<D16A + (r20)<<S16A
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r16)<<S16A ' LSHI/U
 word I16A_SHL + (r22)<<D16A + (r18)<<S16A ' LSHI/U (3)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_seqk_6ac84e3e_norm_udivmod32_L000006)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_label
C_jsll_udivmod_40
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_seqk_6ac84e3e_norm_udivmod32_L000006)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_label
C_jsll_udivmod_34
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_udivmod_32)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_32)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_31
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_jsll_udivmod_43)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_udivmod_44)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_44)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_43
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_seqk1_6ac84e3e_C_ountL_eadingZ_eros_L000016)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udivmod_47)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_jsll_udivmod_51)<<S32 ' GTU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_jsll_udivmod_49)<<S32 ' LTU4 reg reg
 alignl_label
C_jsll_udivmod_51
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_udivmod_53)<<S32 ' GEU4 reg reg
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_54)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_53
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_udivmod_54
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOV + (r18)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_50)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_49
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_jsll_udivmod_50
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_udivmod_48)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_48)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_47
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + RI<<D16A + (r18)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16A_RDLONG + (r18)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDBYTE + (r16)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r16)<<D16B ' zero extend
 word I16A_SHR + (r18)<<D16A + (r16)<<S16A ' RSHU (1)
 word I16A_OR + (r22)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' RSHU
 word I16A_SHR + (r18)<<D16A + (r20)<<S16A ' RSHU (3)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHL + (r22)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_MOV + RI<<D16A + (r16)<<S16A
 word I16A_SHR + RI<<D16A + (r20)<<S16A
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' RSHU (2)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r16)<<S16A ' LSHI/U
 word I16A_SHL + (r22)<<D16A + (r18)<<S16A ' LSHI/U (3)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-44)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_seqk_6ac84e3e_norm_udivmod32_L000006)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_RDLONG + (r2)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_mul32)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_jsll_udivmod_61)<<S32 ' GTU4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_jsll_udivmod_57)<<S32 ' NEU4 reg reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_jsll_udivmod_57)<<S32 ' LEU4 reg reg
 alignl_label
C_jsll_udivmod_61
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_udivmod_65)<<S32 ' GEU4 reg reg
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_66)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_65
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_udivmod_66
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_RDLONG + (r20)<<D16A + (r17)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C_jsll_udivmod_57
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_udivmod_67)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_udivmod_71)<<S32 ' GEU4 reg reg
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_udivmod_72)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_udivmod_71
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_udivmod_72
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_MOV + (r18)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r20)<<D16A + (r18)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_RDLONG + (r20)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHR + (r20)<<D16A + (r18)<<S16A ' RSHU (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHR + (r20)<<D16A + (r18)<<S16A ' RSHU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_jsll_udivmod_67
 alignl_label
C_jsll_udivmod_48
 alignl_label
C_jsll_udivmod_44
 alignl_label
C_jsll_udivmod_32
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_udivmod_73)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_jsll_udivmod_73
' C_jsll_udivmod_30 ' (symbol refcount = 0)
 word I16B_POPM + 10<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export jsll_div

 alignl_label
C_jsll_div ' <symbol:jsll_div>
 alignl_p1
 long I32_NEWF + 32<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_div_77)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_div_78)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_div_77
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_div_78
 word I16A_MOV + (r17)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_div_79)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_div_83)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_div_84)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_div_83
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_div_84
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_SUBS + (r22)<<D16A + (r13)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_jsll_div_80)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_div_79
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 alignl_label
C_jsll_div_80
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_div_85)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_XOR + (r17)<<D16A + (r22)<<S16A ' BXORI/U (1)
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_div_89)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_div_90)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_div_89
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_div_90
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_SUBS + (r22)<<D16A + (r13)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_jsll_div_86)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_div_85
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 alignl_label
C_jsll_div_86
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_jsll_udivmod)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_div_91)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_div_94)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_div_95)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_div_94
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_div_95
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' NEGI4
 word I16A_SUBS + (r20)<<D16A + (r13)<<S16A ' SUBI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_jsll_div_91
' C_jsll_div_75 ' (symbol refcount = 0)
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export jsll_mod

 alignl_label
C_jsll_mod ' <symbol:jsll_mod>
 alignl_p1
 long I32_NEWF + 32<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_mod_98)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_mod_99)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_mod_98
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_mod_99
 word I16A_MOV + (r17)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_mod_100)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_mod_104)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_mod_105)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_mod_104
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_mod_105
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_SUBS + (r22)<<D16A + (r13)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_jsll_mod_101)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_mod_100
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 alignl_label
C_jsll_mod_101
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_mod_106)<<S32 ' GEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_mod_110)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_mod_111)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_mod_110
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_mod_111
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_SUBS + (r22)<<D16A + (r13)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_jsll_mod_107)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_mod_106
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 alignl_label
C_jsll_mod_107
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_jsll_udivmod)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_CMPI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_mod_112)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_mod_115)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_jsll_mod_116)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_mod_115
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_jsll_mod_116
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' NEGI4
 word I16A_SUBS + (r20)<<D16A + (r13)<<S16A ' SUBI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_jsll_mod_112
' C_jsll_mod_96 ' (symbol refcount = 0)
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export jsll_shl

 alignl_label
C_jsll_shl ' <symbol:jsll_shl>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $554000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_shl_118)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (31)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_shl_120)<<S32 ' GEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_RDLONG + (r18)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r14)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r14)<<D16B ' zero extend
 word I16A_SUBS + (r16)<<D16A + (r14)<<S16A ' SUBI/P (1)
 word I16B_TRN1 + (r16)<<D16B ' zero extend
 word I16A_SHR + (r18)<<D16A + (r16)<<S16A ' RSHU (1)
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_shl_119)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_shl_120
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHL + (r20)<<D16A + (r18)<<S16A ' LSHI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_shl_119)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_shl_118
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 alignl_label
C_jsll_shl_119
' C_jsll_shl_117 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export jsll_shr

 alignl_label
C_jsll_shr ' <symbol:jsll_shr>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_shr_123)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (31)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_shr_125)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r18)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHR + (r20)<<D16A + (r18)<<S16A ' RSHU (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SAR + (r20)<<D16A + (r18)<<S16A ' RSHI (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_shr_124)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_shr_125
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SAR + (r22)<<D16A + (r20)<<S16A ' RSHI (1)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_SARI + (r20)<<D16A + (31)<<S16A ' SHRI4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_shr_124)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_shr_123
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 alignl_label
C_jsll_shr_124
' C_jsll_shr_122 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export jsll_ushr

 alignl_label
C_jsll_ushr ' <symbol:jsll_ushr>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_jsll_ushr_128)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (31)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_jsll_ushr_130)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r18)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHR + (r20)<<D16A + (r18)<<S16A ' RSHU (1)
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r18)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SHR + (r20)<<D16A + (r18)<<S16A ' RSHU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_ushr_129)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_ushr_130
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHR + (r22)<<D16A + (r20)<<S16A ' RSHU (1)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_jsll_ushr_129)<<S32 ' JUMPV addrg
 alignl_label
C_jsll_ushr_128
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r1)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 alignl_label
C_jsll_ushr_129
' C_jsll_ushr_127 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export rhll_real_cmp

 alignl_label
C_rhll_real_cmp ' <symbol:rhll_real_cmp>
 alignl_p1
 long I32_PSHM + $ff8000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_133)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (60)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_cmp_138)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (62)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_cmp_143)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_134)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_138
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r16)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r18)<<D16A + (r16)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rhll_real_cmp_142)<<S32 ' LTI4 reg reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_140)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_rhll_real_cmp_140)<<S32 ' GEI4 reg reg
 alignl_label
C_rhll_real_cmp_142
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_141)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_140
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_cmp_141
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_132)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_143
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r16)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r18)<<D16A + (r16)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rhll_real_cmp_147)<<S32 ' GTI4 reg reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_145)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_rhll_real_cmp_145)<<S32 ' LEI4 reg reg
 alignl_label
C_rhll_real_cmp_147
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_146)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_145
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_cmp_146
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_132)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_133
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_148)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (33)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_cmp_153)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (33)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_rhll_real_cmp_151)<<S32 ' LTI4 reg coni
' C_rhll_real_cmp_172 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (60)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_cmp_162)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_cmp_158)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (62)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_cmp_167)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_151)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_153
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_157)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_cmp_155)<<S32 ' EQU4 reg reg
 alignl_label
C_rhll_real_cmp_157
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_156)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_155
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_cmp_156
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_132)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_158
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_160)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_160)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_161)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_160
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_cmp_161
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_132)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_162
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r16)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r18)<<D16A + (r16)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rhll_real_cmp_166)<<S32 ' LTI4 reg reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_164)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rhll_real_cmp_164)<<S32 ' GTI4 reg reg
 alignl_label
C_rhll_real_cmp_166
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_165)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_164
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_cmp_165
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_132)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_167
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r16)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPS + (r18)<<D16A + (r16)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rhll_real_cmp_171)<<S32 ' GTI4 reg reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_cmp_169)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rhll_real_cmp_169)<<S32 ' LTI4 reg reg
 alignl_label
C_rhll_real_cmp_171
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_170)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_169
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_cmp_170
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_cmp_132)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_cmp_151
 alignl_label
C_rhll_real_cmp_148
 alignl_label
C_rhll_real_cmp_134
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_rhll_real_cmp_132
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export rhll_real_ucmp

 alignl_label
C_rhll_real_ucmp ' <symbol:rhll_real_ucmp>
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_174)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (60)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_ucmp_179)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (62)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_ucmp_184)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_175)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_179
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rhll_real_ucmp_183)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_181)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_rhll_real_ucmp_181)<<S32 ' GEU4 reg reg
 alignl_label
C_rhll_real_ucmp_183
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_182)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_181
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_ucmp_182
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_173)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_184
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rhll_real_ucmp_188)<<S32 ' GTU4 reg reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_186)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_rhll_real_ucmp_186)<<S32 ' LEU4 reg reg
 alignl_label
C_rhll_real_ucmp_188
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_187)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_186
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_ucmp_187
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_173)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_174
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_189)<<S32 ' NEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (33)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_ucmp_194)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (33)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_rhll_real_ucmp_192)<<S32 ' LTI4 reg coni
' C_rhll_real_ucmp_213 ' (symbol refcount = 0)
 alignl_p1
 long I32_MOVI + RI<<D32 + (60)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_ucmp_203)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (61)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_ucmp_199)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (62)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_ucmp_208)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_192)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_194
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_198)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_rhll_real_ucmp_196)<<S32 ' EQU4 reg reg
 alignl_label
C_rhll_real_ucmp_198
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_197)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_196
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_ucmp_197
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_173)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_199
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_201)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_201)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_202)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_201
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_ucmp_202
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_173)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_203
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rhll_real_ucmp_207)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_205)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rhll_real_ucmp_205)<<S32 ' GTU4 reg reg
 alignl_label
C_rhll_real_ucmp_207
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_206)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_205
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_ucmp_206
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_173)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_208
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_rhll_real_ucmp_212)<<S32 ' GTU4 reg reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_rhll_real_ucmp_210)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_rhll_real_ucmp_210)<<S32 ' LTU4 reg reg
 alignl_label
C_rhll_real_ucmp_212
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_211)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_210
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_rhll_real_ucmp_211
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_rhll_real_ucmp_173)<<S32 ' JUMPV addrg
 alignl_label
C_rhll_real_ucmp_192
 alignl_label
C_rhll_real_ucmp_189
 alignl_label
C_rhll_real_ucmp_175
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_rhll_real_ucmp_173
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
