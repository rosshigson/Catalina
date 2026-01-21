' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_s3hc3_696ddf70_getgclist_L000017 ' <symbol:getgclist>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 word I16A_CMPSI + (r23)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hc3_696ddf70_getgclist_L000017_19)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r23)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc3_696ddf70_getgclist_L000017_28)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s3hc3_696ddf70_getgclist_L000017_29_L000031-20 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_29_L000031 ' <symbol:29>
 long @C_s3hc3_696ddf70_getgclist_L000017_22
 long @C_s3hc3_696ddf70_getgclist_L000017_23
 long @C_s3hc3_696ddf70_getgclist_L000017_27
 long @C_s3hc3_696ddf70_getgclist_L000017_25
 long @C_s3hc3_696ddf70_getgclist_L000017_19
 long @C_s3hc3_696ddf70_getgclist_L000017_26

' Catalina Code

DAT ' code segment
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_28
 alignl_p1
 long I32_MOVI + RI<<D32 + (38)<<S32
 word I16A_CMPS + (r23)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc3_696ddf70_getgclist_L000017_24)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc3_696ddf70_getgclist_L000017_19)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_22
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (28)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc3_696ddf70_getgclist_L000017_18)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_23
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc3_696ddf70_getgclist_L000017_18)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_24
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc3_696ddf70_getgclist_L000017_18)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_25
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_s3hc3_696ddf70_getgclist_L000017_18)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_26
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_s3hc3_696ddf70_getgclist_L000017_18)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_27
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (16)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc3_696ddf70_getgclist_L000017_18)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_19
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_label
C_s3hc3_696ddf70_getgclist_L000017_18
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc6_696ddf70_linkgclist__L000033 ' <symbol:linkgclist_>
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r3)<<S16A ' ASGNP4 reg reg
 word I16A_WRLONG + (r4)<<D16A + (r2)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffffc7 ' reg <- con
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_s3hc6_696ddf70_linkgclist__L000033_34 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3hc7_696ddf70_clearkey_L000035 ' <symbol:clearkey>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc7_696ddf70_clearkey_L000035_37)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (11)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hc7_696ddf70_clearkey_L000035_37
' C_s3hc7_696ddf70_clearkey_L000035_36 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3hc8_696ddf70_iscleared_L000039 ' <symbol:iscleared>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc8_696ddf70_iscleared_L000039_41)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s3hc8_696ddf70_iscleared_L000039_40)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc8_696ddf70_iscleared_L000039_41
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc8_696ddf70_iscleared_L000039_43)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc8_696ddf70_iscleared_L000039_45)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hc8_696ddf70_iscleared_L000039_45
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s3hc8_696ddf70_iscleared_L000039_40)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc8_696ddf70_iscleared_L000039_43
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r0)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl_label
C_s3hc8_696ddf70_iscleared_L000039_40
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_barrier_

 alignl_label
C_luaC__barrier_ ' <symbol:luaC_barrier_>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ff0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaC__barrier__48)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRBE + (@C_luaC__barrier__49)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_NEGI + (r18)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaC__barrier__49)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__barrier__48
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((58)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaC__barrier__52)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((-57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOVI + (r16)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_luaC__barrier__52
 alignl_label
C_luaC__barrier__49
' C_luaC__barrier__47 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_barrierback_

 alignl_label
C_luaC__barrierback_ ' <symbol:luaC_barrierback_>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaC__barrierback__55)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffffc7 ' reg <- con
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaC__barrierback__56)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__barrierback__55
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc3_696ddf70_getgclist_L000017)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r18)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_luaC__barrierback__56
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRBE + (@C_luaC__barrierback__57)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (5)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_NEGI + (r16)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16A_OR + (r22)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_WRBYTE + (r22)<<D16A + (r20)<<S16A ' ASGNU1 reg reg
 alignl_label
C_luaC__barrierback__57
' C_luaC__barrierback__54 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_fix

 alignl_label
C_luaC__fix ' <symbol:luaC_fix>
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffffc7 ' reg <- con
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_NEGI + (r18)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOVI + (r18)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((104)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((104)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
' C_luaC__fix_59 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export luaC_newobjdt

 alignl_label
C_luaC__newobjdt ' <symbol:luaC_newobjdt>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' BANDI/U
 word I16A_AND + (r2)<<D16A + (r22)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__malloc_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r13)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_luaC__newobjdt_60 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_newobj

 alignl_label
C_luaC__newobj ' <symbol:luaC_newobj>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_luaC__newobjdt)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_luaC__newobj_61 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014 ' <symbol:reallymarkobject>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 word I16A_CMPSI + (r19)<<D16A + (20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc_696ddf70_reallymarkobject_L000014_66)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc_696ddf70_reallymarkobject_L000014_81)<<S32 ' GTI4 reg coni
' C_s3hc_696ddf70_reallymarkobject_L000014_80 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hc_696ddf70_reallymarkobject_L000014_64)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc_696ddf70_reallymarkobject_L000014_64)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s3hc_696ddf70_reallymarkobject_L000014_82_L000084-16 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_82_L000084 ' <symbol:82>
 long @C_s3hc_696ddf70_reallymarkobject_L000014_66
 long @C_s3hc_696ddf70_reallymarkobject_L000014_79
 long @C_s3hc_696ddf70_reallymarkobject_L000014_79
 long @C_s3hc_696ddf70_reallymarkobject_L000014_72
 long @C_s3hc_696ddf70_reallymarkobject_L000014_79
 long @C_s3hc_696ddf70_reallymarkobject_L000014_67
 long @C_s3hc_696ddf70_reallymarkobject_L000014_79

' Catalina Code

DAT ' code segment
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_81
 alignl_p1
 long I32_MOVI + RI<<D32 + (38)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc_696ddf70_reallymarkobject_L000014_79)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc_696ddf70_reallymarkobject_L000014_64)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_66
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_NEGI + (r18)<<D16A + (-(-25)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc_696ddf70_reallymarkobject_L000014_64)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_67
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_CMP + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc_696ddf70_reallymarkobject_L000014_68)<<S32 ' EQU4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffffc7 ' reg <- con
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc_696ddf70_reallymarkobject_L000014_69)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_68
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_NEGI + (r18)<<D16A + (-(-25)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_69
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc_696ddf70_reallymarkobject_L000014_64)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc_696ddf70_reallymarkobject_L000014_64)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc_696ddf70_reallymarkobject_L000014_64)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_72
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc_696ddf70_reallymarkobject_L000014_73)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc_696ddf70_reallymarkobject_L000014_75)<<S32 ' EQU4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc_696ddf70_reallymarkobject_L000014_77)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_77
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_75
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_NEGI + (r18)<<D16A + (-(-25)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc_696ddf70_reallymarkobject_L000014_64)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_73
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_79
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc3_696ddf70_getgclist_L000017)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s3hc_696ddf70_reallymarkobject_L000014_64
' C_s3hc_696ddf70_reallymarkobject_L000014_62 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcb_696ddf70_markmt_L000086 ' <symbol:markmt>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3hcb_696ddf70_markmt_L000086_88
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((252)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcb_696ddf70_markmt_L000086_92)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((252)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcb_696ddf70_markmt_L000086_94)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((252)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcb_696ddf70_markmt_L000086_94
 alignl_label
C_s3hcb_696ddf70_markmt_L000086_92
' C_s3hcb_696ddf70_markmt_L000086_89 ' (symbol refcount = 0)
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (9)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcb_696ddf70_markmt_L000086_88)<<S32 ' LTI4 reg coni
' C_s3hcb_696ddf70_markmt_L000086_87 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcc_696ddf70_markbeingfnz_L000096 ' <symbol:markbeingfnz>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hcc_696ddf70_markbeingfnz_L000096_101)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcc_696ddf70_markbeingfnz_L000096_98
 word I16A_ADDI + (r19)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcc_696ddf70_markbeingfnz_L000096_102)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcc_696ddf70_markbeingfnz_L000096_102
