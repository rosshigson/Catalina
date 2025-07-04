' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export ftrunc

 alignl_label
C_ftrunc ' <symbol:ftrunc>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
' C_ftrunc_3 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_ftrunc_4 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long $80000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2139095040 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_SARI + (r22)<<D16A + (23)<<S16A ' SHRI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((127)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r19)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r19)<<D16A + (23)<<S16A
 alignl_p1
 long I32_BRAE + (@C_ftrunc_6)<<S32 ' GEI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_ftrunc_8)<<S32 ' GEI4 reg coni
' C_ftrunc_10 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_JMPA + (@C_ftrunc_7)<<S32 ' JUMPV addrg
 alignl_label
C_ftrunc_8
' C_ftrunc_13 ' (symbol refcount = 0)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 8388607 ' reg <- con
 word I16A_SAR + (r22)<<D16A + (r19)<<S16A ' RSHI (1)
 word I16B_CPL + (r22)<<D16B ' BCOMI4
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_OR + (r22)<<D16A + (r21)<<S16A ' BORI/U (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
 alignl_p1
 long I32_JMPA + (@C_ftrunc_7)<<S32 ' JUMPV addrg
 alignl_label
C_ftrunc_6
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ftrunc_16)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 alignl_p1
 long I32_JMPA + (@C_ftrunc_2)<<S32 ' JUMPV addrg
 alignl_label
C_ftrunc_16
 alignl_label
C_ftrunc_7
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_ftrunc_2
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
