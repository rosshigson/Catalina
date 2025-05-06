' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sdpg_67ea42a9_ntstr_L000003 ' <symbol:ntstr>
 byte 71
 byte 77
 byte 84
 byte 0
 byte 0[7]

 alignl ' align long
C_sdpg1_67ea42a9_dststr_L000004 ' <symbol:dststr>
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
 long @C_sdpg_67ea42a9_ntstr_L000003
 long @C_sdpg1_67ea42a9_dststr_L000004

' Catalina Export tzname

 alignl ' align long
C_tzname ' <symbol:tzname>
 long @C_sdpg_67ea42a9_ntstr_L000003
 long @C_sdpg1_67ea42a9_dststr_L000004

 alignl ' align long
C_sdpg2_67ea42a9_dststart_L000005 ' <symbol:dststart>
 byte $55
 byte 0[3]
 long 0
 long 0
 long 0
 long 7200

 alignl ' align long
C_sdpg3_67ea42a9_dstend_L000006 ' <symbol:dstend>
 byte $55
 byte 0[3]
 long 0
 long 0
 long 0
 long 7200

' Catalina Export _days

 alignl ' align long
C__days ' <symbol:_days>
 long @C_sdpg4_67ea42a9_7_L000008
 long @C_sdpg5_67ea42a9_9_L000010
 long @C_sdpg6_67ea42a9_11_L000012
 long @C_sdpg7_67ea42a9_13_L000014
 long @C_sdpg8_67ea42a9_15_L000016
 long @C_sdpg9_67ea42a9_17_L000018
 long @C_sdpga_67ea42a9_19_L000020

' Catalina Export _months

 alignl ' align long
C__months ' <symbol:_months>
 long @C_sdpgb_67ea42a9_21_L000022
 long @C_sdpgc_67ea42a9_23_L000024
 long @C_sdpgd_67ea42a9_25_L000026
 long @C_sdpge_67ea42a9_27_L000028
 long @C_sdpgf_67ea42a9_29_L000030
 long @C_sdpgg_67ea42a9_31_L000032
 long @C_sdpgh_67ea42a9_33_L000034
 long @C_sdpgi_67ea42a9_35_L000036
 long @C_sdpgj_67ea42a9_37_L000038
 long @C_sdpgk_67ea42a9_39_L000040
 long @C_sdpgl_67ea42a9_41_L000042
 long @C_sdpgm_67ea42a9_43_L000044

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045 ' <symbol:parseZoneName>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, #0 ' reg <- coni
 rdbyte r22, r2 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #58 wz
 if_nz jmp #\C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_50 ' NEI4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_46 ' JUMPV addrg
C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_49
 cmps r23,  #10 wcz
 if_ae jmp #\C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_52 ' GEI4
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r20, r2 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_52
 adds r2, #1 ' ADDP4 coni
 adds r23, #1 ' ADDI4 coni
C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_50
 rdbyte r22, r2 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_57 ' EQI4
 mov r20, r22
 subs r20, #48 ' SUBI4 coni
 cmp r20,  #10 wcz 
 if_b jmp #\C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_57 ' LTU4
 cmps r22,  #44 wz
 if_z jmp #\C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_57 ' EQI4
 cmps r22,  #45 wz
 if_z jmp #\C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_57 ' EQI4
 cmps r22,  #43 wz
 if_nz jmp #\C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_49 ' NEI4
C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_57
 cmps r23,  #3 wcz
 if_ae jmp #\C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_58 ' GEI4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_46 ' JUMPV addrg
C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_58
 mov r22, #0 ' reg <- coni
 wrbyte r22, r3 ' ASGNU1 reg reg
 mov r0, r2 ' CVI, CVU or LOAD
C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045_46
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sdpgo_67ea42a9_parseT_ime_L000060 ' <symbol:parseTime>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, #0 ' reg <- coni
 mov r21, r3 ' CVI, CVU or LOAD
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_63 ' EQU4
 rdbyte r19, r2 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_64 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_63
 mov r19, #0 ' reg <- coni
C_sdpgo_67ea42a9_parseT_ime_L000060_64
 mov r22, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_65 ' EQU4
 mov r22, #85 ' reg <- coni
 wrbyte r22, r2 ' ASGNU1 reg reg
