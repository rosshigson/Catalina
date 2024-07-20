' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export strncat

 alignl ' align long
C_strncat ' <symbol:strncat>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 cmp r2,  #0 wz
 jmp #BR_Z
 long @C_strncat_2 ' EQU4
C_strncat_4
' C_strncat_5 ' (symbol refcount = 0)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strncat_4 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r23, r22 ' ADDI/P (1)
 jmp #JMPA
 long @C_strncat_8 ' JUMPV addrg
C_strncat_7
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_strncat_10 ' EQU4
 jmp #JMPA
 long @C_strncat_8 ' JUMPV addrg
C_strncat_10
 mov r22, #0 ' reg <- coni
 mov RI, r23
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_strncat_9 ' JUMPV addrg
C_strncat_8
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r3 ' CVI, CVU or LOAD
 mov r3, r20
 adds r3, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strncat_7 ' NEI4
C_strncat_9
 mov r0, r4 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strncat_1 ' JUMPV addrg
C_strncat_2
 mov r0, r23 ' CVI, CVU or LOAD
C_strncat_1
 jmp #POPM ' restore registers
 jmp #RETN

' end
