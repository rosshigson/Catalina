' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export luaS_eqlngstr

 alignl ' align long
C_luaS__eqlngstr ' <symbol:luaS_eqlngstr>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRU4 reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_luaS__eqlngstr_16 ' EQU4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 cmp r19, r22 wz
 jmp #BRNZ
 long @C_luaS__eqlngstr_14 ' NEU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21
 adds r3, #16 ' ADDP4 coni
 mov r4, r23
 adds r4, #16 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaS__eqlngstr_14 ' NEI4
C_luaS__eqlngstr_16
 mov r17, #1 ' reg <- coni
 jmp #JMPA
 long @C_luaS__eqlngstr_15 ' JUMPV addrg
C_luaS__eqlngstr_14
 mov r17, #0 ' reg <- coni
C_luaS__eqlngstr_15
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaS__eqlngstr_12 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaS_hash

 alignl ' align long
C_luaS__hash ' <symbol:luaS_hash>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' BXORI/U
 xor r23, r3 ' BXORI/U (3)
 jmp #JMPA
 long @C_luaS__hash_21 ' JUMPV addrg
C_luaS__hash_18
 mov r22, r23
 shl r22, #5 ' LSHU4 coni
 mov r20, r23
 shr r20, #2 ' RSHU4 coni
 add r22, r20 ' ADDU (1)
 mov r20, r3
 sub r20, #1 ' SUBU4 coni
 adds r20, r4 ' ADDI/P (1)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 add r22, r20 ' ADDU (1)
 xor r23, r22 ' BXORI/U (1)
' C_luaS__hash_19 ' (symbol refcount = 0)
 sub r3, #1 ' SUBU4 coni
C_luaS__hash_21
 cmp r3,  #0 wz
 jmp #BRNZ
 long @C_luaS__hash_18 ' NEU4
 mov r0, r23 ' CVI, CVU or LOAD
' C_luaS__hash_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaS_hashlongstr

 alignl ' align long
C_luaS__hashlongstr ' <symbol:luaS_hashlongstr>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaS__hashlongstr_23 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23
 adds r4, #16 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__hash
 add SP, #8 ' CALL addrg
 mov RI, r22
 mov BC, r0
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaS__hashlongstr_23
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRU4 reg
' C_luaS__hashlongstr_22 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s9oc_68804e2d_tablerehash_L000025 ' <symbol:tablerehash>
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9oc_68804e2d_tablerehash_L000025_30 ' JUMPV addrg
C_s9oc_68804e2d_tablerehash_L000025_27
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 adds r22, r4 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_s9oc_68804e2d_tablerehash_L000025_28 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_s9oc_68804e2d_tablerehash_L000025_30
 cmps r23, r2 wz,wc
 jmp #BR_B
 long @C_s9oc_68804e2d_tablerehash_L000025_27 ' LTI4
 mov r23, #0 ' reg <- coni
 jmp #JMPA
 long @C_s9oc_68804e2d_tablerehash_L000025_34 ' JUMPV addrg
C_s9oc_68804e2d_tablerehash_L000025_31
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 adds r22, r4 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 adds r22, r4 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s9oc_68804e2d_tablerehash_L000025_36 ' JUMPV addrg
C_s9oc_68804e2d_tablerehash_L000025_35
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r2
 subs r20, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (1)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, r19
 shl r20, #2 ' LSHU4 coni
 adds r20, r4 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 shl r22, #2 ' LSHU4 coni
 adds r22, r4 ' ADDI/P (1)
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 mov r21, r17 ' CVI, CVU or LOAD
C_s9oc_68804e2d_tablerehash_L000025_36
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s9oc_68804e2d_tablerehash_L000025_35 ' NEU4
' C_s9oc_68804e2d_tablerehash_L000025_32 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_s9oc_68804e2d_tablerehash_L000025_34
 cmps r23, r3 wz,wc
 jmp #BR_B
 long @C_s9oc_68804e2d_tablerehash_L000025_31 ' LTI4
' C_s9oc_68804e2d_tablerehash_L000025_26 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaS_resize

 alignl ' align long
