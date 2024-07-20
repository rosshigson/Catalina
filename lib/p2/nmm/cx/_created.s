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
 sub SP, ##540
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##@C___pstart
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C__create_directory_3  ' NEU4
 mov r22, #0 ' reg <- coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__mount
 add SP, #4 ' CALL addrg
 mov r20, ##-1 ' reg <- con
 cmps r0, r20 wz
 if_nz jmp #\C__create_directory_5 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__create_directory_2 ' JUMPV addrg
C__create_directory_5
C__create_directory_3
 mov r2, FP
 adds r2, ##(-544)
' reg ARG ADDRL
 mov r3, FP
 adds r3, ##(-516)
' reg ARG ADDRL
 mov r4, #6 ' reg ARG coni
 mov r5, r23 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, ##@C___vi
 wrlong RI, --PTRA ' stack ARG ADDRG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_D_F_S__O_penF_ile
 add SP, #16 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__create_directory_7 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__create_directory_2 ' JUMPV addrg
C__create_directory_7
 mov r0, #0 ' reg <- coni
C__create_directory_2
 calld PA,#POPM ' restore registers
 add SP, ##540 ' framesize
 calld PA,#RETF


' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_OpenFile
' end
