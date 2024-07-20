' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isascii

 alignl ' align long
C_isascii ' <symbol:isascii>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #128 wcz 
 if_ae jmp #\C_isascii_3 ' GEU4
 mov r23, #1 ' reg <- coni
 jmp #\@C_isascii_4 ' JUMPV addrg
C_isascii_3
 mov r23, #0 ' reg <- coni
C_isascii_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_isascii_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
