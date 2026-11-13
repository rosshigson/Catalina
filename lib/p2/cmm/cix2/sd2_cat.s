' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export crc7_syndrome_table

 alignl_label
C_crc7_syndrome_table ' <symbol:crc7_syndrome_table>
 byte 0
 byte 9
 byte 18
 byte 27
 byte 36
 byte 45
 byte 54
 byte 63
 byte 72
 byte 65
 byte 90
 byte 83
 byte 108
 byte 101
 byte 126
 byte 119
 byte 25
 byte 16
 byte 11
 byte 2
 byte 61
 byte 52
 byte 47
 byte 38
 byte 81
 byte 88
 byte 67
 byte 74
 byte 117
 byte 124
 byte 103
 byte 110
 byte 50
 byte 59
 byte 32
 byte 41
 byte 22
 byte 31
 byte 4
 byte 13
 byte 122
 byte 115
 byte 104
 byte 97
 byte 94
 byte 87
 byte 76
 byte 69
 byte 43
 byte 34
 byte 57
 byte 48
 byte 15
 byte 6
 byte 29
 byte 20
 byte 99
 byte 106
 byte 113
 byte 120
 byte 71
 byte 78
 byte 85
 byte 92
 byte 100
 byte 109
 byte 118
 byte 127
 byte 64
 byte 73
 byte 82
 byte 91
 byte 44
 byte 37
 byte 62
 byte 55
 byte 8
 byte 1
 byte 26
 byte 19
 byte 125
 byte 116
 byte 111
 byte 102
 byte 89
 byte 80
 byte 75
 byte 66
 byte 53
 byte 60
 byte 39
 byte 46
 byte 17
 byte 24
 byte 3
 byte 10
 byte 86
 byte 95
 byte 68
 byte 77
 byte 114
 byte 123
 byte 96
 byte 105
 byte 30
 byte 23
 byte 12
 byte 5
 byte 58
 byte 51
 byte 40
 byte 33
 byte 79
 byte 70
 byte 93
 byte 84
 byte 107
 byte 98
 byte 121
 byte 112
 byte 7
 byte 14
 byte 21
 byte 28
 byte 35
 byte 42
 byte 49
 byte 56
 byte 65
 byte 72
 byte 83
 byte 90
 byte 101
 byte 108
 byte 119
 byte 126
 byte 9
 byte 0
 byte 27
 byte 18
 byte 45
 byte 36
 byte 63
 byte 54
 byte 88
 byte 81
 byte 74
 byte 67
 byte 124
 byte 117
 byte 110
 byte 103
 byte 16
 byte 25
 byte 2
 byte 11
 byte 52
 byte 61
 byte 38
 byte 47
 byte 115
 byte 122
 byte 97
 byte 104
 byte 87
 byte 94
 byte 69
 byte 76
 byte 59
 byte 50
 byte 41
 byte 32
 byte 31
 byte 22
 byte 13
 byte 4
 byte 106
 byte 99
 byte 120
 byte 113
 byte 78
 byte 71
 byte 92
 byte 85
 byte 34
 byte 43
 byte 48
 byte 57
 byte 6
 byte 15
 byte 20
 byte 29
 byte 37
 byte 44
 byte 55
 byte 62
 byte 1
 byte 8
 byte 19
 byte 26
 byte 109
 byte 100
 byte 127
 byte 118
 byte 73
 byte 64
 byte 91
 byte 82
 byte 60
 byte 53
 byte 46
 byte 39
 byte 24
 byte 17
 byte 10
 byte 3
 byte 116
 byte 125
 byte 102
 byte 111
 byte 80
 byte 89
 byte 66
 byte 75
 byte 23
 byte 30
 byte 5
 byte 12
 byte 51
 byte 58
 byte 33
 byte 40
 byte 95
 byte 86
 byte 77
 byte 68
 byte 123
 byte 114
 byte 105
 byte 96
 byte 14
 byte 7
 byte 28
 byte 21
 byte 42
 byte 35
 byte 56
 byte 49
 byte 70
 byte 79
 byte 84
 byte 93
 byte 98
 byte 107
 byte 112
 byte 121

' Catalina Export fio_crc7

' Catalina Code

DAT ' code segment

 alignl_label
C_fio_crc7 ' <symbol:fio_crc7>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_p1
 long I32_JMPA + (@C_fio_crc7_4)<<S32 ' JUMPV addrg
 alignl_label
C_fio_crc7_3
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r23)<<D16A + (1)<<S16A ' ADDP4 reg coni
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r3)<<D16B ' zero extend
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_spc8_6af550ef_crc7_byte_L000001)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_fio_crc7_4
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r21)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_fio_crc7_3)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_fio_crc7_2 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

 alignl_label
