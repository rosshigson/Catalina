' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strspn

 alignl ' align long
C_strspn ' <symbol:strspn>
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_strspn_5)<<S32 ' JUMPV addrg
 alignl ' align long
C_strspn_2
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_strspn_9)<<S32 ' JUMPV addrg
 alignl ' align long
C_strspn_6
' C_strspn_7 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strspn_9
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strspn_10)<<S32 ' EQI4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strspn_6)<<S32 ' NEI4 reg reg
 alignl ' align long
C_strspn_10
 word I16A_RDBYTE + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strspn_11)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_JMPA + (@C_strspn_4)<<S32 ' JUMPV addrg
 alignl ' align long
C_strspn_11
' C_strspn_3 ' (symbol refcount = 0)
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strspn_5
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strspn_2)<<S32 ' NEI4 reg coni
 alignl ' align long
C_strspn_4
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_strspn_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
