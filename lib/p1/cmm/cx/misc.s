' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sghg_67e4d8a9_ntstr_L000003 ' <symbol:ntstr>
 byte 71
 byte 77
 byte 84
 byte 0
 byte 0[7]

 alignl ' align long
C_sghg1_67e4d8a9_dststr_L000004 ' <symbol:dststr>
 byte 71
 byte 68
 byte 84
 byte 0
 byte 0[7]

' Catalina Export _timezone

 alignl ' align long
C__timezone ' <symbol:_timezone>
 long 0

' Catalina Export _dst_off

 alignl ' align long
C__dst_off ' <symbol:_dst_off>
 long 3600

' Catalina Export _daylight

 alignl ' align long
C__daylight ' <symbol:_daylight>
 long 0

' Catalina Export _tzname

 alignl ' align long
C__tzname ' <symbol:_tzname>
 long @C_sghg_67e4d8a9_ntstr_L000003
 long @C_sghg1_67e4d8a9_dststr_L000004

' Catalina Export tzname

 alignl ' align long
C_tzname ' <symbol:tzname>
 long @C_sghg_67e4d8a9_ntstr_L000003
 long @C_sghg1_67e4d8a9_dststr_L000004

 alignl ' align long
C_sghg2_67e4d8a9_dststart_L000005 ' <symbol:dststart>
 byte $55
 byte 0[3]
 long 0
 long 0
 long 0
 long 7200

 alignl ' align long
C_sghg3_67e4d8a9_dstend_L000006 ' <symbol:dstend>
 byte $55
 byte 0[3]
 long 0
 long 0
 long 0
 long 7200

' Catalina Export _days

 alignl ' align long
C__days ' <symbol:_days>
 long @C_sghg4_67e4d8a9_7_L000008
 long @C_sghg5_67e4d8a9_9_L000010
 long @C_sghg6_67e4d8a9_11_L000012
 long @C_sghg7_67e4d8a9_13_L000014
 long @C_sghg8_67e4d8a9_15_L000016
 long @C_sghg9_67e4d8a9_17_L000018
 long @C_sghga_67e4d8a9_19_L000020

' Catalina Export _months

 alignl ' align long
