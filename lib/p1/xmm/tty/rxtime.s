' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export tty_rxtime

 alignl ' align long
C_tty_rxtime ' <symbol:tty_rxtime>
 jmp #NEWF
 jmp #PSHM
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_tty_rxtime_3 ' JUMPV addrg
C_tty_rxtime_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_tty_rxcheck ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wz,wc
 jmp #BRAE
 long @C_tty_rxtime_7 ' GEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 sub r22, r19 ' SUBU (1)
 jmp #LODL
 long 1000
 mov r18, RI ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #DIVU ' DIVU
 cmp r0, r23 wz,wc 
 jmp #BRBE
 long @C_tty_rxtime_5 ' LEU4
C_tty_rxtime_7
 jmp #JMPA
 long @C_tty_rxtime_4 ' JUMPV addrg
C_tty_rxtime_5
C_tty_rxtime_3
 jmp #JMPA
 long @C_tty_rxtime_2 ' JUMPV addrg
C_tty_rxtime_4
 mov r0, r21 ' CVI, CVU or LOAD
' C_tty_rxtime_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _cnt

' Catalina Import _clockfreq

' Catalina Import tty_rxcheck
' end
