' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export realpath

 alignl ' align long
C_realpath ' <symbol:realpath>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #64 ' reg ARG coni
 mov r3, ##@C_realpath_6_L000007 ' reg ARG ADDRG
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncat
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r2, #63 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncat
 add SP, #8 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #\@C_realpath_9 ' JUMPV addrg
C_realpath_8
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #92 wz
 if_nz jmp #\C_realpath_11 ' NEI4
 mov r22, #47 ' reg <- coni
 wrbyte r22, r19 ' ASGNU1 reg reg
C_realpath_11
 adds r19, #1 ' ADDP4 coni
C_realpath_9
 rdbyte r22, r19 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_realpath_8 ' NEI4
 mov r0, r21 ' CVI, CVU or LOAD
' C_realpath_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export opendir

 alignl ' align long
C_opendir ' <symbol:opendir>
 calld PA,#NEWF
 sub SP, #84
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 mov r2, ##1200 ' reg ARG con
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_calloc
 add SP, #4 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_opendir_14  ' NEU4
 mov r0, ##0 ' RET con
 jmp #\@C_opendir_13 ' JUMPV addrg
C_opendir_14
 mov r2, FP
 sub r2, #-(-80) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov r4, FP
 sub r4, #-(-84) ' reg ARG ADDRLi
 mov r22, #0 ' reg <- coni
 mov r5, r22 ' CVI, CVU or LOAD
 mov r22, r21
 adds r22, #100 ' ADDP4 coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov RI, #0
 wrlong RI, --PTRA ' stack ARG coni
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__G_etP_tnS_tart
 add SP, #20 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21
 adds r4, #100 ' ADDP4 coni
 mov r5, #0 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etV_olI_nfo
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_opendir_16 ' EQU4
 mov r0, ##0 ' RET con
 jmp #\@C_opendir_13 ' JUMPV addrg
C_opendir_16
 mov r2, #64 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, FP
 sub r4, #-(-72) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strncpy
 add SP, #8 ' CALL addrg
 mov r2, FP
 sub r2, #-(-72) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-76)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 if_be jmp #\C_opendir_18 ' LEI4
 mov r20, FP
 sub r20, #-(-73) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_nz jmp #\C_opendir_18 ' NEI4
 mov r22, FP
 sub r22, #-(-76) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-73) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_opendir_18
 mov r22, r21
 adds r22, #60 ' ADDP4 coni
 mov r20, ##612 ' reg <- con
 adds r20, r21 ' ADDI/P (2)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21
 adds r2, #52 ' ADDP4 coni
 mov r3, FP
 sub r3, #-(-72) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__O_penD_ir
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_opendir_22 ' EQU4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r0, ##0 ' RET con
 jmp #\@C_opendir_13 ' JUMPV addrg
C_opendir_22
 mov r0, r21 ' CVI, CVU or LOAD
C_opendir_13
 calld PA,#POPM ' restore registers
 add SP, #84 ' framesize
 calld PA,#RETF


' Catalina Export closedir

 alignl ' align long
C_closedir ' <symbol:closedir>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
 mov r0, #0 ' reg <- coni
' C_closedir_24 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export readdir

 alignl ' align long
C_readdir ' <symbol:readdir>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #\@C_readdir_27 ' JUMPV addrg
C_readdir_26
 mov r22, #0 ' reg <- coni
 mov r20, r23
 adds r20, #68 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r20, r22 wz
 if_z jmp #\C_readdir_29 ' EQI4
 mov r20, r23
 adds r20, #79 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 mov r18, r20
 and r18, #8 ' BANDI4 coni
 cmps r18, r22 wz
 if_nz jmp #\C_readdir_29 ' NEI4
 and r20, #2 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_readdir_29 ' NEI4
 mov r2, #76 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov r22, ##1124 ' reg <- con
 mov r4, r23 ' ADDI/P
 adds r4, r22 ' ADDI/P (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_memset
 add SP, #8 ' CALL addrg
 mov r22, r23
 adds r22, #79 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 if_z jmp #\C_readdir_31 ' EQI4
 mov r22, ##1134 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdbyte r20, r22 ' reg <- CVUI4 INDIRU1 reg
 or r20, #4 ' BORI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_readdir_31
 mov r22, #0 ' reg <- coni
 mov r19, r22 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
C_readdir_33
 mov r22, r23
 adds r22, #68 ' ADDP4 coni
 adds r22, r21 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_readdir_39 ' EQI4
 cmps r22,  #32 wz
 if_nz jmp #\C_readdir_37 ' NEI4
C_readdir_39
 jmp #\@C_readdir_35 ' JUMPV addrg
C_readdir_37
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 mov r20, ##1135 ' reg <- con
 adds r20, r23 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 mov r20, r23
 adds r20, #68 ' ADDP4 coni
 adds r20, r21 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_readdir_34 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #8 wcz
 if_b jmp #\C_readdir_33 ' LTI4
C_readdir_35
 mov r21, #8 ' reg <- coni
C_readdir_40
 mov r22, r23
 adds r22, #68 ' ADDP4 coni
 adds r22, r21 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C_readdir_46 ' EQI4
 cmps r22,  #32 wz
 if_nz jmp #\C_readdir_44 ' NEI4
C_readdir_46
 jmp #\@C_readdir_42 ' JUMPV addrg
C_readdir_44
 cmps r21,  #8 wz
 if_nz jmp #\C_readdir_47 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 mov r20, ##1135 ' reg <- con
 adds r20, r23 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_readdir_47
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 mov r20, ##1135 ' reg <- con
 adds r20, r23 ' ADDI/P (2)
 adds r22, r20 ' ADDI/P (1)
 mov r20, r23
 adds r20, #68 ' ADDP4 coni
 adds r20, r21 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_readdir_41 ' (symbol refcount = 0)
 adds r21, #1 ' ADDI4 coni
 cmps r21,  #11 wcz
 if_b jmp #\C_readdir_40 ' LTI4
C_readdir_42
 mov r22, ##1135 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##1124 ' reg <- con
 mov r0, r23 ' ADDI/P
 adds r0, r22 ' ADDI/P (3)
 jmp #\@C_readdir_25 ' JUMPV addrg
C_readdir_29
C_readdir_27
 mov r2, r23
 adds r2, #68 ' ADDP4 coni
 mov r3, r23
 adds r3, #52 ' ADDP4 coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__G_etN_ext
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_readdir_26 ' EQU4
 mov r0, ##0 ' RET con
C_readdir_25
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import strlen

' Catalina Import memset

' Catalina Import strncat

' Catalina Import strncpy

' Catalina Import DFS_GetNext

' Catalina Import DFS_OpenDir

' Catalina Import DFS_GetVolInfo

' Catalina Import DFS_GetPtnStart

' Catalina Import free

' Catalina Import calloc

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_realpath_6_L000007 ' <symbol:6>
 byte 47
 byte 0

' Catalina Code

DAT ' code segment
' end