' C_s3hcc_696ddf70_markbeingfnz_L000096_99 ' (symbol refcount = 0)
 word I16A_RDLONG + (r21)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_s3hcc_696ddf70_markbeingfnz_L000096_101
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcc_696ddf70_markbeingfnz_L000096_98)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_s3hcc_696ddf70_markbeingfnz_L000096_97 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104 ' <symbol:remarkupvals>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((136)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r17)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcd_696ddf70_remarkupvals_L000104_107)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104_106
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcd_696ddf70_remarkupvals_L000104_109)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcd_696ddf70_remarkupvals_L000104_109)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_s3hcd_696ddf70_remarkupvals_L000104_110)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104_109
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hcd_696ddf70_remarkupvals_L000104_114)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104_111
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcd_696ddf70_remarkupvals_L000104_115)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcd_696ddf70_remarkupvals_L000104_117)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcd_696ddf70_remarkupvals_L000104_117)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104_117
 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104_115
' C_s3hcd_696ddf70_remarkupvals_L000104_112 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r15)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104_114
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcd_696ddf70_remarkupvals_L000104_111)<<S32 ' NEU4 reg coni
 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104_110
 alignl_label
C_s3hcd_696ddf70_remarkupvals_L000104_107
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcd_696ddf70_remarkupvals_L000104_106)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s3hcd_696ddf70_remarkupvals_L000104_105 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hce_696ddf70_cleargraylists_L000119 ' <symbol:cleargraylists>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((92)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((88)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
' C_s3hce_696ddf70_cleargraylists_L000119_120 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3hcf_696ddf70_restartcollection_L000121 ' <symbol:restartcollection>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hce_696ddf70_cleargraylists_L000119)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((144)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcf_696ddf70_restartcollection_L000121_123)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((144)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcf_696ddf70_restartcollection_L000121_123
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcf_696ddf70_restartcollection_L000121_125)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcf_696ddf70_restartcollection_L000121_125)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcf_696ddf70_restartcollection_L000121_125
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcb_696ddf70_markmt_L000086)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcc_696ddf70_markbeingfnz_L000096)<<S32 ' CALL addrg
' C_s3hcf_696ddf70_restartcollection_L000121_122 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcg_696ddf70_genlink_L000127 ' <symbol:genlink>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcg_696ddf70_genlink_L000127_129)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc3_696ddf70_getgclist_L000017)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hcg_696ddf70_genlink_L000127_130)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcg_696ddf70_genlink_L000127_129
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcg_696ddf70_genlink_L000127_131)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_XOR + (r20)<<D16A + (r18)<<S16A ' BXORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hcg_696ddf70_genlink_L000127_131
 alignl_label
C_s3hcg_696ddf70_genlink_L000127_130
' C_s3hcg_696ddf70_genlink_L000127_128 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133 ' <symbol:traverseweakvalue>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hch_696ddf70_traverseweakvalue_L000133_136)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hch_696ddf70_traverseweakvalue_L000133_137)<<S32 ' JUMPV addrg
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_136
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_137
 word I16A_MOV + (r15)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hch_696ddf70_traverseweakvalue_L000133_141)<<S32 ' JUMPV addrg
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_138
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hch_696ddf70_traverseweakvalue_L000133_142)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc7_696ddf70_clearkey_L000035)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hch_696ddf70_traverseweakvalue_L000133_143)<<S32 ' JUMPV addrg
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_142
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hch_696ddf70_traverseweakvalue_L000133_144)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hch_696ddf70_traverseweakvalue_L000133_144)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_144
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hch_696ddf70_traverseweakvalue_L000133_146)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hch_696ddf70_traverseweakvalue_L000133_149)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r11)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hch_696ddf70_traverseweakvalue_L000133_150)<<S32 ' JUMPV addrg
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_149
 word I16B_LODL + (r11)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_150
 word I16A_MOV + (r2)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc8_696ddf70_iscleared_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hch_696ddf70_traverseweakvalue_L000133_146)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_146
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_143
' C_s3hch_696ddf70_traverseweakvalue_L000133_139 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (16)<<S16A ' ADDP4 reg coni
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_141
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hch_696ddf70_traverseweakvalue_L000133_138)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hch_696ddf70_traverseweakvalue_L000133_151)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hch_696ddf70_traverseweakvalue_L000133_151)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((88)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hch_696ddf70_traverseweakvalue_L000133_152)<<S32 ' JUMPV addrg
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_151
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s3hch_696ddf70_traverseweakvalue_L000133_152
' C_s3hch_696ddf70_traverseweakvalue_L000133_134 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153 ' <symbol:traverseephemeron>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $feaf80<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaH__realasize)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_158)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_155
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_159)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_159)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_159
' C_s3hci_696ddf70_traverseephemeron_L000153_156 ' (symbol refcount = 0)
 word I16A_ADDI + (r17)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_158
 word I16A_CMP + (r17)<<D16A + (r13)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hci_696ddf70_traverseephemeron_L000153_155)<<S32 ' LTU4 reg reg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_164)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_161
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_166)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_SUB + (r22)<<D16A + (r17)<<S16A ' SUBU (1)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r8)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_167)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_166
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r8)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_167
 word I16A_MOV + (r9)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hci_696ddf70_traverseephemeron_L000153_168)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc7_696ddf70_clearkey_L000035)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_169)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_168
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_173)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r7)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_174)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_173
 word I16B_LODL + (r7)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_174
 word I16A_MOV + (r2)<<D16A + (r7)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc8_696ddf70_iscleared_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_170)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_171)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r9)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_171)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_171)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_170
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_177)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r9)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_177)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r11)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_RDLONG + (r2)<<D16A + (r9)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_177
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_171
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_169
' C_s3hci_696ddf70_traverseephemeron_L000153_162 ' (symbol refcount = 0)
 word I16A_ADDI + (r17)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_164
 word I16A_CMP + (r17)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hci_696ddf70_traverseephemeron_L000153_161)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hci_696ddf70_traverseephemeron_L000153_179)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_180)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_179
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_181)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((92)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_182)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_181
 word I16A_CMPSI + (r10)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hci_696ddf70_traverseephemeron_L000153_183)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hci_696ddf70_traverseephemeron_L000153_184)<<S32 ' JUMPV addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_183
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcg_696ddf70_genlink_L000127)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_184
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_182
 alignl_label
C_s3hci_696ddf70_traverseephemeron_L000153_180
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
' C_s3hci_696ddf70_traverseephemeron_L000153_154 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185 ' <symbol:traversestrongtable>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaH__realasize)<<S32 ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcj_696ddf70_traversestrongtable_L000185_190)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_187
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcj_696ddf70_traversestrongtable_L000185_191)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcj_696ddf70_traversestrongtable_L000185_191)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_191
' C_s3hcj_696ddf70_traversestrongtable_L000185_188 ' (symbol refcount = 0)
 word I16A_ADDI + (r17)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_190
 word I16A_CMP + (r17)<<D16A + (r13)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcj_696ddf70_traversestrongtable_L000185_187)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hcj_696ddf70_traversestrongtable_L000185_196)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_193
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcj_696ddf70_traversestrongtable_L000185_197)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc7_696ddf70_clearkey_L000035)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hcj_696ddf70_traversestrongtable_L000185_198)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_197
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcj_696ddf70_traversestrongtable_L000185_199)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcj_696ddf70_traversestrongtable_L000185_199)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_199
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcj_696ddf70_traversestrongtable_L000185_201)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcj_696ddf70_traversestrongtable_L000185_201)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_201
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_198
' C_s3hcj_696ddf70_traversestrongtable_L000185_194 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (16)<<S16A ' ADDP4 reg coni
 alignl_label
C_s3hcj_696ddf70_traversestrongtable_L000185_196
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcj_696ddf70_traversestrongtable_L000185_193)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcg_696ddf70_genlink_L000127)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s3hcj_696ddf70_traversestrongtable_L000185_186 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hck_696ddf70_traversetable_L000203 ' <symbol:traversetable>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hck_696ddf70_traversetable_L000203_207)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r15)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_JMPA + (@C_s3hck_696ddf70_traversetable_L000203_208)<<S32 ' JUMPV addrg
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_207
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hck_696ddf70_traversetable_L000203_209)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_JMPA + (@C_s3hck_696ddf70_traversetable_L000203_210)<<S32 ' JUMPV addrg
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_209
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((164)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaT__gettm)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_210
 word I16A_MOV + (r15)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_208
 word I16A_MOV + (r19)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hck_696ddf70_traversetable_L000203_211)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r20)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hck_696ddf70_traversetable_L000203_213)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_213
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_211
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hck_696ddf70_traversetable_L000203_215)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (68)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hck_696ddf70_traversetable_L000203_215)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (107)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (118)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_strchr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hck_696ddf70_traversetable_L000203_217)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hck_696ddf70_traversetable_L000203_215)<<S32 ' EQU4 reg coni
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_217
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hck_696ddf70_traversetable_L000203_218)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hch_696ddf70_traverseweakvalue_L000133)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hck_696ddf70_traversetable_L000203_216)<<S32 ' JUMPV addrg
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_218
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hck_696ddf70_traversetable_L000203_220)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hci_696ddf70_traverseephemeron_L000153)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hck_696ddf70_traversetable_L000203_216)<<S32 ' JUMPV addrg
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_220
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r3)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hck_696ddf70_traversetable_L000203_216)<<S32 ' JUMPV addrg
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_215
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcj_696ddf70_traversestrongtable_L000185)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_216
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hck_696ddf70_traversetable_L000203_223)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hck_696ddf70_traversetable_L000203_224)<<S32 ' JUMPV addrg
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_223
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' LSHI/U
 word I16A_SHL + (r11)<<D16A + (r20)<<S16A ' LSHI/U (3)
 alignl_label
