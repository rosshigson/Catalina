' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isascii

 alignl ' align long
C_isascii ' <symbol:isascii>
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_isascii_3)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_isascii_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_isascii_3
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_isascii_4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_isascii_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
