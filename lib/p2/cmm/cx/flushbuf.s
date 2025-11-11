' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_shsg_690edb6d_do_write_L000003 ' <symbol:do_write>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_shsg_690edb6d_do_write_L000003_6)<<S32 ' JUMPV addrg
 alignl_label
C_shsg_690edb6d_do_write_L000003_5
 word I16A_SUBS + (r19)<<D16A + (r17)<<S16A ' SUBI/P (1)
 word I16A_ADDS + (r21)<<D16A + (r17)<<S16A ' ADDI/P (2)
 alignl_label
C_shsg_690edb6d_do_write_L000003_6
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__write)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_shsg_690edb6d_do_write_L000003_8)<<S32 ' LEI4 reg coni
 word I16A_CMPS + (r17)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C_shsg_690edb6d_do_write_L000003_5)<<S32 ' LTI4 reg reg
 alignl_label
C_shsg_690edb6d_do_write_L000003_8
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_shsg_690edb6d_do_write_L000003_10)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_shsg_690edb6d_do_write_L000003_11)<<S32 ' JUMPV addrg
 alignl_label
C_shsg_690edb6d_do_write_L000003_10
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_shsg_690edb6d_do_write_L000003_11
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_shsg_690edb6d_do_write_L000003_4 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_shsg1_690edb6d_get_buf_L000012 ' <symbol:get_buf>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_shsg1_690edb6d_get_buf_L000012_13 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export __flushbuf

 alignl_label
C___flushbuf ' <symbol:__flushbuf>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C___cleanup ' reg <- addrg
 alignl_p1
 long I32_LODA + (@C__clean)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C___flushbuf_15)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_15
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_17)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_17
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_19)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_19)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_19
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((-129)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_21)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_23)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C___stdout ' reg <- addrg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_25)<<S32 ' NEU4 reg reg
 alignl_p1
 long I32_LODI + (@C___stdout+4)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__isatty)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_25)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_CALA + (@C_shsg1_690edb6d_get_buf_L000012)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_28)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r18)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C___flushbuf_26)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_28
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C___flushbuf_26)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_25
 alignl_p1
 long I32_CALA + (@C_shsg1_690edb6d_get_buf_L000012)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_30)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r18)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C___flushbuf_31)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_30
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_OR + (r22)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_32)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((511)&$7FFFF)<<S32 ' reg <- cons
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_JMPA + (@C___flushbuf_33)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_32
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 alignl_label
C___flushbuf_33
 alignl_label
C___flushbuf_31
 alignl_label
C___flushbuf_26
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C___flushbuf_23
 alignl_label
C___flushbuf_21
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_34)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_36)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__lseek)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_38)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_38
 alignl_label
C___flushbuf_36
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__write)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_40)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_40
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_34
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_42)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 word I16A_CMPSI + (r23)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_46)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' NEGI4
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_43)<<S32 ' NEI4 reg reg
 alignl_label
C___flushbuf_46
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_47)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__lseek)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_49)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_49
 alignl_label
C___flushbuf_47
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_shsg_690edb6d_do_write_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_43)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_42
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C___flushbuf_53)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C___flushbuf_55)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__lseek)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r0)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_57)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_57
 alignl_label
C___flushbuf_55
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_shsg_690edb6d_do_write_L000003)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C___flushbuf_59)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl_p1
 long I32_JMPA + (@C___flushbuf_14)<<S32 ' JUMPV addrg
 alignl_label
C___flushbuf_59
 alignl_label
C___flushbuf_53
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C___flushbuf_43
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
 alignl_label
C___flushbuf_14
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _clean

' Catalina Import _isatty

' Catalina Import _write

' Catalina Import _lseek

' Catalina Import __cleanup

' Catalina Import malloc

' Catalina Import __stdout
' end
