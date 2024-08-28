' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_slo0_66cc6366_u_posrelat_L000004 ' <symbol:u_posrelat>
 jmp #PSHM
 long $500000 ' save registers
 cmps r3,  #0 wz,wc
 jmp #BR_B
 long @C_slo0_66cc6366_u_posrelat_L000004_6 ' LTI4
 mov r0, r3 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slo0_66cc6366_u_posrelat_L000004_5 ' JUMPV addrg
C_slo0_66cc6366_u_posrelat_L000004_6
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 cmp r22, r2 wz,wc 
 jmp #BRBE
 long @C_slo0_66cc6366_u_posrelat_L000004_8 ' LEU4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_slo0_66cc6366_u_posrelat_L000004_5 ' JUMPV addrg
C_slo0_66cc6366_u_posrelat_L000004_8
 mov r22, r2 ' CVI, CVU or LOAD
 adds r22, r3 ' ADDI/P (1)
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
C_slo0_66cc6366_u_posrelat_L000004_5
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slo01_66cc6366_utf8_decode_L000010_limits_L000013 ' <symbol:limits>
 long $ffffffff
 long $80
 long $800
 long $10000
 long $200000
 long $4000000

' Catalina Code

DAT ' code segment

 alignl ' align long
C_slo01_66cc6366_utf8_decode_L000010 ' <symbol:utf8_decode>
 jmp #PSHM
 long $fa0000 ' save registers
 rdbyte r22, r4 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r21, r22 ' CVI, CVU or LOAD
 mov r23, #0 ' reg <- coni
 cmp r21,  #128 wz,wc 
 jmp #BRAE
 long @C_slo01_66cc6366_utf8_decode_L000010_14 ' GEU4
 mov r23, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slo01_66cc6366_utf8_decode_L000010_15 ' JUMPV addrg
C_slo01_66cc6366_utf8_decode_L000010_14
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_slo01_66cc6366_utf8_decode_L000010_19 ' JUMPV addrg
C_slo01_66cc6366_utf8_decode_L000010_16
 mov r22, r19
 adds r22, #1 ' ADDI4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 adds r22, r4 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22 ' CVI, CVU or LOAD
 mov r22, r17
 and r22, #192 ' BANDU4 coni
 cmp r22,  #128 wz
 jmp #BR_Z
 long @C_slo01_66cc6366_utf8_decode_L000010_20 ' EQU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_slo01_66cc6366_utf8_decode_L000010_11 ' JUMPV addrg
C_slo01_66cc6366_utf8_decode_L000010_20
 mov r22, r23
 shl r22, #6 ' LSHU4 coni
 mov r20, r17
 and r20, #63 ' BANDU4 coni
 mov r23, r22 ' BORI/U
 or r23, r20 ' BORI/U (3)
' C_slo01_66cc6366_utf8_decode_L000010_17 ' (symbol refcount = 0)
 shl r21, #1 ' LSHU4 coni
C_slo01_66cc6366_utf8_decode_L000010_19
 mov r22, r21
 and r22, #64 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_slo01_66cc6366_utf8_decode_L000010_16 ' NEU4
 mov r22, r21
 and r22, #127 ' BANDU4 coni
 mov r20, #5 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 shl r22, r0 ' LSHI/U (1)
 or r23, r22 ' BORI/U (1)
 cmps r19,  #5 wz,wc
 jmp #BR_A
 long @C_slo01_66cc6366_utf8_decode_L000010_25 ' GTI4
 jmp #LODL
 long $7fffffff
 mov r22, RI ' reg <- con
 cmp r23, r22 wz,wc 
 jmp #BR_A
 long @C_slo01_66cc6366_utf8_decode_L000010_25 ' GTU4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_slo01_66cc6366_utf8_decode_L000010_limits_L000013
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r23, r22 wz,wc 
 jmp #BRAE
 long @C_slo01_66cc6366_utf8_decode_L000010_22 ' GEU4
C_slo01_66cc6366_utf8_decode_L000010_25
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_slo01_66cc6366_utf8_decode_L000010_11 ' JUMPV addrg
C_slo01_66cc6366_utf8_decode_L000010_22
 adds r4, r19 ' ADDI/P (2)
