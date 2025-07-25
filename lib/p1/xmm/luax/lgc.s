' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sepk3_68804e2c_getgclist_L000015 ' <symbol:getgclist>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r23, r22 ' CVUI
 and r23, cviu_m1 ' zero extend
 cmps r23,  #5 wz,wc
 jmp #BR_B
 long @C_sepk3_68804e2c_getgclist_L000015_17 ' LTI4
 cmps r23,  #10 wz,wc
 jmp #BR_A
 long @C_sepk3_68804e2c_getgclist_L000015_26 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sepk3_68804e2c_getgclist_L000015_27_L000029-20
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sepk3_68804e2c_getgclist_L000015_27_L000029 ' <symbol:27>
 long @C_sepk3_68804e2c_getgclist_L000015_20
 long @C_sepk3_68804e2c_getgclist_L000015_21
 long @C_sepk3_68804e2c_getgclist_L000015_25
 long @C_sepk3_68804e2c_getgclist_L000015_23
 long @C_sepk3_68804e2c_getgclist_L000015_17
 long @C_sepk3_68804e2c_getgclist_L000015_24

' Catalina Code

DAT ' code segment
C_sepk3_68804e2c_getgclist_L000015_26
 cmps r23,  #38 wz
 jmp #BR_Z
 long @C_sepk3_68804e2c_getgclist_L000015_22 ' EQI4
 jmp #JMPA
 long @C_sepk3_68804e2c_getgclist_L000015_17 ' JUMPV addrg
C_sepk3_68804e2c_getgclist_L000015_20
 mov r0, r2
 adds r0, #28 ' ADDP4 coni
 jmp #JMPA
 long @C_sepk3_68804e2c_getgclist_L000015_16 ' JUMPV addrg
C_sepk3_68804e2c_getgclist_L000015_21
 mov r0, r2
 adds r0, #8 ' ADDP4 coni
 jmp #JMPA
 long @C_sepk3_68804e2c_getgclist_L000015_16 ' JUMPV addrg
C_sepk3_68804e2c_getgclist_L000015_22
 mov r0, r2
 adds r0, #8 ' ADDP4 coni
 jmp #JMPA
 long @C_sepk3_68804e2c_getgclist_L000015_16 ' JUMPV addrg
C_sepk3_68804e2c_getgclist_L000015_23
 mov r0, r2
 adds r0, #40 ' ADDP4 coni
 jmp #JMPA
 long @C_sepk3_68804e2c_getgclist_L000015_16 ' JUMPV addrg
C_sepk3_68804e2c_getgclist_L000015_24
 mov r0, r2
 adds r0, #80 ' ADDP4 coni
 jmp #JMPA
 long @C_sepk3_68804e2c_getgclist_L000015_16 ' JUMPV addrg
C_sepk3_68804e2c_getgclist_L000015_25
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
 jmp #JMPA
 long @C_sepk3_68804e2c_getgclist_L000015_16 ' JUMPV addrg
C_sepk3_68804e2c_getgclist_L000015_17
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_sepk3_68804e2c_getgclist_L000015_16
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk6_68804e2c_linkgclist__L000031 ' <symbol:linkgclist_>
 jmp #PSHM
 long $540000 ' save registers
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r2
 mov BC, r4
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffc7
 mov r18, RI ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_sepk6_68804e2c_linkgclist__L000031_32 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sepk7_68804e2c_clearkey_L000033 ' <symbol:clearkey>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk7_68804e2c_clearkey_L000033_35 ' EQI4
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 mov r20, #11 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepk7_68804e2c_clearkey_L000033_35
' C_sepk7_68804e2c_clearkey_L000033_34 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sepk8_68804e2c_iscleared_L000037 ' <symbol:iscleared>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk8_68804e2c_iscleared_L000037_39 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepk8_68804e2c_iscleared_L000037_38 ' JUMPV addrg
C_sepk8_68804e2c_iscleared_L000037_39
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sepk8_68804e2c_iscleared_L000037_41 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk8_68804e2c_iscleared_L000037_43 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepk8_68804e2c_iscleared_L000037_43
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepk8_68804e2c_iscleared_L000037_38 ' JUMPV addrg
C_sepk8_68804e2c_iscleared_L000037_41
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 and r0, #24 ' BANDI4 coni
C_sepk8_68804e2c_iscleared_L000037_38
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaC_barrier_

 alignl ' align long
C_luaC__barrier_ ' <symbol:luaC_barrier_>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz,wc
 jmp #BR_A
 long @C_luaC__barrier__46 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #1 wz,wc
 jmp #BRBE
 long @C_luaC__barrier__47 ' LEI4
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #2 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaC__barrier__47 ' JUMPV addrg
C_luaC__barrier__46
 mov r22, r17
 adds r22, #58 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaC__barrier__50 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -57
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r17
 adds r18, #56 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #24 ' BANDI4 coni
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaC__barrier__50
C_luaC__barrier__47
' C_luaC__barrier__45 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaC_barrierback_

 alignl ' align long
C_luaC__barrierback_ ' <symbol:luaC_barrierback_>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_luaC__barrierback__53 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffc7
 mov r18, RI ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaC__barrierback__54 ' JUMPV addrg
C_luaC__barrierback__53
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk3_68804e2c_getgclist_L000015 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov r2, r20
 adds r2, #84 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
C_luaC__barrierback__54
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #1 wz,wc
 jmp #BRBE
 long @C_luaC__barrierback__55 ' LEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #5 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaC__barrierback__55
' C_luaC__barrierback__52 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaC_fix

 alignl ' align long
C_luaC__fix ' <symbol:luaC_fix>
 jmp #PSHM
 long $d40000 ' save registers
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffc7
 mov r18, RI ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #4 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #68 ' ADDP4 coni
 mov RI, r2
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r2
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 mov BC, r2
 jmp #WLNG ' ASGNP4 reg reg
' C_luaC__fix_57 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaC_newobj

 alignl ' align long
C_luaC__newobj ' <symbol:luaC_newobj>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r2, r21
 and r2, #15 ' BANDI4 coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov r20, r15
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaC__newobj_58 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk_68804e2c_reallymarkobject_L000012 ' <symbol:reallymarkobject>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 mov r22, #20 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sepk_68804e2c_reallymarkobject_L000012_63 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_sepk_68804e2c_reallymarkobject_L000012_78 ' GTI4
' C_sepk_68804e2c_reallymarkobject_L000012_77 ' (symbol refcount = 0)
 cmps r19,  #4 wz,wc
 jmp #BR_B
 long @C_sepk_68804e2c_reallymarkobject_L000012_61 ' LTI4
 cmps r19,  #10 wz,wc
 jmp #BR_A
 long @C_sepk_68804e2c_reallymarkobject_L000012_61 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sepk_68804e2c_reallymarkobject_L000012_79_L000081-16
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sepk_68804e2c_reallymarkobject_L000012_79_L000081 ' <symbol:79>
 long @C_sepk_68804e2c_reallymarkobject_L000012_63
 long @C_sepk_68804e2c_reallymarkobject_L000012_76
 long @C_sepk_68804e2c_reallymarkobject_L000012_76
 long @C_sepk_68804e2c_reallymarkobject_L000012_69
 long @C_sepk_68804e2c_reallymarkobject_L000012_76
 long @C_sepk_68804e2c_reallymarkobject_L000012_64
 long @C_sepk_68804e2c_reallymarkobject_L000012_76

' Catalina Code

DAT ' code segment
C_sepk_68804e2c_reallymarkobject_L000012_78
 cmps r19,  #38 wz
 jmp #BR_Z
 long @C_sepk_68804e2c_reallymarkobject_L000012_76 ' EQI4
 jmp #JMPA
 long @C_sepk_68804e2c_reallymarkobject_L000012_61 ' JUMPV addrg
C_sepk_68804e2c_reallymarkobject_L000012_63
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -25
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sepk_68804e2c_reallymarkobject_L000012_61 ' JUMPV addrg
C_sepk_68804e2c_reallymarkobject_L000012_64
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_sepk_68804e2c_reallymarkobject_L000012_65 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffc7
 mov r18, RI ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sepk_68804e2c_reallymarkobject_L000012_66 ' JUMPV addrg
C_sepk_68804e2c_reallymarkobject_L000012_65
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -25
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepk_68804e2c_reallymarkobject_L000012_66
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_sepk_68804e2c_reallymarkobject_L000012_61 ' EQI4
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sepk_68804e2c_reallymarkobject_L000012_61 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk_68804e2c_reallymarkobject_L000012_61 ' JUMPV addrg
C_sepk_68804e2c_reallymarkobject_L000012_69
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepk_68804e2c_reallymarkobject_L000012_70 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepk_68804e2c_reallymarkobject_L000012_72 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk_68804e2c_reallymarkobject_L000012_74 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepk_68804e2c_reallymarkobject_L000012_74
C_sepk_68804e2c_reallymarkobject_L000012_72
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -25
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sepk_68804e2c_reallymarkobject_L000012_61 ' JUMPV addrg
C_sepk_68804e2c_reallymarkobject_L000012_70
C_sepk_68804e2c_reallymarkobject_L000012_76
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk3_68804e2c_getgclist_L000015 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23
 adds r2, #80 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
C_sepk_68804e2c_reallymarkobject_L000012_61
' C_sepk_68804e2c_reallymarkobject_L000012_59 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepkb_68804e2c_markmt_L000083 ' <symbol:markmt>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
C_sepkb_68804e2c_markmt_L000083_85
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkb_68804e2c_markmt_L000083_89 ' EQU4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkb_68804e2c_markmt_L000083_91 ' EQI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkb_68804e2c_markmt_L000083_91
C_sepkb_68804e2c_markmt_L000083_89
' C_sepkb_68804e2c_markmt_L000083_86 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #9 wz,wc
 jmp #BR_B
 long @C_sepkb_68804e2c_markmt_L000083_85 ' LTI4
' C_sepkb_68804e2c_markmt_L000083_84 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkc_68804e2c_markbeingfnz_L000093 ' <symbol:markbeingfnz>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepkc_68804e2c_markbeingfnz_L000093_98 ' JUMPV addrg
C_sepkc_68804e2c_markbeingfnz_L000093_95
 add r19, #1 ' ADDU4 coni
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkc_68804e2c_markbeingfnz_L000093_99 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkc_68804e2c_markbeingfnz_L000093_99
' C_sepkc_68804e2c_markbeingfnz_L000093_96 ' (symbol refcount = 0)
 mov RI, r21
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_sepkc_68804e2c_markbeingfnz_L000093_98
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkc_68804e2c_markbeingfnz_L000093_95 ' NEU4
 mov r0, r19 ' CVI, CVU or LOAD
