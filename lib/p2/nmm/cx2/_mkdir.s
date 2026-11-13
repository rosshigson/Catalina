' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _mkdir

 alignl ' align long
C__mkdir ' <symbol:_mkdir>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spmg_6af55206__mkpath_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__mkdir_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_spmg1_6af55206__mkleaf_L000002 ' <symbol:_mkleaf>
 calld PA,#NEWF
 sub SP, #80
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_opendir
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C_spmg1_6af55206__mkleaf_L000002_5  ' NEU4
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_f_closedir ' CALL addrg
 mov r0, #8 ' reg <- coni
 jmp #\@C_spmg1_6af55206__mkleaf_L000002_4 ' JUMPV addrg
C_spmg1_6af55206__mkleaf_L000002_5
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_f_mkdir ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_spmg1_6af55206__mkleaf_L000002_8  ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #\@C_spmg1_6af55206__mkleaf_L000002_9 ' JUMPV addrg
C_spmg1_6af55206__mkleaf_L000002_8
 mov r21, #0 ' reg <- coni
C_spmg1_6af55206__mkleaf_L000002_9
 mov r0, r21 ' CVI, CVU or LOAD
C_spmg1_6af55206__mkleaf_L000002_4
 calld PA,#POPM ' restore registers
 add SP, #80 ' framesize
 calld PA,#RETF


 alignl ' align long
C_spmg_6af55206__mkpath_L000001 ' <symbol:_mkpath>
 calld PA,#NEWF
 sub SP, ##1108
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C___fs ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C_spmg_6af55206__mkpath_L000001_11 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C___vol ' reg ARG ADDRG
 mov r4, ##@C___fs ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_mount
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_spmg_6af55206__mkpath_L000001_13 ' EQU4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_spmg_6af55206__mkpath_L000001_10 ' JUMPV addrg
C_spmg_6af55206__mkpath_L000001_13
C_spmg_6af55206__mkpath_L000001_11
 cmps r21,  #0 wz
 if_nz jmp #\C_spmg_6af55206__mkpath_L000001_15 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spmg1_6af55206__mkleaf_L000002 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 if_z jmp #\C_spmg_6af55206__mkpath_L000001_17 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_spmg_6af55206__mkpath_L000001_10 ' JUMPV addrg
C_spmg_6af55206__mkpath_L000001_17
 mov r0, #0 ' reg <- coni
 jmp #\@C_spmg_6af55206__mkpath_L000001_10 ' JUMPV addrg
C_spmg_6af55206__mkpath_L000001_15
 mov r22, #0 ' reg <- coni
 mov RI, ##-1032
 adds RI, FP
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r19, #0 ' reg <- coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_spmg_6af55206__mkpath_L000001_20 ' JUMPV addrg
C_spmg_6af55206__mkpath_L000001_22
 mov r22, ##-1032
 adds r22, FP
 ' reg <- addrl
 adds r22, r19 ' ADDI/P (2)
 mov r20, r19 ' ADDI/P
 adds r20, r23 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r19, #1 ' ADDI4 coni
C_spmg_6af55206__mkpath_L000001_23
 cmps r19, r17 wcz
 if_ae jmp #\C_spmg_6af55206__mkpath_L000001_25 ' GEI4
 mov r22, r19 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_nz jmp #\C_spmg_6af55206__mkpath_L000001_22 ' NEI4
C_spmg_6af55206__mkpath_L000001_25
 mov r22, ##-1032
 adds r22, FP
 ' reg <- addrl
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 adds r2, ##(-1032)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-1112)
' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_opendir
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C_spmg_6af55206__mkpath_L000001_26 ' EQU4
 mov r2, FP
 adds r2, ##(-1032)
' reg ARG ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_spmg1_6af55206__mkleaf_L000002 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 if_z jmp #\C_spmg_6af55206__mkpath_L000001_27 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_spmg_6af55206__mkpath_L000001_10 ' JUMPV addrg
C_spmg_6af55206__mkpath_L000001_26
 mov r2, FP
 adds r2, ##(-1112)
' reg ARG ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_f_closedir ' CALL addrg
 mov r22, ##-1032
 adds r22, FP
 ' reg <- addrl
 adds r22, r19 ' ADDI/P (2)
 mov r20, r19 ' ADDI/P
 adds r20, r23 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r19, #1 ' ADDI4 coni
C_spmg_6af55206__mkpath_L000001_27
C_spmg_6af55206__mkpath_L000001_20
 cmps r19, r17 wcz
 if_b jmp #\C_spmg_6af55206__mkpath_L000001_23 ' LTI4
 mov r0, #0 ' reg <- coni
C_spmg_6af55206__mkpath_L000001_10
 calld PA,#POPM ' restore registers
 add SP, ##1108 ' framesize
 calld PA,#RETF


' Catalina Export _mkdirr

 alignl ' align long
C__mkdirr ' <symbol:_mkdirr>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_spmg_6af55206__mkpath_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__mkdirr_30 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import strlen

' Catalina Import f_mkdir

' Catalina Import f_closedir

' Catalina Import f_opendir

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
