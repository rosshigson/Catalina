' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fgetpos

 alignl ' align long
C_fgetpos ' <symbol:fgetpos>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_ftell ' CALL addrg
 mov RI, r21
 mov BC, r0
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_fgetpos_2 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_fgetpos_1 ' JUMPV addrg
C_fgetpos_2
 mov r0, #0 ' reg <- coni
C_fgetpos_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import ftell
' end