' C_sepkc_68804e2c_markbeingfnz_L000093_94 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkd_68804e2c_remarkupvals_L000101 ' <symbol:remarkupvals>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r17, r23
 adds r17, #136 ' ADDP4 coni
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkd_68804e2c_remarkupvals_L000101_104 ' JUMPV addrg
C_sepkd_68804e2c_remarkupvals_L000101_103
 adds r21, #1 ' ADDI4 coni
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepkd_68804e2c_remarkupvals_L000101_106 ' NEI4
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkd_68804e2c_remarkupvals_L000101_106 ' EQU4
 mov r17, r19
 adds r17, #44 ' ADDP4 coni
 jmp #JMPA
 long @C_sepkd_68804e2c_remarkupvals_L000101_107 ' JUMPV addrg
C_sepkd_68804e2c_remarkupvals_L000101_106
 mov r22, r19
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepkd_68804e2c_remarkupvals_L000101_111 ' JUMPV addrg
C_sepkd_68804e2c_remarkupvals_L000101_108
 adds r21, #1 ' ADDI4 coni
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepkd_68804e2c_remarkupvals_L000101_112 ' NEI4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_sepkd_68804e2c_remarkupvals_L000101_114 ' EQI4
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sepkd_68804e2c_remarkupvals_L000101_114 ' EQI4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkd_68804e2c_remarkupvals_L000101_114
C_sepkd_68804e2c_remarkupvals_L000101_112
' C_sepkd_68804e2c_remarkupvals_L000101_109 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
C_sepkd_68804e2c_remarkupvals_L000101_111
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkd_68804e2c_remarkupvals_L000101_108 ' NEU4
C_sepkd_68804e2c_remarkupvals_L000101_107
C_sepkd_68804e2c_remarkupvals_L000101_104
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkd_68804e2c_remarkupvals_L000101_103 ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_sepkd_68804e2c_remarkupvals_L000101_102 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepke_68804e2c_cleargraylists_L000116 ' <symbol:cleargraylists>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov r20, r2
 adds r20, #84 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r2
 adds r20, #80 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov r20, r2
 adds r20, #92 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r2
 adds r20, #96 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r2
 adds r20, #88 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
' C_sepke_68804e2c_cleargraylists_L000116_117 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sepkf_68804e2c_restartcollection_L000118 ' <symbol:restartcollection>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepke_68804e2c_cleargraylists_L000116 ' CALL addrg
 mov r22, r23
 adds r22, #144 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkf_68804e2c_restartcollection_L000118_120 ' EQI4
 mov r22, r23
 adds r22, #144 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkf_68804e2c_restartcollection_L000118_120
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkf_68804e2c_restartcollection_L000118_122 ' EQI4
 mov r20, r23
 adds r20, #36 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkf_68804e2c_restartcollection_L000118_122 ' EQI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkf_68804e2c_restartcollection_L000118_122
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkb_68804e2c_markmt_L000083 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkc_68804e2c_markbeingfnz_L000093 ' CALL addrg
' C_sepkf_68804e2c_restartcollection_L000118_119 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkg_68804e2c_genlink_L000124 ' <symbol:genlink>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #5 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #7 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sepkg_68804e2c_genlink_L000124_126 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk3_68804e2c_getgclist_L000015 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepkg_68804e2c_genlink_L000124_127 ' JUMPV addrg
C_sepkg_68804e2c_genlink_L000124_126
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_sepkg_68804e2c_genlink_L000124_128 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 xor r20, #2 ' BXORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepkg_68804e2c_genlink_L000124_128
C_sepkg_68804e2c_genlink_L000124_127
' C_sepkg_68804e2c_genlink_L000124_125 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkh_68804e2c_traverseweakvalue_L000130 ' <symbol:traverseweakvalue>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_133 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_134 ' JUMPV addrg
C_sepkh_68804e2c_traverseweakvalue_L000130_133
 mov r13, #0 ' reg <- coni
C_sepkh_68804e2c_traverseweakvalue_L000130_134
 mov r15, r13 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_138 ' JUMPV addrg
C_sepkh_68804e2c_traverseweakvalue_L000130_135
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_139 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk7_68804e2c_clearkey_L000033 ' CALL addrg
 jmp #JMPA
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_140 ' JUMPV addrg
C_sepkh_68804e2c_traverseweakvalue_L000130_139
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_141 ' EQI4
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_141 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkh_68804e2c_traverseweakvalue_L000130_141
 mov r22, #0 ' reg <- coni
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_143 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_146 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r11, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_147 ' JUMPV addrg
C_sepkh_68804e2c_traverseweakvalue_L000130_146
 jmp #LODL
 long 0
 mov r11, RI ' reg <- con
C_sepkh_68804e2c_traverseweakvalue_L000130_147
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk8_68804e2c_iscleared_L000037
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_143 ' EQI4
 mov r15, #1 ' reg <- coni
C_sepkh_68804e2c_traverseweakvalue_L000130_143
C_sepkh_68804e2c_traverseweakvalue_L000130_140
' C_sepkh_68804e2c_traverseweakvalue_L000130_136 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_sepkh_68804e2c_traverseweakvalue_L000130_138
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_135' LTU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_148 ' NEI4
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_148 ' EQI4
 mov r2, r23
 adds r2, #88 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepkh_68804e2c_traverseweakvalue_L000130_149 ' JUMPV addrg
C_sepkh_68804e2c_traverseweakvalue_L000130_148
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
C_sepkh_68804e2c_traverseweakvalue_L000130_149
' C_sepkh_68804e2c_traverseweakvalue_L000130_131 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepki_68804e2c_traverseephemeron_L000150 ' <symbol:traverseephemeron>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r11, #0 ' reg <- coni
 mov r9, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 mov r15, r22 ' CVI, CVU or LOAD
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_155 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_152
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_156 ' EQI4
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_156 ' EQI4
 mov r11, #1 ' reg <- coni
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepki_68804e2c_traverseephemeron_L000150_156
' C_sepki_68804e2c_traverseephemeron_L000150_153 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_sepki_68804e2c_traverseephemeron_L000150_155
 cmp r17, r13 wz,wc 
 jmp #BR_B
 long @C_sepki_68804e2c_traverseephemeron_L000150_152' LTU4
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_161 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_158
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_163 ' EQI4
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 sub r22, r17 ' SUBU (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_164 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_163
 mov r22, r17
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
C_sepki_68804e2c_traverseephemeron_L000150_164
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRP4 regl
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepki_68804e2c_traverseephemeron_L000150_165 ' NEI4
 mov r2, r7 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk7_68804e2c_clearkey_L000033 ' CALL addrg
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_166 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_165
 mov r22, r7
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_170 ' EQI4
 mov r22, r7
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_171 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_170
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
C_sepki_68804e2c_traverseephemeron_L000150_171
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk8_68804e2c_iscleared_L000037
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_167 ' EQI4
 mov r9, #1 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_168 ' EQI4
 mov RI, r7
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_168 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_168 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_167
 mov r22, #0 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_174 ' EQI4
 mov RI, r7
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_174 ' EQI4
 mov r11, #1 ' reg <- coni
 mov RI, r7
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepki_68804e2c_traverseephemeron_L000150_174
C_sepki_68804e2c_traverseephemeron_L000150_168
C_sepki_68804e2c_traverseephemeron_L000150_166
' C_sepki_68804e2c_traverseephemeron_L000150_159 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_sepki_68804e2c_traverseephemeron_L000150_161
 cmp r17, r15 wz,wc 
 jmp #BR_B
 long @C_sepki_68804e2c_traverseephemeron_L000150_158' LTU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepki_68804e2c_traverseephemeron_L000150_176 ' NEI4
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_177 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_176
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_178 ' EQI4
 mov r2, r23
 adds r2, #92 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_179 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_178
 cmps r9,  #0 wz
 jmp #BR_Z
 long @C_sepki_68804e2c_traverseephemeron_L000150_180 ' EQI4
 mov r2, r23
 adds r2, #96 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepki_68804e2c_traverseephemeron_L000150_181 ' JUMPV addrg
C_sepki_68804e2c_traverseephemeron_L000150_180
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkg_68804e2c_genlink_L000124
 add SP, #4 ' CALL addrg
C_sepki_68804e2c_traverseephemeron_L000150_181
C_sepki_68804e2c_traverseephemeron_L000150_179
C_sepki_68804e2c_traverseephemeron_L000150_177
 mov r0, r11 ' CVI, CVU or LOAD
' C_sepki_68804e2c_traverseephemeron_L000150_151 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sepkj_68804e2c_traversestrongtable_L000182 ' <symbol:traversestrongtable>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkj_68804e2c_traversestrongtable_L000182_187 ' JUMPV addrg
C_sepkj_68804e2c_traversestrongtable_L000182_184
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_sepkj_68804e2c_traversestrongtable_L000182_188 ' EQI4
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sepkj_68804e2c_traversestrongtable_L000182_188 ' EQI4
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkj_68804e2c_traversestrongtable_L000182_188
' C_sepkj_68804e2c_traversestrongtable_L000182_185 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_sepkj_68804e2c_traversestrongtable_L000182_187
 cmp r17, r13 wz,wc 
 jmp #BR_B
 long @C_sepkj_68804e2c_traversestrongtable_L000182_184' LTU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepkj_68804e2c_traversestrongtable_L000182_193 ' JUMPV addrg
C_sepkj_68804e2c_traversestrongtable_L000182_190
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepkj_68804e2c_traversestrongtable_L000182_194 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk7_68804e2c_clearkey_L000033 ' CALL addrg
 jmp #JMPA
 long @C_sepkj_68804e2c_traversestrongtable_L000182_195 ' JUMPV addrg
C_sepkj_68804e2c_traversestrongtable_L000182_194
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkj_68804e2c_traversestrongtable_L000182_196 ' EQI4
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkj_68804e2c_traversestrongtable_L000182_196 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkj_68804e2c_traversestrongtable_L000182_196
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkj_68804e2c_traversestrongtable_L000182_198 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkj_68804e2c_traversestrongtable_L000182_198 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkj_68804e2c_traversestrongtable_L000182_198
C_sepkj_68804e2c_traversestrongtable_L000182_195
' C_sepkj_68804e2c_traversestrongtable_L000182_191 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_sepkj_68804e2c_traversestrongtable_L000182_193
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sepkj_68804e2c_traversestrongtable_L000182_190' LTU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkg_68804e2c_genlink_L000124
 add SP, #4 ' CALL addrg
