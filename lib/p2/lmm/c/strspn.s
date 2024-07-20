' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strspn

 alignl ' align long
C_strspn ' <symbol:strspn>
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strspn_5 ' JUMPV addrg
C_strspn_2
 mov r21, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_strspn_9 ' JUMPV addrg
C_strspn_6
' C_strspn_7 ' (symbol refcount = 0)
 adds r21, #1 ' ADDP4 coni
C_strspn_9
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_strspn_10 ' EQI4
 rdbyte r20, r23 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_strspn_6 ' NEI4
C_strspn_10
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strspn_11 ' NEI4
 jmp #JMPA
 long @C_strspn_4 ' JUMPV addrg
C_strspn_11
' C_strspn_3 ' (symbol refcount = 0)
 adds r23, #1 ' ADDP4 coni
C_strspn_5
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_strspn_2 ' NEI4
C_strspn_4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r3 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_strspn_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
