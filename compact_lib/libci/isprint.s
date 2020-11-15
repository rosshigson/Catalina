' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isprint

 alignl ' align long
C_isprint ' <symbol:isprint>
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r2)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 alignl ' align long
 long I32_MOVI + RI<<D32 + (95)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRAE + (@C_isprint_3)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_isprint_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_isprint_3
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_isprint_4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_isprint_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
