' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_UnlinkFile

 alignl ' align long
C_D_F_S__U_nlinkF_ile ' <symbol:DFS_UnlinkFile>
 calld PA,#NEWF
 sub SP, #36
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov RI, FP
 sub RI, #-(-40)
 wrlong r19, RI ' ASGNP4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-36)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r17, #0 ' reg <- coni
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, #1 ' reg ARG coni
 mov r5, r21 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_D_F_S__U_nlinkF_ile_5 ' EQU4
 mov r0, #3 ' reg <- coni
 jmp #\@C_D_F_S__U_nlinkF_ile_4 ' JUMPV addrg
C_D_F_S__U_nlinkF_ile_5
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-28)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 rdbyte r5, r23 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__R_eadS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_D_F_S__U_nlinkF_ile_7 ' EQU4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_D_F_S__U_nlinkF_ile_4 ' JUMPV addrg
C_D_F_S__U_nlinkF_ile_7
 mov r22, FP
 sub r22, #-(-24) ' reg <- addrli
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 shl r22, #5 ' LSHI4 coni
 adds r22, r19 ' ADDI/P (1)
 mov r20, #229 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, #1 ' reg ARG coni
 mov RI, FP
 sub RI, #-(-28)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 rdbyte r5, r23 ' reg <- CVUI4 INDIRU1 reg
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__W_riteS_ector
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_D_F_S__U_nlinkF_ile_15 ' EQU4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_D_F_S__U_nlinkF_ile_4 ' JUMPV addrg
C_D_F_S__U_nlinkF_ile_14
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r17, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-20)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r3, FP
 sub r3, #-(-36) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etF_A_T_
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, #0 ' reg ARG coni
 mov r3, r17 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-36) ' reg ARG ADDRLi
 mov r5, r19 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 wrlong RI, --PTRA ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__S_etF_A_T_
 add SP, #16 ' CALL addrg
C_D_F_S__U_nlinkF_ile_15
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_D_F_S__U_nlinkF_ile_25 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##4087 ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_D_F_S__U_nlinkF_ile_28 ' GEU4
C_D_F_S__U_nlinkF_ile_25
 mov r22, #1 ' reg <- coni
 mov r20, r23
 adds r20, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_nz jmp #\C_D_F_S__U_nlinkF_ile_27 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$fff7 ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_D_F_S__U_nlinkF_ile_28 ' GEU4
C_D_F_S__U_nlinkF_ile_27
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #2 wz
 if_nz jmp #\C_D_F_S__U_nlinkF_ile_29 ' NEI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, ##$ffffff7 ' reg <- con
 cmp r22, r20 wcz 
 if_ae jmp #\C_D_F_S__U_nlinkF_ile_28 ' GEU4
C_D_F_S__U_nlinkF_ile_29
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_D_F_S__U_nlinkF_ile_14  ' NEU4
C_D_F_S__U_nlinkF_ile_28
 mov r0, #0 ' reg <- coni
C_D_F_S__U_nlinkF_ile_4
 calld PA,#POPM ' restore registers
 add SP, #36 ' framesize
 calld PA,#RETF


' Catalina Import DFS_SetFAT

' Catalina Import DFS_GetFAT

' Catalina Import DFS_OpenFile

' Catalina Import DFS_WriteSector

' Catalina Import DFS_ReadSector
' end
