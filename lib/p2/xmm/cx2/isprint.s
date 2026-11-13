' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export isprint

 alignl ' align long
C_isprint ' <symbol:isprint>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r2
 subs r22, #32 ' SUBI4 coni
 cmp r22,  #95 wz,wc 
 jmp #BRAE
 long @C_isprint_3 ' GEU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_isprint_4 ' JUMPV addrg
C_isprint_3
 mov r23, #0 ' reg <- coni
C_isprint_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_isprint_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
