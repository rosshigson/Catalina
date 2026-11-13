' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export crc7_syndrome_table

 alignl ' align long
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

 alignl ' align long
C_fio_crc7 ' <symbol:fio_crc7>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #\@C_fio_crc7_4 ' JUMPV addrg
C_fio_crc7_3
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r2, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r3, r19 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_s31k_6af551d3_crc7_byte_L000001
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r19, r22 ' CVI, CVU or LOAD
C_fio_crc7_4
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 sub r21, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 if_nz jmp #\C_fio_crc7_3  ' NEU4
 mov r0, r19 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_fio_crc7_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


 alignl ' align long
C_s31k_6af551d3_crc7_byte_L000001 ' <symbol:crc7_byte>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, r3 ' CVUI
 and r22, cviu_m1 ' zero extend
 shl r22, #1 ' LSHI4 coni
 mov r20, r2 ' CVUI
 and r20, cviu_m1 ' zero extend
 xor r22, r20 ' BXORI/U (1)
 mov r20, ##@C_crc7_syndrome_table ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r0, r22 ' reg <- CVUI4 INDIRU1 reg
' C_s31k_6af551d3_crc7_byte_L000001_6 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export SD_get_kilobytes

 alignl ' align long
C_S_D__get_kilobytes ' <symbol:SD_get_kilobytes>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##$20 ' reg <- con
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_S_D__disk_initialize ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r22, #1 ' reg <- coni
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdbyte r20, r20 ' reg <- CVUI4 INDIRU1 reg
 and r20, #1 ' BANDI4 coni
 cmps r20, r22 wz
 if_nz jmp #\C_S_D__get_kilobytes_8 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_S_D__get_kilobytes_7 ' JUMPV addrg
C_S_D__get_kilobytes_8
 mov r2, FP
 sub r2, #-(-16) ' reg ARG ADDRLi
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_S_D__disk_ioctl
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_S_D__get_kilobytes_10  ' NEU4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22
 shr r0, #1 ' RSHU4 coni
 jmp #\@C_S_D__get_kilobytes_7 ' JUMPV addrg
C_S_D__get_kilobytes_10
 mov r0, #0 ' reg <- coni
C_S_D__get_kilobytes_7
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Export SD_disk_status

 alignl ' align long
C_S_D__disk_status ' <symbol:SD_disk_status>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, #14 ' reg ARG coni
 mov r3, #42 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_S_D__disk_status_12 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export SD_disk_initialize

 alignl ' align long
C_S_D__disk_initialize ' <symbol:SD_disk_initialize>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #32 ' reg ARG coni
 mov r4, #39 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__long_service_2
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_S_D__disk_initialize_13 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export SD_disk_read

 alignl ' align long
C_S_D__disk_read ' <symbol:SD_disk_read>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_S_D__disk_read_15 ' EQU4
 mov r0, #4 ' reg <- coni
 jmp #\@C_S_D__disk_read_14 ' JUMPV addrg
C_S_D__disk_read_15
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##16777216 ' reg <- con
 mov r4, r22 ' BORI/U
 or r4, r20 ' BORI/U (3)
 mov r5, #40 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__long_service_3
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C_S_D__disk_read_14
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export SD_disk_write

 alignl ' align long
C_S_D__disk_write ' <symbol:SD_disk_write>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 rdlong r22, r21 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 if_z jmp #\C_S_D__disk_write_18 ' EQU4
 mov r0, #4 ' reg <- coni
 jmp #\@C_S_D__disk_write_17 ' JUMPV addrg
C_S_D__disk_write_18
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r3, r22 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##16777216 ' reg <- con
 mov r4, r22 ' BORI/U
 or r4, r20 ' BORI/U (3)
 mov r5, #41 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__long_service_3
 add SP, #12 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C_S_D__disk_write_17
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export SD_disk_ioctl

 alignl ' align long
C_S_D__disk_ioctl ' <symbol:SD_disk_ioctl>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #42 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #128 wcz
 if_b jmp #\C_S_D__disk_ioctl_21 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov r4, FP
 sub r4, #-(-12) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__int64
 add SP, #8 ' CALL addrg
 mov r0, r21 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r19, #0 ' reg <- coni
C_S_D__disk_ioctl_21
 mov r0, r19 ' CVI, CVU or LOAD
' C_S_D__disk_ioctl_20 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Export SD_disk_deinitialize

 alignl ' align long
C_S_D__disk_deinitialize ' <symbol:SD_disk_deinitialize>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $400000 ' save registers
 mov r2, #0 ' reg ARG coni
 mov r3, #43 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_S_D__disk_deinitialize_23 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import _int64

' Catalina Import _long_service_3

' Catalina Import _long_service_2

' Catalina Import _short_service
' end
