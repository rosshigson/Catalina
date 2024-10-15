' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isprint

 alignl ' align long
C_isprint ' <symbol:isprint>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, r2
 subs r22, #32 ' SUBI4 coni
 cmp r22,  #95 wcz 
 if_ae jmp #\C_isprint_3 ' GEU4
 mov r23, #1 ' reg <- coni
 jmp #\@C_isprint_4 ' JUMPV addrg
C_isprint_3
 mov r23, #0 ' reg <- coni
C_isprint_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_isprint_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
