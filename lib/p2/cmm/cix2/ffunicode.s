' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_s1uc_6af550ef_uc437_L000001 ' <symbol:uc437>
 word $c7
 word $fc
 word $e9
 word $e2
 word $e4
 word $e0
 word $e5
 word $e7
 word $ea
 word $eb
 word $e8
 word $ef
 word $ee
 word $ec
 word $c4
 word $c5
 word $c9
 word $e6
 word $c6
 word $f4
 word $f6
 word $f2
 word $fb
 word $f9
 word $ff
 word $d6
 word $dc
 word $a2
 word $a3
 word $a5
 word $20a7
 word $192
 word $e1
 word $ed
 word $f3
 word $fa
 word $f1
 word $d1
 word $aa
 word $ba
 word $bf
 word $2310
 word $ac
 word $bd
 word $bc
 word $a1
 word $ab
 word $bb
 word $2591
 word $2592
 word $2593
 word $2502
 word $2524
 word $2561
 word $2562
 word $2556
 word $2555
 word $2563
 word $2551
 word $2557
 word $255d
 word $255c
 word $255b
 word $2510
 word $2514
 word $2534
 word $252c
 word $251c
 word $2500
 word $253c
 word $255e
 word $255f
 word $255a
 word $2554
 word $2569
 word $2566
 word $2560
 word $2550
 word $256c
 word $2567
 word $2568
 word $2564
 word $2565
 word $2559
 word $2558
 word $2552
 word $2553
 word $256b
 word $256a
 word $2518
 word $250c
 word $2588
 word $2584
 word $258c
 word $2590
 word $2580
 word $3b1
 word $df
 word $393
 word $3c0
 word $3a3
 word $3c3
 word $b5
 word $3c4
 word $3a6
 word $398
 word $3a9
 word $3b4
 word $221e
 word $3c6
 word $3b5
 word $2229
 word $2261
 word $b1
 word $2265
 word $2264
 word $2320
 word $2321
 word $f7
 word $2248
 word $b0
 word $2219
 word $b7
 word $221a
 word $207f
 word $b2
 word $25a0
 word $a0

' Catalina Export ff_uni2oem

' Catalina Code

DAT ' code segment

 alignl_label
C_ff_uni2oem ' <symbol:ff_uni2oem>
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODL + (r21)<<D16B
 alignl_p1
 long @C_s1uc_6af550ef_uc437_L000001 ' reg <- addrg
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMP + (r3)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_uni2oem_3)<<S32 ' GEU4 reg coni
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_uni2oem_4)<<S32 ' JUMPV addrg
 alignl_label
C_ff_uni2oem_3
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $10000 ' reg <- con
 word I16A_CMP + (r3)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_uni2oem_5)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (437)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_uni2oem_5)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_ff_uni2oem_10)<<S32 ' JUMPV addrg
 alignl_label
C_ff_uni2oem_7
' C_ff_uni2oem_8 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_ff_uni2oem_10
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_uni2oem_11)<<S32 ' GEI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (1)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMP + (r3)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_uni2oem_7)<<S32 ' NEU4 reg reg
 alignl_label
C_ff_uni2oem_11
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_ff_uni2oem_5
 alignl_label
C_ff_uni2oem_4
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r0)<<D16B ' zero extend
' C_ff_uni2oem_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export ff_oem2uni

 alignl_label
C_ff_oem2uni ' <symbol:ff_oem2uni>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRWORD + (r22)<<D16A + RI<<S16A ' ASGNU2 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_s1uc_6af550ef_uc437_L000001 ' reg <- addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_oem2uni_13)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRWORD + (r3)<<D16A + RI<<S16A ' ASGNU2 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_ff_oem2uni_14)<<S32 ' JUMPV addrg
 alignl_label
C_ff_oem2uni_13
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (437)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_oem2uni_15)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_oem2uni_17)<<S32 ' GEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDWORD + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRWORD + (r22)<<D16A + RI<<S16A ' ASGNU2 addrl16 reg
 alignl_label
C_ff_oem2uni_17
 alignl_label
C_ff_oem2uni_15
 alignl_label
