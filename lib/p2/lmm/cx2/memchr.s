' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export memchr

 alignl ' align long
C_memchr ' <symbol:memchr>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 cmp r2,  #0 wz
 jmp #BR_Z
 long @C_memchr_2 ' EQU4
 add r2, #1 ' ADDU4 coni
 jmp #JMPA
 long @C_memchr_5 ' JUMPV addrg
C_memchr_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r3 wz
 jmp #BR_Z
 long @C_memchr_7 ' EQI4
 jmp #JMPA
 long @C_memchr_5 ' JUMPV addrg
C_memchr_7
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov r23, r22 ' CVI, CVU or LOAD
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_memchr_1 ' JUMPV addrg
C_memchr_5
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_memchr_4 ' NEU4
C_memchr_2
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_memchr_1
 jmp #POPM ' restore registers
 jmp #RETN

' end
