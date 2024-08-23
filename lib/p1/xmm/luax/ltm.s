' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sago_66c68b64_udatatypename_L000013 ' <symbol:udatatypename>
 byte 117
 byte 115
 byte 101
 byte 114
 byte 100
 byte 97
 byte 116
 byte 97
 byte 0

' Catalina Init

DAT ' initialized data segment

' Catalina Export luaT_typenames_

 alignl ' align long
C_luaT__typenames_ ' <symbol:luaT_typenames_>
 long @C_sago1_66c68b64_14_L000015
 long @C_sago2_66c68b64_16_L000017
 long @C_sago3_66c68b64_18_L000019
 long @C_sago_66c68b64_udatatypename_L000013
 long @C_sago4_66c68b64_20_L000021
 long @C_sago5_66c68b64_22_L000023
 long @C_sago6_66c68b64_24_L000025
 long @C_sago7_66c68b64_26_L000027
 long @C_sago_66c68b64_udatatypename_L000013
 long @C_sago8_66c68b64_28_L000029
 long @C_sago9_66c68b64_30_L000031
 long @C_sagoa_66c68b64_32_L000033

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaT__init_luaT__eventname_L000036 ' <symbol:luaT_eventname>
 long @C_luaT__init_37_L000038
 long @C_luaT__init_39_L000040
 long @C_luaT__init_41_L000042
 long @C_luaT__init_43_L000044
 long @C_luaT__init_45_L000046
 long @C_luaT__init_47_L000048
 long @C_luaT__init_49_L000050
 long @C_luaT__init_51_L000052
 long @C_luaT__init_53_L000054
 long @C_luaT__init_55_L000056
 long @C_luaT__init_57_L000058
 long @C_luaT__init_59_L000060
 long @C_luaT__init_61_L000062
 long @C_luaT__init_63_L000064
 long @C_luaT__init_65_L000066
 long @C_luaT__init_67_L000068
 long @C_luaT__init_69_L000070
 long @C_luaT__init_71_L000072
 long @C_luaT__init_73_L000074
 long @C_luaT__init_75_L000076
 long @C_luaT__init_77_L000078
 long @C_luaT__init_79_L000080
 long @C_luaT__init_81_L000082
 long @C_luaT__init_83_L000084
 long @C_luaT__init_85_L000086

' Catalina Export luaT_init

' Catalina Code

DAT ' code segment

 alignl ' align long
C_luaT__init ' <symbol:luaT_init>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
C_luaT__init_87
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaT__init_luaT__eventname_L000036
 mov r20, RI ' reg <- addrg
 adds r20, r22 ' ADDI/P (2)
 mov RI, r20
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov r18, r23
 adds r18, #16 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r18, #152 ' ADDP4 coni
 adds r22, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #152 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__fix
 add SP, #4 ' CALL addrg
' C_luaT__init_88 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #25 wz,wc
 jmp #BR_B
 long @C_luaT__init_87 ' LTI4
' C_luaT__init_34 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaT_gettm

 alignl ' align long
C_luaT__gettm ' <symbol:luaT_gettm>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaT__gettm_92 ' NEI4
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, #1 ' reg <- coni
 shl r18, r21 ' LSHI/U (1)
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaT__gettm_91 ' JUMPV addrg
C_luaT__gettm_92
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
C_luaT__gettm_91
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaT_gettmbyobj

 alignl ' align long
C_luaT__gettmbyobj ' <symbol:luaT_gettmbyobj>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22
 and r17, #15 ' BANDI4 coni
 cmps r17,  #5 wz
 jmp #BR_Z
 long @C_luaT__gettmbyobj_98 ' EQI4
 cmps r17,  #7 wz
 jmp #BR_Z
 long @C_luaT__gettmbyobj_99 ' EQI4
 jmp #JMPA
 long @C_luaT__gettmbyobj_95 ' JUMPV addrg
C_luaT__gettmbyobj_98
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_luaT__gettmbyobj_96 ' JUMPV addrg
C_luaT__gettmbyobj_99
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_luaT__gettmbyobj_96 ' JUMPV addrg
C_luaT__gettmbyobj_95
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_luaT__gettmbyobj_96
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaT__gettmbyobj_101 ' EQU4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #152 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaT__gettmbyobj_102 ' JUMPV addrg
C_luaT__gettmbyobj_101
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r15, r22
 adds r15, #44 ' ADDP4 coni
C_luaT__gettmbyobj_102
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaT__gettmbyobj_94 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaT_objtypename

 alignl ' align long
