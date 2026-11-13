' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _unmount

 alignl ' align long
C__unmount ' <symbol:_unmount>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, #3 ' reg <- coni
C__unmount_2
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C___valid ' CALL addrg
 cmps r0,  #0 wz
 if_z jmp #\C__unmount_6 ' EQI4
 mov r0, ##-1 ' RET con
 jmp #\@C__unmount_1 ' JUMPV addrg
C__unmount_6
' C__unmount_3 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #64 wcz
 if_b jmp #\C__unmount_2 ' LTI4
 mov r2, #0 ' reg ARG coni
 mov r3, ##@C___vol ' reg ARG ADDRG
 mov r4, ##0 ' reg ARG con
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_mount
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_nz jmp #\C__unmount_8  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C__unmount_1 ' JUMPV addrg
C__unmount_8
 mov r0, ##-1 ' RET con
C__unmount_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fdtab

' Catalina Import __valid
' end
