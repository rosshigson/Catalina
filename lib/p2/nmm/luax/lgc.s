' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s7903_696de099_getgclist_L000017 ' <symbol:getgclist>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdbyte r23, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r23,  #5 wcz
 if_b jmp #\C_s7903_696de099_getgclist_L000017_19 ' LTI4
 cmps r23,  #10 wcz
 if_a jmp #\C_s7903_696de099_getgclist_L000017_28 ' GTI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s7903_696de099_getgclist_L000017_29_L000031-20 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s7903_696de099_getgclist_L000017_29_L000031 ' <symbol:29>
 long @C_s7903_696de099_getgclist_L000017_22
 long @C_s7903_696de099_getgclist_L000017_23
 long @C_s7903_696de099_getgclist_L000017_27
 long @C_s7903_696de099_getgclist_L000017_25
 long @C_s7903_696de099_getgclist_L000017_19
 long @C_s7903_696de099_getgclist_L000017_26

' Catalina Code

DAT ' code segment
C_s7903_696de099_getgclist_L000017_28
 cmps r23,  #38 wz
 if_z jmp #\C_s7903_696de099_getgclist_L000017_24 ' EQI4
 jmp #\@C_s7903_696de099_getgclist_L000017_19 ' JUMPV addrg
C_s7903_696de099_getgclist_L000017_22
 mov r0, r2
 adds r0, #28 ' ADDP4 coni
 jmp #\@C_s7903_696de099_getgclist_L000017_18 ' JUMPV addrg
C_s7903_696de099_getgclist_L000017_23
 mov r0, r2
 adds r0, #8 ' ADDP4 coni
 jmp #\@C_s7903_696de099_getgclist_L000017_18 ' JUMPV addrg
C_s7903_696de099_getgclist_L000017_24
 mov r0, r2
 adds r0, #8 ' ADDP4 coni
 jmp #\@C_s7903_696de099_getgclist_L000017_18 ' JUMPV addrg
C_s7903_696de099_getgclist_L000017_25
 mov r0, r2
 adds r0, #40 ' ADDP4 coni
 jmp #\@C_s7903_696de099_getgclist_L000017_18 ' JUMPV addrg
C_s7903_696de099_getgclist_L000017_26
 mov r0, r2
 adds r0, #80 ' ADDP4 coni
 jmp #\@C_s7903_696de099_getgclist_L000017_18 ' JUMPV addrg
C_s7903_696de099_getgclist_L000017_27
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
 jmp #\@C_s7903_696de099_getgclist_L000017_18 ' JUMPV addrg
C_s7903_696de099_getgclist_L000017_19
 mov r0, ##0 ' RET con
C_s7903_696de099_getgclist_L000017_18
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s7906_696de099_linkgclist__L000033 ' <symbol:linkgclist_>
 calld PA,#PSHM
 long $540000 ' save registers
 rdlong r22, r2 ' reg <- INDIRP4 reg
 wrlong r22, r3 ' ASGNP4 reg reg
 wrlong r4, r2 ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffffc7 ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_s7906_696de099_linkgclist__L000033_34 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s7907_696de099_clearkey_L000035 ' <symbol:clearkey>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7907_696de099_clearkey_L000035_37 ' EQI4
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 mov r20, #11 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s7907_696de099_clearkey_L000035_37
' C_s7907_696de099_clearkey_L000035_36 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s7908_696de099_iscleared_L000039 ' <symbol:iscleared>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s7908_696de099_iscleared_L000039_41  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_s7908_696de099_iscleared_L000039_40 ' JUMPV addrg
C_s7908_696de099_iscleared_L000039_41
 mov r22, #4 ' reg <- coni
 mov r20, r21
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #15 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_s7908_696de099_iscleared_L000039_43 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7908_696de099_iscleared_L000039_45 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s7908_696de099_iscleared_L000039_45
 mov r0, #0 ' reg <- coni
 jmp #\@C_s7908_696de099_iscleared_L000039_40 ' JUMPV addrg
C_s7908_696de099_iscleared_L000039_43
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22
 and r0, #24 ' BANDI4 coni
C_s7908_696de099_iscleared_L000039_40
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaC_barrier_

 alignl ' align long
C_luaC__barrier_ ' <symbol:luaC_barrier_>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wcz
 if_a jmp #\C_luaC__barrier__48 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #1 wcz
 if_be jmp #\C_luaC__barrier__49 ' LEI4
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-8 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #2 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaC__barrier__49 ' JUMPV addrg
C_luaC__barrier__48
 mov r22, r17
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaC__barrier__52 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-57 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r17
 adds r18, #56 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #24 ' BANDI4 coni
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaC__barrier__52
C_luaC__barrier__49
' C_luaC__barrier__47 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaC_barrierback_

 alignl ' align long
C_luaC__barrierback_ ' <symbol:luaC_barrierback_>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #6 wz
 if_nz jmp #\C_luaC__barrierback__55 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffffc7 ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaC__barrierback__56 ' JUMPV addrg
C_luaC__barrierback__55
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7903_696de099_getgclist_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r2, r20
 adds r2, #84 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
C_luaC__barrierback__56
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #1 wcz
 if_be jmp #\C_luaC__barrierback__57 ' LEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-8 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #5 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaC__barrierback__57
' C_luaC__barrierback__54 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaC_fix

 alignl ' align long
C_luaC__fix ' <symbol:luaC_fix>
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffffc7 ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-8 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #4 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #68 ' ADDP4 coni
 rdlong r20, r2 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #104 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r2 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #104 ' ADDP4 coni
 wrlong r2, r22 ' ASGNP4 reg reg
' C_luaC__fix_59 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaC_newobjdt

 alignl ' align long
C_luaC__newobjdt ' <symbol:luaC_newobjdt>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r2, r21
 and r2, #15 ' BANDI4 coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r15, r17 ' ADDI/P
 adds r15, r22 ' ADDI/P (3)
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov r20, r13
 adds r20, #56 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r13
 adds r22, #68 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r15 ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #68 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaC__newobjdt_60 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaC_newobj

 alignl ' align long
C_luaC__newobj ' <symbol:luaC_newobj>
 calld PA,#NEWF
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_luaC__newobjdt
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_luaC__newobj_61 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790_696de099_reallymarkobject_L000014 ' <symbol:reallymarkobject>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #20 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_s790_696de099_reallymarkobject_L000014_66 ' EQI4
 cmps r19, r22 wcz
 if_a jmp #\C_s790_696de099_reallymarkobject_L000014_81 ' GTI4
' C_s790_696de099_reallymarkobject_L000014_80 ' (symbol refcount = 0)
 cmps r19,  #4 wcz
 if_b jmp #\C_s790_696de099_reallymarkobject_L000014_64 ' LTI4
 cmps r19,  #10 wcz
 if_a jmp #\C_s790_696de099_reallymarkobject_L000014_64 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s790_696de099_reallymarkobject_L000014_82_L000084-16 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s790_696de099_reallymarkobject_L000014_82_L000084 ' <symbol:82>
 long @C_s790_696de099_reallymarkobject_L000014_66
 long @C_s790_696de099_reallymarkobject_L000014_79
 long @C_s790_696de099_reallymarkobject_L000014_79
 long @C_s790_696de099_reallymarkobject_L000014_72
 long @C_s790_696de099_reallymarkobject_L000014_79
 long @C_s790_696de099_reallymarkobject_L000014_67
 long @C_s790_696de099_reallymarkobject_L000014_79

' Catalina Code

DAT ' code segment
C_s790_696de099_reallymarkobject_L000014_81
 cmps r19,  #38 wz
 if_z jmp #\C_s790_696de099_reallymarkobject_L000014_79 ' EQI4
 jmp #\@C_s790_696de099_reallymarkobject_L000014_64 ' JUMPV addrg
C_s790_696de099_reallymarkobject_L000014_66
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-25 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s790_696de099_reallymarkobject_L000014_64 ' JUMPV addrg
C_s790_696de099_reallymarkobject_L000014_67
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 cmp r20, r22 wz
 if_z jmp #\C_s790_696de099_reallymarkobject_L000014_68 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffffc7 ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s790_696de099_reallymarkobject_L000014_69 ' JUMPV addrg
C_s790_696de099_reallymarkobject_L000014_68
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-25 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s790_696de099_reallymarkobject_L000014_69
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_s790_696de099_reallymarkobject_L000014_64 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_s790_696de099_reallymarkobject_L000014_64 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
 jmp #\@C_s790_696de099_reallymarkobject_L000014_64 ' JUMPV addrg
C_s790_696de099_reallymarkobject_L000014_72
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s790_696de099_reallymarkobject_L000014_73 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790_696de099_reallymarkobject_L000014_75 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790_696de099_reallymarkobject_L000014_77 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790_696de099_reallymarkobject_L000014_77
C_s790_696de099_reallymarkobject_L000014_75
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-25 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s790_696de099_reallymarkobject_L000014_64 ' JUMPV addrg
C_s790_696de099_reallymarkobject_L000014_73
C_s790_696de099_reallymarkobject_L000014_79
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7903_696de099_getgclist_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23
 adds r2, #80 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
C_s790_696de099_reallymarkobject_L000014_64
' C_s790_696de099_reallymarkobject_L000014_62 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s790b_696de099_markmt_L000086 ' <symbol:markmt>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
C_s790b_696de099_markmt_L000086_88
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790b_696de099_markmt_L000086_92 ' EQU4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790b_696de099_markmt_L000086_94 ' EQI4
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r23
 adds r20, #252 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790b_696de099_markmt_L000086_94
C_s790b_696de099_markmt_L000086_92
' C_s790b_696de099_markmt_L000086_89 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #9 wcz
 if_b jmp #\C_s790b_696de099_markmt_L000086_88 ' LTI4
' C_s790b_696de099_markmt_L000086_87 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790c_696de099_markbeingfnz_L000096 ' <symbol:markbeingfnz>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s790c_696de099_markbeingfnz_L000096_101 ' JUMPV addrg
C_s790c_696de099_markbeingfnz_L000096_98
 add r19, #1 ' ADDU4 coni
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790c_696de099_markbeingfnz_L000096_102 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790c_696de099_markbeingfnz_L000096_102
' C_s790c_696de099_markbeingfnz_L000096_99 ' (symbol refcount = 0)
 rdlong r21, r21 ' reg <- INDIRP4 reg
C_s790c_696de099_markbeingfnz_L000096_101
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s790c_696de099_markbeingfnz_L000096_98  ' NEU4
 mov r0, r19 ' CVI, CVU or LOAD
' C_s790c_696de099_markbeingfnz_L000096_97 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790d_696de099_remarkupvals_L000104 ' <symbol:remarkupvals>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r17, r23
 adds r17, #136 ' ADDP4 coni
 mov r21, #0 ' reg <- coni
 jmp #\@C_s790d_696de099_remarkupvals_L000104_107 ' JUMPV addrg
C_s790d_696de099_remarkupvals_L000104_106
 adds r21, #1 ' ADDI4 coni
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s790d_696de099_remarkupvals_L000104_109 ' NEI4
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790d_696de099_remarkupvals_L000104_109 ' EQU4
 mov r17, r19
 adds r17, #44 ' ADDP4 coni
 jmp #\@C_s790d_696de099_remarkupvals_L000104_110 ' JUMPV addrg
