' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sinc_67ea42b7_charT_oI_nt_L000001 ' <symbol:charToInt>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wcz
 if_b jmp #\C_sinc_67ea42b7_charT_oI_nt_L000001_3 ' LTI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #7 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
C_sinc_67ea42b7_charT_oI_nt_L000001_3
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #15 wcz
 if_be jmp #\C_sinc_67ea42b7_charT_oI_nt_L000001_5 ' LEI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #32 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
C_sinc_67ea42b7_charT_oI_nt_L000001_5
 mov r0, r2 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_sinc_67ea42b7_charT_oI_nt_L000001_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export _scanf_getll

 alignl ' align long
C__scanf_getll ' <symbol:_scanf_getll>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r15, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r17,  #0 wz
 if_z jmp #\C__scanf_getll_8 ' EQI4
 cmps r15,  #45 wz
 if_nz jmp #\C__scanf_getll_11 ' NEI4
 mov r9, #1 ' reg <- coni
 jmp #\@C__scanf_getll_12 ' JUMPV addrg
C__scanf_getll_11
 mov r9, #0 ' reg <- coni
C__scanf_getll_12
 mov RI, FP
 sub RI, #-(-8)
 wrlong r9, RI ' ASGNI4 addrli reg
 cmps r15,  #43 wz
 if_z jmp #\C__scanf_getll_15 ' EQI4
 cmps r15,  #45 wz
 if_nz jmp #\C__scanf_getll_13 ' NEI4
C__scanf_getll_15
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#8
 wrlong r22, RI ' ASGNP4 addrfi reg
C__scanf_getll_13
C__scanf_getll_8
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 jmp #\@C__scanf_getll_17 ' JUMPV addrg
C__scanf_getll_16
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r15, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r15,  #48 wcz
 if_b jmp #\C__scanf_getll_21 ' LTI4
 cmps r15,  #57 wcz
 if_be jmp #\C__scanf_getll_19 ' LEI4
C__scanf_getll_21
 cmps r21,  #16 wz
 if_nz jmp #\C__scanf_getll_24 ' NEI4
 cmps r15,  #65 wcz
 if_b jmp #\C__scanf_getll_23 ' LTI4
 cmps r15,  #70 wcz
 if_be jmp #\C__scanf_getll_19 ' LEI4
C__scanf_getll_23
 cmps r15,  #97 wcz
 if_b jmp #\C__scanf_getll_24 ' LTI4
 cmps r15,  #102 wcz
 if_be jmp #\C__scanf_getll_19 ' LEI4
C__scanf_getll_24
 cmps r11,  #0 wz
 if_nz jmp #\C__scanf_getll_18 ' NEI4
 mov r0, ##0 ' RET con
 jmp #\@C__scanf_getll_7 ' JUMPV addrg
C__scanf_getll_19
 mov r11, #1 ' reg <- coni
 mov r22, r15 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sinc_67ea42b7_charT_oI_nt_L000001 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r13 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' ADDU
 add r13, r22 ' ADDU (3)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI,#8
 wrlong r22, RI ' ASGNP4 addrfi reg
C__scanf_getll_17
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 sub r19, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C__scanf_getll_16  ' NEU4
C__scanf_getll_18
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C__scanf_getll_27 ' EQI4
 mov r22, r13
 xor r22, all_1s ' BCOMU4
 add r22, #1 ' ADDU4 coni
 wrlong r22, r23 ' ASGNI4 reg reg
 jmp #\@C__scanf_getll_28 ' JUMPV addrg
C__scanf_getll_27
 mov r22, r13 ' CVI, CVU or LOAD
 wrlong r22, r23 ' ASGNI4 reg reg
C__scanf_getll_28
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r0, r22 ' reg <- INDIRP4 reg
C__scanf_getll_7
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF

' end
