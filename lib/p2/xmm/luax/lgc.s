' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_srjg3_696dded1_getgclist_L000017 ' <symbol:getgclist>
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
 long @C_srjg3_696dded1_getgclist_L000017_19 ' LTI4
 cmps r23,  #10 wz,wc
 jmp #BR_A
 long @C_srjg3_696dded1_getgclist_L000017_28 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_srjg3_696dded1_getgclist_L000017_29_L000031-20
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_srjg3_696dded1_getgclist_L000017_29_L000031 ' <symbol:29>
 long @C_srjg3_696dded1_getgclist_L000017_22
 long @C_srjg3_696dded1_getgclist_L000017_23
 long @C_srjg3_696dded1_getgclist_L000017_27
 long @C_srjg3_696dded1_getgclist_L000017_25
 long @C_srjg3_696dded1_getgclist_L000017_19
 long @C_srjg3_696dded1_getgclist_L000017_26

' Catalina Code

DAT ' code segment
C_srjg3_696dded1_getgclist_L000017_28
 cmps r23,  #38 wz
 jmp #BR_Z
 long @C_srjg3_696dded1_getgclist_L000017_24 ' EQI4
 jmp #JMPA
 long @C_srjg3_696dded1_getgclist_L000017_19 ' JUMPV addrg
C_srjg3_696dded1_getgclist_L000017_22
 mov r0, r2
 adds r0, #28 ' ADDP4 coni
 jmp #JMPA
 long @C_srjg3_696dded1_getgclist_L000017_18 ' JUMPV addrg
C_srjg3_696dded1_getgclist_L000017_23
 mov r0, r2
 adds r0, #8 ' ADDP4 coni
 jmp #JMPA
 long @C_srjg3_696dded1_getgclist_L000017_18 ' JUMPV addrg
C_srjg3_696dded1_getgclist_L000017_24
 mov r0, r2
 adds r0, #8 ' ADDP4 coni
 jmp #JMPA
 long @C_srjg3_696dded1_getgclist_L000017_18 ' JUMPV addrg
C_srjg3_696dded1_getgclist_L000017_25
 mov r0, r2
 adds r0, #40 ' ADDP4 coni
 jmp #JMPA
 long @C_srjg3_696dded1_getgclist_L000017_18 ' JUMPV addrg
C_srjg3_696dded1_getgclist_L000017_26
 mov r0, r2
 adds r0, #80 ' ADDP4 coni
 jmp #JMPA
 long @C_srjg3_696dded1_getgclist_L000017_18 ' JUMPV addrg
C_srjg3_696dded1_getgclist_L000017_27
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
 jmp #JMPA
 long @C_srjg3_696dded1_getgclist_L000017_18 ' JUMPV addrg
C_srjg3_696dded1_getgclist_L000017_19
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_srjg3_696dded1_getgclist_L000017_18
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg6_696dded1_linkgclist__L000033 ' <symbol:linkgclist_>
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
' C_srjg6_696dded1_linkgclist__L000033_34 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_srjg7_696dded1_clearkey_L000035 ' <symbol:clearkey>
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
 long @C_srjg7_696dded1_clearkey_L000035_37 ' EQI4
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 mov r20, #11 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_srjg7_696dded1_clearkey_L000035_37
' C_srjg7_696dded1_clearkey_L000035_36 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_srjg8_696dded1_iscleared_L000039 ' <symbol:iscleared>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg8_696dded1_iscleared_L000039_41 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjg8_696dded1_iscleared_L000039_40 ' JUMPV addrg
C_srjg8_696dded1_iscleared_L000039_41
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
 long @C_srjg8_696dded1_iscleared_L000039_43 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjg8_696dded1_iscleared_L000039_45 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjg8_696dded1_iscleared_L000039_45
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjg8_696dded1_iscleared_L000039_40 ' JUMPV addrg
C_srjg8_696dded1_iscleared_L000039_43
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 and r0, #24 ' BANDI4 coni
C_srjg8_696dded1_iscleared_L000039_40
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
 long @C_luaC__barrier__48 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
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
 long @C_luaC__barrier__49 ' LEI4
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
 long @C_luaC__barrier__49 ' JUMPV addrg
C_luaC__barrier__48
 mov r22, r17
 adds r22, #58 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaC__barrier__52 ' NEI4
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
C_luaC__barrier__52
C_luaC__barrier__49
' C_luaC__barrier__47 ' (symbol refcount = 0)
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
 long @C_luaC__barrierback__55 ' NEI4
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
 long @C_luaC__barrierback__56 ' JUMPV addrg
C_luaC__barrierback__55
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg3_696dded1_getgclist_L000017 ' CALL addrg
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
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
C_luaC__barrierback__56
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #1 wz,wc
 jmp #BRBE
 long @C_luaC__barrierback__57 ' LEI4
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
C_luaC__barrierback__57
' C_luaC__barrierback__54 ' (symbol refcount = 0)
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
' C_luaC__fix_59 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaC_newobjdt

 alignl ' align long
C_luaC__newobjdt ' <symbol:luaC_newobjdt>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 mov r2, r21
 and r2, #15 ' BANDI4 coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r15, r17 ' ADDI/P
 adds r15, r22 ' ADDI/P (3)
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov r20, r13
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r13
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r15
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #68 ' ADDP4 coni
 mov RI, r22
 mov BC, r15
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaC__newobjdt_60 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaC_newobj

 alignl ' align long
C_luaC__newobj ' <symbol:luaC_newobj>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__newobjdt
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaC__newobj_61 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg_696dded1_reallymarkobject_L000014 ' <symbol:reallymarkobject>
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
 long @C_srjg_696dded1_reallymarkobject_L000014_66 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_srjg_696dded1_reallymarkobject_L000014_81 ' GTI4
' C_srjg_696dded1_reallymarkobject_L000014_80 ' (symbol refcount = 0)
 cmps r19,  #4 wz,wc
 jmp #BR_B
 long @C_srjg_696dded1_reallymarkobject_L000014_64 ' LTI4
 cmps r19,  #10 wz,wc
 jmp #BR_A
 long @C_srjg_696dded1_reallymarkobject_L000014_64 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_srjg_696dded1_reallymarkobject_L000014_82_L000084-16
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_srjg_696dded1_reallymarkobject_L000014_82_L000084 ' <symbol:82>
 long @C_srjg_696dded1_reallymarkobject_L000014_66
 long @C_srjg_696dded1_reallymarkobject_L000014_79
 long @C_srjg_696dded1_reallymarkobject_L000014_79
 long @C_srjg_696dded1_reallymarkobject_L000014_72
 long @C_srjg_696dded1_reallymarkobject_L000014_79
 long @C_srjg_696dded1_reallymarkobject_L000014_67
 long @C_srjg_696dded1_reallymarkobject_L000014_79

' Catalina Code

DAT ' code segment
C_srjg_696dded1_reallymarkobject_L000014_81
 cmps r19,  #38 wz
 jmp #BR_Z
 long @C_srjg_696dded1_reallymarkobject_L000014_79 ' EQI4
 jmp #JMPA
 long @C_srjg_696dded1_reallymarkobject_L000014_64 ' JUMPV addrg
C_srjg_696dded1_reallymarkobject_L000014_66
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
 long @C_srjg_696dded1_reallymarkobject_L000014_64 ' JUMPV addrg
C_srjg_696dded1_reallymarkobject_L000014_67
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
 long @C_srjg_696dded1_reallymarkobject_L000014_68 ' EQU4
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
 long @C_srjg_696dded1_reallymarkobject_L000014_69 ' JUMPV addrg
C_srjg_696dded1_reallymarkobject_L000014_68
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
C_srjg_696dded1_reallymarkobject_L000014_69
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
 long @C_srjg_696dded1_reallymarkobject_L000014_64 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014_64 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg_696dded1_reallymarkobject_L000014_64 ' JUMPV addrg
C_srjg_696dded1_reallymarkobject_L000014_72
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
 long @C_srjg_696dded1_reallymarkobject_L000014_73 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_srjg_696dded1_reallymarkobject_L000014_75 ' EQU4
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
 long @C_srjg_696dded1_reallymarkobject_L000014_77 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjg_696dded1_reallymarkobject_L000014_77
C_srjg_696dded1_reallymarkobject_L000014_75
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
 long @C_srjg_696dded1_reallymarkobject_L000014_64 ' JUMPV addrg
C_srjg_696dded1_reallymarkobject_L000014_73
C_srjg_696dded1_reallymarkobject_L000014_79
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg3_696dded1_getgclist_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23
 adds r2, #80 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
C_srjg_696dded1_reallymarkobject_L000014_64
' C_srjg_696dded1_reallymarkobject_L000014_62 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjgb_696dded1_markmt_L000086 ' <symbol:markmt>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
C_srjgb_696dded1_markmt_L000086_88
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
 long @C_srjgb_696dded1_markmt_L000086_92 ' EQU4
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
 long @C_srjgb_696dded1_markmt_L000086_94 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgb_696dded1_markmt_L000086_94
C_srjgb_696dded1_markmt_L000086_92
' C_srjgb_696dded1_markmt_L000086_89 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #9 wz,wc
 jmp #BR_B
 long @C_srjgb_696dded1_markmt_L000086_88 ' LTI4
' C_srjgb_696dded1_markmt_L000086_87 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgc_696dded1_markbeingfnz_L000096 ' <symbol:markbeingfnz>
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
 long @C_srjgc_696dded1_markbeingfnz_L000096_101 ' JUMPV addrg
C_srjgc_696dded1_markbeingfnz_L000096_98
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
 long @C_srjgc_696dded1_markbeingfnz_L000096_102 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgc_696dded1_markbeingfnz_L000096_102
' C_srjgc_696dded1_markbeingfnz_L000096_99 ' (symbol refcount = 0)
 mov RI, r21
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_srjgc_696dded1_markbeingfnz_L000096_101
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgc_696dded1_markbeingfnz_L000096_98 ' NEU4
 mov r0, r19 ' CVI, CVU or LOAD