C_s790d_696de099_remarkupvals_L000104_109
 mov r22, r19
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #44 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #32 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s790d_696de099_remarkupvals_L000104_114 ' JUMPV addrg
C_s790d_696de099_remarkupvals_L000104_111
 adds r21, #1 ' ADDI4 coni
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s790d_696de099_remarkupvals_L000104_115 ' NEI4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_s790d_696de099_remarkupvals_L000104_117 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_s790d_696de099_remarkupvals_L000104_117 ' EQI4
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790d_696de099_remarkupvals_L000104_117
C_s790d_696de099_remarkupvals_L000104_115
' C_s790d_696de099_remarkupvals_L000104_112 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
C_s790d_696de099_remarkupvals_L000104_114
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s790d_696de099_remarkupvals_L000104_111  ' NEU4
C_s790d_696de099_remarkupvals_L000104_110
C_s790d_696de099_remarkupvals_L000104_107
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s790d_696de099_remarkupvals_L000104_106  ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_s790d_696de099_remarkupvals_L000104_105 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790e_696de099_cleargraylists_L000119 ' <symbol:cleargraylists>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##0 ' reg <- con
 mov r20, r2
 adds r20, #84 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r2
 adds r20, #80 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, ##0 ' reg <- con
 mov r20, r2
 adds r20, #92 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r2
 adds r20, #96 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r2
 adds r20, #88 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
' C_s790e_696de099_cleargraylists_L000119_120 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s790f_696de099_restartcollection_L000121 ' <symbol:restartcollection>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790e_696de099_cleargraylists_L000119 ' CALL addrg
 mov r22, r23
 adds r22, #144 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790f_696de099_restartcollection_L000121_123 ' EQI4
 mov r22, r23
 adds r22, #144 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790f_696de099_restartcollection_L000121_123
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790f_696de099_restartcollection_L000121_125 ' EQI4
 mov r20, r23
 adds r20, #36 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790f_696de099_restartcollection_L000121_125 ' EQI4
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790f_696de099_restartcollection_L000121_125
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790b_696de099_markmt_L000086 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790c_696de099_markbeingfnz_L000096 ' CALL addrg
' C_s790f_696de099_restartcollection_L000121_122 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790g_696de099_genlink_L000127 ' <symbol:genlink>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #5 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #7 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_s790g_696de099_genlink_L000127_129 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7903_696de099_getgclist_L000017 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #\@C_s790g_696de099_genlink_L000127_130 ' JUMPV addrg
C_s790g_696de099_genlink_L000127_129
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #6 wz
 if_nz jmp #\C_s790g_696de099_genlink_L000127_131 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 xor r20, #2 ' BXORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s790g_696de099_genlink_L000127_131
C_s790g_696de099_genlink_L000127_130
' C_s790g_696de099_genlink_L000127_128 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790h_696de099_traverseweakvalue_L000133 ' <symbol:traverseweakvalue>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790h_696de099_traverseweakvalue_L000133_136 ' EQU4
 mov r13, #1 ' reg <- coni
 jmp #\@C_s790h_696de099_traverseweakvalue_L000133_137 ' JUMPV addrg
C_s790h_696de099_traverseweakvalue_L000133_136
 mov r13, #0 ' reg <- coni
C_s790h_696de099_traverseweakvalue_L000133_137
 mov r15, r13 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s790h_696de099_traverseweakvalue_L000133_141 ' JUMPV addrg
C_s790h_696de099_traverseweakvalue_L000133_138
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s790h_696de099_traverseweakvalue_L000133_142 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7907_696de099_clearkey_L000035 ' CALL addrg
 jmp #\@C_s790h_696de099_traverseweakvalue_L000133_143 ' JUMPV addrg
C_s790h_696de099_traverseweakvalue_L000133_142
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790h_696de099_traverseweakvalue_L000133_144 ' EQI4
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790h_696de099_traverseweakvalue_L000133_144 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790h_696de099_traverseweakvalue_L000133_144
 mov r22, #0 ' reg <- coni
 cmps r15, r22 wz
 if_nz jmp #\C_s790h_696de099_traverseweakvalue_L000133_146 ' NEI4
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790h_696de099_traverseweakvalue_L000133_149 ' EQI4
 rdlong r11, r19 ' reg <- INDIRP4 reg
 jmp #\@C_s790h_696de099_traverseweakvalue_L000133_150 ' JUMPV addrg
C_s790h_696de099_traverseweakvalue_L000133_149
 mov r11, ##0 ' reg <- con
C_s790h_696de099_traverseweakvalue_L000133_150
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7908_696de099_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s790h_696de099_traverseweakvalue_L000133_146 ' EQI4
 mov r15, #1 ' reg <- coni
C_s790h_696de099_traverseweakvalue_L000133_146
C_s790h_696de099_traverseweakvalue_L000133_143
' C_s790h_696de099_traverseweakvalue_L000133_139 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_s790h_696de099_traverseweakvalue_L000133_141
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_s790h_696de099_traverseweakvalue_L000133_138 ' LTU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_s790h_696de099_traverseweakvalue_L000133_151 ' NEI4
 cmps r15,  #0 wz
 if_z jmp #\C_s790h_696de099_traverseweakvalue_L000133_151 ' EQI4
 mov r2, r23
 adds r2, #88 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #\@C_s790h_696de099_traverseweakvalue_L000133_152 ' JUMPV addrg
C_s790h_696de099_traverseweakvalue_L000133_151
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
C_s790h_696de099_traverseweakvalue_L000133_152
' C_s790h_696de099_traverseweakvalue_L000133_134 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790i_696de099_traverseephemeron_L000153 ' <symbol:traverseephemeron>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
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
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 mov r15, r22 ' CVI, CVU or LOAD
 mov r17, #0 ' reg <- coni
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_158 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_155
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_159 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_159 ' EQI4
 mov r11, #1 ' reg <- coni
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790i_696de099_traverseephemeron_L000153_159
' C_s790i_696de099_traverseephemeron_L000153_156 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_s790i_696de099_traverseephemeron_L000153_158
 cmp r17, r13 wcz 
 if_b jmp #\C_s790i_696de099_traverseephemeron_L000153_155 ' LTU4
 mov r17, #0 ' reg <- coni
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_164 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_161
 cmps r19,  #0 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_166 ' EQI4
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 sub r22, r17 ' SUBU (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_167 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_166
 mov r22, r17
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
C_s790i_696de099_traverseephemeron_L000153_167
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r7, r22 ' reg <- INDIRP4 reg
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s790i_696de099_traverseephemeron_L000153_168 ' NEI4
 mov r2, r7 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7907_696de099_clearkey_L000035 ' CALL addrg
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_169 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_168
 mov r22, r7
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_173 ' EQI4
 mov r22, r7
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_174 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_173
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
C_s790i_696de099_traverseephemeron_L000153_174
 mov RI, FP
 sub RI, #-(-16)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7908_696de099_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_170 ' EQI4
 mov r9, #1 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_171 ' EQI4
 rdlong r20, r7 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_171 ' EQI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_171 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_170
 mov r22, #0 ' reg <- coni
 mov r20, r7
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_177 ' EQI4
 rdlong r20, r7 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_177 ' EQI4
 mov r11, #1 ' reg <- coni
 rdlong r2, r7 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790i_696de099_traverseephemeron_L000153_177
C_s790i_696de099_traverseephemeron_L000153_171
C_s790i_696de099_traverseephemeron_L000153_169
' C_s790i_696de099_traverseephemeron_L000153_162 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_s790i_696de099_traverseephemeron_L000153_164
 cmp r17, r15 wcz 
 if_b jmp #\C_s790i_696de099_traverseephemeron_L000153_161 ' LTU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s790i_696de099_traverseephemeron_L000153_179 ' NEI4
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_180 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_179
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_181 ' EQI4
 mov r2, r23
 adds r2, #92 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_182 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_181
 cmps r9,  #0 wz
 if_z jmp #\C_s790i_696de099_traverseephemeron_L000153_183 ' EQI4
 mov r2, r23
 adds r2, #96 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #\@C_s790i_696de099_traverseephemeron_L000153_184 ' JUMPV addrg
C_s790i_696de099_traverseephemeron_L000153_183
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790g_696de099_genlink_L000127
 add SP, #4 ' CALL addrg
C_s790i_696de099_traverseephemeron_L000153_184
C_s790i_696de099_traverseephemeron_L000153_182
C_s790i_696de099_traverseephemeron_L000153_180
 mov r0, r11 ' CVI, CVU or LOAD
' C_s790i_696de099_traverseephemeron_L000153_154 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s790j_696de099_traversestrongtable_L000185 ' <symbol:traversestrongtable>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r15, r22 ' ADDI/P
 adds r15, r20 ' ADDI/P (3)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r17, #0 ' reg <- coni
 jmp #\@C_s790j_696de099_traversestrongtable_L000185_190 ' JUMPV addrg
C_s790j_696de099_traversestrongtable_L000185_187
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_s790j_696de099_traversestrongtable_L000185_191 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_s790j_696de099_traversestrongtable_L000185_191 ' EQI4
 mov r22, r17
 shl r22, #3 ' LSHU4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790j_696de099_traversestrongtable_L000185_191
' C_s790j_696de099_traversestrongtable_L000185_188 ' (symbol refcount = 0)
 add r17, #1 ' ADDU4 coni
C_s790j_696de099_traversestrongtable_L000185_190
 cmp r17, r13 wcz 
 if_b jmp #\C_s790j_696de099_traversestrongtable_L000185_187 ' LTU4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s790j_696de099_traversestrongtable_L000185_196 ' JUMPV addrg
C_s790j_696de099_traversestrongtable_L000185_193
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s790j_696de099_traversestrongtable_L000185_197 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7907_696de099_clearkey_L000035 ' CALL addrg
 jmp #\@C_s790j_696de099_traversestrongtable_L000185_198 ' JUMPV addrg
C_s790j_696de099_traversestrongtable_L000185_197
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790j_696de099_traversestrongtable_L000185_199 ' EQI4
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790j_696de099_traversestrongtable_L000185_199 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790j_696de099_traversestrongtable_L000185_199
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790j_696de099_traversestrongtable_L000185_201 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790j_696de099_traversestrongtable_L000185_201 ' EQI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790j_696de099_traversestrongtable_L000185_201
C_s790j_696de099_traversestrongtable_L000185_198
' C_s790j_696de099_traversestrongtable_L000185_194 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_s790j_696de099_traversestrongtable_L000185_196
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r15 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_s790j_696de099_traversestrongtable_L000185_193 ' LTU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790g_696de099_genlink_L000127
 add SP, #4 ' CALL addrg
' C_s790j_696de099_traversestrongtable_L000185_186 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790k_696de099_traversetable_L000203 ' <symbol:traversetable>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s790k_696de099_traversetable_L000203_207  ' NEU4
 mov r15, ##0 ' reg <- con
 jmp #\@C_s790k_696de099_traversetable_L000203_208 ' JUMPV addrg
