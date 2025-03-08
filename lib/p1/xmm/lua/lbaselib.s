' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_seig_67cacb7b_luaB__print_L000004 ' <symbol:luaB_print>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig_67cacb7b_luaB__print_L000004_9 ' JUMPV addrg
C_seig_67cacb7b_luaB__print_L000004_6
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__tolstring
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r21,  #1 wz,wc
 jmp #BRBE
 long @C_seig_67cacb7b_luaB__print_L000004_10 ' LEI4
 jmp #LODL
 long @C___stdout
 mov r2, RI ' reg ARG ADDRG
 mov r22, #1 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_seig_67cacb7b_luaB__print_L000004_12_L000013
 mov r5, RI ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
C_seig_67cacb7b_luaB__print_L000004_10
 jmp #LODL
 long @C___stdout
 mov r2, RI ' reg ARG ADDRG
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, #1 ' reg ARG coni
 mov r5, r17 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
' C_seig_67cacb7b_luaB__print_L000004_7 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_seig_67cacb7b_luaB__print_L000004_9
 cmps r21, r19 wz,wc
 jmp #BRBE
 long @C_seig_67cacb7b_luaB__print_L000004_6 ' LEI4
 jmp #LODL
 long @C___stdout
 mov r2, RI ' reg ARG ADDRG
 mov r22, #1 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_seig_67cacb7b_luaB__print_L000004_14_L000015
 mov r5, RI ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_fwrite
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C___stdout
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_fflush ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_seig_67cacb7b_luaB__print_L000004_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_seig3_67cacb7b_luaB__warn_L000016 ' <symbol:luaB_warn>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
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
 mov r21, #2 ' reg <- coni
 jmp #JMPA
 long @C_seig3_67cacb7b_luaB__warn_L000016_21 ' JUMPV addrg
C_seig3_67cacb7b_luaB__warn_L000016_18
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checklstring
 add SP, #8 ' CALL addrg
' C_seig3_67cacb7b_luaB__warn_L000016_19 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_seig3_67cacb7b_luaB__warn_L000016_21
 cmps r21, r19 wz,wc
 jmp #BRBE
 long @C_seig3_67cacb7b_luaB__warn_L000016_18 ' LEI4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig3_67cacb7b_luaB__warn_L000016_25 ' JUMPV addrg
C_seig3_67cacb7b_luaB__warn_L000016_22
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_warning
 add SP, #8 ' CALL addrg
' C_seig3_67cacb7b_luaB__warn_L000016_23 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
C_seig3_67cacb7b_luaB__warn_L000016_25
 cmps r21, r19 wz,wc
 jmp #BR_B
 long @C_seig3_67cacb7b_luaB__warn_L000016_22 ' LTI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_warning
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_seig3_67cacb7b_luaB__warn_L000016_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig4_67cacb7b_b_str2int_L000026 ' <symbol:b_str2int>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long @C_seig4_67cacb7b_b_str2int_L000026_28_L000029
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 adds r23, r0 ' ADDI/P (2)
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C_seig4_67cacb7b_b_str2int_L000026_30 ' NEI4
 mov r22, #1 ' reg <- coni
 adds r23, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_seig4_67cacb7b_b_str2int_L000026_31 ' JUMPV addrg
C_seig4_67cacb7b_b_str2int_L000026_30
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C_seig4_67cacb7b_b_str2int_L000026_32 ' NEI4
 adds r23, #1 ' ADDP4 coni
C_seig4_67cacb7b_b_str2int_L000026_32
C_seig4_67cacb7b_b_str2int_L000026_31
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_seig4_67cacb7b_b_str2int_L000026_34 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_seig4_67cacb7b_b_str2int_L000026_27 ' JUMPV addrg
C_seig4_67cacb7b_b_str2int_L000026_34
C_seig4_67cacb7b_b_str2int_L000026_37
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BRAE
 long @C_seig4_67cacb7b_b_str2int_L000026_41 ' GEU4
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r13, r22
 subs r13, #48 ' SUBI4 coni
 jmp #JMPA
 long @C_seig4_67cacb7b_b_str2int_L000026_42 ' JUMPV addrg
C_seig4_67cacb7b_b_str2int_L000026_41
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_toupper ' CALL addrg
 mov r22, r0
 subs r22, #65 ' SUBI4 coni
 mov r13, r22
 adds r13, #10 ' ADDI4 coni
C_seig4_67cacb7b_b_str2int_L000026_42
 mov r15, r13 ' CVI, CVU or LOAD
 cmps r15, r21 wz,wc
 jmp #BR_B
 long @C_seig4_67cacb7b_b_str2int_L000026_43 ' LTI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_seig4_67cacb7b_b_str2int_L000026_27 ' JUMPV addrg
C_seig4_67cacb7b_b_str2int_L000026_43
 mov r22, r21 ' CVI, CVU or LOAD
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r17, r0 ' ADDU
 add r17, r22 ' ADDU (3)
 adds r23, #1 ' ADDP4 coni