' C_srjgc_696dded1_markbeingfnz_L000096_97 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgd_696dded1_remarkupvals_L000104 ' <symbol:remarkupvals>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r17, r23
 adds r17, #136 ' ADDP4 coni
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgd_696dded1_remarkupvals_L000104_107 ' JUMPV addrg
C_srjgd_696dded1_remarkupvals_L000104_106
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
 long @C_srjgd_696dded1_remarkupvals_L000104_109 ' NEI4
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_srjgd_696dded1_remarkupvals_L000104_109 ' EQU4
 mov r17, r19
 adds r17, #44 ' ADDP4 coni
 jmp #JMPA
 long @C_srjgd_696dded1_remarkupvals_L000104_110 ' JUMPV addrg
C_srjgd_696dded1_remarkupvals_L000104_109
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
 long @C_srjgd_696dded1_remarkupvals_L000104_114 ' JUMPV addrg
C_srjgd_696dded1_remarkupvals_L000104_111
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
 long @C_srjgd_696dded1_remarkupvals_L000104_115 ' NEI4
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
 long @C_srjgd_696dded1_remarkupvals_L000104_117 ' EQI4
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
 long @C_srjgd_696dded1_remarkupvals_L000104_117 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgd_696dded1_remarkupvals_L000104_117
C_srjgd_696dded1_remarkupvals_L000104_115
' C_srjgd_696dded1_remarkupvals_L000104_112 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
C_srjgd_696dded1_remarkupvals_L000104_114
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgd_696dded1_remarkupvals_L000104_111 ' NEU4
C_srjgd_696dded1_remarkupvals_L000104_110
C_srjgd_696dded1_remarkupvals_L000104_107
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgd_696dded1_remarkupvals_L000104_106 ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_srjgd_696dded1_remarkupvals_L000104_105 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjge_696dded1_cleargraylists_L000119 ' <symbol:cleargraylists>
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
' C_srjge_696dded1_cleargraylists_L000119_120 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_srjgf_696dded1_restartcollection_L000121 ' <symbol:restartcollection>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjge_696dded1_cleargraylists_L000119 ' CALL addrg
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
 long @C_srjgf_696dded1_restartcollection_L000121_123 ' EQI4
 mov r22, r23
 adds r22, #144 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgf_696dded1_restartcollection_L000121_123
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
 long @C_srjgf_696dded1_restartcollection_L000121_125 ' EQI4
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
 long @C_srjgf_696dded1_restartcollection_L000121_125 ' EQI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgf_696dded1_restartcollection_L000121_125
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgb_696dded1_markmt_L000086 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgc_696dded1_markbeingfnz_L000096 ' CALL addrg
' C_srjgf_696dded1_restartcollection_L000121_122 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgg_696dded1_genlink_L000127 ' <symbol:genlink>
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
 long @C_srjgg_696dded1_genlink_L000127_129 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg3_696dded1_getgclist_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_srjgg_696dded1_genlink_L000127_130 ' JUMPV addrg
C_srjgg_696dded1_genlink_L000127_129
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_srjgg_696dded1_genlink_L000127_131 ' NEI4
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
C_srjgg_696dded1_genlink_L000127_131
C_srjgg_696dded1_genlink_L000127_130
' C_srjgg_696dded1_genlink_L000127_128 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgh_696dded1_traverseweakvalue_L000133 ' <symbol:traverseweakvalue>
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
 long @C_srjgh_696dded1_traverseweakvalue_L000133_136 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_srjgh_696dded1_traverseweakvalue_L000133_137 ' JUMPV addrg
C_srjgh_696dded1_traverseweakvalue_L000133_136
 mov r13, #0 ' reg <- coni
C_srjgh_696dded1_traverseweakvalue_L000133_137
 mov r15, r13 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_srjgh_696dded1_traverseweakvalue_L000133_141 ' JUMPV addrg
C_srjgh_696dded1_traverseweakvalue_L000133_138
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjgh_696dded1_traverseweakvalue_L000133_142 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg7_696dded1_clearkey_L000035 ' CALL addrg
 jmp #JMPA
 long @C_srjgh_696dded1_traverseweakvalue_L000133_143 ' JUMPV addrg
C_srjgh_696dded1_traverseweakvalue_L000133_142
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
 long @C_srjgh_696dded1_traverseweakvalue_L000133_144 ' EQI4
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
 long @C_srjgh_696dded1_traverseweakvalue_L000133_144 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgh_696dded1_traverseweakvalue_L000133_144
 mov r22, #0 ' reg <- coni
 cmps r15, r22 wz
 jmp #BRNZ
 long @C_srjgh_696dded1_traverseweakvalue_L000133_146 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_srjgh_696dded1_traverseweakvalue_L000133_149 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r11, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_srjgh_696dded1_traverseweakvalue_L000133_150 ' JUMPV addrg
C_srjgh_696dded1_traverseweakvalue_L000133_149
 jmp #LODL
 long 0
 mov r11, RI ' reg <- con
C_srjgh_696dded1_traverseweakvalue_L000133_150
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg8_696dded1_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_srjgh_696dded1_traverseweakvalue_L000133_146 ' EQI4
 mov r15, #1 ' reg <- coni
C_srjgh_696dded1_traverseweakvalue_L000133_146
C_srjgh_696dded1_traverseweakvalue_L000133_143
' C_srjgh_696dded1_traverseweakvalue_L000133_139 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_srjgh_696dded1_traverseweakvalue_L000133_141
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_srjgh_696dded1_traverseweakvalue_L000133_138' LTU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_srjgh_696dded1_traverseweakvalue_L000133_151 ' NEI4
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_srjgh_696dded1_traverseweakvalue_L000133_151 ' EQI4
 mov r2, r23
 adds r2, #88 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_srjgh_696dded1_traverseweakvalue_L000133_152 ' JUMPV addrg
C_srjgh_696dded1_traverseweakvalue_L000133_151
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
C_srjgh_696dded1_traverseweakvalue_L000133_152
' C_srjgh_696dded1_traverseweakvalue_L000133_134 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgi_696dded1_traverseephemeron_L000153 ' <symbol:traverseephemeron>
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_158 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_155
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_159 ' EQI4
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_159 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgi_696dded1_traverseephemeron_L000153_159
' C_srjgi_696dded1_traverseephemeron_L000153_156 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_srjgi_696dded1_traverseephemeron_L000153_158
 cmp r17, r13 wz,wc 
 jmp #BR_B
 long @C_srjgi_696dded1_traverseephemeron_L000153_155' LTU4
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgi_696dded1_traverseephemeron_L000153_164 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_161
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_srjgi_696dded1_traverseephemeron_L000153_166 ' EQI4
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_167 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_166
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
C_srjgi_696dded1_traverseephemeron_L000153_167
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_168 ' NEI4
 mov r2, r7 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg7_696dded1_clearkey_L000035 ' CALL addrg
 jmp #JMPA
 long @C_srjgi_696dded1_traverseephemeron_L000153_169 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_168
 mov r22, r7
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjgi_696dded1_traverseephemeron_L000153_173 ' EQI4
 mov r22, r7
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_srjgi_696dded1_traverseephemeron_L000153_174 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_173
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
C_srjgi_696dded1_traverseephemeron_L000153_174
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg8_696dded1_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_srjgi_696dded1_traverseephemeron_L000153_170 ' EQI4
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_171 ' EQI4
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_171 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_srjgi_696dded1_traverseephemeron_L000153_171 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_170
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_177 ' EQI4
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
 long @C_srjgi_696dded1_traverseephemeron_L000153_177 ' EQI4
 mov r11, #1 ' reg <- coni
 mov RI, r7
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgi_696dded1_traverseephemeron_L000153_177
C_srjgi_696dded1_traverseephemeron_L000153_171
C_srjgi_696dded1_traverseephemeron_L000153_169
' C_srjgi_696dded1_traverseephemeron_L000153_162 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_srjgi_696dded1_traverseephemeron_L000153_164
 cmp r17, r15 wz,wc 
 jmp #BR_B
 long @C_srjgi_696dded1_traverseephemeron_L000153_161' LTU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjgi_696dded1_traverseephemeron_L000153_179 ' NEI4
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_srjgi_696dded1_traverseephemeron_L000153_180 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_179
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjgi_696dded1_traverseephemeron_L000153_181 ' EQI4
 mov r2, r23
 adds r2, #92 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_srjgi_696dded1_traverseephemeron_L000153_182 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_181
 cmps r9,  #0 wz
 jmp #BR_Z
 long @C_srjgi_696dded1_traverseephemeron_L000153_183 ' EQI4
 mov r2, r23
 adds r2, #96 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_srjgi_696dded1_traverseephemeron_L000153_184 ' JUMPV addrg
C_srjgi_696dded1_traverseephemeron_L000153_183
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgg_696dded1_genlink_L000127
 add SP, #4 ' CALL addrg
C_srjgi_696dded1_traverseephemeron_L000153_184
C_srjgi_696dded1_traverseephemeron_L000153_182
C_srjgi_696dded1_traverseephemeron_L000153_180
 mov r0, r11 ' CVI, CVU or LOAD
' C_srjgi_696dded1_traverseephemeron_L000153_154 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_srjgj_696dded1_traversestrongtable_L000185 ' <symbol:traversestrongtable>
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
 long @C_srjgj_696dded1_traversestrongtable_L000185_190 ' JUMPV addrg
C_srjgj_696dded1_traversestrongtable_L000185_187
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
 long @C_srjgj_696dded1_traversestrongtable_L000185_191 ' EQI4
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
 long @C_srjgj_696dded1_traversestrongtable_L000185_191 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgj_696dded1_traversestrongtable_L000185_191
