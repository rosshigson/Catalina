' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_siog_6a858b53_sin_table_L000004 ' <symbol:sin_table>
 word $0
 word $0
 word $477
 word $8ef
 word $8ef
 word $d65
 word $11db
 word $11db
 word $164f
 word $1ac2
 word $1f32
 word $1f32
 word $23a0
 word $280c
 word $280c
 word $2c74
 word $30d8
 word $30d8
 word $3539
 word $3996
 word $3dee
 word $3dee
 word $4241
 word $4690
 word $4690
 word $4ad8
 word $4f1b
 word $4f1b
 word $5358
 word $578e
 word $5bbe
 word $5bbe
 word $5fe6
 word $6406
 word $6406
 word $681f
 word $6c30
 word $7039
 word $7039
 word $7438
 word $782f
 word $782f
 word $7c1c
 word $8000
 word $8000
 word $83d9
 word $87a8
 word $8b6d
 word $8b6d
 word $8f27
 word $92d5
 word $92d5
 word $9679
 word $9a10
 word $9a10
 word $9d9b
 word $a11b
 word $a48d
 word $a48d
 word $a7f3
 word $ab4c
 word $ab4c
 word $ae97
 word $b1d5
 word $b504
 word $b504
 word $b826
 word $bb39
 word $bb39
 word $be3e
 word $c134
 word $c134
 word $c41b
 word $c6f3
 word $c9bb
 word $c9bb
 word $cc73
 word $cf1b
 word $cf1b
 word $d1b3
 word $d43b
 word $d43b
 word $d6b3
 word $d919
 word $db6f
 word $db6f
 word $ddb3
 word $dfe7
 word $dfe7
 word $e208
 word $e419
 word $e419
 word $e617
 word $e803
 word $e9de
 word $e9de
 word $eba6
 word $ed5b
 word $ed5b
 word $eeff
 word $f08f
 word $f20d
 word $f20d
 word $f378
 word $f4d0
 word $f4d0
 word $f615
 word $f746
 word $f746
 word $f865
 word $f970
 word $fa67
 word $fa67
 word $fb4b
 word $fc1c
 word $fc1c
 word $fcd9
 word $fd82
 word $fd82
 word $fe17
 word $fe98
 word $ff06
 word $ff06
 word $ff60
 word $ffa6
 word $ffa6
 word $ffd8
 word $fff6
 word $ffff

' Catalina Export g_sin

' Catalina Code

DAT ' code segment

 alignl_label
C_g_sin ' <symbol:g_sin>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 8191 ' reg <- con
 word I16A_AND + (r2)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 4096 ' reg <- con
 word I16A_CMP + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_sin_6)<<S32 ' LTU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 4095 ' reg <- con
 word I16A_AND + (r2)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2048 ' reg <- con
 word I16A_CMP + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_sin_8)<<S32 ' LTU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 4096 ' reg <- con
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16A_SUB + RI<<D16A + (r2)<<S16A
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' SUBU (2)
 alignl_label
C_g_sin_8
 word I16A_SHRI + (r2)<<D16A + (4)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_siog_6a858b53_sin_table_L000004 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' NEGI4
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_g_sin_5)<<S32 ' JUMPV addrg
 alignl_label
C_g_sin_6
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2048 ' reg <- con
 word I16A_CMP + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_sin_10)<<S32 ' LTU4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 4096 ' reg <- con
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16A_SUB + RI<<D16A + (r2)<<S16A
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' SUBU (2)
 alignl_label
C_g_sin_10
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 4095 ' reg <- con
 word I16A_AND + (r2)<<D16A + (r22)<<S16A ' BANDI/U (1)
 word I16A_SHRI + (r2)<<D16A + (4)<<S16A ' SHRU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_siog_6a858b53_sin_table_L000004 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_g_sin_5
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export g_cos

 alignl_label
C_g_cos ' <symbol:g_cos>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 2048 ' reg <- con
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r22)<<S16A ' ADDU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_g_sin)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_g_cos_12 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1
' end