' C_seig4_67cacb7b_b_str2int_L000026_38 ' (symbol refcount = 0)
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_seig4_67cacb7b_b_str2int_L000026_37 ' NEI4
 jmp #LODL
 long @C_seig4_67cacb7b_b_str2int_L000026_28_L000029
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strspn
 add SP, #4 ' CALL addrg
 adds r23, r0 ' ADDI/P (2)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_seig4_67cacb7b_b_str2int_L000026_47 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r15, r22 ' SUBU
 sub r15, r17 ' SUBU (3)
 jmp #JMPA
 long @C_seig4_67cacb7b_b_str2int_L000026_48 ' JUMPV addrg
C_seig4_67cacb7b_b_str2int_L000026_47
 mov r15, r17 ' CVI, CVU or LOAD
C_seig4_67cacb7b_b_str2int_L000026_48
 mov r22, r15 ' CVI, CVU or LOAD
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
C_seig4_67cacb7b_b_str2int_L000026_27
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_seig6_67cacb7b_luaB__tonumber_L000049 ' <symbol:luaB_tonumber>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz,wc
 jmp #BR_A
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_51 ' GTI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #3 wz
 jmp #BRNZ
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_53 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_50 ' JUMPV addrg
C_seig6_67cacb7b_luaB__tonumber_L000049_53
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22 ' CVI, CVU or LOAD
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_55 ' EQU4
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_stringtonumber
 add SP, #4 ' CALL addrg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 add r20, #1 ' ADDU4 coni
 cmp r0, r20 wz
 jmp #BRNZ
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_55 ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_50 ' JUMPV addrg
C_seig6_67cacb7b_luaB__tonumber_L000049_55
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_52 ' JUMPV addrg
C_seig6_67cacb7b_luaB__tonumber_L000049_51
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #2 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_60 ' GTI4
 cmps r22,  #36 wz,wc
 jmp #BRBE
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_59 ' LEI4
C_seig6_67cacb7b_luaB__tonumber_L000049_60
 jmp #LODL
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_57_L000058
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_seig6_67cacb7b_luaB__tonumber_L000049_59
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_seig4_67cacb7b_b_str2int_L000026
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r18, FP
 sub r18, #-(-16) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRP4 regl
 adds r20, r18 ' ADDI/P (1)
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_61 ' NEU4
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig6_67cacb7b_luaB__tonumber_L000049_50 ' JUMPV addrg
C_seig6_67cacb7b_luaB__tonumber_L000049_61
C_seig6_67cacb7b_luaB__tonumber_L000049_52
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
C_seig6_67cacb7b_luaB__tonumber_L000049_50
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_seig8_67cacb7b_luaB__error_L000063 ' <symbol:luaB_error>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #4 wz
 jmp #BRNZ
 long @C_seig8_67cacb7b_luaB__error_L000063_65 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_seig8_67cacb7b_luaB__error_L000063_65 ' LEI4
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__where
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_concat
 add SP, #4 ' CALL addrg
C_seig8_67cacb7b_luaB__error_L000063_65
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_error ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_seig8_67cacb7b_luaB__error_L000063_64 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_seig9_67cacb7b_luaB__getmetatable_L000067 ' <symbol:luaB_getmetatable>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_getmetatable
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_seig9_67cacb7b_luaB__getmetatable_L000067_69 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig9_67cacb7b_luaB__getmetatable_L000067_68 ' JUMPV addrg
C_seig9_67cacb7b_luaB__getmetatable_L000067_69
 jmp #LODL
 long @C_seig9_67cacb7b_luaB__getmetatable_L000067_71_L000072
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_seig9_67cacb7b_luaB__getmetatable_L000067_68
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seigb_67cacb7b_luaB__setmetatable_L000073 ' <symbol:luaB_setmetatable>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_seigb_67cacb7b_luaB__setmetatable_L000073_77 ' EQI4
 cmps r21,  #5 wz
 jmp #BR_Z
 long @C_seigb_67cacb7b_luaB__setmetatable_L000073_77 ' EQI4
 jmp #LODL
 long @C_seigb_67cacb7b_luaB__setmetatable_L000073_75_L000076
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_seigb_67cacb7b_luaB__setmetatable_L000073_77
 jmp #LODL
 long @C_seig9_67cacb7b_luaB__getmetatable_L000067_71_L000072
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_seigb_67cacb7b_luaB__setmetatable_L000073_78 ' EQI4
 jmp #LODL
 long @C_seigb_67cacb7b_luaB__setmetatable_L000073_80_L000081
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_seigb_67cacb7b_luaB__setmetatable_L000073_74 ' JUMPV addrg
C_seigb_67cacb7b_luaB__setmetatable_L000073_78
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setmetatable
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_seigb_67cacb7b_luaB__setmetatable_L000073_74
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seige_67cacb7b_luaB__rawequal_L000082 ' <symbol:luaB_rawequal>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawequal
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_seige_67cacb7b_luaB__rawequal_L000082_83 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seigf_67cacb7b_luaB__rawlen_L000084 ' <symbol:luaB_rawlen>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #5 wz
 jmp #BR_Z
 long @C_seigf_67cacb7b_luaB__rawlen_L000084_88 ' EQI4
 cmps r21,  #4 wz
 jmp #BR_Z
 long @C_seigf_67cacb7b_luaB__rawlen_L000084_88 ' EQI4
 jmp #LODL
 long @C_seigf_67cacb7b_luaB__rawlen_L000084_86_L000087
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__typeerror
 add SP, #8 ' CALL addrg
