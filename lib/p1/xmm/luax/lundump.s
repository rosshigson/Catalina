' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_sp3s_696dde39_error_L000015 ' <symbol:error>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 jmp #LODL
 long @C_sp3s_696dde39_error_L000015_17_L000018
 mov r4, RI ' reg ARG ADDRG
 mov RI, r23
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #12 ' CALL addrg
 mov r2, #3 ' reg ARG coni
 mov RI, r23
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaD__throw
 add SP, #4 ' CALL addrg
' C_sp3s_696dde39_error_L000015_16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3s2_696dde39_loadB_lock_L000019 ' <symbol:loadBlock>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaZ__read
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_sp3s2_696dde39_loadB_lock_L000019_21 ' EQU4
 jmp #LODL
 long @C_sp3s2_696dde39_loadB_lock_L000019_23_L000024
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3s2_696dde39_loadB_lock_L000019_21
' C_sp3s2_696dde39_loadB_lock_L000019_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3s4_696dde39_loadB_yte_L000025 ' <symbol:loadByte>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
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
 long @C_sp3s4_696dde39_loadB_yte_L000025_28 ' EQU4
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
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
 mov r19, r22 ' CVUI
 and r19, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_sp3s4_696dde39_loadB_yte_L000025_29 ' JUMPV addrg
C_sp3s4_696dde39_loadB_yte_L000025_28
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaZ__fill ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_sp3s4_696dde39_loadB_yte_L000025_29
 mov r21, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 cmps r21, r22 wz
 jmp #BRNZ
 long @C_sp3s4_696dde39_loadB_yte_L000025_30 ' NEI4
 jmp #LODL
 long @C_sp3s2_696dde39_loadB_lock_L000019_23_L000024
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3s4_696dde39_loadB_yte_L000025_30
 mov r22, r21 ' CVI, CVU or LOAD
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_sp3s4_696dde39_loadB_yte_L000025_26 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3s5_696dde39_loadU_nsigned_L000032 ' <symbol:loadUnsigned>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 shr r21, #7 ' RSHU4 coni
C_sp3s5_696dde39_loadU_nsigned_L000032_34
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 cmp r19, r21 wz,wc 
 jmp #BR_B
 long @C_sp3s5_696dde39_loadU_nsigned_L000032_37' LTU4
 jmp #LODL
 long @C_sp3s5_696dde39_loadU_nsigned_L000032_39_L000040
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3s5_696dde39_loadU_nsigned_L000032_37
 mov r22, r19
 shl r22, #7 ' LSHU4 coni
 mov r20, r17
 and r20, #127 ' BANDI4 coni
 mov r19, r22 ' BORI/U
 or r19, r20 ' BORI/U (3)
' C_sp3s5_696dde39_loadU_nsigned_L000032_35 ' (symbol refcount = 0)
 mov r22, r17
 and r22, #128 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sp3s5_696dde39_loadU_nsigned_L000032_34 ' EQI4
 mov r0, r19 ' CVI, CVU or LOAD
' C_sp3s5_696dde39_loadU_nsigned_L000032_33 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3s7_696dde39_loadS_ize_L000041 ' <symbol:loadSize>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long $ffffffff
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s5_696dde39_loadU_nsigned_L000032
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sp3s7_696dde39_loadS_ize_L000041_42 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3s8_696dde39_loadI_nt_L000043 ' <symbol:loadInt>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long $7fffffff
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s5_696dde39_loadU_nsigned_L000032
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sp3s8_696dde39_loadI_nt_L000043_44 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3s9_696dde39_loadN_umber_L000045 ' <symbol:loadNumber>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s2_696dde39_loadB_lock_L000019
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 regl
' C_sp3s9_696dde39_loadN_umber_L000045_46 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sp3sa_696dde39_loadI_nteger_L000047 ' <symbol:loadInteger>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, #4 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s2_696dde39_loadB_lock_L000019
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_sp3sa_696dde39_loadI_nteger_L000047_48 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_sp3sb_696dde39_loadS_tringN__L000049 ' <symbol:loadStringN>
 jmp #NEWF
 sub SP, #40
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r17, BC ' reg <- INDIRP4 reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s7_696dde39_loadS_ize_L000041 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 jmp #BRNZ
 long @C_sp3sb_696dde39_loadS_tringN__L000049_51 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_sp3sb_696dde39_loadS_tringN__L000049_50 ' JUMPV addrg