C_s3hck_696ddf70_traversetable_L000203_224
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r0)<<D16A + (r20)<<S16A ' ADDU (3)
' C_s3hck_696ddf70_traversetable_L000203_204 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcl_696ddf70_traverseudata_L000225 ' <symbol:traverseudata>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcl_696ddf70_traverseudata_L000225_227)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcl_696ddf70_traverseudata_L000225_229)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcl_696ddf70_traverseudata_L000225_229
 alignl_label
C_s3hcl_696ddf70_traverseudata_L000225_227
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcl_696ddf70_traverseudata_L000225_234)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcl_696ddf70_traverseudata_L000225_231
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcl_696ddf70_traverseudata_L000225_235)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcl_696ddf70_traverseudata_L000225_235)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcl_696ddf70_traverseudata_L000225_235
' C_s3hcl_696ddf70_traverseudata_L000225_232 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hcl_696ddf70_traverseudata_L000225_234
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcl_696ddf70_traverseudata_L000225_231)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcg_696ddf70_genlink_L000127)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_s3hcl_696ddf70_traverseudata_L000225_226 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237 ' <symbol:traverseproto>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_239)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_241)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_241
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_239
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcm_696ddf70_traverseproto_L000237_246)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_243
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_247)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_247)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_247
' C_s3hcm_696ddf70_traverseproto_L000237_244 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_246
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcm_696ddf70_traverseproto_L000237_243)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcm_696ddf70_traverseproto_L000237_252)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_249
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_253)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_255)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_255
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_253
' C_s3hcm_696ddf70_traverseproto_L000237_250 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_252
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcm_696ddf70_traverseproto_L000237_249)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcm_696ddf70_traverseproto_L000237_260)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_257
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_261)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_263)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_263
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_261
' C_s3hcm_696ddf70_traverseproto_L000237_258 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_260
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcm_696ddf70_traverseproto_L000237_257)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcm_696ddf70_traverseproto_L000237_268)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_265
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_269)<<S32 ' EQU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcm_696ddf70_traverseproto_L000237_271)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (12)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_271
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_269
' C_s3hcm_696ddf70_traverseproto_L000237_266 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hcm_696ddf70_traverseproto_L000237_268
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcm_696ddf70_traverseproto_L000237_265)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r0)<<D16A + (r20)<<S16A ' ADDI/P (3)
' C_s3hcm_696ddf70_traverseproto_L000237_238 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcn_696ddf70_traverseC_closure_L000273 ' <symbol:traverseCclosure>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcn_696ddf70_traverseC_closure_L000273_278)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcn_696ddf70_traverseC_closure_L000273_275
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r20)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcn_696ddf70_traverseC_closure_L000273_279)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcn_696ddf70_traverseC_closure_L000273_279)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcn_696ddf70_traverseC_closure_L000273_279
' C_s3hcn_696ddf70_traverseC_closure_L000273_276 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hcn_696ddf70_traverseC_closure_L000273_278
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcn_696ddf70_traverseC_closure_L000273_275)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_s3hcn_696ddf70_traverseC_closure_L000273_274 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hco_696ddf70_traverseL_closure_L000281 ' <symbol:traverseLclosure>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hco_696ddf70_traverseL_closure_L000281_283)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hco_696ddf70_traverseL_closure_L000281_285)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hco_696ddf70_traverseL_closure_L000281_285
 alignl_label
C_s3hco_696ddf70_traverseL_closure_L000281_283
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hco_696ddf70_traverseL_closure_L000281_290)<<S32 ' JUMPV addrg
 alignl_label
C_s3hco_696ddf70_traverseL_closure_L000281_287
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hco_696ddf70_traverseL_closure_L000281_291)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hco_696ddf70_traverseL_closure_L000281_293)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hco_696ddf70_traverseL_closure_L000281_293
 alignl_label
C_s3hco_696ddf70_traverseL_closure_L000281_291
' C_s3hco_696ddf70_traverseL_closure_L000281_288 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hco_696ddf70_traverseL_closure_L000281_290
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hco_696ddf70_traverseL_closure_L000281_287)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_s3hco_696ddf70_traverseL_closure_L000281_282 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcp_696ddf70_traversethread_L000295 ' <symbol:traversethread>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hcp_696ddf70_traversethread_L000295_299)<<S32 ' GTI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcp_696ddf70_traversethread_L000295_297)<<S32 ' NEI4 reg coni
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_299
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_297
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcp_696ddf70_traversethread_L000295_305)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s3hcp_696ddf70_traversethread_L000295_296)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_302
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcp_696ddf70_traversethread_L000295_306)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcp_696ddf70_traversethread_L000295_306)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_306
' C_s3hcp_696ddf70_traversethread_L000295_303 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_305
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcp_696ddf70_traversethread_L000295_302)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hcp_696ddf70_traversethread_L000295_311)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_308
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcp_696ddf70_traversethread_L000295_312)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_312
' C_s3hcp_696ddf70_traversethread_L000295_309 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_311
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcp_696ddf70_traversethread_L000295_308)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcp_696ddf70_traversethread_L000295_314)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcp_696ddf70_traversethread_L000295_316)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaD__shrinkstack)<<S32 ' CALL addrg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_316
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hcp_696ddf70_traversethread_L000295_321)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_318
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_s3hcp_696ddf70_traversethread_L000295_319 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (8)<<S16A ' ADDP4 reg coni
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_321
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcp_696ddf70_traversethread_L000295_318)<<S32 ' LTU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcp_696ddf70_traversethread_L000295_322)<<S32 ' NEU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcp_696ddf70_traversethread_L000295_322)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((44)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((136)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((136)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_322
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_314
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_ADDSI + (r0)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hcp_696ddf70_traversethread_L000295_296
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324 ' <symbol:propagatemark>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc3_696ddf70_getgclist_L000017)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r0)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 word I16A_CMPSI + (r19)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcq_696ddf70_propagatemark_L000324_326)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hcq_696ddf70_propagatemark_L000324_335)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s3hcq_696ddf70_propagatemark_L000324_336_L000338-20 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_336_L000338 ' <symbol:336>
 long @C_s3hcq_696ddf70_propagatemark_L000324_329
 long @C_s3hcq_696ddf70_propagatemark_L000324_331
 long @C_s3hcq_696ddf70_propagatemark_L000324_330
 long @C_s3hcq_696ddf70_propagatemark_L000324_334
 long @C_s3hcq_696ddf70_propagatemark_L000324_326
 long @C_s3hcq_696ddf70_propagatemark_L000324_333

' Catalina Code

DAT ' code segment
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_335
 alignl_p1
 long I32_MOVI + RI<<D32 + (38)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcq_696ddf70_propagatemark_L000324_332)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hcq_696ddf70_propagatemark_L000324_326)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_329
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hck_696ddf70_traversetable_L000203)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hcq_696ddf70_propagatemark_L000324_325)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_330
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcl_696ddf70_traverseudata_L000225)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hcq_696ddf70_propagatemark_L000324_325)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_331
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hco_696ddf70_traverseL_closure_L000281)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hcq_696ddf70_propagatemark_L000324_325)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_332
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcn_696ddf70_traverseC_closure_L000273)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hcq_696ddf70_propagatemark_L000324_325)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_333
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcm_696ddf70_traverseproto_L000237)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hcq_696ddf70_propagatemark_L000324_325)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_334
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcp_696ddf70_traversethread_L000295)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hcq_696ddf70_propagatemark_L000324_325)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_326
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s3hcq_696ddf70_propagatemark_L000324_325
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hct_696ddf70_propagateall_L000340 ' <symbol:propagateall>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hct_696ddf70_propagateall_L000340_343)<<S32 ' JUMPV addrg
 alignl_label
