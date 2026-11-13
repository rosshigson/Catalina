' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _create_directory

 alignl ' align long
C__create_directory ' <symbol:_create_directory>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C___fs ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__create_directory_2 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C___vol ' reg ARG ADDRG
 mov r4, ##@C___fs ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_mount
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__create_directory_4 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__create_directory_1 ' JUMPV addrg
C__create_directory_4
C__create_directory_2
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_f_mkdir ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__create_directory_6 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__create_directory_1 ' JUMPV addrg
C__create_directory_6
 mov r0, #0 ' reg <- coni
C__create_directory_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import f_mkdir

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
