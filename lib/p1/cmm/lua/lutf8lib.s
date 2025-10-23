' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_sku4_68f738c6_u_posrelat_L000004 ' <symbol:u_posrelat>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_CMPSI + (r3)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sku4_68f738c6_u_posrelat_L000004_6)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sku4_68f738c6_u_posrelat_L000004_5)<<S32 ' JUMPV addrg
 alignl_label
C_sku4_68f738c6_u_posrelat_L000004_6
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_CMP + (r22)<<D16A + (r2)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku4_68f738c6_u_posrelat_L000004_8)<<S32 ' LEU4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sku4_68f738c6_u_posrelat_L000004_5)<<S32 ' JUMPV addrg
 alignl_label
C_sku4_68f738c6_u_posrelat_L000004_8
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r3)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sku4_68f738c6_u_posrelat_L000004_5
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_limits_L000013 ' <symbol:limits>
 long $ffffffff
 long $80
 long $800
 long $10000
 long $200000
 long $4000000

' Catalina Code

DAT ' code segment

 alignl_label
C_sku41_68f738c6_utf8_decode_L000010 ' <symbol:utf8_decode>
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_RDBYTE + (r22)<<D16A + (r4)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMP + (r21)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_sku41_68f738c6_utf8_decode_L000010_14)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r23)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sku41_68f738c6_utf8_decode_L000010_15)<<S32 ' JUMPV addrg
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_14
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sku41_68f738c6_utf8_decode_L000010_19)<<S32 ' JUMPV addrg
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_16
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r4)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(192)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r17)<<S16A ' BANDI/U (2)
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMP + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sku41_68f738c6_utf8_decode_L000010_20)<<S32 ' EQU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_sku41_68f738c6_utf8_decode_L000010_11)<<S32 ' JUMPV addrg
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_20
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (6)<<S16A ' SHLU4 reg coni
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(63)<<S32 ' reg <- conli
 word I16A_AND + (r20)<<D16A + (r17)<<S16A ' BANDI/U (2)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r23)<<D16A + (r20)<<S16A ' BORI/U (3)
' C_sku41_68f738c6_utf8_decode_L000010_17 ' (symbol refcount = 0)
 word I16A_SHLI + (r21)<<D16A + (1)<<S16A ' SHLU4 reg coni
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_19
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(64)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku41_68f738c6_utf8_decode_L000010_16)<<S32 ' NEU4 reg coni
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(127)<<S32 ' reg <- conli
 word I16A_AND + (r22)<<D16A + (r21)<<S16A ' BANDI/U (2)
 word I16A_MOVI + (r20)<<D16A + (5)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_SHL + (r22)<<D16A + (r0)<<S16A ' LSHI/U (1)
 word I16A_OR + (r23)<<D16A + (r22)<<S16A ' BORI/U (1)
 word I16A_CMPSI + (r19)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sku41_68f738c6_utf8_decode_L000010_25)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7fffffff ' reg <- con
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sku41_68f738c6_utf8_decode_L000010_25)<<S32 ' GTU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_sku41_68f738c6_utf8_decode_L000010_limits_L000013 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sku41_68f738c6_utf8_decode_L000010_22)<<S32 ' GEU4 reg reg
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_25
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_sku41_68f738c6_utf8_decode_L000010_11)<<S32 ' JUMPV addrg
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_22
 word I16A_ADDS + (r4)<<D16A + (r19)<<S16A ' ADDI/P (2)
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_15
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sku41_68f738c6_utf8_decode_L000010_26)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $10ffff ' reg <- con
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sku41_68f738c6_utf8_decode_L000010_30)<<S32 ' GTU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $d800 ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r23)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sku41_68f738c6_utf8_decode_L000010_28)<<S32 ' GTU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $dfff ' reg <- con
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sku41_68f738c6_utf8_decode_L000010_28)<<S32 ' GTU4 reg reg
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_30
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_sku41_68f738c6_utf8_decode_L000010_11)<<S32 ' JUMPV addrg
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_28
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_26
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sku41_68f738c6_utf8_decode_L000010_31)<<S32 ' EQU4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r3)<<S16A ' ASGNU4 reg reg
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_31
 word I16A_MOV + (r0)<<D16A + (r4)<<S16A
 word I16A_ADDSI + (r0)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl_label
C_sku41_68f738c6_utf8_decode_L000010_11
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

 alignl_label
C_sku43_68f738c6_utflen_L000033 ' <symbol:utflen>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r17)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4_68f738c6_u_posrelat_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4_68f738c6_u_posrelat_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sku43_68f738c6_utflen_L000033_38)<<S32 ' GTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku43_68f738c6_utflen_L000033_37)<<S32 ' LEI4 reg reg
 alignl_label