C__months ' <symbol:_months>
 long @C_sghgb_67e4d8a9_21_L000022
 long @C_sghgc_67e4d8a9_23_L000024
 long @C_sghgd_67e4d8a9_25_L000026
 long @C_sghge_67e4d8a9_27_L000028
 long @C_sghgf_67e4d8a9_29_L000030
 long @C_sghgg_67e4d8a9_31_L000032
 long @C_sghgh_67e4d8a9_33_L000034
 long @C_sghgi_67e4d8a9_35_L000036
 long @C_sghgj_67e4d8a9_37_L000038
 long @C_sghgk_67e4d8a9_39_L000040
 long @C_sghgl_67e4d8a9_41_L000042
 long @C_sghgm_67e4d8a9_43_L000044

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045 ' <symbol:parseZoneName>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_RDBYTE + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_50)<<S32 ' NEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_46)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_49
 word I16A_CMPSI + (r23)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_52)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_52
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_50
 word I16A_RDBYTE + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_57)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r20)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_57)<<S32 ' LTU4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (44)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_57)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_57)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_49)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_57
 word I16A_CMPSI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_58)<<S32 ' GEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_46)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_58
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r3)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045_46
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060 ' <symbol:parseTime>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgo_67e4d8a9_parseT_ime_L000060_63)<<S32 ' EQU4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_64)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_63
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_64
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgo_67e4d8a9_parseT_ime_L000060_65)<<S32 ' EQU4 reg coni
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(85)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r22)<<D16A + (r2)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_65
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_68)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_67
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_68
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_70)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgo_67e4d8a9_parseT_ime_L000060_67)<<S32 ' LEI4 reg coni
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_70
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgo_67e4d8a9_parseT_ime_L000060_71)<<S32 ' NEU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_71
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_75)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (24)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_73)<<S32 ' LTI4 reg coni
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_75
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_73
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (1)
 word I16B_MULT ' MULT(I/U)
 word I16A_WRLONG + (r0)<<D16A + (r4)<<S16A ' ASGNI4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgo_67e4d8a9_parseT_ime_L000060_76)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_79)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_78
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_79
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_81)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgo_67e4d8a9_parseT_ime_L000060_78)<<S32 ' LEI4 reg coni
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_81
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgo_67e4d8a9_parseT_ime_L000060_82)<<S32 ' NEU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_82
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_86)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (60)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_84)<<S32 ' LTI4 reg coni
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_86
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_84
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNI4 reg reg
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgo_67e4d8a9_parseT_ime_L000060_87)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_90)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_89
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_90
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_92)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgo_67e4d8a9_parseT_ime_L000060_89)<<S32 ' LEI4 reg coni
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_92
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgo_67e4d8a9_parseT_ime_L000060_93)<<S32 ' NEU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_93
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_97)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (60)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgo_67e4d8a9_parseT_ime_L000060_95)<<S32 ' LTI4 reg coni
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_97
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgo_67e4d8a9_parseT_ime_L000060_61)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_95
 word I16A_RDLONG + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r22)<<D16A + (r4)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_87
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_76
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgo_67e4d8a9_parseT_ime_L000060_98)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_WRBYTE + (r22)<<D16A + (r2)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r4)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_98
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sghgo_67e4d8a9_parseT_ime_L000060_61
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_102_L000103 ' <symbol:102>
 long 1
 long 12
 long 1
 long 5
 long 0
 long 6

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100 ' <symbol:parseDate>
 alignl ' align long
 long I32_NEWF + 24<<S32
 alignl ' align long
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODL + (r1)<<D16B
 alignl ' align long
 long @C_sghgp_67e4d8a9_parseD_ate_L000100_102_L000103 ' reg <- addrg
 alignl ' align long
 long I32_CPYB + 24<<S32 ' ASGNB
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (77)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgp_67e4d8a9_parseD_ate_L000100_104)<<S32 ' EQI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (74)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgp_67e4d8a9_parseD_ate_L000100_106)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_MOVI + (r17)<<D32 +(74)<<S32 ' reg <- conli
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_107)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_106
 alignl ' align long
 long I32_MOVI + (r17)<<D32 +(90)<<S32 ' reg <- conli
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_107
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_109)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_108
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r21)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r20)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_109
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgp_67e4d8a9_parseD_ate_L000100_111)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgp_67e4d8a9_parseD_ate_L000100_108)<<S32 ' LEI4 reg coni
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_111
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgp_67e4d8a9_parseD_ate_L000100_112)<<S32 ' NEU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_101)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_112
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (74)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgp_67e4d8a9_parseD_ate_L000100_118)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_119)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_118
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_119
 word I16A_CMPS + (r21)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgp_67e4d8a9_parseD_ate_L000100_117)<<S32 ' LTI4 reg reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (365)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgp_67e4d8a9_parseD_ate_L000100_114)<<S32 ' LEI4 reg coni
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_117
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_101)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_114
 word I16A_WRBYTE + (r17)<<D16A + (r2)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_101)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_104
 alignl ' align long
 long I32_MOVI + (r17)<<D32 +(77)<<S32 ' reg <- conli
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_120
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_124)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_123
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r21)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r20)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_124
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (48)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgp_67e4d8a9_parseD_ate_L000100_126)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (57)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgp_67e4d8a9_parseD_ate_L000100_123)<<S32 ' LEI4 reg coni
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_126
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgp_67e4d8a9_parseD_ate_L000100_127)<<S32 ' NEU4 reg reg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_101)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_127
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r21)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghgp_67e4d8a9_parseD_ate_L000100_132)<<S32 ' LTI4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgp_67e4d8a9_parseD_ate_L000100_129)<<S32 ' LEI4 reg reg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_132
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_101)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_129
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_sghgp_67e4d8a9_parseD_ate_L000100_121 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sghgp_67e4d8a9_parseD_ate_L000100_133)<<S32 ' GEI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (46)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgp_67e4d8a9_parseD_ate_L000100_120)<<S32 ' EQI4 reg coni
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_133
 word I16A_CMPSI + (r19)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgp_67e4d8a9_parseD_ate_L000100_134)<<S32 ' EQI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgp_67e4d8a9_parseD_ate_L000100_101)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_134
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r22)<<D16A + (r4)<<S16A ' ASGNU1 reg reg
 word I16A_WRBYTE + (r17)<<D16A + (r2)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sghgp_67e4d8a9_parseD_ate_L000100_101
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136 ' <symbol:parseRule>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sghg2_67e4d8a9_dststart_L000005 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sghgp_67e4d8a9_parseD_ate_L000100)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgr_67e4d8a9_parseR_ule_L000136_138)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgr_67e4d8a9_parseR_ule_L000136_137)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_138
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_ADDS + (r23)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (47)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgr_67e4d8a9_parseR_ule_L000136_140)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sghg2_67e4d8a9_dststart_L000005 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sghgo_67e4d8a9_parseT_ime_L000060)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgr_67e4d8a9_parseR_ule_L000136_145)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgr_67e4d8a9_parseR_ule_L000136_137)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_144
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_145
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgr_67e4d8a9_parseR_ule_L000136_144)<<S32 ' NEU4 reg reg
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_140
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (44)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgr_67e4d8a9_parseR_ule_L000136_147)<<S32 ' EQI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgr_67e4d8a9_parseR_ule_L000136_137)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_147
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sghg3_67e4d8a9_dstend_L000006 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sghgp_67e4d8a9_parseD_ate_L000100)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgr_67e4d8a9_parseR_ule_L000136_149)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgr_67e4d8a9_parseR_ule_L000136_137)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_149
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_ADDS + (r23)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (47)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgr_67e4d8a9_parseR_ule_L000136_151)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sghg3_67e4d8a9_dstend_L000006 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sghgo_67e4d8a9_parseT_ime_L000060)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgr_67e4d8a9_parseR_ule_L000136_156)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgr_67e4d8a9_parseR_ule_L000136_137)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_155
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_156
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgr_67e4d8a9_parseR_ule_L000136_155)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_151
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgr_67e4d8a9_parseR_ule_L000136_158)<<S32 ' EQI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_sghgr_67e4d8a9_parseR_ule_L000136_137)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_158
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sghgr_67e4d8a9_parseR_ule_L000136_137
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_lastT_Z__L000163 ' <symbol:lastTZ>
 byte 0[240]

 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_buffer_L000165 ' <symbol:buffer>
 byte 0[120]

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160 ' <symbol:parseTZ>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((3600)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_166)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_166
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_168)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_168
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sghgs_67e4d8a9_parseT_Z__L000160_lastT_Z__L000163 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcmp)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_170)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_170
 alignl ' align long
 long I32_LODI + (@C__tzname)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODI + (@C__tzname+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(85)<<S32 ' reg <- conli
 alignl ' align long
 long I32_LODA + (@C_sghg2_67e4d8a9_dststart_L000005)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((7200)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODA + (@C_sghg2_67e4d8a9_dststart_L000005+16)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_MOVI + (r22)<<D32 +(85)<<S32 ' reg <- conli
 alignl ' align long
 long I32_LODA + (@C_sghg3_67e4d8a9_dstend_L000006)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((7200)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODA + (@C_sghg3_67e4d8a9_dstend_L000006+16)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (240)<<S32
 word I16A_CMP + (r0)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgs_67e4d8a9_parseT_Z__L000160_175)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_175
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sghgs_67e4d8a9_parseT_Z__L000160_lastT_Z__L000163 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sghgs_67e4d8a9_parseT_Z__L000160_buffer_L000165 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_177)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_177
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (45)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_179)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_180)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_179
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (43)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_181)<<S32 ' NEI4 reg coni
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_181
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_180
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sghgo_67e4d8a9_parseT_ime_L000060)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_183)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_183
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODA + (@C__timezone)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r2)<<D16A + (10)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sghgs_67e4d8a9_parseT_Z__L000160_buffer_L000165 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODI + (@C__tzname)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgs_67e4d8a9_parseT_Z__L000160_188)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_189)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_188
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_189
 alignl ' align long
 long I32_LODA + (@C__daylight)<<S32
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_185)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_185
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_sghgs_67e4d8a9_parseT_Z__L000160_buffer_L000165 ' reg <- addrg
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_buffer_L000165)<<S32
 word I16A_WRBYTE + (r20)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sghgn_67e4d8a9_parseZ_oneN_ame_L000045)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_190)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_190
 word I16A_MOVI + (r2)<<D16A + (10)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sghgs_67e4d8a9_parseT_Z__L000160_buffer_L000165 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODI + (@C__tzname+4)<<S32
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_strncpy)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_buffer_L000165)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrg reg
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgs_67e4d8a9_parseT_Z__L000160_193)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + RI<<D32 + (44)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgs_67e4d8a9_parseT_Z__L000160_193)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sghgo_67e4d8a9_parseT_ime_L000060)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_195)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_195
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_193
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
 long I32_LODA + (@C__dst_off)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgs_67e4d8a9_parseT_Z__L000160_197)<<S32 ' EQI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (44)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghgs_67e4d8a9_parseT_Z__L000160_199)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_199
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (120)<<S32
 word I16A_CMP + (r0)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sghgs_67e4d8a9_parseT_Z__L000160_201)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_sghgs_67e4d8a9_parseT_Z__L000160_161)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_201
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_sghgs_67e4d8a9_parseT_Z__L000160_buffer_L000165 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sghgr_67e4d8a9_parseR_ule_L000136)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghgs_67e4d8a9_parseT_Z__L000160_203)<<S32 ' NEU4 reg coni
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_203
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_197
 alignl ' align long
