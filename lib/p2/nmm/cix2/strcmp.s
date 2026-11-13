' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strcmp

 alignl ' align long
C_strcmp ' <symbol:strcmp>
 calld PA,#PSHM
 long $500000 ' save registers
 jmp #\@C_strcmp_3 ' JUMPV addrg
C_strcmp_2
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strcmp_5 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_strcmp_1 ' JUMPV addrg
C_strcmp_5
C_strcmp_3
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22
 adds r2, #1 ' ADDP4 coni
 rdbyte r20, r3 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_z jmp #\C_strcmp_2 ' EQI4
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strcmp_7 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_strcmp_1 ' JUMPV addrg
C_strcmp_7
 mov r22, ##-1 ' reg <- con
 adds r22, r2 ' ADDI/P (2)
 mov r2, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strcmp_9 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_strcmp_1 ' JUMPV addrg
C_strcmp_9
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r20, r2 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
C_strcmp_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
