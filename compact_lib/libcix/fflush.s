' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fflush

 alignl ' align long
C_fflush ' <symbol:fflush>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $ff0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fflush_2)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_fflush_4
 word I16A_MOVI + (r22)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___iotab+8 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_8)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C___iotab ' reg <- addrg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_fflush)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_8)<<S32 ' EQI4 reg coni
 word I16A_NEGI + (r17)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl ' align long
C_fflush_8
' C_fflush_5 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_fflush_4)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_fflush_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_fflush_2
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_13)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fflush_11)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fflush_11)<<S32 ' NEI4 reg coni
 alignl ' align long
C_fflush_13
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_fflush_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_fflush_11
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_14)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_16)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fflush_16)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_fflush_16
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C__lseek)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_18)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((-385)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_fflush_18
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_fflush_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_fflush_14
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_20)<<S32 ' EQI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_fflush_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_fflush_20
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_22)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((-257)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_fflush_22
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r16)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUB + (r18)<<D16A + (r16)<<S16A ' SUBU (1)
 word I16A_MOV + (r19)<<D16A + (r18)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_fflush_24)<<S32 ' GTI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_fflush_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_fflush_24
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_fflush_26)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C__lseek)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fflush_28)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_fflush_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_fflush_28
 alignl ' align long
C_fflush_26
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C__write)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_fflush_30)<<S32 ' NEI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_fflush_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_fflush_30
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
C_fflush_1
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export __cleanup

 alignl ' align long
C___cleanup ' <symbol:__cleanup>
' C___cleanup_32 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Import _lseek

' Catalina Import _write

' Catalina Import __iotab
' end
