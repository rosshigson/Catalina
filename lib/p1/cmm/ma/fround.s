' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fround

 alignl_label
C_fround ' <symbol:fround>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
' C_fround_3 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r23)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
' C_fround_4 ' (symbol refcount = 0)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7f800000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_SHRI + (r22)<<D16A + (23)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((127)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r21)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16A_CMPSI + (r21)<<D16A + (23)<<S16A
 alignl_p1
 long I32_BRAE + (@C_fround_6)<<S32 ' GEI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_fround_8)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $80000000 ' reg <- con
 word I16A_AND + (r23)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fround_7)<<S32 ' NEI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $3f800000 ' reg <- con
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 alignl_p1
 long I32_JMPA + (@C_fround_7)<<S32 ' JUMPV addrg
 alignl_label
C_fround_8
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 8388607 ' reg <- con
 word I16A_SAR + (r22)<<D16A + (r21)<<S16A ' RSHI (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fround_12)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_fround_2)<<S32 ' JUMPV addrg
 alignl_label
C_fround_12
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 4194304 ' reg <- con
 word I16A_SAR + (r22)<<D16A + (r21)<<S16A ' RSHI (1)
 word I16A_ADD + (r23)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16A_AND + (r23)<<D16A + (r22)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_JMPA + (@C_fround_7)<<S32 ' JUMPV addrg
 alignl_label
C_fround_6
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fround_14)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r2)<<S16A ' setup r0/r1 (2)
 word I16B_FLTP + FADD<<S16B ' ADDF4
 alignl_p1
 long I32_JMPA + (@C_fround_2)<<S32 ' JUMPV addrg
 alignl_label
C_fround_14
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_fround_2)<<S32 ' JUMPV addrg
 alignl_label
C_fround_7
' C_fround_16 ' (symbol refcount = 0)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16
' C_fround_17 ' (symbol refcount = 0)
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_fround_2
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
