' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export memmove

 alignl ' align long
C_memmove ' <symbol:memmove>
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 mov r21, r3 ' CVI, CVU or LOAD
 cmp r2,  #0 wz
 if_z jmp #\C_memmove_2 ' EQU4
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r20, r23 wcz 
 if_a jmp #\C_memmove_4 ' GTU4
 mov r20, r2 ' ADDI/P
 adds r20, r21 ' ADDI/P (3)
 cmp r20, r23 wcz 
 if_be jmp #\C_memmove_4 ' LEU4
 adds r23, r2 ' ADDI/P (2)
 adds r21, r2 ' ADDI/P (2)
 add r2, #1 ' ADDU4 coni
 jmp #\@C_memmove_7 ' JUMPV addrg
C_memmove_6
 mov r22, ##-1 ' reg <- con
 mov r20, r23 ' ADDI/P
 adds r20, r22 ' ADDI/P (3)
 mov r23, r20 ' CVI, CVU or LOAD
 adds r22, r21 ' ADDI/P (2)
 mov r21, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r20 ' ASGNU1 reg reg
C_memmove_7
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_memmove_6  ' NEU4
 jmp #\@C_memmove_5 ' JUMPV addrg
C_memmove_4
 add r2, #1 ' ADDU4 coni
 jmp #\@C_memmove_10 ' JUMPV addrg
C_memmove_9
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_memmove_10
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_memmove_9  ' NEU4
C_memmove_5
C_memmove_2
 mov r0, r4 ' CVI, CVU or LOAD
' C_memmove_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