' C_srjgj_696dded1_traversestrongtable_L000185_188 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_srjgj_696dded1_traversestrongtable_L000185_190
 cmp r17, r13 wz,wc 
 jmp #BR_B
 long @C_srjgj_696dded1_traversestrongtable_L000185_187' LTU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_srjgj_696dded1_traversestrongtable_L000185_196 ' JUMPV addrg
C_srjgj_696dded1_traversestrongtable_L000185_193
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjgj_696dded1_traversestrongtable_L000185_197 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg7_696dded1_clearkey_L000035 ' CALL addrg
 jmp #JMPA
 long @C_srjgj_696dded1_traversestrongtable_L000185_198 ' JUMPV addrg
C_srjgj_696dded1_traversestrongtable_L000185_197
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
 long @C_srjgj_696dded1_traversestrongtable_L000185_199 ' EQI4
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
 long @C_srjgj_696dded1_traversestrongtable_L000185_199 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgj_696dded1_traversestrongtable_L000185_199
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
 long @C_srjgj_696dded1_traversestrongtable_L000185_201 ' EQI4
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
 long @C_srjgj_696dded1_traversestrongtable_L000185_201 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgj_696dded1_traversestrongtable_L000185_201
C_srjgj_696dded1_traversestrongtable_L000185_198
' C_srjgj_696dded1_traversestrongtable_L000185_194 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_srjgj_696dded1_traversestrongtable_L000185_196
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_srjgj_696dded1_traversestrongtable_L000185_193' LTU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgg_696dded1_genlink_L000127
 add SP, #4 ' CALL addrg
' C_srjgj_696dded1_traversestrongtable_L000185_186 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgk_696dded1_traversetable_L000203 ' <symbol:traversetable>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgk_696dded1_traversetable_L000203_207 ' NEU4
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 jmp #JMPA
 long @C_srjgk_696dded1_traversetable_L000203_208 ' JUMPV addrg
C_srjgk_696dded1_traversetable_L000203_207
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
 long @C_srjgk_696dded1_traversetable_L000203_209 ' EQU4
 jmp #LODL
 long 0
 mov r13, RI ' reg <- con
 jmp #JMPA
 long @C_srjgk_696dded1_traversetable_L000203_210 ' JUMPV addrg
C_srjgk_696dded1_traversetable_L000203_209
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
 mov r13, r22 ' CVI, CVU or LOAD
C_srjgk_696dded1_traversetable_L000203_210
 mov r15, r13 ' CVI, CVU or LOAD
C_srjgk_696dded1_traversetable_L000203_208
 mov r19, r15 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_srjgk_696dded1_traversetable_L000203_211 ' EQU4
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
 long @C_srjgk_696dded1_traversetable_L000203_213 ' EQI4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgk_696dded1_traversetable_L000203_213
C_srjgk_696dded1_traversetable_L000203_211
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_srjgk_696dded1_traversetable_L000203_215 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #68 wz
 jmp #BRNZ
 long @C_srjgk_696dded1_traversetable_L000203_215 ' NEI4
 mov RI, r19
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r2, #107 ' reg ARG coni
 mov r3, r17
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #118 ' reg ARG coni
 mov r3, r17
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
 long @C_srjgk_696dded1_traversetable_L000203_217 ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_srjgk_696dded1_traversetable_L000203_215 ' EQU4
C_srjgk_696dded1_traversetable_L000203_217
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgk_696dded1_traversetable_L000203_218 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgh_696dded1_traverseweakvalue_L000133
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjgk_696dded1_traversetable_L000203_216 ' JUMPV addrg
C_srjgk_696dded1_traversetable_L000203_218
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgk_696dded1_traversetable_L000203_220 ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgi_696dded1_traverseephemeron_L000153
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_srjgk_696dded1_traversetable_L000203_216 ' JUMPV addrg
C_srjgk_696dded1_traversetable_L000203_220
 mov r2, r23
 adds r2, #96 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_srjgk_696dded1_traversetable_L000203_216 ' JUMPV addrg
C_srjgk_696dded1_traversetable_L000203_215
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgj_696dded1_traversestrongtable_L000185
 add SP, #4 ' CALL addrg
C_srjgk_696dded1_traversetable_L000203_216
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgk_696dded1_traversetable_L000203_223 ' NEU4
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgk_696dded1_traversetable_L000203_224 ' JUMPV addrg
C_srjgk_696dded1_traversetable_L000203_223
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r11, r22 ' LSHI/U
 shl r11, r20 ' LSHI/U (3)
C_srjgk_696dded1_traversetable_L000203_224
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, r11
 shl r20, #1 ' LSHI4 coni
 mov r0, r22 ' ADDU
 add r0, r20 ' ADDU (3)
' C_srjgk_696dded1_traversetable_L000203_204 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_srjgl_696dded1_traverseudata_L000225 ' <symbol:traverseudata>
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
 long @C_srjgl_696dded1_traverseudata_L000225_227 ' EQU4
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
 long @C_srjgl_696dded1_traverseudata_L000225_229 ' EQI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgl_696dded1_traverseudata_L000225_229
C_srjgl_696dded1_traverseudata_L000225_227
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgl_696dded1_traverseudata_L000225_234 ' JUMPV addrg
C_srjgl_696dded1_traverseudata_L000225_231
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
 long @C_srjgl_696dded1_traverseudata_L000225_235 ' EQI4
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
 long @C_srjgl_696dded1_traverseudata_L000225_235 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgl_696dded1_traverseudata_L000225_235
' C_srjgl_696dded1_traverseudata_L000225_232 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_srjgl_696dded1_traverseudata_L000225_234
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_srjgl_696dded1_traverseudata_L000225_231 ' LTI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgg_696dded1_genlink_L000127
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_srjgl_696dded1_traverseudata_L000225_226 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgm_696dded1_traverseproto_L000237 ' <symbol:traverseproto>
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
 long @C_srjgm_696dded1_traverseproto_L000237_239 ' EQU4
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
 long @C_srjgm_696dded1_traverseproto_L000237_241 ' EQI4
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgm_696dded1_traverseproto_L000237_241
C_srjgm_696dded1_traverseproto_L000237_239
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgm_696dded1_traverseproto_L000237_246 ' JUMPV addrg
C_srjgm_696dded1_traverseproto_L000237_243
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
 long @C_srjgm_696dded1_traverseproto_L000237_247 ' EQI4
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
 long @C_srjgm_696dded1_traverseproto_L000237_247 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgm_696dded1_traverseproto_L000237_247
' C_srjgm_696dded1_traverseproto_L000237_244 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_srjgm_696dded1_traverseproto_L000237_246
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_srjgm_696dded1_traverseproto_L000237_243 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgm_696dded1_traverseproto_L000237_252 ' JUMPV addrg
C_srjgm_696dded1_traverseproto_L000237_249
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
 long @C_srjgm_696dded1_traverseproto_L000237_253 ' EQU4
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
 long @C_srjgm_696dded1_traverseproto_L000237_255 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgm_696dded1_traverseproto_L000237_255
C_srjgm_696dded1_traverseproto_L000237_253
' C_srjgm_696dded1_traverseproto_L000237_250 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_srjgm_696dded1_traverseproto_L000237_252
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_srjgm_696dded1_traverseproto_L000237_249 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgm_696dded1_traverseproto_L000237_260 ' JUMPV addrg
C_srjgm_696dded1_traverseproto_L000237_257
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
 long @C_srjgm_696dded1_traverseproto_L000237_261 ' EQU4
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
 long @C_srjgm_696dded1_traverseproto_L000237_263 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgm_696dded1_traverseproto_L000237_263
C_srjgm_696dded1_traverseproto_L000237_261
' C_srjgm_696dded1_traverseproto_L000237_258 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_srjgm_696dded1_traverseproto_L000237_260
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_srjgm_696dded1_traverseproto_L000237_257 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgm_696dded1_traverseproto_L000237_268 ' JUMPV addrg
C_srjgm_696dded1_traverseproto_L000237_265
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
 long @C_srjgm_696dded1_traverseproto_L000237_269 ' EQU4
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
 long @C_srjgm_696dded1_traverseproto_L000237_271 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgm_696dded1_traverseproto_L000237_271
C_srjgm_696dded1_traverseproto_L000237_269
' C_srjgm_696dded1_traverseproto_L000237_266 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_srjgm_696dded1_traverseproto_L000237_268
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_srjgm_696dded1_traverseproto_L000237_265 ' LTI4
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
' C_srjgm_696dded1_traverseproto_L000237_238 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgn_696dded1_traverseC_closure_L000273 ' <symbol:traverseCclosure>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgn_696dded1_traverseC_closure_L000273_278 ' JUMPV addrg
C_srjgn_696dded1_traverseC_closure_L000273_275
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
 long @C_srjgn_696dded1_traverseC_closure_L000273_279 ' EQI4
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
 long @C_srjgn_696dded1_traverseC_closure_L000273_279 ' EQI4
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
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgn_696dded1_traverseC_closure_L000273_279
' C_srjgn_696dded1_traverseC_closure_L000273_276 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_srjgn_696dded1_traverseC_closure_L000273_278
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_srjgn_696dded1_traverseC_closure_L000273_275 ' LTI4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_srjgn_696dded1_traverseC_closure_L000273_274 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgo_696dded1_traverseL_closure_L000281 ' <symbol:traverseLclosure>
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
 long @C_srjgo_696dded1_traverseL_closure_L000281_283 ' EQU4
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
 long @C_srjgo_696dded1_traverseL_closure_L000281_285 ' EQI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgo_696dded1_traverseL_closure_L000281_285
