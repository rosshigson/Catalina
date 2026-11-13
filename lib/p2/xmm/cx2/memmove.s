' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export memmove

 alignl ' align long
C_memmove ' <symbol:memmove>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 mov r21, r3 ' CVI, CVU or LOAD
 cmp r2,  #0 wz
 jmp #BR_Z
 long @C_memmove_2 ' EQU4
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r23 wz,wc 
 jmp #BR_A
 long @C_memmove_4 ' GTU4
 mov r20, r2 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 cmp r20, r23 wz,wc 
 jmp #BRBE
 long @C_memmove_4 ' LEU4
 adds r23, r2 ' ADDI/P (2)
 adds r21, r2 ' ADDI/P (2)
 add r2, #1 ' ADDU4 coni
 jmp #JMPA
 long @C_memmove_7 ' JUMPV addrg
C_memmove_6
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov r20, r23 ' ADDI/P
 adds r20, r22 ' ADDI/P (3)
 mov r23, r20 ' CVI, CVU or LOAD
 adds r22, r21 ' ADDI/P (2)
 mov r21, r22 ' CVI, CVU or LOAD
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C_memmove_7
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_memmove_6 ' NEU4
 jmp #JMPA
 long @C_memmove_5 ' JUMPV addrg
C_memmove_4
 add r2, #1 ' ADDU4 coni
 jmp #JMPA
 long @C_memmove_10 ' JUMPV addrg
C_memmove_9
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_memmove_10
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_memmove_9 ' NEU4
C_memmove_5
C_memmove_2
 mov r0, r4 ' CVI, CVU or LOAD
' C_memmove_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