C_spc8_6af550ef_crc7_byte_L000001 ' <symbol:crc7_byte>
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVUI
 word I16B_TRN1 + (r22)<<D16B ' zero extend
 word I16A_SHLI + (r22)<<D16A + (1)<<S16A ' SHLI4 reg coni
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVUI
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_XOR + (r22)<<D16A + (r20)<<S16A ' BXORI/U (1)
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_crc7_syndrome_table ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDBYTE + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU1 reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_spc8_6af550ef_crc7_byte_L000001_6 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export SD_get_kilobytes

 alignl_label
C_S_D__get_kilobytes ' <symbol:SD_get_kilobytes>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $500000<<S32 ' save registers
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long $20 ' reg <- con
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl_p1
 long I32_CALA + (@C_S_D__disk_initialize)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRBYTE + (r22)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDBYTE + (r20)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16
 word I16B_TRN1 + (r20)<<D16B ' zero extend
 word I16A_AND + (r22)<<D16A + (r20)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_S_D__get_kilobytes_8)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_S_D__get_kilobytes_7)<<S32 ' JUMPV addrg
 alignl_label
C_S_D__get_kilobytes_8
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16A_MOVI + (r3)<<D16A + (1)<<S16A ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_S_D__disk_ioctl)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_S_D__get_kilobytes_10)<<S32 ' NEU4 reg coni
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A
 word I16A_SHRI + (r0)<<D16A + (1)<<S16A ' SHRU4 reg coni
 alignl_p1
 long I32_JMPA + (@C_S_D__get_kilobytes_7)<<S32 ' JUMPV addrg
 alignl_label
C_S_D__get_kilobytes_10
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_S_D__get_kilobytes_7
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export SD_disk_status

 alignl_label
C_S_D__disk_status ' <symbol:SD_disk_status>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOVI + (r2)<<D16A + (14)<<S16A ' reg ARG coni
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (42)<<S32 ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__short_service)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_S_D__disk_status_12 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export SD_disk_initialize

 alignl_label
C_S_D__disk_initialize ' <symbol:SD_disk_initialize>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (32)<<S32 ' reg ARG coni
 alignl_p1
 long I32_MOVI + (r4)<<D32 + (39)<<S32 ' reg ARG coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__long_service_2)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_S_D__disk_initialize_13 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export SD_disk_read

 alignl_label
C_S_D__disk_read ' <symbol:SD_disk_read>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_S_D__disk_read_15)<<S32 ' EQU4 reg coni
 word I16A_MOVI + R0<<D16A + (4)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_S_D__disk_read_14)<<S32 ' JUMPV addrg
 alignl_label
C_S_D__disk_read_15
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 16777216 ' reg <- con
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r4)<<D16A + (r20)<<S16A ' BORI/U (3)
 alignl_p1
 long I32_MOVI + (r5)<<D32 + (40)<<S32 ' reg ARG coni
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C__long_service_3)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_S_D__disk_read_14
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export SD_disk_write

 alignl_label
C_S_D__disk_write ' <symbol:SD_disk_write>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRU4 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_S_D__disk_write_18)<<S32 ' EQU4 reg coni
 word I16A_MOVI + R0<<D16A + (4)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_S_D__disk_write_17)<<S32 ' JUMPV addrg
 alignl_label
C_S_D__disk_write_18
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 16777216 ' reg <- con
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' BORI/U
 word I16A_OR + (r4)<<D16A + (r20)<<S16A ' BORI/U (3)
 alignl_p1
 long I32_MOVI + (r5)<<D32 + (41)<<S32 ' reg ARG coni
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C__long_service_3)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_S_D__disk_write_17
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export SD_disk_ioctl

 alignl_label
C_S_D__disk_ioctl ' <symbol:SD_disk_ioctl>
 alignl_p1
 long I32_NEWF + 8<<S32
 alignl_p1
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (42)<<S32 ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__short_service)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_MOVI + RI<<D32 + (128)<<S32
 word I16A_CMPS + (r19)<<D16A + RI<<S16A
 alignl_p1
 long I32_BR_B + (@C_S_D__disk_ioctl_21)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r4)<<D16A + RI<<S16A ' reg ARG ADDRLi
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__int64)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_MOV + (r1)<<D16A + RI<<S16A ' reg <- addrl16
 alignl_p1
 long I32_CPYB + 8<<S32 ' ASGNB
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C_S_D__disk_ioctl_21
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
' C_S_D__disk_ioctl_20 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export SD_disk_deinitialize

 alignl_label
C_S_D__disk_deinitialize ' <symbol:SD_disk_deinitialize>
 alignl_p1
 long I32_NEWF + 4<<S32
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 alignl_p1
 long I32_MOVI + (r3)<<D32 + (43)<<S32 ' reg ARG coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__short_service)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r0)<<D16B ' zero extend
' C_S_D__disk_deinitialize_23 ' (symbol refcount = 0)
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _int64

' Catalina Import _long_service_3

' Catalina Import _long_service_2

' Catalina Import _short_service
' end
