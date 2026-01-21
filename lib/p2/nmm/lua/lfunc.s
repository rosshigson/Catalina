' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export luaF_newCclosure

 alignl ' align long
C_luaF__newC_closure ' <symbol:luaF_newCclosure>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 shl r22, #3 ' LSHI4 coni
 adds r22, #16 ' ADDI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #38 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r0, r19 ' CVI, CVU or LOAD
' C_luaF__newC_closure_14 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaF_newLclosure

 alignl ' align long
C_luaF__newL_closure ' <symbol:luaF_newLclosure>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 adds r22, #16 ' ADDI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #6 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #6 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_luaF__newL_closure_17 ' JUMPV addrg
C_luaF__newL_closure_16
 mov r22, r21
 shl r22, #2 ' LSHI4 coni
 mov r20, r19
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaF__newL_closure_17
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 subs r21, #1 ' SUBI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaF__newL_closure_16 ' NEI4
 mov r0, r19 ' CVI, CVU or LOAD
' C_luaF__newL_closure_15 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaF_initupvals

 alignl ' align long
C_luaF__initupvals ' <symbol:luaF_initupvals>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #\@C_luaF__initupvals_23 ' JUMPV addrg
C_luaF__initupvals_20
 mov r2, #20 ' reg ARG coni
 mov r3, #9 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r17, r15 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 mov r20, r17
 adds r20, #12 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #16 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 wrlong r17, r22 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaF__initupvals_25 ' EQI4
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaF__initupvals_25 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_luaF__initupvals_25 ' JUMPV addrg
C_luaF__initupvals_25
' C_luaF__initupvals_21 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_luaF__initupvals_23
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r19, r22 wcz
 if_b jmp #\C_luaF__initupvals_20 ' LTI4
' C_luaF__initupvals_19 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_spa8_696de099_newupval_L000026 ' <symbol:newupval>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #20 ' reg ARG coni
 mov r3, #9 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRP4 reg
 rdlong r15, r19 ' reg <- INDIRP4 reg
 mov r22, r17
 adds r22, #8 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r17
 adds r22, #16 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_spa8_696de099_newupval_L000026_28 ' EQU4
 mov r22, r15
 adds r22, #16 ' ADDP4 coni
 mov r20, r17
 adds r20, #12 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
C_spa8_696de099_newupval_L000026_28
 wrlong r17, r19 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_spa8_696de099_newupval_L000026_30  ' NEU4
 mov r22, r23
 adds r22, #44 ' ADDP4 coni
 mov r20, r23
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #136 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #136 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
C_spa8_696de099_newupval_L000026_30
 mov r0, r17 ' CVI, CVU or LOAD
' C_spa8_696de099_newupval_L000026_27 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaF_findupval

 alignl ' align long
C_luaF__findupval ' <symbol:luaF_findupval>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, r23
 adds r17, #32 ' ADDP4 coni
 jmp #\@C_luaF__findupval_34 ' JUMPV addrg
C_luaF__findupval_33
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 if_nz jmp #\C_luaF__findupval_36  ' NEU4
 mov r0, r19 ' CVI, CVU or LOAD
 jmp #\@C_luaF__findupval_32 ' JUMPV addrg
C_luaF__findupval_36
 mov r17, r19
 adds r17, #12 ' ADDP4 coni
C_luaF__findupval_34
 rdlong r22, r17 ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaF__findupval_38 ' EQU4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaF__findupval_33 ' GEU4
C_luaF__findupval_38
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spa8_696de099_newupval_L000026
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_luaF__findupval_32
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_spa81_696de099_callclosemethod_L000039 ' <symbol:callclosemethod>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r2, #24 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaT__gettmbyobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r13, r15 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r11, r22 ' reg <- INDIRP4 reg
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r13, r15
 adds r13, #8 ' ADDP4 coni
 mov r11, r21 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r13, r15
 adds r13, #16 ' ADDP4 coni
 mov r11, r19 ' CVI, CVU or LOAD
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov r20, r15
 adds r20, #24 ' ADDP4 coni
 wrlong r20, r22 ' ASGNP4 reg reg
 cmps r17,  #0 wz
 if_z jmp #\C_spa81_696de099_callclosemethod_L000039_41 ' EQI4
 mov r2, #0 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__call
 add SP, #8 ' CALL addrg
 jmp #\@C_spa81_696de099_callclosemethod_L000039_42 ' JUMPV addrg
C_spa81_696de099_callclosemethod_L000039_41
 mov r2, #0 ' reg ARG coni
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__callnoyield
 add SP, #8 ' CALL addrg
C_spa81_696de099_callclosemethod_L000039_42
' C_spa81_696de099_callclosemethod_L000039_40 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_spa82_696de099_checkclosemth_L000043 ' <symbol:checkclosemth>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #24 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
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
 if_nz jmp #\C_spa82_696de099_checkclosemth_L000043_45 ' NEI4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, ##0 ' reg ARG con
 mov RI, FP
 sub RI, #-(-16)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__findlocal
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_spa82_696de099_checkclosemth_L000043_47  ' NEU4
 mov RI, ##@C_spa82_696de099_checkclosemth_L000043_49_L000050
 mov BC, FP
 sub BC, #-(-12)
 wrlong RI, BC ' ASGNP4 addrli addrg
