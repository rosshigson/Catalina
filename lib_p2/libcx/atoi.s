' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export atoi

 alignl ' align long
C_atoi ' <symbol:atoi>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_atoi_3 ' JUMPV addrg
C_atoi_2
 adds r23, #1 ' ADDP4 coni
C_atoi_3
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
 long @C_atoi_2 ' NEI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 PRIMITIVE(#BRNZ)
 long @C_atoi_6 ' NEI4
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C_atoi_11 ' JUMPV addrg
C_atoi_6
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 PRIMITIVE(#BRNZ)
 long @C_atoi_11 ' NEI4
 mov r22, #1 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#JMPA)
 long @C_atoi_11 ' JUMPV addrg
C_atoi_10
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 adds r21, r22 ' ADDI/P (1)
C_atoi_11
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 PRIMITIVE(#BR_B)
 long @C_atoi_10' LTU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_atoi_14 ' EQI4
 neg r19, r21 ' NEGI4
 PRIMITIVE(#JMPA)
 long @C_atoi_15 ' JUMPV addrg
C_atoi_14
 mov r19, r21 ' CVI, CVU or LOAD
C_atoi_15
 mov r0, r19 ' CVI, CVU or LOAD
' C_atoi_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import __ctype
' end
