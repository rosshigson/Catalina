' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strpbrk

 alignl ' align long
C_strpbrk ' <symbol:strpbrk>
 calld PA,#PSHM
 long $d00000 ' save registers
 jmp #\@C_strpbrk_3 ' JUMPV addrg
C_strpbrk_2
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #\@C_strpbrk_8 ' JUMPV addrg
C_strpbrk_5
' C_strpbrk_6 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
C_strpbrk_8
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_strpbrk_9 ' EQI4
 rdbyte r20, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_nz jmp #\C_strpbrk_5 ' NEI4
C_strpbrk_9
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_strpbrk_10 ' EQI4
 mov r0, r3 ' CVI, CVU or LOAD
 jmp #\@C_strpbrk_1 ' JUMPV addrg
C_strpbrk_10
 adds r3, #1 ' ADDP4 coni
C_strpbrk_3
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strpbrk_2 ' NEI4
 mov r0, ##0 ' RET con
C_strpbrk_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
