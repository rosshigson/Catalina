' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s8t0_6709f978_mailbox_L000002 ' <symbol:mailbox>
 long $0

 alignl ' align long
C_s8t01_6709f978_lock_L000003 ' <symbol:lock>
 long -1

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s8t02_6709f978_initialize_L000004 ' <symbol:initialize>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $540000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8t02_6709f978_initialize_L000004_6)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (23)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__locate_plugin)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8t02_6709f978_initialize_L000004_8)<<S32 ' LTI4 reg coni
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
 long I32_LODA + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_s8t01_6709f978_lock_L000003 ' reg <- addrg
 word I16A_SHRI + (r22)<<D16A + (24)<<S16A ' SHRU4 reg coni
 alignl ' align long
 long I32_LODA + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_RDLONG + (r22)<<D16A + (r20)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8t02_6709f978_initialize_L000004_10)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s8t02_6709f978_initialize_L000004_11)<<S32 ' LTI4 reg coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
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
 long I32_JMPA + (@C_s8t02_6709f978_initialize_L000004_11)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8t02_6709f978_initialize_L000004_10
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_s8t01_6709f978_lock_L000003 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_SUBSI + (r22)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
 long I32_LODA + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_s8t02_6709f978_initialize_L000004_11
 alignl ' align long
C_s8t02_6709f978_initialize_L000004_8
 alignl ' align long
C_s8t02_6709f978_initialize_L000004_6
' C_s8t02_6709f978_initialize_L000004_5 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s8t03_6709f978_s2_wait_rxready_L000014 ' <symbol:s2_wait_rxready>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_NEGI + (r23)<<D16A + (-(-2)&$1F)<<S16A ' reg <- conn
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s8t03_6709f978_s2_wait_rxready_L000014_16)<<S32 ' LEI4 reg coni
 alignl ' align long
C_s8t03_6709f978_s2_wait_rxready_L000014_18
 word I16A_SUBSI + (r2)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8t03_6709f978_s2_wait_rxready_L000014_21)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEGI + (r2)<<D16A + (-(-10)&$1F)<<S16A ' reg <- conn
 alignl ' align long
C_s8t03_6709f978_s2_wait_rxready_L000014_21
' C_s8t03_6709f978_s2_wait_rxready_L000014_19 ' (symbol refcount = 0)
 word I16A_CMPSI + (r2)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s8t03_6709f978_s2_wait_rxready_L000014_18)<<S32 ' GTI4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-10)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r2)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8t03_6709f978_s2_wait_rxready_L000014_17)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_JMPA + (@C_s8t03_6709f978_s2_wait_rxready_L000014_17)<<S32 ' JUMPV addrg
 alignl ' align long
C_s8t03_6709f978_s2_wait_rxready_L000014_16
 alignl ' align long
C_s8t03_6709f978_s2_wait_rxready_L000014_25
' C_s8t03_6709f978_s2_wait_rxready_L000014_26 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8t03_6709f978_s2_wait_rxready_L000014_25)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl ' align long
C_s8t03_6709f978_s2_wait_rxready_L000014_17
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_s8t03_6709f978_s2_wait_rxready_L000014_15 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_s8t04_6709f978_s2_read_async_L000028 ' <symbol:s2_read_async>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s8t03_6709f978_s2_wait_rxready_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_s8t04_6709f978_s2_read_async_L000028_29 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s8t05_6709f978_s2_read_L000030 ' <symbol:s2_read>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t04_6709f978_s2_read_async_L000028)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((-1)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_s8t03_6709f978_s2_wait_rxready_L000014)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s8t05_6709f978_s2_read_L000030_31 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s8t06_6709f978_s2_wait_txready_L000032 ' <symbol:s2_wait_txready>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 alignl ' align long
C_s8t06_6709f978_s2_wait_txready_L000032_34
' C_s8t06_6709f978_s2_wait_txready_L000032_35 ' (symbol refcount = 0)
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s8t06_6709f978_s2_wait_txready_L000032_34)<<S32 ' NEI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r0)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
' C_s8t06_6709f978_s2_wait_txready_L000032_33 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_s8t07_6709f978_s2_write_async_L000037 ' <symbol:s2_write_async>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8t06_6709f978_s2_wait_txready_L000032)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r20)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
' C_s8t07_6709f978_s2_write_async_L000037_38 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s8t08_6709f978_s2_write_L000039 ' <symbol:s2_write>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t07_6709f978_s2_write_async_L000037)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8t06_6709f978_s2_wait_txready_L000032)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s8t08_6709f978_s2_write_L000039_40 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s8t09_6709f978_s2_txsize_L000041 ' <symbol:s2_txsize>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-4)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t08_6709f978_s2_write_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s8t09_6709f978_s2_txsize_L000041_42 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_s8t0a_6709f978_s2_txfree_L000043 ' <symbol:s2_txfree>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t08_6709f978_s2_write_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_s8t0a_6709f978_s2_txfree_L000043_44 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s2_rxcheck

 alignl ' align long
C_s2_rxcheck ' <symbol:s2_rxcheck>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s2_rxcheck_46)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_s8t02_6709f978_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxcheck_46
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s2_rxcheck_50)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s2_rxcheck_48)<<S32 ' LEU4 reg coni
 alignl ' align long
C_s2_rxcheck_50
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s2_rxcheck_45)<<S32 ' JUMPV addrg
 alignl ' align long
C_s2_rxcheck_48
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_rxcheck_51)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxcheck_51
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t05_6709f978_s2_read_L000030)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_rxcheck_53)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxcheck_53
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s2_rxcheck_45
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s2_rxflush

 alignl ' align long
