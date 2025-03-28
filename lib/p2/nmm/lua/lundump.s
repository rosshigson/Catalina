' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s2l8_67e4d988_error_L000013 ' <symbol:error>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, ##@C_s2l8_67e4d988_error_L000013_15_L000016 ' reg ARG ADDRG
 rdlong r5, r23 ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 rdlong r3, r23 ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
' C_s2l8_67e4d988_error_L000013_14 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l82_67e4d988_loadB_lock_L000017 ' <symbol:loadBlock>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaZ__read
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_s2l82_67e4d988_loadB_lock_L000017_19 ' EQU4
 mov r2, ##@C_s2l82_67e4d988_loadB_lock_L000017_21_L000022 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l82_67e4d988_loadB_lock_L000017_19
' C_s2l82_67e4d988_loadB_lock_L000017_18 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l84_67e4d988_loadB_yte_L000023 ' <symbol:loadByte>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r20, r22 ' reg <- INDIRU4 reg
 mov r18, r20
 sub r18, #1 ' SUBU4 coni
 wrlong r18, r22 ' ASGNU4 reg reg
 cmp r20,  #0 wz
 if_z jmp #\C_s2l84_67e4d988_loadB_yte_L000023_26 ' EQU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 wrlong r18, r22 ' ASGNP4 reg reg
 rdbyte r19, r20 ' reg <- CVUI4 INDIRU1 reg
 jmp #\@C_s2l84_67e4d988_loadB_yte_L000023_27 ' JUMPV addrg
C_s2l84_67e4d988_loadB_yte_L000023_26
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_s2l84_67e4d988_loadB_yte_L000023_27
 mov r21, r19 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r21, r22 wz
 if_nz jmp #\C_s2l84_67e4d988_loadB_yte_L000023_28 ' NEI4
 mov r2, ##@C_s2l82_67e4d988_loadB_lock_L000017_21_L000022 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l84_67e4d988_loadB_yte_L000023_28
 mov r22, r21 ' CVI, CVU or LOAD
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_s2l84_67e4d988_loadB_yte_L000023_24 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l85_67e4d988_loadU_nsigned_L000030 ' <symbol:loadUnsigned>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 shr r21, #7 ' RSHU4 coni
C_s2l85_67e4d988_loadU_nsigned_L000030_32
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 cmp r19, r21 wcz 
 if_b jmp #\C_s2l85_67e4d988_loadU_nsigned_L000030_35 ' LTU4
 mov r2, ##@C_s2l85_67e4d988_loadU_nsigned_L000030_37_L000038 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l85_67e4d988_loadU_nsigned_L000030_35
 mov r22, r19
 shl r22, #7 ' LSHU4 coni
 mov r20, r17
 and r20, #127 ' BANDI4 coni
 mov r19, r22 ' BORI/U
 or r19, r20 ' BORI/U (3)
' C_s2l85_67e4d988_loadU_nsigned_L000030_33 ' (symbol refcount = 0)
 mov r22, r17
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_s2l85_67e4d988_loadU_nsigned_L000030_32 ' EQI4
 mov r0, r19 ' CVI, CVU or LOAD
' C_s2l85_67e4d988_loadU_nsigned_L000030_31 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l87_67e4d988_loadS_ize_L000039 ' <symbol:loadSize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##$ffffffff ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l85_67e4d988_loadU_nsigned_L000030
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s2l87_67e4d988_loadS_ize_L000039_40 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l88_67e4d988_loadI_nt_L000041 ' <symbol:loadInt>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##$7fffffff ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l85_67e4d988_loadU_nsigned_L000030
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_s2l88_67e4d988_loadI_nt_L000041_42 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l89_67e4d988_loadN_umber_L000043 ' <symbol:loadNumber>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l82_67e4d988_loadB_lock_L000017
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
' C_s2l89_67e4d988_loadN_umber_L000043_44 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s2l8a_67e4d988_loadI_nteger_L000045 ' <symbol:loadInteger>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l82_67e4d988_loadB_lock_L000017
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_s2l8a_67e4d988_loadI_nteger_L000045_46 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s2l8b_67e4d988_loadS_tringN__L000047 ' <symbol:loadStringN>
 calld PA,#NEWF
 sub SP, #40
 calld PA,#PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 rdlong r17, r23 ' reg <- INDIRP4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l87_67e4d988_loadS_ize_L000039 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 if_nz jmp #\C_s2l8b_67e4d988_loadS_tringN__L000047_49  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_s2l8b_67e4d988_loadS_tringN__L000047_48 ' JUMPV addrg
