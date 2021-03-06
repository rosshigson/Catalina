' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_GetFreeDirEnt

 alignl ' align long
C_D_F_S__G_etF_reeD_irE_nt ' <symbol:DFS_GetFreeDirEnt>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__G_etF_reeD_irE_nt_5 ' EQU4
 mov r0, #3 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_5
 mov r22, r19
 adds r22, #12 ' ADDP4 coni
 rdbyte r20, r22 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 or r20, #1 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r15, #0 ' reg <- coni
C_D_F_S__G_etF_reeD_irE_nt_7
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__G_etF_reeD_irE_nt_10 ' NEU4
 rdbyte r22, r17 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__G_etF_reeD_irE_nt_10 ' NEI4
 mov r0, #0 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_10
 cmp r15,  #1 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__G_etF_reeD_irE_nt_12 ' NEU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_12
 cmp r15,  #5 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__G_etF_reeD_irE_nt_14 ' NEU4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__G_etF_reeF_A_T_
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long $ffffff7
 mov r22, RI ' reg <- con
 cmp r15, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_D_F_S__G_etF_reeD_irE_nt_16 ' NEU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_16
 PRIMITIVE(#LODL)
 long 512
 mov r2, RI ' reg ARG con
 mov r3, #0 ' reg ARG coni
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_21 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_18
 mov r22, r15
 sub r22, #2 ' SUBU4 coni
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r2, #1 ' reg ARG coni
 mov r20, r23
 adds r20, #48 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r22, r20 ' ADDU
 add r22, r0 ' ADDU (3)
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 mov r3, r22 ' ADDU
 add r3, r20 ' ADDU (3)
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r4, r22 ' reg <- INDIRP4 reg
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 mov r5, r22 ' CVUI
 and r5, cviu_m1 ' zero extend
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__G_etF_reeD_irE_nt_22 ' EQU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_22
' C_D_F_S__G_etF_reeD_irE_nt_19 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
C_D_F_S__G_etF_reeD_irE_nt_21
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r23
 adds r20, #20 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmp r22, r20 wcz 
 PRIMITIVE(#BR_B)
 long @C_D_F_S__G_etF_reeD_irE_nt_18' LTU4
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r2, r15 ' CVI, CVU or LOAD
 rdlong r3, r19 ' reg <- INDIRU4 reg
 mov r4, FP
 sub r4, #-(-4) ' reg ARG ADDRLi
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
 wrlong r15, r19 ' ASGNU4 reg reg
 mov r22, r19
 adds r22, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r19
 adds r22, #5 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r13, r22 ' CVUI
 and r13, cviu_m1 ' zero extend
 cmps r13,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__G_etF_reeD_irE_nt_27 ' EQI4
 cmps r13,  #1 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__G_etF_reeD_irE_nt_28 ' EQI4
 cmps r13,  #2 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__G_etF_reeD_irE_nt_29 ' EQI4
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_24 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_27
 mov r0, #7 ' RET coni
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_28
 PRIMITIVE(#LODL)
 long $fff8
 mov r15, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_25 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_29
 PRIMITIVE(#LODL)
 long $ffffff8
 mov r15, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_25 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_24
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_D_F_S__G_etF_reeD_irE_nt_4 ' JUMPV addrg
C_D_F_S__G_etF_reeD_irE_nt_25
 mov r2, r15 ' CVI, CVU or LOAD
 rdlong r3, r19 ' reg <- INDIRU4 reg
 mov r4, FP
 sub r4, #-(-4) ' reg ARG ADDRLi
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r5, r22 ' reg <- INDIRP4 reg
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
C_D_F_S__G_etF_reeD_irE_nt_14
' C_D_F_S__G_etF_reeD_irE_nt_8 ' (symbol refcount = 0)
 cmp r15,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_D_F_S__G_etF_reeD_irE_nt_7 ' EQU4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r0, RI ' reg <- con
C_D_F_S__G_etF_reeD_irE_nt_4
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import DFS_SetFAT

' Catalina Import DFS_GetFreeFAT

' Catalina Import DFS_GetNext

' Catalina Import DFS_OpenDir

' Catalina Import DFS_WriteSector

' Catalina Import memset
' end