C_s790k_696de099_traversetable_L000203_207
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_s790k_696de099_traversetable_L000203_209 ' EQU4
 mov r13, ##0 ' reg <- con
 jmp #\@C_s790k_696de099_traversetable_L000203_210 ' JUMPV addrg
C_s790k_696de099_traversetable_L000203_209
 mov r22, r23
 adds r22, #164 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #3 ' reg ARG coni
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_s790k_696de099_traversetable_L000203_210
 mov r15, r13 ' CVI, CVU or LOAD
C_s790k_696de099_traversetable_L000203_208
 mov r19, r15 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790k_696de099_traversetable_L000203_211 ' EQU4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790k_696de099_traversetable_L000203_213 ' EQI4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790k_696de099_traversetable_L000203_213
C_s790k_696de099_traversetable_L000203_211
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s790k_696de099_traversetable_L000203_215 ' EQU4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #68 wz
 if_nz jmp #\C_s790k_696de099_traversetable_L000203_215 ' NEI4
 rdlong r17, r19 ' reg <- INDIRP4 reg
 mov r2, #107 ' reg ARG coni
 mov r3, r17
 adds r3, #16 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
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
 calld PA,#CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_nz jmp #\C_s790k_696de099_traversetable_L000203_217  ' NEU4
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r20, r22 wz
 if_z jmp #\C_s790k_696de099_traversetable_L000203_215 ' EQU4
C_s790k_696de099_traversetable_L000203_217
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s790k_696de099_traversetable_L000203_218  ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790h_696de099_traverseweakvalue_L000133
 add SP, #4 ' CALL addrg
 jmp #\@C_s790k_696de099_traversetable_L000203_216 ' JUMPV addrg
C_s790k_696de099_traversetable_L000203_218
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s790k_696de099_traversetable_L000203_220  ' NEU4
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790i_696de099_traverseephemeron_L000153
 add SP, #8 ' CALL addrg
 jmp #\@C_s790k_696de099_traversetable_L000203_216 ' JUMPV addrg
C_s790k_696de099_traversetable_L000203_220
 mov r2, r23
 adds r2, #96 ' ADDP4 coni
 mov r3, r21
 adds r3, #28 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #\@C_s790k_696de099_traversetable_L000203_216 ' JUMPV addrg
C_s790k_696de099_traversetable_L000203_215
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790j_696de099_traversestrongtable_L000185
 add SP, #4 ' CALL addrg
C_s790k_696de099_traversetable_L000203_216
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s790k_696de099_traversetable_L000203_223  ' NEU4
 mov r11, #0 ' reg <- coni
 jmp #\@C_s790k_696de099_traversetable_L000203_224 ' JUMPV addrg
C_s790k_696de099_traversetable_L000203_223
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r11, r22 ' LSHI/U
 shl r11, r20 ' LSHI/U (3)
C_s790k_696de099_traversetable_L000203_224
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 mov r20, r11
 shl r20, #1 ' LSHI4 coni
 mov r0, r22 ' ADDU
 add r0, r20 ' ADDU (3)
' C_s790k_696de099_traversetable_L000203_204 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s790l_696de099_traverseudata_L000225 ' <symbol:traverseudata>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790l_696de099_traverseudata_L000225_227 ' EQU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790l_696de099_traverseudata_L000225_229 ' EQI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790l_696de099_traverseudata_L000225_229
C_s790l_696de099_traverseudata_L000225_227
 mov r19, #0 ' reg <- coni
 jmp #\@C_s790l_696de099_traverseudata_L000225_234 ' JUMPV addrg
C_s790l_696de099_traverseudata_L000225_231
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_s790l_696de099_traverseudata_L000225_235 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_s790l_696de099_traverseudata_L000225_235 ' EQI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790l_696de099_traverseudata_L000225_235
' C_s790l_696de099_traverseudata_L000225_232 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s790l_696de099_traverseudata_L000225_234
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r19, r22 wcz
 if_b jmp #\C_s790l_696de099_traverseudata_L000225_231 ' LTI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790g_696de099_genlink_L000127
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_s790l_696de099_traverseudata_L000225_226 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790m_696de099_traverseproto_L000237 ' <symbol:traverseproto>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_239 ' EQU4
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_241 ' EQI4
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790m_696de099_traverseproto_L000237_241
C_s790m_696de099_traverseproto_L000237_239
 mov r19, #0 ' reg <- coni
 jmp #\@C_s790m_696de099_traverseproto_L000237_246 ' JUMPV addrg
C_s790m_696de099_traverseproto_L000237_243
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_247 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_247 ' EQI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790m_696de099_traverseproto_L000237_247
' C_s790m_696de099_traverseproto_L000237_244 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s790m_696de099_traverseproto_L000237_246
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wcz
 if_b jmp #\C_s790m_696de099_traverseproto_L000237_243 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_s790m_696de099_traverseproto_L000237_252 ' JUMPV addrg
C_s790m_696de099_traverseproto_L000237_249
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_253 ' EQU4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_255 ' EQI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790m_696de099_traverseproto_L000237_255
C_s790m_696de099_traverseproto_L000237_253
' C_s790m_696de099_traverseproto_L000237_250 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s790m_696de099_traverseproto_L000237_252
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wcz
 if_b jmp #\C_s790m_696de099_traverseproto_L000237_249 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_s790m_696de099_traverseproto_L000237_260 ' JUMPV addrg
C_s790m_696de099_traverseproto_L000237_257
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_261 ' EQU4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_263 ' EQI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790m_696de099_traverseproto_L000237_263
C_s790m_696de099_traverseproto_L000237_261
' C_s790m_696de099_traverseproto_L000237_258 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s790m_696de099_traverseproto_L000237_260
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wcz
 if_b jmp #\C_s790m_696de099_traverseproto_L000237_257 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_s790m_696de099_traverseproto_L000237_268 ' JUMPV addrg
C_s790m_696de099_traverseproto_L000237_265
 mov r22, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_269 ' EQU4
 mov r22, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790m_696de099_traverseproto_L000237_271 ' EQI4
 mov r22, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790m_696de099_traverseproto_L000237_271
C_s790m_696de099_traverseproto_L000237_269
' C_s790m_696de099_traverseproto_L000237_266 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s790m_696de099_traverseproto_L000237_268
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r19, r22 wcz
 if_b jmp #\C_s790m_696de099_traverseproto_L000237_265 ' LTI4
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, r21
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' ADDI/P
 adds r0, r20 ' ADDI/P (3)
' C_s790m_696de099_traverseproto_L000237_238 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790n_696de099_traverseC_closure_L000273 ' <symbol:traverseCclosure>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #\@C_s790n_696de099_traverseC_closure_L000273_278 ' JUMPV addrg
C_s790n_696de099_traverseC_closure_L000273_275
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 mov r18, r22
 adds r18, #4 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #64 ' BANDI4 coni
 cmps r18, r20 wz
 if_z jmp #\C_s790n_696de099_traverseC_closure_L000273_279 ' EQI4
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22, r20 wz
 if_z jmp #\C_s790n_696de099_traverseC_closure_L000273_279 ' EQI4
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790n_696de099_traverseC_closure_L000273_279
' C_s790n_696de099_traverseC_closure_L000273_276 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s790n_696de099_traverseC_closure_L000273_278
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19, r22 wcz
 if_b jmp #\C_s790n_696de099_traverseC_closure_L000273_275 ' LTI4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_s790n_696de099_traverseC_closure_L000273_274 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790o_696de099_traverseL_closure_L000281 ' <symbol:traverseLclosure>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790o_696de099_traverseL_closure_L000281_283 ' EQU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790o_696de099_traverseL_closure_L000281_285 ' EQI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790o_696de099_traverseL_closure_L000281_285
C_s790o_696de099_traverseL_closure_L000281_283
 mov r19, #0 ' reg <- coni
 jmp #\@C_s790o_696de099_traverseL_closure_L000281_290 ' JUMPV addrg
C_s790o_696de099_traverseL_closure_L000281_287
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s790o_696de099_traverseL_closure_L000281_291 ' EQU4
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790o_696de099_traverseL_closure_L000281_293 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790o_696de099_traverseL_closure_L000281_293
C_s790o_696de099_traverseL_closure_L000281_291
' C_s790o_696de099_traverseL_closure_L000281_288 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s790o_696de099_traverseL_closure_L000281_290
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19, r22 wcz
 if_b jmp #\C_s790o_696de099_traverseL_closure_L000281_287 ' LTI4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22
 adds r0, #1 ' ADDI4 coni
' C_s790o_696de099_traverseL_closure_L000281_282 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790p_696de099_traversethread_L000295 ' <symbol:traversethread>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #1 wcz
 if_a jmp #\C_s790p_696de099_traversethread_L000295_299 ' GTI4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s790p_696de099_traversethread_L000295_297 ' NEI4
C_s790p_696de099_traversethread_L000295_299
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov r3, r21
 adds r3, #40 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
C_s790p_696de099_traversethread_L000295_297
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s790p_696de099_traversethread_L000295_305  ' NEU4
 mov r0, #1 ' reg <- coni
 jmp #\@C_s790p_696de099_traversethread_L000295_296 ' JUMPV addrg
C_s790p_696de099_traversethread_L000295_302
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790p_696de099_traversethread_L000295_306 ' EQI4
 rdlong r20, r19 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s790p_696de099_traversethread_L000295_306 ' EQI4
 rdlong r2, r19 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790p_696de099_traversethread_L000295_306
' C_s790p_696de099_traversethread_L000295_303 ' (symbol refcount = 0)
 adds r19, #8 ' ADDP4 coni
C_s790p_696de099_traversethread_L000295_305
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_b jmp #\C_s790p_696de099_traversethread_L000295_302 ' LTU4
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s790p_696de099_traversethread_L000295_311 ' JUMPV addrg
C_s790p_696de099_traversethread_L000295_308
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790p_696de099_traversethread_L000295_312 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s790p_696de099_traversethread_L000295_312
' C_s790p_696de099_traversethread_L000295_309 ' (symbol refcount = 0)
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
C_s790p_696de099_traversethread_L000295_311
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s790p_696de099_traversethread_L000295_308  ' NEU4
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_s790p_696de099_traversethread_L000295_314 ' NEI4
 mov r22, r23
 adds r22, #63 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s790p_696de099_traversethread_L000295_316 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaD__shrinkstack ' CALL addrg
C_s790p_696de099_traversethread_L000295_316
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s790p_696de099_traversethread_L000295_321 ' JUMPV addrg
C_s790p_696de099_traversethread_L000295_318
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_s790p_696de099_traversethread_L000295_319 ' (symbol refcount = 0)
 adds r19, #8 ' ADDP4 coni
C_s790p_696de099_traversethread_L000295_321
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #40 ' ADDP4 coni
 cmp r22, r20 wcz 
 if_b jmp #\C_s790p_696de099_traversethread_L000295_318 ' LTU4
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_s790p_696de099_traversethread_L000295_322  ' NEU4
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s790p_696de099_traversethread_L000295_322 ' EQU4
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 mov r20, r23
 adds r20, #136 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #136 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