C_srjgo_696dded1_traverseL_closure_L000281_283
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgo_696dded1_traverseL_closure_L000281_290 ' JUMPV addrg
C_srjgo_696dded1_traverseL_closure_L000281_287
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
 long @C_srjgo_696dded1_traverseL_closure_L000281_291 ' EQU4
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjgo_696dded1_traverseL_closure_L000281_293 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgo_696dded1_traverseL_closure_L000281_293
C_srjgo_696dded1_traverseL_closure_L000281_291
' C_srjgo_696dded1_traverseL_closure_L000281_288 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_srjgo_696dded1_traverseL_closure_L000281_290
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_srjgo_696dded1_traverseL_closure_L000281_287 ' LTI4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_srjgo_696dded1_traverseL_closure_L000281_282 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgp_696dded1_traversethread_L000295 ' <symbol:traversethread>
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
 long @C_srjgp_696dded1_traversethread_L000295_299 ' GTI4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjgp_696dded1_traversethread_L000295_297 ' NEI4
C_srjgp_696dded1_traversethread_L000295_299
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #40 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
C_srjgp_696dded1_traversethread_L000295_297
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgp_696dded1_traversethread_L000295_305 ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C_srjgp_696dded1_traversethread_L000295_296 ' JUMPV addrg
C_srjgp_696dded1_traversethread_L000295_302
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
 long @C_srjgp_696dded1_traversethread_L000295_306 ' EQI4
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
 long @C_srjgp_696dded1_traversethread_L000295_306 ' EQI4
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgp_696dded1_traversethread_L000295_306
' C_srjgp_696dded1_traversethread_L000295_303 ' (symbol refcount = 0)
 adds r19, #8 ' ADDP4 coni
C_srjgp_696dded1_traversethread_L000295_305
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_srjgp_696dded1_traversethread_L000295_302' LTU4
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_srjgp_696dded1_traversethread_L000295_311 ' JUMPV addrg
C_srjgp_696dded1_traversethread_L000295_308
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjgp_696dded1_traversethread_L000295_312 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjgp_696dded1_traversethread_L000295_312
' C_srjgp_696dded1_traversethread_L000295_309 ' (symbol refcount = 0)
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C_srjgp_696dded1_traversethread_L000295_311
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgp_696dded1_traversethread_L000295_308 ' NEU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_srjgp_696dded1_traversethread_L000295_314 ' NEI4
 mov r22, r23
 adds r22, #63 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjgp_696dded1_traversethread_L000295_316 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaD__shrinkstack ' CALL addrg
C_srjgp_696dded1_traversethread_L000295_316
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_srjgp_696dded1_traversethread_L000295_321 ' JUMPV addrg
C_srjgp_696dded1_traversethread_L000295_318
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_srjgp_696dded1_traversethread_L000295_319 ' (symbol refcount = 0)
 adds r19, #8 ' ADDP4 coni
C_srjgp_696dded1_traversethread_L000295_321
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #40 ' ADDP4 coni
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_srjgp_696dded1_traversethread_L000295_318' LTU4
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_srjgp_696dded1_traversethread_L000295_322 ' NEU4
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_srjgp_696dded1_traversethread_L000295_322 ' EQU4
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
C_srjgp_696dded1_traversethread_L000295_322
C_srjgp_696dded1_traversethread_L000295_314
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
C_srjgp_696dded1_traversethread_L000295_296
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgq_696dded1_propagatemark_L000324 ' <symbol:propagatemark>
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
 long @C_srjg3_696dded1_getgclist_L000017 ' CALL addrg
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
 long @C_srjgq_696dded1_propagatemark_L000324_326 ' LTI4
 cmps r19,  #10 wz,wc
 jmp #BR_A
 long @C_srjgq_696dded1_propagatemark_L000324_335 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_srjgq_696dded1_propagatemark_L000324_336_L000338-20
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_srjgq_696dded1_propagatemark_L000324_336_L000338 ' <symbol:336>
 long @C_srjgq_696dded1_propagatemark_L000324_329
 long @C_srjgq_696dded1_propagatemark_L000324_331
 long @C_srjgq_696dded1_propagatemark_L000324_330
 long @C_srjgq_696dded1_propagatemark_L000324_334
 long @C_srjgq_696dded1_propagatemark_L000324_326
 long @C_srjgq_696dded1_propagatemark_L000324_333

' Catalina Code

DAT ' code segment
C_srjgq_696dded1_propagatemark_L000324_335
 cmps r19,  #38 wz
 jmp #BR_Z
 long @C_srjgq_696dded1_propagatemark_L000324_332 ' EQI4
 jmp #JMPA
 long @C_srjgq_696dded1_propagatemark_L000324_326 ' JUMPV addrg
C_srjgq_696dded1_propagatemark_L000324_329
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgk_696dded1_traversetable_L000203
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjgq_696dded1_propagatemark_L000324_325 ' JUMPV addrg
C_srjgq_696dded1_propagatemark_L000324_330
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgl_696dded1_traverseudata_L000225
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjgq_696dded1_propagatemark_L000324_325 ' JUMPV addrg
C_srjgq_696dded1_propagatemark_L000324_331
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgo_696dded1_traverseL_closure_L000281
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjgq_696dded1_propagatemark_L000324_325 ' JUMPV addrg
C_srjgq_696dded1_propagatemark_L000324_332
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgn_696dded1_traverseC_closure_L000273
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjgq_696dded1_propagatemark_L000324_325 ' JUMPV addrg
C_srjgq_696dded1_propagatemark_L000324_333
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgm_696dded1_traverseproto_L000237
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjgq_696dded1_propagatemark_L000324_325 ' JUMPV addrg
C_srjgq_696dded1_propagatemark_L000324_334
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgp_696dded1_traversethread_L000295
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjgq_696dded1_propagatemark_L000324_325 ' JUMPV addrg
C_srjgq_696dded1_propagatemark_L000324_326
 mov r0, #0 ' reg <- coni
C_srjgq_696dded1_propagatemark_L000324_325
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgt_696dded1_propagateall_L000340 ' <symbol:propagateall>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjgt_696dded1_propagateall_L000340_343 ' JUMPV addrg
C_srjgt_696dded1_propagateall_L000340_342
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgq_696dded1_propagatemark_L000324 ' CALL addrg
 add r21, r0 ' ADDU (1)
C_srjgt_696dded1_propagateall_L000340_343
 mov r22, r23
 adds r22, #80 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgt_696dded1_propagateall_L000340_342 ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_srjgt_696dded1_propagateall_L000340_341 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgu_696dded1_convergeephemerons_L000345 ' <symbol:convergeephemerons>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
C_srjgu_696dded1_convergeephemerons_L000345_347
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
 long @C_srjgu_696dded1_convergeephemerons_L000345_351 ' JUMPV addrg
C_srjgu_696dded1_convergeephemerons_L000345_350
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
 long @C_srjgi_696dded1_traverseephemeron_L000153
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_srjgu_696dded1_convergeephemerons_L000345_353 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgt_696dded1_propagateall_L000340 ' CALL addrg
 mov r19, #1 ' reg <- coni
C_srjgu_696dded1_convergeephemerons_L000345_353
C_srjgu_696dded1_convergeephemerons_L000345_351
 mov r15, r17 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgu_696dded1_convergeephemerons_L000345_350 ' NEU4
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_srjgu_696dded1_convergeephemerons_L000345_356 ' NEI4
 mov r13, #1 ' reg <- coni
 jmp #JMPA
 long @C_srjgu_696dded1_convergeephemerons_L000345_357 ' JUMPV addrg
C_srjgu_696dded1_convergeephemerons_L000345_356
 mov r13, #0 ' reg <- coni
C_srjgu_696dded1_convergeephemerons_L000345_357
 mov r21, r13 ' CVI, CVU or LOAD
' C_srjgu_696dded1_convergeephemerons_L000345_348 ' (symbol refcount = 0)
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_srjgu_696dded1_convergeephemerons_L000345_347 ' NEI4
' C_srjgu_696dded1_convergeephemerons_L000345_346 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjgv_696dded1_clearbykeys_L000358 ' <symbol:clearbykeys>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_srjgv_696dded1_clearbykeys_L000358_363 ' JUMPV addrg
C_srjgv_696dded1_clearbykeys_L000358_360
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
 long @C_srjgv_696dded1_clearbykeys_L000358_367 ' JUMPV addrg
C_srjgv_696dded1_clearbykeys_L000358_364
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjgv_696dded1_clearbykeys_L000358_371 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_srjgv_696dded1_clearbykeys_L000358_372 ' JUMPV addrg
C_srjgv_696dded1_clearbykeys_L000358_371
 jmp #LODL
 long 0
 mov r13, RI ' reg <- con
C_srjgv_696dded1_clearbykeys_L000358_372
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg8_696dded1_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_srjgv_696dded1_clearbykeys_L000358_368 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_srjgv_696dded1_clearbykeys_L000358_368
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjgv_696dded1_clearbykeys_L000358_373 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg7_696dded1_clearkey_L000035 ' CALL addrg
C_srjgv_696dded1_clearbykeys_L000358_373
' C_srjgv_696dded1_clearbykeys_L000358_365 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_srjgv_696dded1_clearbykeys_L000358_367
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_srjgv_696dded1_clearbykeys_L000358_364' LTU4
' C_srjgv_696dded1_clearbykeys_L000358_361 ' (symbol refcount = 0)
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_srjgv_696dded1_clearbykeys_L000358_363
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjgv_696dded1_clearbykeys_L000358_360 ' NEU4
' C_srjgv_696dded1_clearbykeys_L000358_359 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg10_696dded1_clearbyvalues_L000375 ' <symbol:clearbyvalues>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_srjg10_696dded1_clearbyvalues_L000375_380 ' JUMPV addrg
C_srjg10_696dded1_clearbyvalues_L000375_377
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
 long @C_srjg10_696dded1_clearbyvalues_L000375_384 ' JUMPV addrg