C_luaT__objtypename ' <symbol:luaT_objtypename>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #69 wz
 jmp #BRNZ
 long @C_luaT__objtypename_107 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaT__objtypename_106 ' NEU4
C_luaT__objtypename_107
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #71 wz
 jmp #BRNZ
 long @C_luaT__objtypename_104 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaT__objtypename_104 ' EQU4
C_luaT__objtypename_106
 jmp #LODL
 long @C_luaT__objtypename_108_L000109
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__getshortstr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #4 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaT__objtypename_110 ' NEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
 jmp #JMPA
 long @C_luaT__objtypename_103 ' JUMPV addrg
C_luaT__objtypename_110
C_luaT__objtypename_104
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaT__typenames_+4
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRP4 reg
C_luaT__objtypename_103
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaT_callTM

 alignl ' align long
C_luaT__callT_M_ ' <symbol:luaT_callTM>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r13, r15 ' CVI, CVU or LOAD
 mov r11, r23 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r13, r15
 adds r13, #8 ' ADDP4 coni
 mov r11, r21 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r13, r15
 adds r13, #16 ' ADDP4 coni
 mov r11, r19 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r13, r15
 adds r13, #24 ' ADDP4 coni
 mov r11, r17 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov r20, r15
 adds r20, #32 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #10 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaT__callT_M__114 ' NEI4
 mov r2, #0 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaT__callT_M__115 ' JUMPV addrg
C_luaT__callT_M__114
 mov r2, #0 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
C_luaT__callT_M__115
' C_luaT__callT_M__113 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaT_callTMres

 alignl ' align long
C_luaT__callT_M_res ' <symbol:luaT_callTMres>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r13, r15 ' CVI, CVU or LOAD
 mov r11, r23 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r13, r15
 adds r13, #8 ' ADDP4 coni
 mov r11, r21 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r13, r15
 adds r13, #16 ' ADDP4 coni
 mov r11, r19 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #24 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #10 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaT__callT_M_res_117 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaT__callT_M_res_118 ' JUMPV addrg
C_luaT__callT_M_res_117
 mov r2, #1 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
C_luaT__callT_M_res_118
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov r13, r17 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r11, r20 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaT__callT_M_res_116 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sago16_66c68b64_callbinT_M__L000119 ' <symbol:callbinTM>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sago16_66c68b64_callbinT_M__L000119_121 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_sago16_66c68b64_callbinT_M__L000119_121
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sago16_66c68b64_callbinT_M__L000119_123 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sago16_66c68b64_callbinT_M__L000119_120 ' JUMPV addrg
C_sago16_66c68b64_callbinT_M__L000119_123
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, r15 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__callT_M_res
 add SP, #16 ' CALL addrg
 mov r0, #1 ' reg <- coni
C_sago16_66c68b64_callbinT_M__L000119_120
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaT_trybinTM

 alignl ' align long
C_luaT__trybinT_M_ ' <symbol:luaT_trybinTM>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sago16_66c68b64_callbinT_M__L000119
 add SP, #16 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaT__trybinT_M__126 ' NEI4
 mov r15, r17 ' CVI, CVU or LOAD
 cmps r15,  #13 wz,wc
 jmp #BR_B
 long @C_luaT__trybinT_M__128 ' LTI4
 cmps r15,  #19 wz,wc
 jmp #BR_A
 long @C_luaT__trybinT_M__128 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_luaT__trybinT_M__138_L000140-52
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaT__trybinT_M__138_L000140 ' <symbol:138>
 long @C_luaT__trybinT_M__131
 long @C_luaT__trybinT_M__131
 long @C_luaT__trybinT_M__131
 long @C_luaT__trybinT_M__131
 long @C_luaT__trybinT_M__131
 long @C_luaT__trybinT_M__128
 long @C_luaT__trybinT_M__131

' Catalina Code

DAT ' code segment
C_luaT__trybinT_M__131
 mov r22, #3 ' reg <- coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaT__trybinT_M__132 ' NEI4
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_luaT__trybinT_M__132 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__tointerror
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaT__trybinT_M__133 ' JUMPV addrg
C_luaT__trybinT_M__132
 jmp #LODL
 long @C_luaT__trybinT_M__134_L000135
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__opinterror
 add SP, #12 ' CALL addrg
C_luaT__trybinT_M__133
C_luaT__trybinT_M__128
 jmp #LODL
 long @C_luaT__trybinT_M__136_L000137
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__opinterror
 add SP, #12 ' CALL addrg