C_luaS__resize ' <symbol:luaS_resize>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r17, r22
 adds r17, #24 ' ADDP4 coni
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRI4 reg
 cmps r21, r19 wz,wc
 jmp #BRAE
 long @C_luaS__resize_39 ' GEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9oc_68804e2d_tablerehash_L000025
 add SP, #8 ' CALL addrg
C_luaS__resize_39
 mov r22, r21 ' CVI, CVU or LOAD
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #2 ' LSHU4 coni
 mov RI, r17
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__realloc_
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaS__resize_41 ' NEU4
 cmps r21, r19 wz,wc
 jmp #BRAE
 long @C_luaS__resize_42 ' GEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, r17
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9oc_68804e2d_tablerehash_L000025
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaS__resize_42 ' JUMPV addrg
C_luaS__resize_41
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r17
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 cmps r21, r19 wz,wc
 jmp #BRBE
 long @C_luaS__resize_45 ' LEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9oc_68804e2d_tablerehash_L000025
 add SP, #8 ' CALL addrg
C_luaS__resize_45
C_luaS__resize_42
' C_luaS__resize_38 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaS_clearcache

 alignl ' align long
C_luaS__clearcache ' <symbol:luaS_clearcache>
 jmp #PSHM
 long $f40000 ' save registers
 mov r21, #0 ' reg <- coni
C_luaS__clearcache_48
 mov r23, #0 ' reg <- coni
C_luaS__clearcache_52
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 shl r20, #3 ' LSHI4 coni
 mov r18, r2
 adds r18, #288 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
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
 long @C_luaS__clearcache_56 ' EQI4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 shl r20, #3 ' LSHI4 coni
 mov r18, r2
 adds r18, #288 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 adds r22, r20 ' ADDI/P (1)
 mov r20, r2
 adds r20, #148 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_luaS__clearcache_56
' C_luaS__clearcache_53 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #2 wz,wc
 jmp #BR_B
 long @C_luaS__clearcache_52 ' LTI4
' C_luaS__clearcache_49 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #53 wz,wc
 jmp #BR_B
 long @C_luaS__clearcache_48 ' LTI4
' C_luaS__clearcache_47 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaS_init

 alignl ' align long
C_luaS__init ' <symbol:luaS_init>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r15, r22
 adds r15, #24 ' ADDP4 coni
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long 512
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov RI, r15
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #128 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov RI, r15
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9oc_68804e2d_tablerehash_L000025
 add SP, #8 ' CALL addrg
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov r20, #128 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #17 ' reg ARG coni
 jmp #LODL
 long @C_luaS__init_59_L000060
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r20, r19
 adds r20, #148 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #148 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__fix
 add SP, #4 ' CALL addrg
 mov r17, #0 ' reg <- coni
C_luaS__init_61
 mov r21, #0 ' reg <- coni
C_luaS__init_65
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r17
 shl r20, #3 ' LSHI4 coni
 mov r18, r19
 adds r18, #288 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 adds r22, r20 ' ADDI/P (1)
 mov r20, r19
 adds r20, #148 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_luaS__init_66 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #2 wz,wc
 jmp #BR_B
 long @C_luaS__init_65 ' LTI4
' C_luaS__init_62 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #53 wz,wc
 jmp #BR_B
 long @C_luaS__init_61 ' LTI4
' C_luaS__init_58 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9oc2_68804e2d_createstrobj_L000069 ' <symbol:createstrobj>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #1 ' reg <- coni
 mov r20, r21
 add r20, #1 ' ADDU4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 add r22, #16 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRP4 regl
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r15
 adds r22, #6 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 adds r22, r21 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_s9oc2_68804e2d_createstrobj_L000069_70 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaS_createlngstrobj

 alignl ' align long
C_luaS__createlngstrobj ' <symbol:luaS_createlngstrobj>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRU4 reg
 mov r3, #20 ' reg ARG coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9oc2_68804e2d_createstrobj_L000069
 add SP, #12 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNU4 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C_luaS__createlngstrobj_71 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaS_remove

 alignl ' align long
