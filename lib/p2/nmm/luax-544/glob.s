' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export amatch

 alignl ' align long
C_amatch ' <symbol:amatch>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_amatch_3 ' JUMPV addrg
C_amatch_2
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_amatch_5 ' NEI4
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #42 wz
 if_z jmp #\C_amatch_5 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_5
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, #63 ' reg <- coni
 cmps r15, r22 wz
 if_z jmp #\C_amatch_27 ' EQI4
 cmps r15, r22 wcz
 if_a jmp #\C_amatch_71 ' GTI4
' C_amatch_70 ' (symbol refcount = 0)
 cmps r15,  #42 wz
 if_z jmp #\C_amatch_12 ' EQI4
 jmp #\@C_amatch_7 ' JUMPV addrg
C_amatch_71
 cmps r15,  #91 wz
 if_z jmp #\C_amatch_30 ' EQI4
 cmps r15,  #92 wz
 if_z jmp #\C_amatch_65 ' EQI4
 jmp #\@C_amatch_7 ' JUMPV addrg
C_amatch_11
 adds r21, #1 ' ADDP4 coni
C_amatch_12
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #42 wz
 if_z jmp #\C_amatch_11 ' EQI4
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_amatch_14 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_14
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #63 wz
 if_z jmp #\C_amatch_23 ' EQI4
 cmps r22,  #91 wz
 if_z jmp #\C_amatch_23 ' EQI4
 cmps r22,  #92 wz
 if_z jmp #\C_amatch_23 ' EQI4
 jmp #\@C_amatch_19 ' JUMPV addrg
C_amatch_18
 adds r23, #1 ' ADDP4 coni
C_amatch_19
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_amatch_21 ' EQI4
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_amatch_18 ' NEI4
C_amatch_21
 jmp #\@C_amatch_23 ' JUMPV addrg
C_amatch_22
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_amatch
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_amatch_25 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_25
 adds r23, #1 ' ADDP4 coni
C_amatch_23
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_amatch_22 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_27
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_amatch_28 ' EQI4
 jmp #\@C_amatch_8 ' JUMPV addrg
C_amatch_28
 mov r0, #0 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_30
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #94 wz
 if_z jmp #\C_amatch_31 ' EQI4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_amatch_32 ' JUMPV addrg
C_amatch_31
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r21, #1 ' ADDP4 coni
C_amatch_32
 mov r17, #0 ' reg <- coni
 jmp #\@C_amatch_34 ' JUMPV addrg
C_amatch_33
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_amatch_36 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_36
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C_amatch_38 ' NEI4
 mov r22, r21
 adds r22, #1 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_amatch_40 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_40
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #93 wz
 if_z jmp #\C_amatch_42 ' EQI4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r19 wz
 if_z jmp #\C_amatch_47 ' EQI4
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_z jmp #\C_amatch_47 ' EQI4
 cmps r22, r19 wcz
 if_be jmp #\C_amatch_39 ' LEI4
 cmps r22, r20 wcz
 if_ae jmp #\C_amatch_39 ' GEI4
C_amatch_47
 mov r17, #1 ' reg <- coni
 jmp #\@C_amatch_39 ' JUMPV addrg
C_amatch_42
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r19 wcz
 if_b jmp #\C_amatch_35 ' LTI4
 mov r17, #1 ' reg <- coni
 jmp #\@C_amatch_35 ' JUMPV addrg
C_amatch_38
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r19, r22 wz
 if_nz jmp #\C_amatch_50 ' NEI4
 mov r17, #1 ' reg <- coni
C_amatch_50
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #93 wz
 if_z jmp #\C_amatch_35 ' EQI4
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r20, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_nz jmp #\C_amatch_53 ' NEI4
 mov r17, #1 ' reg <- coni
C_amatch_53
C_amatch_39
C_amatch_34
 mov r22, #0 ' reg <- coni
 cmps r17, r22 wz
 if_nz jmp #\C_amatch_56 ' NEI4
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r20 ' CVI, CVU or LOAD
 cmps r20, r22 wz
 if_nz jmp #\C_amatch_33 ' NEI4
C_amatch_56
C_amatch_35
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r17 wz
 if_nz jmp #\C_amatch_60 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_59
 adds r21, #1 ' ADDP4 coni
C_amatch_60
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_amatch_62 ' EQI4
 cmps r22,  #93 wz
 if_nz jmp #\C_amatch_59 ' NEI4
C_amatch_62
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_amatch_8 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_65
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_amatch_66 ' EQI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
C_amatch_66
C_amatch_7
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r19, r22 wz
 if_z jmp #\C_amatch_8 ' EQI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_amatch_1 ' JUMPV addrg
C_amatch_8
 adds r23, #1 ' ADDP4 coni
C_amatch_3
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_amatch_2 ' NEI4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_amatch_73 ' NEI4
 mov r15, #1 ' reg <- coni
 jmp #\@C_amatch_74 ' JUMPV addrg
C_amatch_73
 mov r15, #0 ' reg <- coni
C_amatch_74
 mov r0, r15 ' CVI, CVU or LOAD
C_amatch_1
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF

' end