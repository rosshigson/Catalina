' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sd2k_67e34556_cb64_L000003 ' <symbol:cb64>
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

 alignl ' align long
C_sd2k1_67e34556_cd64_L000004 ' <symbol:cd64>
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

 alignl ' align long
C_sd2k2_67e34556_encodeblock_L000005 ' <symbol:encodeblock>
 jmp #PSHM
 long $f50000 ' save registers
 rdbyte r22, r4 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 sar r22, #2 ' RSHI4 coni
 jmp #LODL
 long @C_sd2k_67e34556_cb64_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r3 ' ASGNU1 reg reg
 mov r22, #4 ' reg <- coni
 mov r20, r3
 adds r20, #1 ' ADDP4 coni
 rdbyte r18, r4 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #3 ' BANDI4 coni
 shl r18, #4 ' LSHI4 coni
 mov r16, r4
 adds r16, #1 ' ADDP4 coni
 rdbyte r16, r16 ' reg <- INDIRU1 reg
 and r16, cviu_m1 ' zero extend
 and r16, #240 ' BANDI4 coni
 mov RI, r16
 sar RI, r22
 mov r22, RI ' RSHI (2)
 or r22, r18 ' BORI/U (2)
 jmp #LODL
 long @C_sd2k_67e34556_cb64_L000003
 mov r18, RI ' reg <- addrg
 adds r22, r18 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r20 ' ASGNU1 reg reg
 cmps r2,  #1 wcz
 jmp #BRBE
 long @C_sd2k2_67e34556_encodeblock_L000005_8 ' LEI4
 mov r22, r4
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r4
 adds r20, #2 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #192 ' BANDI4 coni
 sar r20, #6 ' RSHI4 coni
 or r22, r20 ' BORI/U (1)
 jmp #LODL
 long @C_sd2k_67e34556_cb64_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r23, r22 ' CVUI
 and r23, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_sd2k2_67e34556_encodeblock_L000005_9 ' JUMPV addrg
C_sd2k2_67e34556_encodeblock_L000005_8
 mov r23, #61 ' reg <- coni
C_sd2k2_67e34556_encodeblock_L000005_9
 mov r22, r3
 adds r22, #2 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r2,  #2 wcz
 jmp #BRBE
 long @C_sd2k2_67e34556_encodeblock_L000005_11 ' LEI4
 mov r22, r4
 adds r22, #2 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #63 ' BANDI4 coni
 jmp #LODL
 long @C_sd2k_67e34556_cb64_L000003
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r21, r22 ' CVUI
 and r21, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_sd2k2_67e34556_encodeblock_L000005_12 ' JUMPV addrg
C_sd2k2_67e34556_encodeblock_L000005_11
 mov r21, #61 ' reg <- coni
C_sd2k2_67e34556_encodeblock_L000005_12
 mov r22, r3
 adds r22, #3 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sd2k2_67e34556_encodeblock_L000005_6 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export encode_buff

 alignl ' align long
C_encode_buff ' <symbol:encode_buff>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r7, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_encode_buff_14 ' NEI4
 mov r17, #72 ' reg <- coni
 jmp #JMPA
 long @C_encode_buff_15 ' JUMPV addrg
C_encode_buff_14
 cmps r17,  #4 wcz
 jmp #BRAE
 long @C_encode_buff_16 ' GEI4
 mov r17, #4 ' reg <- coni
C_encode_buff_16
C_encode_buff_15
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODF
 long -12
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #JMPA
 long @C_encode_buff_19 ' JUMPV addrg
C_encode_buff_18
 mov r22, #0 ' reg <- coni
 mov r9, r22 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_encode_buff_21
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 adds r22, r15 ' ADDI/P (2)
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r13 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r13, r23 wcz
 jmp #BRAE
 long @C_encode_buff_25 ' GEI4
 adds r9, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_encode_buff_26 ' JUMPV addrg
C_encode_buff_25
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 adds r22, r15 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_encode_buff_26
 adds r13, #1 ' ADDI4 coni
' C_encode_buff_22 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #3 wcz
 jmp #BR_B
 long @C_encode_buff_21 ' LTI4
 cmps r9,  #0 wcz
 jmp #BRBE
 long @C_encode_buff_27 ' LEI4
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sd2k2_67e34556_encodeblock_L000005
 add SP, #8 ' CALL addrg
 mov r15, #0 ' reg <- coni
C_encode_buff_29
 cmps r11, r19 wcz
 jmp #BRAE
 long @C_encode_buff_33 ' GEI4
 mov r22, r11 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 adds r20, r15 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_encode_buff_34 ' JUMPV addrg
C_encode_buff_33
 jmp #LODL
 long -1
 mov r11, RI ' reg <- con
 jmp #JMPA
 long @C_encode_buff_31 ' JUMPV addrg
C_encode_buff_34
 adds r11, #1 ' ADDI4 coni
' C_encode_buff_30 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
 cmps r15,  #4 wcz
 jmp #BR_B
 long @C_encode_buff_29 ' LTI4
C_encode_buff_31
 adds r7, #1 ' ADDI4 coni
C_encode_buff_27
 mov r22, #4 ' reg <- coni
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r7, r0 wcz
 jmp #BRAE
 long @C_encode_buff_37 ' GEI4
 cmps r13, r23 wcz
 jmp #BR_B
 long @C_encode_buff_35 ' LTI4
C_encode_buff_37
 cmps r7,  #0 wcz
 jmp #BRBE
 long @C_encode_buff_38 ' LEI4
 mov r22, r11 ' CVI, CVU or LOAD
 mov r11, r22
 adds r11, #1 ' ADDI4 coni
 adds r22, r21 ' ADDI/P (1)
 mov r20, #10 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_encode_buff_38
 mov r7, #0 ' reg <- coni
