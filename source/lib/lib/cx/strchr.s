' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strchr

 alignl ' align long
C_strchr ' <symbol:strchr>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 jmp #\@C_strchr_3 ' JUMPV addrg
C_strchr_2
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strchr_5 ' NEI4
 mov r0, ##0 ' RET con
 jmp #\@C_strchr_1 ' JUMPV addrg
C_strchr_5
C_strchr_3
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r2, r22 wz
 if_nz jmp #\C_strchr_2 ' NEI4
 mov r0, r3 ' CVI, CVU or LOAD
C_strchr_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
