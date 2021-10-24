' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strtol

 alignl ' align long
C_strtol ' <symbol:strtol>
 PRIMITIVE(#PSHM)
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_sch4_6174acf1_string2long_L000003
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_strtol_4 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export strtoul

 alignl ' align long
C_strtoul ' <symbol:strtoul>
 PRIMITIVE(#PSHM)
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_sch4_6174acf1_string2long_L000003
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_strtoul_5 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


 alignl ' align long
C_sch4_6174acf1_string2long_L000003 ' <symbol:string2long>
 PRIMITIVE(#NEWF)
 sub SP, #12
 PRIMITIVE(#PSHM)
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r13, #0 ' reg <- coni
 mov r9, #0 ' reg <- coni
 mov r7, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -8
 wrlong r23, RI ' ASGNP4 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_10 ' EQU4
 wrlong r23, r21 ' ASGNP4 reg reg
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_10 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_9
 adds r23, #1 ' ADDP4 coni
C_sch4_6174acf1_string2long_L000003_10
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_9 ' NEI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r11, r22 ' CVUI
 and r11, cviu_m1 ' zero extend
 cmps r11,  #45 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_15 ' EQI4
 cmps r11,  #43 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_13 ' NEI4
C_sch4_6174acf1_string2long_L000003_15
 cmps r11,  #45 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_16 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r7, RI ' reg <- con
C_sch4_6174acf1_string2long_L000003_16
 adds r23, #1 ' ADDP4 coni
C_sch4_6174acf1_string2long_L000003_13
 PRIMITIVE(#LODF)
 long -4
 wrlong r23, RI ' ASGNP4 addrl reg
 cmps r19,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_18 ' NEI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_20 ' NEI4
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_24 ' EQI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #88 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_22 ' NEI4
C_sch4_6174acf1_string2long_L000003_24
 mov r19, #16 ' reg <- coni
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_29 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_22
 mov r19, #8 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_29 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_20
 mov r19, #10 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_29 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_18
 cmps r19,  #16 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_29 ' NEI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_29 ' NEI4
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_27 ' EQI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #88 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_29 ' NEI4
C_sch4_6174acf1_string2long_L000003_27
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_29 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_28
 cmps r9,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_32 ' NEI4
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r11 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_34 ' EQI4
 mov r22, r11
 subs r22, #65 ' SUBI4 coni
 cmp r22,  #26 wcz 
 PRIMITIVE(#BRAE)
 long @C_sch4_6174acf1_string2long_L000003_38 ' GEU4
 mov r22, r11
 subs r22, #65 ' SUBI4 coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_39 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_38
 mov r22, r11
 subs r22, #97 ' SUBI4 coni
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_sch4_6174acf1_string2long_L000003_39
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #10 ' ADDI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_35 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_34
 mov r22, r11
 subs r22, #48 ' SUBI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
C_sch4_6174acf1_string2long_L000003_35
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r15, r22 wcz 
 PRIMITIVE(#BR_B)
 long @C_sch4_6174acf1_string2long_L000003_40' LTU4
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_30 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_40
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r22, RI ' reg <- con
 sub r22, r15 ' SUBU (1)
 mov r20, r19 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVU) ' DIVU
 cmp r13, r0 wcz 
 PRIMITIVE(#BRBE)
 long @C_sch4_6174acf1_string2long_L000003_42 ' LEU4
 adds r9, #1 ' ADDI4 coni
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_43 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_42
 mov r22, r19 ' CVI, CVU or LOAD
 mov r0, r13 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r13, r0 ' ADDU
 add r13, r15 ' ADDU (3)
C_sch4_6174acf1_string2long_L000003_43
C_sch4_6174acf1_string2long_L000003_32
 adds r23, #1 ' ADDP4 coni
C_sch4_6174acf1_string2long_L000003_29
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r11, r22 ' CVI, CVU or LOAD
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 PRIMITIVE(#BR_B)
 long @C_sch4_6174acf1_string2long_L000003_28' LTU4
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r11 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #3 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_28 ' NEI4
C_sch4_6174acf1_string2long_L000003_30
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_44 ' EQU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_46 ' NEU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_47 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_46
 wrlong r23, r21 ' ASGNP4 reg reg
C_sch4_6174acf1_string2long_L000003_47
C_sch4_6174acf1_string2long_L000003_44
 cmps r9,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_sch4_6174acf1_string2long_L000003_48 ' NEI4
 mov r22, #0 ' reg <- coni
 cmps r17, r22 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_50 ' EQI4
 cmps r7, r22 wcz
 PRIMITIVE(#BRAE)
 long @C_sch4_6174acf1_string2long_L000003_53 ' GEI4
 PRIMITIVE(#LODL)
 long $80000000
 mov r22, RI ' reg <- con
 cmp r13, r22 wcz 
 PRIMITIVE(#BR_A)
 long @C_sch4_6174acf1_string2long_L000003_52 ' GTU4
C_sch4_6174acf1_string2long_L000003_53
 cmps r7,  #0 wcz
 PRIMITIVE(#BRBE)
 long @C_sch4_6174acf1_string2long_L000003_50 ' LEI4
 PRIMITIVE(#LODL)
 long $7fffffff
 mov r22, RI ' reg <- con
 cmp r13, r22 wcz 
 PRIMITIVE(#BRBE)
 long @C_sch4_6174acf1_string2long_L000003_50 ' LEU4
C_sch4_6174acf1_string2long_L000003_52
 adds r9, #1 ' ADDI4 coni
C_sch4_6174acf1_string2long_L000003_50
C_sch4_6174acf1_string2long_L000003_48
 cmps r9,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_54 ' EQI4
 mov r22, #34 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 cmps r17,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_sch4_6174acf1_string2long_L000003_56 ' EQI4
 cmps r7,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_sch4_6174acf1_string2long_L000003_58 ' GEI4
 PRIMITIVE(#LODL)
 long $80000000
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_6 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_58
 PRIMITIVE(#LODL)
 long $7fffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_6 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_56
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_sch4_6174acf1_string2long_L000003_6 ' JUMPV addrg
C_sch4_6174acf1_string2long_L000003_54
 mov r22, r7 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
C_sch4_6174acf1_string2long_L000003_6
 PRIMITIVE(#POPM) ' restore registers
 add SP, #12 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import errno

' Catalina Import __ctype
' end
