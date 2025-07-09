' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export luaD_seterrorobj

 alignl ' align long
C_luaD__seterrorobj ' <symbol:luaD_seterrorobj>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C_luaD__seterrorobj_30 ' EQI4
 cmps r21,  #4 wz
 jmp #BR_Z
 long @C_luaD__seterrorobj_26 ' EQI4
 cmps r21,  #5 wz
 jmp #BR_Z
 long @C_luaD__seterrorobj_27 ' EQI4
 jmp #JMPA
 long @C_luaD__seterrorobj_24 ' JUMPV addrg
C_luaD__seterrorobj_26
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #148 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaD__seterrorobj_25 ' JUMPV addrg
C_luaD__seterrorobj_27
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r2, #23 ' reg ARG coni
 jmp #LODL
 long @C_luaD__seterrorobj_28_L000029
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaD__seterrorobj_25 ' JUMPV addrg
C_luaD__seterrorobj_30
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaD__seterrorobj_25 ' JUMPV addrg
C_luaD__seterrorobj_24
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_luaD__seterrorobj_25
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r19
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_luaD__seterrorobj_23 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaD_throw

 alignl ' align long
C_luaD__throw ' <symbol:luaD_throw>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaD__throw_32 ' EQU4
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r3, r22
 adds r3, #4 ' ADDP4 coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_longjmp
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaD__throw_33 ' JUMPV addrg
C_luaD__throw_32
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaE__resetthread
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #144 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaD__throw_34 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #144 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
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
 sub RI, #-(-12)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #144 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaD__throw_35 ' JUMPV addrg
C_luaD__throw_34
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #140 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaD__throw_36 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #140 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r22
 jmp #CALI ' CALL indirect
C_luaD__throw_36
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_abort ' CALL addrg
C_luaD__throw_35
C_luaD__throw_33
' C_luaD__throw_31 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export luaD_rawrunprotected

 alignl ' align long
C_luaD__rawrunprotected ' <symbol:luaD_rawrunprotected>
 jmp #NEWF
 sub SP, #104
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-108)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-104)
 wrlong r20, RI ' ASGNP4 addrli reg
 mov r20, FP
 sub r20, #-(-104) ' reg <- addrli
 mov RI, r22
 mov BC, r20 
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, #0 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-100) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setjmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_luaD__rawrunprotected_40 ' NEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r21
 jmp #CALI
 add SP, #4 ' CALL indirect
C_luaD__rawrunprotected_40
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-104) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-108) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_luaD__rawrunprotected_38 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #104 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dg1_686cc309_correctstack_L000044 ' <symbol:correctstack>
 jmp #PSHM
 long $f40000 ' save registers
 mov r22, r4
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r3 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #8 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 shl r20, #3 ' LSHI4 coni
 adds r20, r2 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r3 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #8 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 shl r20, #3 ' LSHI4 coni
 adds r20, r2 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r4
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_s5dg1_686cc309_correctstack_L000044_49 ' JUMPV addrg
C_s5dg1_686cc309_correctstack_L000044_46
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r3 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #8 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 shl r20, #3 ' LSHI4 coni
 adds r20, r2 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_s5dg1_686cc309_correctstack_L000044_47 ' (symbol refcount = 0)
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_s5dg1_686cc309_correctstack_L000044_49
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s5dg1_686cc309_correctstack_L000044_46 ' NEU4
 mov r22, r4
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_s5dg1_686cc309_correctstack_L000044_53 ' JUMPV addrg
C_s5dg1_686cc309_correctstack_L000044_50
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r3 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov r18, #8 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 shl r20, #3 ' LSHI4 coni
 adds r20, r2 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r3 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0
 shl r22, #3 ' LSHI4 coni
 adds r22, r2 ' ADDI/P (1)
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5dg1_686cc309_correctstack_L000044_54 ' NEI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_s5dg1_686cc309_correctstack_L000044_54
' C_s5dg1_686cc309_correctstack_L000044_51 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
C_s5dg1_686cc309_correctstack_L000044_53
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s5dg1_686cc309_correctstack_L000044_50 ' NEU4
' C_s5dg1_686cc309_correctstack_L000044_45 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaD_reallocstack

 alignl ' align long
C_luaD__reallocstack ' <symbol:luaD_reallocstack>
 jmp #NEWF
 jmp #PSHM
 long $fea800 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #5 ' ADDI4 coni
 mov r2, r22
 shl r2, #3 ' LSHU4 coni
 mov r3, #0 ' reg ARG coni
 jmp #LODL
 long 0
 mov r4, RI ' reg ARG con
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__realloc_
 add SP, #12 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_luaD__reallocstack_57 ' NEU4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_luaD__reallocstack_59 ' EQI4
 mov r2, #4 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_luaD__reallocstack_60 ' JUMPV addrg
C_luaD__reallocstack_59
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaD__reallocstack_56 ' JUMPV addrg
C_luaD__reallocstack_60
C_luaD__reallocstack_57
 cmps r13, r21 wz,wc
 jmp #BR_A
 long @C_luaD__reallocstack_62 ' GTI4
 mov r11, r13 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaD__reallocstack_63 ' JUMPV addrg
C_luaD__reallocstack_62
 mov r11, r21 ' CVI, CVU or LOAD
C_luaD__reallocstack_63
 mov r17, r11
 adds r17, #5 ' ADDI4 coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r2, r22
 shl r2, #3 ' LSHU4 coni
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r15 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaD__reallocstack_67 ' JUMPV addrg
C_luaD__reallocstack_64
 mov r22, r17
 shl r22, #3 ' LSHI4 coni
 adds r22, r15 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaD__reallocstack_65 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_luaD__reallocstack_67
 mov r22, r21
 adds r22, #5 ' ADDI4 coni
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_luaD__reallocstack_64 ' LTI4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg1_686cc309_correctstack_L000044
 add SP, #8 ' CALL addrg
 mov r22, r13
 adds r22, #5 ' ADDI4 coni
 mov r2, r22
 shl r2, #3 ' LSHU4 coni
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 mov BC, r15
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov r20, r21
 shl r20, #3 ' LSHI4 coni
 mov r18, r23
 adds r18, #28 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, #1 ' reg <- coni
C_luaD__reallocstack_56
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaD_growstack

 alignl ' align long