C_s3hct_696ddf70_propagateall_L000340_342
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcq_696ddf70_propagatemark_L000324)<<S32 ' CALL addrg
 word I16A_ADD + (r21)<<D16A + (r0)<<S16A ' ADDU (1)
 alignl_label
C_s3hct_696ddf70_propagateall_L000340_343
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hct_696ddf70_propagateall_L000340_342)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s3hct_696ddf70_propagateall_L000340_341 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcu_696ddf70_convergeephemerons_L000345 ' <symbol:convergeephemerons>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fea000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3hcu_696ddf70_convergeephemerons_L000345_347
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((92)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((92)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcu_696ddf70_convergeephemerons_L000345_351)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcu_696ddf70_convergeephemerons_L000345_350
 word I16A_MOV + (r13)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hci_696ddf70_traverseephemeron_L000153)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcu_696ddf70_convergeephemerons_L000345_353)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hct_696ddf70_propagateall_L000340)<<S32 ' CALL addrg
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C_s3hcu_696ddf70_convergeephemerons_L000345_353
 alignl_label
C_s3hcu_696ddf70_convergeephemerons_L000345_351
 word I16A_MOV + (r15)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcu_696ddf70_convergeephemerons_L000345_350)<<S32 ' NEU4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcu_696ddf70_convergeephemerons_L000345_356)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r13)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hcu_696ddf70_convergeephemerons_L000345_357)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcu_696ddf70_convergeephemerons_L000345_356
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3hcu_696ddf70_convergeephemerons_L000345_357
 word I16A_MOV + (r21)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
' C_s3hcu_696ddf70_convergeephemerons_L000345_348 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcu_696ddf70_convergeephemerons_L000345_347)<<S32 ' NEI4 reg coni
' C_s3hcu_696ddf70_convergeephemerons_L000345_346 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358 ' <symbol:clearbykeys>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_s3hcv_696ddf70_clearbykeys_L000358_363)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358_360
 word I16A_MOV + (r15)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hcv_696ddf70_clearbykeys_L000358_367)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358_364
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcv_696ddf70_clearbykeys_L000358_371)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r13)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hcv_696ddf70_clearbykeys_L000358_372)<<S32 ' JUMPV addrg
 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358_371
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358_372
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc8_696ddf70_iscleared_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hcv_696ddf70_clearbykeys_L000358_368)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358_368
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcv_696ddf70_clearbykeys_L000358_373)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc7_696ddf70_clearkey_L000035)<<S32 ' CALL addrg
 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358_373
' C_s3hcv_696ddf70_clearbykeys_L000358_365 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (16)<<S16A ' ADDP4 reg coni
 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358_367
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hcv_696ddf70_clearbykeys_L000358_364)<<S32 ' LTU4 reg reg
' C_s3hcv_696ddf70_clearbykeys_L000358_361 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_s3hcv_696ddf70_clearbykeys_L000358_363
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hcv_696ddf70_clearbykeys_L000358_360)<<S32 ' NEU4 reg coni
' C_s3hcv_696ddf70_clearbykeys_L000358_359 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375 ' <symbol:clearbyvalues>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_s3hc10_696ddf70_clearbyvalues_L000375_380)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_377
 word I16A_MOV + (r13)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_SHLI + (r22)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaH__realasize)<<S32 ' CALL addrg
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hc10_696ddf70_clearbyvalues_L000375_384)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_381
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r9)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r9)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc10_696ddf70_clearbyvalues_L000375_388)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r8)<<D16A + (r9)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc10_696ddf70_clearbyvalues_L000375_389)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_388
 word I16B_LODL + (r8)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_389
 word I16A_MOV + (r2)<<D16A + (r8)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc8_696ddf70_iscleared_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc10_696ddf70_clearbyvalues_L000375_385)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_385
' C_s3hc10_696ddf70_clearbyvalues_L000375_382 ' (symbol refcount = 0)
 word I16A_ADDI + (r15)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_384
 word I16A_CMP + (r15)<<D16A + (r10)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hc10_696ddf70_clearbyvalues_L000375_381)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc10_696ddf70_clearbyvalues_L000375_393)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_390
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc10_696ddf70_clearbyvalues_L000375_397)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r9)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc10_696ddf70_clearbyvalues_L000375_398)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_397
 word I16B_LODL + (r9)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_398
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc8_696ddf70_iscleared_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc10_696ddf70_clearbyvalues_L000375_394)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (16)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_394
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc10_696ddf70_clearbyvalues_L000375_399)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc7_696ddf70_clearkey_L000035)<<S32 ' CALL addrg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_399
' C_s3hc10_696ddf70_clearbyvalues_L000375_391 ' (symbol refcount = 0)
 word I16A_ADDSI + (r17)<<D16A + (16)<<S16A ' ADDP4 reg coni
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_393
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hc10_696ddf70_clearbyvalues_L000375_390)<<S32 ' LTU4 reg reg
' C_s3hc10_696ddf70_clearbyvalues_L000375_378 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_s3hc10_696ddf70_clearbyvalues_L000375_380
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc10_696ddf70_clearbyvalues_L000375_377)<<S32 ' NEU4 reg reg
' C_s3hc10_696ddf70_clearbyvalues_L000375_376 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc11_696ddf70_freeupval_L000401 ' <symbol:freeupval>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc11_696ddf70_freeupval_L000401_403)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaF__unlinkupval)<<S32 ' CALL addrg
 alignl_label
C_s3hc11_696ddf70_freeupval_L000401_403
 word I16A_MOVI + (r2)<<D16A + (20)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s3hc11_696ddf70_freeupval_L000401_402 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc12_696ddf70_freeobj_L000405 ' <symbol:freeobj>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 word I16A_CMPSI + (r19)<<D16A + (20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc12_696ddf70_freeobj_L000405_421)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (20)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc12_696ddf70_freeobj_L000405_423)<<S32 ' GTI4 reg coni
' C_s3hc12_696ddf70_freeobj_L000405_422 ' (symbol refcount = 0)
 word I16A_CMPSI + (r19)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hc12_696ddf70_freeobj_L000405_407)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (10)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc12_696ddf70_freeobj_L000405_407)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s3hc12_696ddf70_freeobj_L000405_424_L000426-16 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_424_L000426 ' <symbol:424>
 long @C_s3hc12_696ddf70_freeobj_L000405_420
 long @C_s3hc12_696ddf70_freeobj_L000405_414
 long @C_s3hc12_696ddf70_freeobj_L000405_412
 long @C_s3hc12_696ddf70_freeobj_L000405_416
 long @C_s3hc12_696ddf70_freeobj_L000405_415
 long @C_s3hc12_696ddf70_freeobj_L000405_411
 long @C_s3hc12_696ddf70_freeobj_L000405_410

' Catalina Code

DAT ' code segment
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_423
 alignl_p1
 long I32_MOVI + RI<<D32 + (38)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc12_696ddf70_freeobj_L000405_413)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_407)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_410
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaF__freeproto)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_408)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_411
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc11_696ddf70_freeupval_L000401)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_408)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_412
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_408)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_413
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHLI + (r20)<<D16A + (3)<<S16A ' SHLI4 reg coni
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_408)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_414
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaH__free)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_408)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_415
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaE__freethread)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_408)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_416
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc12_696ddf70_freeobj_L000405_418)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r17)<<D16A + (16)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_419)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_418
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r17)<<D16A + (20)<<S16A ' ADDU4 reg coni
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_419
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_408)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_420
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaS__remove)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_ADDSI + (r18)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A
 word I16A_ADDI + (r2)<<D16A + (16)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc12_696ddf70_freeobj_L000405_408)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_421
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r18)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A
 word I16A_ADDI + (r2)<<D16A + (16)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaM__free_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_407
 alignl_label