C_sp3sb_696dde39_loadS_tringN__L000049_51
 mov r22, r15
 sub r22, #1 ' SUBU4 coni
 mov r15, r22 ' CVI, CVU or LOAD
 cmp r22,  #40 wz,wc 
 jmp #BR_A
 long @C_sp3sb_696dde39_loadS_tringN__L000049_53 ' GTU4
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s2_696dde39_loadB_lock_L000019
 add SP, #8 ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-44) ' reg ARG ADDRLi
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__newlstr
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_sp3sb_696dde39_loadS_tringN__L000049_54 ' JUMPV addrg
C_sp3sb_696dde39_loadS_tringN__L000049_53
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r17 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaS__createlngstrobj
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r19, RI ' ASGNP4 addrli reg
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
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaD__inctop ' CALL addrg
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, r19
 adds r3, #16 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s2_696dde39_loadB_lock_L000019
 add SP, #8 ' CALL addrg
 mov r22, r17
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
C_sp3sb_696dde39_loadS_tringN__L000049_54
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sp3sb_696dde39_loadS_tringN__L000049_56 ' EQI4
 mov r20, r19
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #24 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sp3sb_696dde39_loadS_tringN__L000049_56 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sp3sb_696dde39_loadS_tringN__L000049_56 ' JUMPV addrg
C_sp3sb_696dde39_loadS_tringN__L000049_56
 mov r0, r19 ' CVI, CVU or LOAD
C_sp3sb_696dde39_loadS_tringN__L000049_50
 jmp #POPM ' restore registers
 add SP, #40 ' framesize
 jmp #RETF


 alignl ' align long
C_sp3sc_696dde39_loadS_tring_L000057 ' <symbol:loadString>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sb_696dde39_loadS_tringN__L000049
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sp3sc_696dde39_loadS_tring_L000057_59 ' NEU4
 jmp #LODL
 long @C_sp3sc_696dde39_loadS_tring_L000057_61_L000062
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3sc_696dde39_loadS_tring_L000057_59
 mov r0, r19 ' CVI, CVU or LOAD
' C_sp3sc_696dde39_loadS_tring_L000057_58 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3se_696dde39_loadC_ode_L000063 ' <symbol:loadCode>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 jmp #LODL
 long $3fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sp3se_696dde39_loadC_ode_L000063_66 ' LEU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #JMPA
 long @C_sp3se_696dde39_loadC_ode_L000063_66 ' JUMPV addrg
C_sp3se_696dde39_loadC_ode_L000063_66
 mov r2, #0 ' reg ARG coni
 mov r22, r19 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #2 ' LSHU4 coni
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #52 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22
 shl r2, #2 ' LSHU4 coni
 mov r22, r21
 adds r22, #52 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s2_696dde39_loadB_lock_L000019
 add SP, #8 ' CALL addrg
