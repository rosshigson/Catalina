' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export qsort

 alignl ' align long
C_qsort ' <symbol:qsort>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_qsort_8 ' NEU4
 jmp #JMPA
 long @C_qsort_7 ' JUMPV addrg
C_qsort_8
 jmp #LODL
 long @C_sh341_67da3dd0_qcompar_L000004
 wrlong r17, RI ' ASGNP4 addrg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21
 sub r22, #1 ' SUBU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r0 ' ADDI/P
 adds r3, r23 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sh34_67da3dd0_qsort1_L000003
 add SP, #8 ' CALL addrg
C_qsort_7
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sh34_67da3dd0_qsort1_L000003 ' <symbol:qsort1>
 jmp #NEWF
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
C_sh34_67da3dd0_qsort1_L000003_11
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_sh34_67da3dd0_qsort1_L000003_15 ' GTU4
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_10 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_15
 mov r17, r23 ' CVI, CVU or LOAD
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 add r22, r19 ' ADDU (1)
 mov r20, r19
 shl r20, #1 ' LSHU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r19 ' setup r0/r1 (1)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov r11, r22 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_19 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_18
 cmps r9,  #0 wz,wc
 jmp #BRAE
 long @C_sh34_67da3dd0_qsort1_L000003_21 ' GEI4
 adds r17, r19 ' ADDI/P (2)
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_22 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_21
 subs r13, r19 ' SUBI/P (1)
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sh342_67da3dd0_qexchange_L000005
 add SP, #8 ' CALL addrg
C_sh34_67da3dd0_qsort1_L000003_22
C_sh34_67da3dd0_qsort1_L000003_19
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_sh34_67da3dd0_qsort1_L000003_23 ' GEU4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sh341_67da3dd0_qcompar_L000004
 mov r22, RI ' reg <- INDIRP4 addrg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #4 ' CALL indirect
 mov r9, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRBE
 long @C_sh34_67da3dd0_qsort1_L000003_18 ' LEI4
C_sh34_67da3dd0_qsort1_L000003_23
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_25 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_24
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sh341_67da3dd0_qcompar_L000004
 mov r22, RI ' reg <- INDIRP4 addrg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #4 ' CALL indirect
 mov r9, r0 ' CVI, CVU or LOAD
 cmps r0,  #0 wz,wc
 jmp #BRAE
 long @C_sh34_67da3dd0_qsort1_L000003_27 ' GEI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_sh34_67da3dd0_qsort1_L000003_29 ' GEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sh342_67da3dd0_qexchange_L000005
 add SP, #8 ' CALL addrg
 adds r17, r19 ' ADDI/P (2)
 subs r15, r19 ' SUBI/P (1)
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_19 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_29
 adds r11, r19 ' ADDI/P (2)
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r11 ' CVI, CVU or LOAD
 mov r5, r17 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sh343_67da3dd0_q3exchange_L000006
 add SP, #12 ' CALL addrg
 adds r13, r19 ' ADDI/P (2)
 mov r17, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_28 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_27
 cmps r9,  #0 wz
 jmp #BRNZ
 long @C_sh34_67da3dd0_qsort1_L000003_31 ' NEI4
 adds r11, r19 ' ADDI/P (2)
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r11 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sh342_67da3dd0_qexchange_L000005
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_32 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_31
 subs r15, r19 ' SUBI/P (1)
C_sh34_67da3dd0_qsort1_L000003_32
C_sh34_67da3dd0_qsort1_L000003_28
C_sh34_67da3dd0_qsort1_L000003_25
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r11 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_sh34_67da3dd0_qsort1_L000003_24 ' GTU4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_sh34_67da3dd0_qsort1_L000003_33 ' GEU4
 subs r13, r19 ' SUBI/P (1)
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sh343_67da3dd0_q3exchange_L000006
 add SP, #12 ' CALL addrg
 subs r11, r19 ' SUBI/P (1)
 mov r15, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_19 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_33
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r13 ' SUBI/P
 subs r3, r19 ' SUBI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sh34_67da3dd0_qsort1_L000003
 add SP, #8 ' CALL addrg
 mov r23, r19 ' ADDI/P
 adds r23, r11 ' ADDI/P (3)
 jmp #JMPA
 long @C_sh34_67da3dd0_qsort1_L000003_11 ' JUMPV addrg
C_sh34_67da3dd0_qsort1_L000003_10
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sh342_67da3dd0_qexchange_L000005 ' <symbol:qexchange>
 jmp #PSHM
 long $d00000 ' save registers
 jmp #JMPA
 long @C_sh342_67da3dd0_qexchange_L000005_37 ' JUMPV addrg
C_sh342_67da3dd0_qexchange_L000005_36
 mov r22, r4 ' CVI, CVU or LOAD
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 mov r23, r20 ' CVUI
 and r23, cviu_m1 ' zero extend
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 rdbyte r20, r3 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sh342_67da3dd0_qexchange_L000005_37
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22
 sub r2, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sh342_67da3dd0_qexchange_L000005_36 ' NEU4
' C_sh342_67da3dd0_qexchange_L000005_35 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sh343_67da3dd0_q3exchange_L000006 ' <symbol:q3exchange>
 jmp #PSHM
 long $d00000 ' save registers
 jmp #JMPA
 long @C_sh343_67da3dd0_q3exchange_L000006_41 ' JUMPV addrg
C_sh343_67da3dd0_q3exchange_L000006_40
 mov r22, r5 ' CVI, CVU or LOAD
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 mov r23, r20 ' CVUI
 and r23, cviu_m1 ' zero extend
 mov r5, r22
 adds r5, #1 ' ADDP4 coni
 rdbyte r20, r3 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r20, r4 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
C_sh343_67da3dd0_q3exchange_L000006_41
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22
 sub r2, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sh343_67da3dd0_q3exchange_L000006_40 ' NEU4
' C_sh343_67da3dd0_q3exchange_L000006_39 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sh341_67da3dd0_qcompar_L000004 ' <symbol:qcompar>
 byte 0[4]

' Catalina Code

DAT ' code segment
' end
