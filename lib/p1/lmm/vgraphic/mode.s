' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_mode

 alignl ' align long
C_g_mode ' <symbol:g_mode>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_tiles ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_tiles ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_display_base ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r23
 shl r20, #1 ' LSHI4 coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r20, r0
 adds r20, #3 ' ADDI4 coni
 mov r18, #4 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 shl r20, #2 ' LSHI4 coni
 adds r20, r20 ' ADDI/P (1)
 adds r22, r20 ' ADDI/P (2)
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_g_mode_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import cgi_display_base

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles
' end