' C_sp3se_696dde39_loadC_ode_L000063_64 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3sg_696dde39_loadC_onstants_L000068 ' <symbol:loadConstants>
 jmp #NEWF
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 jmp #LODL
 long $1fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sp3sg_696dde39_loadC_onstants_L000068_71 ' LEU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_71 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_71
 mov r2, #0 ' reg ARG coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #3 ' LSHU4 coni
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #16 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_75 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_72
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_sp3sg_696dde39_loadC_onstants_L000068_73 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sg_696dde39_loadC_onstants_L000068_75
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sg_696dde39_loadC_onstants_L000068_72 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_79 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_76
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #48 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 cmps r15,  #0 wz,wc
 jmp #BR_B
 long @C_sp3sg_696dde39_loadC_onstants_L000068_80 ' LTI4
 cmps r15,  #4 wz,wc
 jmp #BR_A
 long @C_sp3sg_696dde39_loadC_onstants_L000068_88 ' GTI4
 mov r22, r15
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C_sp3sg_696dde39_loadC_onstants_L000068_89_L000091
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sp3sg_696dde39_loadC_onstants_L000068_89_L000091 ' <symbol:89>
 long @C_sp3sg_696dde39_loadC_onstants_L000068_82
 long @C_sp3sg_696dde39_loadC_onstants_L000068_83
 long @C_sp3sg_696dde39_loadC_onstants_L000068_80
 long @C_sp3sg_696dde39_loadC_onstants_L000068_86
 long @C_sp3sg_696dde39_loadC_onstants_L000068_87

' Catalina Code

DAT ' code segment
C_sp3sg_696dde39_loadC_onstants_L000068_88
 cmps r15,  #17 wz
 jmp #BR_Z
 long @C_sp3sg_696dde39_loadC_onstants_L000068_84 ' EQI4
 cmps r15,  #19 wz
 jmp #BR_Z
 long @C_sp3sg_696dde39_loadC_onstants_L000068_85 ' EQI4
 cmps r15,  #20 wz
 jmp #BR_Z
 long @C_sp3sg_696dde39_loadC_onstants_L000068_87 ' EQI4
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_80 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_82
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_81 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_83
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #1 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_81 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_84
 mov r22, r13
 adds r22, #4 ' ADDP4 coni
 mov r20, #17 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_81 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_85
 mov r11, r13 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s9_696dde39_loadN_umber_L000045 ' CALL addrg
 mov RI, r11
 mov BC, r0
 jmp #WLNG ' ASGNF4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, #19 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_81 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_86
 mov r11, r13 ' CVI, CVU or LOAD
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3sa_696dde39_loadI_nteger_L000047 ' CALL addrg
 mov RI, r11
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, #3 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_sp3sg_696dde39_loadC_onstants_L000068_81 ' JUMPV addrg
C_sp3sg_696dde39_loadC_onstants_L000068_87
 mov r11, r13 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sc_696dde39_loadS_tring_L000057
 add SP, #4 ' CALL addrg
 mov r9, r0 ' CVI, CVU or LOAD
 mov RI, r11
 mov BC, r9
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r11
 adds r22, #4 ' ADDP4 coni
 mov r20, r9
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #64 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_sp3sg_696dde39_loadC_onstants_L000068_80
C_sp3sg_696dde39_loadC_onstants_L000068_81
' C_sp3sg_696dde39_loadC_onstants_L000068_77 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sg_696dde39_loadC_onstants_L000068_79
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sg_696dde39_loadC_onstants_L000068_76 ' LTI4
' C_sp3sg_696dde39_loadC_onstants_L000068_69 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3sj_696dde39_loadP_rotos_L000092 ' <symbol:loadProtos>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 jmp #LODL
 long $3fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sp3sj_696dde39_loadP_rotos_L000092_95 ' LEU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #JMPA
 long @C_sp3sj_696dde39_loadP_rotos_L000092_95 ' JUMPV addrg