C_luaS__remove ' <symbol:luaS_remove>
 jmp #PSHM
 long $f00000 ' save registers
 mov r22, r3
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r21, r22
 adds r21, #24 ' ADDP4 coni
 mov r22, r2
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 and r22, r20 ' BANDI/U (1)
 shl r22, #2 ' LSHI4 coni
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C_luaS__remove_74 ' JUMPV addrg
C_luaS__remove_73
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r23, r22
 adds r23, #12 ' ADDP4 coni
C_luaS__remove_74
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_luaS__remove_73 ' NEU4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
' C_luaS__remove_72 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s9oc3_68804e2d_growstrtab_L000076 ' <symbol:growstrtab>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 2147483647
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s9oc3_68804e2d_growstrtab_L000076_78 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__fullgc
 add SP, #4 ' CALL addrg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 2147483647
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s9oc3_68804e2d_growstrtab_L000076_80 ' NEI4
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
C_s9oc3_68804e2d_growstrtab_L000076_80
C_s9oc3_68804e2d_growstrtab_L000076_78
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long 536870911
 mov r20, RI ' reg <- con
 cmps r22, r20 wz,wc
 jmp #BR_A
 long @C_s9oc3_68804e2d_growstrtab_L000076_82 ' GTI4
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r2, r22
 shl r2, #1 ' LSHI4 coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__resize
 add SP, #4 ' CALL addrg
C_s9oc3_68804e2d_growstrtab_L000076_82
' C_s9oc3_68804e2d_growstrtab_L000076_77 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s9oc4_68804e2d_internshrstr_L000084 ' <symbol:internshrstr>
 jmp #NEWF
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r13, r15
 adds r13, #24 ' ADDP4 coni
 mov r22, r15
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRU4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__hash
 add SP, #8 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 and r22, r9 ' BANDI/U (2)
 shl r22, #2 ' LSHI4 coni
 mov RI, r13
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov RI, r11
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_s9oc4_68804e2d_internshrstr_L000084_89 ' JUMPV addrg
C_s9oc4_68804e2d_internshrstr_L000084_86
 mov r22, r17
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmp r19, r22 wz
 jmp #BRNZ
 long @C_s9oc4_68804e2d_internshrstr_L000084_90 ' NEU4
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r17
 adds r3, #16 ' ADDP4 coni
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s9oc4_68804e2d_internshrstr_L000084_90 ' NEI4
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r15
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 xor r20, #24 ' BXORI4 coni
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s9oc4_68804e2d_internshrstr_L000084_92 ' EQI4
 mov r22, r17
 adds r22, #5 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 xor r20, #24 ' BXORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s9oc4_68804e2d_internshrstr_L000084_92
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s9oc4_68804e2d_internshrstr_L000084_85 ' JUMPV addrg
C_s9oc4_68804e2d_internshrstr_L000084_90
' C_s9oc4_68804e2d_internshrstr_L000084_87 ' (symbol refcount = 0)
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
C_s9oc4_68804e2d_internshrstr_L000084_89
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s9oc4_68804e2d_internshrstr_L000084_86 ' NEU4
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r13
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_s9oc4_68804e2d_internshrstr_L000084_94 ' LTI4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9oc3_68804e2d_growstrtab_L000076
 add SP, #4 ' CALL addrg
 mov r22, r13
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 and r22, r9 ' BANDI/U (2)
 shl r22, #2 ' LSHI4 coni
 mov RI, r13
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
C_s9oc4_68804e2d_internshrstr_L000084_94
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, #4 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9oc2_68804e2d_createstrobj_L000069
 add SP, #12 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17
 adds r4, #16 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, r17
 adds r22, #7 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r11
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r11
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 adds r20, #1 ' ADDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
C_s9oc4_68804e2d_internshrstr_L000084_85
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaS_newlstr

 alignl ' align long
C_luaS__newlstr ' <symbol:luaS_newlstr>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmp r19,  #40 wz,wc 
 jmp #BR_A
 long @C_luaS__newlstr_97 ' GTU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s9oc4_68804e2d_internshrstr_L000084
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaS__newlstr_96 ' JUMPV addrg
C_luaS__newlstr_97
 jmp #LODL
 long $7fffffeb
 mov r22, RI ' reg <- con
 cmp r19, r22 wz,wc 
 jmp #BR_B
 long @C_luaS__newlstr_99' LTU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