C_s3hc12_696ddf70_freeobj_L000405_408
' C_s3hc12_696ddf70_freeobj_L000405_406 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428 ' <symbol:sweeplist>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faaf00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r10)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r10)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' BXORI/U
 word I16A_XOR + (r13)<<D16A + (r20)<<S16A ' BXORI/U (3)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r10)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r11)<<D16B ' zero extend
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hc15_696ddf70_sweeplist_L000428_433)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428_430
 word I16A_RDLONG + (r9)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r8)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r8)<<D16B ' zero extend
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A ' BANDI/U
 word I16A_AND + (r22)<<D16A + (r13)<<S16A ' BANDI/U (3)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc15_696ddf70_sweeplist_L000428_434)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r9)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r2)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc12_696ddf70_freeobj_L000405)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc15_696ddf70_sweeplist_L000428_435)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428_434
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((-64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r8)<<S16A ' BANDI/U (2)
 word I16A_OR + (r20)<<D16A + (r11)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r21)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428_435
' C_s3hc15_696ddf70_sweeplist_L000428_431 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428_433
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc15_696ddf70_sweeplist_L000428_436)<<S32 ' EQU4 reg coni
 word I16A_CMPS + (r15)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hc15_696ddf70_sweeplist_L000428_430)<<S32 ' LTI4 reg reg
 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428_436
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc15_696ddf70_sweeplist_L000428_437)<<S32 ' EQU4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r17)<<S16A ' ASGNI4 reg reg
 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428_437
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc15_696ddf70_sweeplist_L000428_440)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r9)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_JMPA + (@C_s3hc15_696ddf70_sweeplist_L000428_441)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428_440
 word I16A_MOV + (r9)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc15_696ddf70_sweeplist_L000428_441
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
' C_s3hc15_696ddf70_sweeplist_L000428_429 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc16_696ddf70_sweeptolive_L000442 ' <symbol:sweeptolive>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc16_696ddf70_sweeptolive_L000442_444
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3hc15_696ddf70_sweeplist_L000428)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s3hc16_696ddf70_sweeptolive_L000442_445 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc16_696ddf70_sweeptolive_L000442_444)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s3hc16_696ddf70_sweeptolive_L000442_443 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc17_696ddf70_checkS_izes_L000447 ' <symbol:checkSizes>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc17_696ddf70_checkS_izes_L000447_449)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r18)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPS + (r22)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3hc17_696ddf70_checkS_izes_L000447_451)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaS__resize)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r18)<<D16A + (r16)<<S16A ' SUBI/P (1)
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_s3hc17_696ddf70_checkS_izes_L000447_451
 alignl_label
C_s3hc17_696ddf70_checkS_izes_L000447_449
' C_s3hc17_696ddf70_checkS_izes_L000447_448 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc18_696ddf70_udata2finalize_L000453 ' <symbol:udata2finalize>
 alignl_p1
 long I32_PSHM + $d50000<<S32 ' save registers
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffffbf ' reg <- con
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc18_696ddf70_udata2finalize_L000453_455)<<S32 ' GTI4 reg reg
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc18_696ddf70_udata2finalize_L000453_455)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((-57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOVI + (r16)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc18_696ddf70_udata2finalize_L000453_456)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc18_696ddf70_udata2finalize_L000453_455
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc18_696ddf70_udata2finalize_L000453_457)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_s3hc18_696ddf70_udata2finalize_L000453_457
 alignl_label
C_s3hc18_696ddf70_udata2finalize_L000453_456
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_s3hc18_696ddf70_udata2finalize_L000453_454 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3hc19_696ddf70_dothecall_L000459 ' <symbol:dothecall>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r20)<<D16A + (-(-16)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaD__callnoyield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_s3hc19_696ddf70_dothecall_L000459_460 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1a_696ddf70_G_C_T_M__L000461 ' <symbol:GCTM>
 alignl_p1
 long I32_NEWF + 32<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r19)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc18_696ddf70_udata2finalize_L000453)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r17)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaT__gettmbyobj)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1a_696ddf70_G_C_T_M__L000461_463)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((62)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((62)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r1)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r18)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r1)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_CPYB + 4<<S32 ' ASGNB
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((34)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDWORD + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r20)<<D16A + (-(-16)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16B_LODL + (r5)<<D16B
 alignl_p1
 long @C_s3hc19_696ddf70_dothecall_L000459 ' reg ARG ADDRG
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_luaD__pcall)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((34)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDWORD + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((-129)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNU2 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (7)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((62)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1a_696ddf70_G_C_T_M__L000461_465)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_s3hc1a_696ddf70_G_C_T_M__L000461_467_L000468 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaE__warnerror)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r18)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_s3hc1a_696ddf70_G_C_T_M__L000461_465
 alignl_label
C_s3hc1a_696ddf70_G_C_T_M__L000461_463
' C_s3hc1a_696ddf70_G_C_T_M__L000461_462 ' (symbol refcount = 0)
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1c_696ddf70_runafewfinalizers_L000469 ' <symbol:runafewfinalizers>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_s3hc1c_696ddf70_runafewfinalizers_L000469_474)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1c_696ddf70_runafewfinalizers_L000469_471
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1a_696ddf70_G_C_T_M__L000461)<<S32 ' CALL addrg
' C_s3hc1c_696ddf70_runafewfinalizers_L000469_472 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_s3hc1c_696ddf70_runafewfinalizers_L000469_474
 word I16A_CMPS + (r19)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3hc1c_696ddf70_runafewfinalizers_L000469_475)<<S32 ' GEI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1c_696ddf70_runafewfinalizers_L000469_471)<<S32 ' NEU4 reg coni
 alignl_label
C_s3hc1c_696ddf70_runafewfinalizers_L000469_475
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_s3hc1c_696ddf70_runafewfinalizers_L000469_470 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1d_696ddf70_callallpendingfinalizers_L000476 ' <symbol:callallpendingfinalizers>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc1d_696ddf70_callallpendingfinalizers_L000476_479)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1d_696ddf70_callallpendingfinalizers_L000476_478
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1a_696ddf70_G_C_T_M__L000461)<<S32 ' CALL addrg
 alignl_label
C_s3hc1d_696ddf70_callallpendingfinalizers_L000476_479
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1d_696ddf70_callallpendingfinalizers_L000476_478)<<S32 ' NEU4 reg coni
' C_s3hc1d_696ddf70_callallpendingfinalizers_L000476_477 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1e_696ddf70_findlast_L000481 ' <symbol:findlast>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 alignl_p1
 long I32_JMPA + (@C_s3hc1e_696ddf70_findlast_L000481_484)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1e_696ddf70_findlast_L000481_483
 word I16A_RDLONG + (r2)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_s3hc1e_696ddf70_findlast_L000481_484
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1e_696ddf70_findlast_L000481_483)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
' C_s3hc1e_696ddf70_findlast_L000481_482 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1f_696ddf70_separatetobefnz_L000486 ' <symbol:separatetobefnz>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r17)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1e_696ddf70_findlast_L000481)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hc1f_696ddf70_separatetobefnz_L000486_489)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1f_696ddf70_separatetobefnz_L000486_488
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1f_696ddf70_separatetobefnz_L000486_491)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1f_696ddf70_separatetobefnz_L000486_491)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hc1f_696ddf70_separatetobefnz_L000486_492)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1f_696ddf70_separatetobefnz_L000486_491
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((124)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1f_696ddf70_separatetobefnz_L000486_493)<<S32 ' NEU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((124)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_s3hc1f_696ddf70_separatetobefnz_L000486_493
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 word I16A_WRLONG + (r19)<<D16A + (r15)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc1f_696ddf70_separatetobefnz_L000486_492
 alignl_label
C_s3hc1f_696ddf70_separatetobefnz_L000486_489
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1f_696ddf70_separatetobefnz_L000486_488)<<S32 ' NEU4 reg reg
' C_s3hc1f_696ddf70_separatetobefnz_L000486_487 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1g_696ddf70_checkpointer_L000495 ' <symbol:checkpointer>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r20)<<D16A + (r3)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1g_696ddf70_checkpointer_L000495_497)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r3)<<S16A ' ASGNP4 reg reg
 alignl_label
C_s3hc1g_696ddf70_checkpointer_L000495_497
' C_s3hc1g_696ddf70_checkpointer_L000495_496 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1h_696ddf70_correctpointers_L000499 ' <symbol:correctpointers>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((108)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1g_696ddf70_checkpointer_L000495)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((112)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1g_696ddf70_checkpointer_L000495)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((116)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1g_696ddf70_checkpointer_L000495)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1g_696ddf70_checkpointer_L000495)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s3hc1h_696ddf70_correctpointers_L000499_500 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_checkfinalizer

 alignl_label