C_sdpgo_67ea42a9_parseT_ime_L000060_65
 mov r22, #0 ' reg <- coni
 wrlong r22, r4 ' ASGNI4 reg reg
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_68 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_67
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 mov r23, r0 ' ADDI/P
 adds r23, r22 ' ADDI/P (3)
C_sdpgo_67ea42a9_parseT_ime_L000060_68
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_70 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_67 ' LEI4
C_sdpgo_67ea42a9_parseT_ime_L000060_70
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_71  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_61 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_71
 cmps r23,  #0 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_75 ' LTI4
 cmps r23,  #24 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_73 ' LTI4
C_sdpgo_67ea42a9_parseT_ime_L000060_75
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_61 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_73
 mov r22, #60 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r0 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 wrlong r0, r4 ' ASGNI4 reg reg
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #58 wz
 if_nz jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_76 ' NEI4
 adds r3, #1 ' ADDP4 coni
 mov r23, #0 ' reg <- coni
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_79 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_78
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 mov r23, r0 ' ADDI/P
 adds r23, r22 ' ADDI/P (3)
C_sdpgo_67ea42a9_parseT_ime_L000060_79
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_81 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_78 ' LEI4
C_sdpgo_67ea42a9_parseT_ime_L000060_81
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_82  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_61 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_82
 cmps r23,  #0 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_86 ' LTI4
 cmps r23,  #60 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_84 ' LTI4
C_sdpgo_67ea42a9_parseT_ime_L000060_86
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_61 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_84
 rdlong r22, r4 ' reg <- INDIRI4 reg
 mov r20, #60 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 adds r22, r0 ' ADDI/P (1)
 wrlong r22, r4 ' ASGNI4 reg reg
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #58 wz
 if_nz jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_87 ' NEI4
 adds r3, #1 ' ADDP4 coni
 mov r23, #0 ' reg <- coni
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_90 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_89
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 mov r23, r0 ' ADDI/P
 adds r23, r22 ' ADDI/P (3)
C_sdpgo_67ea42a9_parseT_ime_L000060_90
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_92 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_89 ' LEI4
C_sdpgo_67ea42a9_parseT_ime_L000060_92
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_93  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_61 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_93
 cmps r23,  #0 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_97 ' LTI4
 cmps r23,  #60 wcz
 if_b jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_95 ' LTI4
C_sdpgo_67ea42a9_parseT_ime_L000060_97
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgo_67ea42a9_parseT_ime_L000060_61 ' JUMPV addrg
C_sdpgo_67ea42a9_parseT_ime_L000060_95
 rdlong r22, r4 ' reg <- INDIRI4 reg
 adds r22, r23 ' ADDI/P (1)
 wrlong r22, r4 ' ASGNI4 reg reg
C_sdpgo_67ea42a9_parseT_ime_L000060_87
C_sdpgo_67ea42a9_parseT_ime_L000060_76
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_sdpgo_67ea42a9_parseT_ime_L000060_98 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r2 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r4 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
C_sdpgo_67ea42a9_parseT_ime_L000060_98
 mov r0, r3 ' CVI, CVU or LOAD
C_sdpgo_67ea42a9_parseT_ime_L000060_61
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sdpgp_67ea42a9_parseD_ate_L000100_102_L000103 ' <symbol:102>
 long 1
 long 12
 long 1
 long 5
 long 0
 long 6

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sdpgp_67ea42a9_parseD_ate_L000100 ' <symbol:parseDate>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r21, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, ##@C_sdpgp_67ea42a9_parseD_ate_L000100_102_L000103 ' reg <- addrg
 calld PA,#CPYB
 long 24 ' ASGNB
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #77 wz
 if_z jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_104 ' EQI4
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #74 wz
 if_nz jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_106 ' NEI4
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov r20, r3 ' CVI, CVU or LOAD
 mov r3, r20
 adds r3, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r17, #74 ' reg <- coni
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_107 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_106
 mov r17, #90 ' reg <- coni
C_sdpgp_67ea42a9_parseD_ate_L000100_107
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_109 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_108
 mov r22, r3 ' CVI, CVU or LOAD
 mov r20, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #48 ' SUBI4 coni
 mov r21, r0 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
 mov r20, r4 ' CVI, CVU or LOAD
 mov r4, r20
 adds r4, #1 ' ADDP4 coni
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r20 ' ASGNU1 reg reg
C_sdpgp_67ea42a9_parseD_ate_L000100_109
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wcz
 if_b jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_111 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_108 ' LEI4
