' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export randomize

 alignl ' align long
C_randomize ' <symbol:randomize>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_srand ' CALL addrg
' C_randomize_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export random

 alignl ' align long
C_random ' <symbol:random>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_rand ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r0, r1
 adds r0, #1 ' ADDI4 coni
' C_random_3 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import rand

' Catalina Import srand

' Catalina Import _cnt
' end