C_slo01_66cc6366_utf8_decode_L000010_15
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_slo01_66cc6366_utf8_decode_L000010_26 ' EQI4
 jmp #LODL
 long $10ffff
 mov r22, RI ' reg <- con
 cmp r23, r22 wz,wc 
 jmp #BR_A
 long @C_slo01_66cc6366_utf8_decode_L000010_30 ' GTU4
 jmp #LODL
 long $d800
 mov r22, RI ' reg <- con
 cmp r22, r23 wz,wc 
 jmp #BR_A
 long @C_slo01_66cc6366_utf8_decode_L000010_28 ' GTU4
 jmp #LODL
 long $dfff
 mov r22, RI ' reg <- con
 cmp r23, r22 wz,wc 
 jmp #BR_A
 long @C_slo01_66cc6366_utf8_decode_L000010_28 ' GTU4
C_slo01_66cc6366_utf8_decode_L000010_30
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_slo01_66cc6366_utf8_decode_L000010_11 ' JUMPV addrg
C_slo01_66cc6366_utf8_decode_L000010_28
C_slo01_66cc6366_utf8_decode_L000010_26
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_slo01_66cc6366_utf8_decode_L000010_31 ' EQU4
 wrlong r23, r3 ' ASGNU4 reg reg
C_slo01_66cc6366_utf8_decode_L000010_31
 mov r0, r4
 adds r0, #1 ' ADDP4 coni
C_slo01_66cc6366_utf8_decode_L000010_11
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_slo03_66cc6366_utflen_L000033 ' <symbol:utflen>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0_66cc6366_u_posrelat_L000004
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0_66cc6366_u_posrelat_L000004
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 cmps r22, r21 wz,wc
 jmp #BR_A
 long @C_slo03_66cc6366_utflen_L000033_38 ' GTI4
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_slo03_66cc6366_utflen_L000033_37 ' LEI4
C_slo03_66cc6366_utflen_L000033_38
 jmp #LODL
 long @C_slo03_66cc6366_utflen_L000033_35_L000036
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_slo03_66cc6366_utflen_L000033_37
 mov r22, r15
 subs r22, #1 ' SUBI4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_slo03_66cc6366_utflen_L000033_41 ' LTI4
 jmp #LODL
 long @C_slo03_66cc6366_utflen_L000033_39_L000040
 mov r2, RI ' reg ARG ADDRG
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_slo03_66cc6366_utflen_L000033_41
 jmp #JMPA
 long @C_slo03_66cc6366_utflen_L000033_43 ' JUMPV addrg
C_slo03_66cc6366_utflen_L000033_42
 cmps r13,  #0 wz
 jmp #BRNZ
 long @C_slo03_66cc6366_utflen_L000033_46 ' NEI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_slo03_66cc6366_utflen_L000033_47 ' JUMPV addrg
C_slo03_66cc6366_utflen_L000033_46
 mov r9, #0 ' reg <- coni
C_slo03_66cc6366_utflen_L000033_47
 mov r2, r9 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, r21 ' ADDI/P
 adds r4, r19 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo01_66cc6366_utf8_decode_L000010
 add SP, #8 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r11 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_slo03_66cc6366_utflen_L000033_48 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, r21
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
 jmp #JMPA
 long @C_slo03_66cc6366_utflen_L000033_34 ' JUMPV addrg
C_slo03_66cc6366_utflen_L000033_48
 mov r22, r11 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r21, r22 ' CVI, CVU or LOAD
 adds r17, #1 ' ADDI4 coni
C_slo03_66cc6366_utflen_L000033_43
 cmps r21, r15 wz,wc
 jmp #BRBE
 long @C_slo03_66cc6366_utflen_L000033_42 ' LEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' RET coni
C_slo03_66cc6366_utflen_L000033_34
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_slo06_66cc6366_codepoint_L000050 ' <symbol:codepoint>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0_66cc6366_u_posrelat_L000004
 add SP, #4 ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0_66cc6366_u_posrelat_L000004
 add SP, #4 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r13,  #1 wz,wc
 jmp #BRAE
 long @C_slo06_66cc6366_codepoint_L000050_54 ' GEI4
 jmp #LODL
 long @C_slo06_66cc6366_codepoint_L000050_52_L000053
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_slo06_66cc6366_codepoint_L000050_54
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r11, r22 wz,wc
 jmp #BRBE
 long @C_slo06_66cc6366_codepoint_L000050_55 ' LEI4
 jmp #LODL
 long @C_slo06_66cc6366_codepoint_L000050_52_L000053
 mov r2, RI ' reg ARG ADDRG
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_slo06_66cc6366_codepoint_L000050_55
 cmps r13, r11 wz,wc
 jmp #BRBE
 long @C_slo06_66cc6366_codepoint_L000050_56 ' LEI4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_slo06_66cc6366_codepoint_L000050_51 ' JUMPV addrg
