' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export labs

 alignl ' align long
C_labs ' <symbol:labs>
 jmp #PSHM
 long $800000 ' save registers
 cmps r2,  #0 wcz
 jmp #BR_B
 long @C_labs_5 ' LTI4
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_labs_6 ' JUMPV addrg
C_labs_5
 neg r23, r2 ' NEGI4
C_labs_6
 mov r0, r23 ' CVI, CVU or LOAD
' C_labs_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