C_seigf_67cacb7b_luaB__rawlen_L000084_88
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawlen
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_seigf_67cacb7b_luaB__rawlen_L000084_85 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seigh_67cacb7b_luaB__rawget_L000089 ' <symbol:luaB_rawget>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawget
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_seigh_67cacb7b_luaB__rawget_L000089_90 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seigi_67cacb7b_luaB__rawset_L000091 ' <symbol:luaB_rawset>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawset
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_seigi_67cacb7b_luaB__rawset_L000091_92 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seigj_67cacb7b_pushmode_L000093 ' <symbol:pushmode>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_seigj_67cacb7b_pushmode_L000093_95 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_seigj_67cacb7b_pushmode_L000093_96 ' JUMPV addrg
C_seigj_67cacb7b_pushmode_L000093_95
 cmps r21,  #11 wz
 jmp #BRNZ
 long @C_seigj_67cacb7b_pushmode_L000093_102 ' NEI4
 jmp #LODL
 long @C_seigj_67cacb7b_pushmode_L000093_97_L000098
 mov r19, RI ' reg <- addrg
 jmp #JMPA
 long @C_seigj_67cacb7b_pushmode_L000093_103 ' JUMPV addrg
C_seigj_67cacb7b_pushmode_L000093_102
 jmp #LODL
 long @C_seigj_67cacb7b_pushmode_L000093_99_L000100
 mov r19, RI ' reg <- addrg
C_seigj_67cacb7b_pushmode_L000093_103
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
C_seigj_67cacb7b_pushmode_L000093_96
 mov r0, #1 ' reg <- coni
' C_seigj_67cacb7b_pushmode_L000093_94 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_opts_L000107 ' <symbol:opts>
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_108_L000109
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_110_L000111
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_112_L000113
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_114_L000115
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_116_L000117
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_118_L000119
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_120_L000121
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_122_L000123
 long @C_seigj_67cacb7b_pushmode_L000093_99_L000100
 long @C_seigj_67cacb7b_pushmode_L000093_97_L000098
 long $0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_optsnum_L000125 ' <symbol:optsnum>
 long 0
 long 1
 long 2
 long 3
 long 5
 long 6
 long 7
 long 9
 long 10
 long 11

' Catalina Code

DAT ' code segment

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104 ' <symbol:luaB_collectgarbage>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_opts_L000107
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_112_L000113
 mov r3, RI ' reg ARG ADDRG
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkoption
 add SP, #12 ' CALL addrg
 mov r22, r0
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_optsnum_L000125
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #3 wz,wc
 jmp #BR_B
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_126 ' LTI4
 cmps r22,  #11 wz,wc
 jmp #BR_A
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_126 ' GTI4
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_146_L000148-12
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_146_L000148 ' <symbol:146>
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_128
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_126
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_133
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_136
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_136
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_126
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_139
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_142
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_143

' Catalina Code

DAT ' code segment
C_seigm_67cacb7b_luaB__collectgarbage_L000104_128
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_129 ' NEI4
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_129
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #FLIN ' CVIF4
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #FLIN ' CVIF4
 jmp #LODI
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_131_L000132
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FDIV ' DIVF4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 regl
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #FADD ' ADDF4
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushnumber
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_133
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_134 ' NEI4
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_134
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_136
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_137 ' NEI4
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_137
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_139
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_140 ' NEI4
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_140
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_142
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_seigj_67cacb7b_pushmode_L000093
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_143
 mov r2, #0 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optinteger
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-12)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_gc
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_seigj_67cacb7b_pushmode_L000093
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_126
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_gc
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_144 ' NEI4
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_127 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_144
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104_105 ' JUMPV addrg
C_seigm_67cacb7b_luaB__collectgarbage_L000104_127
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
C_seigm_67cacb7b_luaB__collectgarbage_L000104_105
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_seig14_67cacb7b_luaB__type_L000150 ' <symbol:luaB_type>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_seig14_67cacb7b_luaB__type_L000150_154 ' NEI4
 jmp #LODL
 long @C_seig14_67cacb7b_luaB__type_L000150_152_L000153
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_seig14_67cacb7b_luaB__type_L000150_154
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_typename
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_seig14_67cacb7b_luaB__type_L000150_151 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig16_67cacb7b_luaB__next_L000155 ' <symbol:luaB_next>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #5 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_next
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_seig16_67cacb7b_luaB__next_L000155_157 ' EQI4
 mov r0, #2 ' reg <- coni
 jmp #JMPA
 long @C_seig16_67cacb7b_luaB__next_L000155_156 ' JUMPV addrg
C_seig16_67cacb7b_luaB__next_L000155_157
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r0, #1 ' reg <- coni
C_seig16_67cacb7b_luaB__next_L000155_156
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig17_67cacb7b_pairscont_L000159 ' <symbol:pairscont>
 mov r0, #3 ' reg <- coni
' C_seig17_67cacb7b_pairscont_L000159_160 ' (symbol refcount = 0)
 jmp #RETN


 alignl ' align long
C_seig18_67cacb7b_luaB__pairs_L000161 ' <symbol:luaB_pairs>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_seig18_67cacb7b_luaB__pairs_L000161_165_L000166
 mov r2, RI ' reg ARG ADDRG
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__getmetafield
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_seig18_67cacb7b_luaB__pairs_L000161_163 ' NEI4
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_seig16_67cacb7b_luaB__next_L000155
 mov r3, RI ' reg ARG ADDRG
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
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 jmp #JMPA
 long @C_seig18_67cacb7b_luaB__pairs_L000161_164 ' JUMPV addrg