C_sghgs_67e4d8a9_parseT_Z__L000160_161
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _tzset

 alignl ' align long
C__tzset ' <symbol:_tzset>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C__tzset_206_L000207 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_getenv)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sghgs_67e4d8a9_parseT_Z__L000160)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C__tzname)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODA + (@C_tzname)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl ' align long
 long I32_LODI + (@C__tzname+4)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODA + (@C_tzname+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
' C__tzset_205 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sghg10_67e4d8a9_last_sunday_L000210 ' <symbol:last_sunday>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((420)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r23)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r3)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghg10_67e4d8a9_last_sunday_L000210_212)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghg10_67e4d8a9_last_sunday_L000210_212)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghg10_67e4d8a9_last_sunday_L000210_214)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghg10_67e4d8a9_last_sunday_L000210_212)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghg10_67e4d8a9_last_sunday_L000210_214
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sghg10_67e4d8a9_last_sunday_L000210_212
 word I16A_CMPS + (r3)<<D16A + (r23)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sghg10_67e4d8a9_last_sunday_L000210_215)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sghg10_67e4d8a9_last_sunday_L000210_211)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghg10_67e4d8a9_last_sunday_L000210_215
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r23)<<S16A ' SUBI/P (3)
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r1)<<S16A ' SUBI/P (3)
 alignl ' align long