C_srjg10_696dded1_clearbyvalues_L000375_381
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
 long @C_srjg10_696dded1_clearbyvalues_L000375_388 ' EQI4
 mov RI, r7
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_srjg10_696dded1_clearbyvalues_L000375_389 ' JUMPV addrg
C_srjg10_696dded1_clearbyvalues_L000375_388
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_srjg10_696dded1_clearbyvalues_L000375_389
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg8_696dded1_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_srjg10_696dded1_clearbyvalues_L000375_385 ' EQI4
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_srjg10_696dded1_clearbyvalues_L000375_385
' C_srjg10_696dded1_clearbyvalues_L000375_382 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_srjg10_696dded1_clearbyvalues_L000375_384
 cmp r15, r9 wz,wc 
 jmp #BR_B
 long @C_srjg10_696dded1_clearbyvalues_L000375_381' LTU4
 mov r22, r13
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_srjg10_696dded1_clearbyvalues_L000375_393 ' JUMPV addrg
C_srjg10_696dded1_clearbyvalues_L000375_390
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjg10_696dded1_clearbyvalues_L000375_397 ' EQI4
 mov RI, r17
 jmp #RLNG
 mov r7, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_srjg10_696dded1_clearbyvalues_L000375_398 ' JUMPV addrg
C_srjg10_696dded1_clearbyvalues_L000375_397
 jmp #LODL
 long 0
 mov r7, RI ' reg <- con
C_srjg10_696dded1_clearbyvalues_L000375_398
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg8_696dded1_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_srjg10_696dded1_clearbyvalues_L000375_394 ' EQI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_srjg10_696dded1_clearbyvalues_L000375_394
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjg10_696dded1_clearbyvalues_L000375_399 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg7_696dded1_clearkey_L000035 ' CALL addrg
C_srjg10_696dded1_clearbyvalues_L000375_399
' C_srjg10_696dded1_clearbyvalues_L000375_391 ' (symbol refcount = 0)
 adds r17, #16 ' ADDP4 coni
C_srjg10_696dded1_clearbyvalues_L000375_393
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r11 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_srjg10_696dded1_clearbyvalues_L000375_390' LTU4
' C_srjg10_696dded1_clearbyvalues_L000375_378 ' (symbol refcount = 0)
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_srjg10_696dded1_clearbyvalues_L000375_380
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_srjg10_696dded1_clearbyvalues_L000375_377 ' NEU4
' C_srjg10_696dded1_clearbyvalues_L000375_376 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg11_696dded1_freeupval_L000401 ' <symbol:freeupval>
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
 long @C_srjg11_696dded1_freeupval_L000401_403 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaF__unlinkupval ' CALL addrg
C_srjg11_696dded1_freeupval_L000401_403
 mov r2, #20 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
' C_srjg11_696dded1_freeupval_L000401_402 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg12_696dded1_freeobj_L000405 ' <symbol:freeobj>
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
 long @C_srjg12_696dded1_freeobj_L000405_421 ' EQI4
 cmps r19, r22 wz,wc
 jmp #BR_A
 long @C_srjg12_696dded1_freeobj_L000405_423 ' GTI4
' C_srjg12_696dded1_freeobj_L000405_422 ' (symbol refcount = 0)
 cmps r19,  #4 wz,wc
 jmp #BR_B
 long @C_srjg12_696dded1_freeobj_L000405_407 ' LTI4
 cmps r19,  #10 wz,wc
 jmp #BR_A
 long @C_srjg12_696dded1_freeobj_L000405_407 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_srjg12_696dded1_freeobj_L000405_424_L000426-16
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_srjg12_696dded1_freeobj_L000405_424_L000426 ' <symbol:424>
 long @C_srjg12_696dded1_freeobj_L000405_420
 long @C_srjg12_696dded1_freeobj_L000405_414
 long @C_srjg12_696dded1_freeobj_L000405_412
 long @C_srjg12_696dded1_freeobj_L000405_416
 long @C_srjg12_696dded1_freeobj_L000405_415
 long @C_srjg12_696dded1_freeobj_L000405_411
 long @C_srjg12_696dded1_freeobj_L000405_410

' Catalina Code

DAT ' code segment
C_srjg12_696dded1_freeobj_L000405_423
 cmps r19,  #38 wz
 jmp #BR_Z
 long @C_srjg12_696dded1_freeobj_L000405_413 ' EQI4
 jmp #JMPA
 long @C_srjg12_696dded1_freeobj_L000405_407 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_410
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__freeproto
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg12_696dded1_freeobj_L000405_408 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_411
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg11_696dded1_freeupval_L000401
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg12_696dded1_freeobj_L000405_408 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_412
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
 long @C_srjg12_696dded1_freeobj_L000405_408 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_413
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
 long @C_srjg12_696dded1_freeobj_L000405_408 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_414
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaH__free
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg12_696dded1_freeobj_L000405_408 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_415
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__freethread
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg12_696dded1_freeobj_L000405_408 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_416
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
 long @C_srjg12_696dded1_freeobj_L000405_418 ' NEI4
 mov r17, #16 ' reg <- coni
 jmp #JMPA
 long @C_srjg12_696dded1_freeobj_L000405_419 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_418
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
C_srjg12_696dded1_freeobj_L000405_419
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
 long @C_srjg12_696dded1_freeobj_L000405_408 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_420
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
 long @C_srjg12_696dded1_freeobj_L000405_408 ' JUMPV addrg
C_srjg12_696dded1_freeobj_L000405_421
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
C_srjg12_696dded1_freeobj_L000405_407
C_srjg12_696dded1_freeobj_L000405_408
' C_srjg12_696dded1_freeobj_L000405_406 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg15_696dded1_sweeplist_L000428 ' <symbol:sweeplist>
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
 long @C_srjg15_696dded1_sweeplist_L000428_433 ' JUMPV addrg
C_srjg15_696dded1_sweeplist_L000428_430
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
 long @C_srjg15_696dded1_sweeplist_L000428_434 ' EQI4
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
 long @C_srjg12_696dded1_freeobj_L000405
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg15_696dded1_sweeplist_L000428_435 ' JUMPV addrg
C_srjg15_696dded1_sweeplist_L000428_434
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
C_srjg15_696dded1_sweeplist_L000428_435
' C_srjg15_696dded1_sweeplist_L000428_431 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_srjg15_696dded1_sweeplist_L000428_433
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_srjg15_696dded1_sweeplist_L000428_436 ' EQU4
 cmps r15, r19 wz,wc
 jmp #BR_B
 long @C_srjg15_696dded1_sweeplist_L000428_430 ' LTI4
C_srjg15_696dded1_sweeplist_L000428_436
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_srjg15_696dded1_sweeplist_L000428_437 ' EQU4
 mov RI, r17
 mov BC, r15
 jmp #WLNG ' ASGNI4 reg reg
C_srjg15_696dded1_sweeplist_L000428_437
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg15_696dded1_sweeplist_L000428_440 ' NEU4
 jmp #LODL
 long 0
 mov r7, RI ' reg <- con
 jmp #JMPA
 long @C_srjg15_696dded1_sweeplist_L000428_441 ' JUMPV addrg
C_srjg15_696dded1_sweeplist_L000428_440
 mov r7, r21 ' CVI, CVU or LOAD
C_srjg15_696dded1_sweeplist_L000428_441
 mov r0, r7 ' CVI, CVU or LOAD
' C_srjg15_696dded1_sweeplist_L000428_429 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg16_696dded1_sweeptolive_L000442 ' <symbol:sweeptolive>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' CVI, CVU or LOAD
C_srjg16_696dded1_sweeptolive_L000442_444
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg15_696dded1_sweeplist_L000428
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
' C_srjg16_696dded1_sweeptolive_L000442_445 ' (symbol refcount = 0)
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_srjg16_696dded1_sweeptolive_L000442_444 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_srjg16_696dded1_sweeptolive_L000442_443 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg17_696dded1_checkS_izes_L000447 ' <symbol:checkSizes>
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
 long @C_srjg17_696dded1_checkS_izes_L000447_449 ' NEI4
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
 long @C_srjg17_696dded1_checkS_izes_L000447_451 ' GEI4
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
C_srjg17_696dded1_checkS_izes_L000447_451
C_srjg17_696dded1_checkS_izes_L000447_449
' C_srjg17_696dded1_checkS_izes_L000447_448 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg18_696dded1_udata2finalize_L000453 ' <symbol:udata2finalize>
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
 long @C_srjg18_696dded1_udata2finalize_L000453_455 ' GTI4
 cmps r22,  #6 wz,wc
 jmp #BR_A
 long @C_srjg18_696dded1_udata2finalize_L000453_455 ' GTI4
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
 long @C_srjg18_696dded1_udata2finalize_L000453_456 ' JUMPV addrg
C_srjg18_696dded1_udata2finalize_L000453_455
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_srjg18_696dded1_udata2finalize_L000453_457 ' NEI4
 mov r22, r2
 adds r22, #120 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNP4 reg reg
C_srjg18_696dded1_udata2finalize_L000453_457
C_srjg18_696dded1_udata2finalize_L000453_456
 mov r0, r23 ' CVI, CVU or LOAD
' C_srjg18_696dded1_udata2finalize_L000453_454 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_srjg19_696dded1_dothecall_L000459 ' <symbol:dothecall>
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
' C_srjg19_696dded1_dothecall_L000459_460 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1a_696dded1_G_C_T_M__L000461 ' <symbol:GCTM>
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
 long @C_srjg18_696dded1_udata2finalize_L000453 ' CALL addrg
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
 long @C_srjg1a_696dded1_G_C_T_M__L000461_463 ' EQI4
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
 long @C_srjg19_696dded1_dothecall_L000459
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
 long @C_srjg1a_696dded1_G_C_T_M__L000461_465 ' EQI4
 jmp #LODL
 long @C_srjg1a_696dded1_G_C_T_M__L000461_467_L000468
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
C_srjg1a_696dded1_G_C_T_M__L000461_465
C_srjg1a_696dded1_G_C_T_M__L000461_463
' C_srjg1a_696dded1_G_C_T_M__L000461_462 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg1c_696dded1_runafewfinalizers_L000469 ' <symbol:runafewfinalizers>
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
 long @C_srjg1c_696dded1_runafewfinalizers_L000469_474 ' JUMPV addrg