C_sku43_68f738c6_utflen_L000033_38
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku43_68f738c6_utflen_L000033_35_L000036 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sku43_68f738c6_utflen_L000033_37
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sku43_68f738c6_utflen_L000033_41)<<S32 ' LTI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku43_68f738c6_utflen_L000033_39_L000040 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sku43_68f738c6_utflen_L000033_41
 alignl_p1
 long I32_JMPA + (@C_sku43_68f738c6_utflen_L000033_43)<<S32 ' JUMPV addrg
 alignl_label
C_sku43_68f738c6_utflen_L000033_42
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku43_68f738c6_utflen_L000033_46)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sku43_68f738c6_utflen_L000033_47)<<S32 ' JUMPV addrg
 alignl_label
C_sku43_68f738c6_utflen_L000033_46
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sku43_68f738c6_utflen_L000033_47
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sku41_68f738c6_utf8_decode_L000010)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku43_68f738c6_utflen_L000033_48)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sku43_68f738c6_utflen_L000033_34)<<S32 ' JUMPV addrg
 alignl_label
C_sku43_68f738c6_utflen_L000033_48
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_SUB + (r22)<<D16A + (r20)<<S16A ' SUBU (1)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sku43_68f738c6_utflen_L000033_43
 word I16A_CMPS + (r21)<<D16A + (r15)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku43_68f738c6_utflen_L000033_42)<<S32 ' LEI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sku43_68f738c6_utflen_L000033_34
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sku46_68f738c6_codepoint_L000050 ' <symbol:codepoint>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $faac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4_68f738c6_u_posrelat_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4_68f738c6_u_posrelat_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (4)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r13)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sku46_68f738c6_codepoint_L000050_54)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku46_68f738c6_codepoint_L000050_52_L000053 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sku46_68f738c6_codepoint_L000050_54
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPS + (r11)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku46_68f738c6_codepoint_L000050_55)<<S32 ' LEI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku46_68f738c6_codepoint_L000050_52_L000053 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sku46_68f738c6_codepoint_L000050_55
 word I16A_CMPS + (r13)<<D16A + (r11)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku46_68f738c6_codepoint_L000050_56)<<S32 ' LEI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sku46_68f738c6_codepoint_L000050_51)<<S32 ' JUMPV addrg
 alignl_label
C_sku46_68f738c6_codepoint_L000050_56
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r13)<<S16A ' SUBI/P (3)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 2147483647 ' reg <- con
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sku46_68f738c6_codepoint_L000050_58)<<S32 ' LTI4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku46_68f738c6_codepoint_L000050_60_L000061 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sku46_68f738c6_codepoint_L000050_51)<<S32 ' JUMPV addrg
 alignl_label
C_sku46_68f738c6_codepoint_L000050_58
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r13)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku46_68f738c6_codepoint_L000050_60_L000061 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checkstack)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r15)<<D16A + (r11)<<S16A ' ADDI/P
 word I16A_ADDS + (r15)<<D16A + (r21)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r22)<<D16A + (r13)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_ADDS + (r21)<<D16A + (r22)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_sku46_68f738c6_codepoint_L000050_65)<<S32 ' JUMPV addrg
 alignl_label
C_sku46_68f738c6_codepoint_L000050_62
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku46_68f738c6_codepoint_L000050_67)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r10)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sku46_68f738c6_codepoint_L000050_68)<<S32 ' JUMPV addrg
 alignl_label
C_sku46_68f738c6_codepoint_L000050_67
 word I16A_MOVI + (r10)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sku46_68f738c6_codepoint_L000050_68
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sku41_68f738c6_utf8_decode_L000010)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku46_68f738c6_codepoint_L000050_69)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku46_68f738c6_codepoint_L000050_71_L000072 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sku46_68f738c6_codepoint_L000050_51)<<S32 ' JUMPV addrg
 alignl_label
C_sku46_68f738c6_codepoint_L000050_69
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_sku46_68f738c6_codepoint_L000050_63 ' (symbol refcount = 0)
 alignl_label
