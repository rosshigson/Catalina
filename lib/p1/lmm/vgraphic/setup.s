' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _vgi_cog

 alignl ' align long
C__vgi_cog ' <symbol:_vgi_cog>
 long -1

' Catalina Export _vdb_cog

 alignl ' align long
C__vdb_cog ' <symbol:_vdb_cog>
 long -1

 alignl ' align long
C_sbpc_68fd74e3_font_L000004 ' <symbol:font>
 word $9d62
 word $112a
 word $b0e9
 word $31eb
 word $98d1
 word $99d3
 word $a648
 word $1e38
 word $e4ca
 word $ecba
 word $9930
 word $aa52
 word $ad52
 word $1532
 word $c051
 word $c033
 word $2a30
 word $dc52
 word $d5ba
 word $1651
 word $316a
 word $f74b
 word $fb3b
 word $253a
 word $f349
 word $ff39
 word $253a
 word $a834
 word $aa30
 word $155a
 word $a240
 word $1952
 word $ca2
 word $2240
 word $112a
 word $3220
 word $43c2
 word $9220
 word $b122
 word $3150
 word $e1d2
 word $fdd2
 word $f5b2
 word $9820
 word $1220
 word $ddd2
 word $59b2
 word $9c62
 word $9e38
 word $21a3
 word $edb2
 word $b064
 word $a060
 word $a140
 word $1120
 word $c1b2
 word $f7c2
 word $a030
 word $31e2
 word $b260
 word $3221
 word $c1b2
 word $41d2
 word $c1d2
 word $ffc2
 word $aa44
 word $1121
 word $9d32
 word $2552
 word $8ca2
 word $1d42
 word $aa40
 word $1a40
 word $aa50
 word $1a30
 word $a844
 word $1844
 word $e0da
 word $fd5b
 word $f53b
 word $112a
 word $c042
 word $d2c2
 word $fc43
 word $fcb2
 word $25bb
 word $e1d2
 word $a820
 word $aa24
 word $2240
 word $edd2
 word $edb2
 word $b020
 word $9120
 word $a140
 word $3160
 word $e1d2
 word $e9b2
 word $2830
 word $f1d2
 word $fdb2
 word $b020
 word $aa34
 word $9120
 word $3160
 word $b020
 word $9220
 word $a1c0
 word $3260
 word $b020
 word $a1c0
 word $3260
 word $e1d2
 word $e9b2
 word $a830
 word $9e24
 word $1e3b
 word $b020
 word $b224
 word $2240
 word $b122
 word $9220
 word $3260
 word $e9b2
 word $3234
 word $b020
 word $a064
 word $2024
 word $b020
 word $1220
 word $b020
 word $b224
 word $b042
 word $3242
 word $b020
 word $b224
 word $3024
 word $e1d2
 word $e9b2
 word $a830
 word $2a34
 word $edd2
 word $b020
 word $a140
 word $3160
 word $e1d2
 word $e9b2
 word $a830
 word $aa34
 word $e32
 word $edd2
 word $b020
 word $a140
 word $b160
 word $2124
 word $d1d2
 word $59b2
 word $b122
 word $3260
 word $e9b2
 word $b030
 word $3234
 word $b022
 word $3222
 word $9060
 word $9264
 word $9042
 word $1242
 word $b024
 word $3220
 word $a160
 word $a164
 word $2122
 word $b260
 word $b220
 word $1220
 word $8d6a
 word $b66a
 word $e1a
 word $3024
 word $8d6a
 word $b46a
 word $c1a

' Catalina Export g_setup

' Catalina Code

DAT ' code segment

 alignl ' align long
C_g_setup ' <symbol:g_setup>
 jmp #NEWF
 sub SP, #44
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_G__V_A_R_+96
 mov r15, RI ' reg <- addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_tiles ' CALL addrg
 mov r7, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_tiles ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r2, #19 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 mov r22, r0
 adds r22, #128 ' ADDI4 coni
 jmp #LODL
 long @C__vgi_cog
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r2, #20 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 mov r22, r0
 adds r22, #128 ' ADDI4 coni
 jmp #LODL
 long @C__vdb_cog
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_display_base ' CALL addrg
 jmp #LODL
 long @C__display_base
 wrlong r0, RI ' ASGNP4 addrg reg
 mov r22, #4 ' reg <- coni
 mov r20, r7
 shl r20, #1 ' LSHI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 adds r20, #3 ' ADDI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 jmp #LODF
 long -32
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODI
 long @C__display_base
 mov r22, RI ' reg <- INDIRP4 addrg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, r22 ' SUBI/P
 subs r18, r20 ' SUBI/P (3)
 jmp #LODF
 long -40
 wrlong r18, RI ' ASGNP4 addrl reg
 mov r18, r20 ' ADDI/P
 adds r18, r22 ' ADDI/P (3)
 jmp #LODF
 long -16
 wrlong r18, RI ' ASGNP4 addrl reg
 shl r20, #1 ' LSHI4 coni
 adds r22, r20 ' ADDI/P (2)
 mov r20, r22
 adds r20, #4 ' ADDP4 coni
 jmp #LODF
 long -44
 wrlong r20, RI ' ASGNP4 addrl reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long -36
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #LODF
 long -24
 wrlong r17, RI ' ASGNP4 addrl reg
 mov r22, r19
 shl r22, #6 ' LSHI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_g_setup_10 ' JUMPV addrg