' C_sepkj_68804e2c_traversestrongtable_L000182_183 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkk_68804e2c_traversetable_L000200 ' <symbol:traversetable>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkk_68804e2c_traversetable_L000200_204 ' NEU4
 jmp #LODL
 long 0
 mov r17, RI ' reg <- con
 jmp #JMPA
 long @C_sepkk_68804e2c_traversetable_L000200_205 ' JUMPV addrg
C_sepkk_68804e2c_traversetable_L000200_204
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkk_68804e2c_traversetable_L000200_206 ' EQU4
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 jmp #JMPA
 long @C_sepkk_68804e2c_traversetable_L000200_207 ' JUMPV addrg
C_sepkk_68804e2c_traversetable_L000200_206
 mov r22, r23
 adds r22, #164 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, #3 ' reg ARG coni
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
C_sepkk_68804e2c_traversetable_L000200_207
 mov r17, r15 ' CVI, CVU or LOAD
C_sepkk_68804e2c_traversetable_L000200_205
 mov r19, r17 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkk_68804e2c_traversetable_L000200_208 ' EQU4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkk_68804e2c_traversetable_L000200_210 ' EQI4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkk_68804e2c_traversetable_L000200_210
C_sepkk_68804e2c_traversetable_L000200_208
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkk_68804e2c_traversetable_L000200_212 ' EQU4
 mov r22, #4 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sepkk_68804e2c_traversetable_L000200_212 ' NEI4
 mov r2, #107 ' reg ARG coni
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r2, #118 ' reg ARG coni
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_sepkk_68804e2c_traversetable_L000200_214 ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_sepkk_68804e2c_traversetable_L000200_212 ' EQU4
C_sepkk_68804e2c_traversetable_L000200_214
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkk_68804e2c_traversetable_L000200_215 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkh_68804e2c_traverseweakvalue_L000130
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepkk_68804e2c_traversetable_L000200_213 ' JUMPV addrg
C_sepkk_68804e2c_traversetable_L000200_215
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkk_68804e2c_traversetable_L000200_217 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepki_68804e2c_traverseephemeron_L000150
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepkk_68804e2c_traversetable_L000200_213 ' JUMPV addrg
C_sepkk_68804e2c_traversetable_L000200_217
 mov r2, r23
 adds r2, #96 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepkk_68804e2c_traversetable_L000200_213 ' JUMPV addrg
C_sepkk_68804e2c_traversetable_L000200_212
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkj_68804e2c_traversestrongtable_L000182
 add SP, #4 ' CALL addrg
C_sepkk_68804e2c_traversetable_L000200_213
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkk_68804e2c_traversetable_L000200_220 ' NEU4
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkk_68804e2c_traversetable_L000200_221 ' JUMPV addrg
C_sepkk_68804e2c_traversetable_L000200_220
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r13, r22 ' LSHI/U
 shl r13, r20 ' LSHI/U (3)
C_sepkk_68804e2c_traversetable_L000200_221
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, r13
 shl r20, #1 ' LSHI4 coni
 mov r0, r22 ' ADDU
 add r0, r20 ' ADDU (3)
' C_sepkk_68804e2c_traversetable_L000200_201 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sepkl_68804e2c_traverseudata_L000222 ' <symbol:traverseudata>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkl_68804e2c_traverseudata_L000222_224 ' EQU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkl_68804e2c_traverseudata_L000222_226 ' EQI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkl_68804e2c_traverseudata_L000222_226
C_sepkl_68804e2c_traverseudata_L000222_224
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkl_68804e2c_traverseudata_L000222_231 ' JUMPV addrg
C_sepkl_68804e2c_traverseudata_L000222_228
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_sepkl_68804e2c_traverseudata_L000222_232 ' EQI4
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sepkl_68804e2c_traverseudata_L000222_232 ' EQI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkl_68804e2c_traverseudata_L000222_232
' C_sepkl_68804e2c_traverseudata_L000222_229 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sepkl_68804e2c_traverseudata_L000222_231
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sepkl_68804e2c_traverseudata_L000222_228 ' LTI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkg_68804e2c_genlink_L000124
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_sepkl_68804e2c_traverseudata_L000222_223 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkm_68804e2c_traverseproto_L000234 ' <symbol:traverseproto>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_236 ' EQU4
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_238 ' EQI4
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkm_68804e2c_traverseproto_L000234_238
C_sepkm_68804e2c_traverseproto_L000234_236
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkm_68804e2c_traverseproto_L000234_243 ' JUMPV addrg
C_sepkm_68804e2c_traverseproto_L000234_240
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_244 ' EQI4
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_244 ' EQI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkm_68804e2c_traverseproto_L000234_244
' C_sepkm_68804e2c_traverseproto_L000234_241 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sepkm_68804e2c_traverseproto_L000234_243
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sepkm_68804e2c_traverseproto_L000234_240 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkm_68804e2c_traverseproto_L000234_249 ' JUMPV addrg
C_sepkm_68804e2c_traverseproto_L000234_246
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_250 ' EQU4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_252 ' EQI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkm_68804e2c_traverseproto_L000234_252
C_sepkm_68804e2c_traverseproto_L000234_250
' C_sepkm_68804e2c_traverseproto_L000234_247 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sepkm_68804e2c_traverseproto_L000234_249
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sepkm_68804e2c_traverseproto_L000234_246 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkm_68804e2c_traverseproto_L000234_257 ' JUMPV addrg
C_sepkm_68804e2c_traverseproto_L000234_254
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_258 ' EQU4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_260 ' EQI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkm_68804e2c_traverseproto_L000234_260
C_sepkm_68804e2c_traverseproto_L000234_258
' C_sepkm_68804e2c_traverseproto_L000234_255 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sepkm_68804e2c_traverseproto_L000234_257
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sepkm_68804e2c_traverseproto_L000234_254 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkm_68804e2c_traverseproto_L000234_265 ' JUMPV addrg
C_sepkm_68804e2c_traverseproto_L000234_262
 mov r22, #12 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_266 ' EQU4
 mov r22, #12 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkm_68804e2c_traverseproto_L000234_268 ' EQI4
 mov r22, #12 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkm_68804e2c_traverseproto_L000234_268
C_sepkm_68804e2c_traverseproto_L000234_266
' C_sepkm_68804e2c_traverseproto_L000234_263 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sepkm_68804e2c_traverseproto_L000234_265
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sepkm_68804e2c_traverseproto_L000234_262 ' LTI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_sepkm_68804e2c_traverseproto_L000234_235 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkn_68804e2c_traverseC_closure_L000270 ' <symbol:traverseCclosure>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkn_68804e2c_traverseC_closure_L000270_275 ' JUMPV addrg
C_sepkn_68804e2c_traverseC_closure_L000270_272
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 jmp #BR_Z
 long @C_sepkn_68804e2c_traverseC_closure_L000270_276 ' EQI4
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_sepkn_68804e2c_traverseC_closure_L000270_276 ' EQI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkn_68804e2c_traverseC_closure_L000270_276
' C_sepkn_68804e2c_traverseC_closure_L000270_273 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sepkn_68804e2c_traverseC_closure_L000270_275
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sepkn_68804e2c_traverseC_closure_L000270_272 ' LTI4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_sepkn_68804e2c_traverseC_closure_L000270_271 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepko_68804e2c_traverseL_closure_L000278 ' <symbol:traverseLclosure>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepko_68804e2c_traverseL_closure_L000278_280 ' EQU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepko_68804e2c_traverseL_closure_L000278_282 ' EQI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepko_68804e2c_traverseL_closure_L000278_282
C_sepko_68804e2c_traverseL_closure_L000278_280
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepko_68804e2c_traverseL_closure_L000278_287 ' JUMPV addrg
C_sepko_68804e2c_traverseL_closure_L000278_284
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepko_68804e2c_traverseL_closure_L000278_288 ' EQU4
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepko_68804e2c_traverseL_closure_L000278_290 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepko_68804e2c_traverseL_closure_L000278_290
C_sepko_68804e2c_traverseL_closure_L000278_288
' C_sepko_68804e2c_traverseL_closure_L000278_285 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sepko_68804e2c_traverseL_closure_L000278_287
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sepko_68804e2c_traverseL_closure_L000278_284 ' LTI4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_sepko_68804e2c_traverseL_closure_L000278_279 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkp_68804e2c_traversethread_L000292 ' <symbol:traversethread>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #1 wz,wc
 jmp #BR_A
 long @C_sepkp_68804e2c_traversethread_L000292_296 ' GTI4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepkp_68804e2c_traversethread_L000292_294 ' NEI4
C_sepkp_68804e2c_traversethread_L000292_296
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #40 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
C_sepkp_68804e2c_traversethread_L000292_294
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkp_68804e2c_traversethread_L000292_302 ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_sepkp_68804e2c_traversethread_L000292_293 ' JUMPV addrg
C_sepkp_68804e2c_traversethread_L000292_299
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkp_68804e2c_traversethread_L000292_303 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepkp_68804e2c_traversethread_L000292_303 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkp_68804e2c_traversethread_L000292_303
' C_sepkp_68804e2c_traversethread_L000292_300 ' (symbol refcount = 0)
 adds r19, #8 ' ADDP4 coni
C_sepkp_68804e2c_traversethread_L000292_302
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sepkp_68804e2c_traversethread_L000292_299' LTU4
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepkp_68804e2c_traversethread_L000292_308 ' JUMPV addrg
C_sepkp_68804e2c_traversethread_L000292_305
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkp_68804e2c_traversethread_L000292_309 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepkp_68804e2c_traversethread_L000292_309
' C_sepkp_68804e2c_traversethread_L000292_306 ' (symbol refcount = 0)
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C_sepkp_68804e2c_traversethread_L000292_308
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkp_68804e2c_traversethread_L000292_305 ' NEU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_sepkp_68804e2c_traversethread_L000292_311 ' NEI4
 jmp #JMPA
 long @C_sepkp_68804e2c_traversethread_L000292_316 ' JUMPV addrg
C_sepkp_68804e2c_traversethread_L000292_313
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_sepkp_68804e2c_traversethread_L000292_314 ' (symbol refcount = 0)
 adds r19, #8 ' ADDP4 coni
C_sepkp_68804e2c_traversethread_L000292_316
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #40 ' ADDP4 coni
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sepkp_68804e2c_traversethread_L000292_313' LTU4
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sepkp_68804e2c_traversethread_L000292_312 ' NEU4
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepkp_68804e2c_traversethread_L000292_312 ' EQU4
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 mov r20, r23
 adds r20, #136 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #136 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sepkp_68804e2c_traversethread_L000292_312 ' JUMPV addrg
C_sepkp_68804e2c_traversethread_L000292_311
 mov r22, r23
 adds r22, #63 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepkp_68804e2c_traversethread_L000292_319 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaD__shrinkstack ' CALL addrg