C_s790p_696de099_traversethread_L000295_322
C_s790p_696de099_traversethread_L000295_314
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 adds r0, #1 ' ADDI4 coni
C_s790p_696de099_traversethread_L000295_296
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790q_696de099_propagatemark_L000324 ' <symbol:propagatemark>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #80 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7903_696de099_getgclist_L000017 ' CALL addrg
 mov r20, r23
 adds r20, #80 ' ADDP4 coni
 rdlong r22, r0 ' reg <- INDIRP4 reg
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19,  #5 wcz
 if_b jmp #\C_s790q_696de099_propagatemark_L000324_326 ' LTI4
 cmps r19,  #10 wcz
 if_a jmp #\C_s790q_696de099_propagatemark_L000324_335 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s790q_696de099_propagatemark_L000324_336_L000338-20 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s790q_696de099_propagatemark_L000324_336_L000338 ' <symbol:336>
 long @C_s790q_696de099_propagatemark_L000324_329
 long @C_s790q_696de099_propagatemark_L000324_331
 long @C_s790q_696de099_propagatemark_L000324_330
 long @C_s790q_696de099_propagatemark_L000324_334
 long @C_s790q_696de099_propagatemark_L000324_326
 long @C_s790q_696de099_propagatemark_L000324_333

' Catalina Code

DAT ' code segment
C_s790q_696de099_propagatemark_L000324_335
 cmps r19,  #38 wz
 if_z jmp #\C_s790q_696de099_propagatemark_L000324_332 ' EQI4
 jmp #\@C_s790q_696de099_propagatemark_L000324_326 ' JUMPV addrg
C_s790q_696de099_propagatemark_L000324_329
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790k_696de099_traversetable_L000203
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s790q_696de099_propagatemark_L000324_325 ' JUMPV addrg
C_s790q_696de099_propagatemark_L000324_330
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790l_696de099_traverseudata_L000225
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s790q_696de099_propagatemark_L000324_325 ' JUMPV addrg
C_s790q_696de099_propagatemark_L000324_331
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790o_696de099_traverseL_closure_L000281
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s790q_696de099_propagatemark_L000324_325 ' JUMPV addrg
C_s790q_696de099_propagatemark_L000324_332
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790n_696de099_traverseC_closure_L000273
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s790q_696de099_propagatemark_L000324_325 ' JUMPV addrg
C_s790q_696de099_propagatemark_L000324_333
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790m_696de099_traverseproto_L000237
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s790q_696de099_propagatemark_L000324_325 ' JUMPV addrg
C_s790q_696de099_propagatemark_L000324_334
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790p_696de099_traversethread_L000295
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_s790q_696de099_propagatemark_L000324_325 ' JUMPV addrg
C_s790q_696de099_propagatemark_L000324_326
 mov r0, #0 ' reg <- coni
C_s790q_696de099_propagatemark_L000324_325
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790t_696de099_propagateall_L000340 ' <symbol:propagateall>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
 jmp #\@C_s790t_696de099_propagateall_L000340_343 ' JUMPV addrg
C_s790t_696de099_propagateall_L000340_342
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790q_696de099_propagatemark_L000324 ' CALL addrg
 add r21, r0 ' ADDU (1)
C_s790t_696de099_propagateall_L000340_343
 mov r22, r23
 adds r22, #80 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s790t_696de099_propagateall_L000340_342  ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_s790t_696de099_propagateall_L000340_341 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790u_696de099_convergeephemerons_L000345 ' <symbol:convergeephemerons>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, #0 ' reg <- coni
C_s790u_696de099_convergeephemerons_L000345_347
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #\@C_s790u_696de099_convergeephemerons_L000345_351 ' JUMPV addrg
C_s790u_696de099_convergeephemerons_L000345_350
 mov r13, r15 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #28 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r13
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790i_696de099_traverseephemeron_L000153
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s790u_696de099_convergeephemerons_L000345_353 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790t_696de099_propagateall_L000340 ' CALL addrg
 mov r19, #1 ' reg <- coni
C_s790u_696de099_convergeephemerons_L000345_353
C_s790u_696de099_convergeephemerons_L000345_351
 mov r15, r17 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s790u_696de099_convergeephemerons_L000345_350  ' NEU4
 cmps r21,  #0 wz
 if_nz jmp #\C_s790u_696de099_convergeephemerons_L000345_356 ' NEI4
 mov r13, #1 ' reg <- coni
 jmp #\@C_s790u_696de099_convergeephemerons_L000345_357 ' JUMPV addrg
C_s790u_696de099_convergeephemerons_L000345_356
 mov r13, #0 ' reg <- coni
C_s790u_696de099_convergeephemerons_L000345_357
 mov r21, r13 ' CVI, CVU or LOAD
' C_s790u_696de099_convergeephemerons_L000345_348 ' (symbol refcount = 0)
 cmps r19,  #0 wz
 if_nz jmp #\C_s790u_696de099_convergeephemerons_L000345_347 ' NEI4
' C_s790u_696de099_convergeephemerons_L000345_346 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s790v_696de099_clearbykeys_L000358 ' <symbol:clearbykeys>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_s790v_696de099_clearbykeys_L000358_363 ' JUMPV addrg
C_s790v_696de099_clearbykeys_L000358_360
 mov r15, r21 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r20, r15
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r15
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s790v_696de099_clearbykeys_L000358_367 ' JUMPV addrg
C_s790v_696de099_clearbykeys_L000358_364
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s790v_696de099_clearbykeys_L000358_371 ' EQI4
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s790v_696de099_clearbykeys_L000358_372 ' JUMPV addrg
C_s790v_696de099_clearbykeys_L000358_371
 mov r13, ##0 ' reg <- con
C_s790v_696de099_clearbykeys_L000358_372
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7908_696de099_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s790v_696de099_clearbykeys_L000358_368 ' EQI4
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s790v_696de099_clearbykeys_L000358_368
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s790v_696de099_clearbykeys_L000358_373 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7907_696de099_clearkey_L000035 ' CALL addrg
C_s790v_696de099_clearbykeys_L000358_373
' C_s790v_696de099_clearbykeys_L000358_365 ' (symbol refcount = 0)
 adds r19, #16 ' ADDP4 coni
C_s790v_696de099_clearbykeys_L000358_367
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_s790v_696de099_clearbykeys_L000358_364 ' LTU4
' C_s790v_696de099_clearbykeys_L000358_361 ' (symbol refcount = 0)
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
C_s790v_696de099_clearbykeys_L000358_363
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s790v_696de099_clearbykeys_L000358_360  ' NEU4
' C_s790v_696de099_clearbykeys_L000358_359 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s79010_696de099_clearbyvalues_L000375 ' <symbol:clearbyvalues>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #\@C_s79010_696de099_clearbyvalues_L000375_380 ' JUMPV addrg
C_s79010_696de099_clearbyvalues_L000375_377
 mov r13, r21 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r20, r13
 adds r20, #7 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 shl r22, #4 ' LSHU4 coni
 mov r20, r13
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r2, r13 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaH__realasize ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r15, #0 ' reg <- coni
 jmp #\@C_s79010_696de099_clearbyvalues_L000375_384 ' JUMPV addrg
C_s79010_696de099_clearbyvalues_L000375_381
 mov r22, r15
 shl r22, #3 ' LSHU4 coni
 mov r20, r13
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r7, r22 ' ADDI/P
 adds r7, r20 ' ADDI/P (3)
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s79010_696de099_clearbyvalues_L000375_388 ' EQI4
 rdlong r22, r7 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_s79010_696de099_clearbyvalues_L000375_389 ' JUMPV addrg
C_s79010_696de099_clearbyvalues_L000375_388
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
C_s79010_696de099_clearbyvalues_L000375_389
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7908_696de099_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s79010_696de099_clearbyvalues_L000375_385 ' EQI4
 mov r22, r7
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s79010_696de099_clearbyvalues_L000375_385
' C_s79010_696de099_clearbyvalues_L000375_382 ' (symbol refcount = 0)
 add r15, #1 ' ADDU4 coni
C_s79010_696de099_clearbyvalues_L000375_384
 cmp r15, r9 wcz 
 if_b jmp #\C_s79010_696de099_clearbyvalues_L000375_381 ' LTU4
 mov r22, r13
 adds r22, #16 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s79010_696de099_clearbyvalues_L000375_393 ' JUMPV addrg
C_s79010_696de099_clearbyvalues_L000375_390
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s79010_696de099_clearbyvalues_L000375_397 ' EQI4
 rdlong r7, r17 ' reg <- INDIRP4 reg
 jmp #\@C_s79010_696de099_clearbyvalues_L000375_398 ' JUMPV addrg
C_s79010_696de099_clearbyvalues_L000375_397
 mov r7, ##0 ' reg <- con
C_s79010_696de099_clearbyvalues_L000375_398
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7908_696de099_iscleared_L000039
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s79010_696de099_clearbyvalues_L000375_394 ' EQI4
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, #16 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s79010_696de099_clearbyvalues_L000375_394
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s79010_696de099_clearbyvalues_L000375_399 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7907_696de099_clearkey_L000035 ' CALL addrg
C_s79010_696de099_clearbyvalues_L000375_399
' C_s79010_696de099_clearbyvalues_L000375_391 ' (symbol refcount = 0)
 adds r17, #16 ' ADDP4 coni
C_s79010_696de099_clearbyvalues_L000375_393
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r11 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_b jmp #\C_s79010_696de099_clearbyvalues_L000375_390 ' LTU4
' C_s79010_696de099_clearbyvalues_L000375_378 ' (symbol refcount = 0)
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
C_s79010_696de099_clearbyvalues_L000375_380
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_s79010_696de099_clearbyvalues_L000375_377  ' NEU4
' C_s79010_696de099_clearbyvalues_L000375_376 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s79011_696de099_freeupval_L000401 ' <symbol:freeupval>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_s79011_696de099_freeupval_L000401_403 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaF__unlinkupval ' CALL addrg
C_s79011_696de099_freeupval_L000401_403
 mov r2, #20 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
' C_s79011_696de099_freeupval_L000401_402 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s79012_696de099_freeobj_L000405 ' <symbol:freeobj>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r22, #20 ' reg <- coni
 cmps r19, r22 wz
 if_z jmp #\C_s79012_696de099_freeobj_L000405_421 ' EQI4
 cmps r19, r22 wcz
 if_a jmp #\C_s79012_696de099_freeobj_L000405_423 ' GTI4
' C_s79012_696de099_freeobj_L000405_422 ' (symbol refcount = 0)
 cmps r19,  #4 wcz
 if_b jmp #\C_s79012_696de099_freeobj_L000405_407 ' LTI4
 cmps r19,  #10 wcz
 if_a jmp #\C_s79012_696de099_freeobj_L000405_407 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s79012_696de099_freeobj_L000405_424_L000426-16 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s79012_696de099_freeobj_L000405_424_L000426 ' <symbol:424>
 long @C_s79012_696de099_freeobj_L000405_420
 long @C_s79012_696de099_freeobj_L000405_414
 long @C_s79012_696de099_freeobj_L000405_412
 long @C_s79012_696de099_freeobj_L000405_416
 long @C_s79012_696de099_freeobj_L000405_415
 long @C_s79012_696de099_freeobj_L000405_411
 long @C_s79012_696de099_freeobj_L000405_410

