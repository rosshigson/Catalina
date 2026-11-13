' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _mount

 alignl ' align long
C__mount ' <symbol:_mount>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C___vol
 mov r22, RI ' reg <- addrg
 mov r20, r21
 adds r20, #48 ' ADDI4 coni
 jmp #LODL
 long @C___vol
 mov BC, r20
 jmp #WBYT ' ASGNU1 addrg reg
 mov r2, #1 ' reg ARG coni
 mov r3, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long @C___fs
 mov r4, RI ' reg ARG ADDRG
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_f_mount
 add SP, #8 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C__mount_2 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__mount_1 ' JUMPV addrg
C__mount_2
 mov r0, #0 ' reg <- coni
C__mount_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import __fs

' Catalina Import f_mount

' Catalina Import __vol
' end