C_s2l8b_67e4d988_loadS_tringN__L000047_49
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 cmp r22,  #40 wcz 
 if_a jmp #\C_s2l8b_67e4d988_loadS_tringN__L000047_51 ' GTU4
 mov r22, #1 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l82_67e4d988_loadB_lock_L000017
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_s2l8b_67e4d988_loadS_tringN__L000047_52 ' JUMPV addrg
C_s2l8b_67e4d988_loadS_tringN__L000047_51
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaS__createlngstrobj
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaD__inctop ' CALL addrg
 mov r22, #1 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r15 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r19
 adds r3, #16 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l82_67e4d988_loadB_lock_L000017
 add SP, #8 ' CALL addrg
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r20, r22 ' reg <- INDIRP4 reg
 mov r18, ##-8 ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C_s2l8b_67e4d988_loadS_tringN__L000047_52
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s2l8b_67e4d988_loadS_tringN__L000047_54 ' EQI4
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s2l8b_67e4d988_loadS_tringN__L000047_54 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_s2l8b_67e4d988_loadS_tringN__L000047_54 ' JUMPV addrg
C_s2l8b_67e4d988_loadS_tringN__L000047_54
 mov r0, r19 ' CVI, CVU or LOAD
C_s2l8b_67e4d988_loadS_tringN__L000047_48
 calld PA,#POPM ' restore registers
 add SP, #40 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s2l8c_67e4d988_loadS_tring_L000055 ' <symbol:loadString>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8b_67e4d988_loadS_tringN__L000047
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_s2l8c_67e4d988_loadS_tring_L000055_57  ' NEU4
 mov r2, ##@C_s2l8c_67e4d988_loadS_tring_L000055_59_L000060 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l8c_67e4d988_loadS_tring_L000055_57
 mov r0, r19 ' CVI, CVU or LOAD
' C_s2l8c_67e4d988_loadS_tring_L000055_56 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l8e_67e4d988_loadC_ode_L000061 ' <symbol:loadCode>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r20, ##$3fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_s2l8e_67e4d988_loadC_ode_L000061_64 ' LEU4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #\@C_s2l8e_67e4d988_loadC_ode_L000061_64 ' JUMPV addrg
C_s2l8e_67e4d988_loadC_ode_L000061_64
 mov r2, #0 ' reg ARG coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #2 ' LSHU4 coni
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #52 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 wrlong r19, r22 ' ASGNI4 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l82_67e4d988_loadB_lock_L000017
 add SP, #8 ' CALL addrg
' C_s2l8e_67e4d988_loadC_ode_L000061_62 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l8g_67e4d988_loadC_onstants_L000066 ' <symbol:loadConstants>
 calld PA,#NEWF
 calld PA,#PSHM
 long $faaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r20, ##$1fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_s2l8g_67e4d988_loadC_onstants_L000066_69 ' LEU4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_69 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_69
 mov r2, #0 ' reg ARG coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #3 ' LSHU4 coni
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_73 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_70
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_s2l8g_67e4d988_loadC_onstants_L000066_71 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8g_67e4d988_loadC_onstants_L000066_73
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8g_67e4d988_loadC_onstants_L000066_70 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_77 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_74
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 cmps r15,  #0 wcz
 if_b jmp #\C_s2l8g_67e4d988_loadC_onstants_L000066_78 ' LTI4
 cmps r15,  #4 wcz
 if_a jmp #\C_s2l8g_67e4d988_loadC_onstants_L000066_86 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C_s2l8g_67e4d988_loadC_onstants_L000066_87_L000089 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s2l8g_67e4d988_loadC_onstants_L000066_87_L000089 ' <symbol:87>
 long @C_s2l8g_67e4d988_loadC_onstants_L000066_80
 long @C_s2l8g_67e4d988_loadC_onstants_L000066_81
 long @C_s2l8g_67e4d988_loadC_onstants_L000066_78
 long @C_s2l8g_67e4d988_loadC_onstants_L000066_84
 long @C_s2l8g_67e4d988_loadC_onstants_L000066_85

