' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strcspn

 alignl ' align long
C_strcspn ' <symbol:strcspn>
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #\@C_strcspn_5 ' JUMPV addrg
C_strcspn_2
 mov r21, r2 ' CVI, CVU or LOAD
 jmp #\@C_strcspn_9 ' JUMPV addrg
C_strcspn_6
' C_strcspn_7 ' (symbol refcount = 0)
 adds r21, #1 ' ADDP4 coni
C_strcspn_9
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 rdbyte r20, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_z jmp #\C_strcspn_10 ' EQI4
 cmps r22,  #0 wz
 if_nz jmp #\C_strcspn_6 ' NEI4
C_strcspn_10
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_strcspn_11 ' EQI4
 jmp #\@C_strcspn_4 ' JUMPV addrg
C_strcspn_11
' C_strcspn_3 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
C_strcspn_5
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_strcspn_2 ' NEI4
C_strcspn_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_strcspn_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
