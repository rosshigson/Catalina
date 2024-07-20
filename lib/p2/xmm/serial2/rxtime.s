' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export s2_rxtime

 alignl ' align long
C_s2_rxtime ' <symbol:s2_rxtime>
 jmp #NEWF
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s2_rxtime_3 ' JUMPV addrg
C_s2_rxtime_2
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s2_rxcheck ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz,wc
 jmp #BRAE
 long @C_s2_rxtime_7 ' GEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 sub r22, r17 ' SUBU (1)
 jmp #LODL
 long 1000
 mov r18, RI ' reg <- con
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 jmp #DIVU ' DIVU
 cmp r0, r21 wz,wc 
 jmp #BRBE
 long @C_s2_rxtime_5 ' LEU4
C_s2_rxtime_7
 jmp #JMPA
 long @C_s2_rxtime_4 ' JUMPV addrg
C_s2_rxtime_5
C_s2_rxtime_3
 jmp #JMPA
 long @C_s2_rxtime_2 ' JUMPV addrg
C_s2_rxtime_4
 mov r0, r19 ' CVI, CVU or LOAD
' C_s2_rxtime_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _cnt

' Catalina Import _clockfreq

' Catalina Import s2_rxcheck
' end