C_sghg10_67e4d8a9_last_sunday_L000210_211
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217 ' <symbol:date_of>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((1900)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghg11_67e4d8a9_date_of_L000217_220)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghg11_67e4d8a9_date_of_L000217_222)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((400)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPSI + (r1)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghg11_67e4d8a9_date_of_L000217_220)<<S32 ' NEI4 reg coni
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_222
 word I16A_MOVI + (r17)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghg11_67e4d8a9_date_of_L000217_221)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_220
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_221
 word I16A_MOV + (r19)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (77)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghg11_67e4d8a9_date_of_L000217_223)<<S32 ' EQI4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (74)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sghg11_67e4d8a9_date_of_L000217_226)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_sghg11_67e4d8a9_date_of_L000217_226)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (58)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sghg11_67e4d8a9_date_of_L000217_226)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghg11_67e4d8a9_date_of_L000217_227)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_226
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_227
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r15)<<S16A ' SUBI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_sghg11_67e4d8a9_date_of_L000217_218)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_223
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_sghg11_67e4d8a9_date_of_L000217_229)<<S32 ' JUMPV addrg
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_228
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SUBSI + (r22)<<D16A + (4)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C__ytab ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_229
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghg11_67e4d8a9_date_of_L000217_228)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r22)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((420)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r1)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r1)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r20)<<D16A + (r18)<<S16A ' SUBI/P (1)
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r1)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (7)<<S16A ' SUBI4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r23)<<D16A + (r22)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODL + (r18)<<D16B
 alignl ' align long
 long @C__ytab ' reg <- addrg
 word I16A_ADDS + (r18)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_CMPS + (r23)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sghg11_67e4d8a9_date_of_L000217_231)<<S32 ' LTI4 reg reg
 word I16A_SUBSI + (r23)<<D16A + (7)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_231
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_sghg11_67e4d8a9_date_of_L000217_218
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _dstget

 alignl ' align long
C__dstget ' <symbol:_dstget>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r21)<<D16B
 alignl ' align long
 long @C_sghg2_67e4d8a9_dststart_L000005 ' reg <- addrg
 word I16B_LODL + (r19)<<D16B
 alignl ' align long
 long @C_sghg3_67e4d8a9_dstend_L000006 ' reg <- addrg
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODI + (@C__daylight)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__dstget_234)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_CALA + (@C__tzset)<<S32 ' CALL addrg
 alignl ' align long
C__dstget_234
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_LODI + (@C__daylight)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODI + (@C__daylight)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__dstget_236)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C__dstget_233)<<S32 ' JUMPV addrg
 alignl ' align long
C__dstget_236
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (85)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__dstget_238)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sghg11_67e4d8a9_date_of_L000217)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__dstget_239)<<S32 ' JUMPV addrg
 alignl ' align long
C__dstget_238
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (89)<<S32 ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sghg10_67e4d8a9_last_sunday_L000210)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C__dstget_239
 word I16A_RDBYTE + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl ' align long
 long I32_MOVI + RI<<D32 + (85)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__dstget_240)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sghg11_67e4d8a9_date_of_L000217)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__dstget_241)<<S32 ' JUMPV addrg
 alignl ' align long