C_slo06_66cc6366_codepoint_L000050_56
 mov r22, r11 ' SUBI/P
 subs r22, r13 ' SUBI/P (3)
 jmp #LODL
 long 2147483647
 mov r20, RI ' reg <- con
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_slo06_66cc6366_codepoint_L000050_58 ' LTI4
 jmp #LODL
 long @C_slo06_66cc6366_codepoint_L000050_60_L000061
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slo06_66cc6366_codepoint_L000050_51 ' JUMPV addrg
C_slo06_66cc6366_codepoint_L000050_58
 mov r22, r11 ' SUBI/P
 subs r22, r13 ' SUBI/P (3)
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 jmp #LODL
 long @C_slo06_66cc6366_codepoint_L000050_60_L000061
 mov r2, RI ' reg ARG ADDRG
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 mov r19, #0 ' reg <- coni
 mov r15, r11 ' ADDI/P
 adds r15, r21 ' ADDI/P (3)
 mov r22, r13
 subs r22, #1 ' SUBI4 coni
 adds r21, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_slo06_66cc6366_codepoint_L000050_65 ' JUMPV addrg
C_slo06_66cc6366_codepoint_L000050_62
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_slo06_66cc6366_codepoint_L000050_67 ' NEI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_slo06_66cc6366_codepoint_L000050_68 ' JUMPV addrg
C_slo06_66cc6366_codepoint_L000050_67
 mov r9, #0 ' reg <- coni
C_slo06_66cc6366_codepoint_L000050_68
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-12) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo01_66cc6366_utf8_decode_L000010
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_slo06_66cc6366_codepoint_L000050_69 ' NEU4
 jmp #LODL
 long @C_slo06_66cc6366_codepoint_L000050_71_L000072
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slo06_66cc6366_codepoint_L000050_51 ' JUMPV addrg
C_slo06_66cc6366_codepoint_L000050_69
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 adds r19, #1 ' ADDI4 coni
' C_slo06_66cc6366_codepoint_L000050_63 ' (symbol refcount = 0)
C_slo06_66cc6366_codepoint_L000050_65
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_slo06_66cc6366_codepoint_L000050_62' LTU4
 mov r0, r19 ' CVI, CVU or LOAD
C_slo06_66cc6366_codepoint_L000050_51
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_slo0a_66cc6366_pushutfchar_L000073 ' <symbol:pushutfchar>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long $7fffffff
 mov r22, RI ' reg <- con
 cmp r19, r22 wz,wc 
 jmp #BRBE
 long @C_slo0a_66cc6366_pushutfchar_L000073_77 ' LEU4
 jmp #LODL
 long @C_slo0a_66cc6366_pushutfchar_L000073_75_L000076
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_slo0a_66cc6366_pushutfchar_L000073_77
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_slo0a_66cc6366_pushutfchar_L000073_78_L000079
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushfstring
 add SP, #8 ' CALL addrg
' C_slo0a_66cc6366_pushutfchar_L000073_74 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slo0d_66cc6366_utfchar_L000080 ' <symbol:utfchar>
 jmp #NEWF
 sub SP, #272
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wz
 jmp #BRNZ
 long @C_slo0d_66cc6366_utfchar_L000080_82 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0a_66cc6366_pushutfchar_L000073
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_slo0d_66cc6366_utfchar_L000080_83 ' JUMPV addrg
C_slo0d_66cc6366_utfchar_L000080_82
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__buffinit
 add SP, #4 ' CALL addrg
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_slo0d_66cc6366_utfchar_L000080_87 ' JUMPV addrg
C_slo0d_66cc6366_utfchar_L000080_84
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0a_66cc6366_pushutfchar_L000073
 add SP, #4 ' CALL addrg
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__addvalue ' CALL addrg
' C_slo0d_66cc6366_utfchar_L000080_85 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_slo0d_66cc6366_utfchar_L000080_87
 cmps r19, r21 wz,wc
 jmp #BRBE
 long @C_slo0d_66cc6366_utfchar_L000080_84 ' LEI4
 mov r2, FP
 sub r2, #-(-276) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaL__pushresult ' CALL addrg