C_seig18_67cacb7b_luaB__pairs_L000161_163
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_seig17_67cacb7b_pairscont_L000159
 mov r2, RI ' reg ARG ADDRG
 mov r3, #0 ' reg ARG coni
 mov r4, #3 ' reg ARG coni
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
C_seig18_67cacb7b_luaB__pairs_L000161_164
 mov r0, #3 ' reg <- coni
' C_seig18_67cacb7b_luaB__pairs_L000161_162 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig1a_67cacb7b_ipairsaux_L000167 ' <symbol:ipairsaux>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_geti
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_seig1a_67cacb7b_ipairsaux_L000167_170 ' NEI4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig1a_67cacb7b_ipairsaux_L000167_171 ' JUMPV addrg
C_seig1a_67cacb7b_ipairsaux_L000167_170
 mov r19, #2 ' reg <- coni
C_seig1a_67cacb7b_ipairsaux_L000167_171
 mov r0, r19 ' CVI, CVU or LOAD
' C_seig1a_67cacb7b_ipairsaux_L000167_168 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig1b_67cacb7b_luaB__ipairs_L000172 ' <symbol:luaB_ipairs>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_seig1a_67cacb7b_ipairsaux_L000167
 mov r3, RI ' reg ARG ADDRG
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
 mov r0, #3 ' reg <- coni
' C_seig1b_67cacb7b_luaB__ipairs_L000172_173 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig1c_67cacb7b_load_aux_L000174 ' <symbol:load_aux>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_seig1c_67cacb7b_load_aux_L000174_176 ' NEI4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_seig1c_67cacb7b_load_aux_L000174_178 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_setupvalue
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_seig1c_67cacb7b_load_aux_L000174_180 ' NEU4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
C_seig1c_67cacb7b_load_aux_L000174_180
C_seig1c_67cacb7b_load_aux_L000174_178
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig1c_67cacb7b_load_aux_L000174_175 ' JUMPV addrg
C_seig1c_67cacb7b_load_aux_L000174_176
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_pushnil ' CALL addrg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -2
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r0, #2 ' reg <- coni
C_seig1c_67cacb7b_load_aux_L000174_175
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig1d_67cacb7b_luaB__loadfile_L000182 ' <symbol:luaB_loadfile>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_seig1d_67cacb7b_luaB__loadfile_L000182_185 ' EQI4
 mov r21, #3 ' reg <- coni
 jmp #JMPA
 long @C_seig1d_67cacb7b_luaB__loadfile_L000182_186 ' JUMPV addrg
C_seig1d_67cacb7b_luaB__loadfile_L000182_185
 mov r21, #0 ' reg <- coni
C_seig1d_67cacb7b_luaB__loadfile_L000182_186
 mov RI, FP
 sub RI, #-(-16)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__loadfilex
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_seig1c_67cacb7b_load_aux_L000174
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_seig1d_67cacb7b_luaB__loadfile_L000182_183 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_seig1e_67cacb7b_generic_reader_L000187 ' <symbol:generic_reader>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_seig1e_67cacb7b_generic_reader_L000187_189_L000190
 mov r2, RI ' reg ARG ADDRG
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkstack
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_seig1e_67cacb7b_generic_reader_L000187_191 ' NEI4
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_seig1e_67cacb7b_generic_reader_L000187_188 ' JUMPV addrg
C_seig1e_67cacb7b_generic_reader_L000187_191
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_isstring
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_seig1e_67cacb7b_generic_reader_L000187_193 ' NEI4
 jmp #LODL
 long @C_seig1e_67cacb7b_generic_reader_L000187_195_L000196
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__error
 add SP, #4 ' CALL addrg
C_seig1e_67cacb7b_generic_reader_L000187_193
 mov r2, #5 ' reg ARG coni
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_copy
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #5 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_seig1e_67cacb7b_generic_reader_L000187_188
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig1h_67cacb7b_luaB__load_L000197 ' <symbol:luaB_load>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_seig1h_67cacb7b_luaB__load_L000197_199_L000200
 mov r3, RI ' reg ARG ADDRG
 mov r4, #3 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_seig1h_67cacb7b_luaB__load_L000197_202 ' EQI4
 mov r19, #4 ' reg <- coni
 jmp #JMPA
 long @C_seig1h_67cacb7b_luaB__load_L000197_203 ' JUMPV addrg
C_seig1h_67cacb7b_luaB__load_L000197_202
 mov r19, #0 ' reg <- coni
