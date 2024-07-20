' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export __IsNan

 alignl ' align long
C___I_sN_an ' <symbol:__IsNan>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $540000<<S32 ' save registers
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 2139095040 ' reg <- con
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_CMPS + (r18)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C___I_sN_an_2)<<S32 ' NEI4 reg reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 8388607 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C___I_sN_an_2)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C___I_sN_an_1)<<S32 ' JUMPV addrg
 alignl ' align long
C___I_sN_an_2
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C___I_sN_an_1
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long
' end