C_s2_rxflush ' <symbol:s2_rxflush>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s2_rxflush_56)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_s8t02_6709f978_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxflush_56
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s2_rxflush_60)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s2_rxflush_58)<<S32 ' LEU4 reg coni
 alignl ' align long
C_s2_rxflush_60
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s2_rxflush_55)<<S32 ' JUMPV addrg
 alignl ' align long
C_s2_rxflush_58
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_rxflush_64)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxflush_63
 alignl ' align long
C_s2_rxflush_64
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t05_6709f978_s2_read_L000030)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_s2_rxflush_63)<<S32 ' GEI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_rxflush_66)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxflush_66
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s2_rxflush_55
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s2_rxcount

 alignl ' align long
C_s2_rxcount ' <symbol:s2_rxcount>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s2_rxcount_69)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_s8t02_6709f978_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxcount_69
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s2_rxcount_73)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s2_rxcount_71)<<S32 ' LEU4 reg coni
 alignl ' align long
C_s2_rxcount_73
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s2_rxcount_68)<<S32 ' JUMPV addrg
 alignl ' align long
C_s2_rxcount_71
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_rxcount_74)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxcount_74
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-3)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t05_6709f978_s2_read_L000030)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_rxcount_76)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rxcount_76
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s2_rxcount_68
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s2_rx

 alignl ' align long
C_s2_rx ' <symbol:s2_rx>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s2_rx_79)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_s8t02_6709f978_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rx_79
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s2_rx_83)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s2_rx_81)<<S32 ' LEU4 reg coni
 alignl ' align long
C_s2_rx_83
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s2_rx_78)<<S32 ' JUMPV addrg
 alignl ' align long
C_s2_rx_81
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_rx_84)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rx_84
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t05_6709f978_s2_read_L000030)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_rx_86)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_rx_86
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s2_rx_78
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s2_tx

 alignl ' align long
C_s2_tx ' <symbol:s2_tx>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s2_tx_89)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_s8t02_6709f978_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s2_tx_89
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s2_tx_93)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s2_tx_91)<<S32 ' LEU4 reg coni
 alignl ' align long
C_s2_tx_93
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s2_tx_88)<<S32 ' JUMPV addrg
 alignl ' align long
C_s2_tx_91
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_tx_94)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_tx_94
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long $ffffffff ' reg ARG con
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t08_6709f978_s2_write_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_tx_96)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_tx_96
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s2_tx_88
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s2_txflush

 alignl ' align long
C_s2_txflush ' <symbol:s2_txflush>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s2_txflush_99)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_s8t02_6709f978_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s2_txflush_99
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s2_txflush_103)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s2_txflush_101)<<S32 ' LEU4 reg coni
 alignl ' align long
C_s2_txflush_103
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s2_txflush_98)<<S32 ' JUMPV addrg
 alignl ' align long
C_s2_txflush_101
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_txflush_104)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_txflush_104
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8t09_6709f978_s2_txsize_L000041)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_s2_txflush_106
' C_s2_txflush_107 ' (symbol refcount = 0)
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8t0a_6709f978_s2_txfree_L000043)<<S32 ' CALL addrg
 word I16A_CMPS + (r0)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_txflush_106)<<S32 ' LTI4 reg reg
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_txflush_109)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_txflush_109
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_s2_txflush_98
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s2_txcheck

 alignl ' align long
C_s2_txcheck ' <symbol:s2_txcheck>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s2_txcheck_112)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_s8t02_6709f978_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s2_txcheck_112
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s2_txcheck_116)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s2_txcheck_114)<<S32 ' LEU4 reg coni
 alignl ' align long
C_s2_txcheck_116
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s2_txcheck_111)<<S32 ' JUMPV addrg
 alignl ' align long
C_s2_txcheck_114
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_txcheck_117)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__acquire_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_txcheck_117
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((-2)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_s8t08_6709f978_s2_write_L000039)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_s2_txcheck_119)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_LODI + (@C_s8t01_6709f978_lock_L000003)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__release_lock)<<S32 ' CALL addrg
 alignl ' align long
C_s2_txcheck_119
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 alignl ' align long
C_s2_txcheck_111
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export s2_txcount

 alignl ' align long
C_s2_txcount ' <symbol:s2_txcount>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s2_txcount_122)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C_s8t02_6709f978_initialize_L000004)<<S32 ' CALL addrg
 alignl ' align long
C_s2_txcount_122
 alignl ' align long
 long I32_LODI + (@C_s8t0_6709f978_mailbox_L000002)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_s2_txcount_126)<<S32 ' EQU4 reg coni
 word I16A_CMPI + (r23)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_s2_txcount_124)<<S32 ' LEU4 reg coni
 alignl ' align long
C_s2_txcount_126
 alignl ' align long
 long I32_LODS + R0<<D32S + ((-1)&$7FFFF)<<S32 ' RET cons
 alignl ' align long
 long I32_JMPA + (@C_s2_txcount_121)<<S32 ' JUMPV addrg
 alignl ' align long
C_s2_txcount_124
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8t09_6709f978_s2_txsize_L000041)<<S32 ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s8t0a_6709f978_s2_txfree_L000043)<<S32 ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r0)<<D16A + (r20)<<S16A ' SUBI/P (3)
 alignl ' align long
C_s2_txcount_121
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _locknew

' Catalina Import _release_lock

' Catalina Import _acquire_lock

' Catalina Import _locate_plugin

' Catalina Import _registry
' end
