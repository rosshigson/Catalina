' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strcat

 alignl ' align long
C_strcat ' <symbol:strcat>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
C_strcat_2
' C_strcat_3 ' (symbol refcount = 0)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strcat_2 ' NEI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 adds r23, r22 ' ADDI/P (1)
C_strcat_5
' C_strcat_6 ' (symbol refcount = 0)
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
 jmp #BRNZ
 long @C_strcat_5 ' NEI4
 mov r0, r3 ' CVI, CVU or LOAD
' C_strcat_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
