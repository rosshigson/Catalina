' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _strtoi

 alignl ' align long
C__strtoi ' <symbol:_strtoi>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $eaa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r11, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 PRIMITIVE(#BRNZ)
 long @C__strtoi_4 ' NEI4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__strtoi_9 ' JUMPV addrg
C__strtoi_4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 PRIMITIVE(#BRNZ)
 long @C__strtoi_6 ' NEI4
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C__strtoi_9 ' JUMPV addrg
C__strtoi_6
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__strtoi_9 ' JUMPV addrg
C__strtoi_8
 adds r23, #1 ' ADDP4 coni
C__strtoi_9
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 PRIMITIVE(#BR_Z)
 long @C__strtoi_8 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__strtoi_12 ' JUMPV addrg
C__strtoi_11
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_tonumber ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15, r19 wcz
 PRIMITIVE(#BR_A)
 long @C__strtoi_16 ' GTI4
 cmps r15,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C__strtoi_14 ' GEI4
C__strtoi_16
 mov r0, #0 ' RET coni
 PRIMITIVE(#JMPA)
 long @C__strtoi_3 ' JUMPV addrg
C__strtoi_14
 mov r13, r17 ' CVI, CVU or LOAD
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r17, r0 ' CVI, CVU or LOAD
 adds r17, r15 ' ADDI/P (1)
 cmps r13, r17 wcz
 PRIMITIVE(#BRBE)
 long @C__strtoi_17 ' LEI4
 mov r11, #1 ' reg <- coni
C__strtoi_17
C__strtoi_12
 mov r2, r19 ' CVI, CVU or LOAD
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_isnumber
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__strtoi_11 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__strtoi_19 ' EQU4
 wrlong r23, r21 ' ASGNP4 reg reg
C__strtoi_19
 cmps r11,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__strtoi_21 ' EQI4
 PRIMITIVE(#LODL)
 long 2147483647
 mov r17, RI ' reg <- con
C__strtoi_21
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r0, r17 ' CVI, CVU or LOAD
C__strtoi_3
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import tonumber

' Catalina Import isnumber
' end
