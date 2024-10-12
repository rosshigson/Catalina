' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sh80_6709f916_rxbase_L000002 ' <symbol:rxbase>
 long $0

 alignl ' align long
C_sh801_6709f916_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sh802_6709f916_initialize_L000004 ' <symbol:initialize>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $540000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sh802_6709f916_initialize_L000004_6)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (17)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sh802_6709f916_initialize_L000004_8)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffffff ' reg <- con
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r18)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_AND + (r20)<<D16A + (r22)<<S16A ' BANDI/U (2)
 alignl ' align long
 long I32_LODA + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sh801_6709f916_lock_L000003 ' reg <- addrg
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_LODA + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sh802_6709f916_initialize_L000004_10)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sh802_6709f916_initialize_L000004_11)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (24)<<S16A ' SHLI4 reg coni
 word I16A_OR + (r22)<<D16A + (r20)<<S16A ' BORI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl ' align long
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffffff ' reg <- con
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_sh802_6709f916_initialize_L000004_11)<<S32 ' JUMPV addrg
 alignl ' align long
C_sh802_6709f916_initialize_L000004_10
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_sh801_6709f916_lock_L000003 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_sh802_6709f916_initialize_L000004_11
 alignl ' align long
C_sh802_6709f916_initialize_L000004_8
 alignl ' align long
C_sh802_6709f916_initialize_L000004_6
' C_sh802_6709f916_initialize_L000004_5 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s4_rxflush

 alignl ' align long
C_s4_rxflush ' <symbol:s4_rxflush>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_rxflush_15)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sh802_6709f916_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s4_rxflush_15
 word I16A_CMPI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4_rxflush_20)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s4_rxflush_14)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_rxflush_19
 alignl ' align long
C_s4_rxflush_20
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s4_rxcheck)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s4_rxflush_19)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s4_rxflush_14
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s4_rxcheck

 alignl ' align long
C_s4_rxcheck ' <symbol:s4_rxcheck>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $d55000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_rxcheck_23)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sh802_6709f916_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s4_rxcheck_23
 word I16A_CMPI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4_rxcheck_25)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s4_rxcheck_22)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_rxcheck_25
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_rxcheck_27)<<S32 ' LTI4 reg coni
 alignl ' align long
C_s4_rxcheck_29
' C_s4_rxcheck_30 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_rxcheck_29)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4_rxcheck_27
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r20)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r18)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_rxcheck_32)<<S32 ' EQI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r20)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((192)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r18)<<D16B ' zero extend
 word I16A_RDLONG + (r16)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r14)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r14)<<D16A + (4)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r14)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r12)<<D32S + ((324)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r12)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r14)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_XOR + (r22)<<D16A + (r18)<<S16A ' BXORI/U (2)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((63)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s4_rxcheck_33)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_rxcheck_32
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_s4_rxcheck_33
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_rxcheck_34)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_s4_rxcheck_34
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s4_rxcheck_22
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s4_rxcount

 alignl ' align long
C_s4_rxcount ' <symbol:s4_rxcount>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_rxcount_37)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sh802_6709f916_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s4_rxcount_37
 word I16A_CMPI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4_rxcount_39)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s4_rxcount_36)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_rxcount_39
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_rxcount_41)<<S32 ' LTI4 reg coni
 alignl ' align long
C_s4_rxcount_43
' C_s4_rxcount_44 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_rxcount_43)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4_rxcount_41
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r18)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDI4 reg coni
 word I16A_ADDSI + (r20)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r22)<<D16A + (r18)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_rxcount_46)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_s4_rxcount_46
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s4_rxcount_36
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s4_rx

 alignl ' align long
C_s4_rx ' <symbol:s4_rx>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_rx_49)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sh802_6709f916_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s4_rx_49
 word I16A_CMPI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4_rx_54)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s4_rx_48)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_rx_53
 alignl ' align long
C_s4_rx_54
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s4_rxcheck)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_rx_53)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s4_rx_48
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s4_tx

 alignl ' align long
C_s4_tx ' <symbol:s4_tx>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_tx_57)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sh802_6709f916_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s4_tx_57
 word I16A_CMPI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4_tx_59)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s4_tx_56)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_tx_59
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_tx_67)<<S32 ' LTI4 reg coni
 alignl ' align long
C_s4_tx_63
' C_s4_tx_64 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_tx_63)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4_tx_66
 alignl ' align long
C_s4_tx_67
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPS + (r18)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_tx_66)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((580)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r21)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 word I16A_MOVI + (r18)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((128)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_tx_69)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s4_rx)<<S32 ' CALL addrg
 alignl ' align long
C_s4_tx_69
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_tx_71)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_s4_tx_71
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s4_tx_56
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s4_txflush

 alignl ' align long
C_s4_txflush ' <symbol:s4_txflush>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_txflush_74)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sh802_6709f916_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s4_txflush_74
 word I16A_CMPI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4_txflush_76)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s4_txflush_73)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_txflush_76
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_txflush_84)<<S32 ' LTI4 reg coni
 alignl ' align long
C_s4_txflush_80
' C_s4_txflush_81 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_txflush_80)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4_txflush_83
 alignl ' align long
C_s4_txflush_84
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r18)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_txflush_83)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_txflush_86)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_s4_txflush_86
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s4_txflush_73
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s4_txcheck

 alignl ' align long
C_s4_txcheck ' <symbol:s4_txcheck>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $d50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_txcheck_89)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sh802_6709f916_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s4_txcheck_89
 word I16A_CMPI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4_txcheck_91)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s4_txcheck_88)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_txcheck_91
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_txcheck_93)<<S32 ' LTI4 reg coni
 alignl ' align long
C_s4_txcheck_95
' C_s4_txcheck_96 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_txcheck_95)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4_txcheck_93
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r22)<<D16A + (r18)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_txcheck_98)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_s4_txcheck_98
 word I16A_MOVI + (r22)<<D16A + (15)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r20)<<S16A ' SUBI/P (3)
 alignl ' align long
C_s4_txcheck_88
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s4_txcount

 alignl ' align long
C_s4_txcount ' <symbol:s4_txcount>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $d50000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s4_txcount_101)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sh802_6709f916_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s4_txcount_101
 word I16A_CMPI + (r23)<<D16A + (3)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s4_txcount_103)<<S32 ' LEU4 reg coni
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s4_txcount_100)<<S32 ' JUMPV addrg
 alignl ' align long
C_s4_txcount_103
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_txcount_105)<<S32 ' LTI4 reg coni
 alignl ' align long
C_s4_txcount_107
' C_s4_txcount_108 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s4_txcount_107)<<S32 ' EQI4 reg coni
 alignl ' align long
C_s4_txcount_105
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh80_6709f916_rxbase_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r18)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_ADDS + (r18)<<D16A + (r22)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r18)<<D16A + (r18)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r18)<<D16A + (16)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r22)<<D16A + (r18)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 word I16A_MOVI + (r20)<<D16A + (15)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s4_txcount_110)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sh801_6709f916_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_s4_txcount_110
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s4_txcount_100
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import _locknew

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
