' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strlen

 alignl ' align long
C_strlen ' <symbol:strlen>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' CVI, CVU or LOAD
C_strlen_2
' C_strlen_3 ' (symbol refcount = 0)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strlen_2 ' NEI4
 mov r22, ##-1 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov r23, r22 ' CVI, CVU or LOAD
 mov r20, r2 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_strlen_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