C_srjg1c_696dded1_runafewfinalizers_L000469_471
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1a_696dded1_G_C_T_M__L000461 ' CALL addrg
' C_srjg1c_696dded1_runafewfinalizers_L000469_472 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_srjg1c_696dded1_runafewfinalizers_L000469_474
 cmps r19, r21 wz,wc
 jmp #BRAE
 long @C_srjg1c_696dded1_runafewfinalizers_L000469_475 ' GEI4
 mov r22, r17
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg1c_696dded1_runafewfinalizers_L000469_471 ' NEU4
C_srjg1c_696dded1_runafewfinalizers_L000469_475
 mov r0, r19 ' CVI, CVU or LOAD
' C_srjg1c_696dded1_runafewfinalizers_L000469_470 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1d_696dded1_callallpendingfinalizers_L000476 ' <symbol:callallpendingfinalizers>
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
 long @C_srjg1d_696dded1_callallpendingfinalizers_L000476_479 ' JUMPV addrg
C_srjg1d_696dded1_callallpendingfinalizers_L000476_478
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1a_696dded1_G_C_T_M__L000461 ' CALL addrg
C_srjg1d_696dded1_callallpendingfinalizers_L000476_479
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg1d_696dded1_callallpendingfinalizers_L000476_478 ' NEU4
' C_srjg1d_696dded1_callallpendingfinalizers_L000476_477 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1e_696dded1_findlast_L000481 ' <symbol:findlast>
 jmp #PSHM
 long $400000 ' save registers
 jmp #JMPA
 long @C_srjg1e_696dded1_findlast_L000481_484 ' JUMPV addrg
C_srjg1e_696dded1_findlast_L000481_483
 mov RI, r2
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
C_srjg1e_696dded1_findlast_L000481_484
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg1e_696dded1_findlast_L000481_483 ' NEU4
 mov r0, r2 ' CVI, CVU or LOAD
' C_srjg1e_696dded1_findlast_L000481_482 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_srjg1f_696dded1_separatetobefnz_L000486 ' <symbol:separatetobefnz>
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
 long @C_srjg1e_696dded1_findlast_L000481 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjg1f_696dded1_separatetobefnz_L000486_489 ' JUMPV addrg
C_srjg1f_696dded1_separatetobefnz_L000486_488
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
 long @C_srjg1f_696dded1_separatetobefnz_L000486_491 ' NEI4
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_srjg1f_696dded1_separatetobefnz_L000486_491 ' NEI4
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjg1f_696dded1_separatetobefnz_L000486_492 ' JUMPV addrg
C_srjg1f_696dded1_separatetobefnz_L000486_491
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #124 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_srjg1f_696dded1_separatetobefnz_L000486_493 ' NEU4
 mov r22, r23
 adds r22, #124 ' ADDP4 coni
 mov RI, r19
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_srjg1f_696dded1_separatetobefnz_L000486_493
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
C_srjg1f_696dded1_separatetobefnz_L000486_492
C_srjg1f_696dded1_separatetobefnz_L000486_489
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
 long @C_srjg1f_696dded1_separatetobefnz_L000486_488 ' NEU4
' C_srjg1f_696dded1_separatetobefnz_L000486_487 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1g_696dded1_checkpointer_L000495 ' <symbol:checkpointer>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 mov RI, r3
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_srjg1g_696dded1_checkpointer_L000495_497 ' NEU4
 mov RI, r2
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r3
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
C_srjg1g_696dded1_checkpointer_L000495_497
' C_srjg1g_696dded1_checkpointer_L000495_496 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_srjg1h_696dded1_correctpointers_L000499 ' <symbol:correctpointers>
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
 long @C_srjg1g_696dded1_checkpointer_L000495
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #112 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1g_696dded1_checkpointer_L000495
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #116 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1g_696dded1_checkpointer_L000495
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #120 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1g_696dded1_checkpointer_L000495
 add SP, #4 ' CALL addrg
' C_srjg1h_696dded1_correctpointers_L000499_500 ' (symbol refcount = 0)
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
 long @C_luaC__checkfinalizer_507 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaC__checkfinalizer_508 ' NEU4
 jmp #LODL
 long 0
 mov r15, RI ' reg <- con
 jmp #JMPA
 long @C_luaC__checkfinalizer_509 ' JUMPV addrg
C_luaC__checkfinalizer_508
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__checkfinalizer_510 ' EQU4
 jmp #LODL
 long 0
 mov r13, RI ' reg <- con
 jmp #JMPA
 long @C_luaC__checkfinalizer_511 ' JUMPV addrg
C_luaC__checkfinalizer_510
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
C_luaC__checkfinalizer_511
 mov r15, r13 ' CVI, CVU or LOAD
C_luaC__checkfinalizer_509
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__checkfinalizer_507 ' EQU4
 mov r22, r17
 adds r22, #62 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__checkfinalizer_502 ' EQI4
C_luaC__checkfinalizer_507
 jmp #JMPA
 long @C_luaC__checkfinalizer_501 ' JUMPV addrg
C_luaC__checkfinalizer_502
 mov r22, r17
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, #3 ' reg <- coni
 cmps r20, r22 wz,wc
 jmp #BR_A
 long @C_luaC__checkfinalizer_512 ' GTI4
 cmps r22,  #6 wz,wc
 jmp #BR_A
 long @C_luaC__checkfinalizer_512 ' GTI4
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
 long @C_luaC__checkfinalizer_513 ' NEU4
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg16_696dded1_sweeptolive_L000442
 add SP, #4 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_luaC__checkfinalizer_513 ' JUMPV addrg
C_luaC__checkfinalizer_512
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1h_696dded1_correctpointers_L000499
 add SP, #4 ' CALL addrg
C_luaC__checkfinalizer_513
 mov r11, r17
 adds r11, #68 ' ADDP4 coni
 jmp #JMPA
 long @C_luaC__checkfinalizer_519 ' JUMPV addrg
C_luaC__checkfinalizer_516
' C_luaC__checkfinalizer_517 ' (symbol refcount = 0)
 mov RI, r11
 jmp #RLNG
 mov r11, BC ' reg <- INDIRP4 reg
C_luaC__checkfinalizer_519
 mov RI, r11
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaC__checkfinalizer_516 ' NEU4
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
C_luaC__checkfinalizer_501
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1i_696dded1_setpause_L000520 ' <symbol:setpause>
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
 long @C_srjg1i_696dded1_setpause_L000520_523 ' GEI4
 mov r0, r17 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjg1i_696dded1_setpause_L000520_524 ' JUMPV addrg
C_srjg1i_696dded1_setpause_L000520_523
 jmp #LODL
 long 2147483647
 mov r15, RI ' reg <- con
C_srjg1i_696dded1_setpause_L000520_524
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
 long @C_srjg1i_696dded1_setpause_L000520_525 ' LEI4
 mov r21, #0 ' reg <- coni
C_srjg1i_696dded1_setpause_L000520_525
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
' C_srjg1i_696dded1_setpause_L000520_521 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg1j_696dded1_sweep2old_L000527 ' <symbol:sweep2old>
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
 long @C_srjg1j_696dded1_sweep2old_L000527_530 ' JUMPV addrg
C_srjg1j_696dded1_sweep2old_L000527_529
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjg1j_696dded1_sweep2old_L000527_532 ' EQI4
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
 long @C_srjg12_696dded1_freeobj_L000405
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg1j_696dded1_sweep2old_L000527_533 ' JUMPV addrg
C_srjg1j_696dded1_sweep2old_L000527_532
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
 long @C_srjg1j_696dded1_sweep2old_L000527_534 ' NEI4
 mov r15, r19 ' CVI, CVU or LOAD
 mov r2, r17
 adds r2, #84 ' ADDP4 coni
 mov r3, r15
 adds r3, #40 ' ADDP4 coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg6_696dded1_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_srjg1j_696dded1_sweep2old_L000527_535 ' JUMPV addrg
C_srjg1j_696dded1_sweep2old_L000527_534
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #9 wz
 jmp #BRNZ
 long @C_srjg1j_696dded1_sweep2old_L000527_536 ' NEI4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_srjg1j_696dded1_sweep2old_L000527_536 ' EQU4
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
 long @C_srjg1j_696dded1_sweep2old_L000527_537 ' JUMPV addrg
C_srjg1j_696dded1_sweep2old_L000527_536
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
C_srjg1j_696dded1_sweep2old_L000527_537
C_srjg1j_696dded1_sweep2old_L000527_535
 mov r21, r19 ' CVI, CVU or LOAD
C_srjg1j_696dded1_sweep2old_L000527_533
C_srjg1j_696dded1_sweep2old_L000527_530
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg1j_696dded1_sweep2old_L000527_529 ' NEU4
' C_srjg1j_696dded1_sweep2old_L000527_528 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_srjg1k_696dded1_sweepgen_L000538_nextage_L000541 ' <symbol:nextage>
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
C_srjg1k_696dded1_sweepgen_L000538 ' <symbol:sweepgen>
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
 long @C_srjg1k_696dded1_sweepgen_L000538_543 ' JUMPV addrg
C_srjg1k_696dded1_sweepgen_L000538_542
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_srjg1k_696dded1_sweepgen_L000538_545 ' EQI4
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
 long @C_srjg12_696dded1_freeobj_L000405
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg1k_696dded1_sweepgen_L000538_546 ' JUMPV addrg
C_srjg1k_696dded1_sweepgen_L000538_545
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjg1k_696dded1_sweepgen_L000538_547 ' NEI4
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
 long @C_srjg1k_696dded1_sweepgen_L000538_548 ' JUMPV addrg
