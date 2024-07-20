' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_tmpnam_name_buffer_L000005 ' <symbol:name_buffer>
 byte 116
 byte 109
 byte 112
 byte 46
 byte 0
 byte 0[16]

 alignl ' align long
C_tmpnam_count_L000007 ' <symbol:count>
 long $0

 alignl ' align long
C_tmpnam_name_L000009 ' <symbol:name>
 long $0

' Catalina Export tmpnam

' Catalina Code

DAT ' code segment

 alignl ' align long
C_tmpnam ' <symbol:tmpnam>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_tmpnam_name_L000009)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tmpnam_10)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_tmpnam_name_buffer_L000005 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C_tmpnam_name_buffer_L000005 ' reg <- addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' ADDI/P
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_LODA + (@C_tmpnam_name_L000009)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl ' align long
 long I32_CALA + (@C__getpid)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODI + (@C_tmpnam_name_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + (r4)<<D16A + (10)<<S16A ' reg ARG coni
 word I16A_MOV + (r5)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C__i_compute)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_tmpnam_name_L000009)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_tmpnam_name_L000009 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r20)<<D16A + (r22)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (1)<<S16A ' ADDP4 reg coni
 alignl ' align long
 long I32_LODA + (@C_tmpnam_name_L000009)<<S32
 word I16A_WRLONG + (r20)<<D16A + RI<<S16A ' ASGNP4 addrg reg
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(46)<<S32 ' reg <- conli
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
 long I32_LODI + (@C_tmpnam_name_L000009)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r22)<<S16A ' ASGNU1 reg reg
 alignl ' align long
C_tmpnam_10
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_tmpnam_count_L000007 ' reg <- addrg
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_ADDI + (r22)<<D16A + (1)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_LODA + (@C_tmpnam_count_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 999 ' reg <- con
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_tmpnam_12)<<S32 ' LEU4 reg reg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_tmpnam_count_L000007)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrg reg
 alignl ' align long
C_tmpnam_12
 word I16A_MOVI + (r2)<<D16A + (3)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODI + (@C_tmpnam_name_L000009)<<S32
 word I16A_MOV + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + (r4)<<D16A + (10)<<S16A ' reg ARG coni
 alignl ' align long
 long I32_LODI + (@C_tmpnam_count_L000007)<<S32
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C__i_compute)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRBYTE + (r20)<<D16A + (r0)<<S16A ' ASGNU1 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tmpnam_14)<<S32 ' EQU4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_tmpnam_name_buffer_L000005 ' reg ARG ADDRG
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_strcpy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_tmpnam_1)<<S32 ' JUMPV addrg
 alignl ' align long
C_tmpnam_14
 word I16B_LODL + (r0)<<D16B
 alignl ' align long
 long @C_tmpnam_name_buffer_L000005 ' reg <- addrg
 alignl ' align long
C_tmpnam_1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _getpid

' Catalina Import _i_compute

' Catalina Import strlen

' Catalina Import strcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_tmpnam_2_L000003 ' <symbol:2>
 byte 47
 byte 116
 byte 109
 byte 112
 byte 47
 byte 0

' Catalina Code

DAT ' code segment
' end
