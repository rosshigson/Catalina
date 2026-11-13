' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export strcspn

 alignl ' align long
C_strcspn ' <symbol:strcspn>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strcspn_5 ' JUMPV addrg
C_strcspn_2
 mov r21, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strcspn_9 ' JUMPV addrg
C_strcspn_6
' C_strcspn_7 ' (symbol refcount = 0)
 adds r21, #1 ' ADDP4 coni
C_strcspn_9
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, r23
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_strcspn_10 ' EQI4
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strcspn_6 ' NEI4
C_strcspn_10
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_strcspn_11 ' EQI4
 jmp #JMPA
 long @C_strcspn_4 ' JUMPV addrg
C_strcspn_11
' C_strcspn_3 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
C_strcspn_5
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strcspn_2 ' NEI4
C_strcspn_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_strcspn_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
