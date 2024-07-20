' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetFAT

 alignl ' align long
C_D_F_S__G_etF_A_T_ ' <symbol:DFS_GetFAT>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_A_T__5 ' NEI4
 mov r0, #7 ' RET coni
 jmp #JMPA
 long @C_D_F_S__G_etF_A_T__4 ' JUMPV addrg
C_D_F_S__G_etF_A_T__5
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_A_T__7 ' NEI4
 mov r15, r17
 shl r15, #1 ' LSHU4 coni
 jmp #JMPA
 long @C_D_F_S__G_etF_A_T__8 ' JUMPV addrg
C_D_F_S__G_etF_A_T__7
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_A_T__9 ' NEI4
 mov r15, r17
 shl r15, #2 ' LSHU4 coni
 jmp #JMPA
 long @C_D_F_S__G_etF_A_T__10 ' JUMPV addrg
C_D_F_S__G_etF_A_T__9
 jmp #LODL
 long $ffffff7
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etF_A_T__4 ' JUMPV addrg
C_D_F_S__G_etF_A_T__10
C_D_F_S__G_etF_A_T__8
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_ldiv
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r23
 adds r20, #40 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r13, r22 ' ADDU
 add r13, r20 ' ADDU (3)
 rdlong r22, r19 ' reg <- INDIRU4 reg
 cmp r13, r22 wz
 jmp #BR_Z
 long @C_D_F_S__G_etF_A_T__11 ' EQU4
 mov r2, #1 ' reg ARG coni
 mov r3, r13 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__G_etF_A_T__13 ' EQU4
 mov r22, #0 ' reg <- coni
 wrlong r22, r19 ' ASGNU4 reg reg
 jmp #LODL
 long $ffffff7
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_D_F_S__G_etF_A_T__4 ' JUMPV addrg
C_D_F_S__G_etF_A_T__13
 wrlong r13, r19 ' ASGNU4 reg reg
C_D_F_S__G_etF_A_T__11
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-20) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_ldiv
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r15, r22 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_A_T__16 ' NEI4
 mov r22, r15 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r15
 add r20, #1 ' ADDU4 coni
 adds r20, r21 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #8 ' LSHU4 coni
 mov r11, r22 ' BORI/U
 or r11, r20 ' BORI/U (3)
 jmp #JMPA
 long @C_D_F_S__G_etF_A_T__17 ' JUMPV addrg
C_D_F_S__G_etF_A_T__16
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #2 wz
 jmp #BRNZ
 long @C_D_F_S__G_etF_A_T__18 ' NEI4
 mov r22, r15 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r20, r15
 add r20, #1 ' ADDU4 coni
 adds r20, r21 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #8 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r15
 add r20, #2 ' ADDU4 coni
 adds r20, r21 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #16 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 mov r20, r15
 add r20, #3 ' ADDU4 coni
 adds r20, r21 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 shl r20, #24 ' LSHU4 coni
 or r22, r20 ' BORI/U (1)
 jmp #LODL
 long $fffffff
 mov r20, RI ' reg <- con
 mov r11, r22 ' BANDI/U
 and r11, r20 ' BANDI/U (3)
 jmp #JMPA
 long @C_D_F_S__G_etF_A_T__19 ' JUMPV addrg
C_D_F_S__G_etF_A_T__18
 jmp #LODL
 long $ffffff7
 mov r11, RI ' reg <- con
C_D_F_S__G_etF_A_T__19
C_D_F_S__G_etF_A_T__17
 mov r0, r11 ' CVI, CVU or LOAD
C_D_F_S__G_etF_A_T__4
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import DFS_ReadSector

' Catalina Import ldiv
' end
