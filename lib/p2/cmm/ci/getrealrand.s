' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getrealrand

 alignl ' align long
C_getrealrand ' <symbol:getrealrand>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
' loading argument C_getrealrand_3_L000004 to PASM eliminated
'START PASM ... 
getrnd r0
'... END PASM
' call to PASM eliminated
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_getrealrand_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
