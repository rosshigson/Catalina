' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export cgi_display_base

 alignl ' align long
C_cgi_display_base ' <symbol:cgi_display_base>
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cgi_data ' CALL addrg
 PRIMITIVE(#LODL)
 long $ffffff
 mov r20, RI ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 add r22, #4 ' ADDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
' C_cgi_display_base_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _cgi_data
' end
