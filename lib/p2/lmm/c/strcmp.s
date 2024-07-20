' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strcmp

 alignl ' align long
C_strcmp ' <symbol:strcmp>
 jmp #PSHM
 long $500000 ' save registers
 jmp #JMPA
 long @C_strcmp_3 ' JUMPV addrg
C_strcmp_2
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strcmp_5 ' NEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_strcmp_1 ' JUMPV addrg
C_strcmp_5
C_strcmp_3
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22
 adds r2, #1 ' ADDP4 coni
 rdbyte r20, r3 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_strcmp_2 ' EQI4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strcmp_7 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_strcmp_1 ' JUMPV addrg
C_strcmp_7
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r2 ' ADDI/P (2)
 mov r2, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strcmp_9 ' NEI4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_strcmp_1 ' JUMPV addrg
C_strcmp_9
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 rdbyte r20, r2 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
C_strcmp_1
 jmp #POPM ' restore registers
 jmp #RETN

' end