C_sepkp_68804e2c_traversethread_L000292_319
C_sepkp_68804e2c_traversethread_L000292_312
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 adds r0, #1 ' ADDI4 coni
C_sepkp_68804e2c_traversethread_L000292_293
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkq_68804e2c_propagatemark_L000321 ' <symbol:propagatemark>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #80 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk3_68804e2c_getgclist_L000015 ' CALL addrg
 mov r20, r23
 adds r20, #80 ' ADDP4 coni
 mov RI, r0
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 cmps r19,  #5 wz,wc
 jmp #BR_B
 long @C_sepkq_68804e2c_propagatemark_L000321_323 ' LTI4
 cmps r19,  #10 wz,wc
 jmp #BR_A
 long @C_sepkq_68804e2c_propagatemark_L000321_332 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sepkq_68804e2c_propagatemark_L000321_333_L000335-20
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sepkq_68804e2c_propagatemark_L000321_333_L000335 ' <symbol:333>
 long @C_sepkq_68804e2c_propagatemark_L000321_326
 long @C_sepkq_68804e2c_propagatemark_L000321_328
 long @C_sepkq_68804e2c_propagatemark_L000321_327
 long @C_sepkq_68804e2c_propagatemark_L000321_331
 long @C_sepkq_68804e2c_propagatemark_L000321_323
 long @C_sepkq_68804e2c_propagatemark_L000321_330

' Catalina Code

DAT ' code segment
C_sepkq_68804e2c_propagatemark_L000321_332
 cmps r19,  #38 wz
 jmp #BR_Z
 long @C_sepkq_68804e2c_propagatemark_L000321_329 ' EQI4
 jmp #JMPA
 long @C_sepkq_68804e2c_propagatemark_L000321_323 ' JUMPV addrg
C_sepkq_68804e2c_propagatemark_L000321_326
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkk_68804e2c_traversetable_L000200
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepkq_68804e2c_propagatemark_L000321_322 ' JUMPV addrg
C_sepkq_68804e2c_propagatemark_L000321_327
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkl_68804e2c_traverseudata_L000222
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepkq_68804e2c_propagatemark_L000321_322 ' JUMPV addrg
C_sepkq_68804e2c_propagatemark_L000321_328
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepko_68804e2c_traverseL_closure_L000278
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepkq_68804e2c_propagatemark_L000321_322 ' JUMPV addrg
C_sepkq_68804e2c_propagatemark_L000321_329
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkn_68804e2c_traverseC_closure_L000270
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepkq_68804e2c_propagatemark_L000321_322 ' JUMPV addrg
C_sepkq_68804e2c_propagatemark_L000321_330
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkm_68804e2c_traverseproto_L000234
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepkq_68804e2c_propagatemark_L000321_322 ' JUMPV addrg
C_sepkq_68804e2c_propagatemark_L000321_331
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkp_68804e2c_traversethread_L000292
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepkq_68804e2c_propagatemark_L000321_322 ' JUMPV addrg
C_sepkq_68804e2c_propagatemark_L000321_323
 mov r0, #0 ' reg <- coni
C_sepkq_68804e2c_propagatemark_L000321_322
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkt_68804e2c_propagateall_L000337 ' <symbol:propagateall>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepkt_68804e2c_propagateall_L000337_340 ' JUMPV addrg
C_sepkt_68804e2c_propagateall_L000337_339
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkq_68804e2c_propagatemark_L000321 ' CALL addrg
 add r21, r0 ' ADDU (1)
C_sepkt_68804e2c_propagateall_L000337_340
 mov r22, r23
 adds r22, #80 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkt_68804e2c_propagateall_L000337_339 ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_sepkt_68804e2c_propagateall_L000337_338 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepku_68804e2c_convergeephemerons_L000342 ' <symbol:convergeephemerons>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
C_sepku_68804e2c_convergeephemerons_L000342_344
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepku_68804e2c_convergeephemerons_L000342_348 ' JUMPV addrg
C_sepku_68804e2c_convergeephemerons_L000342_347
 mov r13, r15 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r13
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepki_68804e2c_traverseephemeron_L000150
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sepku_68804e2c_convergeephemerons_L000342_350 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkt_68804e2c_propagateall_L000337 ' CALL addrg
 mov r19, #1 ' reg <- coni
C_sepku_68804e2c_convergeephemerons_L000342_350
C_sepku_68804e2c_convergeephemerons_L000342_348
 mov r15, r17 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepku_68804e2c_convergeephemerons_L000342_347 ' NEU4
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_sepku_68804e2c_convergeephemerons_L000342_353 ' NEI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_sepku_68804e2c_convergeephemerons_L000342_354 ' JUMPV addrg
C_sepku_68804e2c_convergeephemerons_L000342_353
 mov r13, #0 ' reg <- coni
C_sepku_68804e2c_convergeephemerons_L000342_354
 mov r21, r13 ' CVI, CVU or LOAD
' C_sepku_68804e2c_convergeephemerons_L000342_345 ' (symbol refcount = 0)
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_sepku_68804e2c_convergeephemerons_L000342_344 ' NEI4
' C_sepku_68804e2c_convergeephemerons_L000342_343 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepkv_68804e2c_clearbykeys_L000355 ' <symbol:clearbykeys>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sepkv_68804e2c_clearbykeys_L000355_360 ' JUMPV addrg
C_sepkv_68804e2c_clearbykeys_L000355_357
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r20, r15
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r15
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepkv_68804e2c_clearbykeys_L000355_364 ' JUMPV addrg
C_sepkv_68804e2c_clearbykeys_L000355_361
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepkv_68804e2c_clearbykeys_L000355_368 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepkv_68804e2c_clearbykeys_L000355_369 ' JUMPV addrg
C_sepkv_68804e2c_clearbykeys_L000355_368
 jmp #LODL
 long 0
 mov r13, RI ' reg <- con
C_sepkv_68804e2c_clearbykeys_L000355_369
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk8_68804e2c_iscleared_L000037
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sepkv_68804e2c_clearbykeys_L000355_365 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepkv_68804e2c_clearbykeys_L000355_365
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepkv_68804e2c_clearbykeys_L000355_370 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk7_68804e2c_clearkey_L000033 ' CALL addrg
C_sepkv_68804e2c_clearbykeys_L000355_370
' C_sepkv_68804e2c_clearbykeys_L000355_362 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_sepkv_68804e2c_clearbykeys_L000355_364
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sepkv_68804e2c_clearbykeys_L000355_361' LTU4
' C_sepkv_68804e2c_clearbykeys_L000355_358 ' (symbol refcount = 0)
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_sepkv_68804e2c_clearbykeys_L000355_360
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepkv_68804e2c_clearbykeys_L000355_357 ' NEU4
' C_sepkv_68804e2c_clearbykeys_L000355_356 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk10_68804e2c_clearbyvalues_L000372 ' <symbol:clearbyvalues>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sepk10_68804e2c_clearbyvalues_L000372_377 ' JUMPV addrg
C_sepk10_68804e2c_clearbyvalues_L000372_374
 mov r13, r21 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r20, r13
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r13
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r2, r13 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaH__realasize ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepk10_68804e2c_clearbyvalues_L000372_381 ' JUMPV addrg
C_sepk10_68804e2c_clearbyvalues_L000372_378
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r13
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r7, r22 ' ADDI/P
 adds r7, r20 ' ADDI/P (3)
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk10_68804e2c_clearbyvalues_L000372_385 ' EQI4
 mov RI, r7
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_sepk10_68804e2c_clearbyvalues_L000372_386 ' JUMPV addrg
C_sepk10_68804e2c_clearbyvalues_L000372_385
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_sepk10_68804e2c_clearbyvalues_L000372_386
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk8_68804e2c_iscleared_L000037
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sepk10_68804e2c_clearbyvalues_L000372_382 ' EQI4
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepk10_68804e2c_clearbyvalues_L000372_382
' C_sepk10_68804e2c_clearbyvalues_L000372_379 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_sepk10_68804e2c_clearbyvalues_L000372_381
 cmp r15, r9 wz,wc 
 jmp #BR_B
 long @C_sepk10_68804e2c_clearbyvalues_L000372_378' LTU4
 mov r22, r13
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepk10_68804e2c_clearbyvalues_L000372_390 ' JUMPV addrg
C_sepk10_68804e2c_clearbyvalues_L000372_387
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk10_68804e2c_clearbyvalues_L000372_394 ' EQI4
 mov RI, r17
 jmp #RLNG
 mov r7, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepk10_68804e2c_clearbyvalues_L000372_395 ' JUMPV addrg
C_sepk10_68804e2c_clearbyvalues_L000372_394
 jmp #LODL
 long 0
 mov r7, RI ' reg <- con
C_sepk10_68804e2c_clearbyvalues_L000372_395
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk8_68804e2c_iscleared_L000037
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sepk10_68804e2c_clearbyvalues_L000372_391 ' EQI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepk10_68804e2c_clearbyvalues_L000372_391
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepk10_68804e2c_clearbyvalues_L000372_396 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk7_68804e2c_clearkey_L000033 ' CALL addrg
C_sepk10_68804e2c_clearbyvalues_L000372_396
' C_sepk10_68804e2c_clearbyvalues_L000372_388 ' (symbol refcount = 0)
 adds r17, #16 ' ADDP4 coni
C_sepk10_68804e2c_clearbyvalues_L000372_390
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r11 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_sepk10_68804e2c_clearbyvalues_L000372_387' LTU4
' C_sepk10_68804e2c_clearbyvalues_L000372_375 ' (symbol refcount = 0)
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_sepk10_68804e2c_clearbyvalues_L000372_377
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sepk10_68804e2c_clearbyvalues_L000372_374 ' NEU4
' C_sepk10_68804e2c_clearbyvalues_L000372_373 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk11_68804e2c_freeupval_L000398 ' <symbol:freeupval>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_sepk11_68804e2c_freeupval_L000398_400 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaF__unlinkupval ' CALL addrg
C_sepk11_68804e2c_freeupval_L000398_400
 mov r2, #20 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
' C_sepk11_68804e2c_freeupval_L000398_399 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk12_68804e2c_freeobj_L000402 ' <symbol:freeobj>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 mov r22, #20 ' reg <- coni
 cmps r19, r22 wz
 jmp #BR_Z
 long @C_sepk12_68804e2c_freeobj_L000402_418 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_sepk12_68804e2c_freeobj_L000402_420 ' GTI4