' Catalina Code

DAT ' code segment
C_s79012_696de099_freeobj_L000405_423
 cmps r19,  #38 wz
 if_z jmp #\C_s79012_696de099_freeobj_L000405_413 ' EQI4
 jmp #\@C_s79012_696de099_freeobj_L000405_407 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_410
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__freeproto
 add SP, #4 ' CALL addrg
 jmp #\@C_s79012_696de099_freeobj_L000405_408 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_411
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79011_696de099_freeupval_L000401
 add SP, #4 ' CALL addrg
 jmp #\@C_s79012_696de099_freeobj_L000405_408 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_412
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #6 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #2 ' LSHI4 coni
 adds r20, #16 ' ADDI4 coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 jmp #\@C_s79012_696de099_freeobj_L000405_408 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_413
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #6 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #3 ' LSHI4 coni
 adds r20, #16 ' ADDI4 coni
 mov r2, r20 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 jmp #\@C_s79012_696de099_freeobj_L000405_408 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_414
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaH__free
 add SP, #4 ' CALL addrg
 jmp #\@C_s79012_696de099_freeobj_L000405_408 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_415
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__freethread
 add SP, #4 ' CALL addrg
 jmp #\@C_s79012_696de099_freeobj_L000405_408 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_416
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s79012_696de099_freeobj_L000405_418 ' NEI4
 mov r17, #16 ' reg <- coni
 jmp #\@C_s79012_696de099_freeobj_L000405_419 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_418
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #3 ' LSHU4 coni
 mov r17, r22
 add r17, #20 ' ADDU4 coni
C_s79012_696de099_freeobj_L000405_419
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r2, r17 ' ADDU
 add r2, r22 ' ADDU (3)
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 jmp #\@C_s79012_696de099_freeobj_L000405_408 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_420
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__remove
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #1 ' reg <- coni
 mov r18, r22
 adds r18, #7 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 adds r18, #1 ' ADDI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0
 add r2, #16 ' ADDU4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 jmp #\@C_s79012_696de099_freeobj_L000405_408 ' JUMPV addrg
C_s79012_696de099_freeobj_L000405_421
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, #1 ' reg <- coni
 mov r18, r22
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r18, #1 ' ADDU4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0
 add r2, #16 ' ADDU4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
C_s79012_696de099_freeobj_L000405_407
C_s79012_696de099_freeobj_L000405_408
' C_s79012_696de099_freeobj_L000405_406 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s79015_696de099_sweeplist_L000428 ' <symbol:sweeplist>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $feaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r9, r22 ' reg <- INDIRP4 reg
 mov r22, r9
 adds r22, #56 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r13, r22
 xor r13, #24 ' BXORI4 coni
 mov r22, r9
 adds r22, #56 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 mov r11, r22 ' CVUI
 and r11, cviu_m1 ' zero extend
 mov r15, #0 ' reg <- coni
 jmp #\@C_s79015_696de099_sweeplist_L000428_433 ' JUMPV addrg
C_s79015_696de099_sweeplist_L000428_430
 rdlong r7, r21 ' reg <- INDIRP4 reg
 mov r22, r7
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, r13 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C_s79015_696de099_sweeplist_L000428_434 ' EQI4
 rdlong r22, r7 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r2, r7 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79012_696de099_freeobj_L000405
 add SP, #4 ' CALL addrg
 jmp #\@C_s79015_696de099_sweeplist_L000428_435 ' JUMPV addrg
C_s79015_696de099_sweeplist_L000428_434
 mov r22, r7
 adds r22, #5 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, ##-64 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, r11 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r21, r7 ' CVI, CVU or LOAD
C_s79015_696de099_sweeplist_L000428_435
' C_s79015_696de099_sweeplist_L000428_431 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s79015_696de099_sweeplist_L000428_433
 rdlong r22, r21 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s79015_696de099_sweeplist_L000428_436 ' EQU4
 cmps r15, r19 wcz
 if_b jmp #\C_s79015_696de099_sweeplist_L000428_430 ' LTI4
C_s79015_696de099_sweeplist_L000428_436
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_s79015_696de099_sweeplist_L000428_437 ' EQU4
 wrlong r15, r17 ' ASGNI4 reg reg
C_s79015_696de099_sweeplist_L000428_437
 rdlong r22, r21 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s79015_696de099_sweeplist_L000428_440  ' NEU4
 mov r7, ##0 ' reg <- con
 jmp #\@C_s79015_696de099_sweeplist_L000428_441 ' JUMPV addrg
C_s79015_696de099_sweeplist_L000428_440
 mov r7, r21 ' CVI, CVU or LOAD
C_s79015_696de099_sweeplist_L000428_441
 mov r0, r7 ' CVI, CVU or LOAD
' C_s79015_696de099_sweeplist_L000428_429 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s79016_696de099_sweeptolive_L000442 ' <symbol:sweeptolive>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' CVI, CVU or LOAD
C_s79016_696de099_sweeptolive_L000442_444
 mov r2, ##0 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79015_696de099_sweeplist_L000428
 add SP, #12 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
' C_s79016_696de099_sweeptolive_L000442_445 ' (symbol refcount = 0)
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_z jmp #\C_s79016_696de099_sweeptolive_L000442_444 ' EQU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_s79016_696de099_sweeptolive_L000442_443 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s79017_696de099_checkS_izes_L000447 ' <symbol:checkSizes>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f50000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #63 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s79017_696de099_checkS_izes_L000447_449 ' NEI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r22, r0 wcz
 if_ae jmp #\C_s79017_696de099_checkS_izes_L000447_451 ' GEI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, #2 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__resize
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r16, FP
 sub r16, #-(-8) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRI4 reg
 subs r18, r16 ' SUBI/P (1)
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
C_s79017_696de099_checkS_izes_L000447_451
C_s79017_696de099_checkS_izes_L000447_449
' C_s79017_696de099_checkS_izes_L000447_448 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s79018_696de099_udata2finalize_L000453 ' <symbol:udata2finalize>
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r22, r2
 adds r22, #100 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 mov r22, r2
 adds r22, #100 ' ADDP4 coni
 rdlong r20, r23 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #68 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #68 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffffbf ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r2
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, #3 ' reg <- coni
 cmps r20, r22 wcz
 if_a jmp #\C_s79018_696de099_udata2finalize_L000453_455 ' GTI4
 cmps r22,  #6 wcz
 if_a jmp #\C_s79018_696de099_udata2finalize_L000453_455 ' GTI4
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-57 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r2
 adds r18, #56 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #24 ' BANDI4 coni
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s79018_696de099_udata2finalize_L000453_456 ' JUMPV addrg
C_s79018_696de099_udata2finalize_L000453_455
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #3 wz
 if_nz jmp #\C_s79018_696de099_udata2finalize_L000453_457 ' NEI4
 mov r22, r2
 adds r22, #120 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
C_s79018_696de099_udata2finalize_L000453_457
C_s79018_696de099_udata2finalize_L000453_456
 mov r0, r23 ' CVI, CVU or LOAD
' C_s79018_696de099_udata2finalize_L000453_454 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s79019_696de099_dothecall_L000459 ' <symbol:dothecall>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-16 ' reg <- con
 mov r3, r22 ' ADDI/P
 adds r3, r20 ' ADDI/P (3)
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
' C_s79019_696de099_dothecall_L000459_460 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901a_696de099_G_C_T_M__L000461 ' <symbol:GCTM>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r19, FP
 sub r19, #-(-16) ' reg <- addrli
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s79018_696de099_udata2finalize_L000453 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 wrlong r17, r19 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, r17
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #2 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7901a_696de099_G_C_T_M__L000461_463 ' EQI4
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-20)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #2 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #8 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 reg
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-36) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #34 ' ADDP4 coni
 rdword r20, r22 ' reg <- CVUI4 INDIRU2 reg
 or r20, #128 ' BORI4 coni
 wrword r20, r22 ' ASGNU2 reg reg
 mov r2, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, ##-16 ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##0 ' reg ARG con
 mov r5, ##@C_s79019_696de099_dothecall_L000459 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_luaD__pcall
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #34 ' ADDP4 coni
 rdword r20, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r18, ##-129 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-24) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_s7901a_696de099_G_C_T_M__L000461_465 ' EQI4
 mov r2, ##@C_s7901a_696de099_G_C_T_M__L000461_467_L000468 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__warnerror
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_s7901a_696de099_G_C_T_M__L000461_465
C_s7901a_696de099_G_C_T_M__L000461_463
' C_s7901a_696de099_G_C_T_M__L000461_462 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s7901c_696de099_runafewfinalizers_L000469 ' <symbol:runafewfinalizers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r19, #0 ' reg <- coni
 jmp #\@C_s7901c_696de099_runafewfinalizers_L000469_474 ' JUMPV addrg
C_s7901c_696de099_runafewfinalizers_L000469_471
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901a_696de099_G_C_T_M__L000461 ' CALL addrg
' C_s7901c_696de099_runafewfinalizers_L000469_472 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s7901c_696de099_runafewfinalizers_L000469_474
 cmps r19, r21 wcz
 if_ae jmp #\C_s7901c_696de099_runafewfinalizers_L000469_475 ' GEI4
 mov r22, r17
 adds r22, #100 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s7901c_696de099_runafewfinalizers_L000469_471  ' NEU4
C_s7901c_696de099_runafewfinalizers_L000469_475
 mov r0, r19 ' CVI, CVU or LOAD
' C_s7901c_696de099_runafewfinalizers_L000469_470 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901d_696de099_callallpendingfinalizers_L000476 ' <symbol:callallpendingfinalizers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s7901d_696de099_callallpendingfinalizers_L000476_479 ' JUMPV addrg
C_s7901d_696de099_callallpendingfinalizers_L000476_478
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901a_696de099_G_C_T_M__L000461 ' CALL addrg
C_s7901d_696de099_callallpendingfinalizers_L000476_479
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s7901d_696de099_callallpendingfinalizers_L000476_478  ' NEU4
' C_s7901d_696de099_callallpendingfinalizers_L000476_477 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901e_696de099_findlast_L000481 ' <symbol:findlast>
 calld PA,#PSHM
 long $400000 ' save registers
 jmp #\@C_s7901e_696de099_findlast_L000481_484 ' JUMPV addrg
C_s7901e_696de099_findlast_L000481_483
 rdlong r2, r2 ' reg <- INDIRP4 reg
C_s7901e_696de099_findlast_L000481_484
 rdlong r22, r2 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s7901e_696de099_findlast_L000481_483  ' NEU4
 mov r0, r2 ' CVI, CVU or LOAD
' C_s7901e_696de099_findlast_L000481_482 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s7901f_696de099_separatetobefnz_L000486 ' <symbol:separatetobefnz>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, r23
 adds r17, #76 ' ADDP4 coni
 mov r2, r23
 adds r2, #100 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901e_696de099_findlast_L000481 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_s7901f_696de099_separatetobefnz_L000486_489 ' JUMPV addrg