' Catalina Code

DAT ' code segment
C_s2l8g_67e4d988_loadC_onstants_L000066_86
 cmps r15,  #17 wz
 if_z jmp #\C_s2l8g_67e4d988_loadC_onstants_L000066_82 ' EQI4
 cmps r15,  #19 wz
 if_z jmp #\C_s2l8g_67e4d988_loadC_onstants_L000066_83 ' EQI4
 cmps r15,  #20 wz
 if_z jmp #\C_s2l8g_67e4d988_loadC_onstants_L000066_85 ' EQI4
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_78 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_80
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_79 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_81
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_79 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_82
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_79 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_83
 mov r11, r13 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l89_67e4d988_loadN_umber_L000043 ' CALL addrg
 wrlong r0, r11 ' ASGNF4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_79 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_84
 mov r11, r13 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l8a_67e4d988_loadI_nteger_L000045 ' CALL addrg
 wrlong r0, r11 ' ASGNI4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_s2l8g_67e4d988_loadC_onstants_L000066_79 ' JUMPV addrg
C_s2l8g_67e4d988_loadC_onstants_L000066_85
 mov r11, r13 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8c_67e4d988_loadS_tring_L000055
 add SP, #4 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 wrlong r9, r11 ' ASGNP4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #4 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 or r20, #64 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_s2l8g_67e4d988_loadC_onstants_L000066_78
C_s2l8g_67e4d988_loadC_onstants_L000066_79
' C_s2l8g_67e4d988_loadC_onstants_L000066_75 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8g_67e4d988_loadC_onstants_L000066_77
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8g_67e4d988_loadC_onstants_L000066_74 ' LTI4
' C_s2l8g_67e4d988_loadC_onstants_L000066_67 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l8j_67e4d988_loadP_rotos_L000090 ' <symbol:loadProtos>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r20, ##$3fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_s2l8j_67e4d988_loadP_rotos_L000090_93 ' LEU4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #\@C_s2l8j_67e4d988_loadP_rotos_L000090_93 ' JUMPV addrg
C_s2l8j_67e4d988_loadP_rotos_L000090_93
 mov r2, #0 ' reg ARG coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #2 ' LSHU4 coni
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8j_67e4d988_loadP_rotos_L000090_97 ' JUMPV addrg
C_s2l8j_67e4d988_loadP_rotos_L000090_94
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
' C_s2l8j_67e4d988_loadP_rotos_L000090_95 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8j_67e4d988_loadP_rotos_L000090_97
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8j_67e4d988_loadP_rotos_L000090_94 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8j_67e4d988_loadP_rotos_L000090_101 ' JUMPV addrg
C_s2l8j_67e4d988_loadP_rotos_L000090_98
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaF__newproto ' CALL addrg
 mov r20, r19
 shl r20, #2 ' LSHI4 coni
 mov r18, r21
 adds r18, #56 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s2l8j_67e4d988_loadP_rotos_L000090_103 ' EQI4
 mov r20, r19
 shl r20, #2 ' LSHI4 coni
 mov r18, r21
 adds r18, #56 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_s2l8j_67e4d988_loadP_rotos_L000090_103 ' EQI4
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r21 ' CVI, CVU or LOAD
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_s2l8j_67e4d988_loadP_rotos_L000090_103 ' JUMPV addrg
C_s2l8j_67e4d988_loadP_rotos_L000090_103
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8f_67e4d988_loadF_unction_L000065
 add SP, #8 ' CALL addrg