C_sku46_68f738c6_codepoint_L000050_65
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sku46_68f738c6_codepoint_L000050_62)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sku46_68f738c6_codepoint_L000050_51
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sku4a_68f738c6_pushutfchar_L000073 ' <symbol:pushutfchar>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $7fffffff ' reg <- con
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku4a_68f738c6_pushutfchar_L000073_77)<<S32 ' LEU4 reg reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku4a_68f738c6_pushutfchar_L000073_75_L000076 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sku4a_68f738c6_pushutfchar_L000073_77
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sku4a_68f738c6_pushutfchar_L000073_78_L000079 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_pushfstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
' C_sku4a_68f738c6_pushutfchar_L000073_74 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sku4d_68f738c6_utfchar_L000080 ' <symbol:utfchar>
 alignl_p1
 long I32_NEWF + 272<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_gettop)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku4d_68f738c6_utfchar_L000080_82)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4a_68f738c6_pushutfchar_L000073)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sku4d_68f738c6_utfchar_L000080_83)<<S32 ' JUMPV addrg
 alignl_label
C_sku4d_68f738c6_utfchar_L000080_82
 alignl_p1
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__buffinit)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r19)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sku4d_68f738c6_utfchar_L000080_87)<<S32 ' JUMPV addrg
 alignl_label
C_sku4d_68f738c6_utfchar_L000080_84
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4a_68f738c6_pushutfchar_L000073)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaL__addvalue)<<S32 ' CALL addrg
' C_sku4d_68f738c6_utfchar_L000080_85 ' (symbol refcount = 0)
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sku4d_68f738c6_utfchar_L000080_87
 word I16A_CMPS + (r19)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku4d_68f738c6_utfchar_L000080_84)<<S32 ' LEI4 reg reg
 alignl_p1
 long I32_LODF + ((-276)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_luaL__pushresult)<<S32 ' CALL addrg
 alignl_label
C_sku4d_68f738c6_utfchar_L000080_83
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_sku4d_68f738c6_utfchar_L000080_81 ' (symbol refcount = 0)
 word I16B_POPM + 68<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sku4e_68f738c6_byteoffset_L000088 ' <symbol:byteoffset>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__checkinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sku4e_68f738c6_byteoffset_L000088_91)<<S32 ' LTI4 reg coni
 word I16A_MOVI + (r15)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sku4e_68f738c6_byteoffset_L000088_92)<<S32 ' JUMPV addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_91
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDI + (r15)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_92
 word I16A_MOV + (r21)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__optinteger)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4_68f738c6_u_posrelat_L000004)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_CMPS + (r22)<<D16A + (r21)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sku4e_68f738c6_byteoffset_L000088_96)<<S32 ' GTI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku4e_68f738c6_byteoffset_L000088_95)<<S32 ' LEI4 reg reg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_96
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku4e_68f738c6_byteoffset_L000088_93_L000094 ' reg ARG ADDRG
 word I16A_MOVI + (r3)<<D16A + (3)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__argerror)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_95
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku4e_68f738c6_byteoffset_L000088_97)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sku4e_68f738c6_byteoffset_L000088_100)<<S32 ' JUMPV addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_99
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_100
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku4e_68f738c6_byteoffset_L000088_102)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sku4e_68f738c6_byteoffset_L000088_99)<<S32 ' EQI4 reg coni
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_102
 alignl_p1
 long I32_JMPA + (@C_sku4e_68f738c6_byteoffset_L000088_98)<<S32 ' JUMPV addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_97
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku4e_68f738c6_byteoffset_L000088_103)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku4e_68f738c6_byteoffset_L000088_105_L000106 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sku4e_68f738c6_byteoffset_L000088_89)<<S32 ' JUMPV addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_103
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sku4e_68f738c6_byteoffset_L000088_107)<<S32 ' GEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sku4e_68f738c6_byteoffset_L000088_110)<<S32 ' JUMPV addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_109
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_112
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
' C_sku4e_68f738c6_byteoffset_L000088_113 ' (symbol refcount = 0)
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku4e_68f738c6_byteoffset_L000088_115)<<S32 ' LEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sku4e_68f738c6_byteoffset_L000088_112)<<S32 ' EQI4 reg coni
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_115
 word I16A_ADDSI + (r17)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_110
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sku4e_68f738c6_byteoffset_L000088_116)<<S32 ' GEI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_sku4e_68f738c6_byteoffset_L000088_109)<<S32 ' GTI4 reg coni
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_116
 alignl_p1
 long I32_JMPA + (@C_sku4e_68f738c6_byteoffset_L000088_108)<<S32 ' JUMPV addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_107
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_sku4e_68f738c6_byteoffset_L000088_118)<<S32 ' JUMPV addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_117
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_120
 word I16A_ADDSI + (r21)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_sku4e_68f738c6_byteoffset_L000088_121 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sku4e_68f738c6_byteoffset_L000088_120)<<S32 ' EQI4 reg coni
 word I16A_SUBSI + (r17)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_118
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_sku4e_68f738c6_byteoffset_L000088_123)<<S32 ' LEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPS + (r21)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sku4e_68f738c6_byteoffset_L000088_117)<<S32 ' LTI4 reg reg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_123
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_108
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_98
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku4e_68f738c6_byteoffset_L000088_124)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_p1
 long I32_JMPA + (@C_sku4e_68f738c6_byteoffset_L000088_125)<<S32 ' JUMPV addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_124
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_lua_pushnil)<<S32 ' CALL addrg
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_125
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_89
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sku4h_68f738c6_iter_aux_L000126 ' <symbol:iter_aux>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_tointegerx)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sku4h_68f738c6_iter_aux_L000126_128)<<S32 ' GEU4 reg reg
 alignl_p1
 long I32_JMPA + (@C_sku4h_68f738c6_iter_aux_L000126_131)<<S32 ' JUMPV addrg
 alignl_label
