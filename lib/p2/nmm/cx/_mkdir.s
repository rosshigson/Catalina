' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sjbg_68fd78f4__mkleaf_L000002 ' <symbol:_mkleaf>
 calld PA,#NEWF
 sub SP, ##540
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 adds r2, ##(-544)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-516)
' reg ARG ADDRL
 mov r4, #4 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C___vi
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #3 wz
 if_z jmp #\C_sjbg_68fd78f4__mkleaf_L000002_4 ' EQU4
 mov r0, #6 ' reg <- coni
 jmp #\@C_sjbg_68fd78f4__mkleaf_L000002_3 ' JUMPV addrg
C_sjbg_68fd78f4__mkleaf_L000002_4
 mov r2, FP
 adds r2, ##(-544)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-516)
' reg ARG ADDRL
 mov r4, #6 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C___vi
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_sjbg_68fd78f4__mkleaf_L000002_3
 calld PA,#POPM ' restore registers
 add SP, ##540 ' framesize
 calld PA,#RETF


 alignl ' align long
C_sjbg1_68fd78f4__mkpath_L000006 ' <symbol:_mkpath>
 calld PA,#NEWF
 sub SP, ##608
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C___pstart
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C_sjbg1_68fd78f4__mkpath_L000006_8  ' NEU4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mount
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C_sjbg1_68fd78f4__mkpath_L000006_10 ' NEI4
 mov r0, ##$ffffffff ' RET con
 jmp #\@C_sjbg1_68fd78f4__mkpath_L000006_7 ' JUMPV addrg
C_sjbg1_68fd78f4__mkpath_L000006_10
C_sjbg1_68fd78f4__mkpath_L000006_8
 cmps r21,  #0 wz
 if_nz jmp #\C_sjbg1_68fd78f4__mkpath_L000006_12 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sjbg_68fd78f4__mkleaf_L000002 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 if_z jmp #\C_sjbg1_68fd78f4__mkpath_L000006_14 ' EQU4
 cmp r15,  #6 wz
 if_z jmp #\C_sjbg1_68fd78f4__mkpath_L000006_14 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_sjbg1_68fd78f4__mkpath_L000006_7 ' JUMPV addrg
C_sjbg1_68fd78f4__mkpath_L000006_14
 mov r0, #0 ' reg <- coni
 jmp #\@C_sjbg1_68fd78f4__mkpath_L000006_7 ' JUMPV addrg
C_sjbg1_68fd78f4__mkpath_L000006_12
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-72)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r19, #0 ' reg <- coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_sjbg1_68fd78f4__mkpath_L000006_17 ' JUMPV addrg
C_sjbg1_68fd78f4__mkpath_L000006_19
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, r19 ' ADDI/P
 adds r20, r23 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r19, #1 ' ADDI4 coni
C_sjbg1_68fd78f4__mkpath_L000006_20
 cmps r19, r17 wcz
 if_ae jmp #\C_sjbg1_68fd78f4__mkpath_L000006_22 ' GEI4
 mov r22, r19 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #47 wz
 if_nz jmp #\C_sjbg1_68fd78f4__mkpath_L000006_19 ' NEI4
C_sjbg1_68fd78f4__mkpath_L000006_22
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 mov r3, FP
 adds r3, ##(-612)
' reg ARG ADDRL
 mov r4, #4 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-72) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C___vi
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #3 wz
 if_nz jmp #\C_sjbg1_68fd78f4__mkpath_L000006_23  ' NEU4
 mov r2, FP
 sub r2, #-(-72) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_sjbg_68fd78f4__mkleaf_L000002 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 if_z jmp #\C_sjbg1_68fd78f4__mkpath_L000006_24 ' EQU4
 cmp r15,  #6 wz
 if_z jmp #\C_sjbg1_68fd78f4__mkpath_L000006_24 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #\@C_sjbg1_68fd78f4__mkpath_L000006_7 ' JUMPV addrg
C_sjbg1_68fd78f4__mkpath_L000006_23
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, r19 ' ADDI/P
 adds r20, r23 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r19, #1 ' ADDI4 coni
C_sjbg1_68fd78f4__mkpath_L000006_24
C_sjbg1_68fd78f4__mkpath_L000006_17
 cmps r19, r17 wcz
 if_b jmp #\C_sjbg1_68fd78f4__mkpath_L000006_20 ' LTI4
 mov r0, #0 ' reg <- coni
C_sjbg1_68fd78f4__mkpath_L000006_7
 calld PA,#POPM ' restore registers
 add SP, ##608 ' framesize
 calld PA,#RETF


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
 long @C_sjbg1_68fd78f4__mkpath_L000006
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__mkdir_27 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
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
 long @C_sjbg1_68fd78f4__mkpath_L000006
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__mkdirr_28 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import strlen

' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_OpenFile
' end
