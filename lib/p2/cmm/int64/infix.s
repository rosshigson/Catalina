' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _int64

 alignl_label
C__int64 ' <symbol:_int64>
 alignl_p1
 long I32_NEWF + 8<<S32
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r3)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__int64_2 ' (symbol refcount = 0)
 word I16B_RETF + 8<<S32
 alignl_p1

' Catalina Export _int32

 alignl_label
C__int32 ' <symbol:_int32>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C__int32_9)<<S32 ' GEI4 reg coni
 word I16A_NEGI + (r23)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C__int32_10)<<S32 ' JUMPV addrg
 alignl_label
C__int32_9
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C__int32_10
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__int32_5 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _uint32

 alignl_label
C__uint32 ' <symbol:_uint32>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__uint32_11 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _add64

 alignl_label
C__add64 ' <symbol:_add64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r23)<<D16A + (r20)<<S16A ' ADDU (3)
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C__add64_18)<<S32 ' GEU4 reg reg
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C__add64_19)<<S32 ' JUMPV addrg
 alignl_label
C__add64_18
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C__add64_19
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__add64_14 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _sub64

 alignl_label
C__sub64 ' <symbol:_sub64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C__sub64_24)<<S32 ' GEU4 reg reg
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C__sub64_25)<<S32 ' JUMPV addrg
 alignl_label
C__sub64_24
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C__sub64_25
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__sub64_20 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _mul64

 alignl_label
C__mul64 ' <symbol:_mul64>
 alignl_p1
 long I32_NEWF + 24<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_mul)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__mul64_26 ' (symbol refcount = 0)
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _mul32

 alignl_label
C__mul32 ' <symbol:_mul32>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_mul32)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__mul32_28 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _div64

 alignl_label
C__div64 ' <symbol:_div64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_div)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__div64_30 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _mod64

 alignl_label
C__mod64 ' <symbol:_mod64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $a80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_mod)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__mod64_32 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _neg64

 alignl_label
C__neg64 ' <symbol:_neg64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__neg64_38)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C__neg64_39)<<S32 ' JUMPV addrg
 alignl_label
C__neg64_38
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C__neg64_39
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_SUBS + (r22)<<D16A + (r23)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__neg64_34 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _and64

 alignl_label
C__and64 ' <symbol:_and64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__and64_40 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _or64

 alignl_label
C__or64 ' <symbol:_or64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__or64_43 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _xor64

 alignl_label
C__xor64 ' <symbol:_xor64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r3)<<S16A ' reg <- INDIRU4 reg
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16A_XOR + (r22)<<D16A + (r20)<<S16A ' BXORI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_XOR + (r22)<<D16A + (r20)<<S16A ' BXORI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__xor64_46 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _not64

 alignl_label
C__not64 ' <symbol:_not64>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRU4 reg
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_CPL + (r22)<<D16B ' BCOMU4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__not64_49 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _shl32

 alignl_label
C__shl32 ' <symbol:_shl32>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_CMPI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__shl32_54)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (32)<<S32
 word I16A_CMP + (r2)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C__shl32_56)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_MOV + RI<<D16A + (r3)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(32)<<S32 ' reg <- conli
 word I16A_SUB + (r22)<<D16A + (r2)<<S16A ' SUBU (1)
 word I16A_MOV + RI<<D16A + (r3)<<S16A
 word I16A_SHR + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' RSHU (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C__shl32_55)<<S32 ' JUMPV addrg
 alignl_label
C__shl32_56
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (31)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r2)<<S16A ' BANDI/U (2)
 word I16A_MOV + RI<<D16A + (r3)<<S16A
 word I16A_SHL + RI<<D16A + (r22)<<S16A
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' SHLI/U (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C__shl32_55)<<S32 ' JUMPV addrg
 alignl_label
C__shl32_54
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r3)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_label
C__shl32_55
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__shl32_52 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _shl64

 alignl_label
C__shl64 ' <symbol:_shl64>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_shl)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__shl64_61 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _lsr64

 alignl_label
C__lsr64 ' <symbol:_lsr64>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_ushr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__lsr64_63 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export _asr64

 alignl_label
C__asr64 ' <symbol:_asr64>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_jsll_shr)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
' C__asr64_65 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import jsll_ushr

' Catalina Import jsll_shr

' Catalina Import jsll_shl

' Catalina Import jsll_mod

' Catalina Import jsll_div

' Catalina Import jsll_mul32

' Catalina Import jsll_mul
' end
