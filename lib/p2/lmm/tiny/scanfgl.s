' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sc20_67d10e1d_charT_oI_nt_L000001 ' <symbol:charToInt>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wcz
 jmp #BR_B
 long @C_sc20_67d10e1d_charT_oI_nt_L000001_3 ' LTI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #7 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
C_sc20_67d10e1d_charT_oI_nt_L000001_3
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #15 wcz
 jmp #BRBE
 long @C_sc20_67d10e1d_charT_oI_nt_L000001_5 ' LEI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #32 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
C_sc20_67d10e1d_charT_oI_nt_L000001_5
 mov r0, r2 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_sc20_67d10e1d_charT_oI_nt_L000001_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export _scanf_getl

 alignl ' align long
C__scanf_getl ' <symbol:_scanf_getl>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C__scanf_getl_8 ' EQI4
 cmps r15,  #45 wz
 jmp #BRNZ
 long @C__scanf_getl_11 ' NEI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C__scanf_getl_12 ' JUMPV addrg
C__scanf_getl_11
 mov r9, #0 ' reg <- coni
C__scanf_getl_12
 jmp #LODF
 long -8
 wrlong r9, RI ' ASGNI4 addrl reg
 cmps r15,  #43 wz
 jmp #BR_Z
 long @C__scanf_getl_15 ' EQI4
 cmps r15,  #45 wz
 jmp #BRNZ
 long @C__scanf_getl_13 ' NEI4
C__scanf_getl_15
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
C__scanf_getl_13
C__scanf_getl_8
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C__scanf_getl_17 ' JUMPV addrg
C__scanf_getl_16
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 cmps r15,  #48 wcz
 jmp #BR_B
 long @C__scanf_getl_21 ' LTI4
 cmps r15,  #57 wcz
 jmp #BRBE
 long @C__scanf_getl_19 ' LEI4
C__scanf_getl_21
 cmps r21,  #16 wz
 jmp #BRNZ
 long @C__scanf_getl_24 ' NEI4
 cmps r15,  #65 wcz
 jmp #BR_B
 long @C__scanf_getl_23 ' LTI4
 cmps r15,  #70 wcz
 jmp #BRBE
 long @C__scanf_getl_19 ' LEI4
C__scanf_getl_23
 cmps r15,  #97 wcz
 jmp #BR_B
 long @C__scanf_getl_24 ' LTI4
 cmps r15,  #102 wcz
 jmp #BRBE
 long @C__scanf_getl_19 ' LEI4
C__scanf_getl_24
 cmps r11,  #0 wz
 jmp #BRNZ
 long @C__scanf_getl_18 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__scanf_getl_7 ' JUMPV addrg
C__scanf_getl_19
 mov r11, #1 ' reg <- coni
 mov r22, r15 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sc20_67d10e1d_charT_oI_nt_L000001 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r13, r0 ' ADDU
 add r13, r22 ' ADDU (3)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #1 ' ADDP4 coni
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNP4 addrl reg
C__scanf_getl_17
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 sub r19, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__scanf_getl_16 ' NEU4
C__scanf_getl_18
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__scanf_getl_27 ' EQI4
 mov r22, r13
 xor r22, all_1s ' BCOMU4
 add r22, #1 ' ADDU4 coni
 wrlong r22, r23 ' ASGNI4 reg reg
 jmp #JMPA
 long @C__scanf_getl_28 ' JUMPV addrg
C__scanf_getl_27
 mov r22, r13 ' CVI, CVU or LOAD
 wrlong r22, r23 ' ASGNI4 reg reg
C__scanf_getl_28
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r0, r22 ' reg <- INDIRP4 reg
C__scanf_getl_7
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF

' end