C_slo0d_66cc6366_utfchar_L000080_83
 mov r0, #1 ' RET coni
' C_slo0d_66cc6366_utfchar_L000080_81 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #272 ' framesize
 jmp #RETF


 alignl ' align long
C_slo0e_66cc6366_byteoffset_L000088 ' <symbol:byteoffset>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz,wc
 jmp #BR_B
 long @C_slo0e_66cc6366_byteoffset_L000088_91 ' LTI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_slo0e_66cc6366_byteoffset_L000088_92 ' JUMPV addrg
C_slo0e_66cc6366_byteoffset_L000088_91
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r15, r22
 add r15, #1 ' ADDU4 coni
C_slo0e_66cc6366_byteoffset_L000088_92
 mov r21, r15 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0_66cc6366_u_posrelat_L000004
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 cmps r22, r21 wz,wc
 jmp #BR_A
 long @C_slo0e_66cc6366_byteoffset_L000088_96 ' GTI4
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_slo0e_66cc6366_byteoffset_L000088_95 ' LEI4
C_slo0e_66cc6366_byteoffset_L000088_96
 jmp #LODL
 long @C_slo0e_66cc6366_byteoffset_L000088_93_L000094
 mov r2, RI ' reg ARG ADDRG
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_slo0e_66cc6366_byteoffset_L000088_95
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_slo0e_66cc6366_byteoffset_L000088_97 ' NEI4
 jmp #JMPA
 long @C_slo0e_66cc6366_byteoffset_L000088_100 ' JUMPV addrg
C_slo0e_66cc6366_byteoffset_L000088_99
 subs r21, #1 ' SUBI4 coni
C_slo0e_66cc6366_byteoffset_L000088_100
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_slo0e_66cc6366_byteoffset_L000088_102 ' LEI4
 mov r22, r21 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #192 ' BANDI4 coni
 cmps r22,  #128 wz
 jmp #BR_Z
 long @C_slo0e_66cc6366_byteoffset_L000088_99 ' EQI4
C_slo0e_66cc6366_byteoffset_L000088_102
 jmp #JMPA
 long @C_slo0e_66cc6366_byteoffset_L000088_98 ' JUMPV addrg
C_slo0e_66cc6366_byteoffset_L000088_97
 mov r22, r21 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #192 ' BANDI4 coni
 cmps r22,  #128 wz
 jmp #BRNZ
 long @C_slo0e_66cc6366_byteoffset_L000088_103 ' NEI4
 jmp #LODL
 long @C_slo0e_66cc6366_byteoffset_L000088_105_L000106
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slo0e_66cc6366_byteoffset_L000088_89 ' JUMPV addrg
C_slo0e_66cc6366_byteoffset_L000088_103
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_slo0e_66cc6366_byteoffset_L000088_107 ' GEI4
 jmp #JMPA
 long @C_slo0e_66cc6366_byteoffset_L000088_110 ' JUMPV addrg
C_slo0e_66cc6366_byteoffset_L000088_109
C_slo0e_66cc6366_byteoffset_L000088_112
 subs r21, #1 ' SUBI4 coni
' C_slo0e_66cc6366_byteoffset_L000088_113 ' (symbol refcount = 0)
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_slo0e_66cc6366_byteoffset_L000088_115 ' LEI4
 mov r22, r21 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #192 ' BANDI4 coni
 cmps r22,  #128 wz
 jmp #BR_Z
 long @C_slo0e_66cc6366_byteoffset_L000088_112 ' EQI4
C_slo0e_66cc6366_byteoffset_L000088_115
 adds r17, #1 ' ADDI4 coni
C_slo0e_66cc6366_byteoffset_L000088_110
 mov r22, #0 ' reg <- coni
 cmps r17, r22 wz,wc
 jmp #BRAE
 long @C_slo0e_66cc6366_byteoffset_L000088_116 ' GEI4
 cmps r21, r22 wz,wc
 jmp #BR_A
 long @C_slo0e_66cc6366_byteoffset_L000088_109 ' GTI4