C_sp3sj_696dde39_loadP_rotos_L000092_95
 mov r2, #0 ' reg ARG coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #2 ' LSHU4 coni
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #28 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sj_696dde39_loadP_rotos_L000092_99 ' JUMPV addrg
C_sp3sj_696dde39_loadP_rotos_L000092_96
 mov r22, r19
 shl r22, #2 ' LSHI4 coni
 mov r20, r21
 adds r20, #56 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_sp3sj_696dde39_loadP_rotos_L000092_97 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sj_696dde39_loadP_rotos_L000092_99
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sj_696dde39_loadP_rotos_L000092_96 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sj_696dde39_loadP_rotos_L000092_103 ' JUMPV addrg
C_sp3sj_696dde39_loadP_rotos_L000092_100
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaF__newproto ' CALL addrg
 mov r20, r19
 shl r20, #2 ' LSHI4 coni
 mov r18, r21
 adds r18, #56 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r21
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_sp3sj_696dde39_loadP_rotos_L000092_105 ' EQI4
 mov r20, r19
 shl r20, #2 ' LSHI4 coni
 mov r18, r21
 adds r18, #56 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
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
 long @C_sp3sj_696dde39_loadP_rotos_L000092_105 ' EQI4
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
 mov r3, r21 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_sp3sj_696dde39_loadP_rotos_L000092_105 ' JUMPV addrg
C_sp3sj_696dde39_loadP_rotos_L000092_105
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
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
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sf_696dde39_loadF_unction_L000067
 add SP, #8 ' CALL addrg
' C_sp3sj_696dde39_loadP_rotos_L000092_101 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sj_696dde39_loadP_rotos_L000092_103
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sj_696dde39_loadP_rotos_L000092_100 ' LTI4
' C_sp3sj_696dde39_loadP_rotos_L000092_93 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3sk_696dde39_loadU_pvalues_L000106 ' <symbol:loadUpvalues>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 jmp #LODL
 long $1fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sp3sk_696dde39_loadU_pvalues_L000106_109 ' LEU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #JMPA
 long @C_sp3sk_696dde39_loadU_pvalues_L000106_109 ' JUMPV addrg
C_sp3sk_696dde39_loadU_pvalues_L000106_109
 mov r2, #0 ' reg ARG coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #3 ' LSHU4 coni
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sk_696dde39_loadU_pvalues_L000106_113 ' JUMPV addrg
C_sp3sk_696dde39_loadU_pvalues_L000106_110
 mov r22, r19
 shl r22, #3 ' LSHI4 coni
 mov r20, r21
 adds r20, #60 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_sp3sk_696dde39_loadU_pvalues_L000106_111 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sk_696dde39_loadU_pvalues_L000106_113
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sk_696dde39_loadU_pvalues_L000106_110 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sk_696dde39_loadU_pvalues_L000106_117 ' JUMPV addrg
C_sp3sk_696dde39_loadU_pvalues_L000106_114
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #60 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #4 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #60 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #5 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #60 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #6 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
' C_sp3sk_696dde39_loadU_pvalues_L000106_115 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sk_696dde39_loadU_pvalues_L000106_117
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sk_696dde39_loadU_pvalues_L000106_114 ' LTI4
' C_sp3sk_696dde39_loadU_pvalues_L000106_107 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3sl_696dde39_loadD_ebug_L000118 ' <symbol:loadDebug>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sp3sl_696dde39_loadD_ebug_L000118_121 ' LEU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #JMPA
 long @C_sp3sl_696dde39_loadD_ebug_L000118_121 ' JUMPV addrg
C_sp3sl_696dde39_loadD_ebug_L000118_121
 mov r2, #0 ' reg ARG coni
 mov r22, #1 ' reg <- coni
 mov r20, r17 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r0 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #64 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #24 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, #1 ' reg <- coni
 mov r20, r17 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #64 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s2_696dde39_loadB_lock_L000019
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 jmp #LODL
 long $1fffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sp3sl_696dde39_loadD_ebug_L000118_123 ' LEU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #JMPA
 long @C_sp3sl_696dde39_loadD_ebug_L000118_123 ' JUMPV addrg