C_s7901f_696de099_separatetobefnz_L000486_488
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_s7901f_696de099_separatetobefnz_L000486_491 ' NEI4
 cmps r21, r22 wz
 if_nz jmp #\C_s7901f_696de099_separatetobefnz_L000486_491 ' NEI4
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #\@C_s7901f_696de099_separatetobefnz_L000486_492 ' JUMPV addrg
C_s7901f_696de099_separatetobefnz_L000486_491
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #124 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_s7901f_696de099_separatetobefnz_L000486_493  ' NEU4
 mov r22, r23
 adds r22, #124 ' ADDP4 coni
 rdlong r20, r19 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_s7901f_696de099_separatetobefnz_L000486_493
 rdlong r22, r19 ' reg <- INDIRP4 reg
 wrlong r22, r17 ' ASGNP4 reg reg
 rdlong r22, r15 ' reg <- INDIRP4 reg
 wrlong r22, r19 ' ASGNP4 reg reg
 wrlong r19, r15 ' ASGNP4 reg reg
 mov r15, r19 ' CVI, CVU or LOAD
C_s7901f_696de099_separatetobefnz_L000486_492
C_s7901f_696de099_separatetobefnz_L000486_489
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #128 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_s7901f_696de099_separatetobefnz_L000486_488  ' NEU4
' C_s7901f_696de099_separatetobefnz_L000486_487 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901g_696de099_checkpointer_L000495 ' <symbol:checkpointer>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 rdlong r20, r3 ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 if_nz jmp #\C_s7901g_696de099_checkpointer_L000495_497  ' NEU4
 rdlong r22, r2 ' reg <- INDIRP4 reg
 wrlong r22, r3 ' ASGNP4 reg reg
C_s7901g_696de099_checkpointer_L000495_497
' C_s7901g_696de099_checkpointer_L000495_496 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s7901h_696de099_correctpointers_L000499 ' <symbol:correctpointers>
 calld PA,#NEWF
 calld PA,#PSHM
 long $a00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #108 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901g_696de099_checkpointer_L000495
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #112 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901g_696de099_checkpointer_L000495
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #116 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901g_696de099_checkpointer_L000495
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23
 adds r3, #120 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901g_696de099_checkpointer_L000495
 add SP, #4 ' CALL addrg
' C_s7901h_696de099_correctpointers_L000499_500 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaC_checkfinalizer

 alignl ' align long
C_luaC__checkfinalizer ' <symbol:luaC_checkfinalizer>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fea800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaC__checkfinalizer_507 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_luaC__checkfinalizer_508  ' NEU4
 mov r15, ##0 ' reg <- con
 jmp #\@C_luaC__checkfinalizer_509 ' JUMPV addrg
C_luaC__checkfinalizer_508
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #4 ' BANDU4 coni
 cmp r22,  #0 wz
 if_z jmp #\C_luaC__checkfinalizer_510 ' EQU4
 mov r13, ##0 ' reg <- con
 jmp #\@C_luaC__checkfinalizer_511 ' JUMPV addrg
C_luaC__checkfinalizer_510
 mov r22, r17
 adds r22, #160 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, #2 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettm
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r13, r22 ' CVI, CVU or LOAD
C_luaC__checkfinalizer_511
 mov r15, r13 ' CVI, CVU or LOAD
C_luaC__checkfinalizer_509
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaC__checkfinalizer_507 ' EQU4
 mov r22, r17
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #4 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaC__checkfinalizer_502 ' EQI4
C_luaC__checkfinalizer_507
 jmp #\@C_luaC__checkfinalizer_501 ' JUMPV addrg
C_luaC__checkfinalizer_502
 mov r22, r17
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, #3 ' reg <- coni
 cmps r20, r22 wcz
 if_a jmp #\C_luaC__checkfinalizer_512 ' GTI4
 cmps r22,  #6 wcz
 if_a jmp #\C_luaC__checkfinalizer_512 ' GTI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-57 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r17
 adds r18, #56 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 and r18, #24 ' BANDI4 coni
 and r18, cviu_m1 ' zero extend
 or r20, r18 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_luaC__checkfinalizer_513  ' NEU4
 mov r22, r17
 adds r22, #72 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79016_696de099_sweeptolive_L000442
 add SP, #4 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 jmp #\@C_luaC__checkfinalizer_513 ' JUMPV addrg
C_luaC__checkfinalizer_512
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901h_696de099_correctpointers_L000499
 add SP, #4 ' CALL addrg
C_luaC__checkfinalizer_513
 mov r11, r17
 adds r11, #68 ' ADDP4 coni
 jmp #\@C_luaC__checkfinalizer_519 ' JUMPV addrg
C_luaC__checkfinalizer_516
' C_luaC__checkfinalizer_517 ' (symbol refcount = 0)
 rdlong r11, r11 ' reg <- INDIRP4 reg
C_luaC__checkfinalizer_519
 rdlong r22, r11 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_luaC__checkfinalizer_516  ' NEU4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 wrlong r22, r11 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #76 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #76 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_luaC__checkfinalizer_501
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901i_696de099_setpause_L000520 ' <symbol:setpause>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #64 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r19, r22
 shl r19, #2 ' LSHI4 coni
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #100 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##2147483647 ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 cmps r19, r0 wcz
 if_ae jmp #\C_s7901i_696de099_setpause_L000520_523 ' GEI4
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r17, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #\@C_s7901i_696de099_setpause_L000520_524 ' JUMPV addrg
C_s7901i_696de099_setpause_L000520_523
 mov r15, ##2147483647 ' reg <- con
C_s7901i_696de099_setpause_L000520_524
 mov RI, FP
 sub RI, #-(-8)
 wrlong r15, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 sub r22, r20 ' SUBU (1)
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 if_be jmp #\C_s7901i_696de099_setpause_L000520_525 ' LEI4
 mov r21, #0 ' reg <- coni
C_s7901i_696de099_setpause_L000520_525
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
' C_s7901i_696de099_setpause_L000520_521 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s7901j_696de099_sweep2old_L000527 ' <symbol:sweep2old>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r17, r22 ' reg <- INDIRP4 reg
 jmp #\@C_s7901j_696de099_sweep2old_L000527_530 ' JUMPV addrg
C_s7901j_696de099_sweep2old_L000527_529
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7901j_696de099_sweep2old_L000527_532 ' EQI4
 rdlong r22, r19 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79012_696de099_freeobj_L000405
 add SP, #4 ' CALL addrg
 jmp #\@C_s7901j_696de099_sweep2old_L000527_533 ' JUMPV addrg
C_s7901j_696de099_sweep2old_L000527_532
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-8 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, #4 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_s7901j_696de099_sweep2old_L000527_534 ' NEI4
 mov r15, r19 ' CVI, CVU or LOAD
 mov r2, r17
 adds r2, #84 ' ADDP4 coni
 mov r3, r15
 adds r3, #40 ' ADDP4 coni
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7906_696de099_linkgclist__L000033
 add SP, #8 ' CALL addrg
 jmp #\@C_s7901j_696de099_sweep2old_L000527_535 ' JUMPV addrg
C_s7901j_696de099_sweep2old_L000527_534
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #9 wz
 if_nz jmp #\C_s7901j_696de099_sweep2old_L000527_536 ' NEI4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r19
 adds r20, #12 ' ADDP4 coni
 cmp r22, r20 wz
 if_z jmp #\C_s7901j_696de099_sweep2old_L000527_536 ' EQU4
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##$ffffffc7 ' reg <- con
 and r18, cviu_m1 ' zero extend
 and r20, r18 ' BANDI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s7901j_696de099_sweep2old_L000527_537 ' JUMPV addrg
C_s7901j_696de099_sweep2old_L000527_536
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s7901j_696de099_sweep2old_L000527_537
C_s7901j_696de099_sweep2old_L000527_535
 mov r21, r19 ' CVI, CVU or LOAD
C_s7901j_696de099_sweep2old_L000527_533
C_s7901j_696de099_sweep2old_L000527_530
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s7901j_696de099_sweep2old_L000527_529  ' NEU4
' C_s7901j_696de099_sweep2old_L000527_528 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s7901k_696de099_sweepgen_L000538_nextage_L000541 ' <symbol:nextage>
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
C_s7901k_696de099_sweepgen_L000538 ' <symbol:sweepgen>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ffa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #56 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 jmp #\@C_s7901k_696de099_sweepgen_L000538_543 ' JUMPV addrg
C_s7901k_696de099_sweepgen_L000538_542
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7901k_696de099_sweepgen_L000538_545 ' EQI4
 rdlong r22, r15 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79012_696de099_freeobj_L000405
 add SP, #4 ' CALL addrg
 jmp #\@C_s7901k_696de099_sweepgen_L000538_546 ' JUMPV addrg
C_s7901k_696de099_sweepgen_L000538_545
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_s7901k_696de099_sweepgen_L000538_547 ' NEI4
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##-64 ' reg <- con
 mov r11, r22 ' BANDI/U
 and r11, r20 ' BANDI/U (3)
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 mov r20, r11
 or r20, #1 ' BORI4 coni
 or r20, r13 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s7901k_696de099_sweepgen_L000538_548 ' JUMPV addrg
C_s7901k_696de099_sweepgen_L000538_547
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-8 ' reg <- con
 and r18, r20 ' BANDI/U (2)
 and r20, #7 ' BANDI4 coni
 mov r16, ##@C_s7901k_696de099_sweepgen_L000538_nextage_L000541 ' reg <- addrg
 adds r20, r16 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, r18 ' BORI/U (2)
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #3 wz
 if_nz jmp #\C_s7901k_696de099_sweepgen_L000538_549 ' NEI4
 rdlong r22, r17 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s7901k_696de099_sweepgen_L000538_549  ' NEU4
 wrlong r15, r17 ' ASGNP4 reg reg
C_s7901k_696de099_sweepgen_L000538_549
C_s7901k_696de099_sweepgen_L000538_548
 mov r21, r15 ' CVI, CVU or LOAD
C_s7901k_696de099_sweepgen_L000538_546
C_s7901k_696de099_sweepgen_L000538_543
 rdlong r22, r21 ' reg <- INDIRP4 reg
 mov r15, r22 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_s7901k_696de099_sweepgen_L000538_542  ' NEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_s7901k_696de099_sweepgen_L000538_539 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901m_696de099_whitelist_L000551 ' <symbol:whitelist>
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r22, r3
 adds r22, #56 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 mov r23, r22 ' CVUI
 and r23, cviu_m1 ' zero extend
 jmp #\@C_s7901m_696de099_whitelist_L000551_556 ' JUMPV addrg
C_s7901m_696de099_whitelist_L000551_553
 mov r22, r2
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r18, ##-64 ' reg <- con
 and r20, r18 ' BANDI/U (1)
 or r20, r23 ' BORI/U (1)
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_s7901m_696de099_whitelist_L000551_554 ' (symbol refcount = 0)
 rdlong r2, r2 ' reg <- INDIRP4 reg