C_seig1h_67cacb7b_luaB__load_L000197_203
 mov RI, FP
 sub RI, #-(-16)
 wrlong r19, RI ' ASGNI4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_seig1h_67cacb7b_luaB__load_L000197_204 ' EQU4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-20)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaL__loadbufferx
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_seig1h_67cacb7b_luaB__load_L000197_205 ' JUMPV addrg
C_seig1h_67cacb7b_luaB__load_L000197_204
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_seig1h_67cacb7b_luaB__load_L000197_206_L000207
 mov r3, RI ' reg ARG ADDRG
 mov r4, #2 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #5 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 jmp #LODL
 long @C_seig1e_67cacb7b_generic_reader_L000187
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_load
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_seig1h_67cacb7b_luaB__load_L000197_205
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_seig1c_67cacb7b_load_aux_L000174
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_seig1h_67cacb7b_luaB__load_L000197_198 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_seig1k_67cacb7b_dofilecont_L000208 ' <symbol:dofilecont>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 subs r0, #1 ' SUBI4 coni
' C_seig1k_67cacb7b_dofilecont_L000208_209 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig1l_67cacb7b_luaB__dofile_L000210 ' <symbol:luaB_dofile>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, #1 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__optlstring
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__loadfilex
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_seig1l_67cacb7b_luaB__dofile_L000210_212 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_error ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_seig1l_67cacb7b_luaB__dofile_L000210_211 ' JUMPV addrg
C_seig1l_67cacb7b_luaB__dofile_L000210_212
 jmp #LODL
 long @C_seig1k_67cacb7b_dofilecont_L000208
 mov r2, RI ' reg ARG ADDRG
 mov r22, #0 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r4, RI ' reg ARG con
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_callk
 add SP, #16 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_seig1k_67cacb7b_dofilecont_L000208
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_seig1l_67cacb7b_luaB__dofile_L000210_211
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_seig1m_67cacb7b_luaB__assert_L000214 ' <symbol:luaB_assert>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_toboolean
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_seig1m_67cacb7b_luaB__assert_L000214_216 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_seig1m_67cacb7b_luaB__assert_L000214_215 ' JUMPV addrg
C_seig1m_67cacb7b_luaB__assert_L000214_216
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_seig1m_67cacb7b_luaB__assert_L000214_218_L000219
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_settop
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_seig8_67cacb7b_luaB__error_L000063 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_seig1m_67cacb7b_luaB__assert_L000214_215
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig1o_67cacb7b_luaB__select_L000220 ' <symbol:luaB_select>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_type
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #4 wz
 jmp #BRNZ
 long @C_seig1o_67cacb7b_luaB__select_L000220_222 ' NEI4
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_tolstring
 add SP, #8 ' CALL addrg
 mov RI, r0
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #35 wz
 jmp #BRNZ
 long @C_seig1o_67cacb7b_luaB__select_L000220_222 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r2, r22
 subs r2, #1 ' SUBI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushinteger
 add SP, #4 ' CALL addrg
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_seig1o_67cacb7b_luaB__select_L000220_221 ' JUMPV addrg
C_seig1o_67cacb7b_luaB__select_L000220_222
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkinteger
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_seig1o_67cacb7b_luaB__select_L000220_224 ' GEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r21, r22 ' ADDI/P (2)
 jmp #JMPA
 long @C_seig1o_67cacb7b_luaB__select_L000220_225 ' JUMPV addrg
C_seig1o_67cacb7b_luaB__select_L000220_224
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r21, r22 wz,wc
 jmp #BRBE
 long @C_seig1o_67cacb7b_luaB__select_L000220_226 ' LEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRI4 regl
C_seig1o_67cacb7b_luaB__select_L000220_226
C_seig1o_67cacb7b_luaB__select_L000220_225
 mov r22, #1 ' reg <- coni
 cmps r22, r21 wz,wc
 jmp #BRBE
 long @C_seig1o_67cacb7b_luaB__select_L000220_230 ' LEI4
 jmp #LODL
 long @C_seig1o_67cacb7b_luaB__select_L000220_228_L000229
 mov r2, RI ' reg ARG ADDRG
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__argerror
 add SP, #8 ' CALL addrg
C_seig1o_67cacb7b_luaB__select_L000220_230
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r0, r22 ' SUBI/P
 subs r0, r21 ' SUBI/P (3)
C_seig1o_67cacb7b_luaB__select_L000220_221
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_seig1q_67cacb7b_finishpcall_L000231 ' <symbol:finishpcall>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_seig1q_67cacb7b_finishpcall_L000231_233 ' EQI4
 cmps r21,  #1 wz
 jmp #BR_Z
 long @C_seig1q_67cacb7b_finishpcall_L000231_233 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -2
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r0, #2 ' reg <- coni
 jmp #JMPA
 long @C_seig1q_67cacb7b_finishpcall_L000231_232 ' JUMPV addrg
C_seig1q_67cacb7b_finishpcall_L000231_233
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' SUBI/P
 subs r0, r19 ' SUBI/P (3)
C_seig1q_67cacb7b_finishpcall_L000231_232
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_seig1r_67cacb7b_luaB__pcall_L000235 ' <symbol:luaB_pcall>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 jmp #LODL
 long @C_seig1q_67cacb7b_finishpcall_L000231
 mov r2, RI ' reg ARG ADDRG
 mov r20, #0 ' reg <- coni
 mov r3, r20 ' CVI, CVU or LOAD
 mov r4, r20 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r5, RI ' reg ARG con
 mov r22, r0
 subs r22, #2 ' SUBI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_seig1q_67cacb7b_finishpcall_L000231
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_seig1r_67cacb7b_luaB__pcall_L000235_236 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_seig1s_67cacb7b_luaB__xpcall_L000237 ' <symbol:luaB_xpcall>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_lua_gettop ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #6 ' reg ARG coni
 mov r3, #2 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checktype
 add SP, #8 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushboolean
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 mov r2, #2 ' reg ARG coni
 mov r3, #3 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rotate
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_seig1q_67cacb7b_finishpcall_L000231
 mov r2, RI ' reg ARG ADDRG
 mov r22, #2 ' reg <- coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r5, RI ' reg ARG con
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r22, #2 ' SUBI4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_lua_pcallk
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #2 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_seig1q_67cacb7b_finishpcall_L000231
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_seig1s_67cacb7b_luaB__xpcall_L000237_238 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_seig1t_67cacb7b_luaB__tostring_L000239 ' <symbol:luaB_tostring>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__checkany
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__tolstring
 add SP, #8 ' CALL addrg
 mov r0, #1 ' reg <- coni