C_spa82_696de099_checkclosemth_L000043_47
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, ##@C_spa82_696de099_checkclosemth_L000043_51_L000052 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaG__runerror
 add SP, #8 ' CALL addrg
C_spa82_696de099_checkclosemth_L000043_45
' C_spa82_696de099_checkclosemth_L000043_44 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_spa85_696de099_prepcallclosemth_L000053 ' <symbol:prepcallclosemth>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r22, ##-1 ' reg <- con
 cmps r19, r22 wz
 if_nz jmp #\C_spa85_696de099_prepcallclosemth_L000053_55 ' NEI4
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #44 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_spa85_696de099_prepcallclosemth_L000053_56 ' JUMPV addrg
C_spa85_696de099_prepcallclosemth_L000053_55
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__seterrorobj
 add SP, #8 ' CALL addrg
C_spa85_696de099_prepcallclosemth_L000053_56
 mov r2, r17 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r4, RI ' reg ARG INDIR ADDRLi
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spa81_696de099_callclosemethod_L000039
 add SP, #12 ' CALL addrg
' C_spa85_696de099_prepcallclosemth_L000053_54 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export luaF_newtbcupval

 alignl ' align long
C_luaF__newtbcupval ' <symbol:luaF_newtbcupval>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #1 wz
 if_z jmp #\C_luaF__newtbcupval_60 ' EQI4
 and r22, #15 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaF__newtbcupval_58 ' NEI4
C_luaF__newtbcupval_60
 jmp #\@C_luaF__newtbcupval_57 ' JUMPV addrg
C_luaF__newtbcupval_58
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spa82_696de099_checkclosemth_L000043
 add SP, #4 ' CALL addrg
 jmp #\@C_luaF__newtbcupval_62 ' JUMPV addrg
C_luaF__newtbcupval_61
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##$7fff8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #6 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrword r20, r22 ' ASGNU2 reg reg
C_luaF__newtbcupval_62
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #36 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##$ffff ' reg <- con
 cmp r22, r20 wcz 
 if_a jmp #\C_luaF__newtbcupval_61 ' GTU4
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r18, r23
 adds r18, #36 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 sub r20, r18 ' SUBU (1)
 mov r18, #8 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 wrword r20, r22 ' ASGNU2 reg reg
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 wrlong r21, r22 ' ASGNP4 reg reg
C_luaF__newtbcupval_57
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaF_unlinkupval

 alignl ' align long
C_luaF__unlinkupval ' <symbol:luaF_unlinkupval>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r2
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r2
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_luaF__unlinkupval_65 ' EQU4
 mov r22, r2
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #16 ' ADDP4 coni
 mov r20, r2
 adds r20, #16 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
C_luaF__unlinkupval_65
' C_luaF__unlinkupval_64 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaF_closeupval

 alignl ' align long
C_luaF__closeupval ' <symbol:luaF_closeupval>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #\@C_luaF__closeupval_69 ' JUMPV addrg
C_luaF__closeupval_68
 mov r15, r19
 adds r15, #12 ' ADDP4 coni
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaF__unlinkupval ' CALL addrg
 mov r13, r15 ' CVI, CVU or LOAD
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r11, r22 ' reg <- INDIRP4 reg
 mov r0, r13 ' CVI, CVU or LOAD
 mov r1, r11 ' CVI, CVU or LOAD
 calld PA,#CPYB
 long 4 ' ASGNB
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, r11
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 wrlong r15, r22 ' ASGNP4 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #24 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_luaF__closeupval_71 ' NEI4
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #32 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #64 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_luaF__closeupval_74 ' EQI4
 mov r22, #0 ' reg <- coni
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaF__closeupval_74 ' EQI4
 rdlong r20, r15 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaF__closeupval_74 ' EQI4
 rdlong r2, r15 ' reg <- INDIRP4 reg
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_luaF__closeupval_74 ' JUMPV addrg
 jmp #\@C_luaF__closeupval_74 ' JUMPV addrg
C_luaF__closeupval_74
C_luaF__closeupval_71
C_luaF__closeupval_69
 mov r22, r23
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r19, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_luaF__closeupval_77 ' EQU4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaF__closeupval_68 ' GEU4
C_luaF__closeupval_77
' C_luaF__closeupval_67 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_spa86_696de099_poptbclist_L000078 ' <symbol:poptbclist>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r2
 adds r22, #36 ' ADDP4 coni
 rdlong r23, r22 ' reg <- INDIRP4 reg
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 shl r22, #3 ' LSHI4 coni
 subs r23, r22 ' SUBI/P (1)
 jmp #\@C_spa86_696de099_poptbclist_L000078_81 ' JUMPV addrg
C_spa86_696de099_poptbclist_L000078_80
 mov r22, ##-524280 ' reg <- con
 adds r23, r22 ' ADDI/P (1)
