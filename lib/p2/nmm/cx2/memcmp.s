' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export memcmp

 alignl ' align long
C_memcmp ' <symbol:memcmp>
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 mov r21, r3 ' CVI, CVU or LOAD
 cmp r2,  #0 wz
 if_z jmp #\C_memcmp_2 ' EQU4
 add r2, #1 ' ADDU4 coni
 jmp #\@C_memcmp_5 ' JUMPV addrg
C_memcmp_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_nz jmp #\C_memcmp_7 ' NEI4
 jmp #\@C_memcmp_5 ' JUMPV addrg
C_memcmp_7
 mov r22, ##-1 ' reg <- con
 mov r20, r23 ' ADDI/P
 adds r20, r22 ' ADDI/P (3)
 mov r23, r20 ' CVI, CVU or LOAD
 adds r22, r21 ' ADDI/P (2)
 mov r21, r22 ' CVI, CVU or LOAD
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r20 ' SUBI/P
 subs r0, r22 ' SUBI/P (3)
 jmp #\@C_memcmp_1 ' JUMPV addrg
C_memcmp_5
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_memcmp_4  ' NEU4
C_memcmp_2
 mov r0, #0 ' reg <- coni
C_memcmp_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