C_sp3sl_696dde39_loadD_ebug_L000118_123
 mov r2, #0 ' reg ARG coni
 mov r22, r17 ' CVI, CVU or LOAD
 mov r3, r22
 shl r3, #3 ' LSHU4 coni
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #68 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #36 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sl_696dde39_loadD_ebug_L000118_127 ' JUMPV addrg
C_sp3sl_696dde39_loadD_ebug_L000118_124
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #68 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #68 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
' C_sp3sl_696dde39_loadD_ebug_L000118_125 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sl_696dde39_loadD_ebug_L000118_127
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sl_696dde39_loadD_ebug_L000118_124 ' LTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r17 ' CVI, CVU or LOAD
 add r22, #1 ' ADDU4 coni
 jmp #LODL
 long $15555555
 mov r20, RI ' reg <- con
 cmp r22, r20 wz,wc 
 jmp #BRBE
 long @C_sp3sl_696dde39_loadD_ebug_L000118_129 ' LEU4
 mov RI, r23
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaM__toobig ' CALL addrg
 jmp #JMPA
 long @C_sp3sl_696dde39_loadD_ebug_L000118_129 ' JUMPV addrg
C_sp3sl_696dde39_loadD_ebug_L000118_129
 mov r2, #0 ' reg ARG coni
 mov r22, #12 ' reg <- coni
 mov r20, r17 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r3, r0 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaM__malloc_
 add SP, #8 ' CALL addrg
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #32 ' ADDP4 coni
 mov RI, r22
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sl_696dde39_loadD_ebug_L000118_133 ' JUMPV addrg
C_sp3sl_696dde39_loadD_ebug_L000118_130
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
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
' C_sp3sl_696dde39_loadD_ebug_L000118_131 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sl_696dde39_loadD_ebug_L000118_133
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sl_696dde39_loadD_ebug_L000118_130 ' LTI4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sl_696dde39_loadD_ebug_L000118_137 ' JUMPV addrg
C_sp3sl_696dde39_loadD_ebug_L000118_134
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sb_696dde39_loadS_tringN__L000049
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #12 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, r0 ' ADDI/P (2)
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #12 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, r0 ' ADDI/P (2)
 adds r20, #4 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #12 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r21
 adds r20, #72 ' ADDP4 coni
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 adds r20, r0 ' ADDI/P (2)
 adds r20, #8 ' ADDP4 coni
 mov RI, r20
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
' C_sp3sl_696dde39_loadD_ebug_L000118_135 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sl_696dde39_loadD_ebug_L000118_137
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sl_696dde39_loadD_ebug_L000118_134 ' LTI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_sp3sl_696dde39_loadD_ebug_L000118_138 ' EQI4
 mov r22, r21
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r17, BC ' reg <- INDIRI4 reg
C_sp3sl_696dde39_loadD_ebug_L000118_138
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_sp3sl_696dde39_loadD_ebug_L000118_143 ' JUMPV addrg
C_sp3sl_696dde39_loadD_ebug_L000118_140
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sb_696dde39_loadS_tringN__L000049
 add SP, #4 ' CALL addrg
 mov r20, r19
 shl r20, #3 ' LSHI4 coni
 mov r18, r21
 adds r18, #60 ' ADDP4 coni
 mov RI, r18
 jmp #RLNG
 mov r18, BC ' reg <- INDIRP4 reg
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
' C_sp3sl_696dde39_loadD_ebug_L000118_141 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_sp3sl_696dde39_loadD_ebug_L000118_143
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_sp3sl_696dde39_loadD_ebug_L000118_140 ' LTI4
' C_sp3sl_696dde39_loadD_ebug_L000118_119 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3sf_696dde39_loadF_unction_L000067 ' <symbol:loadFunction>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sb_696dde39_loadS_tringN__L000049
 add SP, #4 ' CALL addrg
 mov r20, r21
 adds r20, #76 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_sp3sf_696dde39_loadF_unction_L000067_145 ' NEU4
 mov r22, r21
 adds r22, #76 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNP4 reg reg
