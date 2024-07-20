' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export DFS_CanonicalToDir

 alignl ' align long
C_D_F_S__C_anonicalT_oD_ir ' <symbol:DFS_CanonicalToDir>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r23 ' CVI, CVU or LOAD
 mov r2, #11 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #11 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #JMPA
 long @C_D_F_S__C_anonicalT_oD_ir_6 ' JUMPV addrg
C_D_F_S__C_anonicalT_oD_ir_5
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #97 wz,wc
 jmp #BR_B
 long @C_D_F_S__C_anonicalT_oD_ir_8 ' LTI4
 cmps r22,  #122 wz,wc
 jmp #BR_A
 long @C_D_F_S__C_anonicalT_oD_ir_8 ' GTI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 rdbyte r20, r21 ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 subs r20, #97 ' SUBI4 coni
 adds r20, #65 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r21, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_D_F_S__C_anonicalT_oD_ir_9 ' JUMPV addrg
C_D_F_S__C_anonicalT_oD_ir_8
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #46 wz
 jmp #BRNZ
 long @C_D_F_S__C_anonicalT_oD_ir_10 ' NEI4
 adds r21, #1 ' ADDP4 coni
 mov r19, r23
 adds r19, #8 ' ADDP4 coni
 jmp #JMPA
 long @C_D_F_S__C_anonicalT_oD_ir_11 ' JUMPV addrg
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
 rdbyte r22, r21 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_D_F_S__C_anonicalT_oD_ir_13 ' EQI4
 cmps r22,  #47 wz
 jmp #BR_Z
 long @C_D_F_S__C_anonicalT_oD_ir_13 ' EQI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 cmps r22,  #11 wz,wc
 jmp #BR_B
 long @C_D_F_S__C_anonicalT_oD_ir_5 ' LTI4
C_D_F_S__C_anonicalT_oD_ir_13
 mov r0, r23 ' CVI, CVU or LOAD
' C_D_F_S__C_anonicalT_oD_ir_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import memset
' end