C_slo0e_66cc6366_byteoffset_L000088_116
 jmp #JMPA
 long @C_slo0e_66cc6366_byteoffset_L000088_108 ' JUMPV addrg
C_slo0e_66cc6366_byteoffset_L000088_107
 subs r17, #1 ' SUBI4 coni
 jmp #JMPA
 long @C_slo0e_66cc6366_byteoffset_L000088_118 ' JUMPV addrg
C_slo0e_66cc6366_byteoffset_L000088_117
C_slo0e_66cc6366_byteoffset_L000088_120
 adds r21, #1 ' ADDI4 coni
' C_slo0e_66cc6366_byteoffset_L000088_121 ' (symbol refcount = 0)
 mov r22, r21 ' ADDI/P
 adds r22, r19 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #192 ' BANDI4 coni
 cmps r22,  #128 wz
 jmp #BR_Z
 long @C_slo0e_66cc6366_byteoffset_L000088_120 ' EQI4
 subs r17, #1 ' SUBI4 coni
C_slo0e_66cc6366_byteoffset_L000088_118
 cmps r17,  #0 wz,wc
 jmp #BRBE
 long @C_slo0e_66cc6366_byteoffset_L000088_123 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r21, r22 wz,wc
 jmp #BR_B
 long @C_slo0e_66cc6366_byteoffset_L000088_117 ' LTI4
C_slo0e_66cc6366_byteoffset_L000088_123
C_slo0e_66cc6366_byteoffset_L000088_108
C_slo0e_66cc6366_byteoffset_L000088_98
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_slo0e_66cc6366_byteoffset_L000088_124 ' NEI4
 mov r2, r21
 adds r2, #1 ' ADDI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_slo0e_66cc6366_byteoffset_L000088_125 ' JUMPV addrg
C_slo0e_66cc6366_byteoffset_L000088_124
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
C_slo0e_66cc6366_byteoffset_L000088_125
 mov r0, #1 ' RET coni
C_slo0e_66cc6366_byteoffset_L000088_89
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_slo0h_66cc6366_iter_aux_L000126 ' <symbol:iter_aux>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tointegerx
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wz,wc 
 jmp #BRAE
 long @C_slo0h_66cc6366_iter_aux_L000126_128 ' GEU4
 jmp #JMPA
 long @C_slo0h_66cc6366_iter_aux_L000126_131 ' JUMPV addrg
C_slo0h_66cc6366_iter_aux_L000126_130
 add r19, #1 ' ADDU4 coni
C_slo0h_66cc6366_iter_aux_L000126_131
 mov r22, r19 ' ADDI/P
 adds r22, r17 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #192 ' BANDI4 coni
 cmps r22,  #128 wz
 jmp #BR_Z
 long @C_slo0h_66cc6366_iter_aux_L000126_130 ' EQI4
C_slo0h_66cc6366_iter_aux_L000126_128
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r19, r22 wz,wc 
 jmp #BR_B
 long @C_slo0h_66cc6366_iter_aux_L000126_133' LTU4
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_slo0h_66cc6366_iter_aux_L000126_127 ' JUMPV addrg
C_slo0h_66cc6366_iter_aux_L000126_133
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r19 ' ADDI/P
 adds r4, r17 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo01_66cc6366_utf8_decode_L000010
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_slo0h_66cc6366_iter_aux_L000126_135 ' NEU4
 jmp #LODL
 long @C_slo06_66cc6366_codepoint_L000050_71_L000072
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_slo0h_66cc6366_iter_aux_L000126_127 ' JUMPV addrg
C_slo0h_66cc6366_iter_aux_L000126_135
 mov r22, r19
 add r22, #1 ' ADDU4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #2 ' RET coni
C_slo0h_66cc6366_iter_aux_L000126_127
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_slo0i_66cc6366_iter_auxstrict_L000137 ' <symbol:iter_auxstrict>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0h_66cc6366_iter_aux_L000126
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slo0i_66cc6366_iter_auxstrict_L000137_138 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slo0j_66cc6366_iter_auxlax_L000139 ' <symbol:iter_auxlax>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_slo0h_66cc6366_iter_aux_L000126
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_slo0j_66cc6366_iter_auxlax_L000139_140 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_slo0k_66cc6366_iter_codes_L000141 ' <symbol:iter_codes>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 jmp #LODF
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_slo0k_66cc6366_iter_codes_L000141_144 ' EQI4
 jmp #LODL
 long @C_slo0j_66cc6366_iter_auxlax_L000139
 mov r21, RI ' reg <- addrg
 jmp #JMPA
 long @C_slo0k_66cc6366_iter_codes_L000141_145 ' JUMPV addrg
