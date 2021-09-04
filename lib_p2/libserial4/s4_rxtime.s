' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s4_rxtime

 alignl ' align long
C_s4_rxtime ' <symbol:s4_rxtime>
 PRIMITIVE(#PSHM)
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_s4_rxtime_3 ' JUMPV addrg
C_s4_rxtime_2
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_s4_rxcheck ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 PRIMITIVE(#BRAE)
 long @C_s4_rxtime_7 ' GEI4
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
 sub r22, r17 ' SUBU (1)
 mov r20, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVU) ' DIVU
 cmp r0, r21 wcz 
 PRIMITIVE(#BRBE)
 long @C_s4_rxtime_5 ' LEU4
C_s4_rxtime_7
 PRIMITIVE(#JMPA)
 long @C_s4_rxtime_4 ' JUMPV addrg
C_s4_rxtime_5
C_s4_rxtime_3
 PRIMITIVE(#JMPA)
 long @C_s4_rxtime_2 ' JUMPV addrg
C_s4_rxtime_4
 mov r0, r19 ' CVI, CVU or LOAD
' C_s4_rxtime_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Import s4_rxcheck
' end