C_luaT__trybinT_M__126
' C_luaT__trybinT_M__125 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaT_tryconcatTM

 alignl ' align long
C_luaT__tryconcatT_M_ ' <symbol:luaT_tryconcatTM>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r2, #22 ' reg ARG coni
 jmp #LODL
 long -16
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r4, r21 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov r5, r22 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sago16_66c68b64_callbinT_M__L000119
 add SP, #16 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaT__tryconcatT_M__143 ' NEI4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 mov r2, r21 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 jmp #LODL
 long -16
 mov r22, RI ' reg <- con
 mov r3, r21 ' ADDI/P
 adds r3, r22 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__concaterror
 add SP, #8 ' CALL addrg
C_luaT__tryconcatT_M__143
' C_luaT__tryconcatT_M__142 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaT_trybinassocTM

 alignl ' align long
C_luaT__trybinassocT_M_ ' <symbol:luaT_trybinassocTM>
 jmp #NEWF
 jmp #PSHM
 long $aa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_luaT__trybinassocT_M__146 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
 jmp #JMPA
 long @C_luaT__trybinassocT_M__147 ' JUMPV addrg
C_luaT__trybinassocT_M__146
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #12
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybinT_M_
 add SP, #16 ' CALL addrg
C_luaT__trybinassocT_M__147
' C_luaT__trybinassocT_M__145 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaT_trybiniTM

 alignl ' align long
C_luaT__trybiniT_M_ ' <symbol:luaT_trybiniTM>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, FP
 sub r15, #-(-12) ' reg <- addrli
 mov RI, r15
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-12) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long 12 ' stack ARG INDIR ADDRFi
 jmp #PSHF
 long 8 ' stack ARG INDIR ADDRFi
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaT__trybinassocT_M_
 add SP, #20 ' CALL addrg
' C_luaT__trybiniT_M__148 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaT_callorderTM

 alignl ' align long
C_luaT__callorderT_M_ ' <symbol:luaT_callorderTM>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sago16_66c68b64_callbinT_M__L000119
 add SP, #16 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_luaT__callorderT_M__150 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_luaT__callorderT_M__153 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaT__callorderT_M__153 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaT__callorderT_M__154 ' JUMPV addrg
C_luaT__callorderT_M__153
 mov r15, #0 ' reg <- coni
C_luaT__callorderT_M__154
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaT__callorderT_M__149 ' JUMPV addrg
C_luaT__callorderT_M__150
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__ordererror
 add SP, #8 ' CALL addrg
 mov r0, #0 ' reg <- coni
C_luaT__callorderT_M__149
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaT_callorderiTM

 alignl ' align long
C_luaT__callorderiT_M_ ' <symbol:luaT_callorderiTM>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_luaT__callorderiT_M__156 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #FLIN ' CVIF4
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaT__callorderiT_M__157 ' JUMPV addrg
C_luaT__callorderiT_M__156
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaT__callorderiT_M__157
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_luaT__callorderiT_M__158 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 add RI, #12
 wrlong r22 , RI ' ASGNP4 addrfi reg
 jmp #JMPA
 long @C_luaT__callorderiT_M__159 ' JUMPV addrg
C_luaT__callorderiT_M__158
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22 , RI ' ASGNP4 addrli reg
C_luaT__callorderiT_M__159
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__callorderT_M_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaT__callorderiT_M__155 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export luaT_adjustvarargs

 alignl ' align long
C_luaT__adjustvarargs ' <symbol:luaT_adjustvarargs>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r13, r0
 subs r13, #1 ' SUBI4 coni
 mov r22, r13 ' SUBI/P
 subs r22, r21 ' SUBI/P (3)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r19
 adds r22, #24 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 adds r22, #1 ' ADDI4 coni
 cmps r0, r22 wz,wc
 jmp #BR_A
 long @C_luaT__adjustvarargs_161 ' GTI4
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r3, r22
 adds r3, #1 ' ADDI4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
C_luaT__adjustvarargs_161
' C_luaT__adjustvarargs_162 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov r11, r20 ' CVI, CVU or LOAD
 mov RI, r19
 jmp #RLNG
 mov r9, BC ' reg <- INDIRP4 reg
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r9 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaT__adjustvarargs_166 ' JUMPV addrg
C_luaT__adjustvarargs_163
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov r11, r20 ' CVI, CVU or LOAD
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r9, r22 ' ADDI/P
 adds r9, r20 ' ADDI/P (3)
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r9 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaT__adjustvarargs_164 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_luaT__adjustvarargs_166
 cmps r15, r21 wz,wc
 jmp #BRBE
 long @C_luaT__adjustvarargs_163 ' LEI4
 mov r22, r13
 shl r22, #3 ' LSHI4 coni
 adds r22, #8 ' ADDI4 coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 shl r20, #3 ' LSHI4 coni
 adds r20, #8 ' ADDI4 coni
 mov RI, r22
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_luaT__adjustvarargs_160 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaT_getvarargs

 alignl ' align long
