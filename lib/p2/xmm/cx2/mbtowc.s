' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export mbtowc

 alignl ' align long
C_mbtowc ' <symbol:mbtowc>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_mbtowc_4 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_mbtowc_3 ' JUMPV addrg
C_mbtowc_4
 cmp r2,  #0 wz
 jmp #BRNZ
 long @C_mbtowc_6 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_mbtowc_3 ' JUMPV addrg
C_mbtowc_6
 mov r22, r4 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_mbtowc_8 ' EQU4
 mov RI, r3
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, r4
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C_mbtowc_8
 mov RI, r3
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_mbtowc_11 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_mbtowc_12 ' JUMPV addrg
C_mbtowc_11
 mov r23, #0 ' reg <- coni
C_mbtowc_12
 mov r0, r23 ' CVI, CVU or LOAD
C_mbtowc_3
 jmp #POPM ' restore registers
 jmp #RETN

' end