C_sku4h_68f738c6_iter_aux_L000126_130
 word I16A_ADDI + (r19)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl_label
C_sku4h_68f738c6_iter_aux_L000126_131
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sku4h_68f738c6_iter_aux_L000126_130)<<S32 ' EQI4 reg coni
 alignl_label
C_sku4h_68f738c6_iter_aux_L000126_128
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMP + (r19)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sku4h_68f738c6_iter_aux_L000126_133)<<S32 ' LTU4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sku4h_68f738c6_iter_aux_L000126_127)<<S32 ' JUMPV addrg
 alignl_label
C_sku4h_68f738c6_iter_aux_L000126_133
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_sku41_68f738c6_utf8_decode_L000010)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sku4h_68f738c6_iter_aux_L000126_135)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku46_68f738c6_codepoint_L000050_71_L000072 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_luaL__error)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sku4h_68f738c6_iter_aux_L000126_127)<<S32 ' JUMPV addrg
 alignl_label
C_sku4h_68f738c6_iter_aux_L000126_135
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (2)<<S16A ' RET coni
 alignl_label
C_sku4h_68f738c6_iter_aux_L000126_127
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sku4i_68f738c6_iter_auxstrict_L000137 ' <symbol:iter_auxstrict>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4h_68f738c6_iter_aux_L000126)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sku4i_68f738c6_iter_auxstrict_L000137_138 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sku4j_68f738c6_iter_auxlax_L000139 ' <symbol:iter_auxlax>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sku4h_68f738c6_iter_aux_L000126)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_sku4j_68f738c6_iter_auxlax_L000139_140 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sku4k_68f738c6_iter_codes_L000141 ' <symbol:iter_codes>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (2)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_toboolean)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checklstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sku4k_68f738c6_iter_codes_L000141_144)<<S32 ' EQI4 reg coni
 word I16B_LODL + (r21)<<D16B
 alignl_p1
 long @C_sku4j_68f738c6_iter_auxlax_L000139 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_sku4k_68f738c6_iter_codes_L000141_145)<<S32 ' JUMPV addrg
 alignl_label
C_sku4k_68f738c6_iter_codes_L000141_144
 word I16B_LODL + (r21)<<D16B
 alignl_p1
 long @C_sku4i_68f738c6_iter_auxstrict_L000137 ' reg <- addrg
 alignl_label
C_sku4k_68f738c6_iter_codes_L000141_145
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_pushcclosure)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushvalue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_lua_pushinteger)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (3)<<S16A ' RET coni
' C_sku4k_68f738c6_iter_codes_L000141_142 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_sku4l_68f738c6_funcs_L000146 ' <symbol:funcs>
 long @C_sku4m_68f738c6_147_L000148
 long @C_sku4e_68f738c6_byteoffset_L000088
 long @C_sku4n_68f738c6_149_L000150
 long @C_sku46_68f738c6_codepoint_L000050
 long @C_sku4o_68f738c6_151_L000152
 long @C_sku4d_68f738c6_utfchar_L000080
 long @C_sku4p_68f738c6_153_L000154
 long @C_sku43_68f738c6_utflen_L000033
 long @C_sku4q_68f738c6_155_L000156
 long @C_sku4k_68f738c6_iter_codes_L000141
 long @C_sku4r_68f738c6_157_L000158
 long $0
 long $0
 long $0

' Catalina Export luaopen_utf8

' Catalina Code

DAT ' code segment

 alignl_label
C_luaopen_utf8 ' <symbol:luaopen_utf8>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_MOVI + (r2)<<D32 + (68)<<S32 ' reg ARG coni
 alignl_p1
 long I32_LODI + (@C_luaopen_utf8_160_L000161)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__checkversion_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (6)<<S16A ' reg ARG coni
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_createtable)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_sku4l_68f738c6_funcs_L000146 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_luaL__setfuncs)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (14)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_luaopen_utf8_162_L000163 ' reg ARG ADDRG
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_pushlstring)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_sku4r_68f738c6_157_L000158 ' reg ARG ADDRG
 alignl_p1
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_lua_setfield)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
' C_luaopen_utf8_159 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import luaL_pushresult

