' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetPtnStart

 alignl ' align long
C_D_F_S__G_etP_tnS_tart ' <symbol:DFS_GetPtnStart>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 jmp #LODF
 long 8
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r13, #0 ' reg <- coni
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r15, r22 ' reg <- INDIRP4 reg
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #3 wz,wc
 jmp #BRBE
 long @C_D_F_S__G_etP_tnS_tart_5 ' LEI4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etP_tnS_tart_4 ' JUMPV addrg
C_D_F_S__G_etP_tnS_tart_5
 mov r2, #1 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etP_tnS_tart_7 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etP_tnS_tart_4 ' JUMPV addrg
C_D_F_S__G_etP_tnS_tart_7
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #4 ' LSHI4 coni
 mov r20, r15
 adds r20, #446 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r22
 adds r20, #8 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r22
 adds r18, #9 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r22
 adds r18, #10 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 adds r22, #11 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #24 ' LSHU4 coni
 mov r13, r20 ' BORI/U
 or r13, r22 ' BORI/U (3)
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etP_tnS_tart_9 ' EQU4
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #4 ' LSHI4 coni
 mov r20, r15
 adds r20, #446 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r21 ' ASGNU1 reg reg
C_D_F_S__G_etP_tnS_tart_9
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etP_tnS_tart_11 ' EQU4
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #4 ' LSHI4 coni
 mov r20, r15
 adds r20, #446 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 adds r22, #4 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 wrbyte r22, r19 ' ASGNU1 reg reg
C_D_F_S__G_etP_tnS_tart_11
 mov r22, r17 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etP_tnS_tart_13 ' EQU4
 mov r22, r23 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #4 ' LSHI4 coni
 mov r20, r15
 adds r20, #446 ' ADDP4 coni
 adds r22, r20 ' ADDI/P (1)
 mov r20, r22
 adds r20, #12 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r18, r22
 adds r18, #13 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #8 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 mov r18, r22
 adds r18, #14 ' ADDP4 coni
 rdbyte r18, r18 ' reg <- INDIRU1 reg
 and r18, cviu_m1 ' zero extend
 shl r18, #16 ' LSHU4 coni
 or r20, r18 ' BORI/U (1)
 adds r22, #15 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 shl r22, #24 ' LSHU4 coni
 or r22, r20 ' BORI/U (2)
 wrlong r22, r17 ' ASGNU4 reg reg
C_D_F_S__G_etP_tnS_tart_13
 mov r0, r13 ' CVI, CVU or LOAD
C_D_F_S__G_etP_tnS_tart_4
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import DFS_ReadSector
' end