' C_s2l8j_67e4d988_loadP_rotos_L000090_99 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8j_67e4d988_loadP_rotos_L000090_101
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8j_67e4d988_loadP_rotos_L000090_98 ' LTI4
' C_s2l8j_67e4d988_loadP_rotos_L000090_91 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l8k_67e4d988_loadU_pvalues_L000104 ' <symbol:loadUpvalues>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r20, ##$1fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_s2l8k_67e4d988_loadU_pvalues_L000104_107 ' LEU4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #\@C_s2l8k_67e4d988_loadU_pvalues_L000104_107 ' JUMPV addrg
C_s2l8k_67e4d988_loadU_pvalues_L000104_107
 mov r2, #0 ' reg ARG coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #3 ' LSHU4 coni
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8k_67e4d988_loadU_pvalues_L000104_111 ' JUMPV addrg
C_s2l8k_67e4d988_loadU_pvalues_L000104_108
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
' C_s2l8k_67e4d988_loadU_pvalues_L000104_109 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8k_67e4d988_loadU_pvalues_L000104_111
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8k_67e4d988_loadU_pvalues_L000104_108 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8k_67e4d988_loadU_pvalues_L000104_115 ' JUMPV addrg
C_s2l8k_67e4d988_loadU_pvalues_L000104_112
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #60 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #60 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #5 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #60 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #6 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
' C_s2l8k_67e4d988_loadU_pvalues_L000104_113 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8k_67e4d988_loadU_pvalues_L000104_115
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8k_67e4d988_loadU_pvalues_L000104_112 ' LTI4
' C_s2l8k_67e4d988_loadU_pvalues_L000104_105 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l8l_67e4d988_loadD_ebug_L000116 ' <symbol:loadDebug>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_s2l8l_67e4d988_loadD_ebug_L000116_119 ' LEU4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #\@C_s2l8l_67e4d988_loadD_ebug_L000116_119 ' JUMPV addrg
C_s2l8l_67e4d988_loadD_ebug_L000116_119
 mov r2, #0 ' reg ARG coni
 mov r22, #1 ' reg <- coni
 mov r20, r17 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r3, r0 ' CVI, CVU or LOAD
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #64 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r22, #1 ' reg <- coni
 mov r20, r17 ' CVI, CVU or LOAD
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
 long @C_s2l82_67e4d988_loadB_lock_L000017
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r20, ##$1fffffff ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_s2l8l_67e4d988_loadD_ebug_L000116_121 ' LEU4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #\@C_s2l8l_67e4d988_loadD_ebug_L000116_121 ' JUMPV addrg
C_s2l8l_67e4d988_loadD_ebug_L000116_121
 mov r2, #0 ' reg ARG coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #3 ' LSHU4 coni
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8l_67e4d988_loadD_ebug_L000116_125 ' JUMPV addrg
C_s2l8l_67e4d988_loadD_ebug_L000116_122
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #68 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #68 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #4 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
' C_s2l8l_67e4d988_loadD_ebug_L000116_123 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8l_67e4d988_loadD_ebug_L000116_125
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8l_67e4d988_loadD_ebug_L000116_122 ' LTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 mov r20, ##$15555555 ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_s2l8l_67e4d988_loadD_ebug_L000116_127 ' LEU4
 rdlong r2, r23 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #\@C_s2l8l_67e4d988_loadD_ebug_L000116_127 ' JUMPV addrg
C_s2l8l_67e4d988_loadD_ebug_L000116_127
 mov r2, #0 ' reg ARG coni
 mov r22, #12 ' reg <- coni
 mov r20, r17 ' CVI, CVU or LOAD
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r3, r0 ' CVI, CVU or LOAD
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 wrlong r17, r22 ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8l_67e4d988_loadD_ebug_L000116_131 ' JUMPV addrg
C_s2l8l_67e4d988_loadD_ebug_L000116_128
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
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
' C_s2l8l_67e4d988_loadD_ebug_L000116_129 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8l_67e4d988_loadD_ebug_L000116_131
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8l_67e4d988_loadD_ebug_L000116_128 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8l_67e4d988_loadD_ebug_L000116_135 ' JUMPV addrg
C_s2l8l_67e4d988_loadD_ebug_L000116_132
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8b_67e4d988_loadS_tringN__L000047
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r0 ' ADDI/P (2)
 wrlong r22, r20 ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r0 ' ADDI/P (2)
 adds r20, #4 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #12 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r19 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, r0 ' ADDI/P (2)
 adds r20, #8 ' ADDP4 coni
 wrlong r22, r20 ' ASGNI4 reg reg
