' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export labs

 alignl ' align long
C_labs ' <symbol:labs>
 calld PA,#PSHM
 long $800000 ' save registers
 cmps r2,  #0 wcz
 if_b jmp #\C_labs_5 ' LTI4
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #\@C_labs_6 ' JUMPV addrg
C_labs_5
 neg r23, r2 ' NEGI4
C_labs_6
 mov r0, r23 ' CVI, CVU or LOAD
' C_labs_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
