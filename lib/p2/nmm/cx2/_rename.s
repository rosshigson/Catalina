' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _rename

 alignl ' align long
C__rename ' <symbol:_rename>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C___fs ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__rename_2 ' NEI4
 mov r2, #1 ' reg ARG coni
 mov r3, ##@C___vol ' reg ARG ADDRG
 mov r4, ##@C___fs ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_mount
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__rename_4 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__rename_1 ' JUMPV addrg
C__rename_4
C__rename_2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_rename
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__rename_6 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__rename_1 ' JUMPV addrg
C__rename_6
 mov r0, #0 ' reg <- coni
C__rename_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import f_rename

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
