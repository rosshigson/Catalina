' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export memcmp

 alignl_label
C_memcmp ' <symbol:memcmp>
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_memcmp_2)<<S32 ' EQU4 reg coni
 word I16A_ADDI + (r2)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_memcmp_5)<<S32 ' JUMPV addrg
 alignl_label
C_memcmp_4
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_memcmp_7)<<S32 ' NEI4 reg reg
 alignl_p1
 long I32_JMPA + (@C_memcmp_5)<<S32 ' JUMPV addrg
 alignl_label
C_memcmp_7
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r23)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r22)<<S16A ' SUBI/P (3)
 alignl_p1
 long I32_JMPA + (@C_memcmp_1)<<S32 ' JUMPV addrg
 alignl_label
C_memcmp_5
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_memcmp_4)<<S32 ' NEU4 reg coni
 alignl_label
C_memcmp_2
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_memcmp_1
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
