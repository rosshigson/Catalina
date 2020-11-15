' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tolower

 alignl ' align long
C_tolower ' <symbol:tolower>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((65)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r2)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_CMPI + (r22)<<D16A + (26)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_tolower_3)<<S32 ' GEU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((65)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r2)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((97)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r23)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_tolower_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_tolower_3
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_tolower_4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_tolower_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