C_sdpgp_67ea42a9_parseD_ate_L000100_111
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_112  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_101 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_112
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #74 wz
 if_nz jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_118 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_119 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_118
 mov r15, #0 ' reg <- coni
C_sdpgp_67ea42a9_parseD_ate_L000100_119
 cmps r21, r15 wcz
 if_b jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_117 ' LTI4
 cmps r21,  #365 wcz
 if_be jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_114 ' LEI4
C_sdpgp_67ea42a9_parseD_ate_L000100_117
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_101 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_114
 wrbyte r17, r2 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov r0, r3 ' CVI, CVU or LOAD
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_101 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_104
 mov r17, #77 ' reg <- coni
C_sdpgp_67ea42a9_parseD_ate_L000100_120
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov r20, r3 ' CVI, CVU or LOAD
 mov r3, r20
 adds r3, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r23, r3 ' CVI, CVU or LOAD
 mov r21, #0 ' reg <- coni
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_124 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_123
 mov r22, r3 ' CVI, CVU or LOAD
 mov r20, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #48 ' SUBI4 coni
 mov r21, r0 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
 mov r20, r4 ' CVI, CVU or LOAD
 mov r4, r20
 adds r4, #1 ' ADDP4 coni
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r20 ' ASGNU1 reg reg
C_sdpgp_67ea42a9_parseD_ate_L000100_124
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wcz
 if_b jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_126 ' LTI4
 cmps r22,  #57 wcz
 if_be jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_123 ' LEI4
C_sdpgp_67ea42a9_parseD_ate_L000100_126
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_127  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_101 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_127
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 adds r20, r22 ' ADDI/P (2)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r21, r20 wcz
 if_b jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_132 ' LTI4
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 if_be jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_129 ' LEI4
C_sdpgp_67ea42a9_parseD_ate_L000100_132
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_101 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_129
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r21, r22 ' ASGNI4 reg reg
 adds r19, #1 ' ADDI4 coni
' C_sdpgp_67ea42a9_parseD_ate_L000100_121 ' (symbol refcount = 0)
 cmps r19,  #3 wcz
 if_ae jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_133 ' GEI4
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #46 wz
 if_z jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_120 ' EQI4
C_sdpgp_67ea42a9_parseD_ate_L000100_133
 cmps r19,  #3 wz
 if_z jmp #\C_sdpgp_67ea42a9_parseD_ate_L000100_134 ' EQI4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgp_67ea42a9_parseD_ate_L000100_101 ' JUMPV addrg
C_sdpgp_67ea42a9_parseD_ate_L000100_134
 mov r22, #0 ' reg <- coni
 wrbyte r22, r4 ' ASGNU1 reg reg
 wrbyte r17, r2 ' ASGNU1 reg reg
 mov r0, r3 ' CVI, CVU or LOAD
C_sdpgp_67ea42a9_parseD_ate_L000100_101
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sdpgr_67ea42a9_parseR_ule_L000136 ' <symbol:parseRule>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##@C_sdpg2_67ea42a9_dststart_L000005 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgp_67ea42a9_parseD_ate_L000100
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_138  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgr_67ea42a9_parseR_ule_L000136_137 ' JUMPV addrg
C_sdpgr_67ea42a9_parseR_ule_L000136_138
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 adds r23, r0 ' ADDI/P (2)
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_nz jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_140 ' NEI4
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, ##@C_sdpg2_67ea42a9_dststart_L000005 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgo_67ea42a9_parseT_ime_L000060
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_145  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgr_67ea42a9_parseR_ule_L000136_137 ' JUMPV addrg
C_sdpgr_67ea42a9_parseR_ule_L000136_144
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov r19, r20
 adds r19, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sdpgr_67ea42a9_parseR_ule_L000136_145
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_144  ' NEU4
C_sdpgr_67ea42a9_parseR_ule_L000136_140
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #44 wz
 if_z jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_147 ' EQI4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgr_67ea42a9_parseR_ule_L000136_137 ' JUMPV addrg
