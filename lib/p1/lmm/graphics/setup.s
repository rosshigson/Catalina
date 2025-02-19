' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _cgi_cog

 alignl ' align long
C__cgi_cog ' <symbol:_cgi_cog>
 long -1

 alignl ' align long
C_saac_67b10f43_colors_L000004 ' <symbol:colors>
 long $0
 long $55555555
 long $aaaaaaaa
 long $ffffffff

 alignl ' align long
C_saac1_67b10f43_font_L000005 ' <symbol:font>
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
 word $fed2
 word $f6a2
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
 word $9852
 word $1a52
 word $40c
 word $1dc9
 word $c1b2
 word $2224
 word $c1b2
 word $3020
 word $e5b2
 word $9222
 word $2242
 word $c1b2
 word $3224
 word $d1b2
 word $9a30
 word $1222
 word $f5d4
 word $a240
 word $2922
 word $c1b2
 word $fd9a
 word $a21c
 word $509
 word $e1b2
 word $b020
 word $1a24
 word $91a1
 word $a122
 word $a141
 word $295a
 word $fd98
 word $a11a
 word $a141
 word $295a
 word $b020
 word $9930
 word $a232
 word $1232
 word $91a1
 word $b122
 word $3161
 word $e039
 word $e03b
 word $a020
 word $9d22
 word $1e24
 word $e1b2
 word $a020
 word $1a24
 word $41b2
 word $c1b2
 word $2008
 word $c1b2
 word $220c
 word $e0ba
 word $2020
 word $e4ba
 word $ecaa
 word $9120
 word $2242
 word $f9b4
 word $a240
 word $2932
 word $e9b2
 word $a030
 word $2224
 word $9140
 word $1144
 word $e829
 word $e82b
 word $a028
 word $992a
 word $222c
 word $9240
 word $2220
 word $e9b2
 word $fd9a
 word $a21c
 word $a030
 word $509
 word $a240
 word $9044
 word $1220
 word $f653
 word $f131
 word $fd51
 word $7a33
 word $351a
 word $f251
 word $f533
 word $f953
 word $7e31
 word $e041
 word $6843
 word $904a
 word $924a
 word $1220
 word $e1ba
 word $f939
 word $fd3b
 word $90a9
 word $91ab
 word $90a0
 word $11a4
 word $4042

' Catalina Export g_setup

' Catalina Code

DAT ' code segment

 alignl ' align long
C_g_setup ' <symbol:g_setup>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_G__V_A_R_+84
 mov r17, RI ' reg <- addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_tiles ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_tiles ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_display_base ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__display_base
 wrlong r22, RI ' ASGNU4 addrg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_cgi_bitmap_base ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r7, r22 ' CVI, CVU or LOAD
 mov r2, #9 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__locate_plugin ' CALL addrg
 mov r22, r0
 adds r22, #128 ' ADDI4 coni
 jmp #LODL
 long @C__cgi_cog
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_g_setup_11 ' JUMPV addrg
C_g_setup_8
 mov r22, r15
 shl r22, #1 ' LSHI4 coni
 jmp #LODL
 long @C_G__V_A_R_+116
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r9
 shl r20, #6 ' LSHI4 coni
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0 ' CVI, CVU or LOAD
 add r20, r7 ' ADDU (2)
 wrword r20, r22 ' ASGNI2 reg reg
' C_g_setup_9 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_g_setup_11
 mov r22, r11
 subs r22, #1 ' SUBI4 coni
 cmps r22,  #31 wz,wc
 jmp #BRAE
 long @C_g_setup_14 ' GEI4
 mov r22, r11
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_g_setup_15 ' JUMPV addrg
C_g_setup_14
 mov r22, #31 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
C_g_setup_15
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r15, r22 wz,wc
 jmp #BRBE
 long @C_g_setup_8 ' LEI4
 jmp #LODL
 long @C_G__V_A_R_
 wrlong r11, RI ' ASGNI4 addrg reg
 jmp #LODL
 long @C_G__V_A_R_+4
 wrlong r9, RI ' ASGNI4 addrg reg
 mov r22, r7 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_G__V_A_R_+8
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r11 ' setup r0/r1 (2)
 mov r1, r9 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 shl r22, #4 ' LSHI4 coni
 shl r22, #4 ' LSHI4 coni
 shl r22, #1 ' LSHI4 coni
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODL
 long @C_G__V_A_R_+12
 wrlong r0, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+16
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+20
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+24
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+28
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, #0 ' reg <- coni
 jmp #LODL
 long @C_G__V_A_R_+32
 wrlong r22, RI ' ASGNI4 addrg reg
 shl r9, #4 ' LSHI4 coni
 mov r22, r9 ' SUBI/P
 subs r22, r21 ' SUBI/P (3)
 mov r21, r22
 subs r21, #1 ' SUBI4 coni
 jmp #LODL
 long @C_G__V_A_R_+116
 mov r22, RI ' reg <- addrg
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_G__V_A_R_+36
 mov r22, RI ' reg <- addrg
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r13, #0 ' reg <- coni
C_g_setup_26
 mov r22, r13
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_G__V_A_R_+68
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 jmp #LODL
 long @C_saac_67b10f43_colors_L000004
 mov r18, RI ' reg <- addrg
 adds r22, r18 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r20 ' ASGNI4 reg reg
' C_g_setup_27 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
 cmps r13,  #4 wz,wc
 jmp #BR_B
 long @C_g_setup_26 ' LTI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 wrlong r11, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 wrlong r9, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 jmp #LODL
 long @C_saac1_67b10f43_font_L000005
 mov r20, RI ' reg <- addrg
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 wrlong r15, r22 ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 wrlong r22, r17 ' ASGNI4 reg reg
 jmp #LODL
 long @C_G__V_A_R_+84
 mov r22, RI ' reg <- addrg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_setup_6 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
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

' Catalina Import _locate_plugin

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import cgi_bitmap_base

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
 byte 0[180]

' Catalina Code

DAT ' code segment
' end
