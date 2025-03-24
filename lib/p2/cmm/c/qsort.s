' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export qsort

 alignl ' align long
C_qsort ' <symbol:qsort>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_qsort_8)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_qsort_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_qsort_8
 alignl ' align long
 long I32_LODA + (@C_sa9k1_67da3fe1_qcompar_L000004)<<S32
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r3)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sa9k_67da3fe1_qsort1_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_qsort_7
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003 ' <symbol:qsort1>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_11
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sa9k_67da3fe1_qsort1_L000003_15)<<S32 ' GTU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_10)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_15
 word I16A_MOV + (r17)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_ADD + (r22)<<D16A + (r19)<<S16A ' ADDU (1)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r1)<<D16A + (r0)<<S16A ' setup r0/r1 (1)
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (1)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_19)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_18
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sa9k_67da3fe1_qsort1_L000003_21)<<S32 ' GEI4 reg coni
 word I16A_ADDS + (r17)<<D16A + (r19)<<S16A ' ADDI/P (2)
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_22)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_21
 word I16A_SUBS + (r13)<<D16A + (r19)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sa9k2_67da3fe1_qexchange_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_22
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_19
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sa9k_67da3fe1_qsort1_L000003_23)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sa9k1_67da3fe1_qcompar_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_CALI
 alignl ' align long
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL indirect
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_sa9k_67da3fe1_qsort1_L000003_18)<<S32 ' LEI4 reg coni
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_23
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_25)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_24
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODI + (@C_sa9k1_67da3fe1_qcompar_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_CALI
 alignl ' align long
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL indirect
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sa9k_67da3fe1_qsort1_L000003_27)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sa9k_67da3fe1_qsort1_L000003_29)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sa9k2_67da3fe1_qexchange_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_ADDS + (r17)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_SUBS + (r15)<<D16A + (r19)<<S16A ' SUBI/P (1)
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_19)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_29
 word I16A_ADDS + (r11)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_sa9k3_67da3fe1_q3exchange_L000006)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_ADDS + (r13)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r17)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_28)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_27
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sa9k_67da3fe1_qsort1_L000003_31)<<S32 ' NEI4 reg coni
 word I16A_ADDS + (r11)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sa9k2_67da3fe1_qexchange_L000005)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_32)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_31
 word I16A_SUBS + (r15)<<D16A + (r19)<<S16A ' SUBI/P (1)
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_32
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_28
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_25
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sa9k_67da3fe1_qsort1_L000003_24)<<S32 ' GTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_sa9k_67da3fe1_qsort1_L000003_33)<<S32 ' GEU4 reg reg
 word I16A_SUBS + (r13)<<D16A + (r19)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_sa9k3_67da3fe1_q3exchange_L000006)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_SUBS + (r11)<<D16A + (r19)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r15)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_19)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_33
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' SUBI/P
 word I16A_SUBS + (r3)<<D16A + (r19)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_sa9k_67da3fe1_qsort1_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r11)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_sa9k_67da3fe1_qsort1_L000003_11)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k_67da3fe1_qsort1_L000003_10
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sa9k2_67da3fe1_qexchange_L000005 ' <symbol:qexchange>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl ' align long
 long I32_JMPA + (@C_sa9k2_67da3fe1_qexchange_L000005_37)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k2_67da3fe1_qexchange_L000005_36
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r23)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sa9k2_67da3fe1_qexchange_L000005_37
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r2)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sa9k2_67da3fe1_qexchange_L000005_36)<<S32 ' NEU4 reg coni
' C_sa9k2_67da3fe1_qexchange_L000005_35 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sa9k3_67da3fe1_q3exchange_L000006 ' <symbol:q3exchange>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl ' align long
 long I32_JMPA + (@C_sa9k3_67da3fe1_q3exchange_L000006_41)<<S32 ' JUMPV addrg
 alignl ' align long
C_sa9k3_67da3fe1_q3exchange_L000006_40
 word I16A_MOV + (r22)<<D16A + (r5)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r23)<<D16A + (r20)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r5)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r4)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_sa9k3_67da3fe1_q3exchange_L000006_41
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r2)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sa9k3_67da3fe1_q3exchange_L000006_40)<<S32 ' NEU4 reg coni
' C_sa9k3_67da3fe1_q3exchange_L000006_39 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_sa9k1_67da3fe1_qcompar_L000004 ' <symbol:qcompar>
 byte 0[4]

' Catalina Code

DAT ' code segment
' end