C_sdpgr_67ea42a9_parseR_ule_L000136_147
 adds r21, #1 ' ADDP4 coni
 mov r2, ##@C_sdpg3_67ea42a9_dstend_L000006 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgp_67ea42a9_parseD_ate_L000100
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_149  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgr_67ea42a9_parseR_ule_L000136_137 ' JUMPV addrg
C_sdpgr_67ea42a9_parseR_ule_L000136_149
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 adds r23, r0 ' ADDI/P (2)
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_nz jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_151 ' NEI4
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, ##@C_sdpg3_67ea42a9_dstend_L000006 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgo_67ea42a9_parseT_ime_L000060
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_156  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgr_67ea42a9_parseR_ule_L000136_137 ' JUMPV addrg
C_sdpgr_67ea42a9_parseR_ule_L000136_155
C_sdpgr_67ea42a9_parseR_ule_L000136_156
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov r19, r20
 adds r19, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_155 ' NEI4
C_sdpgr_67ea42a9_parseR_ule_L000136_151
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sdpgr_67ea42a9_parseR_ule_L000136_158 ' EQI4
 mov r0, ##0 ' RET con
 jmp #\@C_sdpgr_67ea42a9_parseR_ule_L000136_137 ' JUMPV addrg
C_sdpgr_67ea42a9_parseR_ule_L000136_158
 mov r0, r21 ' CVI, CVU or LOAD
C_sdpgr_67ea42a9_parseR_ule_L000136_137
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sdpgs_67ea42a9_parseT_Z__L000160_lastT_Z__L000163 ' <symbol:lastTZ>
 byte 0[240]

 alignl ' align long
C_sdpgs_67ea42a9_parseT_Z__L000160_buffer_L000165 ' <symbol:buffer>
 byte 0[120]

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sdpgs_67ea42a9_parseT_Z__L000160 ' <symbol:parseTZ>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##3600 ' reg <- con
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_166  ' NEU4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_166
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #58 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_168 ' NEI4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_168
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_lastT_Z__L000163 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_170 ' NEI4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_170
 mov r22, ##@C__tzname
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##@C__tzname+4
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #85 ' reg <- coni
 wrbyte r22, ##@C_sdpg2_67ea42a9_dststart_L000005 ' ASGNU1 addrg reg
 mov r22, ##7200 ' reg <- con
 wrlong r22, ##@C_sdpg2_67ea42a9_dststart_L000005+16 ' ASGNI4 addrg reg
 mov r22, #85 ' reg <- coni
 wrbyte r22, ##@C_sdpg3_67ea42a9_dstend_L000006 ' ASGNU1 addrg reg
 mov r22, ##7200 ' reg <- con
 wrlong r22, ##@C_sdpg3_67ea42a9_dstend_L000006+16 ' ASGNI4 addrg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #240 wcz 
 if_be jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_175 ' LEU4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_175
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_lastT_Z__L000163 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_buffer_L000165 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_177  ' NEU4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_177
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_179 ' NEI4
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r23, #1 ' ADDP4 coni
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_180 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_179
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #43 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_181 ' NEI4
 adds r23, #1 ' ADDP4 coni
C_sdpgs_67ea42a9_parseT_Z__L000160_181
C_sdpgs_67ea42a9_parseT_Z__L000160_180
 mov r2, ##0 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgo_67ea42a9_parseT_ime_L000060
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_183  ' NEU4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_183
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, ##@C__timezone ' ASGNI4 addrg reg
 mov r2, #10 ' reg ARG coni
 mov r3, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_buffer_L000165 ' reg ARG ADDRG
 mov r4, ##@C__tzname
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_188 ' EQI4
 mov r21, #1 ' reg <- coni
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_189 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_188
 mov r21, #0 ' reg <- coni