' C_s2l8l_67e4d988_loadD_ebug_L000116_133 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8l_67e4d988_loadD_ebug_L000116_135
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8l_67e4d988_loadD_ebug_L000116_132 ' LTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r19, #0 ' reg <- coni
 jmp #\@C_s2l8l_67e4d988_loadD_ebug_L000116_139 ' JUMPV addrg
C_s2l8l_67e4d988_loadD_ebug_L000116_136
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8b_67e4d988_loadS_tringN__L000047
 add SP, #4 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #60 ' ADDP4 coni
 rdlong r18, r18 ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 wrlong r0, r20 ' ASGNP4 reg reg
' C_s2l8l_67e4d988_loadD_ebug_L000116_137 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_s2l8l_67e4d988_loadD_ebug_L000116_139
 cmps r19, r17 wcz
 if_b jmp #\C_s2l8l_67e4d988_loadD_ebug_L000116_136 ' LTI4
' C_s2l8l_67e4d988_loadD_ebug_L000116_117 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l8f_67e4d988_loadF_unction_L000065 ' <symbol:loadFunction>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8b_67e4d988_loadS_tringN__L000047
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #76 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_s2l8f_67e4d988_loadF_unction_L000065_141  ' NEU4
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 wrlong r19, r22 ' ASGNP4 reg reg
C_s2l8f_67e4d988_loadF_unction_L000065_141
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r20, r21
 adds r20, #40 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l88_67e4d988_loadI_nt_L000041 ' CALL addrg
 mov r20, r21
 adds r20, #44 ' ADDP4 coni
 wrlong r0, r20 ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r20, r21
 adds r20, #6 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, r20 ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8e_67e4d988_loadC_ode_L000061
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8g_67e4d988_loadC_onstants_L000066
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8k_67e4d988_loadU_pvalues_L000104
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8j_67e4d988_loadP_rotos_L000090
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8l_67e4d988_loadD_ebug_L000116
 add SP, #4 ' CALL addrg
' C_s2l8f_67e4d988_loadF_unction_L000065_140 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l8m_67e4d988_checkliteral_L000143 ' <symbol:checkliteral>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r17 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l82_67e4d988_loadB_lock_L000017
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C_s2l8m_67e4d988_checkliteral_L000143_149 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l8m_67e4d988_checkliteral_L000143_149
' C_s2l8m_67e4d988_checkliteral_L000143_144 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


 alignl ' align long
C_s2l8p_67e4d988_fchecksize_L000151 ' <symbol:fchecksize>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmp r22, r21 wz
 if_z jmp #\C_s2l8p_67e4d988_fchecksize_L000151_153 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, ##@C_s2l8p_67e4d988_fchecksize_L000151_155_L000156 ' reg ARG ADDRG
 rdlong r4, r23 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l8p_67e4d988_fchecksize_L000151_153
