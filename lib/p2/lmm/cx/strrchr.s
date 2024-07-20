' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strrchr

 alignl ' align long
C_strrchr ' <symbol:strrchr>
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODL
 long 0
 mov r23, RI ' reg <- con
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
C_strrchr_2
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r2, r22 wz
 jmp #BRNZ
 long @C_strrchr_5 ' NEI4
 mov r23, r3 ' CVI, CVU or LOAD
C_strrchr_5
' C_strrchr_3 ' (symbol refcount = 0)
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strrchr_2 ' NEI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_strrchr_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