C_ff_oem2uni_14
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDWORD + (r22)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN2 + (r0)<<D16B ' zero extend
' C_ff_oem2uni_12 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_s1uc1_6af550ef___ccvt1_L000019 ' <symbol:__ccvt1>
 word $61
 word $31a
 word $e0
 word $317
 word $f8
 word $307
 word $ff
 word $1
 word $178
 word $100
 word $130
 word $132
 word $106
 word $139
 word $110
 word $14a
 word $12e
 word $179
 word $106
 word $180
 word $4d
 word $243
 word $181
 word $182
 word $182
 word $184
 word $184
 word $186
 word $187
 word $187
 word $189
 word $18a
 word $18b
 word $18b
 word $18d
 word $18e
 word $18f
 word $190
 word $191
 word $191
 word $193
 word $194
 word $1f6
 word $196
 word $197
 word $198
 word $198
 word $23d
 word $19b
 word $19c
 word $19d
 word $220
 word $19f
 word $1a0
 word $1a0
 word $1a2
 word $1a2
 word $1a4
 word $1a4
 word $1a6
 word $1a7
 word $1a7
 word $1a9
 word $1aa
 word $1ab
 word $1ac
 word $1ac
 word $1ae
 word $1af
 word $1af
 word $1b1
 word $1b2
 word $1b3
 word $1b3
 word $1b5
 word $1b5
 word $1b7
 word $1b8
 word $1b8
 word $1ba
 word $1bb
 word $1bc
 word $1bc
 word $1be
 word $1f7
 word $1c0
 word $1c1
 word $1c2
 word $1c3
 word $1c4
 word $1c5
 word $1c4
 word $1c7
 word $1c8
 word $1c7
 word $1ca
 word $1cb
 word $1ca
 word $1cd
 word $110
 word $1dd
 word $1
 word $18e
 word $1de
 word $112
 word $1f3
 word $3
 word $1f1
 word $1f4
 word $1f4
 word $1f8
 word $128
 word $222
 word $112
 word $23a
 word $9
 word $2c65
 word $23b
 word $23b
 word $23d
 word $2c66
 word $23f
 word $240
 word $241
 word $241
 word $246
 word $10a
 word $253
 word $40
 word $181
 word $186
 word $255
 word $189
 word $18a
 word $258
 word $18f
 word $25a
 word $190
 word $25c
 word $25d
 word $25e
 word $25f
 word $193
 word $261
 word $262
 word $194
 word $264
 word $265
 word $266
 word $267
 word $197
 word $196
 word $26a
 word $2c62
 word $26c
 word $26d
 word $26e
 word $19c
 word $270
 word $271
 word $19d
 word $273
 word $274
 word $19f
 word $276
 word $277
 word $278
 word $279
 word $27a
 word $27b
 word $27c
 word $2c64
 word $27e
 word $27f
 word $1a6
 word $281
 word $282
 word $1a9
 word $284
 word $285
 word $286
 word $287
 word $1ae
 word $244
 word $1b1
 word $1b2
 word $245
 word $28d
 word $28e
 word $28f
 word $290
 word $291
 word $1b7
 word $37b
 word $3
 word $3fd
 word $3fe
 word $3ff
 word $3ac
 word $4
 word $386
 word $388
 word $389
 word $38a
 word $3b1
 word $311
 word $3c2
 word $2
 word $3a3
 word $3a3
 word $3c4
 word $308
 word $3cc
 word $3
 word $38c
 word $38e
 word $38f
 word $3d8
 word $118
 word $3f2
 word $a
 word $3f9
 word $3f3
 word $3f4
 word $3f5
 word $3f6
 word $3f7
 word $3f7
 word $3f9
 word $3fa
 word $3fa
 word $430
 word $320
 word $450
 word $710
 word $460
 word $122
 word $48a
 word $136
 word $4c1
 word $10e
 word $4cf
 word $1
 word $4c0
 word $4d0
 word $144
 word $561
 word $426
 word $0

 alignl_label