' C_s2l8p_67e4d988_fchecksize_L000151_152 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157 ' <symbol:checkHeader>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_160_L000161 ' reg ARG ADDRG
 mov r3, ##@C_s2l8m_67e4d988_checkliteral_L000143_145_L000146+1 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8m_67e4d988_checkliteral_L000143
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 mov r20, ##@C_s2l8r_67e4d988_checkH_eader_L000157_164_L000165 ' reg <- addrg
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 shl r20, #4 ' LSHI4 coni
 mov r18, ##768 ' reg <- con
 subs r20, r18 ' SUBI/P (1)
 mov r18, ##@C_s2l8r_67e4d988_checkH_eader_L000157_166_L000167 ' reg <- addrg
 rdbyte r18, r18 ' reg <- CVUI4 INDIRU1 reg
 subs r18, #48 ' SUBI4 coni
 adds r20, r18 ' ADDI/P (1)
 cmps r22, r20 wz
 if_z jmp #\C_s2l8r_67e4d988_checkH_eader_L000157_162 ' EQI4
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_168_L000169 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l8r_67e4d988_checkH_eader_L000157_162
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 if_z jmp #\C_s2l8r_67e4d988_checkH_eader_L000157_170 ' EQI4
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_172_L000173 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l8r_67e4d988_checkH_eader_L000157_170
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_174_L000175 ' reg ARG ADDRG
 mov r3, ##@C_s2l8m_67e4d988_checkliteral_L000143_147_L000148 ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8m_67e4d988_checkliteral_L000143
 add SP, #8 ' CALL addrg
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_176_L000177 ' reg ARG ADDRG
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8p_67e4d988_fchecksize_L000151
 add SP, #8 ' CALL addrg
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_178_L000179 ' reg ARG ADDRG
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8p_67e4d988_fchecksize_L000151
 add SP, #8 ' CALL addrg
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_180_L000181 ' reg ARG ADDRG
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8p_67e4d988_fchecksize_L000151
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l8a_67e4d988_loadI_nteger_L000045 ' CALL addrg
 mov r20, ##22136 ' reg <- con
 cmps r0, r20 wz
 if_z jmp #\C_s2l8r_67e4d988_checkH_eader_L000157_182 ' EQI4
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_184_L000185 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l8r_67e4d988_checkH_eader_L000157_182
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l89_67e4d988_loadN_umber_L000043 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_s2l8r_67e4d988_checkH_eader_L000157_188_L000189
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_z jmp #\C_s2l8r_67e4d988_checkH_eader_L000157_186 ' EQF4
 mov r2, ##@C_s2l8r_67e4d988_checkH_eader_L000157_190_L000191 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8_67e4d988_error_L000013
 add SP, #4 ' CALL addrg
C_s2l8r_67e4d988_checkH_eader_L000157_186
' C_s2l8r_67e4d988_checkH_eader_L000157_158 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export luaU_undump

 alignl ' align long
C_luaU__undump ' <symbol:luaU_undump>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #64 wz
 if_z jmp #\C_luaU__undump_195 ' EQI4
 cmps r22,  #61 wz
 if_nz jmp #\C_luaU__undump_193 ' NEI4
C_luaU__undump_195
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #\@C_luaU__undump_194 ' JUMPV addrg
C_luaU__undump_193
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C_s2l8m_67e4d988_checkliteral_L000143_145_L000146 ' reg <- addrg
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22, r20 wz
 if_nz jmp #\C_luaU__undump_197 ' NEI4
 mov RI, ##@C_luaU__undump_200_L000201
 mov BC, FP
 sub BC, #-(-8)
 wrlong RI, BC ' ASGNP4 addrli addrg
 jmp #\@C_luaU__undump_198 ' JUMPV addrg
C_luaU__undump_197
 mov RI, FP
 sub RI, #-(-8)
 wrlong r19, RI ' ASGNP4 addrli reg
C_luaU__undump_198
C_luaU__undump_194
 mov RI, FP
 sub RI, #-(-16)
 wrlong r23, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r21, RI ' ASGNP4 addrli reg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l8r_67e4d988_checkH_eader_L000157 ' CALL addrg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s2l84_67e4d988_loadB_yte_L000023 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaF__newL_closure
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 wrlong r22, r15 ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #70 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaD__inctop ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_luaF__newproto ' CALL addrg
 mov r20, r17
 adds r20, #12 ' ADDP4 coni
 wrlong r0, r20 ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaU__undump_205 ' EQI4
 mov r20, r17
 adds r20, #12 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 adds r20, #5 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 if_z jmp #\C_luaU__undump_205 ' EQI4
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #\@C_luaU__undump_205 ' JUMPV addrg
C_luaU__undump_205
 mov r2, ##0 ' reg ARG con
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRP4 reg
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s2l8f_67e4d988_loadF_unction_L000065
 add SP, #8 ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaU__undump_192 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Import luaS_createlngstrobj

' Catalina Import luaS_newlstr

' Catalina Import luaC_barrier_

' Catalina Import luaF_newLclosure

' Catalina Import luaF_newproto

' Catalina Import luaD_throw

' Catalina Import luaD_inctop

' Catalina Import luaZ_fill

' Catalina Import luaZ_read

' Catalina Import luaM_malloc_

' Catalina Import luaM_toobig

' Catalina Import luaO_pushfstring

' Catalina Import strlen