C_luaD__growstack ' <symbol:luaD_growstack>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long 1000000
 mov r20, RI ' reg <- con
 cmps r22, r20 wz,wc
 jmp #BRBE
 long @C_luaD__growstack_69 ' LEI4
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_luaD__growstack_71 ' EQI4
 mov r2, #5 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
C_luaD__growstack_71
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaD__growstack_68 ' JUMPV addrg
C_luaD__growstack_69
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r17, r22
 shl r17, #1 ' LSHI4 coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 1000000
 mov r22, RI ' reg <- con
 cmps r17, r22 wz,wc
 jmp #BRBE
 long @C_luaD__growstack_73 ' LEI4
 jmp #LODL
 long 1000000
 mov r17, RI ' reg <- con
C_luaD__growstack_73
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r17, r22 wz,wc
 jmp #BRAE
 long @C_luaD__growstack_75 ' GEI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRI4 regl
C_luaD__growstack_75
 jmp #LODL
 long 1000000
 mov r22, RI ' reg <- con
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_luaD__growstack_77 ' GTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__reallocstack
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaD__growstack_68 ' JUMPV addrg
C_luaD__growstack_77
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000200
 mov r3, RI ' reg ARG con
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__reallocstack
 add SP, #8 ' CALL addrg
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C_luaD__growstack_79 ' EQI4
 jmp #LODL
 long @C_luaD__growstack_81_L000082
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_luaD__growstack_79
 mov r0, #0 ' reg <- coni
C_luaD__growstack_68
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dg3_686cc309_stackinuse_L000083 ' <symbol:stackinuse>
 jmp #PSHM
 long $f80000 ' save registers
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_s5dg3_686cc309_stackinuse_L000083_88 ' JUMPV addrg
C_s5dg3_686cc309_stackinuse_L000083_85
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s5dg3_686cc309_stackinuse_L000083_89 ' GEU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
C_s5dg3_686cc309_stackinuse_L000083_89
' C_s5dg3_686cc309_stackinuse_L000083_86 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
C_s5dg3_686cc309_stackinuse_L000083_88
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s5dg3_686cc309_stackinuse_L000083_85 ' NEU4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r2
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r19, r0
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #20 wz,wc
 jmp #BRAE
 long @C_s5dg3_686cc309_stackinuse_L000083_91 ' GEI4
 mov r19, #20 ' reg <- coni
C_s5dg3_686cc309_stackinuse_L000083_91
 mov r0, r19 ' CVI, CVU or LOAD
' C_s5dg3_686cc309_stackinuse_L000083_84 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export luaD_shrinkstack

 alignl ' align long
C_luaD__shrinkstack ' <symbol:luaD_shrinkstack>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s5dg3_686cc309_stackinuse_L000083 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21
 shl r22, #1 ' LSHI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #3 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000000
 mov r22, RI ' reg <- con
 cmps r19, r22 wz,wc
 jmp #BRBE
 long @C_luaD__shrinkstack_94 ' LEI4
 jmp #LODL
 long 1000000
 mov r22, RI ' reg <- con
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 cmps r20, r22 wz,wc
 jmp #BRBE
 long @C_luaD__shrinkstack_96 ' LEI4
 jmp #LODL
 long 1000000
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_luaD__shrinkstack_96
C_luaD__shrinkstack_94
 jmp #LODL
 long 1000000
 mov r22, RI ' reg <- con
 cmps r21, r22 wz,wc
 jmp #BR_A
 long @C_luaD__shrinkstack_98 ' GTI4
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r0, r19 wz,wc
 jmp #BRBE
 long @C_luaD__shrinkstack_98 ' LEI4
 mov r2, #0 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__reallocstack
 add SP, #8 ' CALL addrg
C_luaD__shrinkstack_98
' C_luaD__shrinkstack_99 ' (symbol refcount = 0)
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaE__shrinkC_I_ ' CALL addrg
' C_luaD__shrinkstack_93 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaD_inctop

 alignl ' align long
C_luaD__inctop ' <symbol:luaD_inctop>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
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
 cmps r0,  #1 wz,wc
 jmp #BR_A
 long @C_luaD__inctop_101 ' GTI4
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
C_luaD__inctop_101
' C_luaD__inctop_102 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_luaD__inctop_100 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaD_hook

 alignl ' align long
C_luaD__hook ' <symbol:luaD_hook>
 jmp #NEWF
 sub SP, #124
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #88 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_luaD__hook_104 ' EQU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaD__hook_104 ' EQI4
 mov r22, #8 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r20
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov RI, FP
 sub RI, #-(-124)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-128)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-120)
 wrlong r23, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-96)
 wrlong r21, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r15, RI ' ASGNP4 addrli reg
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_luaD__hook_108 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 or r22, #256 ' BORI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r15
 adds r22, #30 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
C_luaD__hook_108
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaD__hook_110 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r15
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_luaD__hook_110 ' GEU4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov r20, r15
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_luaD__hook_110
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r20
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 cmps r0,  #20 wz,wc
 jmp #BR_A
 long @C_luaD__hook_112 ' GTI4
 mov r2, #1 ' reg ARG coni
 mov r3, #20 ' reg ARG coni
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
C_luaD__hook_112
' C_luaD__hook_113 ' (symbol refcount = 0)
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #160 ' ADDP4 coni
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_luaD__hook_114 ' GEU4
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #160 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_luaD__hook_114
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r2, FP
 sub r2, #-(-120) ' reg ARG ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #4 ' CALL indirect
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #7 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-128) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r18, FP
 add r18, #8 ' reg <- addrfi
 rdlong r18, r18 ' reg <- INDIRP4 regl
 adds r18, #28 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 mov r18, FP
 sub r18, #-(-124) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r18 ' ADDI/P (2)
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 mov r18, FP
 sub r18, #-(-12) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRI4 regl
 xor r18, all_1s ' BCOMI4
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
C_luaD__hook_104
' C_luaD__hook_103 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #124 ' framesize
 jmp #RETF


' Catalina Export luaD_hookcall

 alignl ' align long
C_luaD__hookcall ' <symbol:luaD_hookcall>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaD__hookcall_117 ' EQI4
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #32 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaD__hookcall_120 ' EQI4
 mov r19, #4 ' reg <- coni
 jmp #JMPA
 long @C_luaD__hookcall_121 ' JUMPV addrg
