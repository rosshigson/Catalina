' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _mount

 alignl ' align long
C__mount ' <symbol:_mount>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, ##@C___vol ' reg <- addrg
 mov r20, r21
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, ##@C___vol ' ASGNU1 addrg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, ##@C___fs ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_f_mount
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 if_z jmp #\C__mount_2 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__mount_1 ' JUMPV addrg
C__mount_2
 mov r0, #0 ' reg <- coni
C__mount_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import __fs

' Catalina Import f_mount

' Catalina Import __vol
' end
