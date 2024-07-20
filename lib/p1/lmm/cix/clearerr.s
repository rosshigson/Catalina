' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export clearerr

 alignl ' align long
C_clearerr ' <symbol:clearerr>
 jmp #PSHM
 long $540000 ' save registers
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long -49
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNI4 reg reg
' C_clearerr_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