' C_sepk12_68804e2c_freeobj_L000402_419 ' (symbol refcount = 0)
 cmps r19,  #4 wz,wc
 jmp #BR_B
 long @C_sepk12_68804e2c_freeobj_L000402_404 ' LTI4
 cmps r19,  #10 wz,wc
 jmp #BR_A
 long @C_sepk12_68804e2c_freeobj_L000402_404 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sepk12_68804e2c_freeobj_L000402_421_L000423-16
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sepk12_68804e2c_freeobj_L000402_421_L000423 ' <symbol:421>
 long @C_sepk12_68804e2c_freeobj_L000402_417
 long @C_sepk12_68804e2c_freeobj_L000402_411
 long @C_sepk12_68804e2c_freeobj_L000402_409
 long @C_sepk12_68804e2c_freeobj_L000402_413
 long @C_sepk12_68804e2c_freeobj_L000402_412
 long @C_sepk12_68804e2c_freeobj_L000402_408
 long @C_sepk12_68804e2c_freeobj_L000402_407

' Catalina Code

DAT ' code segment
C_sepk12_68804e2c_freeobj_L000402_420
 cmps r19,  #38 wz
 jmp #BR_Z
 long @C_sepk12_68804e2c_freeobj_L000402_410 ' EQI4
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_404 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_407
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__freeproto
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_405 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_408
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk11_68804e2c_freeupval_L000398
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_405 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_409
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #6 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #2 ' LSHI4 coni
 adds r20, #16 ' ADDI4 coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_405 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_410
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #6 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #3 ' LSHI4 coni
 adds r20, #16 ' ADDI4 coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_405 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_411
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__free
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_405 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_412
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__freethread
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_405 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_413
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepk12_68804e2c_freeobj_L000402_415 ' NEI4
 mov r17, #16 ' reg <- coni
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_416 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_415
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 shl r22, #3 ' LSHU4 coni
 mov r17, r22
 add r17, #20 ' ADDU4 coni
C_sepk12_68804e2c_freeobj_L000402_416
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r2, r17 ' ADDU
 add r2, r22 ' ADDU (3)
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_405 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_417
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__remove
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, #1 ' reg <- coni
 mov r18, r22
 adds r18, #7 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 adds r18, #1 ' ADDI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0
 add r2, #16 ' ADDU4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepk12_68804e2c_freeobj_L000402_405 ' JUMPV addrg
C_sepk12_68804e2c_freeobj_L000402_418
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, #1 ' reg <- coni
 mov r18, r22
 adds r18, #12 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRU4 reg
 add r18, #1 ' ADDU4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0
 add r2, #16 ' ADDU4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
C_sepk12_68804e2c_freeobj_L000402_404
C_sepk12_68804e2c_freeobj_L000402_405
' C_sepk12_68804e2c_freeobj_L000402_403 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk15_68804e2c_sweeplist_L000425 ' <symbol:sweeplist>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r9, BC ' reg <- INDIRP4 reg
 mov r22, r9
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r13, r22
 xor r13, #24 ' BXORI4 coni
 mov r22, r9
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 mov r11, r22 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepk15_68804e2c_sweeplist_L000425_430 ' JUMPV addrg
C_sepk15_68804e2c_sweeplist_L000425_427
 mov RI, r21
 jmp #RLNG
 mov r7, BC ' reg <- INDIRP4 reg
 mov r22, r7
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 and r22, r13 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk15_68804e2c_sweeplist_L000425_431 ' EQI4
 mov RI, r7
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk12_68804e2c_freeobj_L000402
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk15_68804e2c_sweeplist_L000425_432 ' JUMPV addrg
C_sepk15_68804e2c_sweeplist_L000425_431
 mov r22, r7
 adds r22, #5 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 jmp #LODL
 long -64
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, r11 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r21, r7 ' CVI, CVU or LOAD
C_sepk15_68804e2c_sweeplist_L000425_432
' C_sepk15_68804e2c_sweeplist_L000425_428 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_sepk15_68804e2c_sweeplist_L000425_430
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepk15_68804e2c_sweeplist_L000425_433 ' EQU4
 cmps r15, r19 wz,wc
 jmp #BR_B
 long @C_sepk15_68804e2c_sweeplist_L000425_427 ' LTI4
C_sepk15_68804e2c_sweeplist_L000425_433
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepk15_68804e2c_sweeplist_L000425_434 ' EQU4
 mov RI, r17
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
C_sepk15_68804e2c_sweeplist_L000425_434
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk15_68804e2c_sweeplist_L000425_437 ' NEU4
 jmp #LODL
 long 0
 mov r7, RI ' reg <- con
 jmp #JMPA
 long @C_sepk15_68804e2c_sweeplist_L000425_438 ' JUMPV addrg
C_sepk15_68804e2c_sweeplist_L000425_437
 mov r7, r21 ' CVI, CVU or LOAD
C_sepk15_68804e2c_sweeplist_L000425_438
 mov r0, r7 ' CVI, CVU or LOAD
' C_sepk15_68804e2c_sweeplist_L000425_426 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk16_68804e2c_sweeptolive_L000439 ' <symbol:sweeptolive>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' CVI, CVU or LOAD
C_sepk16_68804e2c_sweeptolive_L000439_441
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk15_68804e2c_sweeplist_L000425
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
' C_sepk16_68804e2c_sweeptolive_L000439_442 ' (symbol refcount = 0)
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_sepk16_68804e2c_sweeptolive_L000439_441 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_sepk16_68804e2c_sweeptolive_L000439_440 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk17_68804e2c_checkS_izes_L000444 ' <symbol:checkSizes>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f50000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #63 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepk17_68804e2c_checkS_izes_L000444_446 ' NEI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #32 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r22, r0 wz,wc
 jmp #BRAE
 long @C_sepk17_68804e2c_checkS_izes_L000444_448 ' GEI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, #2 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__resize
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 mov r16, FP
 sub r16, #-(-8) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRI4 regl
 subs r18, r16 ' SUBI/P (1)
 add r20, r18 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_sepk17_68804e2c_checkS_izes_L000444_448
C_sepk17_68804e2c_checkS_izes_L000444_446
' C_sepk17_68804e2c_checkS_izes_L000444_445 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk18_68804e2c_udata2finalize_L000450 ' <symbol:udata2finalize>
 jmp #PSHM
 long $d40000 ' save registers
 mov r22, r2
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 mov r22, r2
 adds r22, #100 ' ADDP4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffbf
 mov r18, RI ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, #3 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_sepk18_68804e2c_udata2finalize_L000450_452 ' GTI4
 cmps r22,  #6 wz,wc
 jmp #BR_A
 long @C_sepk18_68804e2c_udata2finalize_L000450_452 ' GTI4
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -57
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r2
 adds r18, #56 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #24 ' BANDI4 coni
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sepk18_68804e2c_udata2finalize_L000450_453 ' JUMPV addrg
C_sepk18_68804e2c_udata2finalize_L000450_452
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sepk18_68804e2c_udata2finalize_L000450_454 ' NEI4
 mov r22, r2
 adds r22, #120 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNP4 reg reg
C_sepk18_68804e2c_udata2finalize_L000450_454
C_sepk18_68804e2c_udata2finalize_L000450_453
 mov r0, r23 ' CVI, CVU or LOAD
' C_sepk18_68804e2c_udata2finalize_L000450_451 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sepk19_68804e2c_dothecall_L000456 ' <symbol:dothecall>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
' C_sepk19_68804e2c_dothecall_L000456_457 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1a_68804e2c_G_C_T_M__L000458 ' <symbol:GCTM>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r19, FP
 sub r19, #-(-16) ' reg <- addrli
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk18_68804e2c_udata2finalize_L000450 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov RI, r19
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
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
 jmp #BR_Z
 long @C_sepk1a_68804e2c_G_C_T_M__L000458_460 ' EQI4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-20)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #2 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
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
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
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
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 or r20, #128 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r2, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -16
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 jmp #LODL
 long @C_sepk19_68804e2c_dothecall_L000456
 mov r5, RI ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaD__pcall
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long -129
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk1a_68804e2c_G_C_T_M__L000458_462 ' EQI4
 jmp #LODL
 long @C_sepk1a_68804e2c_G_C_T_M__L000458_464_L000465
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__warnerror
 add SP, #4 ' CALL addrg
 mov r22, r23
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
C_sepk1a_68804e2c_G_C_T_M__L000458_462
C_sepk1a_68804e2c_G_C_T_M__L000458_460
' C_sepk1a_68804e2c_G_C_T_M__L000458_459 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk1c_68804e2c_runafewfinalizers_L000466 ' <symbol:runafewfinalizers>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepk1c_68804e2c_runafewfinalizers_L000466_471 ' JUMPV addrg
C_sepk1c_68804e2c_runafewfinalizers_L000466_468
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1a_68804e2c_G_C_T_M__L000458 ' CALL addrg
' C_sepk1c_68804e2c_runafewfinalizers_L000466_469 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sepk1c_68804e2c_runafewfinalizers_L000466_471
 cmps r19, r21 wz,wc
 jmp #BRAE
 long @C_sepk1c_68804e2c_runafewfinalizers_L000466_472 ' GEI4
 mov r22, r17
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1c_68804e2c_runafewfinalizers_L000466_468 ' NEU4
C_sepk1c_68804e2c_runafewfinalizers_L000466_472
 mov r0, r19 ' CVI, CVU or LOAD
' C_sepk1c_68804e2c_runafewfinalizers_L000466_467 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1d_68804e2c_callallpendingfinalizers_L000473 ' <symbol:callallpendingfinalizers>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepk1d_68804e2c_callallpendingfinalizers_L000473_476 ' JUMPV addrg
C_sepk1d_68804e2c_callallpendingfinalizers_L000473_475
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1a_68804e2c_G_C_T_M__L000458 ' CALL addrg
C_sepk1d_68804e2c_callallpendingfinalizers_L000473_476
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1d_68804e2c_callallpendingfinalizers_L000473_475 ' NEU4
' C_sepk1d_68804e2c_callallpendingfinalizers_L000473_474 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1e_68804e2c_findlast_L000478 ' <symbol:findlast>
 jmp #PSHM
 long $400000 ' save registers
 jmp #JMPA
 long @C_sepk1e_68804e2c_findlast_L000478_481 ' JUMPV addrg
C_sepk1e_68804e2c_findlast_L000478_480
 mov RI, r2
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
C_sepk1e_68804e2c_findlast_L000478_481
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1e_68804e2c_findlast_L000478_480 ' NEU4
 mov r0, r2 ' CVI, CVU or LOAD
' C_sepk1e_68804e2c_findlast_L000478_479 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sepk1f_68804e2c_separatetobefnz_L000483 ' <symbol:separatetobefnz>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, r23
 adds r17, #76 ' ADDP4 coni
 mov r2, r23
 adds r2, #100 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1e_68804e2c_findlast_L000478 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepk1f_68804e2c_separatetobefnz_L000483_486 ' JUMPV addrg