C_sdpgs_67ea42a9_parseT_Z__L000160_189
 wrlong r21, ##@C__daylight ' ASGNI4 addrg reg
 cmps r21,  #0 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_185 ' NEI4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_185
 mov r22, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_buffer_L000165 ' reg <- addrg
 mov r20, #0 ' reg <- coni
 wrbyte r20, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_buffer_L000165 ' ASGNU1 addrg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgn_67ea42a9_parseZ_oneN_ame_L000045
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_190  ' NEU4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_190
 mov r2, #10 ' reg ARG coni
 mov r3, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_buffer_L000165 ' reg ARG ADDRG
 mov r4, ##@C__tzname+4
 rdlong r4, r4
 ' reg ARG INDIR ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 wrbyte r22, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_buffer_L000165 ' ASGNU1 addrg reg
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_193 ' EQI4
 cmps r22,  #44 wz
 if_z jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_193 ' EQI4
 mov r2, ##0 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgo_67ea42a9_parseT_ime_L000060
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_195  ' NEU4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_195
C_sdpgs_67ea42a9_parseT_Z__L000160_193
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, ##@C__dst_off ' ASGNI4 addrg reg
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_197 ' EQI4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #44 wz
 if_z jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_199 ' EQI4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_199
 adds r23, #1 ' ADDP4 coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #120 wcz 
 if_be jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_201 ' LEU4
 jmp #\@C_sdpgs_67ea42a9_parseT_Z__L000160_161 ' JUMPV addrg
C_sdpgs_67ea42a9_parseT_Z__L000160_201
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_sdpgs_67ea42a9_parseT_Z__L000160_buffer_L000165 ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpgr_67ea42a9_parseR_ule_L000136
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_sdpgs_67ea42a9_parseT_Z__L000160_203  ' NEU4
C_sdpgs_67ea42a9_parseT_Z__L000160_203
C_sdpgs_67ea42a9_parseT_Z__L000160_197
C_sdpgs_67ea42a9_parseT_Z__L000160_161
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export _tzset

 alignl ' align long
C__tzset ' <symbol:_tzset>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, ##@C__tzset_206_L000207 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_getenv ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sdpgs_67ea42a9_parseT_Z__L000160 ' CALL addrg
 mov r22, ##@C__tzname
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 wrlong r22, ##@C_tzname ' ASGNP4 addrg reg
 mov r22, ##@C__tzname+4
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 wrlong r22, ##@C_tzname+4 ' ASGNP4 addrg reg
' C__tzset_205 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_sdpg10_67ea42a9_last_sunday_L000210 ' <symbol:last_sunday>
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r22, r2
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r2
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 subs r22, r20 ' SUBI/P (1)
 adds r22, #420 ' ADDI4 coni
 mov r20, #7 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r23, r1 ' CVI, CVU or LOAD
 cmps r3,  #58 wcz
 if_b jmp #\C_sdpg10_67ea42a9_last_sunday_L000210_212 ' LTI4
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_sdpg10_67ea42a9_last_sunday_L000210_212 ' NEI4
 mov r18, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_sdpg10_67ea42a9_last_sunday_L000210_214 ' NEI4
 mov r18, #400 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_sdpg10_67ea42a9_last_sunday_L000210_212 ' NEI4
C_sdpg10_67ea42a9_last_sunday_L000210_214
 adds r3, #1 ' ADDI4 coni
C_sdpg10_67ea42a9_last_sunday_L000210_212
 cmps r3, r23 wcz
 if_ae jmp #\C_sdpg10_67ea42a9_last_sunday_L000210_215 ' GEI4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C_sdpg10_67ea42a9_last_sunday_L000210_211 ' JUMPV addrg
C_sdpg10_67ea42a9_last_sunday_L000210_215
 mov r22, r3 ' SUBI/P
 subs r22, r23 ' SUBI/P (3)
 mov r20, #7 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r0, r3 ' SUBI/P
 subs r0, r1 ' SUBI/P (3)
C_sdpg10_67ea42a9_last_sunday_L000210_211
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sdpg11_67ea42a9_date_of_L000217 ' <symbol:date_of>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_sdpg11_67ea42a9_date_of_L000217_220 ' NEI4
 mov r18, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_sdpg11_67ea42a9_date_of_L000217_222 ' NEI4
 mov r18, #400 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r1, r20 wz
 if_nz jmp #\C_sdpg11_67ea42a9_date_of_L000217_220 ' NEI4
C_sdpg11_67ea42a9_date_of_L000217_222
 mov r17, #1 ' reg <- coni
 jmp #\@C_sdpg11_67ea42a9_date_of_L000217_221 ' JUMPV addrg
C_sdpg11_67ea42a9_date_of_L000217_220
 mov r17, #0 ' reg <- coni
