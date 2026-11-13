' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strcpy

 alignl ' align long
C_strcpy ' <symbol:strcpy>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
C_strcpy_2
' C_strcpy_3 ' (symbol refcount = 0)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, r2 ' CVI, CVU or LOAD
 mov r2, r20
 adds r2, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_strcpy_2 ' NEI4
 mov r0, r3 ' CVI, CVU or LOAD
' C_strcpy_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