C_sepk1f_68804e2c_separatetobefnz_L000483_485
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sepk1f_68804e2c_separatetobefnz_L000483_488 ' NEI4
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_sepk1f_68804e2c_separatetobefnz_L000483_488 ' NEI4
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepk1f_68804e2c_separatetobefnz_L000483_489 ' JUMPV addrg
C_sepk1f_68804e2c_separatetobefnz_L000483_488
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #124 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sepk1f_68804e2c_separatetobefnz_L000483_490 ' NEU4
 mov r22, r23
 adds r22, #124 ' ADDP4 coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_sepk1f_68804e2c_separatetobefnz_L000483_490
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r19
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r15
 mov BC, r19
 jmp #WLNG ' ASGNP4 reg reg
 mov r15, r19 ' CVI, CVU or LOAD
C_sepk1f_68804e2c_separatetobefnz_L000483_489
C_sepk1f_68804e2c_separatetobefnz_L000483_486
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #128 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sepk1f_68804e2c_separatetobefnz_L000483_485 ' NEU4
' C_sepk1f_68804e2c_separatetobefnz_L000483_484 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1g_68804e2c_checkpointer_L000492 ' <symbol:checkpointer>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sepk1g_68804e2c_checkpointer_L000492_494 ' NEU4
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
C_sepk1g_68804e2c_checkpointer_L000492_494
' C_sepk1g_68804e2c_checkpointer_L000492_493 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sepk1h_68804e2c_correctpointers_L000496 ' <symbol:correctpointers>
 jmp #NEWF
 jmp #PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #108 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1g_68804e2c_checkpointer_L000492
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #112 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1g_68804e2c_checkpointer_L000492
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #116 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1g_68804e2c_checkpointer_L000492
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #120 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1g_68804e2c_checkpointer_L000492
 add SP, #4 ' CALL addrg
' C_sepk1h_68804e2c_correctpointers_L000496_497 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaC_checkfinalizer

 alignl ' align long
C_luaC__checkfinalizer ' <symbol:luaC_checkfinalizer>
 jmp #NEWF
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaC__checkfinalizer_504 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaC__checkfinalizer_505 ' NEU4
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 jmp #JMPA
 long @C_luaC__checkfinalizer_506 ' JUMPV addrg
C_luaC__checkfinalizer_505
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__checkfinalizer_507 ' EQU4
 jmp #LODL
 long 0
 mov r13, RI ' reg <- con
 jmp #JMPA
 long @C_luaC__checkfinalizer_508 ' JUMPV addrg
C_luaC__checkfinalizer_507
 mov r22, r17
 adds r22, #160 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, #2 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_luaC__checkfinalizer_508
 mov r15, r13 ' CVI, CVU or LOAD
C_luaC__checkfinalizer_506
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__checkfinalizer_504 ' EQU4
 mov r22, r17
 adds r22, #62 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__checkfinalizer_499 ' EQI4
C_luaC__checkfinalizer_504
 jmp #JMPA
 long @C_luaC__checkfinalizer_498 ' JUMPV addrg
C_luaC__checkfinalizer_499
 mov r22, r17
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, #3 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_luaC__checkfinalizer_509 ' GTI4
 cmps r22,  #6 wz,wc
 jmp #BR_A
 long @C_luaC__checkfinalizer_509 ' GTI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -57
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r17
 adds r18, #56 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 and r18, #24 ' BANDI4 coni
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaC__checkfinalizer_510 ' NEU4
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk16_68804e2c_sweeptolive_L000439
 add SP, #4 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_luaC__checkfinalizer_510 ' JUMPV addrg
C_luaC__checkfinalizer_509
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1h_68804e2c_correctpointers_L000496
 add SP, #4 ' CALL addrg
C_luaC__checkfinalizer_510
 mov r11, r17
 adds r11, #68 ' ADDP4 coni
 jmp #JMPA
 long @C_luaC__checkfinalizer_516 ' JUMPV addrg
C_luaC__checkfinalizer_513
' C_luaC__checkfinalizer_514 ' (symbol refcount = 0)
 mov RI, r11
 jmp #RLNG
 mov r11, BC ' reg <- INDIRP4 reg
C_luaC__checkfinalizer_516
 mov RI, r11
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaC__checkfinalizer_513 ' NEU4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r11
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaC__checkfinalizer_498
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1j_68804e2c_sweep2old_L000518 ' <symbol:sweep2old>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_sepk1j_68804e2c_sweep2old_L000518_521 ' JUMPV addrg
C_sepk1j_68804e2c_sweep2old_L000518_520
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk1j_68804e2c_sweep2old_L000518_523 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk12_68804e2c_freeobj_L000402
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk1j_68804e2c_sweep2old_L000518_524 ' JUMPV addrg
C_sepk1j_68804e2c_sweep2old_L000518_523
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #4 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_sepk1j_68804e2c_sweep2old_L000518_525 ' NEI4
 mov r15, r19 ' CVI, CVU or LOAD
 mov r2, r17
 adds r2, #84 ' ADDP4 coni
 mov r3, r15
 adds r3, #40 ' ADDP4 coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk6_68804e2c_linkgclist__L000031
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sepk1j_68804e2c_sweep2old_L000518_526 ' JUMPV addrg
C_sepk1j_68804e2c_sweep2old_L000518_525
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_sepk1j_68804e2c_sweep2old_L000518_527 ' NEI4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_sepk1j_68804e2c_sweep2old_L000518_527 ' EQU4
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long $ffffffc7
 mov r18, RI ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sepk1j_68804e2c_sweep2old_L000518_528 ' JUMPV addrg
C_sepk1j_68804e2c_sweep2old_L000518_527
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepk1j_68804e2c_sweep2old_L000518_528
C_sepk1j_68804e2c_sweep2old_L000518_526
 mov r21, r19 ' CVI, CVU or LOAD
C_sepk1j_68804e2c_sweep2old_L000518_524
C_sepk1j_68804e2c_sweep2old_L000518_521
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1j_68804e2c_sweep2old_L000518_520 ' NEU4
' C_sepk1j_68804e2c_sweep2old_L000518_519 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sepk1k_68804e2c_sweepgen_L000529_nextage_L000532 ' <symbol:nextage>
 byte 1
 byte 3
 byte 3
 byte 4
 byte 4
 byte 5
 byte 6

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sepk1k_68804e2c_sweepgen_L000529 ' <symbol:sweepgen>
 jmp #NEWF
 jmp #PSHM
 long $ffa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_sepk1k_68804e2c_sweepgen_L000529_534 ' JUMPV addrg
C_sepk1k_68804e2c_sweepgen_L000529_533
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk1k_68804e2c_sweepgen_L000529_536 ' EQI4
 mov RI, r15
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk12_68804e2c_freeobj_L000402
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk1k_68804e2c_sweepgen_L000529_537 ' JUMPV addrg
C_sepk1k_68804e2c_sweepgen_L000529_536
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1k_68804e2c_sweepgen_L000529_538 ' NEI4
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long -64
 mov r20, RI ' reg <- con
 mov r11, r22 ' BANDI/U
 and r11, r20 ' BANDI/U (3)
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov r20, r11
 or r20, #1 ' BORI4 coni
 or r20, r13 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sepk1k_68804e2c_sweepgen_L000529_539 ' JUMPV addrg
C_sepk1k_68804e2c_sweepgen_L000529_538
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -8
 mov r18, RI ' reg <- con
 and r18, r20 ' BANDI/U (2)
 and r20, #7 ' BANDI4 coni
 jmp #LODL
 long @C_sepk1k_68804e2c_sweepgen_L000529_nextage_L000532
 mov r16, RI ' reg <- addrg
 adds r20, r16 ' ADDI/P (1)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (2)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sepk1k_68804e2c_sweepgen_L000529_540 ' NEI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1k_68804e2c_sweepgen_L000529_540 ' NEU4
 mov RI, r17
 mov BC, r15
 jmp #WLNG ' ASGNP4 reg reg
C_sepk1k_68804e2c_sweepgen_L000529_540
C_sepk1k_68804e2c_sweepgen_L000529_539
 mov r21, r15 ' CVI, CVU or LOAD
C_sepk1k_68804e2c_sweepgen_L000529_537
C_sepk1k_68804e2c_sweepgen_L000529_534
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r15, r22 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sepk1k_68804e2c_sweepgen_L000529_533 ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_sepk1k_68804e2c_sweepgen_L000529_530 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1m_68804e2c_whitelist_L000542 ' <symbol:whitelist>
 jmp #PSHM
 long $d40000 ' save registers
 mov r22, r3
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 mov r23, r22 ' CVUI
 and r23, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_sepk1m_68804e2c_whitelist_L000542_547 ' JUMPV addrg
C_sepk1m_68804e2c_whitelist_L000542_544
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 jmp #LODL
 long -64
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, r23 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_sepk1m_68804e2c_whitelist_L000542_545 ' (symbol refcount = 0)
 mov RI, r2
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
C_sepk1m_68804e2c_whitelist_L000542_547
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1m_68804e2c_whitelist_L000542_544 ' NEU4
' C_sepk1m_68804e2c_whitelist_L000542_543 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_sepk1n_68804e2c_correctgraylist_L000548 ' <symbol:correctgraylist>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sepk1n_68804e2c_correctgraylist_L000548_551 ' JUMPV addrg
C_sepk1n_68804e2c_correctgraylist_L000548_550
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk3_68804e2c_getgclist_L000015 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk1n_68804e2c_correctgraylist_L000548_553 ' EQI4
 jmp #JMPA
 long @C_sepk1n_68804e2c_correctgraylist_L000548_555 ' JUMPV addrg
C_sepk1n_68804e2c_correctgraylist_L000548_553
 mov r22, #5 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #7 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_sepk1n_68804e2c_correctgraylist_L000548_556 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 xor r20, #3 ' BXORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sepk1n_68804e2c_correctgraylist_L000548_558 ' JUMPV addrg
C_sepk1n_68804e2c_correctgraylist_L000548_556
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_sepk1n_68804e2c_correctgraylist_L000548_559 ' NEI4
 jmp #JMPA
 long @C_sepk1n_68804e2c_correctgraylist_L000548_558 ' JUMPV addrg
C_sepk1n_68804e2c_correctgraylist_L000548_559
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_sepk1n_68804e2c_correctgraylist_L000548_561 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 xor r20, #2 ' BXORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepk1n_68804e2c_correctgraylist_L000548_561
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sepk1n_68804e2c_correctgraylist_L000548_555
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_sepk1n_68804e2c_correctgraylist_L000548_551 ' JUMPV addrg
C_sepk1n_68804e2c_correctgraylist_L000548_558
 mov r23, r19 ' CVI, CVU or LOAD
