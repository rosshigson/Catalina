' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tty_rxtime

 alignl ' align long
C_tty_rxtime ' <symbol:tty_rxtime>
 PRIMITIVE(#PSHM)
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_tty_rxtime_3 ' JUMPV addrg
C_tty_rxtime_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_tty_rxcheck ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 cmps r21,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_tty_rxtime_7 ' GEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 1000
 mov r18, RI ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 sub r22, r19 ' SUBU (1)
 mov r20, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVU) ' DIVU
 cmp r0, r23 wcz 
 PRIMITIVE(#BRBE)
 long @C_tty_rxtime_5 ' LEU4
C_tty_rxtime_7
 PRIMITIVE(#JMPA)
 long @C_tty_rxtime_4 ' JUMPV addrg
C_tty_rxtime_5
C_tty_rxtime_3
 PRIMITIVE(#JMPA)
 long @C_tty_rxtime_2 ' JUMPV addrg
C_tty_rxtime_4
 mov r0, r21 ' CVI, CVU or LOAD
' C_tty_rxtime_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Import tty_rxcheck
' end