C__dstget_240
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + (r3)<<D32 + (272)<<S32 ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_sghg10_67e4d8a9_last_sunday_L000210)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C__dstget_241
 word I16A_CMPS + (r17)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__dstget_242)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__dstget_243)<<S32 ' LEI4 reg reg
 word I16A_CMPS + (r22)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__dstget_243)<<S32 ' GEI4 reg reg
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C__dstget_243)<<S32 ' JUMPV addrg
 alignl ' align long
C__dstget_242
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BR_A + (@C__dstget_248)<<S32 ' GTI4 reg reg
 word I16A_CMPS + (r22)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__dstget_246)<<S32 ' GEI4 reg reg
 alignl ' align long
C__dstget_248
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C__dstget_246
 alignl ' align long
C__dstget_243
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__dstget_249)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__dstget_251)<<S32 ' EQI4 reg reg
 word I16A_CMPS + (r22)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__dstget_249)<<S32 ' NEI4 reg reg
 alignl ' align long
C__dstget_251
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__dstget_252)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_JMPA + (@C__dstget_253)<<S32 ' JUMPV addrg
 alignl ' align long
C__dstget_252
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C__dstget_253
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r18)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r20)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__dstget_257)<<S32 ' NEI4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__dstget_256)<<S32 ' GEI4 reg reg
 alignl ' align long
C__dstget_257
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r22)<<D16A + (r15)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__dstget_254)<<S32 ' NEI4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__dstget_254)<<S32 ' GEI4 reg reg
 alignl ' align long
C__dstget_256
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C__dstget_254
 alignl ' align long
C__dstget_249
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__dstget_258)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_LODI + (@C__dst_off)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__dstget_233)<<S32 ' JUMPV addrg
 alignl ' align long
C__dstget_258
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C__dstget_233
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _ytab

' Catalina Import strlen

' Catalina Import strcmp

' Catalina Import strncpy

' Catalina Import strcpy

' Catalina Import getenv

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__tzset_206_L000207 ' <symbol:206>
 byte 84
 byte 90
 byte 0

 alignl ' align long
C_sghgm_67e4d8a9_43_L000044 ' <symbol:43>
 byte 68
 byte 101
 byte 99
 byte 101
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sghgl_67e4d8a9_41_L000042 ' <symbol:41>
 byte 78
 byte 111
 byte 118
 byte 101
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sghgk_67e4d8a9_39_L000040 ' <symbol:39>
 byte 79
 byte 99
 byte 116
 byte 111
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sghgj_67e4d8a9_37_L000038 ' <symbol:37>
 byte 83
 byte 101
 byte 112
 byte 116
 byte 101
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sghgi_67e4d8a9_35_L000036 ' <symbol:35>
 byte 65
 byte 117
 byte 103
 byte 117
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_sghgh_67e4d8a9_33_L000034 ' <symbol:33>
 byte 74
 byte 117
 byte 108
 byte 121
 byte 0

 alignl ' align long
C_sghgg_67e4d8a9_31_L000032 ' <symbol:31>
 byte 74
 byte 117
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_sghgf_67e4d8a9_29_L000030 ' <symbol:29>
 byte 77
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sghge_67e4d8a9_27_L000028 ' <symbol:27>
 byte 65
 byte 112
 byte 114
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_sghgd_67e4d8a9_25_L000026 ' <symbol:25>
 byte 77
 byte 97
 byte 114
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_sghgc_67e4d8a9_23_L000024 ' <symbol:23>
 byte 70
 byte 101
 byte 98
 byte 114
 byte 117
 byte 97
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sghgb_67e4d8a9_21_L000022 ' <symbol:21>
 byte 74
 byte 97
 byte 110
 byte 117
 byte 97
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sghga_67e4d8a9_19_L000020 ' <symbol:19>
 byte 83
 byte 97
 byte 116
 byte 117
 byte 114
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sghg9_67e4d8a9_17_L000018 ' <symbol:17>
 byte 70
 byte 114
 byte 105
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sghg8_67e4d8a9_15_L000016 ' <symbol:15>
 byte 84
 byte 104
 byte 117
 byte 114
 byte 115
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sghg7_67e4d8a9_13_L000014 ' <symbol:13>
 byte 87
 byte 101
 byte 100
 byte 110
 byte 101
 byte 115
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sghg6_67e4d8a9_11_L000012 ' <symbol:11>
 byte 84
 byte 117
 byte 101
 byte 115
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sghg5_67e4d8a9_9_L000010 ' <symbol:9>
 byte 77
 byte 111
 byte 110
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sghg4_67e4d8a9_7_L000008 ' <symbol:7>
 byte 83
 byte 117
 byte 110
 byte 100
 byte 97
 byte 121
 byte 0

' Catalina Code

DAT ' code segment
' end
