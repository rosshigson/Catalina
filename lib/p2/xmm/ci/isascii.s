' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export isascii

 alignl ' align long
C_isascii ' <symbol:isascii>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #128 wz,wc 
 jmp #BRAE
 long @C_isascii_3 ' GEU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_isascii_4 ' JUMPV addrg
C_isascii_3
 mov r23, #0 ' reg <- coni
C_isascii_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_isascii_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
