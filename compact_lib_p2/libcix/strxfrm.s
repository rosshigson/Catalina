' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strxfrm

 alignl ' align long
C_strxfrm ' <symbol:strxfrm>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_strxfrm_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_strxfrm_2
 word I16A_CMPI + (r2)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_strxfrm_5)<<S32 ' LEU4 reg coni
 word I16A_SUBI + (r2)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_JMPA + (@C_strxfrm_6)<<S32 ' JUMPV addrg
 alignl ' align long
C_strxfrm_5
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
C_strxfrm_6
 alignl ' align long
C_strxfrm_3
 word I16A_RDBYTE + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strxfrm_2)<<S32 ' NEI4 reg coni
 word I16A_CMPI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strxfrm_7)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r4)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_strxfrm_7
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_strxfrm_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
