' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strchr

 alignl ' align long
C_strchr ' <symbol:strchr>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_strchr_3 ' JUMPV addrg
C_strchr_2
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strchr_5 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_strchr_1 ' JUMPV addrg
C_strchr_5
C_strchr_3
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r2, r22 wz
 jmp #BRNZ
 long @C_strchr_2 ' NEI4
 mov r0, r3 ' CVI, CVU or LOAD
C_strchr_1
 jmp #POPM ' restore registers
 jmp #RETN

' end
