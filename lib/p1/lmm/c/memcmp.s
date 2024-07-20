' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export memcmp

 alignl ' align long
C_memcmp ' <symbol:memcmp>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 mov r21, r3 ' CVI, CVU or LOAD
 cmp r2,  #0 wz
 jmp #BR_Z
 long @C_memcmp_2 ' EQU4
 add r2, #1 ' ADDU4 coni
 jmp #JMPA
 long @C_memcmp_5 ' JUMPV addrg
C_memcmp_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_memcmp_7 ' NEI4
 jmp #JMPA
 long @C_memcmp_5 ' JUMPV addrg
C_memcmp_7
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r20, r23 ' ADDI/P
 adds r20, r22 ' ADDI/P (3)
 mov r23, r20 ' CVI, CVU or LOAD
 adds r22, r21 ' ADDI/P (2)
 mov r21, r22 ' CVI, CVU or LOAD
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r20 ' SUBI/P
 subs r0, r22 ' SUBI/P (3)
 jmp #JMPA
 long @C_memcmp_1 ' JUMPV addrg
C_memcmp_5
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_memcmp_4 ' NEU4
C_memcmp_2
 mov r0, #0 ' RET coni
C_memcmp_1
 jmp #POPM ' restore registers
 jmp #RETN

' end
