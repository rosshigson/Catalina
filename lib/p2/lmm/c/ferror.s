' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ferror

 alignl ' align long
C_ferror ' <symbol:ferror>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_ferror_3 ' EQI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_ferror_4 ' JUMPV addrg
C_ferror_3
 mov r23, #0 ' reg <- coni
C_ferror_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_ferror_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
