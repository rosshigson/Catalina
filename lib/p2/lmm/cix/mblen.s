' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export mblen

 alignl ' align long
C_mblen ' <symbol:mblen>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_mblen_4 ' NEU4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_mblen_3 ' JUMPV addrg
C_mblen_4
 cmp r2,  #0 wz
 jmp #BRNZ
 long @C_mblen_6 ' NEU4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_mblen_3 ' JUMPV addrg
C_mblen_6
 rdbyte r22, r3 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_mblen_9 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_mblen_10 ' JUMPV addrg
C_mblen_9
 mov r23, #0 ' reg <- coni
C_mblen_10
 mov r0, r23 ' CVI, CVU or LOAD
C_mblen_3
 jmp #POPM ' restore registers
 jmp #RETN

' end