' C_seig1t_67cacb7b_luaB__tostring_L000239_240 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_seig1u_67cacb7b_base_funcs_L000241 ' <symbol:base_funcs>
 long @C_seig1v_67cacb7b_242_L000243
 long @C_seig1m_67cacb7b_luaB__assert_L000214
 long @C_seig20_67cacb7b_244_L000245
 long @C_seigm_67cacb7b_luaB__collectgarbage_L000104
 long @C_seig21_67cacb7b_246_L000247
 long @C_seig1l_67cacb7b_luaB__dofile_L000210
 long @C_seig22_67cacb7b_248_L000249
 long @C_seig8_67cacb7b_luaB__error_L000063
 long @C_seig23_67cacb7b_250_L000251
 long @C_seig9_67cacb7b_luaB__getmetatable_L000067
 long @C_seig24_67cacb7b_252_L000253
 long @C_seig1b_67cacb7b_luaB__ipairs_L000172
 long @C_seig25_67cacb7b_254_L000255
 long @C_seig1d_67cacb7b_luaB__loadfile_L000182
 long @C_seig26_67cacb7b_256_L000257
 long @C_seig1h_67cacb7b_luaB__load_L000197
 long @C_seig27_67cacb7b_258_L000259
 long @C_seig16_67cacb7b_luaB__next_L000155
 long @C_seig28_67cacb7b_260_L000261
 long @C_seig18_67cacb7b_luaB__pairs_L000161
 long @C_seig29_67cacb7b_262_L000263
 long @C_seig1r_67cacb7b_luaB__pcall_L000235
 long @C_seig2a_67cacb7b_264_L000265
 long @C_seig_67cacb7b_luaB__print_L000004
 long @C_seig2b_67cacb7b_266_L000267
 long @C_seig3_67cacb7b_luaB__warn_L000016
 long @C_seig2c_67cacb7b_268_L000269
 long @C_seige_67cacb7b_luaB__rawequal_L000082
 long @C_seig2d_67cacb7b_270_L000271
 long @C_seigf_67cacb7b_luaB__rawlen_L000084
 long @C_seig2e_67cacb7b_272_L000273
 long @C_seigh_67cacb7b_luaB__rawget_L000089
 long @C_seig2f_67cacb7b_274_L000275
 long @C_seigi_67cacb7b_luaB__rawset_L000091
 long @C_seig2g_67cacb7b_276_L000277
 long @C_seig1o_67cacb7b_luaB__select_L000220
 long @C_seig2h_67cacb7b_278_L000279
 long @C_seigb_67cacb7b_luaB__setmetatable_L000073
 long @C_seig2i_67cacb7b_280_L000281
 long @C_seig6_67cacb7b_luaB__tonumber_L000049
 long @C_seig2j_67cacb7b_282_L000283
 long @C_seig1t_67cacb7b_luaB__tostring_L000239
 long @C_seig2k_67cacb7b_284_L000285
 long @C_seig14_67cacb7b_luaB__type_L000150
 long @C_seig2l_67cacb7b_286_L000287
 long @C_seig1s_67cacb7b_luaB__xpcall_L000237
 long @C_seig2m_67cacb7b_288_L000289
 long $0
 long @C_seig2n_67cacb7b_290_L000291
 long $0
 long $0
 long $0

' Catalina Export luaopen_base

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaopen_base ' <symbol:luaopen_base>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #2 ' reg ARG coni
 jmp #LODL
 long -1001000
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_rawgeti
 add SP, #8 ' CALL addrg
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long @C_seig1u_67cacb7b_base_funcs_L000241
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaL__setfuncs
 add SP, #8 ' CALL addrg
 jmp #LODL
 long -1
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushvalue
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_seig2m_67cacb7b_288_L000289
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
 jmp #LODL
 long @C_luaopen_base_293_L000294
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_lua_pushstring
 add SP, #4 ' CALL addrg
 jmp #LODL
 long @C_seig2n_67cacb7b_290_L000291
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
 mov r0, #1 ' reg <- coni
' C_luaopen_base_292 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import luaL_setfuncs

' Catalina Import luaL_loadbufferx

' Catalina Import luaL_loadfilex

' Catalina Import luaL_checkoption

' Catalina Import luaL_error

' Catalina Import luaL_where

' Catalina Import luaL_checkany

' Catalina Import luaL_checktype

' Catalina Import luaL_checkstack

' Catalina Import luaL_optinteger

' Catalina Import luaL_checkinteger

' Catalina Import luaL_optlstring