C_encode_buff_35
C_encode_buff_19
 cmps r13, r23 wcz
 jmp #BR_B
 long @C_encode_buff_18 ' LTI4
 mov r0, r11 ' CVI, CVU or LOAD
' C_encode_buff_13 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sd2k3_67e34556_decodeblock_L000040 ' <symbol:decodeblock>
 jmp #PSHM
 long $550000 ' save registers
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #2 ' LSHI4 coni
 mov r20, r3
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 sar r20, #4 ' RSHI4 coni
 or r22, r20 ' BORI/U (1)
 wrbyte r22, r2 ' ASGNU1 reg reg
 mov r22, #2 ' reg <- coni
 mov r20, r2
 adds r20, #1 ' ADDP4 coni
 mov r18, r3
 adds r18, #1 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #4 ' LSHI4 coni
 mov r16, r3
 adds r16, #2 ' ADDP4 coni
 rdbyte r16, r16 ' reg <- INDIRU1 reg
 and r16, cviu_m1 ' zero extend
 mov RI, r16
 sar RI, r22
 mov r22, RI ' RSHI (2)
 or r22, r18 ' BORI/U (2)
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #2 ' ADDP4 coni
 mov r20, r3
 adds r20, #2 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #6 ' LSHI4 coni
 and r20, #192 ' BANDI4 coni
 mov r18, r3
 adds r18, #3 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_sd2k3_67e34556_decodeblock_L000040_41 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export decode_buff

 alignl ' align long
C_decode_buff ' <symbol:decode_buff>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, #0 ' reg <- coni
 mov r9, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #LODF
 long -12
 wrbyte r22, RI ' ASGNU1 addrl reg
 jmp #JMPA
 long @C_decode_buff_44 ' JUMPV addrg
C_decode_buff_43
 mov r22, #0 ' reg <- coni
 mov r7, r22 ' CVI, CVU or LOAD
 mov r11, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_decode_buff_49 ' JUMPV addrg
C_decode_buff_46
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_decode_buff_51 ' JUMPV addrg
C_decode_buff_50
 mov r22, r13 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 cmps r13, r21 wcz
 jmp #BRAE
 long @C_decode_buff_53 ' GEI4
 cmps r15,  #43 wcz
 jmp #BR_B
 long @C_decode_buff_59 ' LTI4
 cmps r15,  #122 wcz
 jmp #BRBE
 long @C_decode_buff_57 ' LEI4
C_decode_buff_59
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_decode_buff_58 ' JUMPV addrg
C_decode_buff_57
 jmp #LODL
 long @C_sd2k1_67e34556_cd64_L000004-43
 mov r22, RI ' reg <- addrg
 adds r22, r15 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
C_decode_buff_58
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRI4 reg
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_decode_buff_60 ' EQI4
 cmps r15,  #36 wz
 jmp #BRNZ
 long @C_decode_buff_63 ' NEI4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_decode_buff_64 ' JUMPV addrg
C_decode_buff_63
 mov r22, r15
 subs r22, #61 ' SUBI4 coni
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
C_decode_buff_64
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRI4 reg
C_decode_buff_60
C_decode_buff_53
 adds r13, #1 ' ADDI4 coni
C_decode_buff_51
 cmps r13, r21 wcz
 jmp #BRAE
 long @C_decode_buff_65 ' GEI4
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_decode_buff_50 ' EQI4
C_decode_buff_65
 cmps r13, r21 wcz
 jmp #BRAE
 long @C_decode_buff_66 ' GEI4
 adds r7, #1 ' ADDI4 coni
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_decode_buff_67 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 adds r22, r11 ' ADDI/P (2)
 mov r20, r15
 subs r20, #1 ' SUBI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_decode_buff_67 ' JUMPV addrg
C_decode_buff_66
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 adds r22, r11 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_decode_buff_67
' C_decode_buff_47 ' (symbol refcount = 0)
 adds r11, #1 ' ADDI4 coni
C_decode_buff_49
 cmps r11,  #4 wcz
 jmp #BRAE
 long @C_decode_buff_70 ' GEI4
 cmps r13, r21 wcz
 jmp #BR_B
 long @C_decode_buff_46 ' LTI4
C_decode_buff_70
 cmps r7,  #0 wcz
 jmp #BRBE
 long @C_decode_buff_71 ' LEI4
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sd2k3_67e34556_decodeblock_L000040
 add SP, #4 ' CALL addrg
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_decode_buff_76 ' JUMPV addrg
C_decode_buff_73
 cmps r9, r17 wcz
 jmp #BRAE
 long @C_decode_buff_77 ' GEI4
 mov r22, r9 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 adds r20, r11 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_decode_buff_78 ' JUMPV addrg
C_decode_buff_77
 jmp #LODL
 long -1
 mov r9, RI ' reg <- con
 jmp #JMPA
 long @C_decode_buff_75 ' JUMPV addrg
C_decode_buff_78
 adds r9, #1 ' ADDI4 coni
' C_decode_buff_74 ' (symbol refcount = 0)
 adds r11, #1 ' ADDI4 coni
C_decode_buff_76
 mov r22, r7
 subs r22, #1 ' SUBI4 coni
 cmps r11, r22 wcz
 jmp #BR_B
 long @C_decode_buff_73 ' LTI4
C_decode_buff_75
C_decode_buff_71
C_decode_buff_44
 cmps r13, r21 wcz
 jmp #BR_B
 long @C_decode_buff_43 ' LTI4
 mov r0, r9 ' CVI, CVU or LOAD
' C_decode_buff_42 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF

' end