C_luaC__checkfinalizer ' <symbol:luaC_checkfinalizer>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ffa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaC__checkfinalizer_507)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaC__checkfinalizer_508)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r15)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_JMPA + (@C_luaC__checkfinalizer_509)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__checkfinalizer_508
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (6)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaC__checkfinalizer_510)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_JMPA + (@C_luaC__checkfinalizer_511)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__checkfinalizer_510
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((160)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaT__gettm)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaC__checkfinalizer_511
 word I16A_MOV + (r15)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_luaC__checkfinalizer_509
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaC__checkfinalizer_507)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((62)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaC__checkfinalizer_502)<<S32 ' EQI4 reg coni
 alignl_label
C_luaC__checkfinalizer_507
 alignl_p1
 long I32_JMPA + (@C_luaC__checkfinalizer_501)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__checkfinalizer_502
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaC__checkfinalizer_512)<<S32 ' GTI4 reg reg
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BR_A + (@C_luaC__checkfinalizer_512)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((-57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_MOVI + (r16)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r18)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaC__checkfinalizer_513)<<S32 ' NEU4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc16_696ddf70_sweeptolive_L000442)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C_luaC__checkfinalizer_513)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__checkfinalizer_512
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1h_696ddf70_correctpointers_L000499)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaC__checkfinalizer_513
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r11)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r11)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_JMPA + (@C_luaC__checkfinalizer_519)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__checkfinalizer_516
' C_luaC__checkfinalizer_517 ' (symbol refcount = 0)
 word I16A_RDLONG + (r11)<<D16A + (r11)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_luaC__checkfinalizer_519
 word I16A_RDLONG + (r22)<<D16A + (r11)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaC__checkfinalizer_516)<<S32 ' NEU4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r11)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_luaC__checkfinalizer_501
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1i_696ddf70_setpause_L000520 ' <symbol:setpause>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_SHLI + (r19)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(100)<<S32 ' reg <- conli
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2147483647 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_CMPS + (r19)<<D16A + (r0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3hc1i_696ddf70_setpause_L000520_523)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hc1i_696ddf70_setpause_L000520_524)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1i_696ddf70_setpause_L000520_523
 word I16B_LODL + (r15)<<D16B
 alignl_p1
 long 2147483647 ' reg <- con
 alignl_label
C_s3hc1i_696ddf70_setpause_L000520_524
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r15)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3hc1i_696ddf70_setpause_L000520_525)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_s3hc1i_696ddf70_setpause_L000520_525
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaE__setdebt)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s3hc1i_696ddf70_setpause_L000520_521 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527 ' <symbol:sweep2old>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r17)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc1j_696ddf70_sweep2old_L000527_530)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527_529
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1j_696ddf70_sweep2old_L000527_532)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc12_696ddf70_freeobj_L000405)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc1j_696ddf70_sweep2old_L000527_533)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527_532
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_NEGI + (r18)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOVI + (r18)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1j_696ddf70_sweep2old_L000527_534)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' ADDI/P
 word I16A_ADDS + (r3)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r4)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc6_696ddf70_linkgclist__L000033)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc1j_696ddf70_sweep2old_L000527_535)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527_534
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (9)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1j_696ddf70_sweep2old_L000527_536)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1j_696ddf70_sweep2old_L000527_536)<<S32 ' EQU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16B_LODL + (r18)<<D16B
 alignl_p1
 long $ffffffc7 ' reg <- con
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc1j_696ddf70_sweep2old_L000527_537)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527_536
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527_537
 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527_535
 word I16A_MOV + (r21)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527_533
 alignl_label
C_s3hc1j_696ddf70_sweep2old_L000527_530
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1j_696ddf70_sweep2old_L000527_529)<<S32 ' NEU4 reg coni
' C_s3hc1j_696ddf70_sweep2old_L000527_528 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538_nextage_L000541 ' <symbol:nextage>
 byte 1
 byte 3
 byte 3
 byte 4
 byte 4
 byte 5
 byte 6

' Catalina Code

DAT ' code segment

 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538 ' <symbol:sweepgen>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $ffa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r13)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s3hc1k_696ddf70_sweepgen_L000538_543)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538_542
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1k_696ddf70_sweepgen_L000538_545)<<S32 ' EQI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r15)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc12_696ddf70_freeobj_L000405)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc1k_696ddf70_sweepgen_L000538_546)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538_545
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1k_696ddf70_sweepgen_L000538_547)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((-64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r11)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r11)<<D16A + (r20)<<S16A ' BANDI/U (3)
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_OR + (r20)<<D16A + (r11)<<S16A ' BORI/U (2)
 word I16A_OR + (r20)<<D16A + (r13)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc1k_696ddf70_sweepgen_L000538_548)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538_547
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_NEGI + (r18)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r18)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_MOVI + (r16)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r16)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r16)<<D16B
 alignl_p1
 long @C_s3hc1k_696ddf70_sweepgen_L000538_nextage_L000541 ' reg <- addrg
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (2)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1k_696ddf70_sweepgen_L000538_549)<<S32 ' NEI4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1k_696ddf70_sweepgen_L000538_549)<<S32 ' NEU4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538_549
 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538_548
 word I16A_MOV + (r21)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538_546
 alignl_label
C_s3hc1k_696ddf70_sweepgen_L000538_543
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1k_696ddf70_sweepgen_L000538_542)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_s3hc1k_696ddf70_sweepgen_L000538_539 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1m_696ddf70_whitelist_L000551 ' <symbol:whitelist>
 alignl_p1
 long I32_PSHM + $d40000<<S32 ' save registers
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r23)<<D16B ' zero extend
 alignl_p1
 long I32_JMPA + (@C_s3hc1m_696ddf70_whitelist_L000551_556)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1m_696ddf70_whitelist_L000551_553
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((-64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_OR + (r20)<<D16A + (r23)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_s3hc1m_696ddf70_whitelist_L000551_554 ' (symbol refcount = 0)
 word I16A_RDLONG + (r2)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_s3hc1m_696ddf70_whitelist_L000551_556
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1m_696ddf70_whitelist_L000551_553)<<S32 ' NEU4 reg coni
' C_s3hc1m_696ddf70_whitelist_L000551_552 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557 ' <symbol:correctgraylist>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_s3hc1n_696ddf70_correctgraylist_L000557_560)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557_559
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc3_696ddf70_getgclist_L000017)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1n_696ddf70_correctgraylist_L000557_562)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc1n_696ddf70_correctgraylist_L000557_564)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557_562
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1n_696ddf70_correctgraylist_L000557_565)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_XOR + (r20)<<D16A + (r18)<<S16A ' BXORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc1n_696ddf70_correctgraylist_L000557_567)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557_565
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1n_696ddf70_correctgraylist_L000557_568)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_s3hc1n_696ddf70_correctgraylist_L000557_567)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557_568
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1n_696ddf70_correctgraylist_L000557_570)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_XOR + (r20)<<D16A + (r18)<<S16A ' BXORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557_570
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_OR + (r20)<<D16A + (r18)<<S16A ' BORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557_564
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc1n_696ddf70_correctgraylist_L000557_560)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557_567
 word I16A_MOV + (r23)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc1n_696ddf70_correctgraylist_L000557_560
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1n_696ddf70_correctgraylist_L000557_559)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_s3hc1n_696ddf70_correctgraylist_L000557_558 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1o_696ddf70_correctgraylists_L000572 ' <symbol:correctgraylists>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1n_696ddf70_correctgraylist_L000557)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((88)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((88)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1n_696ddf70_correctgraylist_L000557)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1n_696ddf70_correctgraylist_L000557)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((92)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((92)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1n_696ddf70_correctgraylist_L000557)<<S32 ' CALL addrg
' C_s3hc1o_696ddf70_correctgraylists_L000572_573 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1p_696ddf70_markold_L000574 ' <symbol:markold>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hc1p_696ddf70_markold_L000574_579)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc1p_696ddf70_markold_L000574_576
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1p_696ddf70_markold_L000574_580)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_XOR + (r20)<<D16A + (r18)<<S16A ' BXORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1p_696ddf70_markold_L000574_582)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hc1p_696ddf70_markold_L000574_582
 alignl_label