C_luaD__hookcall_120
 mov r19, #0 ' reg <- coni
C_luaD__hookcall_121
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNI4 addrli reg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, #1 ' reg ARG coni
 jmp #LODL
 long -1
 mov r4, RI ' reg ARG con
 mov RI, FP
 sub RI, #-(-8)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaD__hook
 add SP, #16 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_luaD__hookcall_117
' C_luaD__hookcall_116 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dg4_686cc309_rethook_L000122 ' <symbol:rethook>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5dg4_686cc309_rethook_L000122_124 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5dg4_686cc309_rethook_L000122_126 ' NEI4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5dg4_686cc309_rethook_L000122_128 ' EQI4
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #6 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 adds r22, r20 ' ADDI/P (1)
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s5dg4_686cc309_rethook_L000122_128
C_s5dg4_686cc309_rethook_L000122_126
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #3 ' LSHI4 coni
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r21
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m2 ' zero extend
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 jmp #LODL
 long -1
 mov r4, RI ' reg ARG con
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaD__hook
 add SP, #16 ' CALL addrg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #3 ' LSHI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
C_s5dg4_686cc309_rethook_L000122_124
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5dg4_686cc309_rethook_L000122_130 ' NEI4
 mov r22, r23
 adds r22, #100 ' ADDP4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r21
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r18, #12 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r18, #52 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 sub r20, r18 ' SUBU (1)
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 subs r20, #1 ' SUBI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
C_s5dg4_686cc309_rethook_L000122_130
' C_s5dg4_686cc309_rethook_L000122_123 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export luaD_tryfuncTM

 alignl ' align long
C_luaD__tryfuncT_M_ ' <symbol:luaD_tryfuncTM>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
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
 cmps r0,  #1 wz,wc
 jmp #BR_A
 long @C_luaD__tryfuncT_M__133 ' GTI4
 mov r22, r21 ' CVI, CVU or LOAD
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
 long @C_luaD__tryfuncT_M__135 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_luaD__tryfuncT_M__135
 mov r22, #1 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
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
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
C_luaD__tryfuncT_M__133
' C_luaD__tryfuncT_M__134 ' (symbol refcount = 0)
 mov r2, #23 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_luaD__tryfuncT_M__137 ' NEI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__callerror
 add SP, #4 ' CALL addrg
C_luaD__tryfuncT_M__137
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r19, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaD__tryfuncT_M__142 ' JUMPV addrg
C_luaD__tryfuncT_M__139
 mov r15, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 mov r13, r19 ' ADDI/P
 adds r13, r22 ' ADDI/P (3)
 mov r0, r15 ' CVI, CVU or LOAD
 mov r1, r13 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaD__tryfuncT_M__140 ' (symbol refcount = 0)
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r19, r22 ' ADDI/P (1)
C_luaD__tryfuncT_M__142
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz,wc 
 jmp #BR_A
 long @C_luaD__tryfuncT_M__139 ' GTU4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r15, r21 ' CVI, CVU or LOAD
 mov r13, r17 ' CVI, CVU or LOAD
 mov r0, r15 ' CVI, CVU or LOAD
 mov r1, r13 ' CVI, CVU or LOAD
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, r13
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_luaD__tryfuncT_M__132 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dg5_686cc309_moveresults_L000143 ' <symbol:moveresults>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_s5dg5_686cc309_moveresults_L000143_151 ' EQI4
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s5dg5_686cc309_moveresults_L000143_147 ' EQI4
 cmps r17,  #1 wz
 jmp #BR_Z
 long @C_s5dg5_686cc309_moveresults_L000143_148 ' EQI4
 jmp #JMPA
 long @C_s5dg5_686cc309_moveresults_L000143_145 ' JUMPV addrg
C_s5dg5_686cc309_moveresults_L000143_147
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s5dg5_686cc309_moveresults_L000143_144 ' JUMPV addrg
C_s5dg5_686cc309_moveresults_L000143_148
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_s5dg5_686cc309_moveresults_L000143_149 ' NEI4
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_s5dg5_686cc309_moveresults_L000143_150 ' JUMPV addrg
C_s5dg5_686cc309_moveresults_L000143_149
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r1, r22 ' reg <- INDIRP4 regl
 jmp #CPYB
 long 4 ' ASGNB
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s5dg5_686cc309_moveresults_L000143_150
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_s5dg5_686cc309_moveresults_L000143_144 ' JUMPV addrg
C_s5dg5_686cc309_moveresults_L000143_151
 mov r17, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s5dg5_686cc309_moveresults_L000143_146 ' JUMPV addrg
C_s5dg5_686cc309_moveresults_L000143_145
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r17, r22 wz,wc
 jmp #BRAE
 long @C_s5dg5_686cc309_moveresults_L000143_146 ' GEI4
 mov r22, r21 ' CVI, CVU or LOAD
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
 long 512
 mov r18, RI ' reg <- con
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
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
 long -513
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5dg5_686cc309_moveresults_L000143_154 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg4_686cc309_rethook_L000122
 add SP, #8 ' CALL addrg
C_s5dg5_686cc309_moveresults_L000143_154
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
 neg r22, r17 ' NEGI4
 mov r17, r22
 subs r17, #3 ' SUBI4 coni
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r17, r22 wz
 jmp #BRNZ
 long @C_s5dg5_686cc309_moveresults_L000143_146 ' NEI4
 mov r17, r19 ' CVI, CVU or LOAD
C_s5dg5_686cc309_moveresults_L000143_146
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r13, r22 ' SUBI/P
 subs r13, r20 ' SUBI/P (3)
 cmps r19, r17 wz,wc
 jmp #BRBE
 long @C_s5dg5_686cc309_moveresults_L000143_158 ' LEI4
 mov r19, r17 ' CVI, CVU or LOAD
C_s5dg5_686cc309_moveresults_L000143_158
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_s5dg5_686cc309_moveresults_L000143_163 ' JUMPV addrg
C_s5dg5_686cc309_moveresults_L000143_160
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 mov r11, r22 ' ADDI/P
 adds r11, r21 ' ADDI/P (3)
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 mov r9, r22 ' ADDI/P
 adds r9, r13 ' ADDI/P (3)
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
' C_s5dg5_686cc309_moveresults_L000143_161 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s5dg5_686cc309_moveresults_L000143_163
 cmps r15, r19 wz,wc
 jmp #BR_B
 long @C_s5dg5_686cc309_moveresults_L000143_160 ' LTI4
 jmp #JMPA
 long @C_s5dg5_686cc309_moveresults_L000143_167 ' JUMPV addrg
