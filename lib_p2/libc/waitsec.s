' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _waitsec

 alignl ' align long
C__waitsec ' <symbol:_waitsec>
 PRIMITIVE(#PSHM)
 long $e00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C__waitsec_3 ' JUMPV addrg
C__waitsec_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__waitcnt ' CALL addrg
 sub r23, #1 ' SUBU4 coni
C__waitsec_3
 cmp r23,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__waitsec_2 ' NEU4
' C__waitsec_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _clockfreq
' end
