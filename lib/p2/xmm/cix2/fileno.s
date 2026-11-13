' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fileno

 alignl ' align long
C_fileno ' <symbol:fileno>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_fileno_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