C_s5dg5_686cc309_moveresults_L000143_164
 mov r22, r15
 shl r22, #3 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s5dg5_686cc309_moveresults_L000143_165 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s5dg5_686cc309_moveresults_L000143_167
 cmps r15, r17 wz,wc
 jmp #BR_B
 long @C_s5dg5_686cc309_moveresults_L000143_164 ' LTI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r17
 shl r20, #3 ' LSHI4 coni
 adds r20, r21 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_s5dg5_686cc309_moveresults_L000143_144
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaD_poscall

 alignl ' align long
C_luaD__poscall ' <symbol:luaD_poscall>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRI2 reg
 mov r17, r22 ' CVII
 mov r17, r22 ' CVII
 shl r17, #16
 sar r17, #16 ' sign extend
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_luaD__poscall_169 ' EQI4
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r17, r22 wz,wc
 jmp #BR_B
 long @C_luaD__poscall_169 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg4_686cc309_rethook_L000122
 add SP, #8 ' CALL addrg
C_luaD__poscall_169
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, r21
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg5_686cc309_moveresults_L000143
 add SP, #12 ' CALL addrg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_luaD__poscall_168 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5dg6_686cc309_prepC_allI_nfo_L000171 ' <symbol:prepCallInfo>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s5dg6_686cc309_prepC_allI_nfo_L000171_174 ' EQU4
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r13, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_s5dg6_686cc309_prepC_allI_nfo_L000171_175 ' JUMPV addrg
C_s5dg6_686cc309_prepC_allI_nfo_L000171_174
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaE__extendC_I_ ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r13, r20 ' CVI, CVU or LOAD
C_s5dg6_686cc309_prepC_allI_nfo_L000171_175
 mov RI, r22
 mov BC, r13
 jmp #WLNG ' ASGNP4 reg reg
 mov r15, r13 ' CVI, CVU or LOAD
 mov RI, r15
 mov BC, r23
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #32 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNI2 reg reg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_s5dg6_686cc309_prepC_allI_nfo_L000171_172 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5dg7_686cc309_precallC__L000176 ' <symbol:precallC>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
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
 cmps r0,  #20 wz,wc
 jmp #BR_A
 long @C_s5dg7_686cc309_precallC__L000176_178 ' GTI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-12)
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
 long @C_s5dg7_686cc309_precallC__L000176_180 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_s5dg7_686cc309_precallC__L000176_180
 mov r2, #1 ' reg ARG coni
 mov r3, #20 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
C_s5dg7_686cc309_precallC__L000176_178
' C_s5dg7_686cc309_precallC__L000176_179 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r2, r22
 adds r2, #160 ' ADDP4 coni
 mov r3, #2 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s5dg6_686cc309_prepC_allI_nfo_L000171
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #112 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 and r22, #1 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5dg7_686cc309_precallC__L000176_182 ' EQI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0
 subs r22, #1 ' SUBI4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, #1 ' reg ARG coni
 jmp #LODL
 long -1
 mov r4, RI ' reg ARG con
 mov r5, #0 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaD__hook
 add SP, #16 ' CALL addrg
C_s5dg7_686cc309_precallC__L000176_182
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 mov RI, r17
 jmp #CALI ' CALL indirect
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
 mov r0, r15 ' CVI, CVU or LOAD
' C_s5dg7_686cc309_precallC__L000176_177 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaD_pretailcall

 alignl ' align long
C_luaD__pretailcall ' <symbol:luaD_pretailcall>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $feaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
C_luaD__pretailcall_185
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r15, r22
 and r15, #63 ' BANDI4 coni
 mov r22, #22 ' reg <- coni
 cmps r15, r22 wz
 jmp #BR_Z
 long @C_luaD__pretailcall_190 ' EQI4
 cmps r15, r22 wz,wc
 jmp #BR_A
 long @C_luaD__pretailcall_205 ' GTI4
' C_luaD__pretailcall_204 ' (symbol refcount = 0)
 cmps r15,  #6 wz
 jmp #BR_Z
 long @C_luaD__pretailcall_191 ' EQI4
 jmp #JMPA
 long @C_luaD__pretailcall_186 ' JUMPV addrg
C_luaD__pretailcall_205
 cmps r15,  #38 wz
 jmp #BR_Z
 long @C_luaD__pretailcall_189 ' EQI4
 jmp #JMPA
 long @C_luaD__pretailcall_186 ' JUMPV addrg
C_luaD__pretailcall_189
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg7_686cc309_precallC__L000176
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaD__pretailcall_184 ' JUMPV addrg
C_luaD__pretailcall_190
 mov RI, r21
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r4, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r5, RI ' reg ARG INDIR ADDRFi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg7_686cc309_precallC__L000176
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaD__pretailcall_184 ' JUMPV addrg
C_luaD__pretailcall_191
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r20
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 subs r22, r17 ' SUBI/P (1)
 cmps r0, r22 wz,wc
 jmp #BR_A
 long @C_luaD__pretailcall_192 ' GTI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
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
 long @C_luaD__pretailcall_194 ' LEI4
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_luaD__pretailcall_194
 mov r2, #1 ' reg ARG coni
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r3, r22 ' SUBI/P
 subs r3, r17 ' SUBI/P (3)
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
C_luaD__pretailcall_192
' C_luaD__pretailcall_193 ' (symbol refcount = 0)
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r17
 shl r20, #3 ' LSHI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r13, #0 ' reg <- coni
 jmp #JMPA
 long @C_luaD__pretailcall_199 ' JUMPV addrg
C_luaD__pretailcall_196
 mov r22, r13
 shl r22, #3 ' LSHI4 coni
 mov RI, r23
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r11, r22 ' ADDI/P
 adds r11, r20 ' ADDI/P (3)
 mov r22, r13
 shl r22, #3 ' LSHI4 coni
 mov r9, r22 ' ADDI/P
 adds r9, r21 ' ADDI/P (3)
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
' C_luaD__pretailcall_197 ' (symbol refcount = 0)
 adds r13, #1 ' ADDI4 coni
