' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export mbtowc

 alignl ' align long
C_mbtowc ' <symbol:mbtowc>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_mbtowc_4  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_mbtowc_3 ' JUMPV addrg
C_mbtowc_4
 cmp r2,  #0 wz
 if_nz jmp #\C_mbtowc_6  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_mbtowc_3 ' JUMPV addrg
C_mbtowc_6
 mov r22, r4 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_mbtowc_8 ' EQU4
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 wrbyte r22, r4 ' ASGNU1 reg reg
C_mbtowc_8
 rdbyte r22, r3 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_mbtowc_11 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #\@C_mbtowc_12 ' JUMPV addrg
C_mbtowc_11
 mov r23, #0 ' reg <- coni
C_mbtowc_12
 mov r0, r23 ' CVI, CVU or LOAD
C_mbtowc_3
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
