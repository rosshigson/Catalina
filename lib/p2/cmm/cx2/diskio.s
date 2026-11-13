' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export disk_status

 alignl_label
C_disk_status ' <symbol:disk_status>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r23)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_disk_status_5)<<S32 ' NEI4 reg coni
' C_disk_status_4 ' (symbol refcount = 0)
 alignl_p1
 long I32_CALA + (@C_S_D__disk_status)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_disk_status_6)<<S32 ' JUMPV addrg
 alignl_label
C_disk_status_5
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C_disk_status_6
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_disk_status_1 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export disk_initialize

 alignl_label
C_disk_initialize ' <symbol:disk_initialize>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r23)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_disk_initialize_11)<<S32 ' NEI4 reg coni
' C_disk_initialize_10 ' (symbol refcount = 0)
 alignl_p1
 long I32_CALA + (@C_S_D__disk_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_disk_initialize_12)<<S32 ' JUMPV addrg
 alignl_label
C_disk_initialize_11
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl_label
C_disk_initialize_12
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_disk_initialize_7 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export disk_read

 alignl_label
C_disk_read ' <symbol:disk_read>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r23)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_disk_read_17)<<S32 ' NEI4 reg coni
' C_disk_read_16 ' (symbol refcount = 0)
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_S_D__disk_read)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_disk_read_18)<<S32 ' JUMPV addrg
 alignl_label
C_disk_read_17
 word I16A_MOVI + (r15)<<D16A + (4)<<S16A ' reg <- coni
 alignl_label
C_disk_read_18
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_disk_read_13 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export disk_write

 alignl_label
C_disk_write ' <symbol:disk_write>
 alignl_p1
 long I32_NEWF + 12<<S32
 alignl_p1
 long I32_PSHM + $ea8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r23)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_disk_write_23)<<S32 ' NEI4 reg coni
' C_disk_write_22 ' (symbol refcount = 0)
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r1)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C_S_D__disk_write)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_disk_write_24)<<S32 ' JUMPV addrg
 alignl_label
C_disk_write_23
 word I16A_MOVI + (r15)<<D16A + (4)<<S16A ' reg <- coni
 alignl_label
C_disk_write_24
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
' C_disk_write_19 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export disk_ioctl

 alignl_label
C_disk_ioctl ' <symbol:disk_ioctl>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRBYTE + (r23)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDBYTE + (r22)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_disk_ioctl_29)<<S32 ' NEI4 reg coni
' C_disk_ioctl_28 ' (symbol refcount = 0)
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_S_D__disk_ioctl)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_disk_ioctl_25)<<S32 ' JUMPV addrg
 alignl_label
C_disk_ioctl_29
 word I16A_MOVI + (r17)<<D16A + (4)<<S16A ' reg <- coni
' C_disk_ioctl_30 ' (symbol refcount = 0)
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_disk_ioctl_25
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import SD_disk_ioctl

' Catalina Import SD_disk_write

' Catalina Import SD_disk_read

' Catalina Import SD_disk_initialize

' Catalina Import SD_disk_status
' end