C_luaS__newlstr_99
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__createlngstrobj
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r4, r22
 adds r4, #16 ' ADDP4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
C_luaS__newlstr_96
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaS_new

 alignl ' align long
C_luaS__new ' <symbol:luaS_new>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, #53 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov RI, FP
 sub RI, #-(-8)
 wrlong r1, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 shl r22, #3 ' LSHU4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #288 ' ADDP4 coni
 mov r17, r22 ' ADDI/P
 adds r17, r20 ' ADDI/P (3)
 mov r19, #0 ' reg <- coni
C_luaS__new_102
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #16 ' ADDP4 coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaS__new_106 ' NEI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 adds r22, r17 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaS__new_101 ' JUMPV addrg
C_luaS__new_106
' C_luaS__new_103 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #2 wz,wc
 jmp #BR_B
 long @C_luaS__new_102 ' LTI4
 mov r19, #1 ' reg <- coni
C_luaS__new_108
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r22 ' ADDI/P
 adds r20, r17 ' ADDI/P (3)
 subs r22, #4 ' SUBI4 coni
 adds r22, r17 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
' C_luaS__new_109 ' (symbol refcount = 0)
 subs r19, #1 ' SUBI4 coni
 cmps r19,  #0 wz,wc
 jmp #BR_A
 long @C_luaS__new_108 ' GTI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov RI, r17
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r17
 jmp #RLNG
 mov r0, BC ' reg <- INDIRP4 reg
C_luaS__new_101
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaS_newudata

 alignl ' align long
C_luaS__newudata ' <symbol:luaS_newudata>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_luaS__newudata_116 ' NEI4
 mov r13, #16 ' reg <- coni
 jmp #JMPA
 long @C_luaS__newudata_117 ' JUMPV addrg
C_luaS__newudata_116
 mov r22, r19 ' CVI, CVU or LOAD
 shl r22, #3 ' LSHU4 coni
 mov r13, r22
 add r13, #20 ' ADDU4 coni
C_luaS__newudata_117
 jmp #LODL
 long $7fffffff
 mov r22, RI ' reg <- con
 sub r22, r13 ' SUBU (1)
 cmp r21, r22 wz,wc 
 jmp #BRBE
 long @C_luaS__newudata_113 ' LEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
C_luaS__newudata_113
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_luaS__newudata_119 ' NEI4
 mov r11, #16 ' reg <- coni
 jmp #JMPA
 long @C_luaS__newudata_120 ' JUMPV addrg
C_luaS__newudata_119
 mov r22, r19 ' CVI, CVU or LOAD
 shl r22, #3 ' LSHU4 coni
 mov r11, r22
 add r11, #20 ' ADDU4 coni
C_luaS__newudata_120
 mov r2, r11 ' ADDU
 add r2, r21 ' ADDU (3)
 mov r3, #7 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r15, r22 ' reg <- INDIRP4 regl
 mov r22, r15
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r15
 adds r22, #6 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r15
 adds r22, #12 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r17, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaS__newudata_124 ' JUMPV addrg
C_luaS__newudata_121
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 mov r20, r15
 adds r20, #20 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaS__newudata_122 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_luaS__newudata_124
 cmps r17, r19 wz,wc
 jmp #BR_B
 long @C_luaS__newudata_121 ' LTI4
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaS__newudata_112 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import luaC_newobj

' Catalina Import luaC_fullgc

' Catalina Import luaC_fix

' Catalina Import luaD_throw

' Catalina Import luaM_malloc_

' Catalina Import luaM_realloc_

' Catalina Import luaM_toobig

' Catalina Import strlen

' Catalina Import strcmp

' Catalina Import memcmp

' Catalina Import memcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaS__init_59_L000060 ' <symbol:59>
 byte 110
 byte 111
 byte 116
 byte 32
 byte 101
 byte 110
 byte 111
 byte 117
 byte 103
 byte 104
 byte 32
 byte 109
 byte 101
 byte 109
 byte 111
 byte 114
 byte 121
 byte 0

' Catalina Code

DAT ' code segment
' end