C_s7901m_696de099_whitelist_L000551_556
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s7901m_696de099_whitelist_L000551_553  ' NEU4
' C_s7901m_696de099_whitelist_L000551_552 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_s7901n_696de099_correctgraylist_L000557 ' <symbol:correctgraylist>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #\@C_s7901n_696de099_correctgraylist_L000557_560 ' JUMPV addrg
C_s7901n_696de099_correctgraylist_L000557_559
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7903_696de099_getgclist_L000017 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7901n_696de099_correctgraylist_L000557_562 ' EQI4
 jmp #\@C_s7901n_696de099_correctgraylist_L000557_564 ' JUMPV addrg
C_s7901n_696de099_correctgraylist_L000557_562
 mov r22, #5 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #7 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_s7901n_696de099_correctgraylist_L000557_565 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 xor r20, #3 ' BXORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s7901n_696de099_correctgraylist_L000557_567 ' JUMPV addrg
C_s7901n_696de099_correctgraylist_L000557_565
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_s7901n_696de099_correctgraylist_L000557_568 ' NEI4
 jmp #\@C_s7901n_696de099_correctgraylist_L000557_567 ' JUMPV addrg
C_s7901n_696de099_correctgraylist_L000557_568
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #6 wz
 if_nz jmp #\C_s7901n_696de099_correctgraylist_L000557_570 ' NEI4
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 xor r20, #2 ' BXORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s7901n_696de099_correctgraylist_L000557_570
 mov r22, r21
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s7901n_696de099_correctgraylist_L000557_564
 rdlong r22, r19 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 jmp #\@C_s7901n_696de099_correctgraylist_L000557_560 ' JUMPV addrg
C_s7901n_696de099_correctgraylist_L000557_567
 mov r23, r19 ' CVI, CVU or LOAD
C_s7901n_696de099_correctgraylist_L000557_560
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s7901n_696de099_correctgraylist_L000557_559  ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
' C_s7901n_696de099_correctgraylist_L000557_558 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901o_696de099_correctgraylists_L000572 ' <symbol:correctgraylists>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23
 adds r2, #84 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901n_696de099_correctgraylist_L000557 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #88 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #88 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901n_696de099_correctgraylist_L000557 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901n_696de099_correctgraylist_L000557 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r21 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901n_696de099_correctgraylist_L000557 ' CALL addrg
' C_s7901o_696de099_correctgraylists_L000572_573 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901p_696de099_markold_L000574 ' <symbol:markold>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, r21 ' CVI, CVU or LOAD
 jmp #\@C_s7901p_696de099_markold_L000574_579 ' JUMPV addrg
C_s7901p_696de099_markold_L000574_576
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #7 ' BANDI4 coni
 cmps r22,  #3 wz
 if_nz jmp #\C_s7901p_696de099_markold_L000574_580 ' NEI4
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 xor r20, #7 ' BXORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7901p_696de099_markold_L000574_582 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s7901p_696de099_markold_L000574_582
C_s7901p_696de099_markold_L000574_580
' C_s7901p_696de099_markold_L000574_577 ' (symbol refcount = 0)
 rdlong r17, r17 ' reg <- INDIRP4 reg
C_s7901p_696de099_markold_L000574_579
 mov r22, r17 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_s7901p_696de099_markold_L000574_576  ' NEU4
' C_s7901p_696de099_markold_L000574_575 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901q_696de099_finishgencycle_L000584 ' <symbol:finishgencycle>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901o_696de099_correctgraylists_L000572 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79017_696de099_checkS_izes_L000447
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #63 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s7901q_696de099_finishgencycle_L000584_586 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901d_696de099_callallpendingfinalizers_L000476 ' CALL addrg
C_s7901q_696de099_finishgencycle_L000584_586
' C_s7901q_696de099_finishgencycle_L000584_585 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901r_696de099_youngcollection_L000588 ' <symbol:youngcollection>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s7901r_696de099_youngcollection_L000588_590 ' EQU4
 mov r22, r21
 adds r22, #116 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901p_696de099_markold_L000574
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C_s7901r_696de099_youngcollection_L000588_590
 mov r22, r21
 adds r22, #132 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901p_696de099_markold_L000574
 add SP, #8 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901p_696de099_markold_L000574
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901_696de099_atomic_L000015 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r21
 adds r2, #120 ' ADDP4 coni
 mov r22, r21
 adds r22, #108 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21
 adds r4, #68 ' ADDP4 coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s7901k_696de099_sweepgen_L000538
 add SP, #16 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, r21
 adds r2, #120 ' ADDP4 coni
 mov r22, r21
 adds r22, #112 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s7901k_696de099_sweepgen_L000538
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #116 ' ADDP4 coni
 mov r20, r21
 adds r20, #112 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #112 ' ADDP4 coni
 rdlong r20, r19 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #108 ' ADDP4 coni
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, ##0 ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r22, r21
 adds r22, #124 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21
 adds r4, #76 ' ADDP4 coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s7901k_696de099_sweepgen_L000538
 add SP, #16 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r22, r21
 adds r22, #128 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s7901k_696de099_sweepgen_L000538
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #132 ' ADDP4 coni
 mov r20, r21
 adds r20, #128 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #128 ' ADDP4 coni
 rdlong r20, r19 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #124 ' ADDP4 coni
 mov r20, r21
 adds r20, #76 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, ##0 ' reg ARG con
 mov r4, r21
 adds r4, #100 ' ADDP4 coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_s7901k_696de099_sweepgen_L000538
 add SP, #16 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901q_696de099_finishgencycle_L000584
 add SP, #4 ' CALL addrg
' C_s7901r_696de099_youngcollection_L000588_589 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s7901s_696de099_atomic2gen_L000592 ' <symbol:atomic2gen>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790e_696de099_cleargraylists_L000119 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r21
 adds r2, #68 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901j_696de099_sweep2old_L000527
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #108 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r21
 adds r20, #112 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r21
 adds r20, #116 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #120 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21
 adds r2, #76 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901j_696de099_sweep2old_L000527
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #124 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r21
 adds r20, #128 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r21
 adds r20, #132 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r2, r21
 adds r2, #100 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901j_696de099_sweep2old_L000527
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #58 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901q_696de099_finishgencycle_L000584
 add SP, #4 ' CALL addrg
' C_s7901s_696de099_atomic2gen_L000592_593 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901t_696de099_setminordebt_L000594 ' <symbol:setminordebt>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, #100 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #60 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 neg r2, r0 ' NEGI4
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
' C_s7901t_696de099_setminordebt_L000594_595 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901u_696de099_entergen_L000596 ' <symbol:entergen>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #256 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901_696de099_atomic_L000015 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901s_696de099_atomic2gen_L000592
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901t_696de099_setminordebt_L000594 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_s7901u_696de099_entergen_L000596_597 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s7901v_696de099_enterinc_L000598 ' <symbol:enterinc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #68 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901m_696de099_whitelist_L000551
 add SP, #4 ' CALL addrg
 mov r22, ##0 ' reg <- con
 mov r20, r23
 adds r20, #108 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r23
 adds r20, #112 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r23
 adds r20, #116 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #76 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901m_696de099_whitelist_L000551
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901m_696de099_whitelist_L000551
 add SP, #4 ' CALL addrg
 mov r22, ##0 ' reg <- con
 mov r20, r23
 adds r20, #124 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r23
 adds r20, #128 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r20, r23
 adds r20, #132 ' ADDP4 coni
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #57 ' ADDP4 coni
 mov r20, #8 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #58 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_s7901v_696de099_enterinc_L000598_599 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaC_changemode

 alignl ' align long
C_luaC__changemode ' <symbol:luaC_changemode>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r21, r22 wz
 if_z jmp #\C_luaC__changemode_601 ' EQI4
 cmps r21,  #1 wz
 if_nz jmp #\C_luaC__changemode_603 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901u_696de099_entergen_L000596
 add SP, #4 ' CALL addrg
 jmp #\@C_luaC__changemode_604 ' JUMPV addrg
C_luaC__changemode_603
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901v_696de099_enterinc_L000598 ' CALL addrg
C_luaC__changemode_604
C_luaC__changemode_601
 mov r22, r19
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNU4 reg reg
' C_luaC__changemode_600 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s79020_696de099_fullgen_L000605 ' <symbol:fullgen>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901v_696de099_enterinc_L000598 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901u_696de099_entergen_L000596
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s79020_696de099_fullgen_L000605_606 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s79021_696de099_stepgenfull_L000607 ' <symbol:stepgenfull>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRU4 reg
 mov r22, r21
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_nz jmp #\C_s79021_696de099_stepgenfull_L000607_609 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901v_696de099_enterinc_L000598 ' CALL addrg
C_s79021_696de099_stepgenfull_L000607_609
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901_696de099_atomic_L000015 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r19
 shr r20, #3 ' RSHU4 coni
 add r20, r19 ' ADDU (2)
 cmp r22, r20 wcz 
 if_ae jmp #\C_s79021_696de099_stepgenfull_L000607_611 ' GEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901s_696de099_atomic2gen_L000592
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901t_696de099_setminordebt_L000594 ' CALL addrg
 jmp #\@C_s79021_696de099_stepgenfull_L000607_612 ' JUMPV addrg
C_s79021_696de099_stepgenfull_L000607_611
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7902_696de099_entersweep_L000016 ' CALL addrg
 mov r2, #256 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901i_696de099_setpause_L000520 ' CALL addrg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_s79021_696de099_stepgenfull_L000607_612
' C_s79021_696de099_stepgenfull_L000607_608 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s79022_696de099_genstep_L000613 ' <symbol:genstep>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s79022_696de099_genstep_L000613_615 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79021_696de099_stepgenfull_L000607
 add SP, #4 ' CALL addrg
 jmp #\@C_s79022_696de099_genstep_L000613_616 ' JUMPV addrg
C_s79022_696de099_genstep_L000613_615
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, #100 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r20 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r21
 adds r22, #61 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #2 ' LSHI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r0, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_s79022_696de099_genstep_L000613_617 ' LEI4
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (2)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r20, r18 ' ADDU (1)
 cmp r22, r20 wcz 
 if_be jmp #\C_s79022_696de099_genstep_L000613_617 ' LEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79020_696de099_fullgen_L000605
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r21
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 shr r18, #1 ' RSHU4 coni
 add r20, r18 ' ADDU (1)
 cmp r22, r20 wcz 
 if_ae jmp #\C_s79022_696de099_genstep_L000613_619 ' GEU4
 jmp #\@C_s79022_696de099_genstep_L000613_618 ' JUMPV addrg
C_s79022_696de099_genstep_L000613_619
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901i_696de099_setpause_L000520 ' CALL addrg
 jmp #\@C_s79022_696de099_genstep_L000613_618 ' JUMPV addrg