C_sp3sf_696dde39_loadF_unction_L000067_145
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r20, r21
 adds r20, #40 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s8_696dde39_loadI_nt_L000043 ' CALL addrg
 mov r20, r21
 adds r20, #44 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r20, r21
 adds r20, #6 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r20, r21
 adds r20, #7 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3se_696dde39_loadC_ode_L000063
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sg_696dde39_loadC_onstants_L000068
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sk_696dde39_loadU_pvalues_L000106
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sj_696dde39_loadP_rotos_L000092
 add SP, #4 ' CALL addrg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sl_696dde39_loadD_ebug_L000118
 add SP, #4 ' CALL addrg
' C_sp3sf_696dde39_loadF_unction_L000067_144 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3sm_696dde39_checkliteral_L000147 ' <symbol:checkliteral>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r17 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r2, r0 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s2_696dde39_loadB_lock_L000019
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcmp
 add SP, #8 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_sp3sm_696dde39_checkliteral_L000147_153 ' EQI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3sm_696dde39_checkliteral_L000147_153
' C_sp3sm_696dde39_checkliteral_L000147_148 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


 alignl ' align long
C_sp3sp_696dde39_fchecksize_L000155 ' <symbol:fchecksize>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmp r22, r21 wz
 jmp #BR_Z
 long @C_sp3sp_696dde39_fchecksize_L000155_157 ' EQU4
 mov r2, r19 ' CVI, CVU or LOAD
 jmp #LODL
 long @C_sp3sp_696dde39_fchecksize_L000155_159_L000160
 mov r3, RI ' reg ARG ADDRG
 mov RI, r23
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaO__pushfstring
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3sp_696dde39_fchecksize_L000155_157
' C_sp3sp_696dde39_fchecksize_L000155_156 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_sp3sr_696dde39_checkH_eader_L000161 ' <symbol:checkHeader>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_164_L000165
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_sp3sm_696dde39_checkliteral_L000147_149_L000150+1
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sm_696dde39_checkliteral_L000147
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r22,  #84 wz
 jmp #BR_Z
 long @C_sp3sr_696dde39_checkH_eader_L000161_166 ' EQI4
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_168_L000169
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3sr_696dde39_checkH_eader_L000161_166
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_sp3sr_696dde39_checkH_eader_L000161_170 ' EQI4
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_172_L000173
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3sr_696dde39_checkH_eader_L000161_170
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_174_L000175
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_sp3sm_696dde39_checkliteral_L000147_151_L000152
 mov r3, RI ' reg ARG ADDRG
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sm_696dde39_checkliteral_L000147
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_176_L000177
 mov r2, RI ' reg ARG ADDRG
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sp_696dde39_fchecksize_L000155
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_178_L000179
 mov r2, RI ' reg ARG ADDRG
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sp_696dde39_fchecksize_L000155
 add SP, #8 ' CALL addrg
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_180_L000181
 mov r2, RI ' reg ARG ADDRG
 mov r3, #4 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sp_696dde39_fchecksize_L000155
 add SP, #8 ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3sa_696dde39_loadI_nteger_L000047 ' CALL addrg
 jmp #LODL
 long 22136
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BR_Z
 long @C_sp3sr_696dde39_checkH_eader_L000161_182 ' EQI4
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_184_L000185
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3sr_696dde39_checkH_eader_L000161_182
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s9_696dde39_loadN_umber_L000045 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_sp3sr_696dde39_checkH_eader_L000161_188_L000189
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BR_Z
 long @C_sp3sr_696dde39_checkH_eader_L000161_186 ' EQF4
 jmp #LODL
 long @C_sp3sr_696dde39_checkH_eader_L000161_190_L000191
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3s_696dde39_error_L000015
 add SP, #4 ' CALL addrg
C_sp3sr_696dde39_checkH_eader_L000161_186
' C_sp3sr_696dde39_checkH_eader_L000161_162 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export luaU_undump

 alignl ' align long
C_luaU__undump ' <symbol:luaU_undump>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #64 wz
 jmp #BR_Z
 long @C_luaU__undump_195 ' EQI4
 cmps r22,  #61 wz
 jmp #BRNZ
 long @C_luaU__undump_193 ' NEI4