C_sepk1n_68804e2c_correctgraylist_L000548_551
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1n_68804e2c_correctgraylist_L000548_550 ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
' C_sepk1n_68804e2c_correctgraylist_L000548_549 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1o_68804e2c_correctgraylists_L000563 ' <symbol:correctgraylists>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1n_68804e2c_correctgraylist_L000548 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #88 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #88 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1n_68804e2c_correctgraylist_L000548 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1n_68804e2c_correctgraylist_L000548 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1n_68804e2c_correctgraylist_L000548 ' CALL addrg
' C_sepk1o_68804e2c_correctgraylists_L000563_564 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1p_68804e2c_markold_L000565 ' <symbol:markold>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepk1p_68804e2c_markold_L000565_570 ' JUMPV addrg
C_sepk1p_68804e2c_markold_L000565_567
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_sepk1p_68804e2c_markold_L000565_571 ' NEI4
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 xor r20, #7 ' BXORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk1p_68804e2c_markold_L000565_573 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepk1p_68804e2c_markold_L000565_573
C_sepk1p_68804e2c_markold_L000565_571
' C_sepk1p_68804e2c_markold_L000565_568 ' (symbol refcount = 0)
 mov RI, r17
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C_sepk1p_68804e2c_markold_L000565_570
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sepk1p_68804e2c_markold_L000565_567 ' NEU4
' C_sepk1p_68804e2c_markold_L000565_566 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1q_68804e2c_finishgencycle_L000575 ' <symbol:finishgencycle>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1o_68804e2c_correctgraylists_L000563 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk17_68804e2c_checkS_izes_L000444
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #63 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepk1q_68804e2c_finishgencycle_L000575_577 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1d_68804e2c_callallpendingfinalizers_L000473 ' CALL addrg
C_sepk1q_68804e2c_finishgencycle_L000575_577
' C_sepk1q_68804e2c_finishgencycle_L000575_576 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1r_68804e2c_youngcollection_L000579 ' <symbol:youngcollection>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepk1r_68804e2c_youngcollection_L000579_581 ' EQU4
 mov r22, r21
 adds r22, #116 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1p_68804e2c_markold_L000565
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_sepk1r_68804e2c_youngcollection_L000579_581
 mov r22, r21
 adds r22, #132 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1p_68804e2c_markold_L000565
 add SP, #8 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1p_68804e2c_markold_L000565
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1_68804e2c_atomic_L000013 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r21
 adds r2, #120 ' ADDP4 coni
 mov r22, r21
 adds r22, #108 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21
 adds r4, #68 ' ADDP4 coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sepk1k_68804e2c_sweepgen_L000529
 add SP, #16 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r21
 adds r2, #120 ' ADDP4 coni
 mov r22, r21
 adds r22, #112 ' ADDP4 coni
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
 long @C_sepk1k_68804e2c_sweepgen_L000529
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #116 ' ADDP4 coni
 mov r20, r21
 adds r20, #112 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #112 ' ADDP4 coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #108 ' ADDP4 coni
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r22, r21
 adds r22, #124 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21
 adds r4, #76 ' ADDP4 coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sepk1k_68804e2c_sweepgen_L000529
 add SP, #16 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r22, r21
 adds r22, #128 ' ADDP4 coni
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
 long @C_sepk1k_68804e2c_sweepgen_L000529
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #132 ' ADDP4 coni
 mov r20, r21
 adds r20, #128 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #128 ' ADDP4 coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #124 ' ADDP4 coni
 mov r20, r21
 adds r20, #76 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, r21
 adds r4, #100 ' ADDP4 coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_sepk1k_68804e2c_sweepgen_L000529
 add SP, #16 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1q_68804e2c_finishgencycle_L000575
 add SP, #4 ' CALL addrg
' C_sepk1r_68804e2c_youngcollection_L000579_580 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk1s_68804e2c_atomic2gen_L000583 ' <symbol:atomic2gen>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepke_68804e2c_cleargraylists_L000116 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r21
 adds r2, #68 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1j_68804e2c_sweep2old_L000518
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #108 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r21
 adds r20, #112 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r21
 adds r20, #116 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r21
 adds r2, #76 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1j_68804e2c_sweep2old_L000518
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #124 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r21
 adds r20, #128 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r21
 adds r20, #132 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r21
 adds r2, #100 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1j_68804e2c_sweep2old_L000518
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #58 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1q_68804e2c_finishgencycle_L000575
 add SP, #4 ' CALL addrg
' C_sepk1s_68804e2c_atomic2gen_L000583_584 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1t_68804e2c_entergen_L000585 ' <symbol:entergen>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #256 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1_68804e2c_atomic_L000013 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1s_68804e2c_atomic2gen_L000583
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 regl
' C_sepk1t_68804e2c_entergen_L000585_586 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk1u_68804e2c_enterinc_L000587 ' <symbol:enterinc>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1m_68804e2c_whitelist_L000542
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov r20, r23
 adds r20, #108 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r23
 adds r20, #112 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r23
 adds r20, #116 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1m_68804e2c_whitelist_L000542
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1m_68804e2c_whitelist_L000542
 add SP, #4 ' CALL addrg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov r20, r23
 adds r20, #124 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r23
 adds r20, #128 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r20, r23
 adds r20, #132 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov r20, #8 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #58 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_sepk1u_68804e2c_enterinc_L000587_588 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaC_changemode

 alignl ' align long
C_luaC__changemode ' <symbol:luaC_changemode>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #58 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r21, r22 wz
 jmp #BR_Z
 long @C_luaC__changemode_590 ' EQI4
 cmps r21,  #1 wz
 jmp #BRNZ
 long @C_luaC__changemode_592 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1t_68804e2c_entergen_L000585
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaC__changemode_593 ' JUMPV addrg
C_luaC__changemode_592
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1u_68804e2c_enterinc_L000587 ' CALL addrg
C_luaC__changemode_593
C_luaC__changemode_590
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_luaC__changemode_589 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1v_68804e2c_fullgen_L000594 ' <symbol:fullgen>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1u_68804e2c_enterinc_L000587 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1t_68804e2c_entergen_L000585
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sepk1v_68804e2c_fullgen_L000594_595 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk20_68804e2c_setminordebt_L000596 ' <symbol:setminordebt>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 neg r2, r0 ' NEGI4
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
' C_sepk20_68804e2c_setminordebt_L000596_597 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk21_68804e2c_stepgenfull_L000598 ' <symbol:stepgenfull>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRU4 reg
 mov r22, r21
 adds r22, #58 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BRNZ
 long @C_sepk21_68804e2c_stepgenfull_L000598_600 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1u_68804e2c_enterinc_L000587 ' CALL addrg
C_sepk21_68804e2c_stepgenfull_L000598_600
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1_68804e2c_atomic_L000013 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, r19
 shr r20, #3 ' RSHU4 coni
 add r20, r19 ' ADDU (2)
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_sepk21_68804e2c_stepgenfull_L000598_602 ' GEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1s_68804e2c_atomic2gen_L000583
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk20_68804e2c_setminordebt_L000596 ' CALL addrg
 jmp #JMPA
 long @C_sepk21_68804e2c_stepgenfull_L000598_603 ' JUMPV addrg
C_sepk21_68804e2c_stepgenfull_L000598_602
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk2_68804e2c_entersweep_L000014 ' CALL addrg
 mov r2, #256 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1i_68804e2c_setpause_L000517 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_sepk21_68804e2c_stepgenfull_L000598_603
' C_sepk21_68804e2c_stepgenfull_L000598_599 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk22_68804e2c_genstep_L000604 ' <symbol:genstep>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepk22_68804e2c_genstep_L000604_606 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk21_68804e2c_stepgenfull_L000598
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_sepk22_68804e2c_genstep_L000604_607 ' JUMPV addrg
C_sepk22_68804e2c_genstep_L000604_606
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r22, r21
 adds r22, #61 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #2 ' LSHI4 coni
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz,wc
 jmp #BRBE
 long @C_sepk22_68804e2c_genstep_L000604_608 ' LEI4
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (2)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 regl
 add r20, r18 ' ADDU (1)
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sepk22_68804e2c_genstep_L000604_608 ' LEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1v_68804e2c_fullgen_L000594
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 regl
 shr r18, #1 ' RSHU4 coni
 add r20, r18 ' ADDU (1)
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_sepk22_68804e2c_genstep_L000604_610 ' GEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk20_68804e2c_setminordebt_L000596 ' CALL addrg
 jmp #JMPA
 long @C_sepk22_68804e2c_genstep_L000604_609 ' JUMPV addrg
C_sepk22_68804e2c_genstep_L000604_610
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1i_68804e2c_setpause_L000517 ' CALL addrg
 jmp #JMPA
 long @C_sepk22_68804e2c_genstep_L000604_609 ' JUMPV addrg
C_sepk22_68804e2c_genstep_L000604_608
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1r_68804e2c_youngcollection_L000579
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk20_68804e2c_setminordebt_L000596 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_sepk22_68804e2c_genstep_L000604_609
C_sepk22_68804e2c_genstep_L000604_607
' C_sepk22_68804e2c_genstep_L000604_605 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk1i_68804e2c_setpause_L000517 ' <symbol:setpause>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r19, r22
 shl r19, #2 ' LSHI4 coni
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, #100 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 2147483647
 mov r22, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r19, r0 wz,wc
 jmp #BRAE
 long @C_sepk1i_68804e2c_setpause_L000517_614 ' GEI4
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepk1i_68804e2c_setpause_L000517_615 ' JUMPV addrg
C_sepk1i_68804e2c_setpause_L000517_614
 jmp #LODL
 long 2147483647
 mov r15, RI ' reg <- con
C_sepk1i_68804e2c_setpause_L000517_615
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 sub r22, r20 ' SUBU (1)
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r21,  #0 wz,wc
 jmp #BRBE
 long @C_sepk1i_68804e2c_setpause_L000517_616 ' LEI4
 mov r21, #0 ' reg <- coni
C_sepk1i_68804e2c_setpause_L000517_616
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
' C_sepk1i_68804e2c_setpause_L000517_612 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk2_68804e2c_entersweep_L000014 ' <symbol:entersweep>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r21
 adds r2, #68 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk16_68804e2c_sweeptolive_L000439
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
' C_sepk2_68804e2c_entersweep_L000014_618 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk23_68804e2c_deletelist_L000619 ' <symbol:deletelist>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_sepk23_68804e2c_deletelist_L000619_622 ' JUMPV addrg
C_sepk23_68804e2c_deletelist_L000619_621
 mov RI, r21
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk12_68804e2c_freeobj_L000402
 add SP, #4 ' CALL addrg
 mov r21, r17 ' CVI, CVU or LOAD
