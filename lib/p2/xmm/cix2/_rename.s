' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _rename

 alignl ' align long
C__rename ' <symbol:_rename>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long @C___fs
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__rename_2 ' NEI4
 mov r2, #1 ' reg ARG coni
 jmp #LODL
 long @C___vol
 mov r3, RI ' reg ARG ADDRG
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
 long @C__rename_4 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__rename_1 ' JUMPV addrg
C__rename_4
C__rename_2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_f_rename
 add SP, #4 ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C__rename_6 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__rename_1 ' JUMPV addrg
C__rename_6
 mov r0, #0 ' reg <- coni
C__rename_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import f_rename

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