C_spa86_696de099_poptbclist_L000078_81
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, r2
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 cmp r22, r20 wcz 
 if_be jmp #\C_spa86_696de099_poptbclist_L000078_83 ' LEU4
 mov r22, r23
 adds r22, #6 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 cmps r22,  #0 wz
 if_z jmp #\C_spa86_696de099_poptbclist_L000078_80 ' EQI4
C_spa86_696de099_poptbclist_L000078_83
 mov r22, r2
 adds r22, #36 ' ADDP4 coni
 wrlong r23, r22 ' ASGNP4 reg reg
' C_spa86_696de099_poptbclist_L000078_79 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export luaF_close

 alignl ' align long
C_luaF__close ' <symbol:luaF_close>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, r23
 adds r20, #28 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 sub r22, r20 ' SUBU (1)
 mov r15, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__closeupval
 add SP, #4 ' CALL addrg
 jmp #\@C_luaF__close_86 ' JUMPV addrg
C_luaF__close_85
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r13, r22 ' reg <- INDIRP4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spa86_696de099_poptbclist_L000078 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spa85_696de099_prepcallclosemth_L000053
 add SP, #12 ' CALL addrg
 mov r22, r23
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r21, r15 ' ADDI/P
 adds r21, r22 ' ADDI/P (3)
C_luaF__close_86
 mov r22, r23
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r21 ' CVI, CVU or LOAD
 cmp r22, r20 wcz 
 if_ae jmp #\C_luaF__close_85 ' GEU4
 mov r0, r21 ' CVI, CVU or LOAD
' C_luaF__close_84 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaF_newproto

 alignl ' align long
C_luaF__newproto ' <symbol:luaF_newproto>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #84 ' reg ARG coni
 mov r3, #10 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__newobj
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #56 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #60 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #6 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #7 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #8 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #40 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #44 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, r21 ' CVI, CVU or LOAD
' C_luaF__newproto_88 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export luaF_freeproto

 alignl ' align long
C_luaF__freeproto ' <symbol:luaF_freeproto>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, r21
 adds r22, #56 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 shl r2, #3 ' LSHU4 coni
 mov r22, r21
 adds r22, #48 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r20, r21
 adds r20, #24 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 shl r2, #3 ' LSHU4 coni
 mov r22, r21
 adds r22, #68 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, #12 ' reg <- coni
 mov r20, r21
 adds r20, #32 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #72 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r2, r22
 shl r2, #3 ' LSHU4 coni
 mov r22, r21
 adds r22, #60 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
 mov r2, #84 ' reg ARG coni
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__free_
 add SP, #8 ' CALL addrg
' C_luaF__freeproto_89 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaF_getlocalname

 alignl ' align long
C_luaF__getlocalname ' <symbol:luaF_getlocalname>
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, #0 ' reg <- coni
 jmp #\@C_luaF__getlocalname_94 ' JUMPV addrg
C_luaF__getlocalname_91
 mov r22, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r4
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r2, r22 wcz
 if_ae jmp #\C_luaF__getlocalname_95 ' GEI4
 subs r3, #1 ' SUBI4 coni
 cmps r3,  #0 wz
 if_nz jmp #\C_luaF__getlocalname_97 ' NEI4
 mov r22, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r4
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r0, r22
 adds r0, #16 ' ADDP4 coni
 jmp #\@C_luaF__getlocalname_90 ' JUMPV addrg
C_luaF__getlocalname_97
C_luaF__getlocalname_95
' C_luaF__getlocalname_92 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
C_luaF__getlocalname_94
 mov r22, r4
 adds r22, #32 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r23, r22 wcz
 if_ae jmp #\C_luaF__getlocalname_99 ' GEI4
 mov r22, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r4
 adds r22, #72 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r0 ' ADDI/P (2)
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22, r2 wcz
 if_be jmp #\C_luaF__getlocalname_91 ' LEI4
C_luaF__getlocalname_99
 mov r0, ##0 ' RET con
C_luaF__getlocalname_90
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import luaC_barrier_

' Catalina Import luaC_newobj

' Catalina Import luaD_callnoyield

' Catalina Import luaD_call

' Catalina Import luaD_seterrorobj

' Catalina Import luaG_runerror

' Catalina Import luaG_findlocal

' Catalina Import luaM_free_

' Catalina Import luaT_gettmbyobj

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_spa82_696de099_checkclosemth_L000043_51_L000052 ' <symbol:51>
 byte 118
 byte 97
 byte 114
 byte 105
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 39
 byte 37
 byte 115
 byte 39
 byte 32
 byte 103
 byte 111
 byte 116
 byte 32
 byte 97
 byte 32
 byte 110
 byte 111
 byte 110
 byte 45
 byte 99
 byte 108
 byte 111
 byte 115
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 118
 byte 97
 byte 108
 byte 117
 byte 101
 byte 0

 alignl ' align long
C_spa82_696de099_checkclosemth_L000043_49_L000050 ' <symbol:49>
 byte 63
 byte 0

' Catalina Code

DAT ' code segment
' end
