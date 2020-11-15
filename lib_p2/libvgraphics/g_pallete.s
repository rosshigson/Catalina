' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_pallete

 alignl ' align long
C_g_pallete ' <symbol:g_pallete>
 PRIMITIVE(#PSHM)
 long $faa000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_x_tiles ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_y_tiles ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r22, r15
 shl r22, #1 ' LSHI4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r20, #4 ' reg <- coni
 mov r22, r0
 adds r22, #3 ' ADDI4 coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_display_base ' CALL addrg
 shl r22, #2 ' LSHI4 coni
 adds r22, r22 ' ADDI/P (1)
 adds r22, #4 ' ADDI4 coni
 adds r22, #84 ' ADDI4 coni
 mov r17, r22 ' ADDI/P
 adds r17, r0 ' ADDI/P (3)
 mov r19, #0 ' reg <- coni
C_g_pallete_2
 mov r22, r23
 and r22, #3 ' BANDI4 coni
 adds r22, r19 ' ADDI/P (2)
 adds r22, r17 ' ADDI/P (1)
 mov r20, r21 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
' C_g_pallete_3 ' (symbol refcount = 0)
 adds r19, #4 ' ADDI4 coni
 cmps r19,  #64 wcz
 PRIMITIVE(#BR_B)
 long @C_g_pallete_2 ' LTI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r0, r22 ' CVI, CVU or LOAD
' C_g_pallete_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import cgi_display_base

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles
' end
