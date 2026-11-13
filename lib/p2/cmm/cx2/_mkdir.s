' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _mkdir

 alignl_label
C__mkdir ' <symbol:_mkdir>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sm1c_6af5511c__mkpath_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C__mkdir_3 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sm1c1_6af5511c__mkleaf_L000002 ' <symbol:_mkleaf>
 alignl_p1
 long I32_NEWF + 80<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_f_opendir)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sm1c1_6af5511c__mkleaf_L000002_5)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-84)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_f_closedir)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (8)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sm1c1_6af5511c__mkleaf_L000002_4)<<S32 ' JUMPV addrg
 alignl_label
C_sm1c1_6af5511c__mkleaf_L000002_5
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_f_mkdir)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sm1c1_6af5511c__mkleaf_L000002_8)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_sm1c1_6af5511c__mkleaf_L000002_9)<<S32 ' JUMPV addrg
 alignl_label
C_sm1c1_6af5511c__mkleaf_L000002_8
 word I16A_MOVI + (r21)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_sm1c1_6af5511c__mkleaf_L000002_9
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_sm1c1_6af5511c__mkleaf_L000002_4
 word I16B_POPM + 20<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_sm1c_6af5511c__mkpath_L000001 ' <symbol:_mkpath>
 alignl_p1
 long I32_NEWF + 1108<<S32
 alignl_p1
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_LODA + (@C___fs)<<S32
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sm1c_6af5511c__mkpath_L000001_11)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C___vol ' reg ARG ADDRG
 word I16B_LODL + (r4)<<D16B
 alignl_p1
 long @C___fs ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_f_mount)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sm1c_6af5511c__mkpath_L000001_13)<<S32 ' EQU4 reg coni
 word I16A_NEGI + (r0)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 alignl_p1
 long I32_JMPA + (@C_sm1c_6af5511c__mkpath_L000001_10)<<S32 ' JUMPV addrg
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_13
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_11
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sm1c_6af5511c__mkpath_L000001_15)<<S32 ' NEI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sm1c1_6af5511c__mkleaf_L000002)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sm1c_6af5511c__mkpath_L000001_17)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sm1c_6af5511c__mkpath_L000001_10)<<S32 ' JUMPV addrg
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_17
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_sm1c_6af5511c__mkpath_L000001_10)<<S32 ' JUMPV addrg
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_15
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODF + ((-1032)&$FFFFFF)<<S32
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl32 reg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sm1c_6af5511c__mkpath_L000001_20)<<S32 ' JUMPV addrg
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_22
 alignl_p1
 long I32_LODF + ((-1032)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_23
 word I16A_CMPS + (r19)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BRAE + (@C_sm1c_6af5511c__mkpath_L000001_25)<<S32 ' GEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 alignl_p1
 long I32_MOVI + RI<<D32 + (47)<<S32
 word I16A_CMPS + (r22)<<D16A + RI<<S16A
 alignl_p1
 long I32_BRNZ + (@C_sm1c_6af5511c__mkpath_L000001_22)<<S32 ' NEI4 reg coni
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_25
 alignl_p1
 long I32_LODF + ((-1032)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_p1
 long I32_LODF + ((-1032)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 alignl_p1
 long I32_LODF + ((-1112)&$FFFFFF)<<S32 
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_f_opendir)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPI + (r0)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sm1c_6af5511c__mkpath_L000001_26)<<S32 ' EQU4 reg coni
 alignl_p1
 long I32_LODF + ((-1032)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_sm1c1_6af5511c__mkleaf_L000002)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r15)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_sm1c_6af5511c__mkpath_L000001_27)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_sm1c_6af5511c__mkpath_L000001_10)<<S32 ' JUMPV addrg
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_26
 alignl_p1
 long I32_LODF + ((-1112)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_f_closedir)<<S32 ' CALL addrg
 alignl_p1
 long I32_LODF + ((-1032)&$FFFFFF)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl32
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r20)<<D16A + (r19)<<S16A ' ADDI/P
 word I16A_ADDS + (r20)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16A_RDBYTE + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU1 reg
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_27
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_20
 word I16A_CMPS + (r19)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BR_B + (@C_sm1c_6af5511c__mkpath_L000001_23)<<S32 ' LTI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_sm1c_6af5511c__mkpath_L000001_10
 word I16B_POPM + $180<<S16B ' restore registers, do not pop frame, do not return
 alignl_p1
 long I32_RETF + 1108<<S32
 alignl_p1

' Catalina Export _mkdirr

 alignl_label
C__mkdirr ' <symbol:_mkdirr>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r2)<<D16A + (1)<<S16A ' reg ARG coni
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_sm1c_6af5511c__mkpath_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C__mkdirr_30 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import strlen

' Catalina Import f_mkdir

' Catalina Import f_closedir

' Catalina Import f_opendir

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
