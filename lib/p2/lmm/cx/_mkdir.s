' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_st38_696dddf4__mkleaf_L000002 ' <symbol:_mkleaf>
 jmp #NEWF
 jmp #LODL
 long 540
 sub SP, RI
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODF
 long -544
 mov r2, RI ' reg ARG ADDRL
 jmp #LODF
 long -516
 mov r3, RI ' reg ARG ADDRL
 mov r4, #4 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #LODL
 long @C___vi
 jmp #PSHL ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #3 wz
 jmp #BR_Z
 long @C_st38_696dddf4__mkleaf_L000002_4 ' EQU4
 mov r0, #6 ' RET coni
 jmp #JMPA
 long @C_st38_696dddf4__mkleaf_L000002_3 ' JUMPV addrg
C_st38_696dddf4__mkleaf_L000002_4
 jmp #LODF
 long -544
 mov r2, RI ' reg ARG ADDRL
 jmp #LODF
 long -516
 mov r3, RI ' reg ARG ADDRL
 mov r4, #6 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 jmp #LODL
 long @C___vi
 jmp #PSHL ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_st38_696dddf4__mkleaf_L000002_3
 jmp #POPM ' restore registers
 jmp #LODL
 long 540
 add SP, RI ' framesize
 jmp #RETF


 alignl ' align long
C_st381_696dddf4__mkpath_L000006 ' <symbol:_mkpath>
 jmp #NEWF
 jmp #LODL
 long 608
 sub SP, RI
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODI
 long @C___pstart
 mov r22, RI ' reg <- INDIRU4 addrg
 jmp #LODL
 long $ffffffff
 mov r20, RI ' reg <- con
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_st381_696dddf4__mkpath_L000006_8 ' NEU4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__mount
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_st381_696dddf4__mkpath_L000006_10 ' NEI4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_st381_696dddf4__mkpath_L000006_7 ' JUMPV addrg
C_st381_696dddf4__mkpath_L000006_10
C_st381_696dddf4__mkpath_L000006_8
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_st381_696dddf4__mkpath_L000006_12 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_st38_696dddf4__mkleaf_L000002 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 jmp #BR_Z
 long @C_st381_696dddf4__mkpath_L000006_14 ' EQU4
 cmp r15,  #6 wz
 jmp #BR_Z
 long @C_st381_696dddf4__mkpath_L000006_14 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_st381_696dddf4__mkpath_L000006_7 ' JUMPV addrg
C_st381_696dddf4__mkpath_L000006_14
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C_st381_696dddf4__mkpath_L000006_7 ' JUMPV addrg
C_st381_696dddf4__mkpath_L000006_12
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -72
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r19, #0 ' reg <- coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_st381_696dddf4__mkpath_L000006_17 ' JUMPV addrg
C_st381_696dddf4__mkpath_L000006_19
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, r19 ' ADDI/P
 adds r20, r23 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r19, #1 ' ADDI4 coni
C_st381_696dddf4__mkpath_L000006_20
 cmps r19, r17 wcz
 jmp #BRAE
 long @C_st381_696dddf4__mkpath_L000006_22 ' GEI4
 mov r22, r19 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BRNZ
 long @C_st381_696dddf4__mkpath_L000006_19 ' NEI4
C_st381_696dddf4__mkpath_L000006_22
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, FP
 sub r2, #-(-100) ' reg ARG ADDRLi
 jmp #LODF
 long -612
 mov r3, RI ' reg ARG ADDRL
 mov r4, #4 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-72) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #LODL
 long @C___vi
 jmp #PSHL ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #3 wz
 jmp #BRNZ
 long @C_st381_696dddf4__mkpath_L000006_23 ' NEU4
 mov r2, FP
 sub r2, #-(-72) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_st38_696dddf4__mkleaf_L000002 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 jmp #BR_Z
 long @C_st381_696dddf4__mkpath_L000006_24 ' EQU4
 cmp r15,  #6 wz
 jmp #BR_Z
 long @C_st381_696dddf4__mkpath_L000006_24 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_st381_696dddf4__mkpath_L000006_7 ' JUMPV addrg
C_st381_696dddf4__mkpath_L000006_23
 mov r22, FP
 sub r22, #-(-72) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, r19 ' ADDI/P
 adds r20, r23 ' ADDI/P (3)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 adds r19, #1 ' ADDI4 coni
C_st381_696dddf4__mkpath_L000006_24
C_st381_696dddf4__mkpath_L000006_17
 cmps r19, r17 wcz
 jmp #BR_B
 long @C_st381_696dddf4__mkpath_L000006_20 ' LTI4
 mov r0, #0 ' RET coni
C_st381_696dddf4__mkpath_L000006_7
 jmp #POPM ' restore registers
 jmp #LODL
 long 608
 add SP, RI ' framesize
 jmp #RETF


' Catalina Export _mkdir

 alignl ' align long
C__mkdir ' <symbol:_mkdir>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_st381_696dddf4__mkpath_L000006
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__mkdir_27 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export _mkdirr

 alignl ' align long
C__mkdirr ' <symbol:_mkdirr>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, #1 ' reg ARG coni
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_st381_696dddf4__mkpath_L000006
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__mkdirr_28 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import strlen

' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_OpenFile
' end
