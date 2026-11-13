' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_snn0_6af551d3_uc437_L000001 ' <symbol:uc437>
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

 alignl ' align long
C_ff_uni2oem ' <symbol:ff_uni2oem>
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, #0 ' reg <- coni
 mov r21, ##@C_snn0_6af551d3_uc437_L000001 ' reg <- addrg
 cmp r3,  #128 wcz 
 if_ae jmp #\C_ff_uni2oem_3 ' GEU4
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #\@C_ff_uni2oem_4 ' JUMPV addrg
C_ff_uni2oem_3
 mov r22, ##$10000 ' reg <- con
 cmp r3, r22 wcz 
 if_ae jmp #\C_ff_uni2oem_5 ' GEU4
 mov r22, r2 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #437 wz
 if_nz jmp #\C_ff_uni2oem_5 ' NEI4
 mov r23, #0 ' reg <- coni
 jmp #\@C_ff_uni2oem_10 ' JUMPV addrg
C_ff_uni2oem_7
' C_ff_uni2oem_8 ' (symbol refcount = 0)
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 adds r22, #1 ' ADDI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
C_ff_uni2oem_10
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #128 wcz
 if_ae jmp #\C_ff_uni2oem_11 ' GEI4
 shl r22, #1 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmp r3, r22 wz
 if_nz jmp #\C_ff_uni2oem_7  ' NEU4
C_ff_uni2oem_11
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 adds r22, #128 ' ADDI4 coni
 and r22, #255 ' BANDI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
C_ff_uni2oem_5
C_ff_uni2oem_4
 mov r0, r23 ' CVUI
 and r0, cviu_m2 ' zero extend
' C_ff_uni2oem_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export ff_oem2uni

 alignl ' align long
C_ff_oem2uni ' <symbol:ff_oem2uni>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrword r22, RI ' ASGNU2 addrli reg
 mov RI, ##@C_snn0_6af551d3_uc437_L000001
 mov BC, FP
 sub BC, #-(-12)
 wrlong RI, BC ' ASGNP4 addrli addrg
 mov r22, r3 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #128 wcz
 if_ae jmp #\C_ff_oem2uni_13 ' GEI4
 mov RI, FP
 sub RI, #-(-8)
 wrword r3, RI ' ASGNU2 addrli reg
 jmp #\@C_ff_oem2uni_14 ' JUMPV addrg
C_ff_oem2uni_13
 mov r22, r2 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #437 wz
 if_nz jmp #\C_ff_oem2uni_15 ' NEI4
 mov r22, r3 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #256 wcz
 if_ae jmp #\C_ff_oem2uni_17 ' GEI4
 mov r22, r3 ' CVUI
 and r22, cviu_m2 ' zero extend
 shl r22, #1 ' LSHI4 coni
 subs r22, #256 ' SUBI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdword r22, r22 ' reg <- INDIRU2 reg
 mov RI, FP
 sub RI, #-(-8)
 wrword r22, RI ' ASGNU2 addrli reg
C_ff_oem2uni_17
C_ff_oem2uni_15
C_ff_oem2uni_14
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdword r0, r22 ' reg <- CVUI4 INDIRU2 reg
' C_ff_oem2uni_12 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_snn01_6af551d3___ccvt1_L000019 ' <symbol:__ccvt1>
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

 alignl ' align long
C_snn02_6af551d3___ccvt2_L000020 ' <symbol:__ccvt2>
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

 alignl ' align long
C_ff_wtoupper ' <symbol:ff_wtoupper>
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r22, ##$10000 ' reg <- con
 cmp r2, r22 wcz 
 if_ae jmp #\C_ff_wtoupper_22 ' GEU4
 mov r23, r2 ' CVI, CVU or LOAD
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##4096 ' reg <- con
 cmps r22, r20 wcz
 if_ae jmp #\C_ff_wtoupper_25 ' GEI4
 mov r13, ##@C_snn01_6af551d3___ccvt1_L000019 ' reg <- addrg
 jmp #\@C_ff_wtoupper_26 ' JUMPV addrg
C_ff_wtoupper_25
 mov r13, ##@C_snn02_6af551d3___ccvt2_L000020 ' reg <- addrg
C_ff_wtoupper_26
 mov r17, r13 ' CVI, CVU or LOAD
