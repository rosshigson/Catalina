' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

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
 long @C_so0c_6af54fa5__mkpath_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__mkdir_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_so0c1_6af54fa5__mkleaf_L000002 ' <symbol:_mkleaf>
 jmp #NEWF
 sub SP, #80
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, FP
 sub r3, #-(-84) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_f_opendir
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BRNZ
 long @C_so0c1_6af54fa5__mkleaf_L000002_5 ' NEU4
 mov r2, FP
 sub r2, #-(-84) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_f_closedir ' CALL addrg
 mov r0, #8 ' reg <- coni
 jmp #JMPA
 long @C_so0c1_6af54fa5__mkleaf_L000002_4 ' JUMPV addrg
C_so0c1_6af54fa5__mkleaf_L000002_5
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_f_mkdir ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_so0c1_6af54fa5__mkleaf_L000002_8 ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_so0c1_6af54fa5__mkleaf_L000002_9 ' JUMPV addrg
C_so0c1_6af54fa5__mkleaf_L000002_8
 mov r21, #0 ' reg <- coni
C_so0c1_6af54fa5__mkleaf_L000002_9
 mov r0, r21 ' CVI, CVU or LOAD
C_so0c1_6af54fa5__mkleaf_L000002_4
 jmp #POPM ' restore registers
 add SP, #80 ' framesize
 jmp #RETF


 alignl ' align long
C_so0c_6af54fa5__mkpath_L000001 ' <symbol:_mkpath>
 jmp #NEWF
 jmp #LODL
 long 1108
 sub SP, RI
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C___fs
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_so0c_6af54fa5__mkpath_L000001_11 ' NEI4
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C___vol
 mov r3, RI ' reg ARG ADDRG
 jmp #LODL
 long @C___fs
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_f_mount
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_so0c_6af54fa5__mkpath_L000001_13 ' EQU4
 jmp #LODL
 long $ffffffff
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_so0c_6af54fa5__mkpath_L000001_10 ' JUMPV addrg
C_so0c_6af54fa5__mkpath_L000001_13
C_so0c_6af54fa5__mkpath_L000001_11
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C_so0c_6af54fa5__mkpath_L000001_15 ' NEI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_so0c1_6af54fa5__mkleaf_L000002 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 jmp #BR_Z
 long @C_so0c_6af54fa5__mkpath_L000001_17 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_so0c_6af54fa5__mkpath_L000001_10 ' JUMPV addrg
C_so0c_6af54fa5__mkpath_L000001_17
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_so0c_6af54fa5__mkpath_L000001_10 ' JUMPV addrg
C_so0c_6af54fa5__mkpath_L000001_15
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -1032
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r19, #0 ' reg <- coni
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_so0c_6af54fa5__mkpath_L000001_20 ' JUMPV addrg
C_so0c_6af54fa5__mkpath_L000001_22
 jmp #LODF
 long -1032
 mov r22, RI ' reg <- addrl
 adds r22, r19 ' ADDI/P (2)
 mov r20, r19 ' ADDI/P
 adds r20, r23 ' ADDI/P (3)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 adds r19, #1 ' ADDI4 coni
C_so0c_6af54fa5__mkpath_L000001_23
 cmps r19, r17 wz,wc
 jmp #BRAE
 long @C_so0c_6af54fa5__mkpath_L000001_25 ' GEI4
 mov r22, r19 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #47 wz
 jmp #BRNZ
 long @C_so0c_6af54fa5__mkpath_L000001_22 ' NEI4
C_so0c_6af54fa5__mkpath_L000001_25
 jmp #LODF
 long -1032
 mov r22, RI ' reg <- addrl
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #LODF
 long -1032
 mov r2, RI ' reg ARG ADDRL
 jmp #LODF
 long -1112
 mov r3, RI ' reg ARG ADDRL
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_f_opendir
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C_so0c_6af54fa5__mkpath_L000001_26 ' EQU4
 jmp #LODF
 long -1032
 mov r2, RI ' reg ARG ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_so0c1_6af54fa5__mkleaf_L000002 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #0 wz
 jmp #BR_Z
 long @C_so0c_6af54fa5__mkpath_L000001_27 ' EQU4
 mov r0, r15 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_so0c_6af54fa5__mkpath_L000001_10 ' JUMPV addrg
C_so0c_6af54fa5__mkpath_L000001_26
 jmp #LODF
 long -1112
 mov r2, RI ' reg ARG ADDRL
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_f_closedir ' CALL addrg
 jmp #LODF
 long -1032
 mov r22, RI ' reg <- addrl
 adds r22, r19 ' ADDI/P (2)
 mov r20, r19 ' ADDI/P
 adds r20, r23 ' ADDI/P (3)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 adds r19, #1 ' ADDI4 coni
C_so0c_6af54fa5__mkpath_L000001_27
C_so0c_6af54fa5__mkpath_L000001_20
 cmps r19, r17 wz,wc
 jmp #BR_B
 long @C_so0c_6af54fa5__mkpath_L000001_23 ' LTI4
 mov r0, #0 ' reg <- coni
C_so0c_6af54fa5__mkpath_L000001_10
 jmp #POPM ' restore registers
 jmp #LODL
 long 1108
 add SP, RI ' framesize
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
 long @C_so0c_6af54fa5__mkpath_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C__mkdirr_30 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import strlen

' Catalina Import f_mkdir

' Catalina Import f_closedir

' Catalina Import f_opendir

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