C_sepk23_68804e2c_deletelist_L000619_622
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_sepk23_68804e2c_deletelist_L000619_621 ' NEU4
' C_sepk23_68804e2c_deletelist_L000619_620 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaC_freeallobjects

 alignl ' align long
C_luaC__freeallobjects ' <symbol:luaC_freeallobjects>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 mov r20, #4 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__changemode
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1f_68804e2c_separatetobefnz_L000483
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1d_68804e2c_callallpendingfinalizers_L000473 ' CALL addrg
 mov r22, r21
 adds r22, #144 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk23_68804e2c_deletelist_L000619
 add SP, #8 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, r21
 adds r22, #104 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk23_68804e2c_deletelist_L000619
 add SP, #8 ' CALL addrg
' C_luaC__freeallobjects_624 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk1_68804e2c_atomic_L000013 ' <symbol:atomic>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r19, #0 ' reg <- coni
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sepk1_68804e2c_atomic_L000013_626 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepk1_68804e2c_atomic_L000013_626
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepk1_68804e2c_atomic_L000013_628 ' EQI4
 mov r20, r21
 adds r20, #36 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sepk1_68804e2c_atomic_L000013_628 ' EQI4
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk_68804e2c_reallymarkobject_L000012
 add SP, #4 ' CALL addrg
C_sepk1_68804e2c_atomic_L000013_628
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkb_68804e2c_markmt_L000083 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkt_68804e2c_propagateall_L000337 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkd_68804e2c_remarkupvals_L000101 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkt_68804e2c_propagateall_L000337 ' CALL addrg
 add r19, r0 ' ADDU (1)
 mov r22, r21
 adds r22, #80 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkt_68804e2c_propagateall_L000337 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepku_68804e2c_convergeephemerons_L000342 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, r21
 adds r22, #88 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk10_68804e2c_clearbyvalues_L000372
 add SP, #8 ' CALL addrg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk10_68804e2c_clearbyvalues_L000372
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #88 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1f_68804e2c_separatetobefnz_L000483
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkc_68804e2c_markbeingfnz_L000093 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkt_68804e2c_propagateall_L000337 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepku_68804e2c_convergeephemerons_L000342 ' CALL addrg
 mov r22, r21
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkv_68804e2c_clearbykeys_L000355
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepkv_68804e2c_clearbykeys_L000355
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #88 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk10_68804e2c_clearbyvalues_L000372
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk10_68804e2c_clearbyvalues_L000372
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaS__clearcache ' CALL addrg
 mov r22, r21
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 xor r20, #24 ' BXORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C_sepk1_68804e2c_atomic_L000013_625 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk24_68804e2c_sweepstep_L000630 ' <symbol:sweepstep>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ff0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepk24_68804e2c_sweepstep_L000630_632 ' EQU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #100 ' reg ARG coni
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk15_68804e2c_sweeplist_L000425
 add SP, #12 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 mov r16, FP
 sub r16, #-(-8) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRI4 regl
 subs r18, r16 ' SUBI/P (1)
 add r20, r18 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_sepk24_68804e2c_sweepstep_L000630_631 ' JUMPV addrg
C_sepk24_68804e2c_sweepstep_L000630_632
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_sepk24_68804e2c_sweepstep_L000630_631
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_sepk25_68804e2c_singlestep_L000634 ' <symbol:singlestep>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #59 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 cmps r19,  #0 wz,wc
 jmp #BR_B
 long @C_sepk25_68804e2c_singlestep_L000634_636 ' LTI4
 cmps r19,  #8 wz,wc
 jmp #BR_A
 long @C_sepk25_68804e2c_singlestep_L000634_636 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sepk25_68804e2c_singlestep_L000634_651_L000653
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sepk25_68804e2c_singlestep_L000634_651_L000653 ' <symbol:651>
 long @C_sepk25_68804e2c_singlestep_L000634_640
 long @C_sepk25_68804e2c_singlestep_L000634_643
 long @C_sepk25_68804e2c_singlestep_L000634_636
 long @C_sepk25_68804e2c_singlestep_L000634_644
 long @C_sepk25_68804e2c_singlestep_L000634_645
 long @C_sepk25_68804e2c_singlestep_L000634_646
 long @C_sepk25_68804e2c_singlestep_L000634_647
 long @C_sepk25_68804e2c_singlestep_L000634_648
 long @C_sepk25_68804e2c_singlestep_L000634_639

' Catalina Code

DAT ' code segment
C_sepk25_68804e2c_singlestep_L000634_639
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkf_68804e2c_restartcollection_L000118 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_640
 mov r22, r21
 adds r22, #80 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sepk25_68804e2c_singlestep_L000634_641 ' NEU4
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_641
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepkq_68804e2c_propagatemark_L000321 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_643
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1_68804e2c_atomic_L000013 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk2_68804e2c_entersweep_L000014 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_644
 mov r2, r21
 adds r2, #76 ' ADDP4 coni
 mov r3, #4 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk24_68804e2c_sweepstep_L000630
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_645
 mov r2, r21
 adds r2, #100 ' ADDP4 coni
 mov r3, #5 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk24_68804e2c_sweepstep_L000630
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_646
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #6 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk24_68804e2c_sweepstep_L000630
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_647
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk17_68804e2c_checkS_izes_L000444
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #7 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_648
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_sepk25_68804e2c_singlestep_L000634_649 ' EQU4
 mov r22, r21
 adds r22, #63 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_sepk25_68804e2c_singlestep_L000634_649 ' NEI4
 mov r22, r21
 adds r22, #59 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, #10 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1c_68804e2c_runafewfinalizers_L000466
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #50 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_649
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #8 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_637 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_636
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_sepk25_68804e2c_singlestep_L000634_635 ' JUMPV addrg
C_sepk25_68804e2c_singlestep_L000634_637
 mov r22, r21
 adds r22, #59 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 regl
C_sepk25_68804e2c_singlestep_L000634_635
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaC_runtilstate

 alignl ' align long
C_luaC__runtilstate ' <symbol:luaC_runtilstate>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaC__runtilstate_656 ' JUMPV addrg
C_luaC__runtilstate_655
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk25_68804e2c_singlestep_L000634 ' CALL addrg
C_luaC__runtilstate_656
 mov r22, #1 ' reg <- coni
 mov r20, r19
 adds r20, #57 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 and r22, r21 ' BANDI/U (2)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__runtilstate_655 ' EQI4
' C_luaC__runtilstate_654 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk28_68804e2c_incstep_L000658 ' <symbol:incstep>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #65 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #2 ' LSHI4 coni
 mov r15, r22
 or r15, #1 ' BORI4 coni
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 shr r22, #3 ' RSHU4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #66 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmp r22,  #30 wz,wc 
 jmp #BR_A
 long @C_sepk28_68804e2c_incstep_L000658_661 ' GTU4
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #66 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r22, r20 ' LSHI/U (1)
 shr r22, #3 ' RSHU4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sepk28_68804e2c_incstep_L000658_662 ' JUMPV addrg
C_sepk28_68804e2c_incstep_L000658_661
 jmp #LODL
 long $7fffffff
 mov r13, RI ' reg <- con
C_sepk28_68804e2c_incstep_L000658_662
 mov r17, r13 ' CVI, CVU or LOAD
C_sepk28_68804e2c_incstep_L000658_663
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk25_68804e2c_singlestep_L000634 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, r11 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
' C_sepk28_68804e2c_incstep_L000658_664 ' (symbol refcount = 0)
 neg r22, r17 ' NEGI4
 cmps r19, r22 wz,wc
 jmp #BRBE
 long @C_sepk28_68804e2c_incstep_L000658_666 ' LEI4
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_sepk28_68804e2c_incstep_L000658_663 ' NEI4
C_sepk28_68804e2c_incstep_L000658_666
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_sepk28_68804e2c_incstep_L000658_667 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1i_68804e2c_setpause_L000517 ' CALL addrg
 jmp #JMPA
 long @C_sepk28_68804e2c_incstep_L000658_668 ' JUMPV addrg
C_sepk28_68804e2c_incstep_L000658_667
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 shl r22, #3 ' LSHU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
C_sepk28_68804e2c_incstep_L000658_668
' C_sepk28_68804e2c_incstep_L000658_659 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaC_step

 alignl ' align long
C_luaC__step ' <symbol:luaC_step>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaC__step_670 ' NEI4
 mov r22, r21
 adds r22, #58 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_luaC__step_674 ' EQI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__step_672 ' EQU4
C_luaC__step_674
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk22_68804e2c_genstep_L000604
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaC__step_673 ' JUMPV addrg
C_luaC__step_672
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk28_68804e2c_incstep_L000658
 add SP, #4 ' CALL addrg
C_luaC__step_673
C_luaC__step_670
' C_luaC__step_669 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sepk29_68804e2c_fullinc_L000675 ' <symbol:fullinc>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz,wc
 jmp #BR_A
 long @C_sepk29_68804e2c_fullinc_L000675_677 ' GTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk2_68804e2c_entersweep_L000014 ' CALL addrg
C_sepk29_68804e2c_fullinc_L000675_677
 mov r2, #256 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, #128 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, #256 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sepk1i_68804e2c_setpause_L000517 ' CALL addrg
' C_sepk29_68804e2c_fullinc_L000675_676 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaC_fullgc

 alignl ' align long
C_luaC__fullgc ' <symbol:luaC_fullgc>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #63 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #58 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaC__fullgc_680 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk29_68804e2c_fullinc_L000675
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaC__fullgc_681 ' JUMPV addrg
C_luaC__fullgc_680
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sepk1v_68804e2c_fullgen_L000594
 add SP, #4 ' CALL addrg
C_luaC__fullgc_681
 mov r22, r19
 adds r22, #63 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaC__fullgc_679 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import luaH_realasize

' Catalina Import luaH_free

' Catalina Import luaS_remove

' Catalina Import luaS_clearcache

' Catalina Import luaS_resize

' Catalina Import luaF_freeproto

' Catalina Import luaF_unlinkupval

' Catalina Import luaD_shrinkstack

' Catalina Import luaD_pcall

' Catalina Import luaD_callnoyield

' Catalina Import luaE_warnerror

' Catalina Import luaE_freethread

' Catalina Import luaE_setdebt

' Catalina Import luaM_malloc_

' Catalina Import luaM_free_

' Catalina Import luaT_gettmbyobj

' Catalina Import luaT_gettm

' Catalina Import strchr

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sepk1a_68804e2c_G_C_T_M__L000458_464_L000465 ' <symbol:464>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

' Catalina Code

DAT ' code segment
' end
