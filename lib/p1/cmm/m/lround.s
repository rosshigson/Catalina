' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export lround

 alignl_label
C_lround ' <symbol:lround>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
' C_lround_3 ' (symbol refcount = 0)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r23)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
' C_lround_4 ' (symbol refcount = 0)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7f800000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_SHRI + (r22)<<D16A + (23)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $80000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_lround_7)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r19)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_lround_8)<<S32 ' JUMPV addrg
 alignl_label
C_lround_7
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C_lround_8
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r19)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7fffff ' reg <- con
 word I16A_AND + (r23)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $800000 ' reg <- con
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_CMPSI + (r21)<<D16A + (31)<<S16A
 alignl_p1
 long I32_BRAE + (@C_lround_9)<<S32 ' GEI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_lround_11)<<S32 ' GEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_lround_14)<<S32 ' GEI4 reg reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_lround_15)<<S32 ' JUMPV addrg
 alignl_label
C_lround_14
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r17)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_label
C_lround_15
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_lround_2)<<S32 ' JUMPV addrg
 alignl_label
C_lround_11
 word I16A_CMPSI + (r21)<<D16A + (23)<<S16A
 alignl_p1
 long I32_BR_B + (@C_lround_16)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r20)<<D16A + (23)<<S16A ' SUBI4 reg coni
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_lround_10)<<S32 ' JUMPV addrg
 alignl_label
C_lround_16
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 4194304 ' reg <- con
 word I16A_SAR + (r22)<<D16A + (r21)<<S16A ' RSHI (1)
 word I16A_ADD + (r23)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOVI + (r22)<<D16A + (23)<<S16A ' reg <- coni
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A ' SUBI/P (1)
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_lround_10)<<S32 ' JUMPV addrg
 alignl_label
C_lround_9
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16B_FLTP + INFL<<S16B ' CVFI4
 alignl_p1
 long I32_JMPA + (@C_lround_2)<<S32 ' JUMPV addrg
 alignl_label
C_lround_10
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl_label
C_lround_2
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
