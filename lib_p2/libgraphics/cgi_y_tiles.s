' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export cgi_y_tiles

 alignl ' align long
C_cgi_y_tiles ' <symbol:cgi_y_tiles>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cgi_data ' CALL addrg
 mov r22, r0
 shr r22, #16 ' RSHU4 coni
 and r22, #255 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
' C_cgi_y_tiles_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _cgi_data
' end
