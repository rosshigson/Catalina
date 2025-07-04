' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_tmpfile_name_buffer_L000005 ' <symbol:name_buffer>
 byte 116
 byte 109
 byte 112
 byte 46
 byte 0
 byte 0[16]

 alignl_label
C_tmpfile_name_L000007 ' <symbol:name>
 long $0

' Catalina Export tmpfile

' Catalina Code

DAT ' code segment

 alignl_label
C_tmpfile ' <symbol:tmpfile>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $d00000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_tmpfile_name_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_tmpfile_8)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_tmpfile_name_buffer_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long @C_tmpfile_name_buffer_L000005 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl_p1
 long I32_LODA + (@C_tmpfile_name_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_CALA + (@C__getpid)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 alignl_p1
 long I32_LODI + (@C_tmpfile_name_L000007)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + (r4)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl_p1
 long I32_CALA + (@C__i_compute)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl_p1
 long I32_LODA + (@C_tmpfile_name_L000007)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl_p1
 long I32_LODI + (@C_tmpfile_name_L000007)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl_label
C_tmpfile_8
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_tmpfile_10_L000011 ' reg ARG ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C_tmpfile_name_buffer_L000005 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C_fopen)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r23)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_tmpfile_12)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl_p1
 long 0 ' RET con
 alignl_p1
 long I32_JMPA + (@C_tmpfile_1)<<S32 ' JUMPV addrg
 alignl_label
C_tmpfile_12
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long @C_tmpfile_name_buffer_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_remove)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl_label
C_tmpfile_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _getpid

' Catalina Import _i_compute

' Catalina Import strlen

' Catalina Import fopen

' Catalina Import remove

' Catalina Cnst

DAT ' const data segment

 alignl_label
C_tmpfile_10_L000011 ' <symbol:10>
 byte 119
 byte 98
 byte 43
 byte 0

 alignl_label
C_tmpfile_2_L000003 ' <symbol:2>
 byte 47
 byte 116
 byte 109
 byte 112
 byte 47
 byte 0

' Catalina Code

DAT ' code segment
' end
