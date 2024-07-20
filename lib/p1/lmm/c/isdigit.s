' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export isdigit

 alignl ' align long
C_isdigit ' <symbol:isdigit>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r2
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BRAE
 long @C_isdigit_3 ' GEU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_isdigit_4 ' JUMPV addrg
C_isdigit_3
 mov r23, #0 ' reg <- coni
C_isdigit_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_isdigit_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