C_luaT__getvarargs ' <symbol:luaT_getvarargs>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRI4 reg
 cmps r17,  #0 wz,wc
 jmp #BRAE
 long @C_luaT__getvarargs_168 ' GEI4
 mov r17, r13 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r0, r13 wz,wc
 jmp #BR_A
 long @C_luaT__getvarargs_170 ' GTI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_luaT__getvarargs_172 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_luaT__getvarargs_172
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r19, r22 ' ADDI/P
 adds r19, r20 ' ADDI/P (3)
C_luaT__getvarargs_170
' C_luaT__getvarargs_171 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r13
 shl r20, #3 ' LSHI4 coni
 adds r20, r19 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_luaT__getvarargs_168
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaT__getvarargs_177 ' JUMPV addrg
C_luaT__getvarargs_174
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 mov r11, r22 ' ADDI/P
 adds r11, r19 ' ADDI/P (3)
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r13
 shl r18, #3 ' LSHI4 coni
 subs r20, r18 ' SUBI/P (1)
 mov r9, r22 ' ADDI/P
 adds r9, r20 ' ADDI/P (3)
 mov r0, r11 ' CVI, CVU or LOAD
 mov r1, r9 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaT__getvarargs_175 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_luaT__getvarargs_177
 cmps r15, r17 wz,wc
 jmp #BRAE
 long @C_luaT__getvarargs_178 ' GEI4
 cmps r15, r13 wz,wc
 jmp #BR_B
 long @C_luaT__getvarargs_174 ' LTI4
C_luaT__getvarargs_178
 jmp #JMPA
 long @C_luaT__getvarargs_182 ' JUMPV addrg
C_luaT__getvarargs_179
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaT__getvarargs_180 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_luaT__getvarargs_182
 cmps r15, r17 wz,wc
 jmp #BR_B
 long @C_luaT__getvarargs_179 ' LTI4
' C_luaT__getvarargs_167 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import luaH_getshortstr

' Catalina Import luaS_new

' Catalina Import luaC_step

' Catalina Import luaC_fix

' Catalina Import luaD_growstack

' Catalina Import luaD_callnoyield

' Catalina Import luaD_call

' Catalina Import luaG_ordererror

' Catalina Import luaG_tointerror

' Catalina Import luaG_opinterror

' Catalina Import luaG_concaterror

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaT__trybinT_M__136_L000137 ' <symbol:136>
 byte 112
 byte 101
 byte 114
 byte 102
 byte 111
 byte 114
 byte 109
 byte 32
 byte 97
 byte 114
 byte 105
 byte 116
 byte 104
 byte 109
 byte 101
 byte 116
 byte 105
 byte 99
 byte 32
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_luaT__trybinT_M__134_L000135 ' <symbol:134>
 byte 112
 byte 101
 byte 114
 byte 102
 byte 111
 byte 114
 byte 109
 byte 32
 byte 98
 byte 105
 byte 116
 byte 119
 byte 105
 byte 115
 byte 101
 byte 32
 byte 111
 byte 112
 byte 101
 byte 114
 byte 97
 byte 116
 byte 105
 byte 111
 byte 110
 byte 32
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_luaT__objtypename_108_L000109 ' <symbol:108>
 byte 95
 byte 95
 byte 110
 byte 97
 byte 109
 byte 101
 byte 0

 alignl ' align long
C_luaT__init_85_L000086 ' <symbol:85>
 byte 95
 byte 95
 byte 99
 byte 108
 byte 111
 byte 115
 byte 101
 byte 0

 alignl ' align long
C_luaT__init_83_L000084 ' <symbol:83>
 byte 95
 byte 95
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_luaT__init_81_L000082 ' <symbol:81>
 byte 95
 byte 95
 byte 99
 byte 111
 byte 110
 byte 99
 byte 97
 byte 116
 byte 0

 alignl ' align long
C_luaT__init_79_L000080 ' <symbol:79>
 byte 95
 byte 95
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_luaT__init_77_L000078 ' <symbol:77>
 byte 95
 byte 95
 byte 108
 byte 116
 byte 0

 alignl ' align long