C_s1uc2_6af550ef___ccvt2_L000020 ' <symbol:__ccvt2>
 word $1d7d
 word $1
 word $2c63
 word $1e00
 word $196
 word $1ea0
 word $15a
 word $1f00
 word $608
 word $1f10
 word $606
 word $1f20
 word $608
 word $1f30
 word $608
 word $1f40
 word $606
 word $1f51
 word $7
 word $1f59
 word $1f52
 word $1f5b
 word $1f54
 word $1f5d
 word $1f56
 word $1f5f
 word $1f60
 word $608
 word $1f70
 word $e
 word $1fba
 word $1fbb
 word $1fc8
 word $1fc9
 word $1fca
 word $1fcb
 word $1fda
 word $1fdb
 word $1ff8
 word $1ff9
 word $1fea
 word $1feb
 word $1ffa
 word $1ffb
 word $1f80
 word $608
 word $1f90
 word $608
 word $1fa0
 word $608
 word $1fb0
 word $4
 word $1fb8
 word $1fb9
 word $1fb2
 word $1fbc
 word $1fcc
 word $1
 word $1fc3
 word $1fd0
 word $602
 word $1fe0
 word $602
 word $1fe5
 word $1
 word $1fec
 word $1ff3
 word $1
 word $1ffc
 word $214e
 word $1
 word $2132
 word $2170
 word $210
 word $2184
 word $1
 word $2183
 word $24d0
 word $51a
 word $2c30
 word $42f
 word $2c60
 word $102
 word $2c67
 word $106
 word $2c75
 word $102
 word $2c80
 word $164
 word $2d00
 word $826
 word $ff41
 word $31a
 word $0

' Catalina Export ff_wtoupper

' Catalina Code

DAT ' code segment

 alignl_label
C_ff_wtoupper ' <symbol:ff_wtoupper>
 alignl_p1
 long I32_PSHM + $fea800<<S32 ' save registers
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $10000 ' reg <- con
 word I16A_CMP + (r2)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_wtoupper_22)<<S32 ' GEU4 reg reg
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((4096)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_wtoupper_25)<<S32 ' GEI4 reg reg
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long @C_s1uc1_6af550ef___ccvt1_L000019 ' reg <- addrg
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_26)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_25
 word I16B_LODL + (r13)<<D16B
 alignl_p1
 long @C_s1uc2_6af550ef___ccvt2_L000020 ' reg <- addrg
 alignl_label
C_ff_wtoupper_26
 word I16A_MOV + (r17)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_ff_wtoupper_27
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_ff_wtoupper_33)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_wtoupper_31)<<S32 ' GEI4 reg reg
 alignl_label
C_ff_wtoupper_33
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_31
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r17)<<D16A + (2)<<S16A ' ADDP4 reg coni
 word I16A_RDWORD + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_SARI + (r20)<<D16A + (8)<<S16A ' SHRI4 reg coni
 word I16A_MOV + (r15)<<D16A + (r20)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16A_MOV + (r18)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN2 + (r18)<<D16B ' zero extend
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl_p1
 long I32_BRAE + (@C_ff_wtoupper_34)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r11)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_36)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_38)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_36
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_39)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_41)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_39
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (2)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_42)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_44)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_42
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (3)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_45)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_47)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_45
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (4)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_48)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_50)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_48
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (5)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_51)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_53)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_51
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (6)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_54)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_56)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_54
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (7)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_57)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_59)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_57
 word I16A_MOV + (r22)<<D16A + (r11)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_29)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_62)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_38
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r17)<<S16A ' ADDI/P (1)
 word I16A_RDWORD + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRU2 reg
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_41
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r20)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN2 + (r20)<<D16B ' zero extend
 word I16A_SUBS + (r20)<<D16A + (r22)<<S16A
 word I16A_NEG + (r20)<<D16A + (r20)<<S16A ' SUBI/P (2)
 word I16A_MOVI + (r18)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_44
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (16)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_47
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_50
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_53
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_SUBSI + (r22)<<D16A + (26)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_56
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_59
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((80)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_62
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((7264)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_29)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_34
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_ff_wtoupper_27)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r17)<<D16A + (r22)<<S16A ' ADDI/P (2)
 alignl_p1
 long I32_JMPA + (@C_ff_wtoupper_27)<<S32 ' JUMPV addrg
 alignl_label
C_ff_wtoupper_29
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVUI
 word I16B_TRN2 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_ff_wtoupper_22
 word I16A_MOV + (r0)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
' C_ff_wtoupper_21 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