C_luaD__pretailcall_199
 cmps r13, r19 wz,wc
 jmp #BR_B
 long @C_luaD__pretailcall_196 ' LTI4
 mov RI, r23
 jmp #RLNG
 mov r21, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_luaD__pretailcall_203 ' JUMPV addrg
C_luaD__pretailcall_200
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 adds r22, r21 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaD__pretailcall_201 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_luaD__pretailcall_203
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r19, r22 wz,wc
 jmp #BRBE
 long @C_luaD__pretailcall_200 ' LEI4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #8 ' ADDP4 coni
 adds r20, r18 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 or r20, #32 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #12 ' ADDP4 coni
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 adds r20, r21 ' ADDI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaD__pretailcall_184 ' JUMPV addrg
C_luaD__pretailcall_186
 mov r2, r21 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__tryfuncT_M_
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 adds r19, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_luaD__pretailcall_185 ' JUMPV addrg
C_luaD__pretailcall_184
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export luaD_precall

 alignl ' align long
C_luaD__precall ' <symbol:luaD_precall>
 jmp #NEWF
 sub SP, #20
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
C_luaD__precall_207
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r17, r22
 and r17, #63 ' BANDI4 coni
 mov r22, #22 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_luaD__precall_212 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_luaD__precall_223 ' GTI4
' C_luaD__precall_222 ' (symbol refcount = 0)
 cmps r17,  #6 wz
 jmp #BR_Z
 long @C_luaD__precall_213 ' EQI4
 jmp #JMPA
 long @C_luaD__precall_208 ' JUMPV addrg
C_luaD__precall_223
 cmps r17,  #38 wz
 jmp #BR_Z
 long @C_luaD__precall_211 ' EQI4
 jmp #JMPA
 long @C_luaD__precall_208 ' JUMPV addrg
C_luaD__precall_211
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg7_686cc309_precallC__L000176
 add SP, #12 ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaD__precall_206 ' JUMPV addrg
C_luaD__precall_212
 mov RI, r21
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg7_686cc309_precallC__L000176
 add SP, #12 ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_luaD__precall_206 ' JUMPV addrg
C_luaD__precall_213
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r15, r0
 subs r15, #1 ' SUBI4 coni
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
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
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r0, r22 wz,wc
 jmp #BR_A
 long @C_luaD__precall_214 ' GTI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov RI, FP
 sub RI, #-(-24)
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
 long @C_luaD__precall_216 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaC__step ' CALL addrg
C_luaD__precall_216
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__growstack
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
C_luaD__precall_214
' C_luaD__precall_215 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, #0 ' reg ARG coni
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s5dg6_686cc309_prepC_allI_nfo_L000171
 add SP, #16 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #16 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 jmp #JMPA
 long @C_luaD__precall_221 ' JUMPV addrg
C_luaD__precall_218
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
 mov r22, r20
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_luaD__precall_219 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_luaD__precall_221
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r15, r22 wz,wc
 jmp #BR_B
 long @C_luaD__precall_218 ' LTI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRP4 regl
 jmp #JMPA
 long @C_luaD__precall_206 ' JUMPV addrg
C_luaD__precall_208
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__tryfuncT_M_
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_luaD__precall_207 ' JUMPV addrg
C_luaD__precall_206
 jmp #POPM ' restore registers
 add SP, #20 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dg8_686cc309_ccall_L000224 ' <symbol:ccall>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r17 ' CVI, CVU or LOAD
 add r20, r18 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #200 wz,wc 
 jmp #BR_B
 long @C_s5dg8_686cc309_ccall_L000224_226' LTU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaE__checkcstack ' CALL addrg
C_s5dg8_686cc309_ccall_L000224_226
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__precall
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s5dg8_686cc309_ccall_L000224_228 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #34 ' ADDP4 coni
 mov r20, #4 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__execute
 add SP, #4 ' CALL addrg
C_s5dg8_686cc309_ccall_L000224_228
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r17 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
' C_s5dg8_686cc309_ccall_L000224_225 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export luaD_call

 alignl ' align long
C_luaD__call ' <symbol:luaD_call>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg8_686cc309_ccall_L000224
 add SP, #12 ' CALL addrg
' C_luaD__call_230 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaD_callnoyield

 alignl ' align long
C_luaD__callnoyield ' <symbol:luaD_callnoyield>
 jmp #NEWF
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long 65537
 mov r2, RI ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg8_686cc309_ccall_L000224
 add SP, #12 ' CALL addrg
' C_luaD__callnoyield_231 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5dg9_686cc309_finishpcallk_L000232 ' <symbol:finishpcallk>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 sar r22, #10 ' RSHI4 coni
 mov r19, r22
 and r19, #7 ' BANDI4 coni
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_s5dg9_686cc309_finishpcallk_L000232_234 ' NEI4
 mov r19, #1 ' reg <- coni
 jmp #JMPA
 long @C_s5dg9_686cc309_finishpcallk_L000232_235 ' JUMPV addrg
C_s5dg9_686cc309_finishpcallk_L000232_234
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov r20, r21
 adds r20, #34 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 and r20, #1 ' BANDI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__seterrorobj
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaD__shrinkstack ' CALL addrg
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long -7169
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
C_s5dg9_686cc309_finishpcallk_L000232_235
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long -17
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov r20, r21
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C_s5dg9_686cc309_finishpcallk_L000232_233 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dga_686cc309_finishC_call_L000236 ' <symbol:finishCcall>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 jmp #LODL
 long 512
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5dga_686cc309_finishC_call_L000236_238 ' EQI4
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s5dga_686cc309_finishC_call_L000236_239 ' JUMPV addrg
C_s5dga_686cc309_finishC_call_L000236_238
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r21
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5dga_686cc309_finishC_call_L000236_240 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg9_686cc309_finishpcallk_L000232
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
C_s5dga_686cc309_finishC_call_L000236_240
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C_s5dga_686cc309_finishC_call_L000236_242 ' GEU4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_s5dga_686cc309_finishC_call_L000236_242
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #8 ' CALL indirect
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
C_s5dga_686cc309_finishC_call_L000236_239
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
' C_s5dga_686cc309_finishC_call_L000236_237 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dgb_686cc309_unroll_L000244 ' <symbol:unroll>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s5dgb_686cc309_unroll_L000244_247 ' JUMPV addrg
C_s5dgb_686cc309_unroll_L000244_246
 mov r22, r19
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5dgb_686cc309_unroll_L000244_249 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dga_686cc309_finishC_call_L000236
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s5dgb_686cc309_unroll_L000244_250 ' JUMPV addrg
C_s5dgb_686cc309_unroll_L000244_249
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaV__finishO_p ' CALL addrg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__execute
 add SP, #4 ' CALL addrg
