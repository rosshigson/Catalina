' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export abort

 alignl ' align long
C_abort ' <symbol:abort>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 PRIMITIVE(#LODI)
 long @C__clean
 mov r22, RI ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_abort_4 ' EQU4
 PRIMITIVE(#LODI)
 long @C__clean
 mov r22, RI ' reg <- INDIRP4 addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r22
 PRIMITIVE(#CALI) ' CALL indirect
C_abort_4
 mov r2, #6 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_raise ' CALL addrg
' C_abort_3 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _clean

' Catalina Import raise
' end