C_ff_wtoupper_27
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #2 ' ADDP4 coni
 rdword r21, r22 ' reg <- INDIRU2 reg
 mov r22, r21 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_ff_wtoupper_33 ' EQI4
 mov r20, r23 ' CVUI
 and r20, cviu_m2 ' zero extend
 cmps r20, r22 wcz
 if_ae jmp #\C_ff_wtoupper_31 ' GEI4
C_ff_wtoupper_33
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_31
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #2 ' ADDP4 coni
 rdword r19, r22 ' reg <- INDIRU2 reg
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, r22
 sar r20, #8 ' RSHI4 coni
 mov r15, r20 ' CVI, CVU or LOAD
 and r22, #255 ' BANDI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, r21 ' CVUI
 and r20, cviu_m2 ' zero extend
 mov r18, r19 ' CVUI
 and r18, cviu_m2 ' zero extend
 adds r20, r18 ' ADDI/P (1)
 cmps r22, r20 wcz
 if_ae jmp #\C_ff_wtoupper_34 ' GEI4
 mov r11, r15 ' CVI, CVU or LOAD
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_ff_wtoupper_36 ' NEI4
 jmp #\@C_ff_wtoupper_38 ' JUMPV addrg
C_ff_wtoupper_36
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #1 wz
 if_nz jmp #\C_ff_wtoupper_39 ' NEI4
 jmp #\@C_ff_wtoupper_41 ' JUMPV addrg
C_ff_wtoupper_39
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #2 wz
 if_nz jmp #\C_ff_wtoupper_42 ' NEI4
 jmp #\@C_ff_wtoupper_44 ' JUMPV addrg
C_ff_wtoupper_42
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #3 wz
 if_nz jmp #\C_ff_wtoupper_45 ' NEI4
 jmp #\@C_ff_wtoupper_47 ' JUMPV addrg
C_ff_wtoupper_45
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #4 wz
 if_nz jmp #\C_ff_wtoupper_48 ' NEI4
 jmp #\@C_ff_wtoupper_50 ' JUMPV addrg
C_ff_wtoupper_48
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #5 wz
 if_nz jmp #\C_ff_wtoupper_51 ' NEI4
 jmp #\@C_ff_wtoupper_53 ' JUMPV addrg
C_ff_wtoupper_51
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #6 wz
 if_nz jmp #\C_ff_wtoupper_54 ' NEI4
 jmp #\@C_ff_wtoupper_56 ' JUMPV addrg
C_ff_wtoupper_54
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #7 wz
 if_nz jmp #\C_ff_wtoupper_57 ' NEI4
 jmp #\@C_ff_wtoupper_59 ' JUMPV addrg
C_ff_wtoupper_57
 mov r22, r11 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #8 wz
 if_nz jmp #\C_ff_wtoupper_29 ' NEI4
 jmp #\@C_ff_wtoupper_62 ' JUMPV addrg
C_ff_wtoupper_38
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, r21 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r22, r20 ' SUBI/P (1)
 shl r22, #1 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 rdword r23, r22 ' reg <- INDIRU2 reg
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_41
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, r21 ' CVUI
 and r20, cviu_m2 ' zero extend
 subs r20, r22
 neg r20, r20 ' SUBI/P (2)
 and r20, #1 ' BANDI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_44
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 subs r22, #16 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_47
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 subs r22, #32 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_50
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_53
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 subs r22, #26 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_56
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 adds r22, #8 ' ADDI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_59
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 subs r22, #80 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_62
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r20, ##7264 ' reg <- con
 subs r22, r20 ' SUBI/P (1)
 mov r23, r22 ' CVI, CVU or LOAD
 jmp #\@C_ff_wtoupper_29 ' JUMPV addrg
C_ff_wtoupper_34
 mov r22, r15 ' CVUI
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 if_nz jmp #\C_ff_wtoupper_27 ' NEI4
 mov r22, r19 ' CVUI
 and r22, cviu_m2 ' zero extend
 shl r22, #1 ' LSHI4 coni
 adds r17, r22 ' ADDI/P (2)
 jmp #\@C_ff_wtoupper_27 ' JUMPV addrg
C_ff_wtoupper_29
 mov r22, r23 ' CVUI
 and r22, cviu_m2 ' zero extend
 mov r2, r22 ' CVI, CVU or LOAD
C_ff_wtoupper_22
 mov r0, r2 ' CVI, CVU or LOAD
' C_ff_wtoupper_21 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