C_s5dgb_686cc309_unroll_L000244_250
C_s5dgb_686cc309_unroll_L000244_247
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_s5dgb_686cc309_unroll_L000244_246 ' NEU4
' C_s5dgb_686cc309_unroll_L000244_245 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5dgc_686cc309_findpcall_L000251 ' <symbol:findpcall>
 jmp #PSHM
 long $c00000 ' save registers
 mov r22, r2
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C_s5dgc_686cc309_findpcall_L000251_256 ' JUMPV addrg
C_s5dgc_686cc309_findpcall_L000251_253
 mov r22, r23
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5dgc_686cc309_findpcall_L000251_257 ' EQI4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s5dgc_686cc309_findpcall_L000251_252 ' JUMPV addrg
C_s5dgc_686cc309_findpcall_L000251_257
' C_s5dgc_686cc309_findpcall_L000251_254 ' (symbol refcount = 0)
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
C_s5dgc_686cc309_findpcall_L000251_256
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s5dgc_686cc309_findpcall_L000251_253 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C_s5dgc_686cc309_findpcall_L000251_252
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s5dgd_686cc309_resume_error_L000259 ' <symbol:resume_error>
 jmp #NEWF
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r19
 shl r18, #3 ' LSHI4 coni
 subs r20, r18 ' SUBI/P (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__new
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov RI, r17
 mov BC, r15
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #4 ' ADDP4 coni
 mov r20, r15
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r0, #2 ' reg <- coni
' C_s5dgd_686cc309_resume_error_L000259_260 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5dge_686cc309_resume_L000261 ' <symbol:resume>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 shl r20, #3 ' LSHI4 coni
 subs r22, r20 ' SUBI/P (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5dge_686cc309_resume_L000261_263 ' NEI4
 mov r2, #0 ' reg ARG coni
 jmp #LODL
 long -1
 mov r3, RI ' reg ARG con
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 jmp #LODL
 long -8
 mov r20, RI ' reg <- con
 mov r4, r22 ' ADDI/P
 adds r4, r20 ' ADDI/P (3)
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dg8_686cc309_ccall_L000224
 add SP, #12 ' CALL addrg
 jmp #JMPA
 long @C_s5dge_686cc309_resume_L000261_264 ' JUMPV addrg
C_s5dge_686cc309_resume_L000261_263
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5dge_686cc309_resume_L000261_265 ' NEI4
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaV__execute
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_s5dge_686cc309_resume_L000261_266 ' JUMPV addrg
C_s5dge_686cc309_resume_L000261_265
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s5dge_686cc309_resume_L000261_267 ' EQU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #24 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r3, #1 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 mov RI, r22
 jmp #CALI
 add SP, #8 ' CALL indirect
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
C_s5dge_686cc309_resume_L000261_267
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
 long @C_luaD__poscall
 add SP, #8 ' CALL addrg
C_s5dge_686cc309_resume_L000261_266
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dgb_686cc309_unroll_L000244
 add SP, #4 ' CALL addrg
C_s5dge_686cc309_resume_L000261_264
' C_s5dge_686cc309_resume_L000261_262 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dgf_686cc309_precover_L000269 ' <symbol:precover>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s5dgf_686cc309_precover_L000269_272 ' JUMPV addrg
C_s5dgf_686cc309_precover_L000269_271
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 jmp #LODL
 long -7169
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 mov r18, r21
 shl r18, #10 ' LSHI4 coni
 or r20, r18 ' BORI/U (1)
 mov RI, r22
 mov BC, r20
 jmp #WWRD ' ASGNU2 reg reg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_s5dgb_686cc309_unroll_L000244
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__rawrunprotected
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s5dgf_686cc309_precover_L000269_272
 cmps r21,  #1 wz,wc
 jmp #BRBE
 long @C_s5dgf_686cc309_precover_L000269_274 ' LEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s5dgc_686cc309_findpcall_L000251 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s5dgf_686cc309_precover_L000269_271 ' NEU4
C_s5dgf_686cc309_precover_L000269_274
 mov r0, r21 ' CVI, CVU or LOAD
' C_s5dgf_686cc309_precover_L000269_270 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_resume

 alignl ' align long
C_lua_resume ' <symbol:lua_resume>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov RI, FP
 add RI, #16
 wrlong r3, RI ' spill reg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_resume_276 ' NEI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #52 ' ADDP4 coni
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_resume_278 ' EQU4
 mov RI, FP
 add RI, #16
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 jmp #LODL
 long @C_lua_resume_280_L000281
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dgd_686cc309_resume_error_L000259
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_resume_275 ' JUMPV addrg
C_lua_resume_278
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r0, r22 wz
 jmp #BRNZ
 long @C_lua_resume_277 ' NEI4
 mov RI, FP
 add RI, #16
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 jmp #LODL
 long @C_lua_resume_284_L000285
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dgd_686cc309_resume_error_L000259
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_resume_275 ' JUMPV addrg
C_lua_resume_276
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_lua_resume_286 ' EQI4
 mov RI, FP
 add RI, #16
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 jmp #LODL
 long @C_lua_resume_284_L000285
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dgd_686cc309_resume_error_L000259
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_resume_275 ' JUMPV addrg
C_lua_resume_286
C_lua_resume_277
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_resume_289 ' EQU4
 mov r22, r21
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff
 mov r20, RI ' reg <- con
 mov r15, r22 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
 jmp #JMPA
 long @C_lua_resume_290 ' JUMPV addrg
C_lua_resume_289
 mov r15, #0 ' reg <- coni
