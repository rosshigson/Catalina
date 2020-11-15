' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strchr

 alignl ' align long
C_strchr ' <symbol:strchr>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 alignl ' align long
 long I32_JMPA + (@C_strchr_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_strchr_2
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strchr_5)<<S32 ' NEI4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_strchr_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_strchr_5
 alignl ' align long
C_strchr_3
 word I16A_RDBYTE + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r2)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strchr_2)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_strchr_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
