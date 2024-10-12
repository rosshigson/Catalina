' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sgpk_6709f917_rxbase_L000002 ' <symbol:rxbase>
 long $0

 alignl ' align long
C_sgpk1_6709f917_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sgpk2_6709f917_initialize_L000004 ' <symbol:initialize>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $540000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sgpk2_6709f917_initialize_L000004_6)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (18)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sgpk2_6709f917_initialize_L000004_8)<<S32 ' LTI4 reg coni
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
 long I32_LODA + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_sgpk1_6709f917_lock_L000003 ' reg <- addrg
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_LODA + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sgpk2_6709f917_initialize_L000004_10)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_sgpk2_6709f917_initialize_L000004_11)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
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
 long I32_JMPA + (@C_sgpk2_6709f917_initialize_L000004_11)<<S32 ' JUMPV addrg
 alignl ' align long
C_sgpk2_6709f917_initialize_L000004_10
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_sgpk1_6709f917_lock_L000003 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_sgpk2_6709f917_initialize_L000004_11
 alignl ' align long
C_sgpk2_6709f917_initialize_L000004_8
 alignl ' align long
C_sgpk2_6709f917_initialize_L000004_6
' C_sgpk2_6709f917_initialize_L000004_5 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export tty_rxflush

 alignl ' align long
C_tty_rxflush ' <symbol:tty_rxflush>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tty_rxflush_18)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgpk2_6709f917_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_tty_rxflush_17
 alignl ' align long
C_tty_rxflush_18
 alignl ' align long
 long I32_CALA + (@C_tty_rxcheck)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_tty_rxflush_17)<<S32 ' GEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_tty_rxflush_14 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export tty_rxcheck

 alignl ' align long
C_tty_rxcheck ' <symbol:tty_rxcheck>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $550000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tty_rxcheck_21)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgpk2_6709f917_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_tty_rxcheck_21
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_rxcheck_23)<<S32 ' LTI4 reg coni
 alignl ' align long
C_tty_rxcheck_25
' C_tty_rxcheck_26 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_rxcheck_25)<<S32 ' EQI4 reg coni
 alignl ' align long
C_tty_rxcheck_23
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_rxcheck_28)<<S32 ' EQI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r18)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r16)<<D32S + ((36)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r16)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (2)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_RDLONG + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r22)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_tty_rxcheck_29)<<S32 ' JUMPV addrg
 alignl ' align long
C_tty_rxcheck_28
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
C_tty_rxcheck_29
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_rxcheck_30)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_tty_rxcheck_30
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_tty_rxcheck_20 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export tty_rx

 alignl ' align long
C_tty_rx ' <symbol:tty_rx>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tty_rx_36)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgpk2_6709f917_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_tty_rx_35
 alignl ' align long
C_tty_rx_36
 alignl ' align long
 long I32_CALA + (@C_tty_rxcheck)<<S32 ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_rx_35)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_tty_rx_32 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export tty_tx

 alignl ' align long
C_tty_tx ' <symbol:tty_tx>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d40000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tty_tx_39)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgpk2_6709f917_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_tty_tx_39
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_tx_47)<<S32 ' LTI4 reg coni
 alignl ' align long
C_tty_tx_43
' C_tty_tx_44 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_tx_43)<<S32 ' EQI4 reg coni
 alignl ' align long
C_tty_tx_46
 alignl ' align long
C_tty_tx_47
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_tx_46)<<S32 ' EQI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((292)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (2)
 word I16A_WRBYTE + (r23)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOVI + (r20)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_tx_49)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_CALA + (@C_tty_rx)<<S32 ' CALL addrg
 alignl ' align long
C_tty_tx_49
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_tx_51)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_tty_tx_51
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_tty_tx_38 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export tty_txflush

 alignl ' align long
C_tty_txflush ' <symbol:tty_txflush>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tty_txflush_54)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgpk2_6709f917_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_tty_txflush_54
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_txflush_62)<<S32 ' LTI4 reg coni
 alignl ' align long
C_tty_txflush_58
' C_tty_txflush_59 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_txflush_58)<<S32 ' EQI4 reg coni
 alignl ' align long
C_tty_txflush_61
 alignl ' align long
C_tty_txflush_62
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r20)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tty_txflush_61)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_txflush_64)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_tty_txflush_64
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_tty_txflush_53 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export tty_txcheck

 alignl ' align long
C_tty_txcheck ' <symbol:tty_txcheck>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $540000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tty_txcheck_67)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sgpk2_6709f917_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_tty_txcheck_67
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_txcheck_69)<<S32 ' LTI4 reg coni
 alignl ' align long
C_tty_txcheck_71
' C_tty_txcheck_72 ' (symbol refcount = 0)
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockset)<<S32 ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_txcheck_71)<<S32 ' EQI4 reg coni
 alignl ' align long
C_tty_txcheck_69
 alignl ' align long
 long I32_LODI + (@C_sgpk_6709f917_rxbase_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
 long I32_LODS + (r18)<<D32S + ((256)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r20)<<D16A + (r18)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBS + (r22)<<D16A + (r20)<<S16A
 word I16A_NEG + (r22)<<D16A + (r22)<<S16A ' SUBI/P (2)
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (1)
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_txcheck_74)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_sgpk1_6709f917_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__lockclr)<<S32 ' CALL addrg
 alignl ' align long
C_tty_txcheck_74
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((255)&$7FFFF)<<S32 ' reg <- cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r20)<<S16A ' SUBI/P (3)
' C_tty_txcheck_66 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _lockclr

' Catalina Import _lockset

' Catalina Import _locknew

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
