' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export DFS_CanonicalToDir

 alignl ' align long
C_D_F_S__C_anonicalT_oD_ir ' <symbol:DFS_CanonicalToDir>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r23 ' CVI, CVU or LOAD
 mov r2, #11 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #11 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_D_F_S__C_anonicalT_oD_ir_6 ' JUMPV addrg
C_D_F_S__C_anonicalT_oD_ir_5
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #97 wcz
 if_b jmp #\C_D_F_S__C_anonicalT_oD_ir_8 ' LTI4
 cmps r22,  #122 wcz
 if_a jmp #\C_D_F_S__C_anonicalT_oD_ir_8 ' GTI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 rdbyte r20, r21 ' reg <- CVUI4 INDIRU1 reg
 subs r20, #97 ' SUBI4 coni
 adds r20, #65 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r21, #1 ' ADDP4 coni
 jmp #\@C_D_F_S__C_anonicalT_oD_ir_9 ' JUMPV addrg
C_D_F_S__C_anonicalT_oD_ir_8
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #46 wz
 if_nz jmp #\C_D_F_S__C_anonicalT_oD_ir_10 ' NEI4
 adds r21, #1 ' ADDP4 coni
 mov r19, r23
 adds r19, #8 ' ADDP4 coni
 jmp #\@C_D_F_S__C_anonicalT_oD_ir_11 ' JUMPV addrg
C_D_F_S__C_anonicalT_oD_ir_10
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_D_F_S__C_anonicalT_oD_ir_11
C_D_F_S__C_anonicalT_oD_ir_9
C_D_F_S__C_anonicalT_oD_ir_6
 rdbyte r22, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_D_F_S__C_anonicalT_oD_ir_13 ' EQI4
 cmps r22,  #47 wz
 if_z jmp #\C_D_F_S__C_anonicalT_oD_ir_13 ' EQI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 cmps r22,  #11 wcz
 if_b jmp #\C_D_F_S__C_anonicalT_oD_ir_5 ' LTI4
C_D_F_S__C_anonicalT_oD_ir_13
 mov r0, r23 ' CVI, CVU or LOAD
' C_D_F_S__C_anonicalT_oD_ir_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import memset
' end
