' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ferror

 alignl ' align long
C_ferror ' <symbol:ferror>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_ferror_3)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_ferror_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_ferror_3
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_ferror_4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_ferror_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
