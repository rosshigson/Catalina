' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export feof

 alignl ' align long
C_feof ' <symbol:feof>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_feof_3 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_feof_4 ' JUMPV addrg
C_feof_3
 mov r23, #0 ' reg <- coni
C_feof_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_feof_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