C_luaU__undump_195
 mov r22, r19
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_luaU__undump_194 ' JUMPV addrg
C_luaU__undump_193
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C_sp3sm_696dde39_checkliteral_L000147_149_L000150
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 addrg
 and r20, cviu_m1 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_luaU__undump_197 ' NEI4
 jmp #LODL
 long @C_luaU__undump_200_L000201
 mov r22, RI ' reg <- addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22 , RI ' ASGNP4 addrli reg
 jmp #JMPA
 long @C_luaU__undump_198 ' JUMPV addrg
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
 jmp #CALA
 long @C_sp3sr_696dde39_checkH_eader_L000161 ' CALL addrg
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_sp3s4_696dde39_loadB_yte_L000025 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaF__newL_closure
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r15, BC ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r17, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r15
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r15
 adds r22, #4 ' ADDP4 coni
 mov r20, #70 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaD__inctop ' CALL addrg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_luaF__newproto ' CALL addrg
 mov r20, r17
 adds r20, #12 ' ADDP4 coni
 mov RI, r20
 mov BC, r0
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, #0 ' reg <- coni
 mov r20, r17
 adds r20, #5 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 and r20, #32 ' BANDI4 coni
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_luaU__undump_205 ' EQI4
 mov r20, r17
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
 long @C_luaU__undump_205 ' EQI4
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_luaC__barrier_
 add SP, #8 ' CALL addrg
 jmp #JMPA
 long @C_luaU__undump_205 ' JUMPV addrg
C_luaU__undump_205
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r22, r17
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r3, BC ' reg <- INDIRP4 reg
 mov r4, FP
 sub r4, #-(-16) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_sp3sf_696dde39_loadF_unction_L000067
 add SP, #8 ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
' C_luaU__undump_192 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


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
C_sp3sr_696dde39_checkH_eader_L000161_190_L000191 ' <symbol:190>
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
C_sp3sr_696dde39_checkH_eader_L000161_188_L000189 ' <symbol:188>
 long $43b94000 ' float

 alignl ' align long
C_sp3sr_696dde39_checkH_eader_L000161_184_L000185 ' <symbol:184>
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
C_sp3sr_696dde39_checkH_eader_L000161_180_L000181 ' <symbol:180>
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
C_sp3sr_696dde39_checkH_eader_L000161_178_L000179 ' <symbol:178>
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
C_sp3sr_696dde39_checkH_eader_L000161_176_L000177 ' <symbol:176>
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
C_sp3sr_696dde39_checkH_eader_L000161_174_L000175 ' <symbol:174>
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
C_sp3sr_696dde39_checkH_eader_L000161_172_L000173 ' <symbol:172>
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
C_sp3sr_696dde39_checkH_eader_L000161_168_L000169 ' <symbol:168>
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
C_sp3sr_696dde39_checkH_eader_L000161_164_L000165 ' <symbol:164>
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
C_sp3sp_696dde39_fchecksize_L000155_159_L000160 ' <symbol:159>
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
C_sp3sm_696dde39_checkliteral_L000147_151_L000152 ' <symbol:151>
 byte 25
 byte 147
 byte 13
 byte 10
 byte 26
 byte 10
 byte 0

 alignl ' align long
C_sp3sm_696dde39_checkliteral_L000147_149_L000150 ' <symbol:149>
 byte 27
 byte 76
 byte 117
 byte 97
 byte 0

 alignl ' align long
C_sp3sc_696dde39_loadS_tring_L000057_61_L000062 ' <symbol:61>
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
C_sp3s5_696dde39_loadU_nsigned_L000032_39_L000040 ' <symbol:39>
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
C_sp3s2_696dde39_loadB_lock_L000019_23_L000024 ' <symbol:23>
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
C_sp3s_696dde39_error_L000015_17_L000018 ' <symbol:17>
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