C_lua_resume_290
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 mov BC, r15
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #200 wz,wc 
 jmp #BR_B
 long @C_lua_resume_291' LTU4
 mov RI, FP
 add RI, #16
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 jmp #LODL
 long @C_lua_resume_293_L000294
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dgd_686cc309_resume_error_L000259
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_lua_resume_275 ' JUMPV addrg
C_lua_resume_291
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 add r20, #1 ' ADDU4 coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r2, FP
 add r2, #16 ' reg ARG ADDRFi
 jmp #LODL
 long @C_s5dge_686cc309_resume_L000261
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__rawrunprotected
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dgf_686cc309_precover_L000269
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #1 wz,wc
 jmp #BR_A
 long @C_lua_resume_295 ' GTI4
 jmp #JMPA
 long @C_lua_resume_296 ' JUMPV addrg
C_lua_resume_295
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__seterrorobj
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, r23
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C_lua_resume_296
 cmps r17,  #1 wz
 jmp #BRNZ
 long @C_lua_resume_298 ' NEI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r13, BC ' reg <- INDIRI4 reg
 jmp #JMPA
 long @C_lua_resume_299 ' JUMPV addrg
C_lua_resume_298
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #8 ' ADDP4 coni
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r13, r0 ' CVI, CVU or LOAD
C_lua_resume_299
 mov RI, r19
 mov BC, r13
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, r17 ' CVI, CVU or LOAD
C_lua_resume_275
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export lua_isyieldable

 alignl ' align long
C_lua_isyieldable ' <symbol:lua_isyieldable>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff0000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_lua_isyieldable_302 ' NEU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_lua_isyieldable_303 ' JUMPV addrg
C_lua_isyieldable_302
 mov r23, #0 ' reg <- coni
C_lua_isyieldable_303
 mov r0, r23 ' CVI, CVU or LOAD
' C_lua_isyieldable_300 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export lua_yieldk

 alignl ' align long
C_lua_yieldk ' <symbol:lua_yieldk>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $ffff0000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_yieldk_305 ' EQU4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, #144 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 cmp r22, r20 wz
 jmp #BR_Z
 long @C_lua_yieldk_307 ' EQU4
 jmp #LODL
 long @C_lua_yieldk_309_L000310
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
 jmp #JMPA
 long @C_lua_yieldk_308 ' JUMPV addrg
C_lua_yieldk_307
 jmp #LODL
 long @C_lua_yieldk_311_L000312
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaG__runerror
 add SP, #4 ' CALL addrg
C_lua_yieldk_308
C_lua_yieldk_305
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15
 adds r22, #34 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 and r22, #2 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_lua_yieldk_313 ' NEI4
 jmp #JMPA
 long @C_lua_yieldk_314 ' JUMPV addrg
C_lua_yieldk_313
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_lua_yieldk_315 ' EQU4
 mov r22, r15
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
C_lua_yieldk_315
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
C_lua_yieldk_314
 mov r0, #0 ' reg <- coni
' C_lua_yieldk_304 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5dgl_686cc309_closepaux_L000317 ' <symbol:closepaux>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' CVI, CVU or LOAD
 mov r2, #0 ' reg ARG coni
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRI4 reg
 mov RI, r19
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__close
 add SP, #12 ' CALL addrg
' C_s5dgl_686cc309_closepaux_L000317_318 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaD_closeprotected

 alignl ' align long
C_luaD__closeprotected ' <symbol:luaD_closeprotected>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r15, BC ' reg <- INDIRU1 reg
C_luaD__closeprotected_320
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, r21 ' ADDI/P (2)
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 jmp #LODL
 long @C_s5dgl_686cc309_closepaux_L000317
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__rawrunprotected
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 jmp #BRNZ
 long @C_luaD__closeprotected_325 ' NEI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
 jmp #JMPA
 long @C_luaD__closeprotected_319 ' JUMPV addrg
C_luaD__closeprotected_325
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 mov BC, r15
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_luaD__closeprotected_320 ' JUMPV addrg
C_luaD__closeprotected_319
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaD_pcall

 alignl ' align long
C_luaD__pcall ' <symbol:luaD_pcall>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #7 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov RI, FP
 sub RI, #-(-16)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__rawrunprotected
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_luaD__pcall_329 ' EQI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #20 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #7 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdbyte r20, r20 ' reg <- INDIRU1 regl
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__closeprotected
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov r20, r22
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r2, r19 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__seterrorobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaD__shrinkstack ' CALL addrg
C_luaD__pcall_329
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #92 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r0, r15 ' CVI, CVU or LOAD
' C_luaD__pcall_328 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_s5dgm_686cc309_checkmode_L000331 ' <symbol:checkmode>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s5dgm_686cc309_checkmode_L000331_333 ' EQU4
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_strchr
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s5dgm_686cc309_checkmode_L000331_333 ' NEU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_s5dgm_686cc309_checkmode_L000331_335_L000336
 mov r4, RI ' reg ARG ADDRG
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
C_s5dgm_686cc309_checkmode_L000331_333
' C_s5dgm_686cc309_checkmode_L000331_332 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5dgo_686cc309_f_parser_L000337 ' <symbol:f_parser>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r21 ' CVI, CVU or LOAD
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNU4 reg reg
 cmp r20,  #0 wz
 jmp #BR_Z
 long @C_s5dgo_686cc309_f_parser_L000337_340 ' EQU4
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_s5dgo_686cc309_f_parser_L000337_341 ' JUMPV addrg
C_s5dgo_686cc309_f_parser_L000337_340
 mov RI, r19
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
C_s5dgo_686cc309_f_parser_L000337_341
 mov RI, FP
 sub RI, #-(-8)
 wrlong r17, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long @C_s5dgo_686cc309_f_parser_L000337_344_L000345
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 addrg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s5dgo_686cc309_f_parser_L000337_342 ' NEI4
 jmp #LODL
 long @C_s5dgo_686cc309_f_parser_L000337_346_L000347
 mov r2, RI ' reg ARG ADDRG
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dgm_686cc309_checkmode_L000331
 add SP, #8 ' CALL addrg
 mov r22, r19
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov RI, r19
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaU__undump
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_s5dgo_686cc309_f_parser_L000337_343 ' JUMPV addrg
C_s5dgo_686cc309_f_parser_L000337_342
 jmp #LODL
 long @C_s5dgo_686cc309_f_parser_L000337_348_L000349
 mov r2, RI ' reg ARG ADDRG
 mov r22, r19
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5dgm_686cc309_checkmode_L000331
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, r19
 adds r22, #56 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r19
 adds r4, #16 ' ADDP4 coni
 mov r5, r19
 adds r5, #4 ' ADDP4 coni
 mov RI, r19
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 jmp #PSHL ' stack ARG
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_luaY__parser
 add SP, #20 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