' Catalina Import luaL_checklstring

' Catalina Import luaL_typeerror

' Catalina Import luaL_argerror

' Catalina Import luaL_tolstring

' Catalina Import luaL_getmetafield

' Catalina Import lua_setupvalue

' Catalina Import lua_stringtonumber

' Catalina Import lua_concat

' Catalina Import lua_next

' Catalina Import lua_error

' Catalina Import lua_gc

' Catalina Import lua_warning

' Catalina Import lua_load

' Catalina Import lua_pcallk

' Catalina Import lua_callk

' Catalina Import lua_setmetatable

' Catalina Import lua_rawset

' Catalina Import lua_setfield

' Catalina Import lua_getmetatable

' Catalina Import lua_rawgeti

' Catalina Import lua_rawget

' Catalina Import lua_geti

' Catalina Import lua_pushboolean

' Catalina Import lua_pushcclosure

' Catalina Import lua_pushstring

' Catalina Import lua_pushinteger

' Catalina Import lua_pushnumber

' Catalina Import lua_pushnil

' Catalina Import lua_rawequal

' Catalina Import lua_rawlen

' Catalina Import lua_tolstring

' Catalina Import lua_toboolean

' Catalina Import lua_typename

' Catalina Import lua_type

' Catalina Import lua_isstring

' Catalina Import lua_copy

' Catalina Import lua_rotate

' Catalina Import lua_pushvalue

' Catalina Import lua_settop

' Catalina Import lua_gettop

' Catalina Import strspn

' Catalina Import fwrite

' Catalina Import fflush

' Catalina Import __stdout

' Catalina Import toupper

' Catalina Import __ctype

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaopen_base_293_L000294 ' <symbol:293>
 byte 76
 byte 117
 byte 97
 byte 32
 byte 53
 byte 46
 byte 52
 byte 0

 alignl ' align long
C_seig2n_67cacb7b_290_L000291 ' <symbol:290>
 byte 95
 byte 86
 byte 69
 byte 82
 byte 83
 byte 73
 byte 79
 byte 78
 byte 0

 alignl ' align long
C_seig2m_67cacb7b_288_L000289 ' <symbol:288>
 byte 95
 byte 71
 byte 0

 alignl ' align long
C_seig2l_67cacb7b_286_L000287 ' <symbol:286>
 byte 120
 byte 112
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_seig2k_67cacb7b_284_L000285 ' <symbol:284>
 byte 116
 byte 121
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_seig2j_67cacb7b_282_L000283 ' <symbol:282>
 byte 116
 byte 111
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_seig2i_67cacb7b_280_L000281 ' <symbol:280>
 byte 116
 byte 111
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_seig2h_67cacb7b_278_L000279 ' <symbol:278>
 byte 115
 byte 101
 byte 116
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_seig2g_67cacb7b_276_L000277 ' <symbol:276>
 byte 115
 byte 101
 byte 108
 byte 101
 byte 99
 byte 116
 byte 0

 alignl ' align long
C_seig2f_67cacb7b_274_L000275 ' <symbol:274>
 byte 114
 byte 97
 byte 119
 byte 115
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_seig2e_67cacb7b_272_L000273 ' <symbol:272>
 byte 114
 byte 97
 byte 119
 byte 103
 byte 101
 byte 116
 byte 0

 alignl ' align long
C_seig2d_67cacb7b_270_L000271 ' <symbol:270>
 byte 114
 byte 97
 byte 119
 byte 108
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_seig2c_67cacb7b_268_L000269 ' <symbol:268>
 byte 114
 byte 97
 byte 119
 byte 101
 byte 113
 byte 117
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_seig2b_67cacb7b_266_L000267 ' <symbol:266>
 byte 119
 byte 97
 byte 114
 byte 110
 byte 0

 alignl ' align long
C_seig2a_67cacb7b_264_L000265 ' <symbol:264>
 byte 112
 byte 114
 byte 105
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_seig29_67cacb7b_262_L000263 ' <symbol:262>
 byte 112
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_seig28_67cacb7b_260_L000261 ' <symbol:260>
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_seig27_67cacb7b_258_L000259 ' <symbol:258>
 byte 110
 byte 101
 byte 120
 byte 116
 byte 0

 alignl ' align long
C_seig26_67cacb7b_256_L000257 ' <symbol:256>
 byte 108
 byte 111
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_seig25_67cacb7b_254_L000255 ' <symbol:254>
 byte 108
 byte 111
 byte 97
 byte 100
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_seig24_67cacb7b_252_L000253 ' <symbol:252>
 byte 105
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_seig23_67cacb7b_250_L000251 ' <symbol:250>
 byte 103
 byte 101
 byte 116
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_seig22_67cacb7b_248_L000249 ' <symbol:248>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_seig21_67cacb7b_246_L000247 ' <symbol:246>
 byte 100
 byte 111
 byte 102
 byte 105
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_seig20_67cacb7b_244_L000245 ' <symbol:244>
 byte 99
 byte 111
 byte 108
 byte 108
 byte 101
 byte 99
 byte 116
 byte 103
 byte 97
 byte 114
 byte 98
 byte 97
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_seig1v_67cacb7b_242_L000243 ' <symbol:242>
 byte 97
 byte 115
 byte 115
 byte 101
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_seig1o_67cacb7b_luaB__select_L000220_228_L000229 ' <symbol:228>
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
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
C_seig1m_67cacb7b_luaB__assert_L000214_218_L000219 ' <symbol:218>
 byte 97
 byte 115
 byte 115
 byte 101
 byte 114
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 102
 byte 97
 byte 105
 byte 108
 byte 101
 byte 100
 byte 33
 byte 0

 alignl ' align long