C_luaT__init_75_L000076 ' <symbol:75>
 byte 95
 byte 95
 byte 98
 byte 110
 byte 111
 byte 116
 byte 0

 alignl ' align long
C_luaT__init_73_L000074 ' <symbol:73>
 byte 95
 byte 95
 byte 117
 byte 110
 byte 109
 byte 0

 alignl ' align long
C_luaT__init_71_L000072 ' <symbol:71>
 byte 95
 byte 95
 byte 115
 byte 104
 byte 114
 byte 0

 alignl ' align long
C_luaT__init_69_L000070 ' <symbol:69>
 byte 95
 byte 95
 byte 115
 byte 104
 byte 108
 byte 0

 alignl ' align long
C_luaT__init_67_L000068 ' <symbol:67>
 byte 95
 byte 95
 byte 98
 byte 120
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_luaT__init_65_L000066 ' <symbol:65>
 byte 95
 byte 95
 byte 98
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_luaT__init_63_L000064 ' <symbol:63>
 byte 95
 byte 95
 byte 98
 byte 97
 byte 110
 byte 100
 byte 0

 alignl ' align long
C_luaT__init_61_L000062 ' <symbol:61>
 byte 95
 byte 95
 byte 105
 byte 100
 byte 105
 byte 118
 byte 0

 alignl ' align long
C_luaT__init_59_L000060 ' <symbol:59>
 byte 95
 byte 95
 byte 100
 byte 105
 byte 118
 byte 0

 alignl ' align long
C_luaT__init_57_L000058 ' <symbol:57>
 byte 95
 byte 95
 byte 112
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_luaT__init_55_L000056 ' <symbol:55>
 byte 95
 byte 95
 byte 109
 byte 111
 byte 100
 byte 0

 alignl ' align long
C_luaT__init_53_L000054 ' <symbol:53>
 byte 95
 byte 95
 byte 109
 byte 117
 byte 108
 byte 0

 alignl ' align long
C_luaT__init_51_L000052 ' <symbol:51>
 byte 95
 byte 95
 byte 115
 byte 117
 byte 98
 byte 0

 alignl ' align long
C_luaT__init_49_L000050 ' <symbol:49>
 byte 95
 byte 95
 byte 97
 byte 100
 byte 100
 byte 0

 alignl ' align long
C_luaT__init_47_L000048 ' <symbol:47>
 byte 95
 byte 95
 byte 101
 byte 113
 byte 0

 alignl ' align long
C_luaT__init_45_L000046 ' <symbol:45>
 byte 95
 byte 95
 byte 108
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_luaT__init_43_L000044 ' <symbol:43>
 byte 95
 byte 95
 byte 109
 byte 111
 byte 100
 byte 101
 byte 0

 alignl ' align long
C_luaT__init_41_L000042 ' <symbol:41>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

 alignl ' align long
C_luaT__init_39_L000040 ' <symbol:39>
 byte 95
 byte 95
 byte 110
 byte 101
 byte 119
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_luaT__init_37_L000038 ' <symbol:37>
 byte 95
 byte 95
 byte 105
 byte 110
 byte 100
 byte 101
 byte 120
 byte 0

 alignl ' align long
C_sagoa_66c68b64_32_L000033 ' <symbol:32>
 byte 112
 byte 114
 byte 111
 byte 116
 byte 111
 byte 0

 alignl ' align long
C_sago9_66c68b64_30_L000031 ' <symbol:30>
 byte 117
 byte 112
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_sago8_66c68b64_28_L000029 ' <symbol:28>
 byte 116
 byte 104
 byte 114
 byte 101
 byte 97
 byte 100
 byte 0

 alignl ' align long
C_sago7_66c68b64_26_L000027 ' <symbol:26>
 byte 102
 byte 117
 byte 110
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_sago6_66c68b64_24_L000025 ' <symbol:24>
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 0

 alignl ' align long
C_sago5_66c68b64_22_L000023 ' <symbol:22>
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_sago4_66c68b64_20_L000021 ' <symbol:20>
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sago3_66c68b64_18_L000019 ' <symbol:18>
 byte 98
 byte 111
 byte 111
 byte 108
 byte 101
 byte 97
 byte 110
 byte 0

 alignl ' align long
C_sago2_66c68b64_16_L000017 ' <symbol:16>
 byte 110
 byte 105
 byte 108
 byte 0

 alignl ' align long
C_sago1_66c68b64_14_L000015 ' <symbol:14>
 byte 110
 byte 111
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

' Catalina Code

DAT ' code segment
' end
