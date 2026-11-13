' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _unlink

 alignl ' align long
C__unlink ' <symbol:_unlink>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long @C___fs
 rdbyte r22, RI ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__unlink_2 ' NEI4
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
 long @C__unlink_4 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__unlink_1 ' JUMPV addrg
C__unlink_4
C__unlink_2
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_f_unlink ' CALL addrg
 cmp r0,  #0 wz
 jmp #BR_Z
 long @C__unlink_6 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__unlink_1 ' JUMPV addrg
C__unlink_6
 mov r0, #0 ' RET coni
C__unlink_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import f_unlink

' Catalina Import __vol

' Catalina Import f_mount

' Catalina Import __fs
' end
