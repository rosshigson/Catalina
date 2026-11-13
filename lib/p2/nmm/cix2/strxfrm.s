' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strxfrm

 alignl ' align long
C_strxfrm ' <symbol:strxfrm>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #\@C_strxfrm_3 ' JUMPV addrg
C_strxfrm_2
 cmp r2,  #1 wcz 
 if_be jmp #\C_strxfrm_5 ' LEU4
 sub r2, #1 ' SUBU4 coni
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov r23, r20
 adds r23, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_strxfrm_6 ' JUMPV addrg
C_strxfrm_5
 adds r23, #1 ' ADDP4 coni
C_strxfrm_6
C_strxfrm_3
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strxfrm_2 ' NEI4
 cmp r2,  #0 wz
 if_z jmp #\C_strxfrm_7 ' EQU4
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_strxfrm_7
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_strxfrm_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
