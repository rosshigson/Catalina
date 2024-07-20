' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetFreeDirEnt

 alignl ' align long
C_D_F_S__G_etF_reeD_irE_nt ' <symbol:DFS_GetFreeDirEnt>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etF_reeD_irE_nt_5 ' EQU4
 mov r0, #3 ' reg <- coni
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_5
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #1 ' BORI4 coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r15, #0 ' reg <- coni
C_D_F_S__G_etF_reeD_irE_nt_7
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_reeD_irE_nt_10 ' NEU4
 mov RI, r17
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_reeD_irE_nt_10 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_10
 cmp r15,  #1 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_reeD_irE_nt_12 ' NEU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_12
 cmp r15,  #5 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_reeD_irE_nt_14 ' NEU4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r2, BC ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__G_etF_reeF_A_T_
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long $ffffff7
 mov r22, RI ' reg <- con
 cmp r15, r22 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_reeD_irE_nt_16 ' NEU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_16
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_21 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_18
 mov r2, #1 ' reg ARG coni
 mov r22, r23
 adds r22, #48 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 mov r20, r15
 sub r20, #2 ' SUBU4 coni
 mov r18, r23
 adds r18, #20 ' ADDP4 coni
 mov RI, r18
 jmp #RBYT
 mov r18, BC ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 add r22, r0 ' ADDU (1)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 regl
 mov r3, r22 ' ADDU
 add r3, r20 ' ADDU (3)
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r4, BC ' reg <- INDIRP4 reg
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etF_reeD_irE_nt_22 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_22
' C_D_F_S__G_etF_reeD_irE_nt_19 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 add r22, #1 ' ADDU4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
C_D_F_S__G_etF_reeD_irE_nt_21
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C_D_F_S__G_etF_reeD_irE_nt_18' LTU4
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, r19
 jmp #RLNG
 mov r3, BC ' reg <- INDIRU4 reg
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
 mov RI, r19
 mov BC, r15
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 cmps r13,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etF_reeD_irE_nt_27 ' EQI4
 cmps r13,  #1 wz
 jmp #BR_Z
 long @C_D_F_S__G_etF_reeD_irE_nt_28 ' EQI4
 cmps r13,  #2 wz
 jmp #BR_Z
 long @C_D_F_S__G_etF_reeD_irE_nt_29 ' EQI4
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_24 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_27
 mov r0, #7 ' reg <- coni
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_28
 jmp #LODL
 long $fff8
 mov r15, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_25 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_29
 jmp #LODL
 long $ffffff8
 mov r15, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_25 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_24
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_25
 mov r2, r15 ' CVI, CVU or LOAD
 mov RI, r19
 jmp #RLNG
 mov r3, BC ' reg <- INDIRU4 reg
 mov r4, FP
 sub r4, #-(-8) ' reg ARG ADDRLi
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r5, BC ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
C_D_F_S__G_etF_reeD_irE_nt_14
' C_D_F_S__G_etF_reeD_irE_nt_8 ' (symbol refcount = 0)
 cmp r15,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etF_reeD_irE_nt_7 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
C_D_F_S__G_etF_reeD_irE_nt_4
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import DFS_SetFAT

' Catalina Import DFS_GetFreeFAT

' Catalina Import DFS_GetNext

' Catalina Import DFS_OpenDir

' Catalina Import DFS_WriteSector

' Catalina Import memset
' end