C_s79022_696de099_genstep_L000613_617
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901r_696de099_youngcollection_L000588
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901t_696de099_setminordebt_L000594 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 wrlong r20, r22 ' ASGNU4 reg reg
C_s79022_696de099_genstep_L000613_618
C_s79022_696de099_genstep_L000613_616
' C_s79022_696de099_genstep_L000613_614 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s7902_696de099_entersweep_L000016 ' <symbol:entersweep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r21
 adds r2, #68 ' ADDP4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79016_696de099_sweeptolive_L000442
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
' C_s7902_696de099_entersweep_L000016_621 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s79023_696de099_deletelist_L000622 ' <symbol:deletelist>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #\@C_s79023_696de099_deletelist_L000622_625 ' JUMPV addrg
C_s79023_696de099_deletelist_L000622_624
 rdlong r17, r21 ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79012_696de099_freeobj_L000405
 add SP, #4 ' CALL addrg
 mov r21, r17 ' CVI, CVU or LOAD
C_s79023_696de099_deletelist_L000622_625
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_s79023_696de099_deletelist_L000622_624  ' NEU4
' C_s79023_696de099_deletelist_L000622_623 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaC_freeallobjects

 alignl ' align long
C_luaC__freeallobjects ' <symbol:luaC_freeallobjects>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 mov r20, #4 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__changemode
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901f_696de099_separatetobefnz_L000486
 add SP, #4 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901d_696de099_callallpendingfinalizers_L000476 ' CALL addrg
 mov r22, r21
 adds r22, #144 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79023_696de099_deletelist_L000622
 add SP, #8 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, r21
 adds r22, #104 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79023_696de099_deletelist_L000622
 add SP, #8 ' CALL addrg
' C_luaC__freeallobjects_627 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s7901_696de099_atomic_L000015 ' <symbol:atomic>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r19, #0 ' reg <- coni
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #84 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #2 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s7901_696de099_atomic_L000015_629 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s7901_696de099_atomic_L000015_629
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #40 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #64 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s7901_696de099_atomic_L000015_631 ' EQI4
 mov r20, r21
 adds r20, #36 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s7901_696de099_atomic_L000015_631 ' EQI4
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790_696de099_reallymarkobject_L000014
 add SP, #4 ' CALL addrg
C_s7901_696de099_atomic_L000015_631
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790b_696de099_markmt_L000086 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790t_696de099_propagateall_L000340 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790d_696de099_remarkupvals_L000104 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790t_696de099_propagateall_L000340 ' CALL addrg
 add r19, r0 ' ADDU (1)
 mov r22, r21
 adds r22, #80 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790t_696de099_propagateall_L000340 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790u_696de099_convergeephemerons_L000345 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, r21
 adds r22, #88 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79010_696de099_clearbyvalues_L000375
 add SP, #8 ' CALL addrg
 mov r2, ##0 ' reg ARG con
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79010_696de099_clearbyvalues_L000375
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #88 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901f_696de099_separatetobefnz_L000486
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790c_696de099_markbeingfnz_L000096 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790t_696de099_propagateall_L000340 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 add r19, r22 ' ADDU (1)
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790u_696de099_convergeephemerons_L000345 ' CALL addrg
 mov r22, r21
 adds r22, #92 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790v_696de099_clearbykeys_L000358
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s790v_696de099_clearbykeys_L000358
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #88 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79010_696de099_clearbyvalues_L000375
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79010_696de099_clearbyvalues_L000375
 add SP, #8 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaS__clearcache ' CALL addrg
 mov r22, r21
 adds r22, #56 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 xor r20, #24 ' BXORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C_s7901_696de099_atomic_L000015_628 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s79024_696de099_sweepstep_L000633 ' <symbol:sweepstep>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ff0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s79024_696de099_sweepstep_L000633_635 ' EQU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, #100 ' reg ARG coni
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79015_696de099_sweeplist_L000428
 add SP, #12 ' CALL addrg
 wrlong r0, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 mov r16, FP
 sub r16, #-(-8) ' reg <- addrli
 rdlong r16, r16 ' reg <- INDIRI4 reg
 subs r18, r16 ' SUBI/P (1)
 add r20, r18 ' ADDU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
 jmp #\@C_s79024_696de099_sweepstep_L000633_634 ' JUMPV addrg
C_s79024_696de099_sweepstep_L000633_635
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_s79024_696de099_sweepstep_L000633_634
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s79025_696de099_singlestep_L000637 ' <symbol:singlestep>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #59 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19,  #0 wcz
 if_b jmp #\C_s79025_696de099_singlestep_L000637_639 ' LTI4
 cmps r19,  #8 wcz
 if_a jmp #\C_s79025_696de099_singlestep_L000637_639 ' GTI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s79025_696de099_singlestep_L000637_654_L000656 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s79025_696de099_singlestep_L000637_654_L000656 ' <symbol:654>
 long @C_s79025_696de099_singlestep_L000637_643
 long @C_s79025_696de099_singlestep_L000637_646
 long @C_s79025_696de099_singlestep_L000637_639
 long @C_s79025_696de099_singlestep_L000637_647
 long @C_s79025_696de099_singlestep_L000637_648
 long @C_s79025_696de099_singlestep_L000637_649
 long @C_s79025_696de099_singlestep_L000637_650
 long @C_s79025_696de099_singlestep_L000637_651
 long @C_s79025_696de099_singlestep_L000637_642

' Catalina Code

DAT ' code segment
C_s79025_696de099_singlestep_L000637_642
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790f_696de099_restartcollection_L000121 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_643
 mov r22, r21
 adds r22, #80 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s79025_696de099_singlestep_L000637_644  ' NEU4
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_644
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s790q_696de099_propagatemark_L000324 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_646
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901_696de099_atomic_L000015 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7902_696de099_entersweep_L000016 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r18, r21
 adds r18, #12 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRI4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_647
 mov r2, r21
 adds r2, #76 ' ADDP4 coni
 mov r3, #4 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79024_696de099_sweepstep_L000633
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_648
 mov r2, r21
 adds r2, #100 ' ADDP4 coni
 mov r3, #5 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79024_696de099_sweepstep_L000633
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_649
 mov r2, ##0 ' reg ARG con
 mov r3, #6 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79024_696de099_sweepstep_L000633
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_650
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79017_696de099_checkS_izes_L000447
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #7 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_651
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_s79025_696de099_singlestep_L000637_652 ' EQU4
 mov r22, r21
 adds r22, #63 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_s79025_696de099_singlestep_L000637_652 ' NEI4
 mov r22, r21
 adds r22, #59 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #10 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s7901c_696de099_runafewfinalizers_L000469
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #50 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r22 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_652
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #8 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_s79025_696de099_singlestep_L000637_640 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_639
 mov r0, #0 ' reg <- coni
 jmp #\@C_s79025_696de099_singlestep_L000637_638 ' JUMPV addrg
C_s79025_696de099_singlestep_L000637_640
 mov r22, r21
 adds r22, #59 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
C_s79025_696de099_singlestep_L000637_638
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaC_runtilstate

 alignl ' align long
C_luaC__runtilstate ' <symbol:luaC_runtilstate>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 jmp #\@C_luaC__runtilstate_659 ' JUMPV addrg
C_luaC__runtilstate_658
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s79025_696de099_singlestep_L000637 ' CALL addrg
C_luaC__runtilstate_659
 mov r22, #1 ' reg <- coni
 mov r20, r19
 adds r20, #57 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 and r22, r21 ' BANDI/U (2)
 cmps r22,  #0 wz
 if_z jmp #\C_luaC__runtilstate_658 ' EQI4
' C_luaC__runtilstate_657 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s79028_696de099_incstep_L000661 ' <symbol:incstep>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #65 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #2 ' LSHI4 coni
 mov r15, r22
 or r15, #1 ' BORI4 coni
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shr r22, #3 ' RSHU4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #66 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmp r22,  #30 wcz 
 if_a jmp #\C_s79028_696de099_incstep_L000661_664 ' GTU4
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #66 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r22, r20 ' LSHI/U (1)
 shr r22, #3 ' RSHU4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #\@C_s79028_696de099_incstep_L000661_665 ' JUMPV addrg
C_s79028_696de099_incstep_L000661_664
 mov r13, ##$7fffffff ' reg <- con
C_s79028_696de099_incstep_L000661_665
 mov r17, r13 ' CVI, CVU or LOAD
C_s79028_696de099_incstep_L000661_666
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s79025_696de099_singlestep_L000637 ' CALL addrg
 mov r11, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 sub r22, r11 ' SUBU (1)
 mov r19, r22 ' CVI, CVU or LOAD
' C_s79028_696de099_incstep_L000661_667 ' (symbol refcount = 0)
 neg r22, r17 ' NEGI4
 cmps r19, r22 wcz
 if_be jmp #\C_s79028_696de099_incstep_L000661_669 ' LEI4
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_s79028_696de099_incstep_L000661_666 ' NEI4
C_s79028_696de099_incstep_L000661_669
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #8 wz
 if_nz jmp #\C_s79028_696de099_incstep_L000661_670 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901i_696de099_setpause_L000520 ' CALL addrg
 jmp #\@C_s79028_696de099_incstep_L000661_671 ' JUMPV addrg
C_s79028_696de099_incstep_L000661_670
 mov r0, r19 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 shl r22, #3 ' LSHU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
C_s79028_696de099_incstep_L000661_671
' C_s79028_696de099_incstep_L000661_662 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaC_step

 alignl ' align long
C_luaC__step ' <symbol:luaC_step>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #62 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_luaC__step_673 ' EQI4
 mov r2, ##-2000 ' reg ARG con
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaE__setdebt
 add SP, #4 ' CALL addrg
 jmp #\@C_luaC__step_674 ' JUMPV addrg
C_luaC__step_673
 mov r22, r21
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_luaC__step_677 ' EQI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_luaC__step_675 ' EQU4
C_luaC__step_677
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79022_696de099_genstep_L000613
 add SP, #4 ' CALL addrg
 jmp #\@C_luaC__step_676 ' JUMPV addrg
C_luaC__step_675
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79028_696de099_incstep_L000661
 add SP, #4 ' CALL addrg
C_luaC__step_676
C_luaC__step_674
' C_luaC__step_672 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s79029_696de099_fullinc_L000678 ' <symbol:fullinc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wcz
 if_a jmp #\C_s79029_696de099_fullinc_L000678_680 ' GTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7902_696de099_entersweep_L000016 ' CALL addrg
C_s79029_696de099_fullinc_L000678_680
 mov r2, #256 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #57 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #128 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, #256 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__runtilstate
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s7901i_696de099_setpause_L000520 ' CALL addrg
' C_s79029_696de099_fullinc_L000678_679 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaC_fullgc

 alignl ' align long
C_luaC__fullgc ' <symbol:luaC_fullgc>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #63 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #58 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_luaC__fullgc_683 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79029_696de099_fullinc_L000678
 add SP, #4 ' CALL addrg
 jmp #\@C_luaC__fullgc_684 ' JUMPV addrg
C_luaC__fullgc_683
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s79020_696de099_fullgen_L000605
 add SP, #4 ' CALL addrg
C_luaC__fullgc_684
 mov r22, r19
 adds r22, #63 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_luaC__fullgc_682 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


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
C_s7901a_696de099_G_C_T_M__L000461_467_L000468 ' <symbol:467>
 byte 95
 byte 95
 byte 103
 byte 99
 byte 0

' Catalina Code

DAT ' code segment
' end