' Catalina Import memcmp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_luaU__undump_200_L000201 ' <symbol:200>
 byte 98
 byte 105
 byte 110
 byte 97
 byte 114
 byte 121
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_190_L000191 ' <symbol:190>
 byte 102
 byte 108
 byte 111
 byte 97
 byte 116
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 109
 byte 105
 byte 115
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_188_L000189 ' <symbol:188>
 long $43b94000 ' float

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_184_L000185 ' <symbol:184>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 109
 byte 105
 byte 115
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_180_L000181 ' <symbol:180>
 byte 108
 byte 117
 byte 97
 byte 95
 byte 78
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_178_L000179 ' <symbol:178>
 byte 108
 byte 117
 byte 97
 byte 95
 byte 73
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_176_L000177 ' <symbol:176>
 byte 73
 byte 110
 byte 115
 byte 116
 byte 114
 byte 117
 byte 99
 byte 116
 byte 105
 byte 111
 byte 110
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_174_L000175 ' <symbol:174>
 byte 99
 byte 111
 byte 114
 byte 114
 byte 117
 byte 112
 byte 116
 byte 101
 byte 100
 byte 32
 byte 99
 byte 104
 byte 117
 byte 110
 byte 107
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_172_L000173 ' <symbol:172>
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 109
 byte 105
 byte 115
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_168_L000169 ' <symbol:168>
 byte 118
 byte 101
 byte 114
 byte 115
 byte 105
 byte 111
 byte 110
 byte 32
 byte 109
 byte 105
 byte 115
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_166_L000167 ' <symbol:166>
 byte 52
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_164_L000165 ' <symbol:164>
 byte 53
 byte 0

 alignl ' align long
C_s2l8r_67e4d988_checkH_eader_L000157_160_L000161 ' <symbol:160>
 byte 110
 byte 111
 byte 116
 byte 32
 byte 97
 byte 32
 byte 98
 byte 105
 byte 110
 byte 97
 byte 114
 byte 121
 byte 32
 byte 99
 byte 104
 byte 117
 byte 110
 byte 107
 byte 0

 alignl ' align long
C_s2l8p_67e4d988_fchecksize_L000151_155_L000156 ' <symbol:155>
 byte 37
 byte 115
 byte 32
 byte 115
 byte 105
 byte 122
 byte 101
 byte 32
 byte 109
 byte 105
 byte 115
 byte 109
 byte 97
 byte 116
 byte 99
 byte 104
 byte 0

 alignl ' align long
C_s2l8m_67e4d988_checkliteral_L000143_147_L000148 ' <symbol:147>
 byte 25
 byte 147
 byte 13
 byte 10
 byte 26
 byte 10
 byte 0

 alignl ' align long
C_s2l8m_67e4d988_checkliteral_L000143_145_L000146 ' <symbol:145>
 byte 27
 byte 76
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_s2l8c_67e4d988_loadS_tring_L000055_59_L000060 ' <symbol:59>
 byte 98
 byte 97
 byte 100
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 102
 byte 111
 byte 114
 byte 32
 byte 99
 byte 111
 byte 110
 byte 115
 byte 116
 byte 97
 byte 110
 byte 116
 byte 32
 byte 115
 byte 116
 byte 114
 byte 105
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_s2l85_67e4d988_loadU_nsigned_L000030_37_L000038 ' <symbol:37>
 byte 105
 byte 110
 byte 116
 byte 101
 byte 103
 byte 101
 byte 114
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
C_s2l82_67e4d988_loadB_lock_L000017_21_L000022 ' <symbol:21>
 byte 116
 byte 114
 byte 117
 byte 110
 byte 99
 byte 97
 byte 116
 byte 101
 byte 100
 byte 32
 byte 99
 byte 104
 byte 117
 byte 110
 byte 107
 byte 0

 alignl ' align long
C_s2l8_67e4d988_error_L000013_15_L000016 ' <symbol:15>
 byte 37
 byte 115
 byte 58
 byte 32
 byte 98
 byte 97
 byte 100
 byte 32
 byte 98
 byte 105
 byte 110
 byte 97
 byte 114
 byte 121
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 40
 byte 37
 byte 115
 byte 41
 byte 0

' Catalina Code

DAT ' code segment
' end
