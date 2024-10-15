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
 sub SP, ##512
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C___pstart
 rdlong r22, r22 ' reg <- INDIRU4 addrg
 mov r20, ##$ffffffff ' reg <- con
 cmp r22, r20 wz
 if_nz jmp #\C__rename_3  ' NEU4
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
 if_nz jmp #\C__rename_5 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C__rename_2 ' JUMPV addrg
C__rename_5
C__rename_3
 mov r2, FP
 adds r2, ##(-516)
' reg ARG ADDRL
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, ##@C___vi ' reg ARG ADDRG
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_D_F_S__R_enameF_ile
 add SP, #12 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__rename_7 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__rename_2 ' JUMPV addrg
C__rename_7
 mov r0, #0 ' reg <- coni
C__rename_2
 calld PA,#POPM ' restore registers
 add SP, ##512 ' framesize
 calld PA,#RETF


' Catalina Import _mount

' Catalina Import __vi

' Catalina Import __pstart

' Catalina Import DFS_RenameFile
' end
