' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getrealrand

 alignl ' align long
C_getrealrand ' <symbol:getrealrand>
 calld PA,#PSHM
 long $400000 ' save registers
' loading argument C_getrealrand_3_L000004 to PASM eliminated
'START PASM ... 
getrnd r0
'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
' C_getrealrand_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
