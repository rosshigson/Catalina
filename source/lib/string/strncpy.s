' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strncpy

 alignl ' align long
C_strncpy ' <symbol:strncpy>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r4 ' CVI, CVU or LOAD
 cmp r2,  #0 wz
 if_z jmp #\C_strncpy_2 ' EQU4
C_strncpy_4
' C_strncpy_5 ' (symbol refcount = 0)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r3 ' CVI, CVU or LOAD
 mov r3, r20
 adds r3, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_strncpy_7 ' EQI4
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_strncpy_4  ' NEU4
C_strncpy_7
 mov r22, ##-1 ' reg <- con
 adds r22, r3 ' ADDI/P (2)
 mov r3, r22 ' CVI, CVU or LOAD
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strncpy_8 ' NEI4
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_strncpy_8 ' EQU4
C_strncpy_10
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_strncpy_11 ' (symbol refcount = 0)
 mov r22, r2
 sub r22, #1 ' SUBU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_strncpy_10  ' NEU4
C_strncpy_8
C_strncpy_2
 mov r0, r4 ' CVI, CVU or LOAD
' C_strncpy_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