C_slo0k_66cc6366_iter_codes_L000141_144
 jmp #LODL
 long @C_slo0i_66cc6366_iter_auxstrict_L000137
 mov r21, RI ' reg <- addrg
C_slo0k_66cc6366_iter_codes_L000141_145
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushcclosure
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #3 ' RET coni
' C_slo0k_66cc6366_iter_codes_L000141_142 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_slo0l_66cc6366_funcs_L000146 ' <symbol:funcs>
 long @C_slo0m_66cc6366_147_L000148
 long @C_slo0e_66cc6366_byteoffset_L000088
 long @C_slo0n_66cc6366_149_L000150
 long @C_slo06_66cc6366_codepoint_L000050
 long @C_slo0o_66cc6366_151_L000152
 long @C_slo0d_66cc6366_utfchar_L000080
 long @C_slo0p_66cc6366_153_L000154
 long @C_slo03_66cc6366_utflen_L000033
 long @C_slo0q_66cc6366_155_L000156
 long @C_slo0k_66cc6366_iter_codes_L000141
 long @C_slo0r_66cc6366_157_L000158
 long $0
 long $0
 long $0

' Catalina Export luaopen_utf8

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_utf8 ' <symbol:luaopen_utf8>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #68 ' reg ARG coni
 jmp #LODI
 long @C_luaopen_utf8_160_L000161
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkversion_
 add SP, #8 ' CALL addrg
 mov r2, #6 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_createtable
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_slo0l_66cc6366_funcs_L000146
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 mov r2, #14 ' reg ARG coni
 jmp #LODL
 long @C_luaopen_utf8_162_L000163
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushlstring
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_slo0r_66cc6366_157_L000158
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setfield
 add SP, #8 ' CALL addrg
 mov r0, #1 ' RET coni
' C_luaopen_utf8_159 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


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

 alignl ' align long
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

 alignl ' align long
C_luaopen_utf8_160_L000161 ' <symbol:160>
 long $43fc0000 ' float

 alignl ' align long
C_slo0r_66cc6366_157_L000158 ' <symbol:157>
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

 alignl ' align long
C_slo0q_66cc6366_155_L000156 ' <symbol:155>
 byte 99
 byte 111
 byte 100
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_slo0p_66cc6366_153_L000154 ' <symbol:153>
 byte 108
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_slo0o_66cc6366_151_L000152 ' <symbol:151>
 byte 99
 byte 104
 byte 97
 byte 114
 byte 0

 alignl ' align long
C_slo0n_66cc6366_149_L000150 ' <symbol:149>
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

 alignl ' align long
C_slo0m_66cc6366_147_L000148 ' <symbol:147>
 byte 111
 byte 102
 byte 102
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_slo0e_66cc6366_byteoffset_L000088_105_L000106 ' <symbol:105>
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

 alignl ' align long
C_slo0e_66cc6366_byteoffset_L000088_93_L000094 ' <symbol:93>
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

 alignl ' align long
C_slo0a_66cc6366_pushutfchar_L000073_78_L000079 ' <symbol:78>
 byte 37
 byte 85
 byte 0

 alignl ' align long
C_slo0a_66cc6366_pushutfchar_L000073_75_L000076 ' <symbol:75>
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

 alignl ' align long
C_slo06_66cc6366_codepoint_L000050_71_L000072 ' <symbol:71>
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

 alignl ' align long
C_slo06_66cc6366_codepoint_L000050_60_L000061 ' <symbol:60>
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

 alignl ' align long
C_slo06_66cc6366_codepoint_L000050_52_L000053 ' <symbol:52>
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

 alignl ' align long
C_slo03_66cc6366_utflen_L000033_39_L000040 ' <symbol:39>
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

 alignl ' align long
C_slo03_66cc6366_utflen_L000033_35_L000036 ' <symbol:35>
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
