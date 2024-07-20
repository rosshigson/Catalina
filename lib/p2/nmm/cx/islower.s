' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export islower

 alignl ' align long
C_islower ' <symbol:islower>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, r2
 subs r22, #97 ' SUBI4 coni
 cmp r22,  #26 wcz 
 if_ae jmp #\C_islower_3 ' GEU4
 mov r23, #1 ' reg <- coni
 jmp #\@C_islower_4 ' JUMPV addrg
C_islower_3
 mov r23, #0 ' reg <- coni
C_islower_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_islower_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
