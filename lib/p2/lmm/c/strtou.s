' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _strtou

 alignl ' align long
C__strtou ' <symbol:_strtou>
 jmp #NEWF
 jmp #PSHM
 long $eaa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r11, #0 ' reg <- coni
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C__strtou_5 ' JUMPV addrg
C__strtou_4
 adds r23, #1 ' ADDP4 coni
C__strtou_5
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BR_Z
 long @C__strtou_4 ' EQI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #120 wz
 jmp #BRNZ
 long @C__strtou_13 ' NEI4
 cmps r19,  #16 wz
 jmp #BRNZ
 long @C__strtou_13 ' NEI4
 adds r23, #1 ' ADDP4 coni
 jmp #JMPA
 long @C__strtou_10 ' JUMPV addrg
C__strtou_9
 adds r23, #1 ' ADDP4 coni
C__strtou_10
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BR_Z
 long @C__strtou_9 ' EQI4
 jmp #JMPA
 long @C__strtou_13 ' JUMPV addrg
C__strtou_12
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_tonumber ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15, r19 wcz
 jmp #BR_A
 long @C__strtou_17 ' GTI4
 cmps r15,  #0 wcz
 jmp #BRAE
 long @C__strtou_15 ' GEI4
C__strtou_17
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C__strtou_3 ' JUMPV addrg
C__strtou_15
 mov r13, r17 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 add r17, r22 ' ADDU (1)
 cmp r13, r17 wcz 
 jmp #BRBE
 long @C__strtou_18 ' LEU4
 mov r11, #1 ' reg <- coni
C__strtou_18
C__strtou_13
 mov r2, r19 ' CVI, CVU or LOAD
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_isnumber
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C__strtou_12 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__strtou_20 ' EQU4
 wrlong r23, r21 ' ASGNP4 reg reg
C__strtou_20
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C__strtou_22 ' EQI4
 jmp #LODL
 long $7fffffff
 mov r17, RI ' reg <- con
C__strtou_22
 mov r0, r17 ' CVI, CVU or LOAD
C__strtou_3
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import tonumber

' Catalina Import isnumber
' end
