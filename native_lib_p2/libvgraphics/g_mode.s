' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_mode

 alignl ' align long
C_g_mode ' <symbol:g_mode>
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_x_tiles ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_y_tiles ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 shl r22, #1 ' LSHI4 coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r21 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 adds r22, #3 ' ADDI4 coni
 mov r20, #4 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_display_base ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 shl r22, #2 ' LSHI4 coni
 adds r22, r22 ' ADDI/P (1)
 adds r22, r20 ' ADDI/P (1)
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_g_mode_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import cgi_display_base

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles
' end