C_g_setup_7
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #5 ' LSHI4 coni
 shl r22, #1 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrword r20, r22 ' ASGNI2 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #5 ' LSHI4 coni
 shl r22, #1 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNP4 addrl reg
' C_g_setup_8 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_g_setup_10
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r19 wz,wc
 jmp #BR_B
 long @C_g_setup_7 ' LTI4
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_g_setup_14 ' JUMPV addrg
C_g_setup_11
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_g_setup_18 ' JUMPV addrg
C_g_setup_15
 mov r0, r11 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' ADDI/P
 adds r22, r13 ' ADDI/P (3)
 shl r22, #1 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r0, r13 ' setup r0/r1 (2)
 mov r1, r7 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0 ' ADDI/P
 adds r20, r11 ' ADDI/P (3)
 shl r20, #1 ' LSHI4 coni
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrword r20, r22 ' ASGNI2 reg reg
' C_g_setup_16 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
C_g_setup_18
 cmps r13, r9 wz,wc
 jmp #BR_B
 long @C_g_setup_15 ' LTI4
' C_g_setup_12 ' (symbol refcount = 0)
 adds r11, #1 ' ADDI4 coni
C_g_setup_14
 cmps r11, r7 wz,wc
 jmp #BR_B
 long @C_g_setup_11 ' LTI4
 mov r0, r7 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODF
 long -28
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_g_setup_22 ' JUMPV addrg
C_g_setup_19
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #1 ' LSHI4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 shl r20, #16
 sar r20, #16 ' sign extend
 sar r20, #6 ' RSHI4 coni
 wrword r20, r22 ' ASGNI2 reg reg
' C_g_setup_20 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_g_setup_22
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_g_setup_19 ' LTI4
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_g_setup_26 ' JUMPV addrg
C_g_setup_23
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 shl r20, #2 ' LSHI4 coni
 jmp #LODL
 long @C_G__V_A_R_+164
 mov r18, RI ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 mov r18, r9
 shl r18, #6 ' LSHI4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 wrlong r0, r20 ' ASGNI4 reg reg
' C_g_setup_24 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_g_setup_26
 cmps r7,  #50 wz,wc
 jmp #BRAE
 long @C_g_setup_29 ' GEI4
 jmp #LODF
 long -48
 wrlong r7, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_g_setup_30 ' JUMPV addrg
C_g_setup_29
 mov r22, #50 ' reg <- coni
 jmp #LODF
 long -48
 wrlong r22, RI ' ASGNI4 addrl reg
C_g_setup_30
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-48) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_g_setup_23 ' LTI4
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODL
 long @C_G__V_A_R_
 wrword r22, RI ' ASGNI2 addrg reg
 mov r22, r7 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_G__V_A_R_+2
 wrword r22, RI ' ASGNI2 addrg reg
 mov r22, r9 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_G__V_A_R_+4
 wrword r22, RI ' ASGNI2 addrg reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_G__V_A_R_+8
 wrlong r22, RI ' ASGNP4 addrg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_G__V_A_R_+12
 wrlong r22, RI ' ASGNP4 addrg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_G__V_A_R_+16
 wrlong r22, RI ' ASGNP4 addrg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_G__V_A_R_+20
 wrlong r22, RI ' ASGNP4 addrg reg
 jmp #LODL
 long @C_G__V_A_R_+24
 wrlong r17, RI ' ASGNP4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+28
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+32
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+36
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+40
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+44
 wrlong r22, RI ' ASGNI4 addrg reg
 shl r9, #4 ' LSHI4 coni
 mov r22, r9 ' SUBI/P
 subs r22, r21 ' SUBI/P (3)
 mov r21, r22
 subs r21, #1 ' SUBI4 coni
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+80
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_g_setup_44 ' NEI4
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+80+4
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+80+8
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+80+12
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #JMPA
 long @C_g_setup_45 ' JUMPV addrg
C_g_setup_44
 jmp #LODL
 long 1431655765
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+80+4
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long $aaaaaaaa
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+80+8
 wrlong r22, RI ' ASGNI4 addrg reg
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C_G__V_A_R_+80+12
 wrlong r22, RI ' ASGNI4 addrg reg
C_g_setup_45
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r7, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r9, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 jmp #LODL
 long @C_sbpc_68fd74e3_font_L000004
 mov r20, RI ' reg <- addrg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 jmp #LODL
 long @C_G__V_A_R_+20
 mov r20, RI ' reg <- addrg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 jmp #LODL
 long @C_G__V_A_R_+164
 mov r20, RI ' reg <- addrg
 wrlong r20, r22 ' ASGNI4 reg reg
 jmp #LODL
 long @C_G__V_A_R_+48
 mov r22, RI ' reg <- addrg
 wrlong r22, r15 ' ASGNI4 reg reg
 jmp #LODL
 long @C_G__V_A_R_+96
 mov r22, RI ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_g_db_setup ' CALL addrg
 mov r22, FP
 sub r22, #-(-44) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
' C_g_setup_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #44 ' framesize
 jmp #RETF


' Catalina Import _setcommand

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export _display_base

 alignl ' align long
C__display_base ' <symbol:_display_base>
 byte 0[4]

' Catalina Code

DAT ' code segment

' Catalina Import memset

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _locate_plugin

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import g_db_setup

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import cgi_display_base

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import cgi_y_tiles

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import cgi_x_tiles

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export G_VAR

 alignl ' align long
C_G__V_A_R_ ' <symbol:G_VAR>
 byte 0[364]

' Catalina Code

DAT ' code segment
' end
