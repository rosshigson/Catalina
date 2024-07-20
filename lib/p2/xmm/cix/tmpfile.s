' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_tmpfile_name_buffer_L000005 ' <symbol:name_buffer>
 byte 116
 byte 109
 byte 112
 byte 46
 byte 0
 byte 0[16]

 alignl ' align long
C_tmpfile_name_L000007 ' <symbol:name>
 long $0

' Catalina Export tmpfile

' Catalina Code

DAT ' code segment

 alignl ' align long
C_tmpfile ' <symbol:tmpfile>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 jmp #LODI
 long @C_tmpfile_name_L000007
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_tmpfile_8 ' NEU4
 jmp #LODL
 long @C_tmpfile_name_buffer_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 jmp #LODL
 long @C_tmpfile_name_buffer_L000005
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 jmp #LODL
 long @C_tmpfile_name_L000007
 mov BC, r22
 jmp #WLNG ' ASGNP4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__getpid ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #3 ' reg ARG coni
 jmp #LODI
 long @C_tmpfile_name_L000007
 mov r3, RI ' reg ARG INDIR ADDRG
 mov r4, #10 ' reg ARG coni
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__i_compute
 add SP, #12 ' CALL addrg
 jmp #LODL
 long @C_tmpfile_name_L000007
 mov BC, r0
 jmp #WLNG ' ASGNP4 addrg reg
 jmp #LODI
 long @C_tmpfile_name_L000007
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_tmpfile_8
 jmp #LODL
 long @C_tmpfile_10_L000011
 mov r2, RI ' reg ARG ADDRG
 jmp #LODL
 long @C_tmpfile_name_buffer_L000005
 mov r3, RI ' reg ARG ADDRG
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_fopen
 add SP, #4 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_tmpfile_12 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_tmpfile_1 ' JUMPV addrg
C_tmpfile_12
 jmp #LODL
 long @C_tmpfile_name_buffer_L000005
 mov r2, RI ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_remove ' CALL addrg
 mov r0, r23 ' CVI, CVU or LOAD
C_tmpfile_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _getpid

' Catalina Import _i_compute

' Catalina Import strlen

' Catalina Import fopen

' Catalina Import remove

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_tmpfile_10_L000011 ' <symbol:10>
 byte 119
 byte 98
 byte 43
 byte 0

 alignl ' align long
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
