' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_shcs_686cc504_cb64_L000003 ' <symbol:cb64>
 byte 65
 byte 66
 byte 67
 byte 68
 byte 69
 byte 70
 byte 71
 byte 72
 byte 73
 byte 74
 byte 75
 byte 76
 byte 77
 byte 78
 byte 79
 byte 80
 byte 81
 byte 82
 byte 83
 byte 84
 byte 85
 byte 86
 byte 87
 byte 88
 byte 89
 byte 90
 byte 97
 byte 98
 byte 99
 byte 100
 byte 101
 byte 102
 byte 103
 byte 104
 byte 105
 byte 106
 byte 107
 byte 108
 byte 109
 byte 110
 byte 111
 byte 112
 byte 113
 byte 114
 byte 115
 byte 116
 byte 117
 byte 118
 byte 119
 byte 120
 byte 121
 byte 122
 byte 48
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 43
 byte 47
 byte 0

 alignl_label
C_shcs1_686cc504_cd64_L000004 ' <symbol:cd64>
 byte 124
 byte 36
 byte 36
 byte 36
 byte 125
 byte 114
 byte 115
 byte 116
 byte 117
 byte 118
 byte 119
 byte 120
 byte 121
 byte 122
 byte 123
 byte 36
 byte 36
 byte 36
 byte 36
 byte 36
 byte 36
 byte 36
 byte 62
 byte 63
 byte 64
 byte 65
 byte 66
 byte 67
 byte 68
 byte 69
 byte 70
 byte 71
 byte 72
 byte 73
 byte 74
 byte 75
 byte 76
 byte 77
 byte 78
 byte 79
 byte 80
 byte 81
 byte 82
 byte 83
 byte 84
 byte 85
 byte 86
 byte 87
 byte 36
 byte 36
 byte 36
 byte 36
 byte 36
 byte 36
 byte 88
 byte 89
 byte 90
 byte 91
 byte 92
 byte 93
 byte 94
 byte 95
 byte 96
 byte 97
 byte 98
 byte 99
 byte 100
 byte 101
 byte 102
 byte 103
 byte 104
 byte 105
 byte 106
 byte 107
 byte 108
 byte 109
 byte 110
 byte 111
 byte 112
 byte 113
 byte 0

' Catalina Code

DAT ' code segment

 alignl_label
C_shcs2_686cc504_encodeblock_L000005 ' <symbol:encodeblock>
 alignl_p1
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_RDBYTE + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SARI + (r22)<<D16A + (2)<<S16A ' SHRI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_shcs_686cc504_cb64_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r3)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r4)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r20)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((240)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_SARI + (r18)<<D16A + (4)<<S16A ' SHRI4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long @C_shcs_686cc504_cb64_L000003 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r2)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRBE + (@C_shcs2_686cc504_encodeblock_L000005_8)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_SARI + (r20)<<D16A + (6)<<S16A ' SHRI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_shcs_686cc504_cb64_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_shcs2_686cc504_encodeblock_L000005_9)<<S32 ' JUMPV addrg
 alignl_label
C_shcs2_686cc504_encodeblock_L000005_8
 alignl_p1
 long I32_LODS + (r23)<<D32S + ((61)&$7FFFF)<<S32 ' reg <- cons
 alignl_label
C_shcs2_686cc504_encodeblock_L000005_9
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r2)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRBE + (@C_shcs2_686cc504_encodeblock_L000005_11)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_shcs_686cc504_cb64_L000003 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r21)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_shcs2_686cc504_encodeblock_L000005_12)<<S32 ' JUMPV addrg
 alignl_label
C_shcs2_686cc504_encodeblock_L000005_11
 alignl_p1
 long I32_LODS + (r21)<<D32S + ((61)&$7FFFF)<<S32 ' reg <- cons
 alignl_label
C_shcs2_686cc504_encodeblock_L000005_12
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (3)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_shcs2_686cc504_encodeblock_L000005_6 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export encode_buff

 alignl_label
C_encode_buff ' <symbol:encode_buff>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $faae00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_encode_buff_14)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r17)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 alignl_p1
 long I32_JMPA + (@C_encode_buff_15)<<S32 ' JUMPV addrg
 alignl_label
C_encode_buff_14
 word I16A_CMPSI + (r17)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRAE + (@C_encode_buff_16)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (4)<<S16A ' reg <- coni
 alignl_label
C_encode_buff_16
 alignl_label
C_encode_buff_15
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_encode_buff_19)<<S32 ' JUMPV addrg
 alignl_label
C_encode_buff_18
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_encode_buff_21
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r20)<<D16A + (r13)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_CMPS + (r13)<<D16A + (r23)<<S16A
 alignl_p1
 long I32_BRAE + (@C_encode_buff_25)<<S32 ' GEI4 reg reg
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_encode_buff_26)<<S32 ' JUMPV addrg
 alignl_label