C_sdpg11_67ea42a9_date_of_L000217_221
 mov r19, r17 ' CVI, CVU or LOAD
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #77 wz
 if_z jmp #\C_sdpg11_67ea42a9_date_of_L000217_223 ' EQI4
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #74 wz
 if_nz jmp #\C_sdpg11_67ea42a9_date_of_L000217_226 ' NEI4
 cmps r19,  #0 wz
 if_z jmp #\C_sdpg11_67ea42a9_date_of_L000217_226 ' EQI4
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #58 wcz
 if_ae jmp #\C_sdpg11_67ea42a9_date_of_L000217_226 ' GEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_sdpg11_67ea42a9_date_of_L000217_227 ' JUMPV addrg
C_sdpg11_67ea42a9_date_of_L000217_226
 mov r15, #0 ' reg <- coni
C_sdpg11_67ea42a9_date_of_L000217_227
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' SUBI/P
 subs r0, r15 ' SUBI/P (3)
 jmp #\@C_sdpg11_67ea42a9_date_of_L000217_218 ' JUMPV addrg
C_sdpg11_67ea42a9_date_of_L000217_223
 mov r23, #0 ' reg <- coni
 mov r21, #1 ' reg <- coni
 jmp #\@C_sdpg11_67ea42a9_date_of_L000217_229 ' JUMPV addrg
C_sdpg11_67ea42a9_date_of_L000217_228
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 subs r22, #4 ' SUBI4 coni
 mov r20, #48 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C__ytab ' reg <- addrg
 adds r20, r0 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r23, r22 ' ADDI/P (1)
 adds r21, #1 ' ADDI4 coni
C_sdpg11_67ea42a9_date_of_L000217_229
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r21, r22 wcz
 if_b jmp #\C_sdpg11_67ea42a9_date_of_L000217_228 ' LTI4
 mov r22, #7 ' reg <- coni
 mov r20, r2
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, r2
 adds r18, #28 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 subs r20, r18 ' SUBI/P (1)
 adds r20, #420 ' ADDI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r23 ' ADDI/P
 adds r20, r1 ' ADDI/P (3)
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r1, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r23, RI ' ASGNI4 addrli reg
 mov r20, r3
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, FP
 sub r18, #-(-8) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 reg
 subs r20, r18 ' SUBI/P (1)
 adds r20, #7 ' ADDI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-16)
 wrlong r1, RI ' ASGNI4 addrli reg
 mov r20, r3
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 subs r22, #7 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (2)
 adds r23, r22 ' ADDI/P (1)
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 shl r20, #2 ' LSHI4 coni
 mov r18, #48 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r18, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r18, ##@C__ytab ' reg <- addrg
 adds r18, r0 ' ADDI/P (2)
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 cmps r23, r22 wcz
 if_b jmp #\C_sdpg11_67ea42a9_date_of_L000217_231 ' LTI4
 subs r23, #7 ' SUBI4 coni
C_sdpg11_67ea42a9_date_of_L000217_231
 mov r0, r23 ' CVI, CVU or LOAD
C_sdpg11_67ea42a9_date_of_L000217_218
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Export _dstget

 alignl ' align long
C__dstget ' <symbol:_dstget>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, ##@C_sdpg2_67ea42a9_dststart_L000005 ' reg <- addrg
 mov r19, ##@C_sdpg3_67ea42a9_dstend_L000006 ' reg <- addrg
 mov r13, #0 ' reg <- coni
 mov r22, ##@C__daylight
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C__dstget_234 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__tzset ' CALL addrg
C__dstget_234
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, ##@C__daylight
 rdlong r20, r20 ' reg <- INDIRI4 addrg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, ##@C__daylight
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C__dstget_236 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C__dstget_233 ' JUMPV addrg
C__dstget_236
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #85 wz
 if_z jmp #\C__dstget_238 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpg11_67ea42a9_date_of_L000217
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C__dstget_239 ' JUMPV addrg
C__dstget_238
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #89 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpg10_67ea42a9_last_sunday_L000210
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C__dstget_239
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #85 wz
 if_z jmp #\C__dstget_240 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpg11_67ea42a9_date_of_L000217
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C__dstget_241 ' JUMPV addrg
C__dstget_240
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #272 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sdpg10_67ea42a9_last_sunday_L000210
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C__dstget_241
 cmps r17, r15 wcz
 if_ae jmp #\C__dstget_242 ' GEI4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r17 wcz
 if_be jmp #\C__dstget_243 ' LEI4
 cmps r22, r15 wcz
 if_ae jmp #\C__dstget_243 ' GEI4
 mov r13, #1 ' reg <- coni
 jmp #\@C__dstget_243 ' JUMPV addrg
