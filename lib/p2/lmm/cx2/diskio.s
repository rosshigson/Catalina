' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export disk_status

 alignl ' align long
C_disk_status ' <symbol:disk_status>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODF
 long -8
 wrbyte r23, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_disk_status_5 ' NEI4
' C_disk_status_4 ' (symbol refcount = 0)
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_S_D__disk_status ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_disk_status_6 ' JUMPV addrg
C_disk_status_5
 mov r21, #1 ' reg <- coni
C_disk_status_6
 mov r0, r21 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_disk_status_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export disk_initialize

 alignl ' align long
C_disk_initialize ' <symbol:disk_initialize>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODF
 long -8
 wrbyte r23, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_disk_initialize_11 ' NEI4
' C_disk_initialize_10 ' (symbol refcount = 0)
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_S_D__disk_initialize ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_disk_initialize_12 ' JUMPV addrg
C_disk_initialize_11
 mov r21, #1 ' reg <- coni
C_disk_initialize_12
 mov r0, r21 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_disk_initialize_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export disk_read

 alignl ' align long
C_disk_read ' <symbol:disk_read>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODF
 long -8
 wrbyte r23, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_disk_read_17 ' NEI4
' C_disk_read_16 ' (symbol refcount = 0)
 mov r2, r17 ' CVI, CVU or LOAD
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_S_D__disk_read
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_disk_read_18 ' JUMPV addrg
C_disk_read_17
 mov r15, #4 ' reg <- coni
C_disk_read_18
 mov r0, r15 ' CVI, CVU or LOAD
' C_disk_read_13 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export disk_write

 alignl ' align long
C_disk_write ' <symbol:disk_write>
 jmp #NEWF
 sub SP, #12
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODF
 long -8
 wrbyte r23, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_disk_write_23 ' NEI4
' C_disk_write_22 ' (symbol refcount = 0)
 mov r2, r17 ' CVI, CVU or LOAD
 mov r0, FP
 sub r0, #-(-16) ' reg <- addrli
 mov r1, r19 ' CVI, CVU or LOAD
 jmp #CPYB
 long 8 ' ASGNB
 mov r3, FP
 sub r3, #-(-16) ' reg ARG ADDRLi
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_S_D__disk_write
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_disk_write_24 ' JUMPV addrg
C_disk_write_23
 mov r15, #4 ' reg <- coni
C_disk_write_24
 mov r0, r15 ' CVI, CVU or LOAD
' C_disk_write_19 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #12 ' framesize
 jmp #RETF


' Catalina Export disk_ioctl

 alignl ' align long
C_disk_ioctl ' <symbol:disk_ioctl>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODF
 long -8
 wrbyte r23, RI ' ASGNU1 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_disk_ioctl_29 ' NEI4
' C_disk_ioctl_28 ' (symbol refcount = 0)
 mov r2, r19 ' CVI, CVU or LOAD
 mov r22, r21 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_S_D__disk_ioctl
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r0, r17 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_disk_ioctl_25 ' JUMPV addrg
C_disk_ioctl_29
 mov r17, #4 ' reg <- coni
' C_disk_ioctl_30 ' (symbol refcount = 0)
 mov r0, r17 ' CVI, CVU or LOAD
C_disk_ioctl_25
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import SD_disk_ioctl

' Catalina Import SD_disk_write

' Catalina Import SD_disk_read

' Catalina Import SD_disk_initialize

' Catalina Import SD_disk_status
' end