C_srjg1k_696dded1_sweepgen_L000538_547
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
 long @C_srjg1k_696dded1_sweepgen_L000538_nextage_L000541
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
 long @C_srjg1k_696dded1_sweepgen_L000538_549 ' NEI4
 mov RI, r17
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg1k_696dded1_sweepgen_L000538_549 ' NEU4
 mov RI, r17
 mov BC, r15
 jmp #WLNG ' ASGNP4 reg reg
C_srjg1k_696dded1_sweepgen_L000538_549
C_srjg1k_696dded1_sweepgen_L000538_548
 mov r21, r15 ' CVI, CVU or LOAD
C_srjg1k_696dded1_sweepgen_L000538_546
C_srjg1k_696dded1_sweepgen_L000538_543
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r15, r22 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_srjg1k_696dded1_sweepgen_L000538_542 ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_srjg1k_696dded1_sweepgen_L000538_539 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1m_696dded1_whitelist_L000551 ' <symbol:whitelist>
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
 long @C_srjg1m_696dded1_whitelist_L000551_556 ' JUMPV addrg
C_srjg1m_696dded1_whitelist_L000551_553
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
' C_srjg1m_696dded1_whitelist_L000551_554 ' (symbol refcount = 0)
 mov RI, r2
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
C_srjg1m_696dded1_whitelist_L000551_556
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg1m_696dded1_whitelist_L000551_553 ' NEU4
' C_srjg1m_696dded1_whitelist_L000551_552 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_srjg1n_696dded1_correctgraylist_L000557 ' <symbol:correctgraylist>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_srjg1n_696dded1_correctgraylist_L000557_560 ' JUMPV addrg
C_srjg1n_696dded1_correctgraylist_L000557_559
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg3_696dded1_getgclist_L000017 ' CALL addrg
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
 long @C_srjg1n_696dded1_correctgraylist_L000557_562 ' EQI4
 jmp #JMPA
 long @C_srjg1n_696dded1_correctgraylist_L000557_564 ' JUMPV addrg
C_srjg1n_696dded1_correctgraylist_L000557_562
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
 long @C_srjg1n_696dded1_correctgraylist_L000557_565 ' NEI4
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
 long @C_srjg1n_696dded1_correctgraylist_L000557_567 ' JUMPV addrg
C_srjg1n_696dded1_correctgraylist_L000557_565
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_srjg1n_696dded1_correctgraylist_L000557_568 ' NEI4
 jmp #JMPA
 long @C_srjg1n_696dded1_correctgraylist_L000557_567 ' JUMPV addrg
C_srjg1n_696dded1_correctgraylist_L000557_568
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #6 wz
 jmp #BRNZ
 long @C_srjg1n_696dded1_correctgraylist_L000557_570 ' NEI4
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
C_srjg1n_696dded1_correctgraylist_L000557_570
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
C_srjg1n_696dded1_correctgraylist_L000557_564
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_srjg1n_696dded1_correctgraylist_L000557_560 ' JUMPV addrg
C_srjg1n_696dded1_correctgraylist_L000557_567
 mov r23, r19 ' CVI, CVU or LOAD
C_srjg1n_696dded1_correctgraylist_L000557_560
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg1n_696dded1_correctgraylist_L000557_559 ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
' C_srjg1n_696dded1_correctgraylist_L000557_558 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1o_696dded1_correctgraylists_L000572 ' <symbol:correctgraylists>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1n_696dded1_correctgraylist_L000557 ' CALL addrg
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
 long @C_srjg1n_696dded1_correctgraylist_L000557 ' CALL addrg
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
 long @C_srjg1n_696dded1_correctgraylist_L000557 ' CALL addrg
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
 long @C_srjg1n_696dded1_correctgraylist_L000557 ' CALL addrg
' C_srjg1o_696dded1_correctgraylists_L000572_573 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1p_696dded1_markold_L000574 ' <symbol:markold>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_srjg1p_696dded1_markold_L000574_579 ' JUMPV addrg
C_srjg1p_696dded1_markold_L000574_576
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #7 ' BANDI4 coni
 cmps r22,  #3 wz
 jmp #BRNZ
 long @C_srjg1p_696dded1_markold_L000574_580 ' NEI4
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
 long @C_srjg1p_696dded1_markold_L000574_582 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjg1p_696dded1_markold_L000574_582
C_srjg1p_696dded1_markold_L000574_580
' C_srjg1p_696dded1_markold_L000574_577 ' (symbol refcount = 0)
 mov RI, r17
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C_srjg1p_696dded1_markold_L000574_579
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_srjg1p_696dded1_markold_L000574_576 ' NEU4
' C_srjg1p_696dded1_markold_L000574_575 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1q_696dded1_finishgencycle_L000584 ' <symbol:finishgencycle>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1o_696dded1_correctgraylists_L000572 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg17_696dded1_checkS_izes_L000447
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
 long @C_srjg1q_696dded1_finishgencycle_L000584_586 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1d_696dded1_callallpendingfinalizers_L000476 ' CALL addrg
C_srjg1q_696dded1_finishgencycle_L000584_586
' C_srjg1q_696dded1_finishgencycle_L000584_585 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1r_696dded1_youngcollection_L000588 ' <symbol:youngcollection>
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
 long @C_srjg1r_696dded1_youngcollection_L000588_590 ' EQU4
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
 long @C_srjg1p_696dded1_markold_L000574
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_srjg1r_696dded1_youngcollection_L000588_590
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
 long @C_srjg1p_696dded1_markold_L000574
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
 long @C_srjg1p_696dded1_markold_L000574
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1_696dded1_atomic_L000015 ' CALL addrg
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
 long @C_srjg1k_696dded1_sweepgen_L000538
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
 long @C_srjg1k_696dded1_sweepgen_L000538
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
 long @C_srjg1k_696dded1_sweepgen_L000538
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
 long @C_srjg1k_696dded1_sweepgen_L000538
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
 long @C_srjg1k_696dded1_sweepgen_L000538
 add SP, #16 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1q_696dded1_finishgencycle_L000584
 add SP, #4 ' CALL addrg
' C_srjg1r_696dded1_youngcollection_L000588_589 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg1s_696dded1_atomic2gen_L000592 ' <symbol:atomic2gen>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjge_696dded1_cleargraylists_L000119 ' CALL addrg
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
 long @C_srjg1j_696dded1_sweep2old_L000527
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
 long @C_srjg1j_696dded1_sweep2old_L000527
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
 long @C_srjg1j_696dded1_sweep2old_L000527
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
 long @C_srjg1q_696dded1_finishgencycle_L000584
 add SP, #4 ' CALL addrg
' C_srjg1s_696dded1_atomic2gen_L000592_593 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1t_696dded1_setminordebt_L000594 ' <symbol:setminordebt>
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
' C_srjg1t_696dded1_setminordebt_L000594_595 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1u_696dded1_entergen_L000596 ' <symbol:entergen>
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
 long @C_srjg1_696dded1_atomic_L000015 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1s_696dded1_atomic2gen_L000592
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1t_696dded1_setminordebt_L000594 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 regl
' C_srjg1u_696dded1_entergen_L000596_597 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg1v_696dded1_enterinc_L000598 ' <symbol:enterinc>
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
 long @C_srjg1m_696dded1_whitelist_L000551
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
 long @C_srjg1m_696dded1_whitelist_L000551
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
 long @C_srjg1m_696dded1_whitelist_L000551
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
' C_srjg1v_696dded1_enterinc_L000598_599 ' (symbol refcount = 0)
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
 long @C_luaC__changemode_601 ' EQI4
 cmps r21,  #1 wz
 jmp #BRNZ
 long @C_luaC__changemode_603 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1u_696dded1_entergen_L000596
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaC__changemode_604 ' JUMPV addrg
C_luaC__changemode_603
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1v_696dded1_enterinc_L000598 ' CALL addrg
C_luaC__changemode_604
C_luaC__changemode_601
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_luaC__changemode_600 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg20_696dded1_fullgen_L000605 ' <symbol:fullgen>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1v_696dded1_enterinc_L000598 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1u_696dded1_entergen_L000596
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_srjg20_696dded1_fullgen_L000605_606 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg21_696dded1_stepgenfull_L000607 ' <symbol:stepgenfull>
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
 long @C_srjg21_696dded1_stepgenfull_L000607_609 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1v_696dded1_enterinc_L000598 ' CALL addrg
C_srjg21_696dded1_stepgenfull_L000607_609
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
 long @C_srjg1_696dded1_atomic_L000015 ' CALL addrg
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
 long @C_srjg21_696dded1_stepgenfull_L000607_611 ' GEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1s_696dded1_atomic2gen_L000592
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1t_696dded1_setminordebt_L000594 ' CALL addrg
 jmp #JMPA
 long @C_srjg21_696dded1_stepgenfull_L000607_612 ' JUMPV addrg
C_srjg21_696dded1_stepgenfull_L000607_611
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
 long @C_srjg2_696dded1_entersweep_L000016 ' CALL addrg
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
 long @C_srjg1i_696dded1_setpause_L000520 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_srjg21_696dded1_stepgenfull_L000607_612
' C_srjg21_696dded1_stepgenfull_L000607_608 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg22_696dded1_genstep_L000613 ' <symbol:genstep>
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
 long @C_srjg22_696dded1_genstep_L000613_615 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg21_696dded1_stepgenfull_L000607
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_srjg22_696dded1_genstep_L000613_616 ' JUMPV addrg
C_srjg22_696dded1_genstep_L000613_615
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
 long @C_srjg22_696dded1_genstep_L000613_617 ' LEI4
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
 long @C_srjg22_696dded1_genstep_L000613_617 ' LEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg20_696dded1_fullgen_L000605
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
 long @C_srjg22_696dded1_genstep_L000613_619 ' GEU4
 jmp #JMPA
 long @C_srjg22_696dded1_genstep_L000613_618 ' JUMPV addrg
