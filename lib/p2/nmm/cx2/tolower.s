' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tolower

 alignl ' align long
C_tolower ' <symbol:tolower>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r22, r2
 subs r22, #65 ' SUBI4 coni
 cmp r22,  #26 wcz 
 if_ae jmp #\C_tolower_3 ' GEU4
 mov r22, r2
 subs r22, #65 ' SUBI4 coni
 mov r23, r22
 adds r23, #97 ' ADDI4 coni
 jmp #\@C_tolower_4 ' JUMPV addrg
C_tolower_3
 mov r23, r2 ' CVI, CVU or LOAD
C_tolower_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_tolower_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
