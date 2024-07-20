' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export abs

 alignl ' align long
C_abs ' <symbol:abs>
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_abs_5)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_abs_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_abs_5
 word I16A_NEG + (r23)<<D16A + (r2)<<S16A ' NEGI4
 alignl ' align long
C_abs_6
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_abs_3 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
