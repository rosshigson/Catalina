' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export strcoll

 alignl ' align long
C_strcoll ' <symbol:strcoll>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 alignl ' align long
 long I32_JMPA + (@C_strcoll_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_strcoll_2
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_strcoll_5)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_strcoll_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_strcoll_5
 alignl ' align long
C_strcoll_3
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_strcoll_2)<<S32 ' EQI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r22)<<S16A ' SUBI/P (3)
 alignl ' align long
C_strcoll_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long
' end
