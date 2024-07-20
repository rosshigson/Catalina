' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export strncmp

 alignl ' align long
C_strncmp ' <symbol:strncmp>
 jmp #PSHM
 long $500000 ' save registers
 cmp r2,  #0 wz
 jmp #BR_Z
 long @C_strncmp_2 ' EQU4
C_strncmp_4
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov RI, r4
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_strncmp_7 ' EQI4
 jmp #JMPA
 long @C_strncmp_6 ' JUMPV addrg
C_strncmp_7
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strncmp_9 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_strncmp_1 ' JUMPV addrg
C_strncmp_9
' C_strncmp_5 ' (symbol refcount = 0)
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_strncmp_4 ' NEU4
C_strncmp_6
 cmp r2,  #0 wz
 jmp #BR_Z
 long @C_strncmp_11 ' EQU4
 mov RI, r4
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strncmp_13 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_strncmp_1 ' JUMPV addrg
C_strncmp_13
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r22, r3 ' ADDI/P (2)
 mov r3, r22 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strncmp_15 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_strncmp_1 ' JUMPV addrg
C_strncmp_15
 mov RI, r4
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, r3
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' SUBI/P
 subs r0, r20 ' SUBI/P (3)
 jmp #JMPA
 long @C_strncmp_1 ' JUMPV addrg
C_strncmp_11
C_strncmp_2
 mov r0, #0 ' reg <- coni
C_strncmp_1
 jmp #POPM ' restore registers
 jmp #RETN

' end