C_srjg22_696dded1_genstep_L000613_619
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
 long @C_srjg1i_696dded1_setpause_L000520 ' CALL addrg
 jmp #JMPA
 long @C_srjg22_696dded1_genstep_L000613_618 ' JUMPV addrg
C_srjg22_696dded1_genstep_L000613_617
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg1r_696dded1_youngcollection_L000588
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1t_696dded1_setminordebt_L000594 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
C_srjg22_696dded1_genstep_L000613_618
C_srjg22_696dded1_genstep_L000613_616
' C_srjg22_696dded1_genstep_L000613_614 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg2_696dded1_entersweep_L000016 ' <symbol:entersweep>
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
 long @C_srjg16_696dded1_sweeptolive_L000442
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
' C_srjg2_696dded1_entersweep_L000016_621 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg23_696dded1_deletelist_L000622 ' <symbol:deletelist>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_srjg23_696dded1_deletelist_L000622_625 ' JUMPV addrg
C_srjg23_696dded1_deletelist_L000622_624
 mov RI, r21
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg12_696dded1_freeobj_L000405
 add SP, #4 ' CALL addrg
 mov r21, r17 ' CVI, CVU or LOAD
C_srjg23_696dded1_deletelist_L000622_625
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_srjg23_696dded1_deletelist_L000622_624 ' NEU4
' C_srjg23_696dded1_deletelist_L000622_623 ' (symbol refcount = 0)
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
 long @C_srjg1f_696dded1_separatetobefnz_L000486
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1d_696dded1_callallpendingfinalizers_L000476 ' CALL addrg
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
 long @C_srjg23_696dded1_deletelist_L000622
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
 long @C_srjg23_696dded1_deletelist_L000622
 add SP, #8 ' CALL addrg
' C_luaC__freeallobjects_627 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg1_696dded1_atomic_L000015 ' <symbol:atomic>
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
 long @C_srjg1_696dded1_atomic_L000015_629 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjg1_696dded1_atomic_L000015_629
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
 long @C_srjg1_696dded1_atomic_L000015_631 ' EQI4
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
 long @C_srjg1_696dded1_atomic_L000015_631 ' EQI4
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg_696dded1_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_srjg1_696dded1_atomic_L000015_631
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgb_696dded1_markmt_L000086 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgt_696dded1_propagateall_L000340 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgd_696dded1_remarkupvals_L000104 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgt_696dded1_propagateall_L000340 ' CALL addrg
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
 long @C_srjgt_696dded1_propagateall_L000340 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgu_696dded1_convergeephemerons_L000345 ' CALL addrg
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
 long @C_srjg10_696dded1_clearbyvalues_L000375
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
 long @C_srjg10_696dded1_clearbyvalues_L000375
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
 long @C_srjg1f_696dded1_separatetobefnz_L000486
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgc_696dded1_markbeingfnz_L000096 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgt_696dded1_propagateall_L000340 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgu_696dded1_convergeephemerons_L000345 ' CALL addrg
 mov r22, r21
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjgv_696dded1_clearbykeys_L000358
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
 long @C_srjgv_696dded1_clearbykeys_L000358
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
 long @C_srjg10_696dded1_clearbyvalues_L000375
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
 long @C_srjg10_696dded1_clearbyvalues_L000375
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
' C_srjg1_696dded1_atomic_L000015_628 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg24_696dded1_sweepstep_L000633 ' <symbol:sweepstep>
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
 long @C_srjg24_696dded1_sweepstep_L000633_635 ' EQU4
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
 long @C_srjg15_696dded1_sweeplist_L000428
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
 long @C_srjg24_696dded1_sweepstep_L000633_634 ' JUMPV addrg
C_srjg24_696dded1_sweepstep_L000633_635
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
C_srjg24_696dded1_sweepstep_L000633_634
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_srjg25_696dded1_singlestep_L000637 ' <symbol:singlestep>
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
 long @C_srjg25_696dded1_singlestep_L000637_639 ' LTI4
 cmps r19,  #8 wz,wc
 jmp #BR_A
 long @C_srjg25_696dded1_singlestep_L000637_639 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_srjg25_696dded1_singlestep_L000637_654_L000656
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_srjg25_696dded1_singlestep_L000637_654_L000656 ' <symbol:654>
 long @C_srjg25_696dded1_singlestep_L000637_643
 long @C_srjg25_696dded1_singlestep_L000637_646
 long @C_srjg25_696dded1_singlestep_L000637_639
 long @C_srjg25_696dded1_singlestep_L000637_647
 long @C_srjg25_696dded1_singlestep_L000637_648
 long @C_srjg25_696dded1_singlestep_L000637_649
 long @C_srjg25_696dded1_singlestep_L000637_650
 long @C_srjg25_696dded1_singlestep_L000637_651
 long @C_srjg25_696dded1_singlestep_L000637_642

' Catalina Code

DAT ' code segment
C_srjg25_696dded1_singlestep_L000637_642
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgf_696dded1_restartcollection_L000121 ' CALL addrg
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
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_643
 mov r22, r21
 adds r22, #80 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_srjg25_696dded1_singlestep_L000637_644 ' NEU4
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
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_644
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjgq_696dded1_propagatemark_L000324 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_646
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1_696dded1_atomic_L000015 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg2_696dded1_entersweep_L000016 ' CALL addrg
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
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_647
 mov r2, r21
 adds r2, #76 ' ADDP4 coni
 mov r3, #4 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg24_696dded1_sweepstep_L000633
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_648
 mov r2, r21
 adds r2, #100 ' ADDP4 coni
 mov r3, #5 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg24_696dded1_sweepstep_L000633
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_649
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, #6 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg24_696dded1_sweepstep_L000633
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_650
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg17_696dded1_checkS_izes_L000447
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
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_651
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_srjg25_696dded1_singlestep_L000637_652 ' EQU4
 mov r22, r21
 adds r22, #63 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_srjg25_696dded1_singlestep_L000637_652 ' NEI4
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
 long @C_srjg1c_696dded1_runafewfinalizers_L000469
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
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_652
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
 long @C_srjg25_696dded1_singlestep_L000637_640 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_639
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_srjg25_696dded1_singlestep_L000637_638 ' JUMPV addrg
C_srjg25_696dded1_singlestep_L000637_640
 mov r22, r21
 adds r22, #59 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 regl
C_srjg25_696dded1_singlestep_L000637_638
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
 long @C_luaC__runtilstate_659 ' JUMPV addrg
C_luaC__runtilstate_658
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg25_696dded1_singlestep_L000637 ' CALL addrg
C_luaC__runtilstate_659
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
 long @C_luaC__runtilstate_658 ' EQI4
' C_luaC__runtilstate_657 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg28_696dded1_incstep_L000661 ' <symbol:incstep>
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
 long @C_srjg28_696dded1_incstep_L000661_664 ' GTU4
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
 long @C_srjg28_696dded1_incstep_L000661_665 ' JUMPV addrg
C_srjg28_696dded1_incstep_L000661_664
 jmp #LODL
 long $7fffffff
 mov r13, RI ' reg <- con
C_srjg28_696dded1_incstep_L000661_665
 mov r17, r13 ' CVI, CVU or LOAD
C_srjg28_696dded1_incstep_L000661_666
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg25_696dded1_singlestep_L000637 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, r11 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
' C_srjg28_696dded1_incstep_L000661_667 ' (symbol refcount = 0)
 neg r22, r17 ' NEGI4
 cmps r19, r22 wz,wc
 jmp #BRBE
 long @C_srjg28_696dded1_incstep_L000661_669 ' LEI4
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_srjg28_696dded1_incstep_L000661_666 ' NEI4
C_srjg28_696dded1_incstep_L000661_669
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #8 wz
 jmp #BRNZ
 long @C_srjg28_696dded1_incstep_L000661_670 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg1i_696dded1_setpause_L000520 ' CALL addrg
 jmp #JMPA
 long @C_srjg28_696dded1_incstep_L000661_671 ' JUMPV addrg
C_srjg28_696dded1_incstep_L000661_670
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
C_srjg28_696dded1_incstep_L000661_671
' C_srjg28_696dded1_incstep_L000661_662 ' (symbol refcount = 0)
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
 jmp #BR_Z
 long @C_luaC__step_673 ' EQI4
 jmp #LODL
 long -2000
 mov r2, RI ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaC__step_674 ' JUMPV addrg
C_luaC__step_673
 mov r22, r21
 adds r22, #58 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_luaC__step_677 ' EQI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaC__step_675 ' EQU4
C_luaC__step_677
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg22_696dded1_genstep_L000613
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaC__step_676 ' JUMPV addrg
C_luaC__step_675
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg28_696dded1_incstep_L000661
 add SP, #4 ' CALL addrg
C_luaC__step_676
C_luaC__step_674
' C_luaC__step_672 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_srjg29_696dded1_fullinc_L000678 ' <symbol:fullinc>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
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
 long @C_srjg29_696dded1_fullinc_L000678_680 ' GTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srjg2_696dded1_entersweep_L000016 ' CALL addrg
C_srjg29_696dded1_fullinc_L000678_680
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
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
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
 long @C_srjg1i_696dded1_setpause_L000520 ' CALL addrg
' C_srjg29_696dded1_fullinc_L000678_679 ' (symbol refcount = 0)
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
 long @C_luaC__fullgc_683 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg29_696dded1_fullinc_L000678
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaC__fullgc_684 ' JUMPV addrg
C_luaC__fullgc_683
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_srjg20_696dded1_fullgen_L000605
 add SP, #4 ' CALL addrg
C_luaC__fullgc_684
 mov r22, r19
 adds r22, #63 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaC__fullgc_682 ' (symbol refcount = 0)
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
C_srjg1a_696dded1_G_C_T_M__L000461_467_L000468 ' <symbol:467>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

' Catalina Code

DAT ' code segment
' end