' Catalina Import luaL_addvalue

' Catalina Import luaL_buffinit

' Catalina Import luaL_setfuncs

' Catalina Import luaL_error

' Catalina Import luaL_checkstack

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_checklstring

' Catalina Import luaL_argerror

' Catalina Import luaL_checkversion_

' Catalina Import lua_setfield

' Catalina Import lua_createtable

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushfstring

' Catalina Import lua_pushlstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnil

' Catalina Import lua_toboolean

' Catalina Import lua_tointegerx

' Catalina Import lua_pushvalue

' Catalina Import lua_gettop

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_luaopen_utf8_162_L000163 ' <symbol:162>
 byte 91
 byte 0
 byte 45
 byte 127
 byte 194
 byte 45
 byte 253
 byte 93
 byte 91
 byte 128
 byte 45
 byte 191
 byte 93
 byte 42
 byte 0

 alignl_label
C_luaopen_utf8_160_L000161 ' <symbol:160>
 long $43fc0000 ' float

 alignl_label
C_sku4r_68f738c6_157_L000158 ' <symbol:157>
 byte 99
 byte 104
 byte 97
 byte 114
 byte 112
 byte 97
 byte 116
 byte 116
 byte 101
 byte 114
 byte 110
 byte 0

 alignl_label
C_sku4q_68f738c6_155_L000156 ' <symbol:155>
 byte 99
 byte 111
 byte 100
 byte 101
 byte 115
 byte 0

 alignl_label
C_sku4p_68f738c6_153_L000154 ' <symbol:153>
 byte 108
 byte 101
 byte 110
 byte 0

 alignl_label
C_sku4o_68f738c6_151_L000152 ' <symbol:151>
 byte 99
 byte 104
 byte 97
 byte 114
 byte 0

 alignl_label
C_sku4n_68f738c6_149_L000150 ' <symbol:149>
 byte 99
 byte 111
 byte 100
 byte 101
 byte 112
 byte 111
 byte 105
 byte 110
 byte 116
 byte 0

 alignl_label
C_sku4m_68f738c6_147_L000148 ' <symbol:147>
 byte 111
 byte 102
 byte 102
 byte 115
 byte 101
 byte 116
 byte 0

 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_105_L000106 ' <symbol:105>
 byte 105
 byte 110
 byte 105
 byte 116
 byte 105
 byte 97
 byte 108
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 105
 byte 115
 byte 32
 byte 97
 byte 32
 byte 99
 byte 111
 byte 110
 byte 116
 byte 105
 byte 110
 byte 117
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 98
 byte 121
 byte 116
 byte 101
 byte 0

 alignl_label
C_sku4e_68f738c6_byteoffset_L000088_93_L000094 ' <symbol:93>
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 115
 byte 0

 alignl_label
C_sku4a_68f738c6_pushutfchar_L000073_78_L000079 ' <symbol:78>
 byte 37
 byte 85
 byte 0

 alignl_label
C_sku4a_68f738c6_pushutfchar_L000073_75_L000076 ' <symbol:75>
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 114
 byte 97
 byte 110
 byte 103
 byte 101
 byte 0

 alignl_label
C_sku46_68f738c6_codepoint_L000050_71_L000072 ' <symbol:71>
 byte 105
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 85
 byte 84
 byte 70
 byte 45
 byte 56
 byte 32
 byte 99
 byte 111
 byte 100
 byte 101
 byte 0

 alignl_label
C_sku46_68f738c6_codepoint_L000050_60_L000061 ' <symbol:60>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 32
 byte 115
 byte 108
 byte 105
 byte 99
 byte 101
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 0

 alignl_label
C_sku46_68f738c6_codepoint_L000050_52_L000053 ' <symbol:52>
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 115
 byte 0

 alignl_label
C_sku43_68f738c6_utflen_L000033_39_L000040 ' <symbol:39>
 byte 102
 byte 105
 byte 110
 byte 97
 byte 108
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 115
 byte 0

 alignl_label
C_sku43_68f738c6_utflen_L000033_35_L000036 ' <symbol:35>
 byte 105
 byte 110
 byte 105
 byte 116
 byte 105
 byte 97
 byte 108
 byte 32
 byte 112
 byte 111
 byte 115
 byte 105
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 111
 byte 117
 byte 116
 byte 32
 byte 111
 byte 102
 byte 32
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 115
 byte 0

' Catalina Code

DAT ' code segment
' end