C_s5dgo_686cc309_f_parser_L000337_343
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__initupvals
 add SP, #4 ' CALL addrg
' C_s5dgo_686cc309_f_parser_L000337_338 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export luaD_protectedparser

 alignl ' align long
C_luaD__protectedparser ' <symbol:luaD_protectedparser>
 jmp #NEWF
 sub SP, #64
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $10000
 mov r18, RI ' reg <- con
 add r20, r18 ' ADDU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov RI, FP
 sub RI, #-(-64)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r17, RI ' ASGNP4 addrli reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-48)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-40)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #LODL
 long 0
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-60)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r23
 adds r22, #92 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRI4 reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-64) ' reg ARG ADDRLi
 jmp #LODL
 long @C_s5dgo_686cc309_f_parser_L000337
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
 sub RI, #-(-68)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-52) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-60)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__saferealloc_
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-60)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-52)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-40) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r2, r22
 shl r2, #4 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-48)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r2, r22
 shl r2, #4 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-36)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r2, r22
 shl r2, #4 ' LSHU4 coni
 mov RI, FP
 sub RI, #-(-24)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #96 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRU4 reg
 jmp #LODL
 long $10000
 mov r18, RI ' reg <- con
 sub r20, r18 ' SUBU (1)
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-68) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_luaD__protectedparser_350 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #64 ' framesize
 jmp #RETF


' Catalina Import luaV_execute

' Catalina Import luaV_finishOp

' Catalina Import luaU_undump

' Catalina Import luaS_new

' Catalina Import luaS_newlstr

' Catalina Import luaY_parser

' Catalina Import luaC_step

' Catalina Import luaF_close

' Catalina Import luaF_initupvals

' Catalina Import luaG_runerror

' Catalina Import luaG_callerror

' Catalina Import luaE_resetthread

' Catalina Import luaE_checkcstack

' Catalina Import luaE_shrinkCI

' Catalina Import luaE_extendCI

' Catalina Import luaZ_fill

' Catalina Import luaM_free_

' Catalina Import luaM_saferealloc_

' Catalina Import luaM_realloc_

' Catalina Import luaT_gettmbyobj

' Catalina Import luaO_pushfstring

' Catalina Import strchr

' Catalina Import memcpy

' Catalina Import abort

' Catalina Import longjmp

' Catalina Import _setjmp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s5dgo_686cc309_f_parser_L000337_348_L000349 ' <symbol:348>
 byte 116
 byte 101
 byte 120
 byte 116
 byte 0

 alignl ' align long
C_s5dgo_686cc309_f_parser_L000337_346_L000347 ' <symbol:346>
 byte 98
 byte 105
 byte 110
 byte 97
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_s5dgo_686cc309_f_parser_L000337_344_L000345 ' <symbol:344>
 byte 27
 byte 76
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_s5dgm_686cc309_checkmode_L000331_335_L000336 ' <symbol:335>
 byte 97
 byte 116
 byte 116
 byte 101
 byte 109
 byte 112
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 108
 byte 111
 byte 97
 byte 100
 byte 32
 byte 97
 byte 32
 byte 37
 byte 115
 byte 32
 byte 99
 byte 104
 byte 117
 byte 110
 byte 107
 byte 32
 byte 40
 byte 109
 byte 111
 byte 100
 byte 101
 byte 32
 byte 105
 byte 115
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 41
 byte 0

 alignl ' align long
C_lua_yieldk_311_L000312 ' <symbol:311>
 byte 97
 byte 116
 byte 116
 byte 101
 byte 109
 byte 112
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 121
 byte 105
 byte 101
 byte 108
 byte 100
 byte 32
 byte 102
 byte 114
 byte 111
 byte 109
 byte 32
 byte 111
 byte 117
 byte 116
 byte 115
 byte 105
 byte 100
 byte 101
 byte 32
 byte 97
 byte 32
 byte 99
 byte 111
 byte 114
 byte 111
 byte 117
 byte 116
 byte 105
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_lua_yieldk_309_L000310 ' <symbol:309>
 byte 97
 byte 116
 byte 116
 byte 101
 byte 109
 byte 112
 byte 116
 byte 32
 byte 116
 byte 111
 byte 32
 byte 121
 byte 105
 byte 101
 byte 108
 byte 100
 byte 32
 byte 97
 byte 99
 byte 114
 byte 111
 byte 115
 byte 115
 byte 32
 byte 97
 byte 32
 byte 67
 byte 45
 byte 99
 byte 97
 byte 108
 byte 108
 byte 32
 byte 98
 byte 111
 byte 117
 byte 110
 byte 100
 byte 97
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_lua_resume_293_L000294 ' <symbol:293>
 byte 67
 byte 32
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_lua_resume_284_L000285 ' <symbol:284>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 109
 byte 101
 byte 32
 byte 100
 byte 101
 byte 97
 byte 100
 byte 32
 byte 99
 byte 111
 byte 114
 byte 111
 byte 117
 byte 116
 byte 105
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_lua_resume_280_L000281 ' <symbol:280>
 byte 99
 byte 97
 byte 110
 byte 110
 byte 111
 byte 116
 byte 32
 byte 114
 byte 101
 byte 115
 byte 117
 byte 109
 byte 101
 byte 32
 byte 110
 byte 111
 byte 110
 byte 45
 byte 115
 byte 117
 byte 115
 byte 112
 byte 101
 byte 110
 byte 100
 byte 101
 byte 100
 byte 32
 byte 99
 byte 111
 byte 114
 byte 111
 byte 117
 byte 116
 byte 105
 byte 110
 byte 101
 byte 0

 alignl ' align long
C_luaD__growstack_81_L000082 ' <symbol:81>
 byte 115
 byte 116
 byte 97
 byte 99
 byte 107
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_luaD__seterrorobj_28_L000029 ' <symbol:28>
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 105
 byte 110
 byte 32
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 104
 byte 97
 byte 110
 byte 100
 byte 108
 byte 105
 byte 110
 byte 103
 byte 0

' Catalina Code

DAT ' code segment
' end
