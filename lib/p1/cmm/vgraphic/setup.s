' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _vgi_cog

 alignl_label
C__vgi_cog ' <symbol:_vgi_cog>
 long -1

' Catalina Export _vdb_cog

 alignl_label
C__vdb_cog ' <symbol:_vdb_cog>
 long -1

 alignl_label
C_s8po_696ddf77_font_L000004 ' <symbol:font>
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

 alignl_label
C_g_setup ' <symbol:g_setup>
 alignl_p1
 long I32_NEWF + 32<<S32
 alignl_p1
 long I32_PSHM + $feafc0<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r15)<<D16B
 alignl_p1
 long @C_G__V_A_R_+96 ' reg <- addrg
 alignl_p1
 long I32_CALA + (@C_cgi_x_tiles)<<S32 ' CALL addrg
 word I16A_MOV + (r9)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_cgi_y_tiles)<<S32 ' CALL addrg
 word I16A_MOV + (r10)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (19)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODA + (@C__vgi_cog)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r2)<<D16A + (20)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODS + (r20)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODA + (@C__vdb_cog)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_CALA + (@C_cgi_display_base)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODA + (@C__display_base)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (4)<<S16A ' reg <- coni
 word I16A_MOV + (r20)<<D16A + (r9)<<S16A
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r10)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (3)<<S16A ' ADDI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_LODI + (@C__display_base)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r7)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r18)<<D16A + (r20)<<S16A ' SUBI/P (3)
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r18)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r6)<<D16A + (r20)<<S16A ' ADDI/P
 word I16A_ADDS + (r6)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (6)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_memset)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16A_MOVI + (r8)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_g_setup_10)<<S32 ' JUMPV addrg
 alignl_label
C_g_setup_7
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_SHLI + (r22)<<D16A + (5)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
' C_g_setup_8 ' (symbol refcount = 0)
 word I16A_ADDSI + (r8)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_setup_10
 word I16A_CMPS + (r8)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_setup_7)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r11)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_g_setup_14)<<S32 ' JUMPV addrg
 alignl_label
C_g_setup_11
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_g_setup_18)<<S32 ' JUMPV addrg
 alignl_label
C_g_setup_15
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r10)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r13)<<S16A ' ADDI/P (3)
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r6)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r0)<<D16A + (r13)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r9)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r11)<<S16A ' ADDI/P (3)
 word I16A_SHLI + (r20)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r7)<<S16A ' ADDI/P (1)
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
' C_g_setup_16 ' (symbol refcount = 0)
 word I16A_ADDSI + (r13)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_setup_18
 word I16A_CMPS + (r13)<<D16A + (r10)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_setup_15)<<S32 ' LTI4 reg reg
' C_g_setup_12 ' (symbol refcount = 0)
 word I16A_ADDSI + (r11)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_setup_14
 word I16A_CMPS + (r11)<<D16A + (r9)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_setup_11)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r9)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r10)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_g_setup_22)<<S32 ' JUMPV addrg
 alignl_label
C_g_setup_19
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r7)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r20)<<D16A + 16<<S16A
 word I16A_SARI + (r20)<<D16A + 16<<S16A ' sign extend
 word I16A_SARI + (r20)<<D16A + (6)<<S16A ' SHRI4 reg coni
 word I16A_WRWORD + (r20)<<D16A + (r22)<<S16A ' ASGNI2 reg reg
' C_g_setup_20 ' (symbol refcount = 0)
 word I16A_ADDSI + (r8)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_setup_22
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r8)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_setup_19)<<S32 ' LTI4 reg reg
 word I16A_MOVI + (r8)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_g_setup_26)<<S32 ' JUMPV addrg
 alignl_label
C_g_setup_23
 word I16A_MOV + (r22)<<D16A + (r8)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_G__V_A_R_+164 ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_MOV + (r20)<<D16A + (r10)<<S16A
 word I16A_SHLI + (r20)<<D16A + (6)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r8)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_WRLONG + (r0)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_g_setup_24 ' (symbol refcount = 0)
 word I16A_ADDSI + (r8)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_g_setup_26
 alignl_p1
 long I32_MOVI + RI<<D32 + (50)<<S32
 word I16A_CMPS + (r9)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRAE + (@C_g_setup_29)<<S32 ' GEI4 reg coni
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r9)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_p1
 long I32_JMPA + (@C_g_setup_30)<<S32 ' JUMPV addrg
 alignl_label
C_g_setup_29
 alignl_p1
 long I32_LODS + (r22)<<D32S + ((50)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl_label
C_g_setup_30
 word I16B_LODF + ((-36)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPS + (r8)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C_g_setup_23)<<S32 ' LTI4 reg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_)<<S32
 word I16A_WRWORD + (r22)<<D16A + RI<<S16A ' ASGNI2 addrg reg
 word I16A_MOV + (r22)<<D16A + (r9)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+2)<<S32
 word I16A_WRWORD + (r22)<<D16A + RI<<S16A ' ASGNI2 addrg reg
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+4)<<S32
 word I16A_WRWORD + (r22)<<D16A + RI<<S16A ' ASGNI2 addrg reg
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+12)<<S32
 word I16A_WRLONG + (r7)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+16)<<S32
 word I16A_WRLONG + (r6)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+20)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+24)<<S32
 word I16A_WRLONG + (r17)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+28)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+32)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+36)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+40)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+44)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_SHLI + (r10)<<D16A + (4)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r10)<<S16A ' SUBI/P
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A ' SUBI/P (3)
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+80)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_g_setup_44)<<S32 ' NEI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+80+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+80+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+80+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_p1
 long I32_JMPA + (@C_g_setup_45)<<S32 ' JUMPV addrg
 alignl_label
C_g_setup_44
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 1431655765 ' reg <- con
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+80+4)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $aaaaaaaa ' reg <- con
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+80+8)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_LODA + (@C_G__V_A_R_+80+12)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C_g_setup_45
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r9)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r10)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_s8po_696ddf77_font_L000004 ' reg <- addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r6)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_G__V_A_R_+20 ' reg <- addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r15)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_G__V_A_R_+164 ' reg <- addrg
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_G__V_A_R_+48 ' reg <- addrg
 word I16A_WRLONG + (r22)<<D16A + (r15)<<S16A ' ASGNI4 reg reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_G__V_A_R_+96 ' reg <- addrg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__setcommand)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_g_db_setup)<<S32 ' CALL addrg
 word I16B_LODF + ((-32)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_g_setup_5 ' (symbol refcount = 0)
 word I16B_POPM + 8<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _setcommand

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export _display_base

 alignl_label
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

 alignl_label
C_G__V_A_R_ ' <symbol:G_VAR>
 byte 0[364]

' Catalina Code

DAT ' code segment
' end
