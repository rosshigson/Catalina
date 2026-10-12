' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _int64

 alignl ' align long
C__int64 ' <symbol:_int64>
 jmp #NEWF
 sub SP, #8
 jmp #LODF
 long -8
 wrlong r3, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -12
 wrlong r2, RI ' ASGNU4 addrl reg
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__int64_2 ' (symbol refcount = 0)
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _int32

 alignl ' align long
C__int32 ' <symbol:_int32>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
 cmps r2,  #0 wz,wc
 jmp #BRAE
 long @C__int32_9 ' GEI4
 jmp #LODL
 long -1
 mov r23, RI ' reg <- con
 jmp #JMPA
 long @C__int32_10 ' JUMPV addrg
C__int32_9
 mov r23, #0 ' reg <- coni
C__int32_10
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r2 ' CVI, CVU or LOAD
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r0, r3 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__int32_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _uint32

 alignl ' align long
C__uint32 ' <symbol:_uint32>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $400000 ' save registers
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -12
 wrlong r2, RI ' ASGNU4 addrl reg
 mov r0, r3 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__uint32_11 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _add64

 alignl ' align long
C__add64 ' <symbol:_add64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 mov r23, r22 ' ADDU
 add r23, r20 ' ADDU (3)
 rdlong r22, r2 ' reg <- INDIRU4 reg
 cmp r23, r22 wz,wc 
 jmp #BRAE
 long @C__add64_18 ' GEU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C__add64_19 ' JUMPV addrg
C__add64_18
 mov r21, #0 ' reg <- coni
C__add64_19
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r20, r21 ' CVI, CVU or LOAD
 add r22, r20 ' ADDU (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -12
 wrlong r23, RI ' ASGNU4 addrl reg
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__add64_14 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _sub64

 alignl ' align long
C__sub64 ' <symbol:_sub64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $d00000 ' save registers
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 cmp r22, r20 wz,wc 
 jmp #BRAE
 long @C__sub64_24 ' GEU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C__sub64_25 ' JUMPV addrg
C__sub64_24
 mov r23, #0 ' reg <- coni
C__sub64_25
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 mov r20, r23 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 sub r22, r20 ' SUBU (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__sub64_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _mul64

 alignl ' align long
C__mul64 ' <symbol:_mul64>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r0, FP
 sub r0, #-(-28) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-28) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_mul
 add SP, #8 ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__mul64_26 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


' Catalina Export _mul32

 alignl ' align long
C__mul32 ' <symbol:_mul32>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_mul32
 add SP, #8 ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__mul32_28 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _div64

 alignl ' align long
C__div64 ' <symbol:_div64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_div
 add SP, #8 ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__div64_30 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _mod64

 alignl ' align long
C__mod64 ' <symbol:_mod64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $a80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_mod
 add SP, #8 ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__mod64_32 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _neg64

 alignl ' align long
C__neg64 ' <symbol:_neg64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $c00000 ' save registers
 rdlong r22, r2 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__neg64_38 ' EQU4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C__neg64_39 ' JUMPV addrg
C__neg64_38
 mov r23, #0 ' reg <- coni
C__neg64_39
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 subs r22, r23 ' SUBI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r0, r3 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__neg64_34 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _and64

 alignl ' align long
C__and64 ' <symbol:_and64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $500000 ' save registers
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 and r22, r20 ' BANDI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__and64_40 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _or64

 alignl ' align long
C__or64 ' <symbol:_or64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $500000 ' save registers
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 or r22, r20 ' BORI/U (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 or r22, r20 ' BORI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__or64_43 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _xor64

 alignl ' align long
C__xor64 ' <symbol:_xor64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $500000 ' save registers
 rdlong r22, r3 ' reg <- INDIRU4 reg
 rdlong r20, r2 ' reg <- INDIRU4 reg
 xor r22, r20 ' BXORI/U (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r3
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r2
 adds r20, #4 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 xor r22, r20 ' BXORI/U (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__xor64_46 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _not64

 alignl ' align long
C__not64 ' <symbol:_not64>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $400000 ' save registers
 rdlong r22, r2 ' reg <- INDIRU4 reg
 xor r22, all_1s ' BCOMU4
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 xor r22, all_1s ' BCOMU4
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r0, r3 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__not64_49 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _shl32

 alignl ' align long
C__shl32 ' <symbol:_shl32>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $400000 ' save registers
 cmp r2,  #0 wz
 jmp #BR_Z
 long @C__shl32_54 ' EQU4
 cmp r2,  #32 wz,wc 
 jmp #BRAE
 long @C__shl32_56 ' GEU4
 mov r22, r2
 and r22, #31 ' BANDU4 coni
 mov RI, r3
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, #32 ' reg <- coni
 sub r22, r2 ' SUBU (1)
 mov RI, r3
 shr RI, r22
 mov r22, RI ' RSHU (2)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C__shl32_55 ' JUMPV addrg
C__shl32_56
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r2
 and r22, #31 ' BANDU4 coni
 mov RI, r3
 shl RI, r22
 mov r22, RI ' SHLI/U (2)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C__shl32_55 ' JUMPV addrg
C__shl32_54
 jmp #LODF
 long -12
 wrlong r3, RI ' ASGNU4 addrl reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
C__shl32_55
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__shl32_52 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export _shl64

 alignl ' align long
C__shl64 ' <symbol:_shl64>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_shl
 add SP, #8 ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__shl64_61 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export _lsr64

 alignl ' align long
C__lsr64 ' <symbol:_lsr64>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_ushr
 add SP, #8 ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__lsr64_63 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Export _asr64

 alignl ' align long
C__asr64 ' <symbol:_asr64>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r0, FP
 sub r0, #-(-20) ' reg <- addrli
 mov r1, r21 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-20) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_jsll_shr
 add SP, #8 ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C__asr64_65 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import jsll_ushr

' Catalina Import jsll_shr

' Catalina Import jsll_shl

' Catalina Import jsll_mod

' Catalina Import jsll_div

' Catalina Import jsll_mul32

' Catalina Import jsll_mul
' end
