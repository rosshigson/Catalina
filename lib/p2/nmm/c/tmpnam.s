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
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C_tmpnam_name_L000009
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_nz jmp #\C_tmpnam_10  ' NEU4
 mov r2, ##@C_tmpnam_name_buffer_L000005 ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 mov r20, ##@C_tmpnam_name_buffer_L000005 ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 wrlong r22, ##@C_tmpnam_name_L000009 ' ASGNP4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__getpid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 mov r3, ##@C_tmpnam_name_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, #10 ' reg ARG coni
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__i_compute
 add SP, #12 ' CALL addrg
 wrlong r0, ##@C_tmpnam_name_L000009 ' ASGNP4 addrg reg
 mov r22, ##@C_tmpnam_name_L000009 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov r20, r22
 adds r20, #1 ' ADDP4 coni
 wrlong r20, ##@C_tmpnam_name_L000009 ' ASGNP4 addrg reg
 mov r20, #46 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##@C_tmpnam_name_L000009
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C_tmpnam_10
 mov r22, ##@C_tmpnam_count_L000007 ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r22, #1 ' ADDU4 coni
 wrlong r22, ##@C_tmpnam_count_L000007 ' ASGNU4 addrg reg
 mov r20, ##999 ' reg <- con
 cmp r22, r20 wcz 
 if_be jmp #\C_tmpnam_12 ' LEU4
 mov r22, #1 ' reg <- coni
 wrlong r22, ##@C_tmpnam_count_L000007 ' ASGNU4 addrg reg
C_tmpnam_12
 mov r2, #3 ' reg ARG coni
 mov r3, ##@C_tmpnam_name_L000009
 rdlong r3, r3
 ' reg ARG INDIR ADDRG
 mov r4, #10 ' reg ARG coni
 mov r5, ##@C_tmpnam_count_L000007
 rdlong r5, r5
 ' reg ARG INDIR ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__i_compute
 add SP, #12 ' CALL addrg
 mov r20, #0 ' reg <- coni
 wrbyte r20, r0 ' ASGNU1 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_tmpnam_14 ' EQU4
 mov r2, ##@C_tmpnam_name_buffer_L000005 ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #\@C_tmpnam_1 ' JUMPV addrg
C_tmpnam_14
 mov r0, ##@C_tmpnam_name_buffer_L000005 ' reg <- addrg
C_tmpnam_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


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