C_s3hc1p_696ddf70_markold_L000574_580
' C_s3hc1p_696ddf70_markold_L000574_577 ' (symbol refcount = 0)
 word I16A_RDLONG + (r17)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 alignl_label
C_s3hc1p_696ddf70_markold_L000574_579
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1p_696ddf70_markold_L000574_576)<<S32 ' NEU4 reg reg
' C_s3hc1p_696ddf70_markold_L000574_575 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1q_696ddf70_finishgencycle_L000584 ' <symbol:finishgencycle>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1o_696ddf70_correctgraylists_L000572)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc17_696ddf70_checkS_izes_L000447)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc1q_696ddf70_finishgencycle_L000584_586)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1d_696ddf70_callallpendingfinalizers_L000476)<<S32 ' CALL addrg
 alignl_label
C_s3hc1q_696ddf70_finishgencycle_L000584_586
' C_s3hc1q_696ddf70_finishgencycle_L000584_585 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1r_696ddf70_youngcollection_L000588 ' <symbol:youngcollection>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1r_696ddf70_youngcollection_L000588_590)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((116)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc1p_696ddf70_markold_L000574)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C_s3hc1r_696ddf70_youngcollection_L000588_590
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((132)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc1p_696ddf70_markold_L000574)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc1p_696ddf70_markold_L000574)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1_696ddf70_atomic_L000015)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((108)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3hc1k_696ddf70_sweepgen_L000538)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((112)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3hc1k_696ddf70_sweepgen_L000538)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((116)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((112)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((112)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((108)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((124)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3hc1k_696ddf70_sweepgen_L000538)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3hc1k_696ddf70_sweepgen_L000538)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((132)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r19)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((124)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl_p1
 long I32_CALA + (@C_s3hc1k_696ddf70_sweepgen_L000538)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1q_696ddf70_finishgencycle_L000584)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s3hc1r_696ddf70_youngcollection_L000588_589 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1s_696ddf70_atomic2gen_L000592 ' <symbol:atomic2gen>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hce_696ddf70_cleargraylists_L000119)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1j_696ddf70_sweep2old_L000527)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((108)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((112)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((116)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((120)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1j_696ddf70_sweep2old_L000527)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((124)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((132)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1j_696ddf70_sweep2old_L000527)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((58)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1q_696ddf70_finishgencycle_L000584)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s3hc1s_696ddf70_atomic2gen_L000592_593 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1t_696ddf70_setminordebt_L000594 ' <symbol:setminordebt>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(100)<<S32 ' reg <- conli
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_NEG + (r2)<<D16A + (r0)<<S16A ' NEGI4
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaE__setdebt)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
' C_s3hc1t_696ddf70_setminordebt_L000594_595 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1u_696ddf70_entergen_L000596 ' <symbol:entergen>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (256)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__runtilstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__runtilstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1_696ddf70_atomic_L000015)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1s_696ddf70_atomic2gen_L000592)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1t_696ddf70_setminordebt_L000594)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
' C_s3hc1u_696ddf70_entergen_L000596_597 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1v_696ddf70_enterinc_L000598 ' <symbol:enterinc>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1m_696ddf70_whitelist_L000551)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((108)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((112)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((116)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1m_696ddf70_whitelist_L000551)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1m_696ddf70_whitelist_L000551)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 0 ' reg <- con
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((124)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((132)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((58)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_s3hc1v_696ddf70_enterinc_L000598_599 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_changemode

 alignl_label
C_luaC__changemode ' <symbol:luaC_changemode>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((58)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaC__changemode_601)<<S32 ' EQI4 reg reg
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaC__changemode_603)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1u_696ddf70_entergen_L000596)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaC__changemode_604)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__changemode_603
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1v_696ddf70_enterinc_L000598)<<S32 ' CALL addrg
 alignl_label
C_luaC__changemode_604
 alignl_label
C_luaC__changemode_601
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
' C_luaC__changemode_600 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc20_696ddf70_fullgen_L000605 ' <symbol:fullgen>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1v_696ddf70_enterinc_L000598)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1u_696ddf70_entergen_L000596)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s3hc20_696ddf70_fullgen_L000605_606 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc21_696ddf70_stepgenfull_L000607 ' <symbol:stepgenfull>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((58)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc21_696ddf70_stepgenfull_L000607_609)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1v_696ddf70_enterinc_L000598)<<S32 ' CALL addrg
 alignl_label
C_s3hc21_696ddf70_stepgenfull_L000607_609
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__runtilstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1_696ddf70_atomic_L000015)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A
 word I16A_SHRI + (r20)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r20)<<D16A + (r19)<<S16A ' ADDU (2)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3hc21_696ddf70_stepgenfull_L000607_611)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1s_696ddf70_atomic2gen_L000592)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1t_696ddf70_setminordebt_L000594)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc21_696ddf70_stepgenfull_L000607_612)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc21_696ddf70_stepgenfull_L000607_611
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc2_696ddf70_entersweep_L000016)<<S32 ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (256)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__runtilstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1i_696ddf70_setpause_L000520)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_s3hc21_696ddf70_stepgenfull_L000607_612
' C_s3hc21_696ddf70_stepgenfull_L000607_608 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc22_696ddf70_genstep_L000613 ' <symbol:genstep>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $f40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc22_696ddf70_genstep_L000613_615)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc21_696ddf70_stepgenfull_L000607)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc22_696ddf70_genstep_L000613_616)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc22_696ddf70_genstep_L000613_615
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(100)<<S32 ' reg <- conli
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((61)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3hc22_696ddf70_genstep_L000613_617)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3hc22_696ddf70_genstep_L000613_617)<<S32 ' LEU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc20_696ddf70_fullgen_L000605)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_SHRI + (r18)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_s3hc22_696ddf70_genstep_L000613_619)<<S32 ' GEU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc22_696ddf70_genstep_L000613_618)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc22_696ddf70_genstep_L000613_619
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1i_696ddf70_setpause_L000520)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc22_696ddf70_genstep_L000613_618)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc22_696ddf70_genstep_L000613_617
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1r_696ddf70_youngcollection_L000588)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1t_696ddf70_setminordebt_L000594)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_label
C_s3hc22_696ddf70_genstep_L000613_618
 alignl_label
C_s3hc22_696ddf70_genstep_L000613_616
' C_s3hc22_696ddf70_genstep_L000613_614 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc2_696ddf70_entersweep_L000016 ' <symbol:entersweep>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc16_696ddf70_sweeptolive_L000442)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
' C_s3hc2_696ddf70_entersweep_L000016_621 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc23_696ddf70_deletelist_L000622 ' <symbol:deletelist>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_JMPA + (@C_s3hc23_696ddf70_deletelist_L000622_625)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc23_696ddf70_deletelist_L000622_624
 word I16A_RDLONG + (r17)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc12_696ddf70_freeobj_L000405)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc23_696ddf70_deletelist_L000622_625
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc23_696ddf70_deletelist_L000622_624)<<S32 ' NEU4 reg reg
' C_s3hc23_696ddf70_deletelist_L000622_623 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_freeallobjects

 alignl_label