C_encode_buff_25
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_encode_buff_26
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_encode_buff_22 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BR_B + (@C_encode_buff_21)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_encode_buff_27)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_shcs2_686cc504_encodeblock_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_encode_buff_29
 word I16A_CMPS + (r11)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRAE + (@C_encode_buff_33)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_encode_buff_34)<<S32 ' JUMPV addrg
 alignl_label
C_encode_buff_33
 word I16A_NEGI + (r11)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_encode_buff_31)<<S32 ' JUMPV addrg
 alignl_label
C_encode_buff_34
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_encode_buff_30 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_encode_buff_29)<<S32 ' LTI4 reg coni
 alignl_label
C_encode_buff_31
 word I16A_ADDSI + (r9)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_encode_buff_27
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPS + (r9)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_encode_buff_37)<<S32 ' GEI4 reg reg
 word I16A_CMPS + (r13)<<D16A + (r23)<<S16A
 alignl_p1
 long I32_BR_B + (@C_encode_buff_35)<<S32 ' LTI4 reg reg
 alignl_label
C_encode_buff_37
 word I16A_CMPSI + (r9)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_encode_buff_38)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_encode_buff_38
 word I16A_MOVI + (r9)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_encode_buff_35
 alignl_label
C_encode_buff_19
 word I16A_CMPS + (r13)<<D16A + (r23)<<S16A
 alignl_p1
 long I32_BR_B + (@C_encode_buff_18)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
' C_encode_buff_13 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_shcs3_686cc504_decodeblock_L000040 ' <symbol:decodeblock>
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SARI + (r20)<<D16A + (4)<<S16A ' SHRI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r22)<<D16A + (r2)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r18)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_SARI + (r18)<<D16A + (2)<<S16A ' SHRI4 reg coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (6)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r18)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (3)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_shcs3_686cc504_decodeblock_L000040_41 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export decode_buff

 alignl_label
C_decode_buff ' <symbol:decode_buff>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $faaf80<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_decode_buff_44)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_43
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_decode_buff_49)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_46
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_decode_buff_51)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_50
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r15)<<D16B ' zero extend
 word I16A_CMPS + (r13)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_decode_buff_53)<<S32 ' GEI4 reg reg
 alignl_p1
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_decode_buff_59)<<S32 ' LTI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (122)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRBE + (@C_decode_buff_57)<<S32 ' LEI4 reg coni
 alignl_label
C_decode_buff_59
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_decode_buff_58)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_57
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_shcs1_686cc504_cd64_L000004-43 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r8)<<D16B ' zero extend
 alignl_label
C_decode_buff_58
 word I16A_MOV + (r15)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_decode_buff_60)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (36)<<S32
 word I16A_CMPS + (r15)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_decode_buff_63)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r7)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_decode_buff_64)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_63
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((61)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r7)<<D16A + (r15)<<S16A ' SUBI/P
 word I16A_SUBS + (r7)<<D16A + (r22)<<S16A ' SUBI/P (3)
 alignl_label
C_decode_buff_64
 word I16A_MOV + (r15)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_decode_buff_60
 alignl_label
C_decode_buff_53
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_decode_buff_51
 word I16A_CMPS + (r13)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_decode_buff_65)<<S32 ' GEI4 reg reg
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_decode_buff_50)<<S32 ' EQI4 reg coni
 alignl_label
C_decode_buff_65
 word I16A_CMPS + (r13)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_decode_buff_66)<<S32 ' GEI4 reg reg
 word I16A_ADDSI + (r9)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_decode_buff_67)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_SUBSI + (r20)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_decode_buff_67)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_66
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r11)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_decode_buff_67
' C_decode_buff_47 ' (symbol refcount = 0)
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_decode_buff_49
 word I16A_CMPSI + (r11)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRAE + (@C_decode_buff_70)<<S32 ' GEI4 reg coni
 word I16A_CMPS + (r13)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_B + (@C_decode_buff_46)<<S32 ' LTI4 reg reg
 alignl_label
C_decode_buff_70
 word I16A_CMPSI + (r9)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_decode_buff_71)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_shcs3_686cc504_decodeblock_L000040)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_decode_buff_76)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_73
 word I16A_CMPS + (r10)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BRAE + (@C_decode_buff_77)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r11)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_decode_buff_78)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_77
 word I16A_NEGI + (r10)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_decode_buff_75)<<S32 ' JUMPV addrg
 alignl_label
C_decode_buff_78
 word I16A_ADDSI + (r10)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_decode_buff_74 ' (symbol refcount = 0)
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_decode_buff_76
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPS + (r11)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_decode_buff_73)<<S32 ' LTI4 reg reg
 alignl_label
C_decode_buff_75
 alignl_label
C_decode_buff_71
 alignl_label
C_decode_buff_44
 word I16A_CMPS + (r13)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_B + (@C_decode_buff_43)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
' C_decode_buff_42 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
