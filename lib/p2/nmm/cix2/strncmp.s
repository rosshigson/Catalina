' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strncmp

 alignl ' align long
C_strncmp ' <symbol:strncmp>
 calld PA,#PSHM
 long $500000 ' save registers
 cmp r2,  #0 wz
 if_z jmp #\C_strncmp_2 ' EQU4
C_strncmp_4
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r20, r4 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_z jmp #\C_strncmp_7 ' EQI4
 jmp #\@C_strncmp_6 ' JUMPV addrg
C_strncmp_7
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strncmp_9 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_strncmp_1 ' JUMPV addrg
C_strncmp_9
' C_strncmp_5 ' (symbol refcount = 0)
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_strncmp_4  ' NEU4
C_strncmp_6
 cmp r2,  #0 wz
 if_z jmp #\C_strncmp_11 ' EQU4
 rdbyte r22, r4 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strncmp_13 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_strncmp_1 ' JUMPV addrg
C_strncmp_13
 mov r22, ##-1 ' reg <- con
 adds r22, r3 ' ADDI/P (2)
 mov r3, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strncmp_15 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_strncmp_1 ' JUMPV addrg
C_strncmp_15
 rdbyte r22, r4 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r20, r3 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
 jmp #\@C_strncmp_1 ' JUMPV addrg
C_strncmp_11
C_strncmp_2
 mov r0, #0 ' reg <- coni
C_strncmp_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