C_luaC__freeallobjects ' <symbol:luaC_freeallobjects>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((62)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__changemode)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1f_696ddf70_separatetobefnz_L000486)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1d_696ddf70_callallpendingfinalizers_L000476)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((144)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((68)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc23_696ddf70_deletelist_L000622)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((104)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc23_696ddf70_deletelist_L000622)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_luaC__freeallobjects_627 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc1_696ddf70_atomic_L000015 ' <symbol:atomic>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((84)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1_696ddf70_atomic_L000015_629)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hc1_696ddf70_atomic_L000015_629
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((64)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1_696ddf70_atomic_L000015_631)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_ADDSI + (r22)<<D16A + (5)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOVI + (r20)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc1_696ddf70_atomic_L000015_631)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc_696ddf70_reallymarkobject_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hc1_696ddf70_atomic_L000015_631
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcb_696ddf70_markmt_L000086)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hct_696ddf70_propagateall_L000340)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcd_696ddf70_remarkupvals_L000104)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hct_696ddf70_propagateall_L000340)<<S32 ' CALL addrg
 word I16A_ADD + (r19)<<D16A + (r0)<<S16A ' ADDU (1)
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hct_696ddf70_propagateall_L000340)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcu_696ddf70_convergeephemerons_L000345)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((88)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc10_696ddf70_clearbyvalues_L000375)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc10_696ddf70_clearbyvalues_L000375)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((88)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1f_696ddf70_separatetobefnz_L000486)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcc_696ddf70_markbeingfnz_L000096)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hct_696ddf70_propagateall_L000340)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r19)<<D16A + (r22)<<S16A ' ADDU (1)
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcu_696ddf70_convergeephemerons_L000345)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((92)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcv_696ddf70_clearbykeys_L000358)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hcv_696ddf70_clearbykeys_L000358)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((88)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc10_696ddf70_clearbyvalues_L000375)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((96)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r3)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_s3hc10_696ddf70_clearbyvalues_L000375)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaS__clearcache)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((56)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_MOVI + (r18)<<D16A + (24)<<S16A ' reg <- coni
 word I16A_XOR + (r20)<<D16A + (r18)<<S16A ' BXORI/U (1)
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_s3hc1_696ddf70_atomic_L000015_628 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc24_696ddf70_sweepstep_L000633 ' <symbol:sweepstep>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $ff0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc24_696ddf70_sweepstep_L000633_635)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (100)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r4)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3hc15_696ddf70_sweeplist_L000428)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r16)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SUBS + (r18)<<D16A + (r16)<<S16A ' SUBI/P (1)
 word I16A_ADD + (r20)<<D16A + (r18)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_JMPA + (@C_s3hc24_696ddf70_sweepstep_L000633_634)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc24_696ddf70_sweepstep_L000633_635
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((72)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_s3hc24_696ddf70_sweepstep_L000633_634
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc25_696ddf70_singlestep_L000637 ' <symbol:singlestep>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fc0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((59)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r19)<<D16B ' zero extend
 word I16A_CMPSI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_s3hc25_696ddf70_singlestep_L000637_639)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc25_696ddf70_singlestep_L000637_639)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s3hc25_696ddf70_singlestep_L000637_654_L000656 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + RI<<D16A + (r22)<<S16A
 word I16B_JMPI ' JUMPV INDIR reg
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_654_L000656 ' <symbol:654>
 long @C_s3hc25_696ddf70_singlestep_L000637_643
 long @C_s3hc25_696ddf70_singlestep_L000637_646
 long @C_s3hc25_696ddf70_singlestep_L000637_639
 long @C_s3hc25_696ddf70_singlestep_L000637_647
 long @C_s3hc25_696ddf70_singlestep_L000637_648
 long @C_s3hc25_696ddf70_singlestep_L000637_649
 long @C_s3hc25_696ddf70_singlestep_L000637_650
 long @C_s3hc25_696ddf70_singlestep_L000637_651
 long @C_s3hc25_696ddf70_singlestep_L000637_642

' Catalina Code

DAT ' code segment
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_642
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcf_696ddf70_restartcollection_L000121)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_643
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc25_696ddf70_singlestep_L000637_644)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_644
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hcq_696ddf70_propagatemark_L000324)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_646
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1_696ddf70_atomic_L000015)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc2_696ddf70_entersweep_L000016)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r18)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_647
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((76)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r3)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3hc24_696ddf70_sweepstep_L000633)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_648
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + (r3)<<D16A + (5)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3hc24_696ddf70_sweepstep_L000633)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_649
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C_s3hc24_696ddf70_sweepstep_L000633)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_650
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc17_696ddf70_checkS_izes_L000447)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (7)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_651
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((100)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_s3hc25_696ddf70_singlestep_L000637_652)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc25_696ddf70_singlestep_L000637_652)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((59)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r2)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc1c_696ddf70_runafewfinalizers_L000469)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_652
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_640)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_639
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_s3hc25_696ddf70_singlestep_L000637_638)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_640
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((59)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl_label
C_s3hc25_696ddf70_singlestep_L000637_638
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_runtilstate

 alignl_label
C_luaC__runtilstate ' <symbol:luaC_runtilstate>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_JMPA + (@C_luaC__runtilstate_659)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__runtilstate_658
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc25_696ddf70_singlestep_L000637)<<S32 ' CALL addrg
 alignl_label
C_luaC__runtilstate_659
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaC__runtilstate_658)<<S32 ' EQI4 reg coni
' C_luaC__runtilstate_657 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc28_696ddf70_incstep_L000661 ' <symbol:incstep>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $faa800<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((65)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r15)<<D16A + (r20)<<S16A ' BORI/U (3)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((66)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPI + (r22)<<D16A + (30)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc28_696ddf70_incstep_L000661_664)<<S32 ' GTU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((66)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_SHL + (r22)<<D16A + (r20)<<S16A ' LSHI/U (1)
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_s3hc28_696ddf70_incstep_L000661_665)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc28_696ddf70_incstep_L000661_664
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long $7fffffff ' reg <- con
 alignl_label
C_s3hc28_696ddf70_incstep_L000661_665
 word I16A_MOV + (r17)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_s3hc28_696ddf70_incstep_L000661_666
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc25_696ddf70_singlestep_L000637)<<S32 ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r11)<<S16A ' SUBU (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_s3hc28_696ddf70_incstep_L000661_667 ' (symbol refcount = 0)
 word I16A_NEG + (r22)<<D16A + (r17)<<S16A ' NEGI4
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_s3hc28_696ddf70_incstep_L000661_669)<<S32 ' LEI4 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc28_696ddf70_incstep_L000661_666)<<S32 ' NEI4 reg coni
 alignl_label
C_s3hc28_696ddf70_incstep_L000661_669
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_s3hc28_696ddf70_incstep_L000661_670)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1i_696ddf70_setpause_L000520)<<S32 ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_s3hc28_696ddf70_incstep_L000661_671)<<S32 ' JUMPV addrg
 alignl_label
C_s3hc28_696ddf70_incstep_L000661_670
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r22)<<D16A + (3)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaE__setdebt)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_s3hc28_696ddf70_incstep_L000661_671
' C_s3hc28_696ddf70_incstep_L000661_662 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_step

 alignl_label
C_luaC__step ' <symbol:luaC_step>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((62)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaC__step_673)<<S32 ' EQI4 reg coni
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-2000)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaE__setdebt)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaC__step_674)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__step_673
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((58)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaC__step_677)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_luaC__step_675)<<S32 ' EQU4 reg coni
 alignl_label
C_luaC__step_677
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc22_696ddf70_genstep_L000613)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaC__step_676)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__step_675
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc28_696ddf70_incstep_L000661)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaC__step_676
 alignl_label
C_luaC__step_674
' C_luaC__step_672 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_s3hc29_696ddf70_fullinc_L000678 ' <symbol:fullinc>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BR_A + (@C_s3hc29_696ddf70_fullinc_L000678_680)<<S32 ' GTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc2_696ddf70_entersweep_L000016)<<S32 ' CALL addrg
 alignl_label
C_s3hc29_696ddf70_fullinc_L000678_680
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (256)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__runtilstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__runtilstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((57)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (128)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__runtilstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (256)<<S32 ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaC__runtilstate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_s3hc1i_696ddf70_setpause_L000520)<<S32 ' CALL addrg
' C_s3hc29_696ddf70_fullinc_L000678_679 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export luaC_fullgc

 alignl_label
C_luaC__fullgc ' <symbol:luaC_fullgc>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((58)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_luaC__fullgc_683)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc29_696ddf70_fullinc_L000678)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_luaC__fullgc_684)<<S32 ' JUMPV addrg
 alignl_label
C_luaC__fullgc_683
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_s3hc20_696ddf70_fullgen_L000605)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_luaC__fullgc_684
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
' C_luaC__fullgc_682 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import luaH_realasize

' Catalina Import luaH_free

' Catalina Import luaS_remove

' Catalina Import luaS_clearcache

' Catalina Import luaS_resize

' Catalina Import luaF_freeproto

' Catalina Import luaF_unlinkupval

' Catalina Import luaD_shrinkstack

' Catalina Import luaD_pcall

' Catalina Import luaD_callnoyield

' Catalina Import luaE_warnerror

' Catalina Import luaE_freethread

' Catalina Import luaE_setdebt

' Catalina Import luaM_malloc_

' Catalina Import luaM_free_

' Catalina Import luaT_gettmbyobj

' Catalina Import luaT_gettm

' Catalina Import strchr

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_s3hc1a_696ddf70_G_C_T_M__L000461_467_L000468 ' <symbol:467>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

' Catalina Code

DAT ' code segment
' end