C__dstget_242
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r17 wcz
 if_a jmp #\C__dstget_248 ' GTI4
 cmps r22, r15 wcz
 if_ae jmp #\C__dstget_246 ' GEI4
C__dstget_248
 mov r13, #1 ' reg <- coni
C__dstget_246
C__dstget_243
 cmps r13,  #0 wz
 if_nz jmp #\C__dstget_249 ' NEI4
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r17 wz
 if_z jmp #\C__dstget_251 ' EQI4
 cmps r22, r15 wz
 if_nz jmp #\C__dstget_249 ' NEI4
C__dstget_251
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r17 wz
 if_nz jmp #\C__dstget_252 ' NEI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C__dstget_253 ' JUMPV addrg
C__dstget_252
 mov r22, r19
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C__dstget_253
 mov r22, #60 ' reg <- coni
 mov r20, #60 ' reg <- coni
 mov r18, r23
 adds r18, #8 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r20, r0 ' ADDI/P (2)
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 rdlong r22, r23 ' reg <- INDIRI4 reg
 adds r22, r0 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r17 wz
 if_nz jmp #\C__dstget_257 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_ae jmp #\C__dstget_256 ' GEI4
C__dstget_257
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r15 wz
 if_nz jmp #\C__dstget_254 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wcz
 if_ae jmp #\C__dstget_254 ' GEI4
C__dstget_256
 mov r13, #1 ' reg <- coni
C__dstget_254
C__dstget_249
 cmps r13,  #0 wz
 if_z jmp #\C__dstget_258 ' EQI4
 mov r22, ##@C__dst_off
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C__dstget_233 ' JUMPV addrg
C__dstget_258
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C__dstget_233
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


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
C_sdpgm_67ea42a9_43_L000044 ' <symbol:43>
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
C_sdpgl_67ea42a9_41_L000042 ' <symbol:41>
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
C_sdpgk_67ea42a9_39_L000040 ' <symbol:39>
 byte 79
 byte 99
 byte 116
 byte 111
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sdpgj_67ea42a9_37_L000038 ' <symbol:37>
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
C_sdpgi_67ea42a9_35_L000036 ' <symbol:35>
 byte 65
 byte 117
 byte 103
 byte 117
 byte 115
 byte 116
 byte 0

 alignl ' align long
C_sdpgh_67ea42a9_33_L000034 ' <symbol:33>
 byte 74
 byte 117
 byte 108
 byte 121
 byte 0

 alignl ' align long
C_sdpgg_67ea42a9_31_L000032 ' <symbol:31>
 byte 74
 byte 117
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_sdpgf_67ea42a9_29_L000030 ' <symbol:29>
 byte 77
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sdpge_67ea42a9_27_L000028 ' <symbol:27>
 byte 65
 byte 112
 byte 114
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_sdpgd_67ea42a9_25_L000026 ' <symbol:25>
 byte 77
 byte 97
 byte 114
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_sdpgc_67ea42a9_23_L000024 ' <symbol:23>
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
C_sdpgb_67ea42a9_21_L000022 ' <symbol:21>
 byte 74
 byte 97
 byte 110
 byte 117
 byte 97
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sdpga_67ea42a9_19_L000020 ' <symbol:19>
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
C_sdpg9_67ea42a9_17_L000018 ' <symbol:17>
 byte 70
 byte 114
 byte 105
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sdpg8_67ea42a9_15_L000016 ' <symbol:15>
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
C_sdpg7_67ea42a9_13_L000014 ' <symbol:13>
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
C_sdpg6_67ea42a9_11_L000012 ' <symbol:11>
 byte 84
 byte 117
 byte 101
 byte 115
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sdpg5_67ea42a9_9_L000010 ' <symbol:9>
 byte 77
 byte 111
 byte 110
 byte 100
 byte 97
 byte 121
 byte 0

 alignl ' align long
C_sdpg4_67ea42a9_7_L000008 ' <symbol:7>
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