C_seig1h_67cacb7b_luaB__load_L000197_206_L000207 ' <symbol:206>
 byte 61
 byte 40
 byte 108
 byte 111
 byte 97
 byte 100
 byte 41
 byte 0

 alignl ' align long
C_seig1h_67cacb7b_luaB__load_L000197_199_L000200 ' <symbol:199>
 byte 98
 byte 116
 byte 0

 alignl ' align long
C_seig1e_67cacb7b_generic_reader_L000187_195_L000196 ' <symbol:195>
 byte 114
 byte 101
 byte 97
 byte 100
 byte 101
 byte 114
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 109
 byte 117
 byte 115
 byte 116
 byte 32
 byte 114
 byte 101
 byte 116
 byte 117
 byte 114
 byte 110
 byte 32
 byte 97
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_seig1e_67cacb7b_generic_reader_L000187_189_L000190 ' <symbol:189>
 byte 116
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 110
 byte 101
 byte 115
 byte 116
 byte 101
 byte 100
 byte 32
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 115
 byte 0

 alignl ' align long
C_seig18_67cacb7b_luaB__pairs_L000161_165_L000166 ' <symbol:165>
 byte 95
 byte 95
 byte 112
 byte 97
 byte 105
 byte 114
 byte 115
 byte 0

 alignl ' align long
C_seig14_67cacb7b_luaB__type_L000150_152_L000153 ' <symbol:152>
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 32
 byte 101
 byte 120
 byte 112
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_131_L000132 ' <symbol:131>
 long $44800000 ' float

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_122_L000123 ' <symbol:122>
 byte 105
 byte 115
 byte 114
 byte 117
 byte 110
 byte 110
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_120_L000121 ' <symbol:120>
 byte 115
 byte 101
 byte 116
 byte 115
 byte 116
 byte 101
 byte 112
 byte 109
 byte 117
 byte 108
 byte 0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_118_L000119 ' <symbol:118>
 byte 115
 byte 101
 byte 116
 byte 112
 byte 97
 byte 117
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_116_L000117 ' <symbol:116>
 byte 115
 byte 116
 byte 101
 byte 112
 byte 0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_114_L000115 ' <symbol:114>
 byte 99
 byte 111
 byte 117
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_112_L000113 ' <symbol:112>
 byte 99
 byte 111
 byte 108
 byte 108
 byte 101
 byte 99
 byte 116
 byte 0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_110_L000111 ' <symbol:110>
 byte 114
 byte 101
 byte 115
 byte 116
 byte 97
 byte 114
 byte 116
 byte 0

 alignl ' align long
C_seigm_67cacb7b_luaB__collectgarbage_L000104_108_L000109 ' <symbol:108>
 byte 115
 byte 116
 byte 111
 byte 112
 byte 0

 alignl ' align long
C_seigj_67cacb7b_pushmode_L000093_99_L000100 ' <symbol:99>
 byte 103
 byte 101
 byte 110
 byte 101
 byte 114
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_seigj_67cacb7b_pushmode_L000093_97_L000098 ' <symbol:97>
 byte 105
 byte 110
 byte 99
 byte 114
 byte 101
 byte 109
 byte 101
 byte 110
 byte 116
 byte 97
 byte 108
 byte 0

 alignl ' align long
C_seigf_67cacb7b_luaB__rawlen_L000084_86_L000087 ' <symbol:86>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 111
 byte 114
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_seigb_67cacb7b_luaB__setmetatable_L000073_80_L000081 ' <symbol:80>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 99
 byte 104
 byte 97
 byte 110
 byte 103
 byte 101
 byte 32
 byte 97
 byte 32
 byte 112
 byte 114
 byte 111
 byte 116
 byte 101
 byte 99
 byte 116
 byte 101
 byte 100
 byte 32
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_seigb_67cacb7b_luaB__setmetatable_L000073_75_L000076 ' <symbol:75>
 byte 110
 byte 105
 byte 108
 byte 32
 byte 111
 byte 114
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_seig9_67cacb7b_luaB__getmetatable_L000067_71_L000072 ' <symbol:71>
 byte 95
 byte 95
 byte 109
 byte 101
 byte 116
 byte 97
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_seig6_67cacb7b_luaB__tonumber_L000049_57_L000058 ' <symbol:57>
 byte 98
 byte 97
 byte 115
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
C_seig4_67cacb7b_b_str2int_L000026_28_L000029 ' <symbol:28>
 byte 32
 byte 12
 byte 10
 byte 13
 byte 9
 byte 11
 byte 0

 alignl ' align long
C_seig_67cacb7b_luaB__print_L000004_14_L000015 ' <symbol:14>
 byte 10
 byte 0

 alignl ' align long
C_seig_67cacb7b_luaB__print_L000004_12_L000013 ' <symbol:12>
 byte 9
 byte 0

' Catalina Code

DAT ' code segment
' end
