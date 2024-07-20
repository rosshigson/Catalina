' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_pallete

 alignl ' align long
C_g_pallete ' <symbol:g_pallete>
 jmp #NEWF
 jmp #PSHM
 long $fea000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_tiles ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_tiles ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_display_base ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, #4 ' reg <- coni
 mov r18, r15
 shl r18, #1 ' LSHI4 coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r18, r0
 adds r18, #3 ' ADDI4 coni
 mov r0, r18 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r20, r0
 shl r20, #2 ' LSHI4 coni
 adds r20, r20 ' ADDI/P (1)
 adds r20, #4 ' ADDI4 coni
 adds r20, #84 ' ADDI4 coni
 mov r17, r20 ' ADDI/P
 adds r17, r22 ' ADDI/P (3)
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
 cmps r19,  #64 wz,wc
 jmp #BR_B
 long @C_g_pallete_2 ' LTI4
 mov r22, r17 ' CVI, CVU or LOAD
 mov r0, r22 ' CVI, CVU or LOAD
' C_g_pallete_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import cgi_display_base

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles
' end
