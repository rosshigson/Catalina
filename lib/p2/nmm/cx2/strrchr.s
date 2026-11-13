' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strrchr

 alignl ' align long
C_strrchr ' <symbol:strrchr>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, ##0 ' reg <- con
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
C_strrchr_2
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r2, r22 wz
 if_nz jmp #\C_strrchr_5 ' NEI4
 mov r23, r3 ' CVI, CVU or LOAD
C_strrchr_5
' C_strrchr_3 ' (symbol refcount = 0)
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strrchr_2 ' NEI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_strrchr_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
